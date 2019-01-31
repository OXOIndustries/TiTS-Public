/* flaggedy flags:
 * MET_KIMBER: duh
 * KIMBER_SEXED: also duh
 * KIMBER_TALKED_HERSELF: it's the duh hat trick
 * KIMBER_TALKED_WORK: [Her Work]
 * KIMBER_FLIRTED_WITH: Did [Flirt] with her this time. Reset to undefined on approach.
 * KIMBER_{CANDY/RUSKVEL/RATION/UTHRA/SKY}_GIVEN: the return of duh
 * KIMBER_REJECTED_PARASITE: This should be one if the pc had mimbranes the last time they tried to sex the cow
 * 9999 virginity checks
*/

public function showKimber(nood:* = false, auth:Boolean = true):void
{
	showBust((nood === true ? "KIMBER_NUDE" : (nood === 2 ? "KIMBER" : "KIMBER_UNDERWEAR")));
	showName((flags["MET_KIMBER"] == undefined ? "\nCOWGIRL" : "\nKIMBER"));
	if (auth) author("Slab Bulkhead");
}

public function kimberGoHomePostSex():void
{
	currentLocation = shipLocation;
	mainGameMenu();
}

public function kimberWearOutPC():void
{
	var energyLoss:int = 50;
	if (pc.hasPerk("Snu-Snu Queen") || pc.hasPerk("Energizing Libido") || pc.hasPerk("Amazonian Endurance")) energyLoss = 0;
	energyLoss *= (pc.libido()+pc.PQ())/400;
	pc.energy(-Math.ceil(energyLoss));
}

public function scienceCowAvailable():Boolean
{
	if (flags["LANDED_ON_TEXAS"] == undefined || flags["MET_FLAHNE"] == undefined) return false;
	if (pc.hasStatusEffect("Kimber Bating")) return false;
	//75% to show up on tavros
	if (currentLocation == "ANON'S BAR AND BOARD") return rand(4) != 0;
	if (flags["MET_KIMBER"] == undefined) return false;
	if (currentLocation == "302" && flags["TARKUS_DESTROYED"] != undefined) return false;
	//9999 detect non-story planets for 25%
	return rand(2) != 0;
}

public function drinkingScienceCowBonus(btnSlot:int):void
{
	if (flags["MET_KIMBER"] == undefined)
	{
		output("\n\nThere's a cowgirl at the bar, with a beer in one hand and a datapad in the other. She's wearing a long white labcoat over her clothes, and looks lost in thought.");
		addButton(btnSlot, "Cowgirl", meetingAScienceCow);
	}
	else
	{
		output("\n\nKimber, the labcoat-clad cowgirl, stands at the bar with a beer in one hand and her datapad in the other. She raises her head to drink, then sees you and gives you a smile.");
		addButton(btnSlot, "Kimber", kimberIsDrinkingAgain);
	}
}

public function meetingAScienceCow():void
{
	clearOutput();
	showKimber();
	processTime(2);
	
	output("You head over to the labcoat-clad cowgirl. She raises her head as you approach, and gives you a pensive look, like she's not sure what to think of you yet. After a moment, she tucks her datapad into a coat pocket and turns to face you.");
	output("\n\n\"<i>Hey, stranger,</i>\" she says. \"<i>Don't think I've seen you around Tavros before. You out here for the planet rush?</i>\"");
	output("\n\nYou tell her that is indeed why you're out here, and introduce yourself. She sips her beer while you talk, and her dark eyebrows rise when you tell her your name.");
	output("\n\n\"<i>[pc.name] Steele?</i>\" she asks. \"<i>As in, Steele Tech, that Steele?</i>\"");
	output("\n\nSo she's heard of you. You tell her that yes, you are that Steele.");
	output("\n\n\"<i>Well, that's a hell of a thing,</i>\" she says, then gives you a quick look up and down. \"<i>I knew I'd meet some interesting people out here, didn't think it'd be someone halfway famous.</i>\" She holds out her hand for you to shake. \"<i>Good to meet you. My name's Kimberly, but most everyone calls me Kimber.</i>\"");
	output("\n\nYou shake her hand, and ask what's brought her to Tavros. Is she part of the planet rush too, or is she looking for something else?");
	output("\n\n\"<i>Bit of both,</i>\" she says, nodding. \"<i>I'm out here for work, but I'm off right now. Just felt like a beer while I checked some letters from home.</i>\" She smiles at you, friendly and welcoming. \"<i>Always good to meet new folks, though.</i>\"");
	output("\n\nLetters from home? You guess that's New Texas, if her accent and her… ears and small horns are any indication. When you ask, she opens her eyes wide, giving you a look of exaggerated amazement, and puts her free hand to her chest.");
	output("\n\n\"<i>Why yes, I am from New Texas! How did you ever guess?</i>\" she asks, her accent much thicker than it was a moment ago. She laughs out loud, then continues without the overdone accent. \"<i>You and most everyone I meet guesses that, good thing y'all are right. Otherwise I might get real tired of saying I'm not.</i>\" Her smile disappears. \"<i>Lots of things I get tired of explaining, I can do without one more.</i>\"");
	output("\n\nBefore you can reply, she asks you, \"<i>You've been there?</i>\"");
	output("\n\nYou tell her you have, and that you heard about it from the tourism e-mail. She nods, and it looks like she's familiar with that.");
	output("\n\n\"<i>Eeyup, that brings all kinds of people down home. And a lot more of them find reason to stick around than you might think.</i>\" She gives you a thoughtful look, then smiles again. \"<i>But look at me doing all the talking. What's brought you over to see me, [pc.name]?</i>\"");
	
	flags["MET_KIMBER"] = 1;
	
	kimberMenu(true);
}

public function kimberIsDrinkingAgain():void
{
	clearOutput();
	showKimber();
	processTime(2);

	flags["KIMBER_FLIRTED_WITH"] = undefined;
	
	if (currentLocation == "BUCKING BRONCO")
	{
		output("\"<i>Hey there, [pc.name]!</i>\" Kimber calls out as you approach her, waving you over. \"<i>Well, this is a surprise! I didn't think I'd see you here.</i>\" She grins. \"<i>I'd ask if you're in New Texas for business or pleasure, but something tells me it ain't business.</i>\"");
		output("\n\nHer accent sounds a little thicker and she seems more relaxed, making you wonder if she's had a few beers already or if she's just happy to be home. You ask if she's here for work, or if she got some time off.");
		output("\n\n\"<i>Eeyup, had a few days off so I thought I'd head home for a little,</i>\" she says, then gestures to the bar. \"<i>And I missed this place. Been to a bunch of different bars, but there's nowhere else like the Fucking Bronco.</i>\" She leans in closer to you, and adds in a low voice, \"<i>Do me a favor and keep me from hopping on that saddle, would you? Folks tend to take pictures when someone goes for a ride, and I don't need that getting back to my boss.</i>\"");
		if (flags["KIMBER_SEXED"] == undefined)
		{
			output("\n\nKimber's face flushes red all at once, and she puts a hand to her mouth as she leans away, as though she just realized what she said. \"<i>Oh, I am so sorry, [pc.name],\" she says, her eyes wide. \"<i>That's, umm, I really hope that wasn't too much information. Maybe this should be my last beer.</i>\"");
			output("\n\nYou tell her it's all right. You've seen and heard more than that during your travels, and besides, this is New Texas. A day in this bar when someone doesn't ride the Bronco is probably considered pretty boring.");
			output("\n\n\"<i>Don't I know it,</i>\" Kimber says. She raises her beer again, then seems to think better of it and puts it down on the bar. \"<i>So, what's brought you over my way?</i>\"");
		}
		else
		{
			output("\n\nYou tell Kimber that the way you've seen her ride, you bet she could handle it. She laughs out loud, and nudges your [pc.hips] with her own.");
			output("\n\n\"<i>And that's a bet you'd win, [pc.name],</i>\" she says, no small amount of pride in her voice. \"<i>I could do three rounds on that bad boy, if I didn't need to walk myself out of here.</i>\" She laughs, then downs more of her beer. \"<i>So,</i>\" she says, leaning toward you and pressing her enormous chest against your arm, \"<i>you just here for good booze and a talk, or do I get to take you for another ride?</i>\"");
		}
	}
	else
	{
		output("\"<i>Hey there, [pc.name],</i>\" Kimber says as you walk over to her. She puts her datapad away, and leans against the bar as she turns to face you. \"<i>How goes the life of the planet rusher?</i>\"");
		output("\n\nYou fill her in on some of your recent travels, and she sips her beer as she listens. Once you're done, you ask how she's been.");
		output("\n\n\"<i>Mostly good. Work's a little annoying sometimes, but eh, any job's like that. At least it leaves me enough free time to get out and meet people.</i>\" She drinks some more beer, then smiles at you again. \"<i>What's brought you over my way?</i>\"");
	}
	
	kimberMenu();
}

public function kimberMenu(firstEncounter:Boolean = false):void
{
	clearMenu();
	addButton(0, "Appearance", kimberLookAtTheCow);
	addButton(1, "Talk", function ():void
	{
		clearOutput();
		showKimber();
		output("\"<i>I'm always up for a good chat, Steele,</i>\" Kimber says. \"<i>What's on your mind?</i>\"");
		kimberTalkMenu();
	});
	if (flags["KIMBER_FLIRTED_WITH"] == undefined) addButton(2, "Flirt", kimberFlirtWithTheCow);
	else
	{
		addDisabledButton(2, "Flirt");
		if (flags["KIMBER_REJECTED_PARASITE"] == undefined) kimberSexButton(3);
	}
	if (flags["KIMBER_TALKED_WORK"] != undefined) addButton(4, "Give Items", function ():void
	{
		clearMenu();
		clearOutput();
		showKimber();
		output("You tell Kimber that you've found something for her. She grins, then gives you an eager look as you search through your inventory.");
		var stories:Array = [	{label: "Uthra Sap", func: kimberGiveUthra, flag: "KIMBER_UTHRA_GIVEN", item: UthraSap}, 
								{label: "Rock Candy", func: kimberGiveNyrea, flag: "KIMBER_CANDY_GIVEN", item: NyreanCandy}, 
								{label: "Ruskvel", func: kimberGiveRaskvel, flag: "KIMBER_RUSKVEL_GIVEN", item: Ruskvel}, 
								{label: "Sky Sap", func: kimberGiveVanae, flag: "KIMBER_SKY_GIVEN", item: SkySap}, 
								{label: "Zil Ration", func: kimberGiveZil, flag: "KIMBER_RATION_GIVEN", item: ZilRation}];
		var btnSlot:int = 0;
		for each (var story:Object in stories)
			if (!pc.hasItemByClass(story.item)) continue;
			else if (flags[story.flag] != undefined) continue;
			else addButton(btnSlot++, story.label, story.func);
		addButton(14, "Never Mind", kimberMenu);
	});

	addButton(14, "Goodbye", function ():void
	{
		clearMenu();
		clearOutput();
		showKimber();
		if (firstEncounter) output("You tell Kimber that it was nice to meet her, and that maybe you'll see her around. She nods and says \"<i>Likewise, Steele,</i>\", then takes her datapad out and starts reading it again.");
		else output("You tell Kimber that you need to get back to what you're doing. She smiles and says, \"<i>All right, then. I'll see you again sometime, [pc.name],</i>\" and pulls out her datapad again.");
		addButton(0, "Next", mainGameMenu);
	});
}

public function kimberSexButton(btnSlot:int = 1):void
{
	if (!pc.hasGenitals()) addDisabledButton(btnSlot, "Sex", "Sex", "You need genitals for this!");
	else addButton(btnSlot, "Sex", (flags["KIMBER_SEXED"] == undefined ? kimberTouchTheCow : kimberDoHerNow));
}

public function kimberLookAtTheCow():void
{
	clearOutput();
	showKimber((flags["KIMBER_SEXED"] != undefined ? 2 : false));
	
	output("Kimber's a human, about five and a half feet tall with light skin, blue eyes, and long dark brown hair pulled back in a simple ponytail. She's also clearly from New Texas, if her short white horns and small cow ears with a few bright piercings are any sign. The Treatment has definitely done its work on her, as she sports a pair of boobs that jut out a foot or more a foot in front of her. She tends to look more thoughtful than people expect from a New Texan, but she's quick to smile.");
	output("\n\nShe's wearing a long white labcoat with the Xenogen Biotech logo on the sleeves, with only a single button barely holding it closed over her chest. Under that, she's wearing a dark purple sweater that's stretched tight over her chest and clinging to her curves beneath it. A pair of blue jeans and some big clunky black boots round out her ensemble. A tail tipped with a tuft of brown fur sways slowly behind her, mostly hidden by her coat.");
	if (flags["KIMBER_SEXED"] != undefined) output("\n\nSince you've seen Kimber naked, you know she has large, bright pink nipples, a round, bouncy rear end, and keeps herself in pretty good shape for a scientist. She also seems to like purple underwear, and her bras are both lacy and strong enough to support just about anything.");
	
	addDisabledButton(0, "Appearance");
}

public function kimberTalkMenu(lastTopic:int = -1):void
{
	clearMenu();
	var topics:Array = [{label:"Herself", func:kimberSpeaksAboutAScienceCow}]
	if (flags["KIMBER_TALKED_HERSELF"] != undefined) topics.push(	{label:"Her Work", func:kimberHasAJob},
																	{label:"Problems", func:kimberHasProblems});
	if (flags["KIMBER_TALKED_WORK"] != undefined) topics.push({label:"Mhen'ga", func:kimberInTheJungle});

	if (flags["KIMBER_STORIES_UNLOCKED"] != undefined) topics.push({label:"Her Stories", func: function ():void
	{
		clearMenu();
		clearOutput();
		showKimber();
		output("You tell Kimber that you'd like to hear one of her stories again.");
		kimberStoryMenu();
	}});

	for (var i:int = 0; i < topics.length; ++i)
		if (i == lastTopic) addDisabledButton(i, topics[i].label);
		else addButton(i, topics[i].label, topics[i].func);
	addButton(14, "Back", kimberMenu);
}

public function kimberSpeaksAboutAScienceCow():void
{
	clearOutput();
	showKimber();
	processTime(4 + rand(3));
	
	output("You ask Kimber to tell you about herself. She gives you a considering look, then nods and leans back against the bar.");
	output("\n\n\"<i>Well, I'm from New Texas, like I said,</i>\" she says. \"<i>I grew up there, got the Treatment when I was old enough, all of that.</i>\" She glances down at her chest, then looks at you and chuckles. \"<i>Not like that ain't obvious.</i>\"");
	output("\n\nIt's something anyone who knew about New Texas would guess, looking at her. Her home's probably best known for the Treatment and its effects.");
	output("\n\n\"<i>Don't I know it,</i>\" Kimber says, and frowns for a moment. \"<i>Funny thing is, the Treatment didn't affect me the same as it does most folks, not in my head. Some people who get it, all they can think about is sex, and all they want to do is fuck. It kicked up my libido, that's for sure, but I still could think about other stuff without trouble. I always wanted to be a scientist, and that didn't change after I got Treated.</i>\"");
	output("\n\nShe shrugs. \"<i>Anyway, I still head back home when I can, got lots of friends and family there. But I didn't feel like sticking around once I got older. There's a whole lot more to the galaxy than just the one planet, y'know?</i>\"");
	output("\n\nYou do know, especially with all the places you've seen and the things you've done. You ask her about what she did when she left.");
	output("\n\n\"<i>I got my degree before I left, studied chemistry. I figured there's lots of places where I'd be able to work with that. Feels like half of everyone's trying to make something that changes peoples' bodies or the like, so that seemed like a good field to go into.</i>\" She sips her beer. \"<i>Trouble is, there's not much call for chemists back home unless you want to work with the Treatment, and the government's got that all locked up tight. So I knew I'd have to go off-world.</i>\"");
	output("\n\nIt doesn't sound like she regrets it, but the way she talks about it, that can't have been a very easy decision. You ask about how it went once she left New Texas.");
	output("\n\n\"<i>I found work at a smaller lab at first, about the only place that would hire me fresh off the home world. It wasn't a bad place, and it paid pretty good, but it was on this planet that had maybe one big island and all the rest was water. All we did was muck around with algae.</i>\" She frowns, wrinkling her nose. \"<i>You ever been to a whole planet that smells like a tidepool? It's like that. And algae ain't exactly exciting work, you get me?</i>\"");
	output("\n\nYou agree that it doesn't sound too great. But she's wearing the Xenogen logo on her labcoat, so clearly things have gotten better since then.");
	output("\n\n\"<i>You're damn right they have,</i>\" Kimber says, smiling again. \"<i>I knew I'd been on that tiny wet rock too long when I started getting used to the smell, so I put out for work somewhere else. Ended up getting a job on Rosha – you know, the kaithrit home world?</i>\"");
	output("\n\nYou nod; you've heard of the place.");
	if (pc.originalRace == "half-kaithrit") output(" You remember your mother telling you about it when you were young.");
	output("\n\n\"<i>This place was run by the locals, working with some of the native animals, trying to distill their musk into something that smelled good to people.</i>\" She shakes her head. \"<i>Bunch of kaithrit boys messing with pheromones. Seems kind of silly to me now, but it was a job. And after a while, I got tired of them asking me if they smelled good after every new batch, like I was some sort of test subject.</i>\"");
	output("\n\nKimber sighs. \"<i>So I started looking for another place to work, again. Turned out Xenogen was hiring folks with experience, looking for people who'd done work with both plants and animals. So I applied for that quick as I could.</i>\"");
	output("\n\nShe drinks some more of her beer, then raises the glass in a toast. \"<i>A few interviews later, I got the job. Been working for them for about four years now, never been happier.</i>\" She grins. \"<i>And here I am now, out with the planet rushers, looking for new and interesting things to make new and interesting products.</i>\" She winks at you. \"<i>That's corporate's line about the whole thing, but I like it.</i>\"");
	
	flags["KIMBER_TALKED_HERSELF"] = 1;
	
	kimberTalkMenu(0);
}

public function kimberHasAJob():void
{
	clearOutput();
	showKimber();
	processTime(5 + rand(6));
	
	output("You ask her what it's like working for Xenogen, since she clearly loves her job.");
	output("\n\nKimber's eyes light up, and she smiles at you. \"<i>That's classified,</i>\" she says, then bursts out laughing, her chest shaking. \"<i>Okay, not really,</i>\" she says once she catches her breath, \"<i>but I never get tired of saying that.</i>\"");
	output("\n\nShe clears her throat and takes another sip of beer, leans back against the bar as she looks at you. \"<i>But seriously, there's things I can't tell you, and I'd get in real trouble if I spilled some of our secret stuff. Especially to you, </i>Steele<i>,</i>\" she says, emphasizing your well-known last name. \"<i>Now, I don't think you're here on some sneaky corporate espionage thing, but you never know.</i>\"");
	output("\n\nYou reassure here that you're not here to steal any of Xenogen's secrets. Steele Tech and Xenogen aren't even in the same field of business.");
	output("\n\nKimber thinks for a moment, then nods. \"<i>I guess you're right,</i>\" she says. \"<i>Most of my work's in the bio division. There's a technical line for my position and all, but everybody calls it Junior Chemist, makes it easier.</i>\" She frowns a little. \"<i>Not that I much like still being called 'junior', as long as I've been there, but I'm just getting started. Lots of folks there been around for a decade before really moving up.</i>\"");
	output("\n\nYou guess you can understand that, though it's not like you had to work your way up. You ask about what sort of work she does every day.");
	output("\n\n\"<i>I'm doing something a little different now, but my main job was physical and chemical analysis,</i>\" she says. \"<i>Taking compounds apart, figuring out the parts that make them do what they do, and seeing what those parts could do on their own. Like I said, it's all about making stuff that people can use to make changes to themselves these days, so that's the big aim for most everything we do.</i>\" She drinks some more beer, and chuckles. \"<i>And I got no trouble telling you that. Anyone who knows Xenogen knows that.</i>\"");
	output("\n\nYou ask her about specific things she's worked on. Maybe you've seen the results of her work in your travels.");
	output("\n\nKimber gives you a pensive look. \"<i>Weird thing is, it's hard to say,</i>\" she says. \"<i>Us junior chemists, we're not the ones making the products. We figure stuff out, and send the results up to R&D, where they keep all the big brains.</i>\" She smiles. \"<i>That's what we call the people who come up with all the stuff. I can figure out what compounds will do what to who all day, but they're the ones who figure out how to make it work in something people want to buy and use on themselves, and how to make it safe. We hear bits and pieces about what comes out of our work, but nothing real definite.</i>\" Her smile fades. \"<i>Much as I'd like to know otherwise.</i>\"");
	output("\n\nYou've learned enough about running such a large business that you can understand why it works like that. Besides, keeping some things separate between departments sometimes keeps secrets from leaking. So it might be better that Xenogen works that way.");
	output("\n\n\"<i>Maybe,</i>\" Kimber says, and drinks again. \"<i>Ain't like everything's kept perfectly secret anyway, though.</i>\" She leans in closer to you, and lowers her voice. \"<i>Funny rumor I heard is that whoever the dumb-ass is who's in charge of of some experimental instant horse-cock thing keeps losing them. Can you believe that?</i>\" She laughs.");

	output("\n\n");
	if (flags["SYNTHSHEATH_ACQUIRED"]) output("That sounds familiar. You decide not to tell Kimber where you found that particular product. No telling how it ended up on Tarkus, anyway. ");
	output("Before you can respond, Kimber's mirth disappears all at once, and she looks suddenly upset.");

	output("\n\n\"<i>Now I only heard about that project because they called me in to consult on proper shape and size and texture for the thing. Because of course I know how a horse-cock is supposed to be.</i>\" She pauses. \"<i>I mean, yeah, I do. But when I got called into a higher-up project manager's office, I didn't think I'd be there to talk penis parameters.</i>\"");
	output("\n\nKimber sets her beer down on the bar, and seems to be trying to make herself smile. \"<i>But it's mostly good. And I'm out here,</i>\" she says, \"<i>not at my lab, because I volunteered for a new project that goes along with the planet rush.</i>\"");
	output("\n\nThat's right, she mentioned that. Something about finding new chemicals?");
	output("\n\n\"<i>Eeyup. The planet rush means lots of new places to explore, which means lots of new people and other things to find, which means new chemicals and other stuff that we've never worked with before.</i>\" Her smile is fully back now. It's clear she enjoys talking about this. \"<i>And that's why I'm out on a little rush of my own, searching for new stuff to bring back to the lab.</i>\"");
	output("\n\nSounds interesting. You ask her how that's been going.");
	output("\n\nKimber winces. \"<i>Not so good, not so far. Most of the rush planets are more dangerous than I thought, and I've had trouble getting out and staying safe long enough to get samples of anything.</i>\" She gestures at you. \"<i>I mean, you look like you could handle yourself out there. I've spent most of my life either on a ranch or in a lab. I don't know much about handling something that's actually trying to kill me. And don't even get me started on Mhen'ga.</i>\" She shudders.");
	output("\n\nYou tell her that you've been to Mhen'ga. She gives you a concerned look.");
	output("\n\n\"<i>Good to see you made it back alive,</i>\" she says. \"<i>One trip to that place was way more than enough for me.</i>\" Kimber shivers, seeming genuinely worried for the first time. She then gives you a thoughtful look. \"<i>But if you can handle that place, maybe you can give me a hand with something.</i>\"");
	output("\n\nSuch as?");
	output("\n\n\"<i>You find any interesting bits of biological stuff, plant or animal or whatever, can you bring me back a sample?</i>\" She pats her labcoat where she stowed her datapad. \"<i>I've got some analysis tools on this thing, should be able to figure out basic properties of whatever you bring me, so I'll learn real quick if it's something I can take back to the lab.</i>\"");
	output("\n\nBefore you can reply, Kimber holds up a hand. \"<i>I'm not saying get in any trouble on my account. I don't want to see you come back here with one less arm because you had to get a fur sample from some critter that was mostly mouth or whatever. But if you can get something I can use, I'd really appreciate it.</i>\" She leans in closer to you and lowers her voice. \"<i>And if it turns out to be something we can make into a product, might be I can get you an advance version. As a thank you.</i>\" She leans back again, and smiles at you. \"<i>Sound good?</i>\"");
	output("\n\nYou nod, and tell her you'll do what you can.");
	output("\n\n\"<i>And if you don't find anything, don't worry about it,</i>\" she says with a shrug. \"<i>I just figured there's no harm in asking.</i>\"");
	
	flags["KIMBER_TALKED_WORK"] = 1;
	
	kimberTalkMenu(1);
}

public function kimberHasProblems():void
{
	clearOutput();
	showKimber();
	processTime(5 + rand(6));

	output("You ask Kimber about some of the problems she's had at the places she's worked. It sounded like there were things about the way people treated her that made her unhappy.");
	output("\n\nShe glances away for a moment. \"<i>I did say something about that, didn't I,</i>\" she says. Kimber lets out a breath, and looks at you. \"<i>I don't like to complain too much, and I know you're not here for me to whine about my issues. But it's something that gets to me, know what I mean?</i>\" She downs more of her beer, then sets it on the bar and frowns. \"<i>You said you've been to New Texas. Tell me, what do you think people are like there?</i>\"");
	output("You tell her the impression you got of her home. People were generally friendly and open, both in a hospitable way and in a sexual way. She points a finger at you when you get to that second point.");
	output("\n\n\"<i>That's the thing, [pc.name],</i>\" she says. \"<i>That's exactly the thing. Now, I ain't ashamed to be from New Texas. I know my history, I know the people who landed there needed to make sure they made plenty of babies so they didn't die off, and that's the only reason the planet's got people living on it. That's the only reason I'm here talking to you right now.</i>\" She raises her dark brows at you. \"<i>But that don't mean the only thing I think about is fucking, or that I'll hop on any dick that someone shakes in my direction.</i>\"");
	output("\n\nBefore you can say anything more, she leans back with a sigh and says, \"<i>And yes, that actually happened. Third day on my first job, I'm doing my work and trying to get it all done right, because I'm new and I want to make a good impression. And this jackass walks over to my desk and just pulls his pecker out.</i>\"");
	output("\n\nThat sounds a little extreme. You ask her what she did next.");
	output("\n\n\"<i>First thing I did was laugh,</i>\" Kimber says, and a hint of a smile reaches her lips. \"<i>I couldn't help it! Growing up in New Texas, that thing was the littlest dick I'd ever seen. He didn't take that too good, and me asking what the hell he was doing didn't help either.</i>\"");
	output("\n\nShe reaches for her beer, and drinks again. \"<i>He got all kinds of uppity, said he'd heard all about us 'cowgirl sluts' and wanted to know why I didn't start sucking on his dick soon as I saw it. I told him he was full of shit, that I was trying to work and I wouldn't fuck him if he had the biggest dong in the galaxy. Then I went to my boss and told her what happened.</i>\"");
	output("\n\nYou nod. You've heard plenty about sexual harassment suits and the like, mostly in the long lists of things not to do with your co-workers. Your dad might have ignored a lot of those, but you don't think even he would have just walked up to someone and whipped it out. Not right away, at least.");
	output("\n\n\"<i>She called the guy into her office and read him the riot act,</i>\" Kimber continues. She looks smug for a moment, but it fades quickly. \"<i>I don't know if he got fired or what, but I didn't see him again. Wasn't the end of it, though. I still got people thinking I was good to fuck just about anyone, only that they had to ask right.</i>\" She shakes her head. \"<i>It ain't like that. Not for me, anyway.</i>\"");
	output("\n\nShe holds up her free hand before you can respond. \"<i>Now don't get me wrong, [pc.name],</i>\" Kimber says. \"<i>I like fucking. ");
	if (flags["KIMBER_SEXED"]) output("As you well know.</i>\" She smirks at you. \"<i>");
	output("It's a damn good time, usually. And it ain't like I've ever had trouble finding someone to ride when I'm feeling up for it. But I get so damned tired of people thinking that's all I'm about and that I'll drop whatever I'm doing and jump on them. Or worse, thinking I'll just lie down and take whatever they want to give me.</i>\"");
	output("\n\nYou can see how that would be a problem. Your dad had the reputation of being an 'anything that moves' kind of guy, and while that was something he earned, you tell Kimber you can understand how people having that sort of expectation for her could be hard to deal with.");
	output("\n\n\"<i>It can be,</i>\" she says. \"<i>And it happens all the time! Every job I've had,whenever we got someone new, nine times out of ten they came to me looking for an easy fuck by the end of their first week. Just last month, I had a woman come to me and ask if I'd do a threesome with her and her husband for his birthday.</i>\" Kimber scowls as she drinks again. \"<i>I told her to fuck off. I'm not some gift she can give.</i>\"");
	output("\n\nYou're starting to see why Kimber was glad to be working out among the planet rushers, instead of in a place where people treat her like that. But doesn't she get the same thing wherever she goes?");
	output("\n\n\"<i>Yeah, but it's different out here,</i>\" she says. \"<i>I don't even mind someone trying to pick me up because they see I'm from New Texas, shows they know quality. But I can't always get away from people at work, and I've heard plenty of stupid rumors people passed around after I told them no. At least at a bar, I can tell someone no and they take off, or I can call the bouncer on them if they don't. That's easier than hearing someone say 'moo' just loud enough for me to hear when I walk past them, or dealing with the jackass who's got a new boob joke for me every time he passes by my lab station.</i>\"");
	output("\n\nAfter a moment, she shakes her head. \"<i>Don't get me wrong, [pc.name]. I love what I do, and Xenogen's a good place to work. The people I work with every day, they're good folks and I know they respect me. I know they don't think of me as some brainless fuck-toy. But it feels like every time someone who doesn't know me comes through, they get to thinking that since I'm from New Texas and therefore Treated, I've got nothing on my mind but sex. It's just one of those little things that feels bigger every time it happens.</i>\"");
	output("\n\nThat must be rough.");
	output("\n\n\"<i>It is,</i>\" Kimber says. \"<i>But I deal with it when I can, and I make sure folks' bosses know what they've been saying to me when it gets bad. Most times I don't have to make that call more than once.</i>\" She smiles at you. \"<i>Thanks for giving me the chance to vent, [pc.name]. Ain't everyone who cares enough to even ask.</i>\"");
	
	kimberTalkMenu(2);
}

public function kimberInTheJungle():void
{
	clearOutput();
	showKimber();
	processTime(5 + rand(6));
	
	output("You ask Kimber what sort of trouble she ran into on Mhen'ga. It sounds like she's pretty scared of the place.");
	output("\n\nShe freezes up for a moment, then takes a swig from her beer and takes a deep breath. \"<i>It's not a pretty story,</i>\" she says, \"<i>but I guess it helps to talk about it. Makes it a little less scary, y'know?</i>\"");
	output("\n\nKimber takes a moment before she begins. \"<i>Mhen'ga was going to be my first stop, and I had high hopes like you wouldn't believe. I kept thinking, this is it, I'm gonna find something amazing here in this jungle and it'll make my whole career. Kind of naive, I know, but you can't blame me for thinking big.</i>\"");
	output("\n\nYou nod. The planet rush seems to bring that out of people. Must be the thrill of discovery.");
	output("\n\n\"<i>Sounds about right, yeah,</i>\" Kimber says. \"<i>I got to talking to the locals, and heard about the mimbranes, some sort of parasite thing that looks like a big piece of cloth with eyes. People told me about the mimbranes using chemicals to turn people on and make them susceptible to getting latched onto. I figured I'd have no trouble with that.</i>\" She chuckles a little, shaking her head. \"<i>I grew up surrounded by people who put out sex hormones just by existing, how's some jungle creature going to match up to that?</i>\"");
	output("\n\nThat does make sense, though. If she's used to being around Treated people, how much could something else's sex hormones do to her?");
	output("\n\n\"<i>You'd be surprised,</i>\" she says, her smile disappearing. \"<i>The Treatment affects everyone a little different.");
	if (pc.isTreated()) output(" I mean, look at you and look at me. It ain't like we turned out exactly the same.");
	output(" But I'm getting off-track. I headed out into the jungle, figured I could find one of those things and get a sample, and that would be that. I knew there was bad stuff out there, but I thought I'd be okay.</i>\" She lowers her gaze.");
	output("\n\nYou nod, and wait for her to continue. If the look on her face means anything, this is where the story turns bad.");
	output("\n\n\"<i>I didn't even have a weapon,</i>\" she says quietly. \"<i>I didn't really know what was out there. And I didn't even need to try and find a mimbrane.</i>\" She raises her head and looks you in the eye. \"<i>Four of them found me.</i>\"");
	output("\n\nThat's definitely bad. She hesitates, so you ask what happened.");
	output("\n\nKimber sighs. \"<i>They swarmed around me, and spurted out some kind of… I don't know, it looked like pollen. My head started spinning, and I don't know if I'd ever been that horny in my life. I tried to get away, but two of them threw themselves on me. Last thing I remember was feeling them… I don't know, try to latch on to me or something.</i>\"");
	if (hasVisibleMimbranes())
	{
		output("\n\nShe seems really shaken at the memory, and drinks more of her beer. It's a few moments before she starts to talk again, and when she does, there's a hard look in her eyes.");
		output("\n\n\"<i>I don't know how much of this I need to tell you. I mean, look at you.</i>\" She gestures at your attached mimbranes. \"<i>You've got those things on you, so you know how they are. I don't know how you got them to not kill you, but....</i>\"");
		output("\n\nSome people think the mimbranes are a little odd, that's true, but they're no stranger than a lot of what's out there. And yours have been just fine, as long as you keep them fed.");
		output("\n\nKimber snorts. \"<i>Well, lucky you,</i>\" she says, and frowns. \"<i>After those things got to me, I woke up in the first aid station, with a V-Ko watching over me. She said some other explorers found me and brought me back, with four mimbranes attached to me. She removed them, of course, but I had an IV in for fluid loss. So they weren't so nice to me.</i>\" She shudders again. \"<i>Took me about a week to recover. I did some research on the things when I was laid up there, and I learned that the mimbranes will go for just about anyone, they usually don't try to gang up on someone like that. Maybe it's got something to do with the Treatment, I don't know.</i>\"");
		output("\n\nShe takes another deep breath, clearly trying to keep herself calm. \"<i>But I know I'm never going back. And I don't know what made you want to, I don't know, adopt those things and let them suck on you.</i>\"");
		output("\n\nYou nod, and tell her you'll be all right. Now seems like a good time to change the subject.");
	}
	else
	{
		output("\n\nShe seems really shaken at the memory, and drinks more of her beer. It's a few moments before she starts to talk again.");
		output("\n\n\"<i>I woke up in the first aid station, with a V-Ko watching over me. She said some other explorers found me and brought me back, with four mimbranes attached to me. She removed them, of course, but I had an IV in for fluid loss, since they were… well, they're sexual parasites, you can guess.</i>\" She shudders again. \"<i>Took me about a week to recover. I did some research on the things when I was laid up there, and I learned that the mimbranes will go for just about anyone, they usually don't try to gang up on someone like that. Maybe it's got something to do with the Treatment, I don't know.</i>\"");
		output("\n\nShe takes another deep breath, clearly trying to keep herself calm. \"<i>But I know I'm never going back. You be careful whenever you're there, you hear? " + (pc.isTreated() ? "I don't know if they'll go for anyone Treated, or if it was just my bad luck, but hopefully the same thing won't happen to you." : "Hopefully they won't go for you like they did for me, but you never know with things like that.") + "</i>");
		output("\n\nYou nod, and tell her you'll be careful. Now seems like a good time to change the subject.");
	}
	
	flags["KIMBER_TALKED_MHENGA"] = 1;
	
	kimberTalkMenu(3);
}

public function kimberGiveUthra():void
{
	clearMenu();
	clearOutput();
	showKimber();
	processTime(2 + rand(4));

	output("You hand Kimber the bottle of uthra sap that you harvested.");
	output("\n\nShe peers at the sticky stuff for a moment, then sets the bottle on the bar and pops the cap off. \"<i>What is this, and where did you get it?</i>\" she asks.");
	output("\n\nYou tell her it's sap from the uthra tree, and you found it on Mhen'ga. It's supposed to have some ritual use for the natives.");
	output("\n\n\"<i>Haven't heard of it, but that's no surprise,</i>\" she says, then pulls out her datapad and points a small optical scanner at the bottle's contents. \"<i>I don't know if it'll be much good, though. Lots of native or folk stuff ends up having no real use. Placebo effect and all that.</i>\"");
	output("\n\nKimber taps at her datapad, and after a few moments, the screen lights up. She raises her eyebrows. \"<i>Well, that's a surprise,</i>\" she says. \"<i>There's a chemical set in there you don't see every day, even in my line of work. Give me a second, I need to look this up.</i>\"");
	output("\n\nYou lean against the bar and watch Kimber as she works. Her brows furrow together as she taps away at her datapad; whatever she's looking for, she's intent on finding it. She scans the sap again, waits a moment, then pulls back from the screen with a grimace.");
	output("\n\n\"<i>And that's a bad surprise,</i>\" she says, then looks over at you. \"<i>Hope you didn't get any of this on you, [pc.name]. The chemicals in this stuff are commonly found in medical astringents, but it looks like they're made to target the parts of the body that make fluids. My best guess is this stuff could make boobs or balls smaller, and it might even be permanent.</i>\"");
	output("\n\nKimber caps the bottle and pockets it, then shakes her head. \"<i>Thanks for bringing this, but I don't know if I'll give it to the lab.</i>\" She looks thoughtful for a moment. \"<i>Maybe it's just me, but I don't really think we need to make something that shrinks two of my favorite parts of people, y'know?</i>\"");
	output("\n\nYou say that it's up to her. It's not like the sap was hard to get, anyway.");
	output("\n\n\"<i>Thanks for understanding,</i>\" she says, then smiles. \"<i>Sorry you had to get all back-to-nature for something that might not amount to much. But that reminds me of a story...</i>\"");

	flags["KIMBER_UTHRA_GIVEN"] = 1;
	flags["KIMBER_STORIES_UNLOCKED"] = 1;
	for (var i:int = pc.inventory.length-1; i >= 0; i--) if (pc.inventory[i] is UthraSap) break;
	itemConsume(pc.inventory[i]);

	addButton(0, "Next", kimberUthraStory);
}

public function kimberGiveNyrea():void
{
	clearMenu();
	clearOutput();
	showKimber();
	processTime(2 + rand(4));

	output("You hand Kimber the piece of rock candy from Myrellion. She gives it a long look, then raises her eyebrows as she looks at you.");
	output("\n\n\"<i>Rock candy?</i>\" she asks, looking more than a little dubious. \"<i>Or is there something here I'm missing?</i>\" She pulls out her datapad and points the scanner at the candy, still looking doubtful.");
	output("\n\nYou tell her about how you got it in the caves beneath Myrellion's surface, and about the nyrea themselves. She seems curious, but when her datapad's screen flashes with its results, her eyes open up wide.");
	output("\n\n\"<i>Oh, my,</i>\" Kimber says. \"<i>Now there's something you don't see every day. This thing's got traces of what looks like seminal fluid all through it.</i>\" She starts laughing all at once, and tucks the candy and her datapad into her coat.");
	output("\n\n\"<i>I couldn't help thinking,</i>\" she says, still giggling, \"<i>that if I was going to find candy with cum in it anywhere, it'd be back home, maybe in a popsicle. Not in something you got from a cave on some far-flung planet. Though now that I think about it,</i>\" she continues, \"<i>I'm damn surprised we don't have something like this back home. I know there's an ice cream shop that uses boob milk, but that's about it.</i>\"");
	output("\n\nYou ask if the candy might provide inspiration for Xenogen to go into the dessert business. She laughs again, but shakes her head.");
	output("\n\n\"<i>I doubt that, [pc.name],</i>\" she says, then pats her pocket. \"<i>Though I'm definitely bringing this in. Those nyrea sound like unusual folk, and a biological sample from one of them will probably get a lot of attention. Hopefully this can lead to something useful, or at least something interesting.</i>\" She pauses. \"<i>Now that I think about it, we've got someone working on Myrellion, but I don't know if he's got anything going with the nyrea at all.</i>\" Kimber gives you a smirk. \"<i>Better get this to the lab soon, so I can show I'm doing just as good as the guy who's right there on the planet.</i>\"");
	output("\n\nYou ask if that won't get her into trouble. Does Xenogen really want its people trying to one-up each other like that?");
	output("\n\n\"<i>I wouldn't really call it one-upping, more like a little friendly competition.</i>\" She smiles, and it looks like something's just occurred to her. \"<i>Though if you want to talk competition, I've got a story for you…</i>\"");

	flags["KIMBER_CANDY_GIVEN"] = 1;
	flags["KIMBER_STORIES_UNLOCKED"] = 1;
	for (var i:int = pc.inventory.length-1; i >= 0; i--) if (pc.inventory[i] is NyreanCandy) break;
	itemConsume(pc.inventory[i]);

	addButton(0, "Next", kimberNyreaStory);
}

public function kimberGiveRaskvel():void
{
	clearMenu();
	clearOutput();
	showKimber();
	processTime(2 + rand(4));

	output("You hand the greasy, foil-wrapped chunk of dough and who knows what else to Kimber. She winces a little as she takes it from you, and squints at it, her expression unsure.");
	output("\n\n\"<i>What </i>is<i> this?</i>\" she asks. \"<i>And do I even want to know where you got it, or from what?</i>\"");
	output("\n\nYou tell her that it's ruskvel, from the raskvel of Tavros. It's something they eat, but you thought it might be worth checking out.");
	output("\n\nKimber sets the ruskvel on the bar and pulls out her datapad, fiddles with it for a moment, then points a small optical scanner at the sample. The datapad's screen lights up after a few seconds, and Kimber's eyes open wide.");
	output("\n\n\"<i>Wow,</i>\" she breathes. \"<i>I did not expect that. This thing's got more weird bio stuff going on in it than some swamps.</i>\" She glances at you. \"<i>'Weird bio stuff' is a scientific term, I swear.</i>\"");
	output("\n\nYou ask her what her datapad is showing, since it's clearly getting something from the ruskvel.");
	output("\n\n\"<i>I've read about the raskvel, spent enough time on Tarkus to meet a few,</i>\" she says. \"<i>And they've got some interesting biology. Most reptilian species don't nurse their young, but raskvel have fully-functioning mammary glands, just like any mammal. And this,</i>\" she continues, pointing at the ruskvel, \"<i>far as I can tell, has something that comes directly from the raskvel as one of the ingredients. Might be breast milk, that's the only thing I can think of offhand. So there's definitely something to it besides just greasy bread.</i>\"");
	output("\n\nKimber wraps up the ruskvel and pockets it, then makes a quick note on her datapad and puts that away too. \"<i>I'm not sure what we'll be able to get out of it at the lab,</i>\" she says, \"<i>but you never know. If it is mammary-related, maybe we can isolate what makes it so raskvel have breasts despite being reptilian.</i>\"");
	output("\n\nYou ask what that could be used for. She did say that some of the work she's doing is in transformative items.");
	output("\n\n\"<i>Maybe grow nipples on just about anyone?</i>\" Kimber laughs. \"<i>Science work takes you to some weird places, though that sounds like a fun one.</i>\" She grins at you. \"<i>Though if you want to talk about weird places, I've got a story for you.</i>\"");

	flags["KIMBER_RUSKVEL_GIVEN"] = 1;
	flags["KIMBER_STORIES_UNLOCKED"] = 1;
	for (var i:int = pc.inventory.length-1; i >= 0; i--) if (pc.inventory[i] is Ruskvel) break;
	itemConsume(pc.inventory[i]);

	addButton(0, "Next", kimberRaskvelStory);
}

public function kimberGiveVanae():void
{
	clearMenu();
	clearOutput();
	showKimber();
	processTime(2 + rand(4));

	output("You hand Kimber the bamboo bottle of sky sap you got from one of the vanae.");
	output("\n\nHer eyebrows rise as she turns the bottle over in her hand. \"<i>I've heard of going native,</i>\" she says, \"<i>but this is ridiculous. You gonna bring me something written on leather next? Maybe a stone tool?</i>\" She grins at you. \"<i>I'm just teasing you, [pc.name]. What is this and where'd you find it?</i>\"");
	output("\n\nYou tell her about the deeper jungles of Mhen'ga, where you found the vanae. As you describe your encounters with them and the way they act toward outsiders, Kimber's mouth opens wider and wider, and her stare gets more and more disbelieving. When you finish, she shakes her head, and lets out a short laugh.");
	output("\n\n\"<i>An entire culture of amazon jungle women, with tattoos and tentacles, who squirt milk at people and try to get pregnant by outsiders. Damn.</i>\" She shakes her head. \"<i>I don't even know if it's a good thing Mhen'ga scared me away so quick or not.</i>\"");
	output("\n\nBefore you can ask what she means by that, Kimber takes out her datapad and points an optical scanner on it at the sky sap. After watching the screen for a moment, she frowns, then shrugs. \"<i>Doesn't seem like there's a whole lot going on here, although... I swear that compound looks familiar.</i>\" She taps at her pad again, her expression determined.");
	output("\n\nAfter a moment, she says, \"<i>A-ha! I knew I'd seen that before.</i>\" She looks up from her pad, the screen's light making her eyes shine as she grins at you. \"<i>I know I'm not spilling any secrets when I say we analyze our competitors' products, and what's going on with this sap has some stuff in common with Lactaid, that lactation aid from Tamani Corp. Guess that explains why the vanae like squirting milk at everyone, huh?</i>\"");
	output("\n\nThat would make sense, yes. You ask her if she thinks Xenogen would get any use out of it.");
	output("\n\n\"<i>Maybe, maybe not,</i>\" she says, tucking away the sample and her datapad. \"<i>Depends on what the higher-ups want us to try to make. If they feel like making a play for Tamani Corp's territory, they'll go full speed ahead. I'll bring it in either way.</i>\" She chuckles. \"<i>Though if you want to hear about work stuff, I've got a story for you there....</i>\"");

	flags["KIMBER_SKY_GIVEN"] = 1;
	flags["KIMBER_STORIES_UNLOCKED"] = 1;
	for (var i:int = pc.inventory.length-1; i >= 0; i--) if (pc.inventory[i] is SkySap) break;
	itemConsume(pc.inventory[i]);

	addButton(0, "Next", kimberVanaeStory);
}

public function kimberGiveZil():void
{
	clearMenu();
	clearOutput();
	showKimber();
	processTime(2 + rand(4));

	output("You hand Kimber the collection of dried fruit and plants that make up the zil rations. She gives them a curious look as you describe where you got them, and from who.");
	output("\n\n\"<i>I remember the zil,</i>\" she says, sounding distracted. \"<i>Or I remember people talking about them, at least. I didn't run into any when I was on Mhen'ga.</i>\" She gives you a look as she pulls out her datapad. \"<i>With everything I heard about them, that's probably best.</i>\"");
	output("\n\nKimber uses the scanner on her datapad to analyze the rations, looks over the screen and shrugs. \"<i>Don't look like there's anything too interesting in these, though I'll take them to the lab just in case,</i>\" she says. \"<i>You can never tell what someone can make out of a sample, though. And anything from a new world's worth looking at, even if it just seems like fruit.</i>\" She pockets the sample and looks at you. \"<i>But now I'm curious. Is everything I heard about the zil true? Do they really think they get to fuck someone if they defeat them in combat, stuff like that?</i>\"");
	output("\n\nYou tell her about your encounters with the zil, and that yes, the zil do have what some people might call interesting sexual dominance issues in their society.");
	output("\n\nShe shakes her head at that. \"<i>I don't get that. If you want to fight, then fight, if you want to fuck, then fuck. I don't know why you'd want to beat someone up just because you've got a boner for them.</i>\" She shrugs again. \"<i>Maybe it makes sense to them, and maybe they'd think I'm weird. Ain't like I'll go back to find out.</i>\"");
	output("\n\nYou point out that a zil might think of people from New Texas as being very strong, since they're so good at convincing people to have sex with them without fighting first.");
	output("\n\nKimber laughs at that. \"<i>Hah! You might be right about that, [pc.name]. And that reminds me of a story…</i>\"");

	flags["KIMBER_RATION_GIVEN"] = 1;
	flags["KIMBER_STORIES_UNLOCKED"] = 1;
	for (var i:int = pc.inventory.length-1; i >= 0; i--) if (pc.inventory[i] is ZilRation) break;
	itemConsume(pc.inventory[i]);

	addButton(0, "Next", kimberZilStory);
}

public function kimberStoryMenu(lastStory:Function = null):void
{
	var stories:Array = [	{label: "Hiking", func: kimberUthraStory, flag: "KIMBER_UTHRA_GIVEN"}, 
							{label: "Delivery", func: kimberNyreaStory, flag: "KIMBER_CANDY_GIVEN"}, 
							{label: "Kaithrit", func: kimberRaskvelStory, flag: "KIMBER_RUSKVEL_GIVEN"}, 
							{label: "Ausar", func: kimberVanaeStory, flag: "KIMBER_SKY_GIVEN"}, 
							{label: "Competition", func: kimberZilStory, flag: "KIMBER_RATION_GIVEN"}];
	var btnSlot:int = 0;
	for each (var story:Object in stories)
		if (flags[story.flag] == undefined) continue;
		else if (lastStory == story.func) addDisabledButton(btnSlot++, story.label);
		else addButton(btnSlot++, story.label, story.func);

	addButton(14, "Never Mind", kimberTalkMenu);
}

public function kimberUthraStory():void
{
	clearOutput();
	showKimber();
	processTime(5 + rand(11));
	pc.lust(5+rand(int(0.31*pc.libido())));
	
	output("\"<i>I don't know how much time you've spent back on New Texas,</i>\" Kimber begins, \"<i>but outside the towns, it's one of the most beautiful places I've ever been. Rolling fields, deep forests in some of the farther-away parts, all that sort of thing.</i>\" She gets a wistful look on her face, and smiles at you. \"<i>That's not what most people think about when home comes up, but it's always had more to it than people know.</i>\"");
	output("\n\nIt does seem like an interesting place, even if there are a few key reasons most people have heard of it. But it didn't seem like what you saw was aimed at getting people out into nature.");
	output("\n\n\"<i>That's true,</i>\" Kimber says, nodding. \"<i>But growing up there, I saw it all. Anyway, back when I was in school, a good friend of mine and I used to go out hiking a few times a week. She swore she was the only one who could get me away from studying.</i>\" She raises her eyebrows at you. \"<i>That's not true at all, but she thought it was funny. But she'd push me to keep up a good pace, and she was always in better shape than me, so half the time I finished up our hikes tired and sweaty when she was just fine.</i>\"");
	output("\n\nBefore you can say anything, Kimber smirks. \"<i>That's how we started showering off together. That, and when a nice dark New Texan girl with boobs </i>almost<i> as big as mine says she wants to shower with you, you say yes.</i>\"");
	output("\n\nThat fits with pretty much everything you've heard about New Texas. Do they still go… hiking when she's back home?");
	output("\n\n\"<i>When we can,</i>\" Kimber says. \"<i>She's working too now, got a job on the net, but we get together sometimes when I'm back home. Usually we just go out drinking, though.</i>\" She drinks some of her beer, and continues. \"<i>But when I told her I was going off-world for work, she got kind of sad, and said she never thought I'd go. We made plans for one last good hike, the day before I headed out, and she said she had something for me afterward.</i>\"");
	output("\n\nSounds like a good idea. Where did they end up going?");
	output("\n\n\"<i>All through one of the forests, about a ten-mile trip,</i>\" Kimber says, and slumps back against the bar. \"<i>I swear, I still get tired just thinking about it. We got back to her place, her barely tired and me completely wiped out, and she practically had to drag me to the shower. Which, I might add, was not how it usually went.</i>\" She shakes her head. \"<i>Been a long time since I was that tired. And once we were done and I was starting to feel alive again, she brings out a little gift for me.</i>\"");
	output("\n\nA parting gift seems like a nice thing to do. What did she give her?");

	if (flags["KIMBER_SEXED"] == undefined) output("\n\nKimber clears her throat. \"<i>Long story short, she gave me my hardlight, and we wore ourselves out using it on each other. In front of a mirror, so we both could watch.</i>\" She pauses. \"<i>I hope that's not too much information, but think about where I'm from, [pc.name]. It ain't much of a story on New Texas if nobody gets laid.</i>\"\n\nYou suppose that's true.");
	else
	{
		output("\n\n\"<i>She gave me my favorite toy, the hardlight I've still got back in my ship. It's only a ten-incher, which goes by 'small' back home, but damn, we had a good time breaking that thing in.</i>\"");
		output("\n\nFrom what you've seen of Kimber in bed, you believe it. What sort of stuff did they do?");
		output("\n\n\"<i>Well, fitness buff that my friend is, of course she's got a bunch of mirrors in her room. She says they're good for checking her build, but we all know that's only half of why.</i>\" She chuckles. \"<i>Now, you know how I normally like to be on top, but she talked me into going at it from behind.</i>\"");
		output("\n\nKimber takes another swig of beer and looks you dead in the eye. \"<i>I swear, [pc.name], there is nothing like fucking someone in a way that lets you both watch. The two of us faced a mirror, and watching her face when I put the hardlight in her, watching her boobs swing as I hammered away, then swapping places and watching her bounce and thrust as she went at me?</i>\" She bites her lower lip, and glances down at her chest. \"<i>Are my nipples showing through my coat? Because damn, I feel like they should be.</i>\"");
		output("\n\nYou check. Not yet, but she can keep talking if that's what she's going for.");
		output("\n\n\"<i>We switched off, back and forth, for maybe two hours,</i>\" Kimber says, and runs her tongue over her upper lip. \"<i>When we finally wore each other out, we were sweaty enough to need another shower. Naturally, we had to sleep after that, but we were good for another few rounds the next morning. Almost went for long enough for me to miss my shuttle off-world.</i>\" She laughs, clearly enjoying the memory, then grins at you. \"<i>I ain't saying that's the main reason I installed a full-length mirror in my ship, but it totally is.</i>\"");
	}

	kimberStoryMenu(kimberUthraStory);
}

public function kimberNyreaStory():void
{
	clearOutput();
	showKimber();
	processTime(10 + rand(16));
	pc.lust(5+rand(int(0.31*pc.libido())));
	
	output("\"<i>Now, you might have noticed I can get a little competitive,</i>\" Kimber says. She grins as you agree. \"<i>I'm not real sure where I get it. Might have come from growing up back home, lots of us girls betting we'd grow the biggest boobs or hips or whatever we wanted when we got Treated.</i>\" She glances down at her expansive chest. \"<i>Believe it or not, I grew these and still only came in second among the girls my age.</i>\"");
	output("\n\nFrom what you've seen of New Texas, you do in fact believe that.");
	output("\n\n\"<i>When ain't nobody can see their feet, from bulges up top or down beneath, that's when I know I'm home.</i>\" Kimber grins, then downs some of her beer. \"<i>But trying to make sure people know I can do something better than they can, that never went away. I keep a handle on it when I'm working, but with stuff I do for fun?</i>\" She chuckles. \"<i>I need to make sure I don't go too far or get myself in trouble. And I don't always make it.</i>\"");
	output("\n\nAnd what sort of trouble did that get her in, you ask.");
	output("\n\n\"<i>Almost got me fired from the job on Rosha,</i>\" she says, then winces. \"<i>Can't say I'm real proud of this one, though it felt like the only thing I could do at the time.</i>\" She leans back against the bar. \"<i>The place I worked had offices in a few different cities, and we had to run a courier route once a week or so. We divvied up who had to do it, as it wasn't real interesting, just a bunch of picking stuff up and dropping it off. But there was this one guy at the last stop who made it a little more fun.</i>\"");
	output("\n\nIt's pretty easy to guess where this is going, though you're not yet sure how this goes with her being competitive. You nod for her to continue.");
	output("\n\n\"<i>The guy was half-kaithrit, I think, to look at him, and he was kind of a little guy, but real fit. Not all muscles, but built like you could bounce a credit chit off any part of him, you get me?</i>\" She chuckles, then takes another sip of her beer. \"<i>Body like that, he would have done real well with the girls back home, even if he was short. And he was charming like you wouldn't believe, so I'd flirt with him every time I stopped by.</i>\"");
	output("\n\nShe raises her dark eyebrows at you. \"<i>Wasn't until my third time doing courier I noticed that he was wearing his shirt more and more open every time I stopped by. So on that time through, I see he's got abs like a washboard. And I saw him before he saw me, and I was wearing a shirt with buttons, so I figure, let's see if he'll stare or not.</i>\"");
	output("\n\nAfter another sip of beer, Kimber goes on. \"<i>I left something out. What he's working on had some real high security, so we only saw each other from two sides of a glass pane, and we had to hand stuff back and forth through a deposit box. So we could talk to each other just fine, and of course see each other, but no touching.</i>\" She smiles. \"<i>So when he turned around and saw me with my shirt halfway unbuttoned, his ears stood straight up, and they weren't the only thing.</i>\"");
	if (flags["KIMBER_SEXED"] == undefined) output("\n\nKimber pauses, then gives you a direct look. \"<i>Now, [pc.name], I know we're just friends and I'm good with that, don't get me wrong. But there's no way I can tell this without getting into all the details. So I hope a little in-depth about my sex life isn't too much for you.</i>\" She winks at you.");
	else output("\n\nShe winks at you. It's easy enough to guess where this is leading, so you wait for her to continue.");
	output("\n\n\"<i>Neither of us said anything about it, of course,</i>\" Kimber says. \"<i>I wanted to see who'd get more distracted first, and I think he did the same. So every time I stopped by, I'd show a little more skin, and so would he. Or I'd wear something low-cut and lean forward right as he was looking, and he'd pick up something heavy with his back turned to show off his tight little ass. Things like that.</i>\" She giggles. \"<i>It was all kinds of fun, but with that glass between us, it seemed like nothing else would happen.</i>\"");
	output("\n\nThat doesn't really sound like the sort of thing that could almost get her fired, though. Where did the flirting lead?");
	output("\n\n\"<i>I'm getting there,</i>\" Kimber says, and sticks her tongue out at you. \"<i>Happened one time, I was on the courier run when I hadn't gotten laid for two weeks or so. My whole group was on mandatory overtime, stuck at work for more than half the day. I got home dead tired and just flopped down to sleep, so I didn't have time to handle myself either. So you can guess the mood I was in when I saw him next.</i>\"");
	output("\n\nYeah, you can definitely see where this is going.");
	output("\n\n\"<i>He sees me coming in, and he's got no shirt on, and zipping up his pants must have somehow slipped his mind. So he saunters on over, big 'ol smile on his face, and asks what he can do for me today.</i>\" Kimber shakes her head, a faint smile on her face. \"<i>I just about lost it. I whipped off my shirt, shoved my tits up against the glass, and dropped a hand right down my pants.</i>\" Her smile becomes a smirk. \"<i>Surprised the hell out of him, but that didn't last long.</i>\"");
	output("\n\nKimber raises her free hand, clenches her fist, and holds her arm out in front of herself, then looks at it from hand to elbow. \"<i>He whips out his thick, nubby cock, this huge thing… I ain't even doing it justice with my arm.</i>\" She lets her arm drop and drinks some more beer. \"<i>And he starts stroking it, pointing the head right at me, making this kind of low growling that just set me right on edge. I yanked down my bra, so he could see the girls in all their glory, and went to town on myself.</i>\"");
	output("\n\nSounds like a hell of a thing. But she started this talking about competition, so who finished first?");
	output("\n\n\"<i>I don't even know,</i>\" Kimber says, shaking her head. \"<i>I was horny as all hell and wanted that dick so bad. I think we came about the same time, and he shot off all over the glass, just coated it. We ended up both leaning against the glass, staring at each other… and then it sunk in what we'd done.</i>\"");
	output("\n\nShe gives you a sheepish look. \"<i>Like I said, this was a high-security stop. So everything we did, we were on camera the whole time. It was one thing to show some cleavage, but I didn't mean to put on a show for the company like that.</i>\"");
	output("\n\nKimber takes a deep breath. \"<i>I got called into my boss's office the next day. He told me he'd heard about what happened, and put in to have the recording deleted. But if I ever pulled something like that again, I was done. I thanked him over and over, and I'm still so glad he was nice enough to do that. I would have had a hard time getting a new job if I had to explain that as why I got fired from my last one, y'know?</i>\"");

	kimberStoryMenu(kimberNyreaStory);
}

public function kimberRaskvelStory():void
{
	clearOutput();
	showKimber();
	processTime(5 + rand(6));
	pc.lust(5+rand(int(0.31*pc.libido())));
	
	output("\"<i>So this is back on the planet that was mostly ocean, remember me telling you about that?</i>\" Kimber begins. You nod. \"<i>As it turns out, there were a few small islands, but they were a few days' flight out, and not much big enough for more than a ship and a tent. So they couldn't send too many people out on to go find new stuff.</i>\"");
	output("\n\nFrom the small smile on Kimber's face, you can guess where this story's going, but you gesture for her to continue.");
	output("\n\n\"<i>I got the assignment for an island run, that's what we called them. Teamed up with this kaithrit woman, real nice girl. Tallest kaithrit I've ever met, about six and a half feet and sweet as you've ever seen. Shy, too. She didn't say much on the way over, and I kept thinking it was going to be a real quiet trip.</i>\"");
	output("\n\nYou can see how that could be an issue, especially if she and the other woman didn't really know each other and were going to be stuck on a small island together.");
	output("\n\n\"<i>That crossed my mind, yeah,</i>\" Kimber says, and sips her beer. \"<i>Not that I mind quiet sometimes, but two weeks in the field with someone who hardly says a word? That's just uncomfortable.</i>\"");
	output("\n\nShe shrugs. \"<i>Didn't stay that way long, though. We had to talk to get everything set up, and that got her to come out of her shell some. Once we had the tent ready and moved our stuff in, we got to talking more. And that night,</i>\" Kimber says, smirking, \"<i>she asks me if I'm into girls.</i>\"");
	output("\n\nYou can see how that might be awkward in some work situations, but for Kimber, it probably didn't even faze her. You ask her what she told the kaithrit.");
	output("\n\n\"<i>Well, of course I told her yes, I'm good either way,</i>\" Kimber says. \"<i>Turns out she mostly just likes girls, but every single one she meets expects her to be the dom, since she's so tall.</i>\" She chuckles. \"<i>You should have seen the look on her face when I told her I just about only do it on top.</i>\"");

	if (flags["KIMBER_SEXED"] == undefined)
	{
		output("\n\nKimber looks like she's about to say more, then pauses. \"<i>So, yeah, we had a good time out there,</i>\" she says, a little bit faster than usual. \"<i>Got a lot of work done too. As it turned out, the samples we found in that island's tidepools had some of the same differences from the main island as samples from other tidepools, which worked into some theory one of the people who ran the company had.</i>\"");
		output("\n\nShe shakes her head. \"<i>I don't remember how all of it played out, not really. I kept hearing about how one of the people running the place was more there for the science and the other was looking for a profit, but I tried to stay out of the workplace drama.</i>\" She grins at you. \"<i>But productive days and good nights, can't beat that, you get me? Especially after I, umm, tied her down with the spare tent equipment,</i>\" she adds quickly.");
	}
	else
	{
		output("\n\nAfter seeing Kimber's love for being on top firsthand, you can guess the two of them had quite the night out there.");
		output("\n\nKimber grins. \"<i>I'd say you have no idea, but you do,</i>\" she says. \"<i>Nothing quite like being out in the middle of nowhere, with nobody around to hear you and nothing that's gonna interrupt. Shy as she seemed on the way over, she sure didn't stay that way. Turns out the girl was a real screamer.</i>\"");
		output("\n\nAnd they were out there for how long?");
		output("\n\n\"<i>Two weeks,</i>\" Kimber says, drawing the words out. \"<i>Two long weeks of working in the tidepools all day and screwing each other silly all night. It got even better once I unpacked my hardlight.</i>\"");
		output("\n\nWait. She brought her hardlight on a work trip?");
		output("\n\nShe gives you a slightly confused look. \"<i>Of course, I bring that thing just about everywhere.</i>\" She rolls her eyes. \"<i>I don't have it on me </i>now<i>, but it's back on my ship. And she got to love wearing it while I rode her. Even got me to tie her down with the spare tent equipment a few times.</i>\"");
		output("\n\nKimber chuckles, shaking her head. \"<i>That girl had some stamina, you know? I do my best to wear people out, as you know, but I finished every damn night out there sore and sweaty, with her still good for another round. I thought tying her down might even things out a little, if she's got to struggle and all, but nope.</i>\" She downs some more of her beer. \"<i>Good times, [pc.name], good times. And we got the work stuff done too.</i>\"");
	}

	kimberStoryMenu(kimberRaskvelStory);
}

public function kimberVanaeStory():void
{
	clearOutput();
	showKimber();
	processTime(10 + rand(16));
	pc.lust(5+rand(int(0.31*pc.libido())));
	
	output("\"<i>So, there was this ausar guy I worked with, back when I first started at Xenogen,</i>\" Kimber begins. \"<i>Real nice fella, one of those high-energy types, you know, the kind that's always up and raring to go first thing in the morning without any coffee?</i>\" She chuckles, and sips her beer. \"<i>He was….</i>\" She gets a thoughtful look on her face for a moment. \"<i>He worked a level above me, between me and the higher-ups. That's the best way I can put it without spending half an hour going on about corporate structure.</i>\"");
	output("\n\nYou nod. You've dealt enough with that sort of thing as part of Steele Tech to know how complicated it can get.");
	output("\n\n\"<i>He was always real friendly, maybe a little flirty but it was hard to tell if he was just being nice or what. It seemed like he treated everyone like that, so I couldn't tell.</i>\" She raises her eyebrows at you. \"<i>I was just glad he wasn't blatant about it, what with the whole work thing. Anyway, we finished up a pretty major project, and way under deadline, so he announced he was taking everyone out for drinks.</i>\"");
	output("\n\nEveryone in her department? That sounds like it could get expensive. People tend to drink more when someone else is buying.");
	output("\n\nKimber chuckles. \"<i>He knew what he was getting into. The project's something the higher-ups are still working on, so I can't tell you about it, but let's just say everyone was real happy we got that thing done.</i>\"");
	output("\n\n\"<i>So,</i>\" she continues, \"<i>we all head to this bar, he says he's a regular there. Not a bad place, real comfortable with cushy seats, good music, the whole deal. He buys us a round of some damn good beer, tells the server to keep it coming when anyone runs low. And it ain't too long before we all start getting good and tipsy.</i>\"");
	output("\n\nSounds about right. You've been to enough corporate events to know how people who work together can get around free booze.");
	output("\n\n\"<i>And he's about five beers in when he gets back to the table after doing some dancing, and sees I'm the only one there.</i>\" Kimber leans in closer to you, smirking. \"<i>He gives me this look, like I've seen from people ever since I got the Treatment, and says real slowly, like he's trying not to slur…</i>\"");
	output("\n\nKimber drops her voice and half-closes her eyes, and says in a half-drunken voice, \"<i>Kimber… I really want to feel your boobs.</i>\"");
	output("\n\nShe leans back, laughing enough to make her chest shake. \"<i>So of course, I can't help laughing,</i>\" she says between giggles. \"<i>It ain't like I've never heard that before, but he was just so solemn about it!</i>\" She pauses. \"<i>And then I felt bad, because he'd probably had to work up the courage to say that, and I laughed at him.</i>\"");
	output("\n\nAt least he'd been drinking, you point out. Maybe he wouldn't remember it the next day if she didn't bring it up.");
	output("\n\n\"<i>I might have thought of that,</i>\" Kimber says, nodding a little. \"<i>I was three beers in myself, so it wasn't like I was thinking too hard. But he didn't get upset, just leaned in closer and kind of whispered that he wanted to feel my boobs on his back, while I fucked him in the ass.</i>\"");
	output("\n\nWell, that was blunt.");
	output("\n\n\"<i>I like blunt,</i>\" she says. \"<i>Means you're not wasting anybody's time. I was real surprised, though. I told him he was drunk, and he said no, he was really into it, that his ex-girlfriend got him started on pegging.</i>\" She takes another sip of beer. \"<i>I kind of joked about it with him, 'cause I wasn't sure if he really wanted it or if it was just the beer talking.</i>\"");
	output("\n\nOne side of her mouth curls up in a smile. \"<i>But I was flattered, and a little curious, so I asked him about it the next week. Outside of work, of course, that's not something you bring up when you're on the clock.</i>\" She grins. \"<i>He was kind of embarrassed that he'd just flat-out said it, but yeah, he was interested. And I'd never done that sort of thing, so…</i>\"");
	if (flags["KIMBER_SEXED"] == undefined) output("\n\nKimber looks away for a moment and clears her throat. \"<i>I'll, um, spare you the details, but let's just say we both had a good time. We kept it up off and on for a few months, kind of a casual thing, until he got an offer from some other company and took off.</i>\" She smiles. \"<i>I haven't found too many guys interested in it since, but it's pretty damn fun.</i>\"");
	else
	{
		output("\n\nKimber leans in toward you again. \"<i>I admit, I was a little nervous at first. I mean, I know my way around a hardlight, but I'd never used one on a guy before. It ain't the sort of thing that usually comes up when I'm looking to get laid.</i>\"");
		output("\n\nYou can understand that, considering… well, everything, both her past and what you two have done together. It seems like most New Texas men would rather pitch than catch, and the other way around for the women.");
		output("\n\n\"<i>Most, yeah, but there's plenty of folks who're good either way,</i>\" she says, nodding. \"<i>But he was all kinds of ready for it. Full selection of lubes and everything.</i>\" She giggles a little. \"<i>And damn if he didn't have this cute little apple-ass, I can tell you that. Once he lifted up his tail and showed that to me, I knew I had to go for it.</i>\"");
		output("\n\nAnd it went well?");
		output("\n\nKimber waggles her eyebrows at you. \"<i>Oh yeah,</i>\" she says. \"<i>Took me a couple thrusts to really get the right angle, but wow, did he ever start howling. I leaned down and put my boobs on his back, just like he asked, and mounted him for…</i>\" She trails off, and thinks for a moment. \"<i>I don't even know how long we went. Hardlights don't get soft, so it wasn't like we had much reason to stop until we were both too damn tired to keep going.</i>\" She smirks. \"<i>I wore him out first, of course.</i>\"");
		output("\n\nOf course. Was it a one-time thing, or did they do it again?");
		output("\n\n\"<i>We kept it up for a few months, here and there,</i>\" Kimber says. \"<i>It was a damn good time, and neither of us were seeing anyone. And it was fun being the only one at work who knew why he was walking funny,</i>\" she adds with a laugh. \"<i>But he ended up getting a job from another company, so he headed off and I haven't heard from him since. I hope he's doing good, he was a nice guy.</i>\"");
	}

	kimberStoryMenu(kimberVanaeStory);
}

public function kimberZilStory():void
{
	clearOutput();
	showKimber();
	processTime(10 + rand(11));
	pc.lust(5+rand(int(0.31*pc.libido())));
	
	output("\"<i>So this was back when I was younger, after I'd only been Treated for maybe two weeks,</i>\" Kimber says. \"<i>I was still getting used to everything, not sure if I was really through with changing, wondering if my tits were actually done growing or not.</i>\" She winks at you. \"<i>It's one of those things we talk about, when we're going through it. Those of us who ain't just sitting there all blissed-out at the new sensations, I mean.");
	if (pc.isTreated()) output(" You remember what it was like, so you get it, right?");
	output("</i>\"");

	output("\n\n");
	if (pc.isTreatedCow()) output("Yes, you definitely do. ");
	else if (pc.isTreated()) output("It was different for you, but you get the idea. ");
	output("It seems like something most everyone on New Texas would understand. You gesture for Kimber to continue.");

	output("\n\n\"<i>I was working at a shop, mostly tourist stuff but they did some local crafts and dairy too. Good place for a part-timer kid.</i>\" She gives you a considering look. \"<i>Might not be something you understand, heir to the company like you are, but it's something just about everyone does back home. The owner was glad I still had my head together after being recently Treated, and he had me and this boy about my own age doing some stock work in the back on one damn hot day.</i>\"");
	output("\n\nKimber sips her beer, then gestures to the bar around you. \"<i>The stock room was bigger than this place, and we had a ton of crates to bring in, all different sizes and weights. The boss man had left the two of us alone to get everything done, said we had two hours to get it all moved into place. So we look at each other, and of course, the first thing he does is flex and say he can carry more than me now.</i>\"");
	output("\n\nMore than her now? Had they worked there together before getting Treated?");
	output("\n\n\"<i>Nope, but I'd known him since we were young,</i>\" she says. \"<i>He was a scrawny kid, but the Treatment got to him good, and he grew up real big, real quick. I knew guys with legs smaller than his arms, and his chest…</i>\" Kimber drinks more beer, and waggles her eyebrows at you. \"<i>After getting Treated, half the time he went around with no shirt on, because he kept tearing them when he flexed. So when he's got a job doing heavy lifting, he thinks he's going to be the best at it.</i>\"");
	output("\n\nMakes sense, and that seems like the kind of thing that would happen a lot.");
	output("\n\nKimber shrugs. \"<i>Sort of. Big muscles are like big anything else, can get the job done but it's always better if you know what you're doing. So I remind him that I've had this job before I even got Treated, that I actually know how to get everything in efficiently, and I'm sure I can do more than him.</i>\"");
	output("\n\nShe grins. \"<i>He looks me in the eye and says, 'Wanna bet?'</i>\"");
	output("\n\nNo surprise he'd make it a challenge, especially if he felt like he could lift anything with his new muscles. Did she take the bet?");
	output("\n\n\"<i>You're damn right I did. Started off with just hauling faster, wager was a handjob. Fingers for me, you get the idea. When I beat him with the first set, he raised the stakes to oral, and when he beat me on that, I raised it again, oral to two orgasms. And the whole time, we're hauling stuff fast as we can, trying like all hell to beat the other to the end.</i>\"");
	output("And how did it end?");
	if (flags["KIMBER_SEXED"] == undefined) output("\n\nKimber gives you another wink. \"<i>He cheated. We went down to the last box, and right as I picked it up, he grabbed me around the waist and hefted me up on his shoulder, and carried me to where we were stowing everything. We both said we won, but as sweaty as we were by then, fucking in the storeroom shower seemed like the best way to settle it.</i>\"\n\nShe's right; that does sound like they both won.");
	else
	{
		output("\n\n\"<i>It went down to the last box,</i>\" Kimber says. \"<i>We were both soaked in sweat, he'd stripped his shirt off a long time ago and mine was on me like a second skin. I thought about taking it off to distract him, but that seemed like cheating. Anyway, we both grabbed for the last box, but I got there first and snatched it up.</i>\"");
		output("\n\nShe grins at you. \"<i>That boy picked me up around the waist and slung me on his shoulder, along with the box, and toted us both back into the storeroom. I was laughing my ass off, seemed like just the sort of thing he'd do, and all the while, he keeps saying that means he won. Our wager was up to sex by then, naturally, so it wasn't like I cared much either way. But I still put the box down and said I won, just to mess with him.</i>\"");
		output("\n\nAnd then? It's not like you can't guess, but you don't think she's going to stop the story there.");
		output("\n\n\"<i>And then,</i>\" Kimber says with a smirk, \"<i>we ran like hell into the storeroom shower. The place had one because the owner knew it was sweaty work, and he wanted his people to have somewhere to clean up when they were done. I always thought he had it built big enough for only one person to keep everyone from fucking in it, but that wasn't going to stop me and the boy.</i>\"");
		output("\n\nShe holds her hands about three feet apart. \"<i>The shower wasn't much wider than this, so we really had to cram ourselves in there. We both stripped, I started the water, and damn if he didn't have a great dick. Not so big as I was thinking, what with how much the rest of him grew when he got Treated, but he knew how to use it. He kind of had to hold me up against the wall while he shoved it in, and when I figured out I had enough room to put my legs around him…</i>\" Kimber bites at her lower lip, her eyes half-closed at the memory.");
		output("\n\n\"<i>I held him in there, too,</i>\" she says after a moment. \"<i>We were squeezed into the shower so tight, when I had my legs around him he couldn't get out. So after he blew his first load, I just kept grinding on him until he got hard again. Didn't take too long, never does with the Treated ones. But we went three rounds in the shower before the boss came in and told us to finish up and get back to work.</i>\"");
		output("\n\nNot bad, not bad at all. And her boss wasn't mad at them for having sex while they were working?");
		output("\n\nKimber laughs. \"<i>You kidding? If people got in trouble for that back home, we'd have the worst employment rate in the whole damn galaxy…</i>\"");
	}

	kimberStoryMenu(kimberZilStory);
}

public function kimberFlirtWithTheCow():void
{
	clearMenu();
	clearOutput();
	showKimber();
	processTime(1+rand(2));
	
	flags["KIMBER_FLIRTED_WITH"] = 1;

	if (hasVisibleMimbranes() || pc.hasParasiteTail())
	{
		output("You lean in close and ask Kimber if it's true what you've heard about New Texas girls, what the Treatment does to them and all that.");
		output("\n\nKimber holds up one hand between you two, a clear 'stop' gesture if you've ever seen one. \"<i>Hold it right there, Steele,</i>\" she says, a stern look on her face, then points at you. \"<i>You think you're getting anywhere near me with that on you, you've got another thing coming.</i>\"");
		if (hasVisibleMimbranes())
		{
			output("\n\nBefore you can ask what the problem is, Kimber spits, \"<i>How many of those damn mimbranes have you got on you? I know where they like to latch on, so how many do you have where I can't see them?</i>\"");
			if (flags["KIMBER_TALKED_MHENGA"] == undefined) output("\n\nYou tell Kimber you're not sure what the issue is. Sure, some people might think the mimbranes are a little odd, but they're no stranger than a lot of what's out there. \n\nKimber takes a deep breath, and looks away for a moment. \"<i>I don't like to talk about it much,</i>\" she says, her voice low, \"<i>but I had a real bad experience back on Mhen'ga. A couple of those damn things hooked onto me, nearly got me killed.</i>\" She fixes her gaze on you, clearly upset. \"<i>I'm not getting near you with those things on you. You want to go for a tumble, you get rid of every single one, and maybe we'll talk.</i>\"");
			else output("\n\nThat's right. Kimber had some serious trouble with mimbranes back on Mhen'ga. She might have been too polite to mention yours at the time, but she clearly draws the line at flirting with someone they're attached to.\n\n\"<i>I told you what happened, [pc.name], so I don't know why you'd think I'd be up for a tumble,</i>\" Kimber says, \"<i>not with those things on you. Get rid of them and maybe we can talk.</i>\"");
		}
		else
		{
			output("\n\nYou realize she's pointing at your " + (pc.hasParasiteTailCock() ? "[pc.cockTail]" : "[pc.cuntTail]") + ". What's wrong with that?");
			if (flags["KIMBER_TALKED_MHENGA"] == undefined) output("\n\nKimber looks away for a moment. \"<i>I don't like to talk about it much,</i>\" she says, her voice low, \"<i>but I had a real bad experience back on Mhen'ga. They've got mimbranes there, these parasites like giant thirsty pieces of cloth. Couple of them hooked onto me, nearly got me killed.</i>\" She fixes her gaze on you, clearly upset. \"<i>I'm not taking my chances with anything like that, I don't care how good the rest of you looks. You want to get anywhere near my bed, you lose that thing and we'll talk.</i>\"");
			else output("\n\nShe scowls at you, easily the angriest you've ever seen her. \"<i>Really? I told you what happened to me on Mhen'ga, and you're asking me what's wrong with that? Those damned mimbranes almost killed me.</i>\" She folds her arms over her chest and huffs. \"<i>I'm not taking my chances with anything like that, I don't care how good the rest of you looks. You want to get anywhere near my bed, you lose that thing and we'll talk.</i>\"");
		}
		
		flags["KIMBER_REJECTED_PARASITE"] = 1;
		
		kimberMenu();
		addDisabledButton(2, "Flirt");
	}
	else if (flags["KIMBER_REJECTED_PARASITE"] != undefined)
	{
		output("You lean in and get about two words into what you think will be a good line to use on Kimber, before she holds up her hand in a clear 'stop' gesture.");
		output("\n\n\"<i>Hold it right there, Steele,</i>\" Kimber says, a stern look on her face. \"<i>I told you, you're not getting anywhere near me with one of those… </i>things<i> on you. Now, I don't see one, but if you want to do this, you've got to prove that you're clean.</i>\" She glances at your crotch. \"<i>I know where they latch on first. So drop trou or we ain't going anywhere.</i>\"");
		if (pc.exhibitionism() < 10) output("\n\nWhat? She wants you to expose yourself in public, just to prove you don't have a parasite? That seems kind of harsh, but judging by the look on Kimber's face, she's not going back on this. You look around quickly to make sure nobody's watching, then shuffle aside your [pc.lowerGarments] to expose your [pc.crotch] She gestures for you to turn around, so you do the same to bare your [pc.ass], poking it out as quickly as you can.");
		else if (pc.exhibitionism() < 33) output("\n\nSo that's what she wants? Exposing yourself in public might not be an everyday thing for you, but it's nothing you haven't done before. A little thrill runs up your spine as you tug at your [pc.lowerGarments], exposing your [pc.crotch] and [pc.ass] to Kimber. You take a little bit longer to give her a look than you need to, in case someone else wants a peek.");
		else output("\n\nWithout a second thought, you yank down your [pc.lowerGarments], exposing your [pc.crotch] and [pc.ass] to Kimber, along with the rest of the bar. You fold your arms over your [pc.chest], and give her a look. If she wants to turn this into some kind of stripping game, you're all for it.");

		if (attachedMimbranes() > 0)
		{
			output("\n\nKimber gives you a scowl that could burn a hole through your ship. \"<i>Seriously, Steele? You think I wouldn't notice the second time? How stupid do you think I am?</i>\" She downs more of her beer, like she's trying to drink away what she just saw. \"<i>Keep that thing covered and don't try this again until it's gone, you hear me?</i>\"");
			kimberMenu();
			addDisabledButton(2, "Flirt");
		}
		else
		{
			output("\n\nKimber gives your [pc.crotch] and [pc.ass] a careful look, then smirks at you. \"<i>Good to see you got that thing taken off, [pc.name].</i>\" She grins, then leans forward, pressing her enormous boobs against your [pc.chest]. \"<i>Now, where were we?</i>\"");
			pc.lust(5+pc.libido()/5);

			flags["KIMBER_REJECTED_PARASITE"] = undefined;

			kimberSexButton(0);
			addButton(14, "Never Mind", kimberWasJustBeingFlirtedWith);
		}
	}
	else
	{
		pc.lust(5+pc.libido()/5);

		if (flags["KIMBER_SEXED"] == undefined)
		{
			output("You lean in close and ask Kimber if it's true what you've heard about New Texas girls, what the Treatment does to them and all that.");
			output("\n\nKimber gives you a coy look. \"<i>Oh, so you've heard things about us?</i>\" She gives you a long look up and down, not even trying to hide that she's checking you out. When her eyes meet yours, she's smirking. \"<i>Care to share?</i>\"");
			output("\n\nYou've heard New Texas girls can take you for a ride like no one else in the galaxy, for starters. Kimber chuckles, then sets down her beer and turns to face you.");
			output("\n\n\"<i>That one's true,</i>\" she says. \"<i>But I ain't like most other girls from back home.</i>\" She folds her arms under her boobs, pushing them up beneath her labcoat. The button holding her coat together looks to be having trouble staying closed. \"<i>You want to go for a ride, I'm on top. You think you can handle your [pc.hips] getting plowed into the mattress, then we can talk.</i>\"");
		}
		else
		{
			output("You lean in close and ask Kimber if she's good for going for another ride, assuming she's recovered from the last one.");
			output("\n\nKimber laughs, but it's a friendly laugh, and the smirk she gives you is a familiar one. \"<i>Oh, really, [pc.name]? You think I'm the one needs to recover?</i>\" She raises her dark eyebrows. \"<i>Funny how I remember you being the one gasping for air at the end last time.</i>\"");
			output("\n\nYou remind her that you were both pretty exhausted, and that she didn't seem to mind at all. You definitely didn't hear any complaints.");
			output("\n\n\"<i>Oh, no complaints at all, don't get me wrong,</i>\" she says, still laughing a little. She folds her arms under her boobs, pushing them up beneath her labcoat. The button holding her coat together looks to be having trouble staying closed. \"<i>Don't mind me, I like the verbal foreplay. But if you think you can handle another good ride and don't have to walk too much tomorrow, say the word.</i>\"");
		}
		
		addButton(0, "Flirt Harder", kimberTheFlirtIsNotEnough);
		kimberSexButton(1);
		addButton(14, "Never Mind", kimberWasJustBeingFlirtedWith);
	}
}

public function kimberTheFlirtIsNotEnough():void
{
	clearMenu();
	clearOutput();
	showKimber();
	processTime(1+rand(2));
	pc.lust(5+pc.libido()/5);
	
	if (flags["KIMBER_SEXED"] == undefined)
	{
		output("You tell Kimber that she seems pretty sure she'll be able to handle you. You're not so sure.");
		output("\n\n\"<i>Oh, you don't need to worry about that,</i>\" she says, and flicks her tongue out at the corner of her lips. \"<i>You just need to worry about making sure you can keep it up long enough so I get what I want, and I'll take good care of you.</i>\"");
		if (!pc.isCrotchExposed()) output("\n\nShe pauses, a considering look on her face. \"<i>Or if you don't have a dick down there, I've got a hardlight you can borrow. I'm not picky about that kind of thing.</i>\"");
		else if (pc.hasCock()) output("\n\nShe looks down at your exposed [pc.crotch]. \"<i>Looks like you've got what I'm looking for, but the real question is whether what you've got can handle me.</i>\"");
		else output("\n\nShe looks down at your exposed [pc.crotch]. \"<i>Long as you don't mind using a hardlight. I've got one if you don't.</i>\"");
		output("\n\nYou laugh a little, and tell her she's got nothing to worry about. Legends of New Texas girls or no, you think you've got a good shot at wearing her out before you even get tired.");
		output("\n\n\"<i>I've heard that before,</i>\" Kimber says, drawling it out a little. She pushes her arms up more beneath her boobs, hoisting them nearly up to her chin. The coat's button is barely holding itself in place, and you can almost see the strings straining. \"<i>But I've had too many who got their hands on these, and they... well, they couldn't keep it together.</i>\" She waggles her eyebrows at you. \"<i>You up for showing me you're better than that?</i>\"");
	}
	else
	{
		output("You tell Kimber you're not worried about whether you can handle another ride, but whether she can. Now that you know what she likes, you could wear her out even faster.");
		output("\n\n\"<i>Hah!</i>\" Kimber laughs, and grins at you. \"<i>You can try.</i>\" She pauses, a considering look on her face. \"<i>Now that I think about it, please do try. I haven't properly broken in the bed on my ship yet, and by that I mean I haven't managed to actually break the thing.</i>\" She leans toward you. \"<i>But I've got moves you ain't seen yet, Steele.</i>\"");
		output("\n\nYou could say the same, you tell her. And since she knows you can last as long as you need to, maybe it's time you both started showing each other what you can really do.");
		output("\n\n\"<i>Maybe it is,</i>\" Kimber says, drawling it out a little. She pushes her arms up more beneath her boobs, hoisting them nearly up to her chin. The coat's button is barely holding itself in place, and you can almost see the strings straining. \"<i>Or maybe you're just talking me up, thinking pretty words are going to get you somewhere when we both know where this is going.</i>\" She waggles her eyebrows at you. \"<i>You up for another round, you come with me and you prove it, you hear?</i>\"");
	}

	addButton(0, "Flirt Hardest", kimberYouOnlyFlirtThrice)
	kimberSexButton(1);
	addButton(14, "Never Mind", kimberWasJustBeingFlirtedWith);
}

public function kimberYouOnlyFlirtThrice():void
{
	clearMenu();
	clearOutput();
	showKimber();
	processTime(1+rand(2));
	pc.lust(5+pc.libido()/5);
	
	output("You tell Kimber that she better be sure she's ready for what she's getting into, as you can show her things you've learned in your travels across the galaxy that there's no way they even knew about on New Texas.");
	output("\n\nKimber gives a loud, hearty laugh, enough to make her chest bounce. The strain on her labcoat pops off the one button holding it closed, sending the button flying across the bar. The button bounces off a wall and lands in the half-full glass of an ausar man who's fallen asleep at his table.");
	output("\n\nThis only makes Kimber laugh harder, and once she's recovered, she leans forward and presses her enormous chest against your [pc.chest]. \"<i>Okay, [pc.name],</i>\" she says, \"<i>do you want to go back to my ship and fuck? Much as I like the teasing talk, I think we've done enough dancing around this for now.</i>\"");

	kimberSexButton(0);
	addButton(14, "Never Mind", kimberWasJustBeingFlirtedWith, true);
}

public function kimberWasJustBeingFlirtedWith(srsFlirting:Boolean = false):void
{
	clearMenu();
	clearOutput();
	showKimber();
	processTime(1);

	if (srsFlirting)
	{
		output("You tell Kimber that you're just flirting for the fun of it, and that you don't feel like having sex with her right now.");
		output("\n\nKimber's smile slowly fades, and she pulls away from you, her brows furrowed together. \"<i>Really, Steele? Really?</i>\" She pulls her coat together over her chest, and tries to use a different button to hold it together. She only manages to get a button closed below her breasts, making it look like she's putting herself on display.");
		output("\n\n\"<i>Get a girl all riled up,</i>\" she mutters, \"<i>and then nothing?</i>\" She looks you in the eye. \"<i>That's damn disappointing.</i>\"");
		output("\n\nBefore you can say anything else, Kimber steps away from the bar, then turns to face you again. \"<i>Now if you'll excuse me, I've got to go handle things myself, since you got me all going and hung me out to dry.</i>\" She pauses. \"<i>And I need to sew on a new button. Again.</i>\"");
		output("\n\nShe walks out of the bar, leaving you alone. Maybe that wasn't the nicest thing to do.");
		pc.createStatusEffect("Kimber Bating");
		pc.setStatusMinutes("Kimber Bating", 60);
		refreshRoamingBarEncounter();
		addButton(0, "Next", mainGameMenu);
		return;
	}
	else if (flags["KIMBER_SEXED"] == undefined)
	{
		output("You tell Kimber that you're just flirting for the fun of it, and don't really mean anything by it. She looks disappointed, but not upset.");
		output("\n\n\"<i>Well, damn, [pc.name],</i>\" she says. \"<i>That's not something I hear often. And I was starting to think I wasn't doing too good, what with you not taking me up on it.</i>\" She laughs a little, then smiles at you. \"<i>But I don't mind too much. There's something kind of fun about dancing around it instead of stepping on its toes, you know?</i>\"");
		output("\n\nThat's not a bad way to put it. And sometimes it is fun just to flirt.");
		output("\n\n\"<i>And besides,</i>\" Kimber says, \"<i>it's kind of nice to have someone to just talk to, flirting or no.</i>\" She chuckles. \"<i>I'm good with being friends with or without benefits.</i>\"");
	}
	else
	{
		output("You tell Kimber that you're just flirting for the fun of it, and aren't looking for another ride right now. She laughs out loud, dropping her arms and making her boobs shake and strain against her coat.");
		output("\n\n\"<i>I knew it!</i>\" She leans back against the bar, looking supremely smug, and downs more of her beer. \"<i>Knew I'd worn you out, Steele.</i>\" She nudges you with one elbow. \"<i>You had trouble walking lately? Been to see a V-Ko to get your hips realigned?</i>\"");
		output("\n\nIt's not like that, you tell her, but it doesn't look like she believes you. Then, she smiles.");
		output("\n\n\"<i>I get it, I'm just teasing you,</i>\" she says, then leans closer to you, like she's telling a secret. \"<i>Believe it or not, I also have times when I'm not looking to get laid.</i>\" She winks. \"<i>Not that you couldn't change my mind, but it happens. So we're good.</i>\"");
	}

	kimberMenu();
}

public function kimberTouchTheCow():void
{
	clearMenu();
	clearOutput();
	
	output("You tell Kimber that heading back to her ship is exactly what you want to do. She grins at you, then drinks the rest of her beer and drops the mug down on the bar.");
	output("\n\n\"<i>Now you're talking, [pc.name],</i>\" she says, then reaches out and slides her arm around your waist, pulling you close to her. Her hip nudges against your [pc.hip] as she leans in close and smirks. \"<i>Hope you can handle this.</i>\"");
	output("\n\nThe two of you head back to the ship dock; her ship's parked not far from yours. It's some sort of small cruiser with three large engines in the back, a basic design similar to a lot of craft made for a single person or a small crew. It looks like Xenogen didn't spring for anything fancy; their logo on the side seems to be the ship's only customization. Then you see a pair of steer horns painted on the front of the cockpit.");
	output("\n\nIt might be a company ship, but Kimber's clearly made it her own.");
	output("\n\n\"<i>She ain't much to look at, but she gets me where I need to go,</i>\" Kimber says as she leads you toward her ship. \"<i>And one of the perks is a full-ship auto cleaning system.</i>\" You look at her, and she nods. \"<i>The job's got me working with dangerous chemicals sometimes, so that's got to be there.</i>\" She pauses, then chuckles at you. \"<i>And occasionally I have someone over and we make a mess.</i>\"");
	output("\n\nKimber lets you into the ship. It's small but not cramped, though you don't get much of a good look at it – Kimber takes you by the hand into the back of the ship, right to the cabin that serves as her bedroom. Most of the room's taken up by a bed that's actually big enough for two, not a common thing on ships this small. Half a dozen pillows of various sizes adorn the bed. Screens on the walls show pastoral pictures, probably of New Texas, and a large mirror hangs between them. An open door leads to a bathroom and shower, and the only furniture is a small chair next to a desk that folds down from the wall.");
	output("\n\nOnce you're inside, Kimber turns and gives you a gentle push, until you're backed up against the wall. She presses herself against you, and makes a low moan as she leans in and kisses you, her lips soft against your [pc.lipsChaste], her massive chest squishing against your [pc.chest]. Her tongue flicks against your lips as the kiss continues, and she raises one leg, rubbing it against yours as she presses you harder against the wall.");
	if (pc.hasCock())
	{
		output(" You feel your [pc.cockBiggest] begin to swell");
		if (pc.hasLowerGarment()) output(" within your [pc.lowerUndergarment]");
		if (pc.isHerm()) output(", and your [pc.vagina] grows wet as well");
		output(", aroused by the close contact.");
	}
	else if (pc.hasVagina())
	{
		output(" You feel your [pc.vagina] begin to grow wet");
		if (pc.hasLowerGarment()) output(" within your [pc.lowerUndergarment]");
		output(", aroused by the close contact.");
	}
	output("\n\nAfter a long moment, Kimber slowly pulls away and ends the kiss. When she looks at you, she's blushing, and runs the tip of her tongue over her upper lip. \"<i>Only get to do this for the first time once, [pc.name],</i>\" she says. \"<i>Got to start it off right, y'know?</i>\"");
	output("\n\nThat's a little more sentimental than you expected from someone from New Texas, but you see no problem with starting things off like that. Kimber steps back and guides you to the bed, then motions for you to sit. Once you're seated, she steps back and leans back against the wall, bending down to unlace her boots.");
	output("\n\n\"<i>I swear,</i>\" she says, \"<i>if there's a sexy way to undo these things, I haven't found it.</i>\" She seems to be unlacing them purely by touch, as bending over like that, her boobs are completely blocking her view of her feet. Once she's done, she kicks her boots and socks off, then stands and folds her arms under her tits, giving you a seductive look. \"<i>Now you just sit right there,</i>\" she says, \"<i>and enjoy the show.</i>\"");
	output("\n\nKimber slowly slides her hands up her chest, letting out a long breath as she goes, and undoes her labcoat's single closed button. The coat flies open in a blink, and Kimber takes hold of the lapels, sliding the white garment back over her shoulders. She lets it drop to the floor, and stretches her arms out to either side as you get your first good look at what the coat was hiding.");
	output("\n\nThe coat was hiding quite a bit. Kimber's purple sweater clings tight to the sides of her breasts, cinched around the massive globes, stretching over her still-hidden cleavage. They look considerably larger without the coat covering them. Kimber leans forward, making them sway beneath the soft cloth, and drops her hands down to her curvy hips.");
	output("\n\nWith agonizing slowness, Kimber undoes the buttons on her jeans, one at a time as she works her way down the button fly. She slides her pants down over her hips, and pulls them all the way down, exposing a pair of shapely legs. Beneath the jeans, she has on a pair of silky purple panties, the crotch already visibly darkened.");
	output("\n\nKimber lets out a giggle, then raises her arms and turns around, giving you a good look at her round ass. It's bouncy and well-shaped, neither big or small, and her cow-tail swishes back and forth above it. As you watch, she whips her tail around and smacks herself on the butt with its end, laughing. Her panties are made to accommodate her tail, with a loop at the top that snaps closed around it.");
	output("\n\n\"<i>Little joke we've got back home,</i>\" Kimber says with her back to you, her hands planted on her hips. \"<i>People say if you can't see a girl's tits from behind, then she must not have had the Treatment yet.</i>\" She looks over her shoulder at you, tail swaying, and smirks. \"<i>I ain't had that problem since after my first few days Treated,</i>\" she says, clearly proud. You can of course see her boobs from behind, and–");
	output("\n\nKimber takes hold of her sweater from the bottom and lifts it, revealing her bare skin beneath it. As the sweater rises, it reveals a purple bra, the bands thick enough to hold up damn near anything. Despite the industrial build, the bra has lacy trim all along the straps, and as Kimber turns back around, you see the trim continues onto the cups, making the sturdy garment look delicate and feminine.");
	output("\n\nAnd it must be sturdy, to hold in all that flesh. Now that only her bra covers them, you can take in the full size of Kimber's boobs, larger than her head, pale and smooth. Her cleavage looks like she could lose her datapad in it. She leans forward, eyes on you, and slowly runs her hands all the way around her breasts. It takes a while. Her fingers dwell on her nipples, poking out from her bra, and she lets out a moan.");
	output("\n\n\"<i>Keep staring, Steele,</i>\" she says, sounding like she's enjoying the attention. \"<i>Here they come.</i>\"");
	output("\n\nKimber slides her hands behind her back, thrusting her enormous chest forward, making her boobs nearly spill out of their confines. There's a faint clicking sound, and Kimber sighs as her bra comes loose. Her boobs drop, but only a little, mostly held in place by their own size and plumpness. She drops her bra to the ground, revealing bright pink nipples, each about half the length of her thumb and nearly as big around. Her areolas are also pink, and small, making her nipples stand out even more.");
	output("\n\nWith a laugh at the expression on your face, Kimber bends forward, letting her boobs hang down. They sway as she takes hold of her panties and pulls them down all at once, dropping the garment to her ankles. She stands up straight with a bounce that sends her tits rising above her shoulders, then stands before you completely nude, her smooth pussy gleaming wet. It's a long moment before you can meet her eyes, but when you do, she's smirking again. She clearly knows exactly the effect her body has on you.");
	output("\n\n\"<i>All right, [pc.name],</i>\" Kimber says, and licks her lips again. \"<i>Your turn.</i>\"");
	output("\n\nYou swap places with Kimber, and she crosses her legs as she sits naked on the bed, leaning forward to let her tits rest on her thighs. She gives you an eager look, clearly wanting to see what you've got to show her.");
	output("\n\nBest to not disappoint.");
	
	//Do not pass GO. Do not fuck the cowgirl.
	if (attachedMimbranes() > 0)
	{
		showKimber();
		processTime(10 + rand(6));
		pc.lust(25+rand(int(0.26*pc.libido())));
		output("\n\nYou slowly work your way out of your " + (pc.hasArmor() ? "[pc.armor]" : (pc.hasLowerGarment() ? "[pc.lowerUndergarment]" : "[pc.upperUndergarment]")) + ", shaking your [pc.ass] as you get undressed, and turning around to give her a good look at your [pc.chest] as you drop your garb to the ground. Kimber's eyes snap open wide, and she scrambles backward over her bed, then grabs a pillow and hurls it at you.");
		output("\n\n\"<i>What the </i>fuck!\" she shouts, pointing at your [pc.crotch]. \"<i>You didn't tell me you had one of those things on you!</i>\" She's breathing hard, fear clear in her eyes.");
		output("\n\nYou glance down at your [pc.crotch], and realize she's pointing at your attached mimbrane.");
		if (flags["KIMBER_TALKED_MHENGA"] == undefined) output(" You tell Kimber you're not sure what the issue is. Sure, some people might think the mimbranes are a little odd, but they're no stranger than a lot of what's out there.\n\nKimber takes a deep breath, then stands up and grabs her labcoat, and puts it back on. \"<i>I don't like to talk about it much,</i>\" she says, her voice low, \"<i>but I had a real bad experience back on Mhen'ga. A couple of those damn things hooked onto me, nearly got me killed.</i>\" She fixes her gaze on you, clearly upset. \"<i>I'm not getting near you with those things on you. You need to leave, right now.</i>\"");
		else output(" That's right. She had a bad experience with mimbranes back on Mhen'ga. Maybe you should have mentioned that you had a very different experience with them before coming here.\n\n\"<i>I cannot fucking believe you, Steele,</i>\" Kimber says, scowling hard at you as she rises from the bed. She grabs her labcoat and yanks it on, covering herself quickly. \"<i>I told you what happened to me. And you seriously thought I'd fuck you like that?</i>\" She points to the door. \"<i>Get out. Right now.</i>\"");
		output("\n\nYou head for the door, and Kimber clears her throat right as you're about to walk out, making you pause. \"<i>You get yourself cleaned up,</i>\" she says, her voice quivering a little, \"<i>and we can talk about doing this again. But you damn well better be willing to prove to me that you're clean if you want another chance.</i>\"");
		output("\n\nYou nod to her, and head out of her ship.");
		flags["KIMBER_REJECTED_PARASITE"] = 1;
		addButton(0, "Next", kimberGoHomePostSex);
		return;
	}
	
	showKimber(2);
	processTime(45+rand(31));
	
	if (pc.isNude()) output("\n\nAs you stand up, you realize that you're already naked, so it's not like you can do much to match Kimber's strip show. " + (pc.tone >= 60 ? "But you give her a few good poses, flexing to show off the body you've built." : "But you strike a few poses, trying to show yourself from the best possible angles.") + " Kimber waggles her eyebrows at you, and licks her lips.\n\nYou run through a series of poses, revealing and hiding more and less of yourself with your hands as you go, trying to somehow not show everything at once. It looks like it's working; Kimber's right hand finds its way to her right nipple, fondling the pink flesh, and you're not sure if she even realizes she's doing it. After a few more turns, you display yourself to her in all your glory, giving her a full frontal pose to show off your [pc.chest] and [pc.crotch].");
	else if (pc.hasArmor())
	{
		output("\n\nYou slowly work your way out of your [pc.armor], shaking your [pc.ass] as you get undressed, and turning around to give her a good look at your [pc.chest] as you drop your garb to the ground. Kimber waggles her eyebrows at you, and licks her lips.");
		if (pc.tone >= 60) output(" You give her a few good poses, flexing to show off the body you've built.");
		else output(" You strike a few poses, trying to show yourself from the best possible angles.");
		if (!pc.hasLowerGarment() && !pc.hasUpperGarment()) output("\n\nWith your [pc.armor] off, you've got nothing to hide. You run through a series of poses, revealing and hiding more and less of yourself with your hands as you go, trying to somehow not show everything at once. It looks like it's working; Kimber's right hand finds its way to her right nipple, fondling the pink flesh, and you're not sure if she even realizes she's doing it. After a few more turns, you display yourself to her in all your glory, giving her a full frontal pose to show off your [pc.chest] and [pc.crotch].");
		else
		{
			output("\n\n\"<i>I like it,</i>\" Kimber says, winking at you. \"<i>Now show me the rest!</i>\"");
			if (pc.hasUpperGarment()) output("\n\nYou slowly pull off your [pc.upperUndergarment], revealing your [pc.chest].");
			else output("\n\nYou turn and display yourself again, showing off your bare [pc.chest].");
			output(" Kimber's eyes open wider, and her right hand finds its way to her right nipple, fondling the pink flesh; you're not sure if she even realizes she's doing it.");
			if (pc.hasLowerGarment()) output(" You pose again, then reach down and pull off your [pc.lowerUndergarment], fully revealing your [pc.crotch].");
			else output(" With a final twist, you give Kimber a good look at your bare [pc.ass], then continue the turn to fully reveal your [pc.crotch].");
		}
	}

	output("\n\nKimber reaches for her other nipple and starts fondling that one too. Her face is flushed red, and she slowly stands, wetness glistening on her thighs. \"<i>Damn, Steele. You got a mighty fuckable figure, you know that?</i>\" She looks down at your crotch, and takes a deep breath.");
	if (pc.biggestCockLength() > 20) output(" \"<i>Fuck,</i>\" she whispers, \"<i>that thing's huge." + (pc.cocks[pc.biggestCockIndex()].cType == GLOBAL.TYPE_EQUINE ? " And it's my favorite kind of dick.</i>\"" : "</i>\""));
	else if (pc.hasCock() && pc.cocks[pc.biggestCockIndex()].cType == GLOBAL.TYPE_EQUINE) output(" \"<i>And it's my favorite kind of dick.</i>\"");
	if (pc.hasCock()) output(" Kimber reaches down to your [pc.cockBiggest] and runs her hand along your stiffening length, her soft skin sending a shiver through you. She makes a low, pleased noise as you get hard, clearly liking what she sees. When she meets your gaze, you can see the lust in her eyes. \"<i>Now how about you get your ass on my bed, [pc.name], so we can get started?</i>\"");
	else if (pc.hasVagina())
	{
		output(" Kimber reaches down to [pc.oneVagina] and gently strokes her fingers over your lips, sending a shiver through you as your wetness increases. She meets your gaze, and says in a low voice, \"<i>Now, give me just one sec to get my hardlight for you.</i>\"");
		if (pc.hasHardLightAvailable()) output("  She pauses, then asks, \"<i>You don't mind using mine, do you? It's bigger than most standard ones, and a horsecock besides, so it rubs me right.</i>\"");
		output("\n\nKimber steps into her bathroom for a moment and returns with a thong with a built-in hardlight dildo. You pull it on and activate it, and a ten-inch glowing red horsecock appears atop your crotch. \"<i>Perfect,</i>\" she says. She looks up at you, and you can see the lust in her eyes. \"<i>Now how about you get your ass on my bed, [pc.name], so we can get started?</i>\"");
	}

	output("\n\nBefore you can respond, Kimber takes you by the shoulders and turns you, then gives you a gentle push. You fall backward onto her bed, landing on the soft mattress, a pile of pillows beneath your head. Kimber follows you a moment later, straddling your [pc.hips] as she lowers herself down, until her glistening pussy rests on your [pc.belly]. She leans forward, her enormous boobs heading right for you.");
	output("\n\n");
	if (pc.tallness <= 5*12) output("Kimber's tits land right on your face, and you're smothered in an avalanche of boob-flesh. Kimber laughs after a second, then lifts her breasts off of you and scoots back a little. \"<i>Sorry about that, [pc.name],</i>\" she says. \"<i>I forget how the girls can be for shorter folks sometimes.</i>\" ");
	output("Her breasts come to rest on your [pc.chest], their soft, warm weight settling atop you, and Kimber leans down for a kiss. Your lips meet, and her tongue slides into your mouth, darting around as your own tongue circles it. Kimber holds the kiss for a while, then pulls away, breathing hard.");
	output("\n\nWith a practiced motion, Kimber tugs one of her boobs forward and pushes it toward you, the pink nipple aimed right at your mouth. You take the nipple in and give it a good, long suck. Kimber gasps, her eyes squeezing closed as you flick the pink flesh with your [pc.tongue]. You reach up and stroke the sides of both her tits, listening as Kimber's breathing grows faster, and you feel a trickle of girlcum slide down the side of your [pc.belly].");
	output("\n\nIt's no surprise someone as boob-focused as Kimber would get off on this, but damn, it's working quickly. You reach for her free nipple and give it a squeeze, then time your sucking with that, throwing in an occasional pinch and nibble as you work Kimber's teats. Her breathing quickens further, and it looks like she's blushing hard, though you can only see part of her face past her tits.");
	output("\n\nKimber lets out a moan that starts to turn into a cry, and pulls away all at once, leaning back as she straddles you. Her face is flushed, as are the tops of her boobs, and she's breathing hard. \"<i>No fair,</i>\" she gasps, \"<i>almost getting me off like that.</i>\" She takes a deep breath, then laughs. \"<i>Not that I mind getting a boob-gasm, but it ain't like I can wear you out like that.</i>\"");
	output("\n\nShe winks at you, then lets out a long breath and leans forward again, planting her hands to either side of you and letting her boobs hang down before you. Slowly, she slides her lower half back, until her pussy hits the base of " + (pc.hasCock() ? "your [pc.cockBiggest]" : "the hardlight horsecock") + ". She starts to rub herself against the base, and the friction sends shivers through you. After a few good grinds, she raises her hips and slides her slick cunt up and down the stiff length. " + (pc.hasCock() ? " The sensation of her wet lips on your shaft is amazing, and it's all you can do to not thrust into her right then." : "Her grinding presses the hardlight's base against [pc.oneVagina], like she's rubbing herself and you at the same time.") + " You grin up at her and move your hips in time, pushing back against her, and she moans again.");
	output("\n\n\"<i>You ready for this, Steele?</i>\" Kimber asks, her voice gone low and breathy. You nod, and she runs her tongue over her upper lip, then hoists up her hips.");
	if (pc.hasCock())
	{
		output("\n\nSlowly, Kimber brings her gleaming pussy down onto your [pc.cockBiggest].");
		if (pc.biggestCockThickness() >= 3) output(" It's a surprisingly tight squeeze, and her breath catches as she slides her way down your wide shaft.");
		if (pc.hasCock() && pc.cocks[pc.biggestCockIndex()].cType == GLOBAL.TYPE_EQUINE) output(" As her lips squeeze over the ring at your cock's middle, she moans out, \"<i>Oh, that's the stuff.</i>\"");
		output(" She lowers herself atop you, her pussy slipping around your [pc.cockBiggest] like it was made to hold you, tight but flexible around your length. Kimber keeps her descent slow and controlled, her shapely thighs lowering to rest against your [pc.thighs] as her cunt swallows up your [pc.cockBiggest] and comes to rest atop your [pc.biggestSheath].");
		pc.cockChange();
		output("\n\n\"<i>Ooooh....</i>\" Kimber moans, rocking back and forth a little, like she's getting used to the feeling of you inside her.");
		if (pc.biggestCockLength() > 20) output(" \"<i>Fuck, that's deep,</i>\" she whispers. \"<i>Ain't everyone who can fill me up like that.</i>\"");
		output(" Her boobs sway with the motion, their movements hypnotic. You reach up and start to stroke them, and Kimber's eyes open wide, like that somehow woke her up.");
		output("\n\n\"<i>Aah,</i>\" she breathes, grinning. \"<i>Going right for it, ain't you?</i>\" She starts circling her hips, pushing down harder on your [pc.cockBiggest]. You push back against her again, moving your [pc.hips] back and forth, stroking the sides of her breasts as she tilts her head back and moans.");
		output("\n\nKimber leans forward, pushing her tits against your hands as her hips swivel faster. Her pussy squeezes your [pc.cockBiggest], the soft walls stroking your shaft, all your length and head wrapped up in that tight slickness. You shift your hands and rub her nipples with your thumbs, flicking the pink peaks back and forth in time with your thrusts, your fingers squeezing the soft masses.");
		output("\n\nShe tilts her head back and moans, and clamps her hands over yours, squeezing and stroking her boobs right along with you. The motion of her hips speeds up again as you thrust into her, her thighs slapping against yours, her girlcum drooling out with every movement.");
		output("\n\n\"<i>Oh, </i>fuck<i> yes,</i>\" Kimber moans, her eyes squeezed shut tight. You roll her hard nipples between your fingers, switching between that and small pinches as Kimber moves from grinding on you to straight-out thrusting herself down on your [pc.cockBiggest], her mouth hanging open. Her pussy squeezes you tighter with every thrust, and you force yourself to hold back. The ride's clearly not over yet, and for all she talked about wearing you out, you still want to prove her wrong.");
		output("\n\nShe moans again, and shoves herself forward, slamming her hands down on either side of you and shoving her boobs at your face. You keep your hands in place, letting her tits slap against them as you keep working her nipples. Her hips hammer against yours over and over, your [pc.cockBiggest] sliding partway out of her with each thrust only to ram deep into her every time she slides down. {If Steele has horsecock:She clearly knows how to ride a horsecock right, pulling herself up to the median ring every time and sliding right back down, so she gets that extra stretch with every thrust. }Her eyes are open wide now, and she's gasping hard, her face and chest both flushed red.");
		output("\n\nBracing yourself as best you can, you thrust harder, keeping pace with her. She gasps and rears back, then grabs hold of your hands and forces them down to the bed, holding you down as she tries to fuck you right through the mattress. Her tits crush against your [pc.chest], then rise and crash into your face as Kimber moans again. You lick at the soft flesh, hoping to catch a nipple, but Kimber's boobs are bouncing too much for you to get a hold of anything.");
		output("\n\n\"<i>Fuck!</i>\" Kimber shouts along with your thrusts. \"<i>Fu-u-u-u-ck, ahhh....</i>\" Her tongue lolls out of her mouth for a moment, and her pussy clenches down hard on your [pc.cockBiggest]. She's close, you can tell, and it's all you can to do hold on and not blow it before she comes.");
		output("\n\nShe leans back on one thrust, her cunt coming down hard and squeezing your [pc.biggestSheath], then lets go of your hands, throws herself forward, and makes her boobs land on your [pc.chest]. \"<i>Grab my ass,</i>\" she gasps. \"<i>I know, tits, but grab my ass and go harder, I'm gonna come!</i>\"");
		output("\n\nThere's no way to say no to that. You whip your arms around and grab two handfuls of Kimber's round ass, making her yelp. She moans, her face inches from yours, as you thrust into her as hard and deep as you can. Her whole body goes tense, and she cries out as the orgasm hits her, that last squeeze from her cunt pushing you right over the edge.");
		output("\n\nYour orgasm feels like it hits your entire body, and your [pc.cockBiggest] spasms within her, [pc.cum] shooting out in squirt after squirt, bathing her insides as you let out a long, loud groan.");
		if (pc.cumQ() >= 10000) output(" The torrent from your cock flows like a river, and you gush out enough to make Kimber's belly swell against your [pc.belly]. Your cum shoots out of her, spewing across your [pc.legs] and hers, flooding over the lower half of the mattress and dripping down to the floor.");
		else if (pc.cumQ() >= 6000) output(" You keep gushing, spewing out [pc.cum] until you feel Kimber's belly swelling against your [pc.belly]. A few long streams pour out of her pussy, staining your [pc.thighs] and hers.");
		output(" You collapse beneath Kimber as soon as it's over, out of breath and sweating.");
		output("\n\nKimber, limp and moaning above you, isn't much better off. Her hair's plastered to her forehead with sweat, and her pale skin is completely flushed, making it look like she just ran a marathon. Her eyes are half-closed, and she has a huge grin on her face. \"<i>Damn,</i>\" she breathes, drawing out the word. \"<i>You fuck like a New Texas native.</i>\" She giggles. \"<i>And trust me, that's a huge compliment, coming from one.</i>\" She takes a deep breath, then hoists herself off of you, her sweaty boobs sticking to you for a moment as she pulls away.");
		if (pc.cumQ() >= 6000)
		{
			output("\n\nKimber looks down at the mess you made of her thighs, and pats the slight swelling of her belly. \"<i>And you cum like the boys back home too,</i>\" she says with a laugh.");
			if (pc.cumQ() >= 10000)
			{
				output(" She then looks at the sheer amount of cum you spewed out. \"<i>Wow,</i>\" she adds. \"<i>That's impressive. Never been so glad to have the cleaning tech on this ship.</i>\"");
				if (pc.balls <= 0) output(" She gives you a curious look. \"<i>Where the hell were you keeping all that?</i>\"");
				output(" She shakes her head.");
			}
			output(" \"<i>Not that I don't like finishing up with a belly full of cum, but there's always the clean-up.</i>\" ");
		}
		else output("\n\n");
		output("Kimber gives you an inviting look. \"<i>I don't know about you, but a hot shower's the best cooldown for me. You want to wash me off?</i>\"");
	}
	else
	{
		output("\n\nSlowly, Kimber brings her gleaming pussy down onto your hardlight horsecock. As her lips squeeze over the ring at the cock's middle, she moans out, \"<i>Oh, that's the stuff.</i>\" She lowers herself atop you, her pussy slipping around the red dildo like it was made for it, pressure from her descent rubbing against [pc.oneVagina]. Kimber keeps her slide down slow and controlled, her shapely thighs lowering to rest against your [pc.thighs] as her cunt swallows up the hardlight and comes to rest atop its base. You let out a quiet moan as the hardlight's base rubs against you.");
		output("\n\n\"<i>Ooooh....</i>\" Kimber moans, rocking back and forth a little, like she's getting used to the feeling of the dildo inside her. Her boobs sway with the motion, their movements hypnotic. You reach up and start to stroke them, and Kimber's eyes open wide, like that somehow woke her up.");
		output("\n\n\"<i>Aah,</i>\" she breathes, grinning. \"<i>Going right for it, ain't you?</i>\" She starts circling her hips, pushing down harder on the glowing horsecock. You push back against her again, moving your [pc.hips] back and forth, stroking the sides of her breasts as she tilts her head back and moans.");
		output("\n\nKimber leans forward, pushing her tits against your hands as her hips swivel faster. Her motions push against [pc.oneVagina], sending shivers through you, and you angle your hips just a little differently, searching for the perfect spot. You shift your hands and rub her nipples with your thumbs, flicking the pink peaks back and forth in time with your thrusts, your fingers squeezing the soft masses.");
		output("\n\nShe tilts her head back and moans, and clamps her hands over yours, squeezing and stroking her boobs right along with you. The motion of her hips speeds up again as you thrust into her, her thighs slapping against yours, her girlcum drooling out with every movement.");
		output("\n\n\"<i>Oh, </i>fuck<i> yes,</i>\" Kimber moans, her eyes squeezed shut tight. You roll her hard nipples between your fingers, switching between that and small pinches as Kimber switches from grinding on you to straight-out thrusting herself down on the hardlight, her mouth hanging open. She grinds harder against you with every thrust, and you force yourself to hold back. The ride's clearly not over yet, and for all she talked about wearing you out, you still want to prove her wrong.");
		output("\n\nShe moans again, and shoves herself forward, slamming her hands down on either side of you and shoving her boobs at your face. You keep your hands in place, letting her tits slap against them as you keep working her nipples. Her hips hammer against yours over and over, the hardlight sliding partway out of her with each thrust only to ram deep into her every time she slides down. She clearly knows how to ride a horsecock right, pulling herself up to the median ring every time and sliding right back down, so she gets that extra stretch with every thrust. Her eyes are open wide now, and she's gasping hard, her face and chest both flushed red.");
		output("\n\nBracing yourself as best you can, you thrust harder, keeping pace with her. She gasps and rears back, then grabs hold of your hands and forces them down to the bed, holding you down as she tries to fuck you right through the mattress. Her tits crush against your [pc.chest], then rise and crash into your face as Kimber moans again. You lick at the soft flesh, hoping to catch a nipple, but Kimber's boobs are bouncing too much for you to get a hold of anything.");
		output("\n\n\"<i>Fuck!</i>\" Kimber shouts along with your thrusts. \"<i>Fu-u-u-u-ck, ahhh....</i>\" Her tongue lolls out of her mouth for a moment, and her pussy clenches down hard on the glowing horsecock. She's close, you can tell, and it's all you can to do hold on and not get off before she comes.");
		output("\n\nShe leans back on one thrust, her cunt coming down hard and grinding the dildo against [pc.oneVagina], then lets go of your hands, throws herself forward, and makes her boobs land on your [pc.chest]. \"<i>Grab my ass,</i>\" she gasps. \"<i>I know, tits, but grab my ass and go harder, I'm gonna come!</i>\"");
		output("\n\nThere's no way to say no to that. You whip your arms around and grab two handfuls of Kimber's round ass, making her yelp. She moans, her face inches from yours, as you thrust into her as hard and deep as you can. Her whole body goes tense, and she cries out as the orgasm hits her. That last grind on [pc.oneVagina] is enough to push you right over the edge.");
		output("\n\nYour orgasm feels like it hits your entire body, and [pc.oneVagina] twitches and shivers as you can't hold back any longer, [pc.girlCum] leaking out around the thong as you let out a long, loud groan.");
		if (pc.isSquirter()) output(" You keep gushing, [pc.girlCum] squirting out of your pussy, staining your [pc.thighs] and hers.");
		output(" You collapse beneath Kimber as soon as it's over, out of breath and sweating.");
		output("\n\nKimber, limp and moaning above you, isn't much better off. Her hair's plastered to her forehead with sweat, and her pale skin is completely flushed, making it look like she just ran a marathon. Her eyes are half-closed, and she has a huge grin on her face. \"<i>Damn,</i>\" she breathes, drawing out the word. \"<i>You fuck like a New Texas native.</i>\" She giggles. \"<i>And trust me, that's a huge compliment, coming from one.</i>\" She takes a deep breath, then hoists herself off of you, her sweaty boobs sticking to you for a moment as she pulls away.");
		if (pc.isSquirter()) output("\n\nKimber looks down at the mess you made of her thighs, and laughs. \"<i>And you cum like some of the girls back home too,</i>\" she says. ");
		else output("\n\n");
		output("Kimber gives you an inviting look. \"<i>I don't know about you, but a hot shower's the best cooldown for me. You want to wash me off?</i>\"");
	}	
	output("\n\nIt takes a moment for you to pull yourself off the bed, but a shower with Kimber is plenty of motivation. You both squeeze into her ship's small shower, and spend as much time soaping each other up as actually trying to get clean. She apologizes for being too worn out at the moment for another round, but you tell her that's okay, you're not sure if you're up for one either.");
	output("\n\nShe clearly wasn't kidding about wearing you out.");
	output("\n\nOnce you're both clean, you and Kimber towel each other off, and you get your clothes back on, while Kimber dons a fluffy robe. \"<i>Thank you, [pc.name],</i>\" she says, \"<i>for showing me a damn good time.</i>\" She leans in and gives you another kiss. \"<i>Hope we can do this again sometime.</i>\"");
	output("\n\nYou tell her that sounds like a fine idea, and that you'll see her again soon.");

	pc.orgasm();
	pc.shower();
	kimberWearOutPC();
	IncrementFlag("KIMBER_SEXED");

	addButton(0, "Next", kimberGoHomePostSex);
}

public function kimberDoHerNow():void
{
	clearMenu();
	clearOutput();
	processTime(10 + rand(6));
	pc.lust(25+rand(int(0.26*pc.libido())));

	output("You tell Kimber that you're up for another round if she is. She downs the rest of her beer, drops her mug on the bar, and gives you a grin. \"<i>Then let's do this, [pc.name].</i>\"");
	output("\n\nThe two of you head back to her ship, and she leads you right into her bedroom. Once you're there, she shoves you up against the wall again, pressing her lips hard against yours.");
	if (pc.hasCock())
	{
		output(" You feel your [pc.cockBiggest] begin to swell");
		if (pc.hasLowerGarment()) output(" within your [pc.lowerUndergarment]");
		if (pc.hasVagina()) output(", and your [pc.vagina] grows wet as well");
		output(", quickly aroused because you know what's coming next.");
	}
	else if (pc.hasVagina())
	{
		output(" You feel your [pc.vagina] begin to grow wet");
		if (pc.hasLowerGarment()) output(" within your [pc.lowerUndergarment]");
		output(", quickly aroused because you know what's coming next.");
	}
	output("\n\nKimber breaks the kiss and gives you a smirk, then takes hold of your hands and puts them on her boobs. You give her a gentle squeeze, and she shivers, then moves your hands to the single button that's straining to keep her labcoat closed. \"<i>All right, Steele,</i>\" she says. \"<i>Let's get naked.</i>\"");
	output("\n\nYou undo the button on her labcoat, and it whips open, leaving her sweater-clad bosom on display. " + (pc.hasArmor() ? "Kimber reaches for your [pc.armor], and soon the two of you are stripping each other out of your clothes, each eager to get the other naked as quickly as possible." : "You help strip Kimber out of the rest of her clothes, eager to get her naked as quickly as possible."));

	if (attachedMimbranes() > 0)
	{
		showKimber();
		output("\n\nAs soon as");
		if (pc.hasArmor()) output(" your [pc.armor] is off and");
		output(" you're standing there " + (pc.hasUpperGarment() || pc.hasLowerGarment() ?"clad only in your underwear" : "naked") + ", Kimber lets out a shout and backs away.");
		output("\n\n\"<i>What the </i>fuck!\" she shouts, pointing at your [pc.crotch]. \"<i>When the hell did you get one of those things on you!</i>\" She's breathing hard, fear clear in her eyes.");
		output("\n\nYou glance down at your [pc.crotch], and realize she's pointing at your attached mimbrane.");
		if (flags["KIMBER_TALKED_MHENGA"] == undefined) output(" You tell Kimber you're not sure what the issue is. Sure, some people might think the mimbranes are a little odd, but they're no stranger than a lot of what's out there.\n\nKimber takes a deep breath, then grabs her labcoat and puts it back on. \"<i>I don't like to talk about it much,</i>\" she says, her voice low, \"<i>but I had a real bad experience back on Mhen'ga. A couple of those damn things hooked onto me, nearly got me killed.</i>\" She fixes her gaze on you, clearly upset. \"<i>I'm not getting near you again with those things on you. You need to leave, right now.</i>\"");
		else output(" That's right. She had a bad experience with mimbranes back on Mhen'ga. Maybe you should have mentioned that you recently had a very different experience with them.\n\n\"<i>I cannot fucking believe you, Steele,</i>\" Kimber says, scowling hard at you. She grabs her labcoat and yanks it back on, covering herself quickly. \"<i>I told you what happened to me. And you seriously thought I'd still fuck you like that?</i>\" She points to the door. \"<i>Get out. Right now.</i>\"");
		output("\n\nYou head for the door, and Kimber clears her throat right as you're about to walk out, making you pause. \"<i>You get yourself cleaned up,</i>\" she says, her voice quivering a little, \"<i>and we can talk about doing this again. But you damn well better be willing to prove to me that you're clean if you want another chance.</i>\"");
		output("\n\nYou nod to her, and head out of her ship.");
		flags["KIMBER_REJECTED_PARASITE"] = 1;
		addButton(0, "Next", kimberGoHomePostSex);
		return;
	}
	
	showKimber(2);
	processTime(5 + rand(6));

	if (!pc.hasLowerGarment() && !pc.hasUpperGarment())
	{
		output("\n\nOnce you're standing there naked, and Kimber's in just her bra and panties, she turns her back to you and presses her ass against your [pc.crotch]. She grabs hold of her own tits, then looks over her shoulder at you.");
		output("\n\n\"<i>Can you undo this thing for me, [pc.name]?</i>\" she asks with a smile. \"<i>My hands are kind of full right now.</i>\"");
		output("\n\nYou snicker, but undo the clasp on her lacy industrial-strength bra, and she lets out a sigh as it comes loose. She drops the garment to the floor, and your hands join hers on her boobs, stroking over the soft flesh. There's room enough for all four hands, and she moans a little, grinding her rear against you.");
		output("\n\nKimber peels off her panties, and she turns and pulls you close as soon as you're both naked, rubbing her leg against your [pc.thigh].");
	}
	else
	{
		output("\n\nOnce you're down to your");
		if (pc.hasUpperGarment()) output(" [pc.upperGarment] and");
		if (pc.hasLowerGarment()) output(" [pc.lowerGarment] and");
		output(" Kimber's in just her bra and panties, she turns her back to you and presses her ass against your [pc.crotch]. She grabs hold of her own tits, then looks over her shoulder at you.");
		output("\n\n\"<i>Can you undo this thing for me, [pc.name]?</i>\" she asks with a smile. \"<i>My hands are kind of full right now.</i>\"");
		output("\n\nYou snicker, but undo the clasp on her lacy industrial-strength bra, and she lets out a sigh as it comes loose. She drops the garment to the floor, and your hands join hers on her boobs, stroking over the soft flesh. There's room enough for all four hands, and she moans a little, grinding her rear against you.");

		output("\n\n");
		if (pc.hasUpperGarment()) output("After a moment, she steps away, then turns and helps you out of your [pc.upperGarment], staring shamelessly at your [pc.chest] the entire time. ");
		if (pc.hasLowerGarment()) output("You drop your [pc.lowerGarment], revealing your [pc.crotch]. ");
		output("Kimber peels off her panties, and she pulls you close as soon as you're both naked, rubbing her leg against your [pc.thigh].");
	}

	output("\n\n\"<i>So, [pc.name],</i>\" Kimber whispers in your ear. \"<i>Now that you've got me like this, what're you feeling up for?</i>\"");

	addButton(0, "Get Ridden", penisRouter, [kimberTakesYouForARide]);
	addButton(1, "Oral", function ():void
	{
		clearMenu();
		clearOutput();
		if (pc.isHerm())
		{
			addButton(0, "Use Penis", penisRouter, [kimberOralCock]);
			addButton(1, "Use Vagina", vaginaRouter, [kimberOralVagina]);
		}
		else if (pc.hasCock()) penisRouter([kimberOralCock]);
		else if (pc.hasVagina()) vaginaRouter([kimberOralVagina]);
	});
	addButton(2, "Anal", penisRouter, [kimberSomethingSomethingAnalIDKMan]);
	if (flags["KIMBER_UTHRA_GIVEN"] != undefined) addButton(3, "Mirror Sex");
	else addDisabledButton(3, "Mirror Sex");
	if (flags["KIMBER_CANDY_GIVEN"] != undefined) addButton(4, "Mutual Mast");
	else addDisabledButton(4, "Mutual Mast");
	if (flags["KIMBER_RUSKVEL_GIVEN"] != undefined) addButton(5, "Get Tied Down");
	else addDisabledButton(5, "Get Tied Down");
	if (flags["KIMBER_SKY_GIVEN"] != undefined) addButton(6, "Pegging");
	else addDisabledButton(6, "Pegging");
	if (flags["KIMBER_RATION_GIVEN"] != undefined) addButton(7, "Shower Sex");
	else addDisabledButton(7, "Shower Sex");
	//[On Top] {only appears if previously offered but not taken, disappears after being taken}

	//Unlike the item listings, sex options that aren't available should be greyed out but visible, so if people see something they want to do, they'll try to figure out how to unlock that scene. [On Top] is an exception, and should not be visible unless it's available.
}

public function kimberTakesYouForARide(cockIdx:int):void
{
	clearMenu();
	clearOutput();
	showKimber(true);
	processTime(45+rand(31));
	
	output("You tell Kimber you're up for another good ride, since she seemed to like it so much before. \"<i>Not gonna say no to that,</i>\" she says, then smirks. \"<i>Let's see if you can make it through this time.</i>\"");
	if (!pc.hasCock()) output(" She steps into her bathroom and returns with her hardlight's thong. You pull it on and activate it, the horsecock glowing bright red.");
	output("\n\nKimber takes you by the shoulders and turns you, then gives you a gentle push. You fall backward onto her bed, landing on the soft mattress, a pile of pillows beneath your head. Kimber follows you a moment later, straddling your [pc.hips] as she lowers herself down, until her glistening pussy rests on your [pc.belly]. She leans forward, her enormous boobs heading right for you.");
	output("\n\n");
	if (pc.tallness <= 5*12) output("Kimber's tits land right on your face, and you're smothered in an avalanche of boob-flesh. Kimber laughs after a second, then lifts her breasts off of you and scoots back a little. \"<i>Sorry about that, [pc.name],</i>\" she says. \"<i>But I don't always get the chance to smother someone with the girls, so I've got to do it a little.</i>\" ");
	output("Her breasts come to rest on your [pc.chest], their soft, warm weight settling atop you, and Kimber leans down for a kiss. Your lips meet, and her tongue slides into your mouth, darting around as your own tongue circles it. Kimber holds the kiss for a while, then pulls away, breathing hard.");
	output("\n\nWith a practiced motion, Kimber tugs one of her boobs forward and pushes it toward you, the pink nipple aimed right at your mouth. You take the nipple in and give it a good, long suck. Kimber gasps, her eyes squeezing closed as you flick the pink flesh with your [pc.tongue]. You reach up and stroke the sides of both her tits, listening as Kimber's breathing grows faster, and you feel a trickle of girlcum slide down the side of your [pc.belly].");
	output("\n\nIt's no surprise someone as boob-focused as Kimber would get off on this, but damn, it's working quickly. You reach for her free nipple and give it a squeeze, then time your sucking with that, throwing in an occasional pinch and nibble as you work Kimber's teats. Her breathing quickens further, and it looks like she's blushing hard, though you can only see part of her face past her tits.");
	output("\n\nKimber lets out a moan that starts to turn into a cry, and pulls away all at once, leaning back as she straddles you. Her face is flushed, as are the tops of her boobs, and she's breathing hard. \"<i>No fair,</i>\" she gasps, \"<i>almost getting me off like that.</i>\" She takes a deep breath, then laughs. \"<i>Not that I mind getting a boob-gasm, but it ain't like I can wear you out like that.</i>\"");
	output("\n\nShe winks at you, then lets out a long breath and leans forward again, planting her hands to either side of you and letting her boobs hang down before you. Slowly, she slides her lower half back, until her pussy hits the base of " + (pc.hasCock() ? "your [pc.cock " + cockIdx + "]" : "the hardlight horsecock") + ". She starts to rub herself against the base, and the friction sends shivers through you. After a few good grinds, she raises her hips and slides her slick cunt up and down the stiff length. " + (pc.hasCock() ? "The sensation of her wet lips on your shaft is amazing, and it's all you can do to not thrust into her right then." : "Her grinding presses the hardlight's base against [pc.oneVagina], like she's rubbing herself and you at the same time.") + " You grin up at her and move your hips in time, pushing back against her, and she moans again.");
	output("\n\n\"<i>You ready for this, Steele?</i>\" Kimber asks, her voice gone low and breathy. You nod, and she runs her tongue over her upper lip, then hoists up her hips.");
	if (pc.hasCock())
	{
		output("\n\nSlowly, Kimber brings her gleaming pussy down onto your [pc.cock " + cockIdx + "].");
		if (pc.cocks[cockIdx].thickness() >= 3) output(" It's still a tight squeeze, and her breath catches as she slides her way down your wide shaft.");
		if (pc.cocks[cockIdx].cType == GLOBAL.TYPE_EQUINE) output(" As her lips squeeze over the ring at your cock's middle, she moans out, \"<i>Oh, that's the stuff.</i>\"");
		output(" She lowers herself atop you, her pussy slipping around your [pc.cock " + cockIdx + "] like it was made to hold you, tight but flexible around your length. Kimber keeps her descent slow and controlled, her shapely thighs lowering to rest against your [pc.thighs] as her cunt swallows up your [pc.cock " + cockIdx + "] and comes to rest atop your [pc.sheath " + cockIdx + "].");
		output("\n\n\"<i>Ooooh....</i>\" Kimber moans, rocking back and forth a little, like she's getting used to the feeling of you inside her.");
		if (pc.cocks[cockIdx].cLength() >= 20) output(" \"<i>Fuck, that's deep,</i>\" she whispers. \"<i>Ain't everyone who can fill me up like that.</i>\"");
		output(" Her boobs sway with the motion, their movements hypnotic. You reach up and start to stroke them, and Kimber's eyes open wide, like that somehow woke her up.");
		output("\n\n\"<i>Aah,</i>\" she breathes, grinning. \"<i>Going right for it, ain't you?</i>\" She starts circling her hips, pushing down harder on your [pc.cock " + cockIdx + "]. You push back against her again, moving your [pc.hips] back and forth, stroking the sides of her breasts as she tilts her head back and moans.");
		output("\n\nKimber leans forward, pushing her tits against your hands as her hips swivel faster. Her pussy squeezes your [pc.cock " + cockIdx + "], the soft walls stroking your shaft, all your length and head wrapped up in that tight slickness. You shift your hands and rub her nipples with your thumbs, flicking the pink peaks back and forth in time with your thrusts, your fingers squeezing the soft masses.");
		output("\n\nShe tilts her head back and moans, and clamps her hands over yours, squeezing and stroking her boobs right along with you. The motion of her hips speeds up again as you thrust into her, her thighs slapping against yours, her girlcum drooling out with every movement.");
		output("\n\n\"<i>Oh, </i>fuck<i> yes,</i>\" Kimber moans, her eyes squeezed shut tight. You roll her hard nipples between your fingers, switching between that and small pinches as Kimber moves from grinding on you to straight-out thrusting herself down on your [pc.cock " + cockIdx + "], her mouth hanging open. Her pussy squeezes you tighter with every thrust, and you force yourself to hold back. The ride's clearly not over yet, and for all she talked about wearing you out, you still want to prove her wrong.");
		output("\n\nShe moans again, and shoves herself forward, slamming her hands down on either side of you and shoving her boobs at your face. You keep your hands in place, letting her tits slap against them as you keep working her nipples. Her hips hammer against yours over and over, your [pc.cockBiggest] sliding partway out of her with each thrust only to ram deep into her every time she slides down.");
		if (pc.cocks[cockIdx].cType == GLOBAL.TYPE_EQUINE) output(" She clearly knows how to ride a horsecock right, pulling herself up to the median ring every time and sliding right back down, so she gets that extra stretch with every thrust.");
		output(" Her eyes are open wide now, and she's gasping hard, her face and chest both flushed red.");
		output("\n\nBracing yourself as best you can, you thrust harder, keeping pace with her. She gasps and rears back, then grabs hold of your hands and forces them down to the bed, holding you down as she tries to fuck you right through the mattress. Her tits crush against your [pc.chest], then rise and crash into your face as Kimber moans again. You lick at the soft flesh, hoping to catch a nipple, but Kimber's boobs are bouncing too much for you to get a hold of anything.");
		output("\n\n\"<i>Fuck!</i>\" Kimber shouts along with your thrusts. \"<i>Fu-u-u-u-ck, ahhh....</i>\" Her tongue lolls out of her mouth for a moment, and her pussy clenches down hard on your [pc.cock " + cockIdx + "]. She's close, you can tell, and it's all you can to do hold on and not blow it before she comes.");
		output("\n\nShe leans back on one thrust, her cunt coming down hard and squeezing your [pc.sheath " + cockIdx + "], then lets go of your hands, throws herself forward, and makes her boobs land on your [pc.chest]. \"<i>Grab my ass,</i>\" she gasps. \"<i>I know, tits, but grab my ass and go harder, I'm gonna come!</i>\"");
		output("\n\nThere's no way to say no to that. You whip your arms around and grab two handfuls of Kimber's round ass, making her yelp. She moans, her face inches from yours, as you thrust into her as hard and deep as you can. Her whole body goes tense, and she cries out as the orgasm hits her, that last squeeze from her cunt pushing you right over the edge.");
		output("\n\nYour orgasm feels like it hits your entire body, and your [pc.cock " + cockIdx + "] spasms within her, [pc.cum] shooting out in squirt after squirt, bathing her insides as you let out a long, loud groan.");
		if (pc.cumQ() >= 10000) output(" The torrent from your cock flows like a river, and you gush out enough to make Kimber's belly swell against your [pc.belly]. Your cum shoots out of her, spewing across your [pc.legs] and hers, flooding over the lower half of the mattress and dripping down to the floor.");
		else if (pc.cumQ() >= 6000) output(" You keep gushing, spewing out [pc.cum] until you feel Kimber's belly swelling against your [pc.belly]. A few long streams pour out of her pussy, staining your [pc.thighs] and hers.");
		output(" You collapse beneath Kimber as soon as it's over, out of breath and sweating.");
		output("\n\nKimber, limp and moaning above you, isn't much better off. Her hair's plastered to her forehead with sweat, and her pale skin is completely flushed, making it look like she just ran a marathon. Her eyes are half-closed, and she has a huge grin on her face. \"<i>Damn,</i>\" she breathes, drawing out the word. \"<i>You still fuck like a New Texas native.</i>\" She giggles. \"<i>And trust me, that's a huge compliment, coming from one.</i>\" She takes a deep breath, then hoists herself off of you, her sweaty boobs sticking to you for a moment as she pulls away.");

		if (pc.cumQ() >= 6000)
		{
			output("\n\nKimber looks down at the mess you made of her thighs, and pats the slight swelling of her belly. \"<i>And you cum like the boys back home too,</i>\" she says with a laugh.");
			if (pc.cumQ() >= 10000)
			{
				output(" She then looks at the sheer amount of cum you spewed out. \"<i>Wow,</i> she adds. \"<i>That's impressive. Never been so glad to have the cleaning tech on this ship.</i>\"");
				if (pc.balls <= 0) output(" She gives you a curious look. \"<i>I still don't know where the hell you keep all that.\"</i>");
				output(" She shakes her head.");
			}
			output(" \"<i>Not that I don't like finishing up with a belly full of cum, but there's always the clean-up.</i>\" ");
		}
		else output("\n\n");
		output("Kimber gives you an inviting look. \"<i>I think after all that, we both need a shower. You want to wash me off?</i>\"");
	}
	else
	{
		output("\n\nSlowly, Kimber brings her gleaming pussy down onto your hardlight horsecock. As her lips squeeze over the ring at the cock's middle, she moans out, \"<i>Oh, that's the stuff.</i>\" She lowers herself atop you, her pussy slipping around the red dildo like it was made for it, pressure from her descent rubbing against [pc.oneVagina]. Kimber keeps her slide down slow and controlled, her shapely thighs lowering to rest against your [pc.thighs] as her cunt swallows up the hardlight and comes to rest atop its base. You let out a quiet moan as the hardlight's base rubs against you.");
		output("\n\n\"<i>Ooooh....</i>\" Kimber moans, rocking back and forth a little, like she's getting used to the feeling of the dildo inside her. Her boobs sway with the motion, their movements hypnotic. You reach up and start to stroke them, and Kimber's eyes open wide, like that somehow woke her up.");
		output("\n\n\"<i>Aah,</i>\" she breathes, grinning. \"<i>Going right for it, ain't you?</i>\" She starts circling her hips, pushing down harder on the glowing horsecock. You push back against her again, moving your [pc.hips] back and forth, stroking the sides of her breasts as she tilts her head back and moans.");
		output("\n\nKimber leans forward, pushing her tits against your hands as her hips swivel faster. Her motions push against [pc.oneVagina], sending shivers through you, and you angle your hips just a little differently, searching for the perfect spot. You shift your hands and rub her nipples with your thumbs, flicking the pink peaks back and forth in time with your thrusts, your fingers squeezing the soft masses.");
		output("\n\nShe tilts her head back and moans, and clamps her hands over yours, squeezing and stroking her boobs right along with you. The motion of her hips speeds up again as you thrust into her, her thighs slapping against yours, her girlcum drooling out with every movement.");
		output("\n\n\"<i>Oh, </i>fuck<i> yes,</i>\" Kimber moans, her eyes squeezed shut tight. You roll her hard nipples between your fingers, switching between that and small pinches as Kimber switches from grinding on you to straight-out thrusting herself down on the hardlight, her mouth hanging open. She grinds harder against you with every thrust, and you force yourself to hold back. The ride's clearly not over yet, and for all she talked about wearing you out, you still want to prove her wrong.");
		output("\n\nShe moans again, and shoves herself forward, slamming her hands down on either side of you and shoving her boobs at your face. You keep your hands in place, letting her tits slap against them as you keep working her nipples. Her hips hammer against yours over and over, the hardlight sliding partway out of her with each thrust only to ram deep into her every time she slides down. She clearly knows how to ride a horsecock right, pulling herself up to the median ring every time and sliding right back down, so she gets that extra stretch with every thrust. Her eyes are open wide now, and she's gasping hard, her face and chest both flushed red.");
		output("\n\nBracing yourself as best you can, you thrust harder, keeping pace with her. She gasps and rears back, then grabs hold of your hands and forces them down to the bed, holding you down as she tries to fuck you right through the mattress. Her tits crush against your [pc.chest], then rise and crash into your face as Kimber moans again. You lick at the soft flesh, hoping to catch a nipple, but Kimber's boobs are bouncing too much for you to get a hold of anything.");
		output("\n\n\"<i>Fuck!</i>\" Kimber shouts along with your thrusts. \"<i>Fu-u-u-u-ck, ahhh....</i>\" Her tongue lolls out of her mouth for a moment, and her pussy clenches down hard on the glowing horsecock. She's close, you can tell, and it's all you can to do hold on and not get off before she comes.");
		output("\n\nShe leans back on one thrust, her cunt coming down hard and grinding the dildo against [pc.oneVagina], then lets go of your hands, throws herself forward, and makes her boobs land on your [pc.chest]. \"<i>Grab my ass,</i>\" she gasps. \"<i>I know, tits, but grab my ass and go harder, I'm gonna come!</i>\"");
		output("\n\nThere's no way to say no to that. You whip your arms around and grab two handfuls of Kimber's round ass, making her yelp. She moans, her face inches from yours, as you thrust into her as hard and deep as you can. Her whole body goes tense, and she cries out as the orgasm hits her. That last grind on [pc.oneVagina] is enough to push you right over the edge.");
		output("\n\nYour orgasm feels like it hits your entire body, and [pc.oneVagina] twitches and shivers as you can't hold back any longer, [pc.girlCum] leaking out around the thong as you let out a long, loud groan.");
		if (pc.isSquirter()) output(" You keep gushing, [pc.girlCum] squirting out of your pussy, staining your [pc.thighs] and hers.");
		output(" You collapse beneath Kimber as soon as it's over, out of breath and sweating.");
		output("\n\nKimber, limp and moaning above you, isn't much better off. Her hair's plastered to her forehead with sweat, and her pale skin is completely flushed, making it look like she just ran a marathon. Her eyes are half-closed, and she has a huge grin on her face. \"<i>Damn,</i>\" she breathes, drawing out the word. \"<i>You still fuck like a New Texas native.</i>\" She giggles. \"<i>And trust me, that's a huge compliment, coming from one.</i>\" She takes a deep breath, then hoists herself off of you, her sweaty boobs sticking to you for a moment as she pulls away.");
		output("\n\n");
		if (pc.isSquirter()) output("Kimber looks down at the mess you made of her thighs, and laughs. \"<i>And you cum like some of the girls back home too,</i>\" she says. ");
		output("Kimber gives you an inviting look. \"<i>I think after all that, we both need a shower. You want to wash me off?</i>\"");
	}

	output("\n\nIt takes a moment for you to pull yourself off the bed, but a shower with Kimber is plenty of motivation. You both squeeze into her ship's small shower, and spend as much time soaping each other up as actually trying to get clean. She apologizes for being too worn out at the moment for another round, but you tell her that's okay, you're not sure if you're up for one either.");
	output("\n\nShe clearly wasn't kidding about wearing you out.");
	output("\n\nOnce you're both clean, you and Kimber towel each other off, and you get your clothes back on, while Kimber dons a fluffy robe. \"<i>Thank you, [pc.name],</i>\" she says, \"<i>for showing me another damn good time.</i>\" She leans in and gives you another kiss. \"<i>Hope you don't make me wait too long before we do this again.</i>\"");
	output("\n\nYou tell her that sounds like a fine idea, and that you'll see her again sometime soon.");

	pc.orgasm();
	pc.shower();
	kimberWearOutPC();
	IncrementFlag("KIMBER_SEXED");

	addButton(0, "Next", kimberGoHomePostSex);
}

public function kimberOralCock(cockIdx:int):void { kimberGivesYouACowlick(cockIdx, true) }
public function kimberOralVagina(vagIdx:int):void { kimberGivesYouACowlick(vagIdx, false) }
public function kimberGivesYouACowlick(genIdx:int, useCock:Boolean):void
{
	clearMenu();
	clearOutput();
	showKimber(true);
	processTime(45+rand(31));

	output("You give Kimber a look and ask her if she's up for you two going down on each other. She meets your eyes and licks her lips, slowly, like she's thinking it over, then gives you a grin.");
	output("\n\n\"<i>Long as you don't mind getting your face ridden, Steele,</i>\" she says, then nods toward her bed. \"<i>But I'm always good for that. Lay your ass down and let's get started.</i>\"");
	output("\n\nYou lay down on the bed, stretching out on the cushy mattress. Kimber steps forward and kneels on the bed's edge, straddling you, then crawls up your body, dragging her tits across you, letting them rub over your [pc.belly] and [pc.chest]. She lifts herself up as she gets close to your head, and stops with her knees to either side of your shoulders. Kimber looks down at you for a moment, one finger lazily circling a bright pink nipple, then smirks.");
	output("\n\n\"<i>Can't say I mind looking down at you like this,</i>\" she says, a blush spreading across her cheeks. \"<i>Oral doesn't wear me out like a good ride does, so maybe I should just keep you down there until I'm good and tired?</i>\" She laughs, and shakes her head. \"<i>Just messing with you, I ain't selfish like that. But I am going first.</i>\"");
	output("\n\nKimber slides her smooth thighs down on either side of your face, the soft skin stroking over your cheeks as she settles herself atop you. Her gleaming pussy looms closer and closer until it's near enough to kiss, and you raise your head a little and give it a long lick. She makes a low moan, and you lick again, then a third time as her juices start to flow.");
	output("\n\nLooking up, you can't see anything beyond Kimber's tits, the two globes looming large enough to block out the ceiling. Kimber still has her hand on one, working away at her nipple, her movements quick and well-practiced. You lick up one of her wet lips, then down the other, then switch sides, going back and forth and up and down as her breathing quickens.");
	output("\n\n\"<i>Oooh….</i>\" Kimber shifts forward a little, pushing her dripping pussy against your mouth and chin. \"<i>Off to a great start there, [pc.name],</i>\" she whispers. \"<i>Keep going...</i>\"");
	output("\n\nYou keep licking in the same pattern, but add in kisses on each lip as you go, gently sucking on one and then the other, making Kimber gasp. She takes hold of her other boob, tugging and pulling at both her nipples, then raises one of them toward her face. A moment later, you hear suckling sounds, and she moans again.");
	output("\n\nTime to pick things up. Since Kimber has her own hands full with her tits, you reach up and stroke your fingers along her ass, then take a firm hold of her round rump. You turn your tongue's efforts to the top of her pussy, and use the tip to tease out her little bud of a clit, the small pink sphere poking out from beneath its hood.");
	output("\n\n\"<i>Mmph!</i>\" The sound of Kimber sucking on her own nipple stops all at once as you run the tip of your tongue over her clit. The busty cowgirl gasps, and a splash of her girlcum spills across your lips and into your mouth, warm and sweet with a faint tang that's uniquely hers. You give her ass a good squeeze and run your tongue up and down her little clit, making her thighs squeeze tighter around your face.");
	output("\n\n\"<i>Oh, fuck,</i>\" Kimber breathes. \"<i>Keep – keep doing that–</i>\"");
	output("\n\nNot that you were going to stop. You slide your [pc.tongue] as far into her pussy as it will go, then slowly drag it across Kimber's clit as you pull it back out, making her whole body quiver. Her hands are digging into her tits, and you can see one nipple sticking out from between her fingers, worked so hard it's almost red.");
	output("\n\nKimber mashes her cunt against your face, her hips thrusting along with your tongue's work, and you hear her start sucking on her own nipple again. You kiss the top of her pussy and start sucking on her clit; there's not much to work with but you're able to get your [pc.lips] around it and still tease it with the tip of your tongue.");
	output("\n\nShe cries out, and drops both her tits at once, sending them slapping against her as they fall. Kimber braces one hand against the wall and drops the other to your [pc.hair], taking hold of you as you lavish your attention on her clit, sucking the bud as more and more of Kimber's girlcum drips down your cheeks and trails down the sides of your neck.");
	output("\n\nKimber's gasping now, her breath catching with every flick of your tongue. Now that her tits are free, you slide your hands up her sides, then reach around her hanging orbs and catch her nipples between your fingers. You flick her nipples along with your sucking on her clit, and she cries out, a wordless chant in time with your work.");
	output("\n\nFinally, Kimber's whole body goes tense, and a new rush of her juices splashes across your face as she gives a breathless cry, her thighs clenching against your cheeks. As her orgasm passes, you gently slow your sucking, then return to running your tongue up and down her pussy lips, letting her come down as she breathes heavily above you.");
	output("\n\nKimber releases her hold on your hair and sags back, her ass resting against your [pc.chest], a single drop of sweat trailing through her cleavage. \"<i>Fuck,</i>\" she gasps. \"<i>I don't usually... come so fast from getting licked, but...</i>\" She lets out a shuddering breath. \"<i>Damn, you're good.</i>\"");
	output("\n\nAfter a moment, Kimber slowly lifts herself up, and you smirk at her, though your face is still covered in her fluids. She swings herself back to straddle you, planting her dripping pussy right on your [pc.chest], and slides herself backward, leaving a sticky trail all down you as she moves in for a kiss. Kimber slips her tongue into your mouth, flicking it around as though imitating what you just did to her clit, then pulls back and licks her girlcum off your cheeks and neck. She keeps sliding down you, kissing the whole way, until she reaches your [pc.crotch].");
	output("\n\n\"<i>And now,</i>\" she says, waggling her eyebrows at you, \"<i>payback.</i>\"");

	if (useCock)
	{
		output("\n\nKimber leans down and plants a kiss right on your [pc.cockHead " + genIdx + "]. She keeps the kiss going as your [pc.cock " + genIdx + "] swells, her lips wrapping around the head as it expands into her mouth. She runs her tongue in circles around your dong's head, sliding it farther into her mouth each time, until she's licking and sucking her way down your [pc.sheath " + genIdx + "].");
		output("\n\nYou slide your hands behind your head and prop it up, watching Kimber at work. She meets your eyes and smirks around your dick, then slowly pulls back, only to lean forward and lick all the way down to your dick's base, until your entire length is hard and wet.");
		if (pc.cocks[genIdx].cLength() <= 7)
		{
			output("\n\nKimber gives your [pc.cock " + genIdx + "] a look, then glances at her tits, then back at your dick. She chuckles, then hefts her boobs forward and wraps them around your length. Your [pc.cock " + genIdx + "] completey disappears between her enormous tits, not even the head sticking out.");
			output("\n\n\"<i>Thought that might happen,</i>\" Kimber says, though she's grinning. \"<i>Not everyone's got enough for the girls here.</i>\" She squeezes her boobs around your [pc.cock " + genIdx + "], and you moan as the soft warmth wraps around your length, enveloping your dong in titflesh. Kimber hefts her boobs up and down, titfucking your wet length, then leans forward and sticks her tongue into her cleavage, sliding it across and around your [pc.cockHead " + genIdx + "].");
			output("\n\nYou thrust your [pc.hips] in time with Kimber's motions, shoving your [pc.cock " + genIdx + "] farther up between her tits, and letting her reach your [pc.cockHead " + genIdx + "] more easily. She squeezes her tits in harder, and rubs them up and down your shaft more quickly, the sweet friction sending shivers through you and making you moan.");
			output("\n\nKimber raises her head, then presses your cock harder between her enormous boobs. A wet, squishing sound comes from her cleavage with every thrust, and though your [pc.cockHead " + genIdx + "] is lost somewhere in there, you can feel every motion of her tits on it. Kimber's boobs might be on the large end even for New Texans, but she definitely knows how to use them.");
			output("\n\nYou feel the first hints of your orgasm building, and force the feeling down. No way you're going to pop so quickly, not with your cock buried in so much amazing tit. Though if she keeps this up, you might not have much choice.");
			output("\n\nKimber leans down and starts licking your [pc.cock " + genIdx + "] again, shoving her face into her own cleavage and sucking hard on your head, making you groan. Her lips massage the only part of your shaft that's not wrapped in her boobs, and you thrust harder into her mouth, making her tits quake and shudder. Her nipples, still reddened from the rough treatment she was giving them earlier, bounce with every thrust.");
		}
		else
		{
			output("\n\nKimber gives your [pc.cock " + genIdx + "] a look, then hefts her boobs forward and wraps them around your length. Your [pc.cockHead " + genIdx + "] sticks up from between her enormous tits, lined up perfectly with her mouth.");
			output("\n\n\"<i>Always good to see that,</i>\" Kimber says, grinning. \"<i>Not everyone's got enough for the girls here, but this is always more fun when I've got the head right where I need it.</i>\" She squeezes her boobs around your [pc.cock " + genIdx + "], and you moan as the soft warmth wraps around your length, enveloping your dong in titflesh. Kimber hefts her boobs up and down, titfucking your wet length, then leans forward and wraps her lips around your [pc.cockHead " + genIdx + "], sliding it into her mouth with a soft moan.");
			output("\n\nYou thrust your [pc.hips] in time with Kimber's motions, shoving your [pc.cock " + genIdx + "] farther up between her tits, watching your [pc.cockHead " + genIdx + "] slip into and out of her mouth. She squeezes her tits in harder, and rubs them up and down your shaft more quickly, the sweet friction sending shivers through you and making you moan.");
			output("\n\nKimber raises her head, then presses your cock harder between her enormous boobs. A wet, squishing sound comes from her cleavage with every thrust, and though she's still licking your [pc.cockHead " + genIdx + "], it's easy to lose track of that when you can feel every motion of her tits on your shaft. Kimber's boobs might be on the large end even for New Texans, but she definitely knows how to use them.");
			output("\n\nYou feel the first hints of your orgasm building, and force the feeling down. No way you're going to pop so quickly, not with your cock buried in so much amazing tit. Though if she keeps this up, you might not have much choice.");
			output("\n\nKimber leans down and takes even more of your [pc.cock " + genIdx + "] into her mouth, shoving her face into her own cleavage and sucking hard on your head, making you groan. Every inch of your dick is either between her lips or wrapped in her boobs, and you thrust harder into her mouth, making her tits quake and shudder. Her nipples, still reddened from the rough treatment she was giving them earlier, bounce with every thrust.");
		}		
		output("\n\nThe sensation of Kimber's tongue whipping around your [pc.cockHead " + genIdx + "] and the friction of her tits on your length becomes too much for you to handle. You moan out that you're going to come, and Kimber switches from swirling to sucking, like she wants to make sure she gets every drop of cum out of you before you even start. She gives you one last good hard squeeze as she sucks, and you cry out as the orgasm hits you.");
		output("\n\n[pc.Cum] bursts out of you and into Kimber's mouth, making her moan, and you shudder as she keeps on sucking.");
		if (pc.cumQ() < 3000) output(" She swallows down every squirt, and once you're done, she raises her head from her cleavage, licks her lips and gives you a very satisfied smile.");
		else if (pc.cumQ() < 6000) output(" She swallows your first few squirts, but you've got more than she can handle. Kimber raises her head as you keep shooting [pc.cum], and it arcs into the air, falling down to spatter across her face and tits.");
		else output(" She swallows your first few squirts, but it doesn't take long before it's more than she can handle. Kimber rears back as your [pc.cock " + genIdx + "] fires off shot after shot from between her tits, spewing out enough to cover both her face and her enormous globes, and sending the excess dripping down to spill across her bed and down to the floor.");
		output(" You lay back, breathing hard and feeling utterly drained.");
		output("\n\n\"<i>Damn, Steele,</i>\" Kimber says. \"<i>Not that I doubted, but it's always good to know I've still got it.</i>\"");
		if (pc.cumQ() >= 10000) output(" If Steele makes ridiculous amounts of cum: She wipes your cum from her face, then looks down at her soaked tits and the mess you've made of the bed and the floor. \"<i>And if I can make you cum that much,</i>\" she says with a smirk, \"<i>I'm doing better than I thought.</i>\"");
		else if (pc.cumQ() >= 6000) output(" She wipes your cum from her face and licks off her fingers, then leans forward and cleans off her tits with her tongue, leaning over to both sides to make sure she gets every drop. \"<i>Especially when you show me just how much you liked that.</i>\" She chuckles.");
		output(" She slowly gets to her feet, then holds out a hand to you. \"<i>Shower?</i>\"");
		output("\n\nNo way you could say no to that. You and Kimber squeeze into her shower for another quick clean-up, and towel each other off afterward. She gives your [pc.cock " + genIdx + "] a thorough buffing as she dries you off, and you ask if she's looking for another round.");
	}
	else
	{
		output("\n\nKimber leans down and plants a kiss right above [pc.vagina " + genIdx + "], then slowly kisses her way along the left side of it. Every kiss sends a tingle through you, and she works her way back up, then kisses the top again and makes her way down the other side.");
		output("\n\nYou can feel her breath on [pc.vagina " + genIdx + "] every time she stops kissing you. The sensation is enough that you're already breathing hard, and yet, she hasn't touched it yet.");
		output("\n\nKimber raises her eyes. The look she gives you makes it clear she knows how much of a tease she's being, and she's loving every moment of it. Without breaking your gaze, she plants her lips directly on [pc.vagina " + genIdx + "] and watches as you moan softly.");
		output("\n\nShe gives you a long lick up both lips, but stops short of your [pc.oneClit], her tongue tracing back and forth as she licks her way back down. A few rounds of that, and you can tell why she liked it so much when she did it to you; the constant motion is amazing, each lip feeling like it's getting her full attention at the same time. Kimber then gives you a good, long lick from bottom to top, her tongue stroking over both lips until it reaches the top of [pc.vagina " + genIdx + "], where she gives your [pc.oneClit] a quick kiss.");
		output("\n\nYou gasp, then bite at your lower lip as she lowers her head again, her eyes never leaving yours. You clutch at your [pc.chest] with one hand, digging the other into the bedsheets.");
		output("\n\nKimber's tongue slips over your [pc.oneClit], slowly feeling the way around your hood and teasing your clit out. At the same time, you feel something else pressing against your lips. Kimber slips a finger into [pc.vagina " + genIdx + "], slowly curling it back and forth as her tongue does its work.");
		output("\n\nYour [pc.girlCum] flows around Kimber's finger, giving her plenty of lubrication to slide it into you, the motion just enough out of synch with her flicking tongue to keep you from getting used to either one. Her tongue speeds up, the tip flicking back and forth against your [pc.oneClit], and she leans forward a bit, her upper lip resting against your hood as she slides her finger in farther.");
		output("\n\nStill keeping her eyes on yours, Kimber winks, and slides in a second finger as she starts to suck on your [pc.oneClit].");
		output("\n\nYou cry out at the sudden sensation, intense enough to make you tremble, and flop back onto the bed as Kimber's lips and tongue do amazing things to your [pc.vagina " + genIdx + "]. Her fingers slide in deep, and curl up inside of you, a gentle but constant motion as she seeks out your tenderest spots. You buck your [pc.hips] against her, and clench your hand into her bedsheets, every single suck on your [pc.oneClit] sending maddening waves of pleasure through you. Your other hand flicks your [pc.nipple] back and forth, catching it between your fingers and turning your every breath into a gasp.");
		output("\n\nFinally, you can't hold back anymore. Your [pc.legs] curl around Kimber's back and shoulders, and you cry out, shoving your [pc.vagina " + genIdx + "] into her face as her tongue works its magic. She sucks harder on your [pc.oneClit], her tongue moving back and forth as well, and that sends you over the edge.");
		output("\n\nYour orgasm sends shudders all through you, and you just about pull the sheets off of Kimber's bed, your whole body shaking hard.");
		if (pc.isSquirter()) output(" [pc.vagina " + genIdx + "] sends a stream of [pc.girlCum] splashing onto Kimber's face, and she sputters, but keeps licking even as it drips down her cheeks.");
		output(" Gasping, you slowly come down from Kimber's oral attentions, and her tongue and fingers withdraw. She gives you one long last kiss on [pc.vagina " + genIdx + "], then leans back and grins at you.");
		output("\n\n\"<i>There is something really damn rewarding,</i>\" Kimber says, \"<i>about making someone squirm like that.</i>\" She licks her lips");
		if (pc.isSquirter()) output(", then wipes your [pc.girlCum] from her face and licks off her hand as well");
		output(", then slowly gets to her feet and holds out a hand to you. \"<i>Shower?</i>\"");
		output("\n\nNo way you could say no to that. You and Kimber squeeze into her shower for another quick clean-up, and towel each other off afterward. She gives [pc.vagina " + genIdx + "] a thorough buffing as she dries you off, and you ask if she's looking for another round.");
	}
	output("\n\n\"<i>Hah! Not right now, [pc.name], though I wish I could.</i>\" She gives you an exaggerated frown. \"<i>Nice as it would be to just shower and fuck all day, I've got reports to do and other crap from work to catch up on. And don't you have new and dangerous planets to explore or something?</i>\" She sticks her tongue out at you. \"<i>But I know this ain't going to be the last time we do this.</i>\"");
	output("\n\nYou assure Kimber that it won't be, then get dressed and head back to your ship.");
	
	pc.orgasm();
	IncrementFlag("KIMBER_SEXED");

	addButton(0, "Next", kimberGoHomePostSex);
}

public function kimberSomethingSomethingAnalIDKMan(cockIdx:int):void
{
	clearMenu();
	clearOutput();
	showKimber(true);
	processTime(45+rand(31));
	
	output("You reach down and plant a hand on Kimber's rear, then tell her you're up for a little backdoor action, if she knows what you mean.");
	output("\n\n\"<i>Oh, really?</i>\" Kimber asks, then glances down at the mass of cleavage pressed against you. \"<i>All this boob, and you want my ass?</i>\" She laughs before you can say anything, then gives you a light smack on your [pc.ass]. \"<i>Just kidding you, [pc.name]. I'm just about always good for that. Unless I've recently had a little too much up there… but that's another story. Be back in one sec.</i>\"");
	if (pc.hasCock())
	{
		output("\n\nKimber steps into her bathroom, and returns a moment later with a bottle of lube that has a happy cowgirl's face on the label. \"<i>Sit yourself on down,</i>\" she says, \"<i>and let's get this started.</i>\"");
		output("\n\nYou sit down on the edge of Kimber's bed, and she kneels on the floor in front of you. Your [pc.cock " + cockIdx + "] is already halfway hard, and Kimber gives it a kiss on the [pc.cockHead " + cockIdx + "], then grins up at you as your dick continues to rise. She squirts some of the lube on one hand, then rubs it between her palms, and strokes her hands up and down your shaft. Her slick touch is enough to make your [pc.cock " + cockIdx + "] surge the rest of the way up; she clearly knows exactly how to stroke you.");
		output("\n\nEager to return the favor, you reach forward and slide your hands over Kimber's expansive chest, running your fingertips across her soft skin and getting a small gasp out of her as you start to rub her nipples. A blush spreads across her face and trails down her neck, her breathing quickening as you do your best to stroke over every inch of her massive tits. Her hands continue their work, rubbing you all the way down to your [pc.sheath " + cockIdx + "] and up to your head, slow and steady until you're as stiff as you're going to get, all lubed up and ready for her.");
		output("\n\nKimber runs her tongue over her upper lip as she looks as you, her face still flushed from the attention you're giving her boobs. \"<i>Looks like you're good to go,</i>\" she says");
		if (pc.cocks[cockIdx].cLength() >= 14) output(", then adds, \"<i>I'm not sure if I can take all of this, but I'm damn sure going to try.</i>\" She gives you a grin that makes you think she's set on making that happen");
		output(". \"<i>Just let me do a little….</i>\"");
		output("\n\nShe reaches back with her lubed-up hands, and from her sudden gasp, it's clear that she's just put at least one of her slick fingers up her own ass, maybe more. After a moment, she lets out a breath, then stands and turns, pulling her boobs away from your hands as she grabs a towel from the bathroom door. She wipes her hands clean, then steps toward you again, bends over and leans in close.");
		output("\n\n\"<i>All right, Steele,</i>\" she whispers in your ear. \"<i>Let's see what you can do with this.</i>\"");
		output("\n\nKimber turns and presents her ass to you, her tail lifted high. You plant a kiss on each round cheek, making her laugh. A trail of girlcum is dripping down the inside of one of her thighs. She lowers herself, slowly, and you take hold of your [pc.cock " + cockIdx + "] and aim the head at her little pink asshole. She definitely lubed herself up, but seeing how tight she is back there does make you wonder how often she does this.");
		output("\n\nYour [pc.cockHead " + cockIdx + "] presses against her asshole as she lowers herself, and Kimber gasps. The gasp turns into a moan as you guide the head in, one hand on your shaft and another on Kimber's hip. She starts breathing faster, slowly taking more of your cock into her, the slick, tight warmth pressing on you from all sides.");
		output("\n\n\"<i>Fuck,</i>\" she breathes.");
		if (pc.cocks[cockIdx].thickness() >= 2.5) output(" \"<i>That's… that's thicker than my hardlight, that's for damn sure….</i>\"");
		output(" Kimber slides down farther, planting her hands to either side of you on the bed and pressing her ass down toward your lap. You let out a grunt as her ass swallows up more of your [pc.cock " + cockIdx + "], squeezing you tighter as she works her way down.");
		output("\n\nFinally, Kimber's ass comes to rest against your [pc.thighs], her hole encircling your [pc.sheath " + cockIdx + "], gleaming with lube.");
		if (pc.cocks[cockIdx].cLength() >= 14) output(" Looks like you were right; she was set on taking in the whole thing. And she did it.");
		output(" She's breathing hard, and your [pc.cock " + cockIdx + "] throbs within her, clenched tight inside her ass. You give her a slow, gentle thrust, just a little, and she moans again.");
		output("\n\n\"<i>Aah… always feels different,</i>\" Kimber gasps out, \"<i>with a real dick in there, instead of just my hardlight.</i>\" She laughs a little, though her breath catches as your slow thrusting continues. \"<i>Ain't everyone who goes for this back home. Most of the boys there, all about the pussy, and the tits…</i>\"");
		output("\n\nTaking that as an invitation, you slide your hands up Kimber's hips and reach around to her boobs, squeezing her soft flesh as you keep thrusting, increasing your speed just a little. She's still so very tight around you, and it would be way too easy to start hammering away at her ass until you exploded inside her. Better to make it last so she'll want to do this again.");
		output("\n\nKimber lets out a long moan and leans back against your [pc.chest] as you stroke her nipples, and she starts thrusting back against you, her ass rubbing against your [pc.thighs]. Her movements drive your [pc.cock " + cockIdx + "] further up her ass, like she's trying to take in even more than you have, and you plant your feet on the floor and thrust harder. She cries out, her slick passage clenching around you as her pussy drips onto your [pc.legs].");
		output("\n\nYou give Kimber's hard nipples a squeeze, pinching them in time with your thrusts, making her cry out. \"<i>Fuck! Yes!</i>\" She starts sliding up on your cock and shoving herself back down again, taking the last third into and out of her ass, slapping her rear back down onto your lap and shouting out each time. Her hands clap down over yours on her tits, working her nipples right along with you, making the globes shake and quiver with every thrust. The sound of your flesh slapping together fills the small cabin, and Kimber lets out a long moan.");
		output("\n\nThen, after another few thrusts, she slows down, breathing hard. You slow as well, a little confused. She didn't come, so why is she stopping? Once you've both stopped, Kimber blows out a breath, then looks at you over her shoulder.");
		output("\n\n\"<i>This,</i>\" she breathes, \"<i>feels so fucking good.</i>\" She grins at you. \"<i>But I like looking at who I'm with when they get off. Which means…</i>\"");
		output("\n\nSlowly, Kimber rises up off of your [pc.cock " + cockIdx + "], pulling her ass off your shaft with a low \"<i>mmmmnn</i>\" sound. There's a faint popping noise when she pulls your [pc.cockHead " + cockIdx + "] out, and she laughs. \"<i>Scoot yourself up a little on the bed there, [pc.name],</i>\" she says, \"<i>and let's finish the ride.</i>\"");
		output("\n\nYou move backwards on the bed and lay down, giving her room to straddle you, but keep your feet on the floor for more thrusting power. Kimber wiggles her hips a little as she turns to face you, then climbs onto the bed and stands over you. She slowly lowers herself again, one hand on her tits as she squats down, and you take hold of your [pc.cock " + cockIdx + "] and aim it at her ass.");
		output("\n\nKimber's ass finds your cock as she drops down, and the shaft slides between her bouncy cheeks until your [pc.cockHead " + cockIdx + "] reaches her asshole again. She moans as it slips inside, easier this time, and she eases her ass down onto your cock until it's most of the way in. Her pussy drips onto your [pc.belly], and she starts breathing hard again, then leans back, taking your [pc.cock " + cockIdx + "] all the way up into her. You start thrusting again, picking up the pace quickly, and Kimber groans as her ass clenches tight around you.");
		output("\n\n\"<i>Come here,</i>\" she moans, spreading her arms and reaching toward you. \"<i>I want – </i>aah!<i> – I want you to–</i>\"");
		output("\n\nYou sit up, and Kimber wraps her legs around your lower back, her arms going around your shoulders and pressing your head to her chest. Her ass tightens around your cock, and she shoves herself against you, her legs squeezing as she forces you as deep into her as you can go. The wetness from her dripping pussy trails down to her asshole, mixing with the lube.");
		output("\n\n\"<i>Harder,</i>\" Kimber moans, pressing your face into her heaving cleavage. \"<i>I'm gonna… ahhhh…</i>\"");
		output("\n\nThe squeezing along your entire length is almost too much for you to take. You plant your feet again and thrust as hard as you can, and Kimber lets out a yell, her legs tightening around your back as her asshole keeps up its long, hot squeeze on your [pc.sheath " + cockIdx + "]. You pull back a little, just enough to get your head out of her cleavage, and see her eyes squeezed shut, her face red. She cries out again, her arms and legs going tense around you as her orgasm hits.");
		output("\n\nThe squeeze on your [pc.cock " + cockIdx + "] as she comes is more than you can take. You cry out as you come, your cock twitching within her as [pc.cum] shoots through it and splatters into her ass.");
		if (pc.cumQ() >= 6000) output(" Kimber's ass has no hope of containing the sheer amount of [pc.cum] you make, and jets of it shoot out from around your cock, splattering out to cover the mattress and spill across the floor.");
		else if (pc.cumQ() >= 3000) output(" Your [pc.cum] keeps flowing as you empty yourself out into her. After only a moment, [pc.cum] splatters out around your dick, spilling across your [pc.thighs] and hers.");
		output(" You look at Kimber as the exhaustion hits you, and her half-lidded expression tells you all you need to know. You wore her out just as much as she did you.");
		output("\n\nKimber makes a few attempts at saying something before giving up, and she slowly pulls herself off of your [pc.cock " + cockIdx + "], then rolls over onto her back, her tits billowing out over her chest. \"<i>Fuck,</i>\" she whispers, breathing hard. \"<i>I swear, I won't be walking right for a week after that,</i>\" she says, then gives you a tired grin. \"<i>Worth it!</i>\"");
	}
	else
	{
		output("\n\nKimber steps into her bathroom, and returns a moment later with both her hardlight and a bottle of lube that has a happy cowgirl's face on the label. \"<i>Pull this on, then sit yourself down,</i>\" she says, \"<i>and let's get this started.</i>\"");
		output("\n\nYou don and activate Kimber's hardlight, then sit down on the edge of her bed, and she kneels on the floor in front of you. Kimber gives the hardlight's head a quick kiss, then grins up at you and says, \"<i>I love seeing you wear this, you know that?</i>\" She squirts some of the lube on one hand, then rubs it between her palms, and strokes her hands up and down the glowing red horsecock. She clearly knows exactly how to stroke the hardlight to rub you; every motion up and down results in a delightful pressure against [pc.oneVagina].");
		output("\n\nEager to return the favor, you reach forward and slide your hands over Kimber's expansive chest, running your fingertips across her soft skin and getting a small gasp out of her as you start to rub her nipples. A blush spreads across her face and trails down her neck, her breathing quickening as you do your best to stroke over every inch of her massive tits. Her hands continue their work, rubbing all the way down the hardlight's sheath and up to its head, slow and steady to stimulate you too, until the dildo's all lubed up and ready for her.");
		output("\n\nKimber runs her tongue over her upper lip as she looks as you, her face still flushed from the attention you're giving her boobs. \"<i>Looks like you're good to go,</i>\" she says. \"<i>Just let me do a little…</i>\"");
		output("\n\nShe reaches back with her lubed-up hands, and from her sudden gasp, it's clear that she's just put at least one of her slick fingers up her own ass, maybe more. After a moment, she lets out a breath, then stands and turns, pulling her boobs away from your hands as she grabs a towel from the bathroom door. She wipes her hands clean, then steps toward you again, bends over and leans in close.");
		output("\n\n\"<i>All right, Steele,</i>\" she whispers in your ear. \"<i>Let's see what you can do with this.</i>\"");
		output("\n\nKimber turns and presents her ass to you, her tail lifted high. You plant a kiss on each round cheek, making her laugh. A trail of girlcum is dripping down the inside of one of her thighs. She lowers herself, slowly, and you take hold of the hardlight horsecock and aim the head at her little pink asshole. She definitely lubed herself up, but seeing how tight she is back there does make you wonder how often she does this.");
		output("\n\nThe hardlight's head presses against her asshole as she lowers herself, and Kimber gasps. The gasp turns into a moan as you guide the head in, one hand on the shaft and another on Kimber's hip. She starts breathing faster, slowly taking more of the cock into her, the glowing length disappearing between her round cheeks.");
		output("\n\n\"<i>Fuck,</i>\" she breathes. Kimber slides down farther, planting her hands to either side of you on the bed and pressing her ass down toward your lap. You let out a grunt as her ass swallows up more of the hardlight, the pressure pushing against [pc.oneVagina] as she works her way down.");
		output("\n\nFinally, Kimber's ass comes to rest against your [pc.thighs], her hole encircling the hardlight, gleaming with lube. She's breathing hard, and her every motion rubs you too, sending bursts of pleasure through you. You give her a slow, gentle thrust, just a little, and she moans again.");
		output("\n\n\"<i>Aah… always feels different,</i>\" Kimber gasps out, \"<i>with a person on the other end, instead of just me doing myself.</i>\" She laughs a little, though her breath catches as your slow thrusting continues. \"<i>Ain't everyone who goes for this back home. Most of the boys there, all about the pussy, and the tits…</i>\"");
		output("\n\nTaking that as an invitation, you slide your hands up Kimber's hips and reach around to her boobs, squeezing her soft flesh as you keep thrusting, increasing your speed just a little. Every movement you make rubs you the right way, and it would be way too easy to start hammering away at her ass until you came. As much as she clearly likes to wear people out, it'd be better to make it last so she'll want to do this again.");
		output("\n\nKimber lets out a long moan and leans back against your [pc.chest] as you stroke her nipples, and she starts thrusting back against you, her ass rubbing against your [pc.thighs]. Her movements drive the hardlight further up her ass, like she's trying to take in even more than she possibly could, and you plant your feet on the floor and thrust harder. She cries out, her pussy dripping onto your [pc.legs].");
		output("\n\nYou give Kimber's hard nipples a squeeze, pinching them in time with your thrusts, making her cry out. \"<i>Fuck! Yes!</i>\" She starts sliding up on the horsecock and shoving herself back down again, taking the last third into and out of her ass, slapping her rear back down onto your lap and shouting out each time. Her hands clap down over yours on her tits, working her nipples right along with you, making the globes shake and quiver with every thrust. The sound of your flesh slapping together fills the small cabin, and Kimber lets out a long moan.");
		output("\n\nThen, after another few thrusts, she slows down, breathing hard. You slow as well, a little confused. She didn't come, so why is she stopping? Once you've both stopped, Kimber blows out a breath, then looks at you over her shoulder.");
		output("\n\n\"<i>This,</i>\" she breathes, \"<i>feels so fucking good.</i>\" She grins at you. \"<i>But I like looking at who I'm with when they get off. Which means…</i>\"");
		output("\n\nSlowly, Kimber rises up off of the hardlight, pulling her ass off the glowing shaft with a low \"<i>mmmmnn</i>\" sound. There's a faint popping noise when she pulls the flared head out, and she laughs. \"<i>Scoot yourself up a little on the bed there, [pc.name],</i>\" she says, \"<i>and let's finish the ride.</i>\"");
		output("\n\nYou move backwards on the bed and lay down, giving her room to straddle you, but keep your feet on the floor for more thrusting power. Kimber wiggles her hips a little as she turns to face you, then climbs onto the bed and stands over you. She slowly lowers herself again, one hand on her tits as she squats down, and you take hold of the hardlight and aim it at her ass.");
		output("\n\nKimber's ass finds the glowing cock as she drops down, and the shaft slides between her bouncy cheeks until the flared head reaches her asshole again. She moans as it slips inside, easier this time, and she eases her ass down onto the dildo until it's most of the way in. Her pussy drips onto your [pc.belly], and she starts breathing hard again, then leans back, taking the hardlight all the way up into her. You start thrusting again, picking up the pace quickly, and Kimber groans as she grinds the hardlight against you.");
		output("\n\n\"<i>Come here,</i>\" she moans, spreading her arms and reaching toward you. \"<i>I want – </i>aah!<i> – I want you to–</i>\"");
		output("\n\nYou sit up, and Kimber wraps her legs around your lower back, her arms going around your shoulders and pressing your head to her chest. She shoves herself against you, rubbing the hardlight's base hard against [pc.oneVagina], her legs squeezing as she forces the dildo as deep into her as it can go. The wetness from her dripping pussy trails down to her asshole, mixing with the lube.");
		output("\n\n\"<i>Harder,</i>\" Kimber moans, pressing your face into her heaving cleavage. \"<i>I'm gonna… ahhhh…</i>\"");
		output("\n\nHer rubbing against [pc.oneVagina] is driving you mad. You plant your feet again and thrust as hard as you can, and Kimber lets out a yell, her legs tightening around your back as her ass slaps harder and faster against your [pc.thighs]. You pull back a little, just enough to get your head out of her cleavage, and see her eyes squeezed shut, her face red. She cries out again, her arms and legs going tense around you as her orgasm hits.");
		output("\n\n[pc.OneVagina] can take no more, and you cry out as you come, your [pc.hips] thrusting madly over and over as your entire body shakes.");
		if (pc.wettestVaginalWetness() > 4) output(" Your [pc.girlCum] splatters out around the hardlight, soaking Kimber's ass and your [pc.legs], as well as much of her mattress.");
		output(" You look at Kimber as the exhaustion hits you, and her half-lidded expression tells you all you need to know. You wore her out just as much as she did you.");
		output("\n\nKimber makes a few attempts at saying something before giving up, and she slowly pulls herself off of the hardlight horsecock, then rolls over onto her back, her tits billowing out over her chest. \"<i>Fuck,</i>\" she whispers, breathing hard. \"<i>I swear, I won't be walking right for a week after that,</i>\" she says, then gives you a tired grin. \"<i>Worth it!</i>\"");
	}
	output("\n\nIt's a few minutes before either of you can start to move again. You and Kimber help each other off the bed and to the shower, and clean each other up. True to what she said, Kimber is walking a little funny, and when you're done cleaning up, she pulls you close and gives you a long, deep kiss. It seems her tongue is the only thing about her that's not tired.");
	output("\n\n\"<i>I just don't get why more of the folks back home don't go for that,</i>\" Kimber says, then smiles at you. \"<i>Don't keep me waiting too long before the next round, you hear?</i>\"");
	output("\n\nYou tell her that you won't, and head back to your ship.");

	pc.orgasm();
	pc.shower();
	kimberWearOutPC();
	IncrementFlag("KIMBER_SEXED");

	addButton(0, "Next", kimberGoHomePostSex);
}
/*
public function kimberTakesYouForARide(cockIdx:int):void
{
	clearMenu();
	clearOutput();
	showKimber(true);
	processTime(45+rand(31));

	pc.orgasm();
	pc.shower();
	kimberWearOutPC();
	IncrementFlag("KIMBER_SEXED");

	addButton(0, "Next", kimberGoHomePostSex);
}
public function kimberTakesYouForARide(cockIdx:int):void
{
	clearMenu();
	clearOutput();
	showKimber(true);
	processTime(45+rand(31));

	pc.orgasm();
	kimberWearOutPC();
	IncrementFlag("KIMBER_SEXED");

	addButton(0, "Next", kimberGoHomePostSex);
}
public function kimberTakesYouForARide(cockIdx:int):void
{
	clearMenu();
	clearOutput();
	showKimber(true);
	processTime(45+rand(31));

	pc.orgasm();
	kimberWearOutPC();
	IncrementFlag("KIMBER_SEXED");

	addButton(0, "Next", kimberGoHomePostSex);
}
public function kimberTakesYouForARide(cockIdx:int):void
{
	clearMenu();
	clearOutput();
	showKimber(true);
	processTime(45+rand(31));

	pc.orgasm();
	kimberWearOutPC();
	IncrementFlag("KIMBER_SEXED");

	addButton(0, "Next", kimberGoHomePostSex);
}
*/