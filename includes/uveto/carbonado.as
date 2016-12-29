public function uvetoCarbonadoStore():Boolean
{
	if (hours >= 20 && hours <= 21 && flags["CFS_HANGOUT_EVENT_PENDING"] != undefined)
	{
		cfsGoHangoutTime();
		return true;
	}

	if (!pc.hasStatusEffect("Gwen In Back"))
	{
		if (flags["MET_CFS_GWEN"] == undefined)
		{
			output("\n\nA bored looking");
			if (CodexManager.entryUnlocked("Puazi")) output(" puazi");
			else output(" alien that your codex identifies as a puazi");
		}
		else
		{
			output("\n\nGwen");
		}
		output(" stands behind the counter, eyeing customers and occasionally providing assistance with the automated register. When she gets free time, she thumbs through various comics and fashion magazines on a tablet. A cozy sweater frames her DD-cup breasts, colored to match the shock of deep blue hair behind her heart shaped crest.");
		if (flags["HUNGOUT_CFS"] != undefined)
		{
			output(" She gives you a wave when she sees you, mood brightening instantly.");
			if (flags["FUCKED_CFS_GWEN"] != undefined)
			{
				output(" She pantomimes a growl, throwing a lusty grin in your direction. The dress she's wearing flaunts her heart shaped coloration for all to see, but she makes a point to make sure you see some extra cleavage.");
			}
		}
		else if (flags["MET_CFS_GWEN"] != undefined) output(" When she sees you at the door she gives a dreamy sigh, leaning her chin on both palms and staring.");
	}

	if (flags["MET_CFS_EIMEAR"] == undefined)
	{
		output("\n\nThe other counter is manned by a variety of staff, one of whom stands a head and shoulder's height above the rest. Your codex identifies her as half-ausar, half-bruchandus.");
	}
	else
	{
		output("\n\nEimear walks around managing her counter, towering over her part-time staff and making sure none of them mess anything up.");
	}
	output(" Her swimsuit and sports-bra do precious little to contain her massive chest, and she often re-adjusts the uncomfortable looking garment.");
	if (flags["HUNGOUT_CFS"] != undefined)
	{
		output(" She visibly relaxes when she sees you, stepping aside from her constant supervisory role in case you want to talk.");
	}
	else if (flags["MET_CFS_EIMEAR"] != undefined)
	{
		output(" She gives you a smile and a curt nod when she notices you.");
	}

	if (flags["MET_CFS"] == undefined)
	{
		addButton(0, "Counter", uvetoCarbonadoFirstTime);
	}
	else
	{
		addButton(0, "Counter", uvetoCarbonadoRepeat);
	}

	return false;
}

public function uvetoCarbonadoRepeat():void
{
	clearOutput();
	showCarbonado();

	if (pc.hasStatusEffect("Gwen In Back"))
	{
		output("You walk up to the automated register, finding a catalog of the available wares.");
		//9999 buy shit, straight to autovendormachinething
		addButton(0, "Shop", );
	}
	else
	{
		output("Hey there [pc.name]! Can I help you find anything today?”</i> Gwen asks, flipping the electronic catalog of wares in your direction.");
		uvetoCarbonadoMenu();
	}
}

public function uvetoCarbonadoMenu():void
{
	clearMenu();

	addButton(0, "Shop", );
	addButton(1, "Talk", uvetoCarbonadoTalk, undefined, "Talk", "Ask the mismatched couple some questions.");
	addButton(2, "Hangout", );
	addButton(3, "Massage", );

	if (flags["HUNGOUT_CFS"] != undefined && (hours >= 20 || hours <= 4))
	{
		addButton(4, "Sleepover", );
		addButton(5, "Vidya", );
		addButton(6, "Lewd Massage", );
	}

	addButton(14, "Leave", uvetoCarbonadoLeave);
}

public function uvetoCarbonadoLeave():void
{
	if (hours < 20 && hours > 4 && canTriggerCFSHangoutEvent())
	{
		clearOutput();
		showBust("CFS_GWEN");
		showName("\nGWEN");
		author("Gardeford");

		output("Gwen rushes out to tap you on the shoulder as you leave the store.");
		
		output("\n\n<i>“Hey [pc.name], Me and Emi were wondering if you wanted to come over to our place tonight? We could watch tv or play video games, whatever really. I’m sure you’re in a hurry, but if you wanna come, just meet us here after close. Say, about 20:00? Hope to see you there.”</i> She rushes back into the store, not waiting for an answer.");

		flags["CFS_HANGOUT_EVENT_PENDING"] = 1;
		processTime(2);

		clearMenu();
		addButton(0, "Next", mainGameMenu);
	}
	else
	{
		mainGameMenu();
	}
}

public function showCarbonado():void
{
	showName("\nCARBONADO");
	showBust("CFS_GWEN", "CFS_EIMEAR");
	author("Gardeford");
}

public function uvetoCarbonadoFirstTime():void
{
	clearOutput();
	showCarbonado();

	flags["MET_CFS_GWEN"] = 1;

	output("You wade through the myriad clothing racks, making your way to the main counter. The puazi clerk looks up from her comic, swiping the reader app off her screen. She looks around to make sure no one else has priority in needing help, and upon finding no one gives you a disarming smile and her full attention.");

	output("\n\n<i>“Hi there! Welcome to Carbonado! Is... is there anything I can do to help you-ooo?”</i> she begins. Halfway through the words, her demeanor slackens. Her once alert gaze fades to a dreamy stare, glazed with impure thoughts. Before you can ask her what’s wrong, or do much of anything really, you hear a shout from the other end of the store.");

	output("\n\n<i>“Hang on! Don’t get closer, you’ll only make it worse,”</i> shouts the tall, dark-skinned girl from the far counter. She sprints over, clearing the counter’s distance in a matter of seconds. After making sure the puazi is ok, she gives you a stern look-over. A glistening name-tag on her suit labels her as ‘Eimear’.");

	output("\n\n<i>“You’re not one of the regulars, so I’ll give you the benefit of the doubt. I don’t know if you knew this, but puazi can go into crazy bouts of heat when humans are nearby. There are a couple people who come in every once in a while just to harass poor Gwen here, so forgive me if I sound harsh.");
	if (pc.humanScore() <= 2) output(" You don’t look human, but there must be some in your genes.");
	output("”</i> she says, attempting to push the determined saleswoman away from the counter. Her efforts are impeded by the latter’s batting arms.");

	output("\n\n<i>“It’s ok Eemee, it’s really not a really bad one this time. I can still run the ship. Now, what can I help for you today, [pc.sirMam],”</i> she asks, much to the ausar hybrid’s chagrin. The expression on her face looks anything but levelheaded, but you decide to humor her.");

	clearMenu();
	addButton(0, "Talk", uvetoCarbonadoIntroTalk);
	addButton(1, "Shop", uvetoCarbonadoIntroShop);
}

public function uvetoCarbonadoIntroTalk():void
{
	clearOutput();
	showCarbonado();

	output("You tell the pudgy puazi that you’d like to talk about how she came to run the store. She gives you a dazed smile of half comprehension.");

	output("\n\n<i>“Oooh, coming on to me after just a few minutes, eh? Well, I guess we can go have some fun in the back room,”</i> she says, biting her bottom lip.");

	uvetoCarbonadoIntroMerge();
}

public function uvetoCarbonadoIntroShop():void
{
	clearOutput();
	showCarbonado();

	output("You tell the pudgy puazi that you’d like to see the inventory. She gives you a dazed smile of half comprehension.");

	output("\n\n<i>“Right to the point. I like that. You can see my goods anytime,”</i> she says, beginning to pull her sweater down over her DD-cup chest.");

	uvetoCarbonadoIntroMerge();
}

public function uvetoCarbonadoIntroMerge():void
{
	output("\n\n<i>“O-K, that’s enough front work for you right now. This is why we got the automated register, remember? Let’s go in back and get you taken care of,”</i> the taller woman says, picking her stocky friend up under the arms and then over her shoulder before she can embarrass herself further. The goat-like alien giggles as she’s hefted into the air, nigh oblivious to the situation.");

	output("\n\n<i>“Sorry about this, I’m sure you’re a great [pc.guyGal]. Come back in a bit, ok? We’ll have this all fixed up and you can have some actually meaningful conversation,”</i> she apologizes, flashing the first smile you’ve seen since she came over. <i>“Eemee”</i> carts her tipsy friend into the back room, leaving you alone with the self running register.");

	pc.createStatusEffect("Gwen In Back", 0, 0, 0, 0, true, "", "", false, 60);
}

public function uvetoCarbonadoTalk():void
{
	clearOutput();
	showCarbonado();

	output("It doesn’t look like you’ll be able to talk to both of the owners at once, so you’ll need to choose one. Both appear open for conversation, though Gwen seems to be making extra effort to get your attention. She waves frantically when you look her way, like she’s trying to call a lost cat.");

	uvetoCarbonadoTalkMenu();
}

public function uvetoCarbonadoTalkMenu(lastF:Function = null):void
{
	clearMenu();

	gatedButton({
		id: 0,
		lbl: "Gwen: Puazi",
		f: uvetoCarbonadoTalkPuazi,
		arg: undefined,
		ttH: "Gwen: Puazi",
		ttB: ""
	});

	gatedButton({
		id: 1,
		lbl: "Gwen: Fashion",
		f: uvetoCarbonadoTalkFashion,
		arg: undefined,
		ttH: "Gwen: Fashion",
		ttB: ""
	});

	gatedButton({
		id: 2,
		lbl: "Eimear: Shop",
		f: uvetoCarbonadoTalkShop,
		arg: undefined,
		ttH: "Eimear: Shop Owner",
		ttB: ""
	});

	gatedButton({
		id: 3,
		lbl: "Eimear: Relation",
		f: uvetoCarbonadoTalkEimearRelationship,
		arg: undefined,
		ttH: "Eimear: Relationship",
		ttB: ""
	});

	gatedButton({
		id: 4,
		lbl: "Gwen: Relation",
		f: uvetoCarbonadoTalkGwenRelationship,
		arg: undefined,
		ttH: "Gwen: Relationship",
		ttB: ""
	}, flags["HUNGOUT_CFS"] == undefined);

	gatedButton({
		id: 5,
		lbl: "Eimear: Fam",
		f: uvetoCarbonadoTalkFamily,
		arg: undefined,
		ttH: "Eimear: Family",
		ttB: ""
	}, flags["HUNGOUT_CFS"] == undefined);

	addButton(14, "Back", uvetoCarbonadoMenu);
}

public function canTriggerCFSHangoutEvent():Boolean
{
	if (flags["CFS_TALKED_PUAZI"] == undefined) return false;
	if (flags["CFS_TALKED_FASHION"] == undefined) return false;
	if (flags["CFS_TALKED_SHOP"] == undefined) return false;
	if (flags["CFS_TALKED_EIMEAR_REL"] == undefined) return false;
	if (flags["CFS_HANGOUT_EVENT_PENDING"] != undefined) return false;
	return true;
}

public function uvetoCarbonadoTalkPuazi():void
{
	clearOutput();
	showBust("CFS_GWEN");
	showName("\nGWEN");
	author("Gardeford");

	flags["CFS_TALKED_PUAZI"] = 1;

	output("<i>“So, doesn’t this condition of yours make being a shopkeeper a little tough?”</i> you ask after heading to Gwen’s counter.");
	
	output("\n\n<i>“Not at all! I mean, it might, if I were on a planet with more humans. You might be surprised at how few humans actually come to Uveto for vacation and stuff. It’s nothing like what I imagine Terra is like for a puazi trying to find work. Emi does a pretty good job of dissuading the ones who do want to cause trouble, but most of the local population stay planetside,”</i> she replies, directing a series of taps at the machine beside her.");
	
	output("\n\n<i>“Besides, I’ve got this thing to help people check out. It’s not like this is a crippling disability. All it means is I get a little extra alone time with Emi during the day. She’s the type to get stressed easy, so it works out,”</i> the pudgy puazi explains.");
	
	output("\n\n<i>“Was there anything else you wanted?”</i>");

	processTime(5);
	uvetoCarbonadoTalkMenu(uvetoCarbonadoTalkPuazi);
}

public function uvetoCarbonadoTalkFashion():void
{
	clearOutput();
	showBust("CFS_GWEN");
	showName("\nGWEN");
	author("Gardeford");

	flags["CFS_TALKED_FASHION"] = 1;

	output("<i>“So what made you decide to get into this business?”</i> You ask the puazi saleswoman. She beams, the kind of look that says ‘I’m always prepared for this question.’");
	
	output("\n\n<i>“So when I was little my mom sent pictures into a JoyCo contest. I don’t know if you or your parents were buying JoyCo diapers at the time, but my mom won that contest. I was on all the promotional material for like two years. I still have the pictures saved, see look,”</i> she proclaims, pulling a small tablet from under the desk. She taps through a few menus before turning the screen your way, revealing a picture of a baby puazi wearing a diaper emblazoned with the JoyCo logo. An infectious smile coats her features, only emphasized by the fact that her body’s natural coloration forms a series of hearts.");
	
	output("\n\n<i>“Basically the galaxy’s adorablest baby,”</i> she proudly remarks, scrolling through a number of other baby pictures. You find yourself grinning as she finishes her slideshow, setting the tablet onto the counter between you.");
	
	output("\n\n<i>“But yeah, I don’t feel like paying the mod costs for modeling, so I decided to make a ton of money selling clothes to the people who do! I’m not winning any galactic contests or anything, but last year’s Miss Milky Way had me design her wedding dress,”</i> she brags, turning the tablet toward you again to show off a black-skinned alien in a stark white dress. She stands beside a similarly colored male in a dapper suit, with a large ‘thank you’ scrawled in above the pair. The dress is lined with rich fur, tapering into a long train that lies behind her.");
	
	output("\n\n <i>“I find the design process to be just as much fun as seeing people try on my outfits. My artist friends probably get super annoyed with me, cause I always send designs back for the littlest changes,”</i> she explains with a laugh.");
	
	output("\n\n<i>“When I first started I was so excited to have people who liked my work. Now, and I totally mean to be as cheesy as possible, I’m just happy to spoil Emi at every opportunity,”</i> she finishes, directing a glance at the taller woman.");
	
	output("\n\n<i>“Anything else you wanted to ask about?”</i>");

	processTime(8);
	uvetoCarbonadoTalkMenu(uvetoCarbonadoTalkFashion);
}

public function uvetoCarbonadoTalkShop():void
{
	clearOutput();
	showBust("CFS_EIMEAR");
	showName("\nEIMEAR");
	author("Gardeford");

	flags["CFS_TALKED_SHOP"] = 1;

	output("<i>“So how did you guys manage to get a storefront on the landing station? That can’t be a simple process,”</i> you ask the dusky masseuse, glancinging around at a store that looks beyond the average starter’s price range.");
	
	output("\n\nThe half-bruchandus grins slyly. <i>“You’d think, wouldn’t you. It’s actually an ultra simple process when the building space runs in your family. Somewhere way back on my dad’s side someone got ahold of the rights to own a store here. Before I got here it was a training center and shop for wrestling paraphernalia. Some of the stormguard are really into GWF matches, enough that business kept the store open till my dad could take over. Dad was more into the wrestling than the store owning though, regrettably, so the store fell into a bit of disrepair,”</i> she says with a hint of disappointment.");
	
	output("\n\n<i>“That obviously didn’t last,”</i> You remark with a");
	if (pc.isNice()) output(" smile");
	else if (pc.isMisc()) output(" grin");
	else output(" smirk");
	output(".");
	
	output("\n\n<i>“Oh no. As soon as I was done with college I persuaded him to let me take over. It didn’t take much convincing. After meeting Gwen he was all for us turning the place into something different. We still get some of the old customer base to visit as well. Stormguard warriors occasionally come by the sauna to loosen up before a fight. One of them even challenged me to a fight for a discount once. I don’t think he’d ever seen a bruchandus, much less wrestled with one. I had to promise him I’d destroy the security footage after his first hold slipped right over my head,”</i> she smiles proudly, steepling her fingers and stretching.");
	
	output("\n\n<i>“Don’t tell Gwen, but we make more money on repeat massage customers than people coming in to buy clothing. I think people kinda shy away from her hyper attitude, and she’s garbage at dealing with insurance and the tove contractors. They could probably get her to sign over whatever kind of deal they wanted, even without a human being nearby. We’ve got it in paper that I handle those kind of things though, so even if she did they wouldn’t have anything legal. Now, was there anything else you wanted?”</i>");

	processTime(8);
	uvetoCarbonadoTalkMenu(uvetoCarbonadoTalkShop);
}

public function uvetoCarbonadoTalkEimearRelationship():void
{
	clearOutput();
	showBust("CFS_EIMEAR");
	showName("\nEIMEAR");
	author("Gardeford");

	flags["CFS_TALKED_EIMEAR_REL"] = 1;

	output("<i>“How did you meet Gwen? There’s gotta be a story there,”</i> you inquire whimsically.");
	
	output("\n\n<i>“I-It’s not as fantastic as you think. I know I don’t really look like it, but I was really shy and unsocial in school. I didn’t really talk to anybody and spent most of my time locked in my dorm room. I actually met Gwen in the film and animation appreciation club. We both had the same favorite tv show, and hit it off pretty hard just based on that. It’s a good thing she’s really forward, because I don’t think I’d have ever worked up the courage to ask her out,”</i> Eimear relates with a relieved sigh.");
	
	output("\n\n<i>“She just kept coming over to my room to watch shows and play games. I couldn’t tell her no, and I don’t think I ever wanted to. Before I knew it we were, well, err, physical.”</i> The coal charred cutie gets quieter as she continues, almost seeming to shrink before your eyes. She suddenly slaps herself on the cheek, shaking her head and letting out an exasperated gasp of air.");
	
	output("\n\n<i>“Sorry. Thinking about it makes me remember how nervous I used to be. Before I met her I had no plans to take over this shop. I just wanted to get a job somewhere where no one would notice, and play videogames with the rest of my free-time. I suppose I still play a lot of games, but this is far from low-key living, and I couldn’t be happier about it,”</i> she smiles endearingly as she continues.");
	
	output("\n\n<i>“I asked Gwen to move in with me after we graduated, and even after all that time I was still a little worried that she would say no. She just stared at me and asked what I had thought was going to happen. We live pretty close to the elevator on the surface, so It’s super convenient,”</i> she finishes, looking at you expectantly.");
	
	output("\n\n<i>“Was there anything else you wanted?”</i>");

	processTime(8);
	uvetoCarbonadoTalkMenu(uvetoCarbonadoTalkEimearRelationship);
}

public function uvetoCarbonadoTalkGwenRelationship():void
{
	clearOutput();
	showBust("CFS_GWEN");
	showName("\nGWEN");
	author("Gardeford");

	output("<i>“So I heard about how you met Eimear, got any funny stories or insight you think she might’ve missed?”</i> you ask the puazi shopkeep. She snickers in response, checking Eimear’s place at the far counter before responding.");
	
	output("\n\n<i>“Did she give you the club story? With the adorable nervous tic?”</i> You give a confused nod, wondering where she’s going with this.");
	
	output("\n\n<i>“That is where we met, but the get together isn’t quite as spontaneous and innocent as she tells it. It might sound really shallow, but I’m not big into shy types. Even so, I couldn’t resist a body with near to two feet on me and muscle to back it up. I had to have her. It was the first time I’d swooned that hard without my biology being the instigator,”</i> she runs a hand through her shock of blue hair, biting her lip at memories you can definitely imagine.");
	
	output("\n\n<i>“You didn’t hear this from me, but she might have bumped into one of my friends before a party, and that friend might have offered her something to help her open up. No drugs or anything, just booze. I was hoping it would make her a bit more chatty, but I think she took a bit more than a first timer should. Nothing dangerous, but she doesn’t remember that night, don’t you honey,”</i> she catches Eimear’s eye, still talking to you, but mimicking lovey dovey talk at the unaware beauty across the storefront. She waves and smiles, unable to hear the conversation.");
	
	output("\n\n<i>“Turns out I really underestimated how strong she was. The thought of getting into her pants had crossed my mind, but not until after she’d sobered up and I’d gotten her back to the dorms. She wanted into mine the moment she got there, and barely had enough decency left to not strip me on the dance floor. She just hefted me over her shoulder and carried me out of the ballroom in one arm, straight back to her dorm. She had one of the fancy single rooms, complete with soundproofed walls. She tossed me onto her bed and tried taking off my shirt, but ended up just ripping it right up the middle,”</i> She makes a tracing gesture at");
	if (flags["FUCKED_GWEN"] != undefined) output(" the shape on her chest");
	else output(" the heart shape on her chest.");
	
	output("\n\n<i>“Then she got engrossed with the pattern on my chest, just couldn’t stop giggling. She kept alternating between tracing it with her fingers and kneading my boobs. The oil she secretes keeps her skin super smooth, so it felt <b>really</b> good. It was a big quandary for me, cause I really wanted to be on top, but I also didn’t want to get crushed, so I just let her do her thing. About ten minutes into this she tries to take her top off, and manages to get it stuck on her head. Those tits are bigger than my head when they are contained, so without a bra on she just wrapped my head in a warm bastille of boob.”</i> You can see a blush coat her orange cheeks, spreading to the edge of her darker coloration.");
	
	output("\n\n<i>“The anticipation I felt as her fingers made their way to my cunt had my heart hammering like a spire drill. She didn’t waste any time either, thrusting into me as soon as she found it. The trouble, or I guess it’s not really trouble... actually it’s kinda great. Anyway, the thing about a seven foot tall lover is that three fingers are about as thick as your average cock for a puazi. Bruchandus supposedly use that oil stuff primarily for wrestling, but fuck if it isn’t the perfect lube. I was stuck tight between her and the bed, and her hips are big enough that I could hardly clench mine with her body pressed in that close. All I could do was cum and moan into her cleavage,”</i> She declares, full of energy. She seems to notice how hard she is gripping her tablet, setting it down on the table and taking a breath to relax.");
	
	output("\n\n<i>“She started to slow down pretty quick though. Maybe a minute or so of intense masturbation before she sagged down and fell asleep on top of me. As soon as I recovered my senses I was able to literally slide out from under her. Her oil production skyrockets when she’s aroused, so it was slippery enough that when she wasn’t awake to hold me there I could slip out. I tried my hardest to get her back to a semi dressed state, and then snuck out.”</i> She drums her fingers on the counter.");
	
	output("\n\n<i>“Please don’t tell her about that,”</i> she adds quickly. <i>“I was gonna tell her but she gets really excited telling the innocent story, and that makes me happy. I don’t want one drunk encounter to ruin that enthusiasm. Was there anything else you wanted?”</i>");

	processTime(10);
	uvetoCarbonadoTalkMenu(uvetoCarbonadoTalkGwenRelationship);
}

public function uvetoCarbonadoTalkFamily():void
{
	clearOutput();
	showBust("CFS_EIMEAR");
	showName("\nEIMEAR");
	author("Gardeford");

	output("<i>“So what’s your family like? You mentioned your dad was a wrestler, but what about your mom? How did they meet? What was it like for you growing up?”</i> you ask. The dusky masseuse shifts in place, running a hand through her oil-slicked hair.");
	
	output("\n\n<i>“I was wondering when you’d ask. Most people start with that question. ‘What kind of alien are you? I thought bruchandus couldn’t interbreed?’ Things like that. Most of them also assume my dad is the bruchandus. The ones who know anything about the race hear wrestling and pin it right on him. They couldn’t be more wrong,”</i> she answers, giggling as she remembers something from her past.");
	
	output("\n\n<i>“No, my daddy is Agner <i>“Frozen Wolf”</i> Jessen, ‘The greatest oil wrestler on the planet.’ It was really awesome as a kid, even when I grew up and found out he was the only oil wrestler on the planet. He wasn’t champion of anything, but he did get the odd exhibition game. Turns out people pay pretty good money to see huskar wrestle.”</i>");
	
	output("\n\n<i>“One of those matches was from a big time famous bruchandus wrestler, wanted some good publicity wrestling small time unknowns from around the galaxy. I hear he was actually a really nice guy, but I never got the chance to meet him. When dad got the notification he trained himself near to sickness. I should call and get him to tell you some stories about it, cause they’d just sound really cringeworthy coming from me,”</i> she laments with a shake of her head.");
	
	output("\n\n<i>“Anyway, dad was pretty far into this guy’s galactic wrestle-quest, and at that point I think he had lost maybe one in ten matches. He was some mix of overconfident and bored, so when my dad floored him in the first round he almost lost on the spot. It wasn’t some miracle movie though, and the guy got his footing back in the second round. Dad gave him a run for his money, but didn’t win.”</i> She gets a big grin, leaning a little closer.");
	
	output("\n\n<i>“Didn’t win the fight anyway. One family watching the game had a daughter about my dad’s age, and she was immediately smitten with dad to astronomically cliched levels. So much so that she walked up to him after the match was over, a blushing nervous wreck, and asked him to marry her. Do you know what he said? He said no.”</i> She mocks a frown, shaking her head to match the notion.");
	
	output("\n\n<i>“Now, mom really was that shy, and probably would’ve accepted this outcome, but he offered to get to know her if she wanted another chance to ask. She hastily accepted, getting her parents’ permission to visit him here on Uveto over the next few years, and eventually moving in with him after she finished school. He said yes the second time she asked, the day after she graduated. Her parents weren’t very happy,”</i> she continues, her frown losing its joviality.");
	
	output("\n\n<i>“She really wanted to have a kid, but bruchandus don’t exactly have the same kind of plumbing as huskar, and that kind of change isn’t something an average person can do easily. So she scrounged up all the money she could find, and with dad’s help got a surgery to make her fertile. I happened about a year later,”</i> she says, returning to a slightly happier mood.");
	
	output("\n\n<i>“Mom loved every second of it, even the painful bits. Her parents didn’t. They all but disowned her as soon as they found out she was planning it. My grandmother doesn’t acknowledge that she is one, and sometimes I think she might not admit to people that she has a daughter. My mom had a hard time with it at first, but dad’s parents were more than happy to have a grandchild, and spoiled the everloving fuck out of both me and mom.”</i> The half-bruchandus’ eyes mist a little, but she still laughs as she goes on.");
	
	output("\n\n<i>“Mom didn’t even bat an eye when I told her I was gay, or that my girlfriend was a puazi. The first thing she asked was whether or not she needed to worry about her human friends having been in the house the day before Gwen came for dinner. Dad was just worried about how ‘young’ I was. Not everyone waits till they’re thirty six,”</i> the sable shopkeep looks down, finding her fingers steepled.");
	
	output("\n\n<i>“I’m really happy with my family. It’s nice when thinking with your heart gets you exactly where you want to be,”</i> she finishes.");
	
	output("\n\n<i>“Now that I got that out, did you want anything else?”</i>");

	processTime(12);
	uvetoCarbonadoTalkMenu(uvetoCarbonadoTalkFamily);
}

public function showCfsHangouts():void
{
	showName("GWEN\n& EIMEAR");
	showBust("CFS_GWEN", "CFS_EIMEAR");
	author("Gardeford");
}
public function cfsGoHangoutTime():void
{
	clearOutput();
	showCfsHangouts();

	if (flags["CFS_HANGOUT_EVENT_PENDING"] == 1)
	{
		output("You see the shopkeeper couple exiting their store and walk up to greet them. Gwen waves as she sees you, totally encased in fluffy winter gear.");
		
		output("\n\n<i>“Steele! Glad you could make it. Our place is just down the elevator,”</i> she relates,");
		if (pc.tallness < 54 || pc.tallness > 66) output(" looping her arm under your own to walk alongside you");
		else output(" grasping hold of your hand to walk beside you");
		output(". She pulls you toward the large tunnel, directing you towards the section designated for personnel use. Eimear lines up on your other side, matching her wife’s gesture. You notice a fair share of jealous stares as you enter the elevator, framed by the two alluring aliens.");
		
		output("\n\nDespite the elevators foreboding size, it doesn’t take long at all before you reach the city proper. You let yourself be lead through the main thoroughfare, your guides directing you toward a large condominium. Despite the heat-belt strapped to her waist, steam trails in thin wisps from Eimear’s skin. Even inside the city the cold still nips relentlessly. The three of you take a regular sized elevator up to the fourth floor, stepping out into a short hallway with a single door.");
		
		output("\n\nGwen rummages through her purse, pulling out a slate blue keycard. The door clicks and pops open, revealing an expansive living room complete with cushioned computer gaming areas and a massive projection screen on the wall in front of an equally gigantic couch. Holotapes and videogame consoles border the screen, stacked neatly in short piles. To your right, a large kitchen area dominates the east wall. There are two closed doors along the other walls.");
		
		output("\n\n<i>“This is our house! Over there is our bedroom, and that one is the bathroom. I’m gonna go grab some snacks, so please make yourself at home,”</i> Gwen gushes as you enter. She rushes off to the kitchen, ditching her winter jacket as she goes. Eimear hangs her heat belt on a wall rack by the door, and you follow her as she moves to the couch.");
		
		output("\n\n<i>“I’m thinking an episode of The Flare. The new season is starting up soon, so we can start with the first episode,”</i> she states as you");
		if (!pc.isTaur()) output(" drop yourself onto the cushions");
		else output(" ease your way onto the cushions");
		output(". You sink into the comfortable plush material, taking your time to get situated.");
		if (pc.isGoo()) output(" You’re surprised to find the material wicking away the excess liquid produced by your body, leaving it dry and pillowy.");
		output(" Eimear quickly finds what she is looking for, slotting the holotape into a nearby player and joining you on the couch. Gwen butts in moments later, squishing herself between the two of you with a large bucket of popcorn.");
		
		output("\n\n<i>“Alright! First episode, go!”</i> she says, prompting the device to begin playing.");

		processTime(15+rand(5));
		clearMenu();
		addButton(0, "Next", cfsGoHangoutTimeII);
	}

	flags["CFS_HANGOUT_EVENT_PENDING"] = undefined;
}

public function cfsGoHangoutTimeII():void
{
	clearOutput();
	showCfsHangouts();

	output("A large spaceship cruises through the black expanse of space, following a much smaller ship through an asteroid field, firing weapons as it moves. Inside the ship, a tall, armored knight stands stoically. He glares at the smaller ship through the windows of the control deck.");

	output("\n\n<i>“You have evaded me long enough,”</i> he remarks under his breath. <i>“No one can run from me forever.”</i> Upon the completion of this statement, he is surrounded by a large animated nameplate, large barriers surrounding the name ‘Ironwall, The Turgid Terror.’");

	output("\n\nGwen leans over, cupping a hand to your ear. <i>“That’s Ironwall, he’s a supervillain with the ability to create barriers. His armor enhances latent psionic powers to increase their str-oww”</i> she yelps as Eimear jabs her in the side to shut her up.");

	output("\n\n<i>“Let [pc.himHer] watch”</i>, she whispers.");

	output("\n\nWhen you look back to the show, the focus has changed to what must be the interior of the smaller ship. A man in a rather phallic looking suit of armor sits at the controls, with warning sirens blaring and outside explosions rocking the cockpit. His suit is navy blue, with gauntlets that flare out like metallic horsecocks. Phosphorescent green shades shield his eyes, leaving only a wide grin visible.");

	output("\n\n<i>“Damn him! Hold on guys! It looks like we’ll just have to finish him here and now,”</i> he shouts, a nameplate proclaiming him to be ‘The Flare, Hero of Justice.’ He turns hard on the ship’s controls, moving directly toward the larger craft.");

	output("\n\n<i>“You idiot, you’re going to get us killed!”</i> comes a voice from the ship’s rear quarters.");

	output("\n\n<i>“Not today I’m not, just get ready to jump,”</i> he shouts in reply.");

	output("\n\n<i>“We don’t have the money to buy another ship!”</i>");
	
	output("\n\n<i>“His mind is set, girlie, just hunker down.”</i>");
	
	output("\n\nThe scene switches to a ship’s interior. Robotic soldiers mill about, carrying out various cleaning duties. Suddenly an immense explosion rocks the wall, with the Flare leaping out of the flames, flanked by a sumo-sized man carrying a massive hammer and a robotic centauress wielding a plasma rifle.");

	output("\n\n<i>“This is not an effective strategy!”</i> shouts the centaur, a nameplate labeling her ‘Taurina, master tactician.’. She blasts away some approaching droids, but doesn’t notice a larger one approaching behind her. Before it can attack, it is smashed to pieces by the hammer from before.");

	output("\n\n<i>“How many times have I told you to watch your back. Master technician, bah!”</i> the heavyset titan shouts, hefting his weapon. Ironclad bars label him as ‘Ivan Orgoth, The Shaft of Strength.’");

	output("\n\nRobots with wicked looking sharp bits approach from every side, and the three heroes group in a tight cluster. A loud noise alerts them to the hole their ship punched in the larger spacecraft. A vacuum begins that pulls many of the robots into the vastness of space. Taurina grabs her compatriots, her hooves magnetically anchoring her to the floor. She trudges toward an open hallway, managing to get through just before it closes off, and dropping her cargo to the ground. The two men cough and sputter for a few seconds, steadily recovering their bearings.");

	output("\n\n<i>“Thanks Taurina, we’d be dead without your help,”</i> Flare declares with a grin. The digital display that makes up the mechanical centaurs face shows a blush, and she struggles to find words. She trots down the hallway, huffing and shaking her head.");

	output("\n\n<i>“Damn right you would. Don’t ever let me hear about you going on a mission without me, you’d somehow wind up killing yourself before you got there,”</i> she laments, reaching the end door before they begin to follow. When the group reaches the end of the corridor, Flare presses a button to open the door, only to reveal a wall of armed murderbots, weapons trained on the surprised heroes.");

	output("\n\n<i>“We have you surrounded, don’t move”</i> barks one of the droids, pointing menacingly at the unorthodox ensemble of fighters.");

	output("\n\n<i>“You villains will never stop the motion of justice! You’ve given me enough time to prepare one of my special attacks! Expel, bursting white explosion!”</i> shouts the Flare, punching the air towards the corridor. A pulse of glowing white energy bursts from his gauntlet, washing over the battalion of bots and penetrating their armor. When the light dies down all that’s left is a scrap-heap.");

	output("\n\n<i>“You idiot!”</i> yells Taurina, bashing him on the shoulder before continuing, <i>“That attack leaves your arm unusable for the next hour. What happens if there’s another ambush, or if you need your full strength to stop Ironwall?”</i>");
	
	output("\n\n<i>“You worry too much, Taurina. With you and Ivan by my side, there’s no way he can stop us,”</i> he says, patting her on the back of her tauric half. His left arm hangs limply at his side, fingers twitching on occasion, but otherwise immobile.");

	output("\n\nThe trio make their way forward, reaching the ship’s bridge in a surprisingly short time. After a few steps in the group gives a collective gasp as sapphire energy surrounds the Flare’s companions, locking them inside impenetrable cages of pure energy.");
	
	output("\n\n<i>“You thought to burst in guns blazing against a psionic of my caliber? Perhaps you thought you were being stealthy; I’ve known stupider soldiers,”</i> comes the deep rumbling of Ironwall’s voice. The large captain’s chair turns around to reveal his seated frame.");
	
	output("\n\n<i>“Or maybe you’re brazen enough to think that you can defeat me. I’ve analyzed your techniques, and I know you won’t be able to use that attack again using that arm. Even with the other arm available, that level of power won’t puncture my barriers. I’m going to end your heroic career here and now,”</i> the wicked knight threatens. Globes of evil energy begin to form in his hands, humming menacingly as they grow.");

	output("\n\n<i>“You’ve made a tactical error, Ironwall,”</i> Flare replies, his tone sharp and serious, <i>“assuming that a hero like me is limited to one burst of energy. Double fist armor penetrating technique! Ivory thrust!”</i>");
	
	output("\n\nHe links his hands together as he shouts, a pearl of radiant energy forming between the gauntlets flared tips. Ironwall hisses, diverting the attack orb’s energy into a shield. A tornado of energy picks up around the superhero as he unleashes his attack, firing the tiny orb of force into the shield with enough strength to crack it on impact. Ironwall struggles, releasing Taurina and the shaft and returning the excess power to his main shield.");
	
	output("\n\n<i>“Justice! Flow and extinguish evil’s flame!”</i> The bright flash increases in intensity until nothing can be seen save an expanse of pure white. When the light dies down, Ironwall lies unconscious on the floor. Flare huffs and falls to his knees, breathing heavily. His suit is torn up the right arm, with trails of blood leaking onto the floor.");
	
	output("\n\n<i>“Flare! Are you alright? Your body was too strained for an attack like that,”</i> Taurina exclaims as she rushes to his side, her voice rife with concern. He leans into her support, letting her assist him as he rises.");
	
	output("\n\n<i>“The police will be here soon to take care of Ironwall. You can treat me on the ship while we travel. For now just make sure he’s restrained. If this was all it took to defeat me the galaxy would’ve been overtaken by evil long ago. I won’t let that happen. As long as I live the peaceful inhabitants of the Universe League will have nothing to fear.”</i> The camera zooms in on his face for this increasingly serious monologue before cutting to black. Credits roll, accompanied by an upbeat exit theme.");
	
	output("\n\nGwen grabs your shoulder, beaming at you and tearing your attention away from the tv.");
	
	output("\n\n<i>“So, what did you think?”</i> she asks, cocking an eyebrow.");
	
	//[good][not my thing][garbage]
	processTime(20+rand(3));
	clearMenu();
	addButton(0, "Good", cfsGoHangoutTimeIII, 0);
	addButton(1, "Not My Thing", cfsGoHangoutTimeIII, 1);
	addButton(2, "Garbage", cfsGoHangoutTimeIII, 2);
}

public function cfsGoHangoutTimeIII(resp:uint = 0):void
{
	clearOutput();
	showCfsHangouts();

	switch (resp)
	{
		default:
		case 0:
			output("<i>“That was");
			if (!pc.isBimbo()) output(" awesome");
			else output(", like, the greatest movie I’ve ever seen");
			output("!”</i> you exclaim, prompting an equally giddy nod from Gwen.");

			output("\n\n<i>“I know right! It only gets better as the plot progresses and they work out the kinks. Lots of people quit in the first couple episodes ‘cause they don’t like the writing or some other stupid reason like that. But they have no idea what they’re missing. The writing has improved a million times over the five seasons it’s been running, and even this old stuff has that charm that only begining shows can get.”</i> As she speaks, she shuts off the movie player. You hop up, helping the pair of them to clean up the snacks.");
			break;

		case 1:
			output("\n\n<i>“That was...");
			if (!pc.isBimbo()) output(" not my kind of show");
			else output(" ok I guess, but like, it needs more boobs");
			output(",”</i> you express, prompting an understanding shrug from the excitable puazi.");

			output("\n\n<i>“Oh well, it’s not for everyone. If you ever think about giving it a second chance we could watch one of the movies. They were all made after the initial rough period, so they aren’t quite as cheesy and shoddily written. The first few still have some cheese, but definitely not that bad. If you come over some other time I’m sure we can find something you can have more fun with,”</i> she says as she shuts off the movie player. You rise from the couch, helping the pair with cleaning up snacks.");
			break;

		case 2:
			output("\n\n<i>“That was");
			if (!pc.isBimbo()) output(" pretty terrible");
			else output(" like, the wastiest waste of time. I could’ve been masturbating");
			output(",”</i> you frown, shaking your head and garnering a dejected frown from Gwen.");

			output("\n\n<i>“I’m sorry you feel that way. It really does get better as the series goes on, the writing improves and the characters have meaningful relationships. But If that’s how you feel then I guess we’ll need to find some other way to have fun if you come over some other time,”</i> she says, ending on a much more cheerful note. You rise from the couch, helping the pair with cleaning up snacks.");
			break;
	}

	output("\n\n<i>“Just ask either of us around closing time if you want to hang out again, we’re free most nights,”</i> Gwen explains, bringing you to the door. As you leave the house, Eimear steps out with you and taps you on the shoulder to get your attention.");

	output("\n\n<i>“Hey Steele! One more thing before you go. If Gwen ever has an episode while you’re around, I’d be ok if you, you know, helped her out with it. I already know she’d be up for it, but I just wanted you to know its good with me in case that would be a trouble spot,”</i> she declares, growing more flustered with every word. You can see a blush even through her ebon cheeks, but she grows suddenly somber. <i>“Just don’t fuck her up. If I see her with any kind of drugs or anything that screws up her head I’ll sooner crack yours than call the authorities.”</i>");

	output("\n\nYou gulp, nodding confirmation. At your answer she smiles again, patting you on the shoulder before hopping back.");

	output("\n\n<i>“Great. Hope to see you again soon, tonight was a lot of fun. I’ll tell you what. I’m not as loose as Gwen, but I’ll give you a massage on the house if you want, might even get you off while I’m at it. It’s happened before without me even trying, the poor guy was super embarrassed. Have a great night!”</i> She returns to the house, leaving you to return to the city at large.");

	//return to bottom of elevator
	processTime(15+rand(3));
	currentLocation = "UVI F34";
}