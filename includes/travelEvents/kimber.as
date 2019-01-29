/* flaggedy flags:
 * MET_KIMBER: duh
 * KIMBER_SEXED: also duh
 * KIMBER_TALKED_HERSELF: it's the duh hat trick
 * KIMBER_TALKED_WORK: [Her Work]
*/

public function showKimber(nood:Boolean = false, auth:Boolean = true):void
{
	showBust((nood ? "KIMBER_NUDE" : "KIMBER"));
	showName((flags["MET_KIMBER"] == undefined ? "\nCOWGIRL" : "\nKIMBER"));
	if (auth) author("Slab Bulkhead");
}

public function scienceCowAvailable():Boolean
{
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
	//addButton(2, "Flirt" kimberSaysFlirtySentences);
	addButton(14, "Goodbye", function ():void
	{
		clearMenu();
		clearOutput();
		showKimber();
		if (firstEncounter) output("You tell Kimber that it was nice to meet her, and that maybe you'll see her around. She nods and says \"<i>Likewise, Steele,</i>\", then takes her datapad out and starts reading it again.");
		else output("You tell Kimber that you need to get back to what you're doing. She smiles and says, \"All right, then. I'll see you again sometime, [pc.name],</i>\" and pulls out her datapad again.");
		addButton(0, "Next", mainGameMenu);
	});
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
	for (var i:int = 0; i < topics.length; ++i)
		if (i == lastTopic) addDisabledButton(i, topics[i].label);
		else addButton(i, topics[i].label, topics[i].func);
	addButton(14, "Back", kimberMenu);
}

public function kimberSpeaksAboutAScienceCow():void
{
	clearOutput();
	showKimber();
	processTime(5);
	
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
	processTime(10);
	
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
	processTime(10);

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
	processTime(10);
	
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
	
	kimberTalkMenu(3);
}

