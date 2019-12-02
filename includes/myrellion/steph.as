public function stephHeader(phase:int = 0, nude:Boolean = false):void
{
	author("Savin");
	showName("STEPH\nIRSON");
	showBust(stephBustDisplay(phase, nude));
}
public function stephBustDisplay(phase:int = 0, nude:Boolean = false):String
{
	var sBust:String = "STEPH";
	if(phase >= 2) sBust += "_" + phase;
	if(nude) sBust += "_NUDE";
	return sBust;
}

public static const STEPH_WORK_PORNSTAR:uint = 1;
public static const STEPH_WORK_NEWNETWORK:uint = 2;
public static const STEPH_WORK_DISCOURAGE:uint = 3;

public function stephCampEncounter():void
{
	if (flags["STEPH_WATCHED"] == undefined) return;

	output("\n\nCradled on the edge of the deep abyss sits a small little camp, a single tent and a few crates of supplies likely carried in by the mule drone sitting inactive against the cavern wall.");
	if (flags["STEPH_WORK_CHOICE"] == undefined)
	{
		output(" A camera drone floats around the camp's perimeter, flying over to you and beeping as you approach.");
		addButton(0, "Approach", stephCampApproach);
	}
}

public function stephCampApproach():void
{
	clearOutput();
	stephHeader(5);

	output("You stride over to the small camp, ignoring the beeping little camera drone. As you approach, you note it must be another offworlder’s camp: a hauler drone and a little hovering camera drone are both in plain sight, plus a fairly beefy holo-projector set up where you might have found a fire pit in ages past, projecting flickering images of other Myrellion caverns and local wildlife: chitinous women, heavy-set males, and squirming vine creatures. The silent video is accompanied the faint sound of talking, a woman’s voice tinged with frustration.");
	
	output("\n\nThe camera drone beeps at you and flies into the heart of camp, leading you back to its owner. You step around the tent, and find a woman waiting for you, leaning over the side of the holoprojector and watching the film intently.");
	
	output("\n\nShe’s wearing a khaki ranger outfit, with short shorts that show off a lot of smooth, athletic tanned leg, and a cutoff buttoned shirt that reveals a flat, toned belly and strains against a pair of enormous breasts");
	if (flags["LANDED_ON_TEXAS"] != undefined) output(" that would make any New Texan girl proud");
	else output(" that would look more at home on an ultraporn star than such an obviously outdoorsy woman");
	output(". Several of her buttons have popped off already, and she looks like she might end up shirtless if she breathes in too deep.");
	
	output("\n\nEven her over-stated sexuality can’t keep your attention for more than a moment compared to the rest of her. She was obviously human once, but now sports a pair of big feline ears seated atop her blonde head that twitch as you approach, and her shorts are torn in the back, giving way to a long, squirming green tail; the tip of her tail morphs into what could only be described as a cockhead, your basic bulbous-headed human prick in a distinctly plant like hue.");
	
	output("\n\nDespite all her apparent mutations, there’s no mistaking her: Steph Irson, host of the galaxy’s most famous nature show.");
	
	output("\n\n<i>“Oi,”</i> she says, looking up from her video and crossing her arms under her massive rack. Another button pops off when she does so, leaving her on the precipice of absolute wardrobe failure. Her cock-tipped tail coils up around her leg, its one <i>“eye”</i> winking at you. <i>“So, like, who’re you then?”</i> Steph asks, letting a little bubbly bimbo creep into her otherwise rough New Brisbane accent.");
	
	output("\n\n<i>“Steele. [pc.name] Steele,”</i> you answer, inviting yourself into the Galactic Huntress’s camp. Looking around, you can’t see anybody else around - she must have been talking to herself.");
	
	output("\n\nShe gives you a slight nod and introduces herself, as if half the galaxy couldn’t recognize her. <i>“Stephanie Irson. So, um, what can I do for ya, " + pc.mf("Mr.","Ms.") + " Steele?”</i>");

	//[Autograph] [Her Work] [Her Mutations]
	stephEncounterMenu();
}

public function stephEncounterMenu():void
{
	clearMenu();

	if (!pc.hasKeyItem("Signed Steph Irson Photo")) addButton(0, "Autograph", signMuhTittiesSteph);
	else addDisabledButton(0, "Autograph");

	if (flags["STEPH_WORK_CHOICE"] == undefined) addButton(1, "Her Work", stephEncounterWork);
	else if (flags["STEPH_WORK_CHOICE"] == STEPH_WORK_NEWNETWORK && flags["STEPH_STEELE_SPONSOR"] == undefined) addButton(1, "S.T. Sponsor", stephEncounterSteeleTechSponsor, undefined, "Steele Tech Sponsor", "Maybe Steele Tech could be the sponsor Steph is looking for...");
	else addDisabledButton(1, "Her Work");

	addButton(2, "Mutations", stephEncounterMutations);

	addButton(14, "Back", stephEncounterLeave);
}

public function signMuhTittiesSteph():void
{
	clearOutput();
	stephHeader(5);

	output("<i>“Could I get your autograph?”</i> you ask. Not every day you get to meet a galaxy-famous star.");
	
	output("\n\n<i>“Anything for, like, an adoring fan!”</i> Steph grins and pulls a small holocard from her booty shorts’ pocket, flicking it open to an old publicity photo of her, minus all of her new modifications. She quickly signs the holopic with a finger, following her name with a big, exaggerated heart.");
	
	output("\n\n<i>“There ya go, mate,”</i> she says, handing it to you.");
	
	output("\n\n(<b>Gained Key Item: Signed Steph Irson Photo!</b>)");

	pc.createKeyItem("Signed Steph Irson Photo", 0, 0, 0, 0, "A signed photograph of Steph Irson... given to you by Steph Irson.");

	stephEncounterMenu();
}

public function stephEncounterWork():void
{
	clearOutput();
	stephHeader(5);

	//Note: Once the PC chooses one of the three final options (bold ends), go back to the first menu and grey out [Her Work].
	output("You cast a glance over to the flickering holoprojection of some of the Huntress’s more recent work, and ask her what she was murmuring to herself about before you came up. She blushes a little when you mention that, but plays it off with a chuckle.");

	output("\n\n<i>“I’m just, like, frustrated, is all,”</i> Steph says, rubbing at her temples as she looks at the holoscreen in front of her. <i>“Tryin’ to put together a demo reel for a new network. Wankers I’m workin’ for right now are, like, just the worst ever.”</i>");

	output("\n\n<i>“What’s so bad about them?”</i>");

	output("\n\nThe Huntress makes a face and grunts. <i>“Bunch of network suits tryin’ to tell me how to run my show. Tell me I’m not, like, allowed to go armed or fight back against anything. I remember ‘fore the rush I’d wrestle me a six-tailed trax hound till it ripped all my clothes off and beat me bloody, or I could go grab syrax snakes straight outta the trees on Ausaril and give ‘em big ol’ hugs on camera till they squirted egg-sap out. Now we got some new CEO who’s all like, ‘Oh no, don’t hurt the poor creatures,’ like I don’t know what I’m doing!”</i>");

	output("\n\nGiven what you’ve seen on camera thus far, you’re not entirely sure she DOES know what she’s doing.");

	output("\n\n<i>“So now I basically gotta just get all in the critters’ faces and try and talk about ‘em, but everything Network tells me to do an expo... uh, expo... an episode! Episode on don’t wanna bite or scratch or poison, it’s all sex, sex, sex with everything! Have to throw out half the shows I shoot cuz even the Network’s all like, ‘Oh that’s too ex... uh, too lewd.’”</i>");

	output("\n\nShe huffs in annoyance, pushing a button on her holoprojector. The view switches to a video of Steph being pulled into the lap of a huge");
	if (CodexManager.entryViewed("Sydians")) output(" sydian");
	else output(" chitin-plated insect man");
	output(", his girthy cock buried in her ass to the hilt. A second burly man steps up and unceremoniously jams his rod into Steph’s pussy, trapping her between two muscular chests and thrusts cocks.");

	output("\n\n<i>“See, not so bad,”</i> Steph says defensively, motioning shamelessly towards the outright pornographic video. <i>“I don’t even know what Network wants anymore! Half time time I feel like they’re just sending me to go get fucked by ever critter with a cock - and half the ones without - but then the stupid, mean new CEO pulls so many of the episodes I send her. The best ones, too, the cunt. I have to work three times as hard just to make my weekly shows!”</i>");

	output("\n\n<i>“So you’re trying to switch networks?”</i>");

	output("\n\nSteph fidgets. <i>“Eh, kind of.”</i> Between you, the Huntress’s holographic doppelganger screams silently as the");
	if (CodexManager.entryViewed("Sydians")) output(" sydian");
	else output(" chitinous");
	output(" men cum in her, the camera drone zipping in for a closeup as creamy seed spills out of Steph’s holes. The real Steph Irson in front of you blushes a little as the video plays out, and you can see a pair of dark splotches forming on her shirt as her arousal reaches her saucer-like nipples, eliciting a lactic reaction from her milky rack.");

	output("\n\nContinuing, she says, <i>“I’m puttin’ together a demo tape. Gonna shop it around a little. Between you and me, I’m uh, thinking about sending it to a couple of X-rated networks, ya know?”</i>");

	output("\n\nThe Galactic Huntress going from galaxy’s top xeno-conservationist to top pornstar? That would certainly be a hell of a thing to see - and you have to admit, her recent episodes have certainly taken a twist for the erotic compared to what you remember from back in the day. Still, it doesn’t look like she’s entirely made up her mind about it. Maybe the words of a random stranger in the ass end of some alien world will convince her?");

	clearMenu();
	addButton(0, "Pornstar", stephWorkPornstar, undefined, "Encourage: Pornstar", "Encourage Steph to pursue a life of galactic pornstardom.");
	addButton(1, "NewNetwork", stephWorkNewNetwork, undefined, "Encourage: New Network", "Encourage Steph to find a new, less abusive TV network and get back to actual xeno-conservation rather than just getting reamed by aliens.")
	addButton(2, "Stay", stephWorkStay, undefined, "Discourage: Stay Aboard", "Discourage Steph from switching networks. You sure enjoy her show, just the way it is. Tough it out!");
}

public function stephWorkPornstar():void
{
	clearOutput();
	stephHeader(5);

	output("<i>“X-rated networks? Sounds promising,”</i> you say.");
	
	output("\n\nSteph chuckles. <i>“I know, right? Never thought I’d do something like that, but ever since I did that exp... expos... uh, episode-thing on New Texas, I’ve just felt hornier and hornier... I used to feel bad about all the cute little aliens I’ve been documenting trying to fuck me, but now... I dunno! It’s exciting!”</i>");
	
	output("\n\nHer prior melancholy fades away in the blink of an eye, replaced by bubbly bimbo as she hugs her arms around herself in sudden excitement. <i>“With an X-net I’d, like, be able to do whatever I want with whatever I wanted! I mean, what director’s gonna turn away something like THAT?”</i> she cheers, pointing to her video self being bukakked by several small");
	if (!CodexManager.entryViewed("Raskvel")) output(", scaly");
	else output(" raskvel");
	output(" males. The Steph in front of you giggles as a particularly virile male busts his nut all over her digital face; another tears open the front of her shirt to ram his reptilian cock up between her still fairly mundane breasts, much smaller than the bovine rack she’s sporting now.");
	
	output("\n\n<i>“Mmm, I get excited just thinking about it,”</i> Steph says, her cockvine tail coiling unconsciously behind her, rubbing on her thigh. <i>“I’d love to do stuff like that all the time! I’ve had enough of snakes and lizards and fish; it’s time for the Huntress to hunt a galaxy full of big, throbbing dicks and huge tits!”</i>");
	
	output("\n\nShe manages to collect her thoughts long enough to push a button on the projector, causing the video to vanish. <i>“Right. I’m sending this off to some dirty channels I’ve, um, heard of.”</i>");
	
	output("\n\n<i>“I look forward to seeing your new work,”</i> you say");
	if (pc.isMischievous()) output(", giving the Huntress a playful wink");
	output(".");
	
	output("\n\nSteph giggles as she hits a few more buttons on her device. <i>“Well, thanks for talking, [pc.name]. Nice to meet somebody down ‘ere that wasn’t a fuck-hungry local. Good change of pace, if nothing else!”</i>");
	
	output("\n\nMaybe the next time you see her, somebody like <b>Naughty Wyvern will be sponsoring the Galactic Huntress</b> in her new endeavours.");

	flags["STEPH_WORK_CHOICE"] = STEPH_WORK_PORNSTAR;

	stephEncounterMenu();
}

public function stephWorkNewNetwork():void
{
	clearOutput();
	stephHeader(5);

	output("<i>“Maybe you ought to try a new, safe for work network,”</i> you suggest. <i>“They can’t all be that... abusive.”</i>");
	
	output("\n\nSteph sighs. <i>“Yeah, but it’s hard to find a network that’s gonna let me do what I wanna do. I don’t </i>just<i> wanna be a nature gal anymore... I’m really startin’ to love that mix of business and pleasure, ya know? The first couple times was pretty rough, but now.... I dunno, it’s exciting!”</i>");
	
	output("\n\n<i>“Still, there’s gotta be someone that would let you do... that,”</i> you say, failing to come up with a sufficient descriptor for nature-show-cum-porno.");
	
	output("\n\n<i>“Sure,”</i> she answers, shrugging. <i>“But all the networks gotta have, like, a whole </i>bunch<i> of advertisers lined up. You know, products and commercials and stuff, all sign up. Or get one really big sponsor, like JoyCo or the U.G.C. Scouts. They sponsor me right now. Gettin’ somebody like that to help me out would make moving networks a cinch!”</i>");
	
	output("\n\nHmm... sponsors, huh? Too bad there’s no future-CEO of a mega-corporation around or anything...");

	flags["STEPH_WORK_CHOICE"] = STEPH_WORK_NEWNETWORK;

	stephEncounterMenu();
}

public function stephEncounterSteeleTechSponsor():void
{
	clearOutput();
	stephHeader(5);

	output("<i>“You know,”</i> you say, leaning nonchalantly against the holoprojector. <i>“I might be able to help you with that sponsorship thing.");
	if (pc.isNice()) output(" I have something of an in to Steele Tech.");
	else if (pc.isMischievous()) output(" That Steele half of my name’s there for a reason, you know?");
	else output(" Steele Tech helps you, you bring in ad revenue for me later.");
	output("”</i>");

	output("\n\n<i>“R-really?”</i> Steph says, her silver eyes going wide. <i>“Steele Tech... sponsoring me?”</i>");

	output("\n\n<i>“Sure. I can talk with some people, get the ball rolling. We’d love to have you in family, so to speak.”</i>");

	output("\n\nThe Huntress makes an overjoyed squeal, lunging forward and grabbing you up in a great big hug, pressing her jiggly rack tight against you. You chuckle and pat her back, telling her not to get <i>too</i> excited: you’ll need to get your post as CEO sorted out first, after all, and start talking to your Dad’s old friends in the marketing department.");

	output("\n\n<i>“Still, that’s great! Oh, man. What’re the odds of meetin’ you down here, heir to a big ol’ mega-corp like that? Like destiny or something!”</i>");

	output("\n\nYou can’t say it’s not a hell of a coincidence to run into the Galactic Huntress yourself, either - or that she’s looking for a new corporate sponsor. With any luck, your connections at Steele Tech will help her out, even if you’re not <i>technically</i> the CEO yet. Doesn’t take a genius to see the upside to having Steph Irson preaching the company name, right?");

	output("\n\n<i>“Alright, I’ll go ahead and pack this demo tape up for your company, start shopping around to new networks. I’m so excited! Thank you so much, [pc.name]!”</i>");

	output("\n\nHopefully the next time you see her, <b>Steph Irson will be working for Steele Tech</b>");

	flags["STEPH_STEELE_SPONSOR"] = 1;

	stephEncounterMenu();
}

public function stephWorkStay():void
{
	clearOutput();
	stephHeader(5);

	output("<i>“You really think you’re going to find a better network out there? Come on, it’s amazing that whoever you’re working for lets you do... whatever it is you do as it is. Stick with ‘em. It’ll get better.”</i>");
	
	output("\n\n<i>“You really think so?”</i> Steph says, sighing. <i>“I love what I do, but c’mon, the Network just wastes my time. Make me feel, like, like a piece of meat on parade. They don’t care what happens to me.”</i>");
	
	output("\n\nYou shrug. <i>“Maybe so. But they’re the only way you get to");
	if (pc.isAss()) output(" keep whoring yourself out to monsters on camera");
	else output(" sex up monsters on camera for the galaxy");
	output(".”</i>");
	
	output("\n\n<i>“Maybe you’re right,”</i> she sighs. She taps a button on the projector, and the video flickers off. <i>“I ought to stop bitching and get back to work. No point in jacking around thinking, like, wishfully and stuff, right?”</i>");
	
	output("\n\n<i>“Right.”</i>");
	
	output("\n\nYou see a big “DELETE” flash on the projector, and Steph sighs. <i>“Yeah, who am I kidding. I’m just lucky to be where I am. Shouldn’t complain so much.”</i>");
	
	output("\n\nLooks like <b>the Galactic Huntress is sticking with her current network</b>.");

	flags["STEPH_WORK_CHOICE"] = STEPH_WORK_DISCOURAGE;

	stephEncounterMenu();
}

public function stephEncounterMutations():void
{
	clearOutput();
	stephHeader(5);

	output("<i>“That’s quite a set of transformations you’ve racked up,”</i> you say, nodding toward her coiling vine-tail for emphasis.");
	
	output("\n\nSteph giggles, causing her oversized bust to jiggle under her shirt. <i>“Yeah, like, totally! I was super upset when I got these cute little cat-ears, and these new lips the goo-gal I found on Tarkus are pretty weird - and they make me sooo stretchy. But after that big ol’ bull boy on New Texas stuck me with that needle, I guess I just realized all these changes just make me sexier! I love ‘em!”</i>");
	
	output("\n\nAs if for emphasis, her cock-tipped tail coils around her leg, its phallic tip poking out from between her thighs. You cock an eyebrow at the Huntress’s apparent acceptance of her involuntary mutations, but she just plants her hands on her thick hips and grins at you.");

	stephEncounterMenu();
	addDisabledButton(2, "Mutations");
}

public function stephEncounterLeave():void
{
	clearOutput();
	stephHeader(5);

	output("You bid Steph farewell.");
	
	output("\n\n<i>“See ya around, [pc.name],”</i> she calls, beaming at you.");
	if (flags["STEPH_WORK_CHOICE"] != undefined) output(" <i>“Thanks again for the help! You’re an angel! ");
	else output(" <i>“");
	output("I’m gonna pack up and, like, get on out of here. Off to the next big planet with me!”</i>");
	
	output("\n\nYou wave and make your way out of the camp.");

	variableRoomUpdateCheck();
	generateMapForLocation(currentLocation);
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}