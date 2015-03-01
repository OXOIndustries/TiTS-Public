public function hasMetKaede():Boolean
{
	if (flags["ANNOxKAEDE_INTRODUCED"] != undefined) return true;
	if (flags["PUPPYSLUTMAS_2014"] != undefined) return true;
	if (flags["MET_KAEDE"] != undefined) return true;
	return false;
}

public function hasFuckedKaede():Boolean
{
	if (flags["KAEDE_FUCKED"] != undefined) return true;
	return false;
}

public function kaedeHeader():void
{
	showBust("KAEDE");
	showName("\nKAEDE");
	author("Savin");
}

public function findKaedeOnMyrellion():Boolean
{
	if (hasMetKaede() && flags["BEEN_TO_MYRELLION_BAR"] != undefined && flags["MYRELLION_EMBASSY_VISITED"] != undefined)
	{
		output("You see a familiar half-ausar standing in the transport hub, followed closely by a hover-platform laden with crates and boxes stacked head-high, all bearing the label of the RhenWorld mining company. Seeing you, the svelte red-head smiles and waves, her tail wagging quickly behind her.");
		addButton(0, "Kaede", encounterKaedeOnMyrellion, undefined, "Greet Kaede", "Go say “Hi” to your friend.");
	}
	return false;
}

public function encounterKaedeOnMyrellion():void
{
	clearOutput();
	kaedeHeader();

	output("“<i>Hey, [pc.name]!”</i> Kaede says with a smile as you approach, brushing a lock of red hair out of her eyes. Your eyes are instantly drawn to the long, auburn tail wagging happily behind her, vigorously brushing the ground. A black leather jacket is tied around her waist, largely concealing a holster and the wooden grip of a heavy pistol.");
	
	output("\n\nYou greet her in turn,");
	if (hasFuckedKaede()) output(" pulling her into a quick hug. She giggles and returns the gesture, squeezing you tightly.");
	else output(" shaking her hand warmly.");
	
	output("\n\n“<i>So what’s got you all the way out here?”</i> Kaede asks, resting an arm on the handle of the hover-platform following at her heel. Her other hand disappears into the pocket of her jeans. The slight shift of her stance is enough to make her small breasts press against the front of her white tank-top, bringing your eyes back up from her swishing red tail. Prying your eyes away from the halfbreed’s chest, you tell her that");
	if (9999 == 0) output(" you’re looking for a probe your father launched out here onto Myrellion");
	else output(" you’re just passing through");
	output(".");
	
	output("\n\nKaede listens and nods. “<i>Cool. Hey, um, I’m a couple hours early on this delivery,”</i> she says, nodding to the huge stack of crates. “<i>Wanna... I dunno... get a drink or something? I think there’s a bar around here somewhere...”</i>");

	processTime(10);

	// [Drink] [No Thanks]
	clearMenu();
	addButton(0, "Drink", kaedeMyrellionDrinks, undefined, "Drinks", "Take Kaede up on her offer and go grab a drink at the airfield bar.");
	addButton(1, "No Thanks", kaedeMyrellionNoDrinks, undefined, "No Thanks", "Tell Kaede you’re busy. Maybe later!");

}

public function kaedeMyrellionNoDrinks():void
{
	clearOutput();
	kaedeHeader();

	output("You excuse yourself, saying that you’re in the middle of something at the moment.");
	
	output("\n\n“<i>Oh, yeah, no problem,”</i> Kaede says, shrugging nonchalantly. Behind her, you hear the roar of engines as a plane lands in the Federation airfield, puttering towards the terminal. “<i>Looks like that’s my plane, anyway. See you around, [pc.name]!”</i>");
	
	output("\n\nShe claps you on the shoulder and grabs her hover-cart, dragging it off towards the airstrip.");

	processTime(5);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function kaedeMyrellionDrinks():void
{
	clearOutput();
	kaedeHeader();

	output("“<i>Sure,”</i> you say, slipping an arm around Kaede’s slender shoulders. “<i>Sounds like fun.”</i>");
	
	output("\n\n“<i>Great!”</i> she beams, flashing you a smile full of pearly teeth. Turning to one of the gas-masked red myr, she adds, “<i>Hey, this is going to, uh, what’s it called... Kressia or something? Would you mind if I left this here? I didn’t see a baggage check or anything on my way in.”</i>");
	
	output("\n\nThe guard shrugs and takes the cart from her, dragging it off into the red myr terminal and leaving you and your half-ausar companion free to stroll southwards toward the bar. As you’re walking, you ask Kaede what that huge stack of crates was all about.");
	
	output("\n\n“<i>That’s my job in a nutshell,”</i> she laughs. “<i>I’m just a glorified space trucker, when you get right down to it. Most of the big cargo-hauling companies don’t go out into Rush Space - too dangerous, right? So it’s up to us little guys, solo fliers like me, to get supplies out to the new planets. In this case, I accidentally met a V.P. of RhenWorld, and she’s been keeping me busy running out here and a few other planets they’re interested in mining out.”</i>");
	
	output("\n\n“<i>That’s a lucky break,”</i> you say, pushing in the door to the tavern. It’s loud and busy inside, full of spacers and a handful of gold myr pilots off-duty.");
	
	output("\n\nThe sounds of laughing and drinking echo out the open door as you and Kaede walk in. On the way toward the bar, Kaede shrugs");
	if (hasFuckedKaede() && pc.tallness > 70) output(", nestling herself a little tighter into your arm’s hold");
	output(". “<i>I guess. It’s nice having a steady job for once. I don’t know if Anno ever told you, but for a long time I was struggling just to eat noodles and crackers more often than not.”</i>");
	
	output("\n\nYou shake your head - no, Anno never mentioned. Her tail flicks a little in response, though she says nothing.");
	if (pc.originalRace == "ausar") output(" You’re sure that was a relieved gesture, at least.");
	output(" You and Kaede take a seat at the bar, and Kaede flashes a pair of fingers to the bartender.");
	
	output("\n\nA moment later, and a quick word with the ausar girl working behind the bar, and you’ve both got a whiskey on the rocks sitting in front of you.");
	if (pc.mf("m", "f") == "m" && pc.isNice())
	{
		output(" You tsk your tongue as the drinks are dropped off and suggest that you’d have happily covered them.");
	
		output("\n\n“<i>Don’t be old-fashioned,”</i> Kaede teases, rolling her eyes. “<i>Good company’s worth a few credits any day.”</i>");
	}
	
	output("\n\nYou settle in");
	if (pc.isBiped() || pc.isGoo()) output(" on the bar stool");
	else output(" atop your animalistic lower body, resting beside Kaede on her bar stool");
	output(" and sip your drink. Your companion eyes you, fidgeting nervously, clearly waiting for you to speak...");

	processTime(15);
	currentLocation = "609";

	kaedeMyrellionBarTalkMenu();
}

public function kaedeMyrellionBarTalkMenu():void
{
	clearMenu();
	addButton(0, "Her Job", kaedeMyrellionTalkJob, undefined, "Her Job", "Ask Kaede about her space-trucker job.");
	addButton(1, "RenWorld", kaedeMyrellionTalkRenWorld, undefined, "RenWorld", "Ask Kaede about this RenWorld contract she's got.");
	addButton(2, "Herself", kaedeMyrellionTalkHerself, undefined, "Herself", "Ask Kaede a little about, well, Kaede.");
	addButton(3, "Finish", kaedeMyrellionTalkFinish, undefined, "Finish", "Finish your drink.")
}

public function kaedeMyrellionTalkJob():void
{
	clearOutput();
	kaedeHeader();

	output("“<i>So, how’s the cargo hauling business these days?”</i> you ask.");
	
	output("\n\nKaede laughs. “<i>Better than you’d think. Like I said, most of the big hauler companies won’t go into Rush Space, so us little guys pick up a lot of the slack. Used to be I’d be moving little packages, mail, sometimes an emergency part to some mine somewhere. Little shit, but it was something. Now, though, even mega corporations are picking independent pilots up left and right. I’ve had a couple long-term contract offers from JoyCo and Nova, even.”</i>");
	
	output("\n\nYou cock an eyebrow. “<i>But you didn’t take them?”</i>");
	
	output("\n\n“<i>Nah,”</i> she says, gulping down some of her whiskey and sucking in a sharp breath. “<i>Whew, that’s good!”</i> Wiping her mouth and sighing, she says, “<i>No, I didn’t. If I wanted to be some corp’s toady, I’d have just cut the middleman and joined up with GalHaul or Confederate Express. I like the freedom of picking my own jobs, being able to take whatever route I want. A lot of the time I can pick up two or three contracts at the same time for different companies. Plus, this way I own my own ship. Nothing more important than that.”</i>");
	
	output("\n\n“<i>You bought a ship? That’s not cheap,”</i> you say, remembering what Kaede mentioned about noodles and crackers just a few minutes ago.");
	
	output("\n\nShe gives you a wry look. “<i>It wasn’t. I’m still paying </i>Talon<i> off, a chunk out of every paycheck I get. I’m so far in debt over her I can barely see the light, but she’s worth every credit. Every single one,”</i> Kaede says, her lips softening into a far-away smile.");
	
	output("\n\n“<i>Being out here, in space, seeing these strange planets... this is everything I ever wanted. I wouldn’t trade it to for the world.”</i>");
	
	output("\n\nAfter a moment of companionable silence spent drinking, you ask if her work is very dangerous.");
	
	output("\n\n“<i>It can be,”</i> she answers, and she pats her thigh just above where her handgun is slung in its holster. “<i>Pirates and raiders can get away with pretty much anything out here. My ship, </i>Talon<i>, is strapped with as many guns as I could afford. And I’ve got my money’s worth, let me tell you. Hand to God, I’ve torn a pirate ship in half with ‘em at point blank. It’s scary as all hell out here sometimes. I could get captured, enslaved, blown up, or incinerated at pretty much any time for no reason.”</i>");
	
	output("\n\n“<i>Still worth it?”</i>");
	
	output("\n\n“<i>Always,”</i> she laughs, giving you a wink.");

	processTime(10);

	addDisabledButton(0, "Her Job");
}

public function kaedeMyrellionTalkRenWorld():void
{
	clearOutput();
	kaedeHeader();

	output("“<i>So, this RenWorld contract...”</i>");
	
	output("\n\nKaede blushes, cheeks reddening like rosepetals as you start to ask your question. “<i>I, uh, got lucky is all,”</i> she says, running a hand through her crimson hair. “<i>I bumped into a V.P. of the company in an elevator on Tavros. We, uh.... we hit it off, I guess, and she invited me to come do a few jobs for the company.”</i>");
	
	output("\n\n“<i>You hit it off, huh?”</i>");
	
	output("\n\nKaede’s cheeks flush a little darker. She looks like a big, red beet! “<i>I, uh, I mean... um...”</i> she babbles, clapping her hands to her face. You chuckle and pat Kaede’s back, making her canid ears perk.");
	
	output("\n\n“<i>I would have worked for them anyway! I mean, I’ve done work for RhenWorld before, and now that they’re mining here on Myrellion, they need a lot of private ships to move their cargo here and there and all. I just, uh, I guess I jumped to the top of the list.”</i>");
	
	output("\n\nYou eye the blushing halfbreed, and decide to give her a break on the matter. “<i>So, what’re they mining here? Seems pretty dangerous,");
	if (9999 == 9999) output(" what with the war going on");
	else output(" even with the war over with");
	output(".”</i>");
	
	output("\n\n“<i>Must be worth it. They’ve made a pretty big deal with the, uh, something or other Federation here. The ones that control pretty much the whole planet, anyway. From what Ashinari told me, the ant-folk here are working hard to get off-worlders invested here. They’re giving away mining rights away like candy. They’ve got no use for Oxonium, Thorolium, a bunch of other rare elements. Not to mention there’s gold and silver and all that to be had. It’s a rich planet, and a lot of the hard work’s already done. After all, the myr live underground to begin with. Plenty of caverns and tunnels to get RhenWorld and the other mega-corps started.”</i>");
	
	output("\n\nInteresting. “<i>I knew XenoGen was interested in the golds,”</i> you say, thinking back to your initial meeting with Juro, and the hordes of XenoGen employees you’ve seen wandering around. “<i>So the Federation’s courting mining companies, now?”</i>");
	
	output("\n\nKaede nods, taking a big swig of whiskey to mask the lingering traces of her bashful blush. “<i>I guess so? Sorry, I’m not really up to date on xeno-politics. I know things are pretty tense around here, though, especially with the Confederate fleet up in orbit. Everyone looks like they’re sweating bullets here.”</i>");
	
	output("\n\nAin’t that the truth.");
	
	output("\n\n“<i>So what’s RhenWorld shipping out here, anyway?”</i>");
	
	output("\n\n“<i>No idea,”</i> Kaede says with an apologetic shrug. “<i>Mining equipment of some kind, I’d imagine. I know they agreed to pay the Federation in food and medical supplies, so I probably have a few cases of insta-rations in that pallet, too.”</i>");
	
	if (pc.characterClass == GLOBAL.CLASS_SMUGGLER)
	{
		output("\n\n“<i>Is that all?”</i>");
		
		output("\n\nKaede fidgets. “<i>As far as I know, yeah. W-why?”</i>");
		
		output("\n\nYou shrug, and mention it’d be pretty easy to be paying with weapons. Modern weapons that could give one side or the other in this primitive war a huge edge. It’s hardly the first time you’ve seen something like that: a big mega-corporation exploiting the locals with promises of armaments to settle their “<i>local disputes.”</i> The color fades from Kaede’s cheeks as you speak, until you assure her that you’re joking.");
		
		output("\n\nWell, probably.");
	}

	processTime(15);

	addDisabledButton(1, "RenWorld");
}

public function kaedeMyrellionTalkHerself():void
{
	clearOutput();
	kaedeHeader();

	if (hasFuckedKaede()) output("“<i>You know, even after we’ve gotten so close, I still don’t know much about </i>you<i> you say, subtly reaching down until your hand brushes along the curve of Kaede’s ass. She gasps, but as your fingers dance across her jeans, she certainly doesn’t stop you.");
	else output("So, tell me a little bit about yourself,”</i> you suggest, leaning a little closer to the cute half-ausar.");
	
	output("\n\nKaede blinks. “<i>You, uh, you want to know about me?”</i>");
	
	output("\n\nYou nod, and Kaede seems to get lost in thought for a moment, unsure what to say to that. After a bit, she says, “<i>Well, um, alright. Like I said, I’m a cargo hauler. I work for myself, taking contracts and-”</i>");
	
	output("\n\nWith a chuckle, you tell her you want to know about <i>her</i>. There’s got to be more to Kaede than the job, right?");
	
	output("\n\nShe fidgets awkwardly and says, “<i>Uh, right, yeah. So... I my dad’s the lead mechanic on Tavros. I grew up there, you know. Didn’t see a planet until I was ten. I grew up around machines and starships and spacers. I guess I was pretty much destined to be obsessed with space.”</i>");
	
	output("\n\nThinking for a moment, you ask if her dad happens be a fellow by the name of Zeke - the big guy that put your father’s Casstech back together before you quest began.");
	
	output("\n\n“<i>Yeah, that’s him!”</i> Kaede laughs, “<i>Zeke Entara. Y’know, I walked in on him talking about some big Steele Tech contract way back. Months ago now, it must have been. Must have been your ship, now that I think about it.”</i>");
	
	output("\n\n“<i>Must have,”</i> you say. smiling now that Kaede’s opening up a little more. “<i>So, your dad’s the mechanic who put my");
	if (9999 == 0) output(" old");
	output(" ship back together. And your mom? Is she a mechanic too?”</i>");
	
	output("\n\nKaede shakes her head, and her ears tuck down a little. “<i>No, no. My mom didn’t, um, stick around, I guess. She works in construction, I think. Salvage, sometimes. She’s got a pretty big ship, a full crew, works all over the frontier. I see her once every few years, maybe.”</i>");
	
	output("\n\nThinking you’ve hit a sensitive spot, you try and apologize, but Kaede waves you off. “<i>It’s fine. Really. I mean, in this day and age, I’m could just as easily have been born in a harem or gotten shipped off to an orphan school or something. My dad did alright by me.”</i>");
	
	output("\n\nYou suppose that’s true.");

	processTime(15);

	addDisabledButton(2, "Herself");
}

public function kaedeMyrellionTalkFinish():void
{
	clearOutput();
	kaedeHeader();

	output("You knock back the last of your drink with relish, sucking in a sharp breath as the whiskey burns its way down your throat. Damn, that’s good stuff! You give the bartender a friendly nod as she whisks the pair of empty glasses away, taking a proffered credit chit from Kaede as she does so.");
	
	output("\n\n“<i>So,”</i> Kaede says, tapping the small blue projector on her wrist computer, glancing at the time. “<i>Thanks for the company, [pc.name]. It’s nice to see a friendly face out here.”</i>");
	
	output("\n\n");
	if (hasFuckedKaede()) output("“<i>Going so soon?”</i> you ask, your hand brushing along Kaede’s waist. She blushes, and chews her lower lip.");
	else output("“<i>Leaving already?”</i> you ask, catching Kaede’s eye through the soft blue go of her holoband.");
	output(" She meets your gaze, and you get the feeling she isn’t in as much of a hurry to leave as she made out.");

	processTime(3);
	//Any unread previous talks remain, plus: [Flirt] [Goodbye]
	addButton(3, "Flirt", kaedeMyrellionBarFlirt, undefined, "Flirt", "Flirt with the cute half-ausar girl. She seems interested, to say the least.");
	addButton(4, "Goodbye", kaedeMyrellionBarGoodbye, undefined, "Goodbye", "Say goodbye to Kaede.");
}

public function kaedeMyrellionBarGoodbye():void
{
	clearOutput();
	kaedeHeader();

	output("“<i>Well, I won’t keep you,”</i> you say, putting a friendly hand on the half-breed’s shoulder.");
	
	output("\n\nShe shrugs. “<i>Alright. Sounds good. It was nice drinking with you, [pc.name],”</i> Kaede says with a smile, squeezing your hand before slipping up out of her stool and heading towards the door.");
	
	output("\n\nAfter watching her go, you stand, stretch, and get ready to head out.");

	kaedeMyrellionShadeAddition();

	// [Next]
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function kaedeMyrellionShadeAddition():void
{
	// {if Shade is at the bar, PC's fucked her:
	if (shadeAtTheBar() && flags["SEXED_SHADE"] != undefined)
	{
		output("\n\nAs you’re making your way towards the door, you hear a sharp whistle from over in the corner. Turning to look, you see Shade sitting in her usual spot with her feet propped up on top of the table. She crooks a finger at you, beckoning you over.");
		
		output("\n\nYou head over to your lover’s table and take a seat opposite her.");
		
		output("\n\nShade looks you up and down slowly with her golden feline eyes. After a silent moment, she says, “<i>Cute girl you found yourself.”</i>");
		
		output("\n\nYou glance around awkwardly. Maybe you misunderstood something, but you never got the impression Shade would have thought you and her were anything like exclusive.");
		
		output("\n\nShe scowls. “<i>Not what I meant. You knew her already, didn’t you? That didn’t look like a pickup to me.”</i>");
		
		output("\n\nWhat the... “<i>Yeah, I know Kaede.”</i>");
		
		output("\n\n“<i>Kaede, is it?”</i> she murmurs, the hostility fading from her voice. “<i>Kaede Faell, right?”</i>");
		
		output("\n\n“<i>Entara,”</i> you correct. “<i>What’s this all about, Shade?”</i>");
		
		output("\n\nThe cat-woman grunts and rubs her temple. “<i>Doesn’t matter. Nevermind, kid.”</i>");
		
		output("\n\nYou cross your arms. No way she’s just blowing you off after that... whatever that was. Shade sighs and leans back in her chair, arms crossing right back at you and hefting up the smooth swells of her ample bust. “<i>She reminded me of somebody. Somebody I care about a great deal.”</i>");
		
		output("\n\n“<i>Oh?”</i>");
		
		output("\n\nAfter a moment’s consideration, Shade finally answers: “<i>I have a daughter. Astra. The girl you were talking to... she reminded me a great deal of my daughter’s sire. Younger, of course. that’s all.”</i>");
		
		output("\n\nYou shrug, saying you don’t know anything about that.");
		
		output("\n\n“<i>Like I said, doesn’t really matter,”</i> Shade says, turning her attention back to the holo-terminal on her table. “<i>Would have been a strange coincidence, nothing more. Though I would have liked to meet her, if that was true. Anyway, I’m sure you have more important things to do than listen to me ramble. Go on.”</i>");
	}
}

public function kaedeMyrellionBarFlirt():void
{
	clearOutput();
	kaedeHeader();

	output("You inch a little closer to Kaede, drawing her attention away from her holoband’s clock, and remind her that she’s still got plenty of time before that delivery of hers.");
	
	output("\n\n“<i>I guess,”</i> she says. Her human half is trying awfully hard to be coy about it, but you can see the way her fluffy red tail starts swishing a little faster behind her that she’s enjoying your presence, and your growing closeness.");

	//{If PC's fucked Kaede before:
	if (hasFuckedKaede())
	{
		output("\n\nYou hand slips down the stroke the wagging bush of canid tail behind her, making the halfbreed girl moan softly. “<i>What do you say we get out of here?”</i> you suggest, letting your hand play down from her tail to the tight butt beneath it.");
		
		output("\n\n“<i>Y-you want to...”</i> she starts, eyes widening a little. A bit of red touches Kaede’s cheeks, and she murmurs a little softer, “<i>I thought you were only interested in me with Anno.”</i>");
		
		output("\n\n{if Kind: You smile at her, and say that you’re <i>very</i> interested in the cute halfbreed. //if Misch: Well, she and Anno have a very open relationship, the way you understand it. With two smoking hot ausar girls, you want everything the pair of them have to offer. //if Hard: You take a hold of Kaede’s wrist and pull her into a furious kiss. She gasps, but melts in your grasp, returning the kiss. When you break it, you ask if that answers her question. All she can do is nod.}");
		
		output("\n\n“<i>Alright,”</i> she says, “<i></i>Talon<i>’s parked just a little ways off. Want to, um, come back to my place, [pc.name]?”</i>");
		
		output("\n\nAbsolutely.");

		//[Next] //To sex intro
		clearMenu();
		addButton(0, "Next", kaedeMyrellionSexIntro);
		return;
	}
	else
	{
		output("\n\nKaede blushes as you draw close, her tail moving ever faster. You lay on the Steele charms, getting nice and close to the halfbreed. After a long while of quiet flirting back and forth between you, you suggest you and her get on out of the bar.");
		
		output("\n\nKaede says “<i>If you, uh, want to maybe go back to my place... I think I’ve got a bottle somewhere aboard </i>Talon<i>.”</i>");
		
		output("\n\n“<i>Sounds great.”</i>");
		
		output("\n\nShe giggles girlishly and flicks her tail’s tip along your [pc.leg]. “<i>I’d like that, too. Anno’s told me nothing but good things, "+ pc.mf("Mr.","Ms.") +" Steele,”</i> she teases.");
		
		output("\n\nAs you start to gather your things and stand, Kaede suddenly becomes more serious. “<i>Just, umm... just so we get this out of the way ahead of time, I’ve got a dick. In case that’s a problem, I mean. If it is, I understand.”</i>");

		clearMenu();
		addButton(0, "It's Fine", kaedeMyrellionBarTheDIsFine, undefined, "It's Fine", "Tell Kaede you're fine with her and her dick.");
		addButton(1, "Nevermind", kaedeMyrellionBarNoDPls, undefined, "Nevermind Then", "Thanks for the heads up. You're not really into the D.")
	}
}

public function kaedeMyrellionBarTheDIsFine():void
{
	clearOutput();
	kaedeHeader();

	output("“<i>That’s fine with me,”</i> you say, urging Kaede towards the door. She flashes you a winning smile and hops out of her stool.");
	
	output("\n\n“<i>Great! Follow me, then.”</i>");

	//To sex intro.
	clearOutput();
	addButton(0, "Next", kaedeMyrellionSexIntro);
}

public function kaedeMyrellionBarNoDPls():void
{
	clearOutput();
	kaedeHeader();

	output("That changes things, then. You awkwardly try and wiggle out of the situation. Kaede sighs and gives you a wry smile, saying “<i>It’s fine. Don’t worry about it... I’ve got that delivery to get to anyway. Thanks for the company, [pc.name].”</i>");
	
	output("\n\n“<i>Yeah, anytime,”</i> you say, watching Kaede slip out of her barseat and head out of the bar.");
	
	output("\n\nAfter watching her go, you strand, stretch, and get ready to head out.");

	//Shade Scene from above goes here, if applicable.
	kaedeMyrellionShadeAddition();

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function kaedeMyrellionSexIntro():void
{
	
}