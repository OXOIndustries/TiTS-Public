/* flaggedy flags:
 * MET_KIMBER: duh
 * KIMBER_SEXED: also duh
 * KIMBER_TALKED_HERSELF: it's the duh hat trick
 * KIMBER_TALKED_WORK: [Her Work]
 * KIMBER_SEXABLE: [Sex] menu shows up now
 * KIMBER_{MIRROR/TYING/PEGGING}_UNLOCKED: these make sex scenes available
 * KIMBER_{CANDY/RUSKVEL/RATION/UTHRA/SKY}_GIVEN: the return of duh
 * KIMBER_REJECTED_PARASITE: This should be one if the pc had mimbranes *the last time* they tried to sex the cow
*/

public function showKimber(nood:Boolean = false, auth:Boolean = true):void
{
	showBust((nood ? "KIMBER_NUDE" : "KIMBER"));
	showName((flags["MET_KIMBER"] == undefined ? "\nCOWGIRL" : "\nKIMBER"));
	if (auth) author("Slab Bulkhead");
}

public function scienceCowAvailable():Boolean
{
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
	addButton(2, "Flirt", kimberFlirtWithTheCow);
	if (flags["KIMBER_SEXABLE"] == 1) kimberSexButton(3);
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
	if (flags["KIMBER_REJECTED_PARASITE"] != undefined) addDisabledButton(btnSlot, "Sex");
	else addButton(btnSlot, "Sex", (flags["KIMBER_SEXED"] == undefined ? kimberTouchTheCow : kimberDoHerNow));
}

public function kimberLookAtTheCow():void
{
	clearOutput();
	showKimber((flags["KIMBER_SEXED"] != undefined));
	
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
	
	flags["KIMBER_MIRROR_UNLOCKED"] = 1;

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
	
	flags["KIMBER_TYING_UNLOCKED"] = 1;

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
	
	flags["KIMBER_PEGGING_UNLOCKED"] = 1;

	kimberStoryMenu(kimberRaskvelStory);
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

		flags["KIMBER_SEXABLE"] = 1;
		
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

}
public function kimberDoHerNow():void
{

}