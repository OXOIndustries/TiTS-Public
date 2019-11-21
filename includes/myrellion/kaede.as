public function showKaedeAndCass(kaedeNude:Boolean = false, cassNude:Boolean = false):void
{
	author("Savin");
	showName("CASS\n& KAEDE");
	if(kaedeNude && cassNude) showBust("KAEDE_NUDE","CASS_NUDE");
	else if(kaedeNude) showBust("KAEDE_NUDE","CASS");
	else if(cassNude) showBust("KAEDE","CASS_NUDE");
	else showBust("KAEDE","CASS");
}
public function showKaede(nude:Boolean = false):void
{
	showName("\nKAEDE");
	if(!nude) showBust("KAEDE");
	else showBust("KAEDE_NUDE");
}

public function getKaedePregContainer():PregnancyPlaceholder
{
	var ppKaede:PregnancyPlaceholder = new PregnancyPlaceholder();
	if(!ppKaede.hasCock()) ppKaede.createCock();
	ppKaede.shiftCock(0, GLOBAL.TYPE_FELINE);
	ppKaede.cocks[0].delFlag(GLOBAL.FLAG_SHEATHED);
	ppKaede.balls = 2;
	ppKaede.ballFullness = 100;
	ppKaede.ballSizeRaw = 8;
	
	return ppKaede;
}

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

public function kaedeHeader(isNude:Boolean = false):void
{
	if (!isNude) showBust("KAEDE");
	else showBust("KAEDE_NUDE");

	showName("\nKAEDE");
	author("Savin");
}

public function findKaedeOnMyrellion():Boolean
{
	var retVal:Boolean = false;
	
	if (hasMetKaede() && flags["BEEN_TO_MYRELLION_BAR"] != undefined && flags["MYRELLION_EMBASSY_VISITED"] != undefined && flags["KAEDE_MYRELLION_ENCOUNTER"] == undefined)
	{
		output("\n\nYou see a familiar half-ausar standing in the transport hub, followed closely by a hover-platform laden with crates and boxes stacked head-high, all bearing the label of the RhenWorld mining company. Seeing you, the svelte red-head smiles and waves, her tail wagging quickly behind her.");
		addButton(0, "Kaede", encounterKaedeOnMyrellion, undefined, "Greet Kaede", "Go say “Hi” to your friend.");
		retVal = false;
	}
	return retVal;
}

public function encounterKaedeOnMyrellion():void
{
	clearOutput();
	kaedeHeader();

	output("<i>“Hey, [pc.name]!”</i> Kaede says with a smile as you approach, brushing a lock of red hair out of her eyes. Your eyes are instantly drawn to the long, auburn tail wagging happily behind her, vigorously brushing the ground. A black leather jacket is tied around her waist, largely concealing a holster and the wooden grip of a heavy pistol.");
	
	output("\n\nYou greet her in turn,");
	if (hasFuckedKaede()) output(" pulling her into a quick hug. She giggles and returns the gesture, squeezing you tightly.");
	else output(" shaking her hand warmly.");
	
	output("\n\n<i>“So what’s got you all the way out here?”</i> Kaede asks, resting an arm on the handle of the hover-platform following at her heel. Her other hand disappears into the pocket of her jeans. The slight shift of her stance is enough to make her small breasts press against the front of her white tank-top, bringing your eyes back up from her swishing red tail. Prying your eyes away from the halfbreed’s chest, you tell her that");
	if (!reclaimedProbeMyrellion()) output(" you’re looking for a probe your father launched out here onto Myrellion");
	else output(" you’re just passing through");
	output(".");
	
	output("\n\nKaede listens and nods. <i>“Cool. Hey, um, I’m a couple hours early on this delivery,”</i> she says, nodding to the huge stack of crates. <i>“Wanna... I dunno... get a drink or something? I think there’s a bar around here somewhere...”</i>");
	
	flags["KAEDE_MYRELLION_ENCOUNTER"] = 1;

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
	
	output("\n\n<i>“Oh, yeah, no problem,”</i> Kaede says, shrugging nonchalantly. Behind her, you hear the roar of engines as a plane lands in the Federation airfield, puttering towards the terminal. <i>“Looks like that’s my plane, anyway. See you around, [pc.name]!”</i>");
	
	output("\n\nShe claps you on the shoulder and grabs her hover-cart, dragging it off towards the airstrip.");

	processTime(5);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function kaedeMyrellionDrinks():void
{
	clearOutput();
	kaedeHeader();

	output("<i>“Sure,”</i> you say, slipping an arm around Kaede’s slender shoulders. <i>“Sounds like fun.”</i>");
	
	output("\n\n<i>“Great!”</i> she beams, flashing you a smile full of pearly teeth. Turning to one of the gas-masked red myr, she adds, <i>“Hey, this is going to, uh, what’s it called... Kressia or something? Would you mind if I left this here? I didn’t see a baggage check or anything on my way in.”</i>");
	
	output("\n\nThe guard shrugs and takes the cart from her, dragging it off into the red myr terminal and leaving you and your half-ausar companion free to stroll southwards toward the bar. As you’re walking, you ask Kaede what that huge stack of crates was all about.");
	
	output("\n\n<i>“That’s my job in a nutshell,”</i> she laughs. <i>“I’m just a glorified space trucker, when you get right down to it. Most of the big cargo-hauling companies don’t go out into Rush Space - too dangerous, right? So it’s up to us little guys, solo fliers like me, to get supplies out to the new planets. In this case, I accidentally met a V.P. of RhenWorld, and she’s been keeping me busy running out here and a few other planets they’re interested in mining out.”</i>");
	
	output("\n\n<i>“That’s a lucky break,”</i> you say, pushing in the door to the tavern. It’s loud and busy inside, full of spacers and a handful of gold myr pilots off-duty.");
	
	output("\n\nThe sounds of laughing and drinking echo out the open door as you and Kaede walk in. On the way toward the bar, Kaede shrugs");
	if (hasFuckedKaede() && pc.tallness > 70) output(", nestling herself a little tighter into your arm’s hold");
	output(". <i>“I guess. It’s nice having a steady job for once. I don’t know if Anno ever told you, but for a long time I was struggling just to eat noodles and crackers more often than not.”</i>");
	
	output("\n\nYou shake your head - no, Anno never mentioned. Her tail flicks a little in response, though she says nothing.");
	if (pc.originalRace == "half-ausar") output(" You’re sure that was a relieved gesture, at least.");
	output(" You and Kaede take a seat at the bar, and Kaede flashes a pair of fingers to the bartender.");
	
	output("\n\nA moment later, and a quick word with the ausar girl working behind the bar, and you’ve both got a whiskey on the rocks sitting in front of you.");
	if (pc.mf("m", "f") == "m" && pc.isNice())
	{
		output(" You tsk your tongue as the drinks are dropped off and suggest that you’d have happily covered them.");
	
		output("\n\n<i>“Don’t be old-fashioned,”</i> Kaede teases, rolling her eyes. <i>“Good company’s worth a few credits any day.”</i>");
	}
	
	output("\n\nYou settle in");
	if (pc.isBiped() || pc.isGoo()) output(" on the bar stool");
	else output(" atop your animalistic lower body, resting beside Kaede on her bar stool");
	output(" and sip your drink. Your companion eyes you, fidgeting nervously, clearly waiting for you to speak...");

	processTime(15);
	currentLocation = "609";
	generateMapForLocation(currentLocation);
	showName("THE\nGOLDEN PEAK");

	kaedeMyrellionBarTalkMenu();
}

public function kaedeMyrellionBarTalkMenu():void
{
	clearMenu();
	addButton(0, "Her Job", kaedeMyrellionTalkJob, undefined, "Her Job", "Ask Kaede about her space-trucker job.");
	addButton(1, "RhenWorld", kaedeMyrellionTalkRenWorld, undefined, "RhenWorld", "Ask Kaede about this RhenWorld contract she’s got.");
	addButton(2, "Herself", kaedeMyrellionTalkHerself, undefined, "Herself", "Ask Kaede a little about, well, Kaede.");
	addButton(3, "Finish", kaedeMyrellionTalkFinish, undefined, "Finish", "Finish your drink.")
}

public function kaedeMyrellionTalkJob():void
{
	clearOutput();
	kaedeHeader();

	output("<i>“So, how’s the cargo hauling business these days?”</i> you ask.");
	
	output("\n\nKaede laughs. <i>“Better than you’d think. Like I said, most of the big hauler companies won’t go into Rush Space, so us little guys pick up a lot of the slack. Used to be I’d be moving little packages, mail, sometimes an emergency part to some mine somewhere. Little shit, but it was something. Now, though, even mega corporations are picking independent pilots up left and right. I’ve had a couple long-term contract offers from JoyCo and Nova, even.”</i>");
	
	output("\n\nYou cock an eyebrow. <i>“But you didn’t take them?”</i>");
	
	output("\n\n<i>“Nah,”</i> she says, gulping down some of her whiskey and sucking in a sharp breath. <i>“Whew, that’s good!”</i> Wiping her mouth and sighing, she says, <i>“No, I didn’t. If I wanted to be some corp’s toady, I’d have just cut the middleman and joined up with GalHaul or Confederate Express. I like the freedom of picking my own jobs, being able to take whatever route I want. A lot of the time I can pick up two or three contracts at the same time for different companies. Plus, this way I own my own ship. Nothing more important than that.”</i>");
	
	output("\n\n<i>“You bought a ship? That’s not cheap,”</i> you say, remembering what Kaede mentioned about noodles and crackers just a few minutes ago.");
	
	output("\n\nShe gives you a wry look. <i>“It wasn’t. I’m still paying </i>Talon<i> off, a chunk out of every paycheck I get. I’m so far in debt over her I can barely see the light, but she’s worth every " + (isAprilFools() ? "dogecoin" : "credit") + ". Every single one,”</i> Kaede says, her lips softening into a far-away smile.");
	
	output("\n\n<i>“Being out here, in space, seeing these strange planets... this is everything I ever wanted. I wouldn’t trade it for the world.”</i>");
	
	output("\n\nAfter a moment of companionable silence spent drinking, you ask if her work is very dangerous.");
	
	output("\n\n<i>“It can be,”</i> she answers, and she pats her thigh just above where her handgun is slung in its holster. <i>“Pirates and raiders can get away with pretty much anything out here. My ship is strapped with as many guns as I could afford. And I’ve got my money’s worth, let me tell you. Hand to God, I’ve torn a pirate ship in half with ‘em at point blank. It’s scary as all hell out here sometimes. I could get captured, enslaved, blown up, or incinerated at pretty much any time for no reason.”</i>");
	
	output("\n\n<i>“Still worth it?”</i>");
	
	output("\n\n<i>“Always,”</i> she laughs, giving you a wink.");

	processTime(10);

	addDisabledButton(0, "Her Job");
}

public function kaedeMyrellionTalkRenWorld():void
{
	clearOutput();
	kaedeHeader();

	output("<i>“So, this RhenWorld contract...”</i>");
	
	output("\n\nKaede blushes, cheeks reddening like rosepetals as you start to ask your question. <i>“I, uh, got lucky is all,”</i> she says, running a hand through her crimson hair. <i>“I bumped into a V.P. of the company in an elevator on Tavros. We, uh... we hit it off, I guess, and she invited me to come do a few jobs for the company.”</i>");
	
	output("\n\n<i>“You hit it off, huh?”</i>");
	
	output("\n\nKaede’s cheeks flush a little darker. She looks like a big, red beet! <i>“I, uh, I mean... um...”</i> she babbles, clapping her hands to her face. You chuckle and pat Kaede’s back, making her canid ears perk.");
	
	output("\n\n<i>“I would have worked for them anyway! I mean, I’ve done work for RhenWorld before, and now that they’re mining here on Myrellion, they need a lot of private ships to move their cargo here and there and all. I just, uh, I guess I jumped to the top of the list.”</i>");
	
	output("\n\nYou eye the blushing halfbreed, and decide to give her a break on the matter. <i>“So, what’re they mining here? Seems pretty dangerous,");
	if (9999 == 9999) output(" what with the war going on");
	else output(" even with the war over with");
	output(".”</i>");
	
	flags["HEARD_ASHINARI"] = 1;
	output("\n\n<i>“Must be worth it. They’ve made a pretty big deal with the, uh, something or other Federation here. The ones that control pretty much the whole planet, anyway. From what Ashinari told me, the ant-folk here are working hard to get off-worlders invested here. They’re giving away mining rights away like candy. They’ve got no use for Oxonium, Thorolium, a bunch of other rare elements. Not to mention there’s gold and silver and all that to be had. It’s a rich planet, and a lot of the hard work’s already done. After all, the myr live underground to begin with. Plenty of caverns and tunnels to get RhenWorld and the other mega-corps started.”</i>");
	
	output("\n\nInteresting. <i>“I knew Xenogen was interested in the golds,”</i> you say, thinking back to your initial meeting with Juro, and the hordes of Xenogen employees you’ve seen wandering around. <i>“So the Federation’s courting mining companies, now?”</i>");
	
	output("\n\nKaede nods, taking a big swig of whiskey to mask the lingering traces of her bashful blush. <i>“I guess so? Sorry, I’m not really up to date on xeno-politics. I know things are pretty tense around here, though, especially with the Confederate fleet up in orbit. Everyone looks like they’re sweating bullets here.”</i>");
	
	output("\n\nAin’t that the truth.");
	
	output("\n\n<i>“So what’s RhenWorld shipping out here, anyway?”</i>");
	
	output("\n\n<i>“No idea,”</i> Kaede says with an apologetic shrug. <i>“Mining equipment of some kind, I’d imagine. I know they agreed to pay the Federation in food and medical supplies, so I probably have a few cases of insta-rations in that pallet, too.”</i>");
	
	if (pc.characterClass == GLOBAL.CLASS_SMUGGLER)
	{
		output("\n\n<i>“Is that all?”</i>");
		
		output("\n\nKaede fidgets. <i>“As far as I know, yeah. W-why?”</i>");
		
		output("\n\nYou shrug, and mention it’d be pretty easy to be paying with weapons. Modern weapons that could give one side or the other in this primitive war a huge edge. It’s hardly the first time you’ve seen something like that: a big mega-corporation exploiting the locals with promises of armaments to settle their <i>“local disputes.”</i> The color fades from Kaede’s cheeks as you speak, until you assure her that you’re joking.");
		
		output("\n\nWell, probably.");
	}

	processTime(15);

	addDisabledButton(1, "RhenWorld");
}

public function kaedeMyrellionTalkHerself():void
{
	clearOutput();
	kaedeHeader();

	if (hasFuckedKaede()) output("<i>“You know, even after we’ve gotten so close, I still don’t know much about </i>you<i>”</i> you say, subtly reaching down until your hand brushes along the curve of Kaede’s ass. She gasps, but as your fingers dance across her jeans, she certainly doesn’t stop you.");
	else output("So, tell me a little bit about yourself,”</i> you suggest, leaning a little closer to the cute half-ausar.");
	
	output("\n\nKaede blinks. <i>“You, uh, you want to know about me?”</i>");
	
	output("\n\nYou nod, and Kaede seems to get lost in thought for a moment, unsure what to say to that. After a bit, she says, <i>“Well, um, alright. Like I said, I’m a cargo hauler. I work for myself, taking contracts and-”</i>");
	
	output("\n\nWith a chuckle, you tell her you want to know about <i>her</i>. There’s got to be more to Kaede than the job, right?");
	
	output("\n\nShe fidgets awkwardly and says, <i>“Uh, right, yeah. So... I- my dad’s the lead mechanic on Tavros. I grew up there, you know. Didn’t see a planet until I was ten. I grew up around machines and starships and spacers. I guess I was pretty much destined to be obsessed with space.”</i>");
	
	output("\n\nThinking for a moment, you ask if her dad happens be a fellow by the name of Zeke - the big guy that put your father’s Casstech back together before you quest began.");
	
	output("\n\n<i>“Yeah, that’s him!”</i> Kaede laughs, <i>“Zeke Entara. Y’know, I walked in on him talking about some big Steele Tech contract way back. Months ago now, it must have been. Must have been your ship, now that I think about it.”</i>");
	
	output("\n\n<i>“Must have,”</i> you say, smiling now that Kaede’s opening up a little more. <i>“So, your dad’s the mechanic who put my");
	if (9999 == 0) output(" old");
	output(" ship back together. And your mom? Is she a mechanic too?”</i>");
	
	output("\n\nKaede shakes her head, and her ears tuck down a little. <i>“No, no. My mom didn’t, um, stick around, I guess. She works in construction, I think. Salvage, sometimes. She’s got a pretty big ship, a full crew, works all over the frontier. I see her once every few years, maybe.”</i>");
	
	output("\n\nThinking you’ve hit a sensitive spot, you try and apologize, but Kaede waves you off. <i>“It’s fine. Really. I mean, in this day and age, I could just as easily have been born in a harem or gotten shipped off to an orphan school or something. My dad did alright by me.”</i>");
	
	output("\n\nYou suppose that’s true.");

	processTime(15);

	addDisabledButton(2, "Herself");
}

public function kaedeMyrellionTalkFinish():void
{
	clearOutput();
	kaedeHeader();

	output("You knock back the last of your drink with relish, sucking in a sharp breath as the whiskey burns its way down your throat. Damn, that’s good stuff! You give the bartender a friendly nod as she whisks the pair of empty glasses away, taking a proffered credit chit from Kaede as she does so.");
	
	output("\n\n<i>“So,”</i> Kaede says, tapping the small blue projector on her wrist computer, glancing at the time. <i>“Thanks for the company, [pc.name]. It’s nice to see a friendly face out here.”</i>");
	
	output("\n\n");
	if (hasFuckedKaede()) output("<i>“Going so soon?”</i> you ask, your hand brushing along Kaede’s waist. She blushes, and chews her lower lip.");
	else output("<i>“Leaving already?”</i> you ask, catching Kaede’s eye through the soft blue glow of her holoband.");
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

	output("<i>“Well, I won’t keep you,”</i> you say, putting a friendly hand on the half-breed’s shoulder.");
	
	output("\n\nShe shrugs. <i>“Alright. Sounds good. It was nice drinking with you, [pc.name],”</i> Kaede says with a smile, squeezing your hand before slipping up out of her stool and heading towards the door.");
	
	output("\n\nAfter watching her go, you stand, stretch, and get ready to head out.");

	kaedeMyrellionShadeAddition();

	processTime(rand(10));
	
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
		
		output("\n\nShade looks you up and down slowly with her golden feline eyes. After a silent moment, she says, <i>“Cute girl you found yourself.”</i>");
		
		output("\n\nYou glance around awkwardly. Maybe you misunderstood something, but you never got the impression Shade would have thought you and her were anything like exclusive.");
		
		output("\n\nShe scowls. <i>“Not what I meant. You knew her already, didn’t you? That didn’t look like a pickup to me.”</i>");
		
		output("\n\nWhat the... <i>“Yeah, I know Kaede.”</i>");
		
		output("\n\n<i>“Kaede, is it?”</i> she murmurs, the hostility fading from her voice. <i>“Kaede Faell, right?”</i>");
		
		output("\n\n<i>“Entara,”</i> you correct. <i>“What’s this all about, Shade?”</i>");
		
		output("\n\nThe cat-woman grunts and rubs her temple. <i>“Doesn’t matter. Never mind, kid.”</i>");
		
		output("\n\nYou cross your arms. No way she’s just blowing you off after that... whatever that was. Shade sighs and leans back in her chair, arms crossing right back at you and hefting up the smooth swells of her ample bust. <i>“She reminded me of somebody. Somebody I care about a great deal.”</i>");
		
		output("\n\n<i>“Oh?”</i>");
		
		output("\n\nAfter a moment’s consideration, Shade finally answers: <i>“I have a daughter. Astra. The girl you were talking to... she reminded me a great deal of my daughter’s sire. Younger, of course. that’s all.”</i>");
		
		output("\n\nYou shrug, saying you don’t know anything about that.");
		
		output("\n\n<i>“Like I said, doesn’t really matter,”</i> Shade says, turning her attention back to the holo-terminal on her table. <i>“Would have been a strange coincidence, nothing more. Though I would have liked to meet her, if that was true. Anyway, I’m sure you have more important things to do than listen to me ramble. Go on.”</i>");
	}
}

public function kaedeMyrellionBarFlirt():void
{
	clearOutput();
	kaedeHeader();

	output("You inch a little closer to Kaede, drawing her attention away from her holoband’s clock, and remind her that she’s still got plenty of time before that delivery of hers.");
	
	output("\n\n<i>“I guess,”</i> she says. Her human side is trying awfully hard to be coy about it, but you can see the way her fluffy red tail starts swishing a little faster behind her that she’s enjoying your presence, and your growing closeness.");

	// If PC's fucked Kaede before:
	if (hasFuckedKaede())
	{
		output("\n\nYou hand slips down to stroke the wagging bush of canid tail behind her, making the halfbreed girl moan softly. <i>“What do you say we get out of here?”</i> you suggest, letting your hand play down from her tail to the tight butt beneath it.");
		
		output("\n\n<i>“Y-you want to...”</i> she starts, eyes widening a little. A bit of red touches Kaede’s cheeks, and she murmurs a little softer, <i>“I thought you were only interested in me with Anno.”</i>");
		
		output("\n\n");
		if(pc.isNice()) output("You smile at her, and say that you’re <i>very</i> interested in the cute halfbreed.");
		else if(pc.isMischievous()) output("Well, she and Anno have a very open relationship, the way you understand it. With two smoking hot ausar girls, you want everything the pair of them have to offer.");
		else output("You take a hold of Kaede’s wrist and pull her into a furious kiss. She gasps, but melts in your grasp, returning the kiss. When you break it, you ask if that answers her question. All she can do is nod.");
				
		output("\n\n<i>“Alright,”</i> she says, <i>“</i>Talon<i>’s parked just a little ways off. Want to, um, come back to my place, [pc.name]?”</i>");
		
		output("\n\nAbsolutely.");

		processTime(20 + rand(10));
		
		//[Next] //To sex intro
		clearMenu();
		addButton(0, "Next", kaedeMyrellionSexIntro);
		return;
	}
	else
	{
		output("\n\nKaede blushes as you draw close, her tail moving ever faster. You lay on the Steele charms, getting nice and close to the halfbreed. After a long while of quiet flirting back and forth between you, you suggest you and her get on out of the bar.");
		
		output("\n\nKaede says <i>“If you, uh, want to maybe go back to my place... I think I’ve got a bottle somewhere aboard </i>Talon<i>.”</i>");
		
		output("\n\n<i>“Sounds great.”</i>");
		
		output("\n\nShe giggles girlishly and flicks her tail’s tip along your [pc.leg]. <i>“I’d like that, too. Anno’s told me nothing but good things, "+ pc.mf("Mr.","Ms.") +" Steele,”</i> she teases.");
		
		output("\n\nAs you start to gather your things and stand, Kaede suddenly becomes more serious. <i>“Just, umm... just so we get this out of the way ahead of time, I’ve got a dick. In case that’s a problem, I mean. If it is, I understand.”</i>");

		processTime(20 + rand(10));
		
		clearMenu();
		addButton(0, "It’s Fine", kaedeMyrellionBarTheDIsFine, undefined, "It’s Fine", "Tell Kaede you’re fine with her and her dick.");
		addButton(1, "Never Mind", kaedeMyrellionBarNoDPls, undefined, "Never Mind Then", "Thanks for the heads up. You’re not really into the D.")
	}
}

public function kaedeMyrellionBarTheDIsFine():void
{
	clearOutput();
	kaedeHeader();

	output("<i>“That’s fine with me,”</i> you say, urging Kaede towards the door. She flashes you a winning smile and hops out of her stool.");
	
	output("\n\n<i>“Great! Follow me, then.”</i>");

	processTime(3);
	
	//To sex intro.
	clearMenu();
	addButton(0, "Next", kaedeMyrellionSexIntro);
}

public function kaedeMyrellionBarNoDPls():void
{
	clearOutput();
	kaedeHeader();

	output("That changes things, then. You awkwardly try and wiggle out of the situation. Kaede sighs and gives you a wry smile, saying <i>“It’s fine. Don’t worry about it... I’ve got that delivery to get to anyway. Thanks for the company, [pc.name].”</i>");
	
	output("\n\n<i>“Yeah, anytime,”</i> you say, watching Kaede slip out of her barseat and head out of the bar.");
	
	output("\n\nAfter watching her go, you strand, stretch, and get ready to head out.");

	//Shade Scene from above goes here, if applicable.
	kaedeMyrellionShadeAddition();

	processTime(10 + rand(10));
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function kaedeMyrellionSexIntro():void
{
	clearOutput();
	kaedeHeader();

	output("You grab a handful of half-ausar ass as Kaede slips out of her barstool, making her auburn tail jump and wiggling over your arm. She blushes, and the two of you quickly make your way out of the bar and out towards the tarmac. As you’re walking, Kaede’s hand slips down to yours, lacing her fingers through yours. She nestles into your shoulder and leads you on toward the southern half of the myr airfield, not far from where your own vessel is parked.");
	
	output("\n\nAfter a few minutes of walking, you come to a beat-up looking old Casstech Lancer sitting on the tarmac, covered in a racer-like paintjob of red and white. A meaty looking laser turret sits under the cabin, considerably bigger than your average stock freighter ought to be packing. The words <i>“<i>Talon Rogue”</i></i> are written in bold white letters on the long neck between the cabin and the main hold. Kaede flips a keychain out of her pocket and swipes it over a keypad next to the airlock. The ship beeps at you, and a gangplank rolls down while the airlock pops open.");
	
	output("\n\n<i>“Ladies first,”</i> you say, following Kaede on up the ladder and into the belly of her ship.");
	
	output("\n\nThe interior of <i>Talon Rogue</i> is delightfully comfortable looking, the very definition of a bachelor pad. A circular couch surrounds a big holo projector, wired up to several game controllers lying atop a sea of holovid and game cases. A half-eaten box of Thai food has been lazily left on top of the projector, making the glowing blue lights flicker oddly over the ceiling.");
	
	output("\n\n<i>“Sorry about the mess,”</i> Kaede laughs, grabbing the food off her projector-turned-table and throwing it into a mini-fridge up against the far wall. She pulls the leather jacket off of her waist and hangs it up next to the airlock, following it with her gunbelt. <i>“Anyway, I think I’ve got that bottle in my cabin. Why don’t I go get it?”</i>");
	
	output("\n\nYou nod, and let Kaede slip away through a hatch into a side chamber near the back of the ship. You slip down onto the couch while you wait, slipping your arms around the back of the seat");
	if (pc.isBiped()) output(" and kicking your [pc.feet] up onto the projector’s face");
	output(".");

	processTime(20);

	clearMenu();
	addButton(0, "Next", kaedeMyrellionSexIntroII);
}

public function kaedeMyrellionSexIntroII():void
{
	clearOutput();
	kaedeHeader();

	output("After a couple of minutes, you hear the hiss of the cabin door sliding open. Kaede takes a long-legged stride back into the main chamber, drawing your eyes back her way. She’s mostly naked, save for a translucent pink bra that cups her small breasts, and a pair of lacey pink stockings clipped to a garter that hugs her slender hips. She’s got no panties on, showing off an eight-inch shaft of canine cock dangling freely between her legs, only just concealing a tight little sack hugging her groin.");
	
	output("\n\nKaede’s holding a pair of small glasses in one hand, and a dark bottle of whiskey in the other.");
	
	output("\n\n<i>“Thanks for waiting. I thought I’d go ahead and get changed,”</i> Kaede says with a little smile. Her bare feet make a little patter across the metallic deck as she approaches you, nice and slow with a seductive sashay of her hips. You watch appreciatively as the svelte girl approaches, giving your eyes time to wander all across the body on display for you: from her long, slender legs to her small pouch of a sack hiding behind a proud canine shaft, and up to the handful of tit she’s sporting, each tipped with a stiff little nipple poking into the silky material of her bra.");
	
	output("\n\nHer tail swishes slowly behind her, curling around one of her legs as she sets her glasses and bottle down, and slips into your lap. You lean back into the couch, your hands reaching up to caress Kaede’s hips, pulling her close. The feeling of hot, stiff girl-cock coming to rest on your belly sends a shiver through you -- one that pales in comparison to the next as Kaede’s hand reaches down to caress your own crotch, her small lips brushing against your [pc.lips]. Your eyes flutter closed, and you return the kiss, suckling on the halfbreed’s lower lip and squeezing your fingers into her tight ass.");
	
	output("\n\n<i>“I guess the drinks can come later,”</i> she purrs, breaking the kiss just long enough to speak.");
	
	output("\n\nIt looks like this horny halfbreed’s entirely at your disposal...");

	// [Fuck Ass] [Suck & Ride]
	IncrementFlag("KAEDE_FUCKED");
	
	processTime(15 + rand(5));
	
	clearMenu();
	if (pc.hasCock() && pc.smallestCockVolume() <= 250) addButton(0, "Fuck Ass", kaedeMyrellionFuckAss, undefined, "Fuck Her Ass", "The way you’re sitting now, it’d be so easy to just slide your cock right into the randy shemale’s tight little hole...");
	else addDisabledButton(0, "Fuck Ass", "Fuck Her Ass", "It’d be so easy to just slide your cock right into the randy shemale’s tight little hole... if you had one that could squeeze up in there.");
	addButton(1, "Suck&Ride", kaedeMyrellionSucknRide, undefined, "Suck & Ride", "Give that delicious red doggy-cock the attention it deserves before you go for a wild ride.");
}

public function kaedeMyrellionFuckAss():void
{
	clearOutput();
	kaedeHeader(true);

	output("Kaede eagerly pulls away your [pc.gear], freeing your quickly stiffening cock from its constraints.");
	
	output("\n\n<i>“Someone’s happy to see me,”</i> she teases, wrapping her slender fingers around your [pc.cock]. You suck in a sharp breath as the halfbreed dog-girl’s claws caress the tender flesh of your prick, but she’s nothing but gentle with you. Eager, even, as she gives your length a few experimental tugs. Smiling");
	if (pc.tallness > 60) output(" up");
	else if (pc.tallness < 45) output(" down");
	output(" at you, Kaede shifts her grip a bit, scooping up her knotty puppyprick. It’s way hotter than you expected, feeling like eight inches of fire against your [pc.cock]... but when Kaede’s fingers wrap them tight together and start to stroke, that all fades to raw pleasure.");
	
	output("\n\n<i>“Is that alright?”</i> she asks, drawing your eyes back up to her face. She’s blushing like a rose, chewing on her lower lip between gentle tugs of your cock.");
	
	output("\n\nYou grin at her, giving her butt a little squeeze. <i>“Perfect.”</i>");
	
	output("\n\nKaede giggles, moving a little quicker, adding the movements of her hips to the picture. Her tiny little balls bump rhythmically");
	if (pc.balls > 0) output(" against your [pc.balls]");
	else output(" into the crack of your ass");
	output(" with every thrust. A little moan escapes her lips, and the hand not occupied with your cock slowly makes its way up to her breasts, cupping one of the perky mounds through her silky bra. Taking the hint, you follow her progression from behind, up from the cheeks of her butt to the clasp of her bra. A well-practiced pull has it hanging limply from her shoulder, then quickly discarded. From where you’re sitting, it’s easy to reach up and cup her breasts, squeezing the soft little peaks between your fingers until the half-ausar’s breath catches.");
	
	output("\n\nUnder your ministrations, you can feel her cock throbbing and twitching against your own prick. You don’t doubt the two of you could find a very pleasurable release just like this, but you’ve got other things in mind for the cute little half-ausar.");
	
	output("\n\nBetween squeezing and caresses of her body, your hands meander back down to her thighs, then into your lap. You gently peel Kaede’s fingers off from around your [pc.cock] and guide your stiff shaft back between her legs. Her breath catches when your cock slides up between her cheeks, crown brushing the tight little ring of her hole.");

	output("\n\n<i>“Ah! Hold on a sec,”</i> Kaede moans. You grin as Kaede moves a bit, reaching behind you to a small table on the other side of the couch - which has the added effect and pressing her breasts into your face. When she leans back, she’s got a small bottle of lube in her hand which she squirts out onto her palm. She gives you a playful wink and slips her lubed up hand back around her ass, and grabs your cock again.");
	
	output("\n\nIt’s your turn to gasp as the cold wetness sloughs onto your sensitive cockflesh, making you shiver while Kaede slathers your dick up. Her fingers stroke you from stem to tip, spreading the lube around until you’re completely coated. The rest of the lube she squirts onto a pair of fingers that she slips between her asscheeks, eliciting a muted gasp from her lips. Kaede chews her lip, eyes fluttering closed as she lubes up her hole for you. After a few moments, she seems satisfied, and pops her fingers out with a delightfully wet sound.");
	
	output("\n\n<i>“All yours, [pc.name],”</i> she says with a wiggle of her hips, easing herself back until her ass is pressed against the slick crown of your [pc.cock]. You lock your hands around Kaede’s slender hips and start to guide her down. A flash of pleasure hits you as the halfbreed’s tailhole presses firmly against your [pc.cockHead], resisting for a moment before you finally slide on in.");
	pc.cockChange();
	
	output("\n\nKaede gasps and moans when your prick penetrates her, gliding into the lubed-up passage of her ass. Her back arches, and her tail flicks behind her hard enough to knock controllers and holodisks around behind her. It’s a wonderfully slow process, pulling Kaede down until she’s sat flush against your lap. Your eyes wander from her heaving chest and jiggling breasts to the stiff shaft of her own cock, rubbing against your [pc.belly]. She’s nice and hard, and her canid knot’s starting to swell up with her growing excitement. Your gaze locks onto her pointed tip, though, and the little bubble of translucent white cresting her crown.");
	
	output("\n\nYou can’t help yourself but to reach down and grab the halfbreed’s");
	if (pc.biggestCockLength() > 10) output(" cute little");
	output(" cock. Between you grinding against her anal passage and now your fingers lacing around her shaft, she can’t help but moan and squirm in your grasp.");
	
	output("\n\n<i>“Is it... is it okay if I start moving?”</i> Kaede asks after a moment, cupping one of her perky tits. As she speaks, the white bubble at the tip of her shaft pops, drooling down over your fingers in a sticky wet mess.");
	
	output("\n\nChuckling, you say that it’s normally you who’d be asking that. Kaede giggles, shifting her legs to get a better hold on the couch before she starts to move her hips. You find yourself sucking in a sharp breath as Kaede’s hips lift out of your lap, carrying her a few inches along the length of your shaft, and oh-so-slowly back down again. With every inch of motion, her cock twitches cutely in your hand, dragging through your fingers as her hips move, then thrust back in again. Flashing Kaede a little grin, you grab the bottle of lube off of her and squirt a little into your own hand, giving her cute canid prick a nice and slick tunnel to fuck just like she’s giving you.");
	
	output("\n\nWith that little encouragement to urge her on, Kaede starts to move faster. She wraps her arms around your neck, pulling herself into your lips for a long, drawn-out kiss. You accept it eagerly, relaxing into the halfbreed’s embrace and letting her ride you. Soon, her occasional little moans turn into a symphony of passionate cries and lusty groans as your cock spears her over and over again, and your hand jerks her shaft until she’s babbling <i>“C-cumming cumming cumming!”</i>");
	
	output("\n\nThat was fast! You give the edging half-ausar an understanding look and move your own hand a little quicker, jacking her shaft faster than she can bounce her hips. A few seconds of that treatment, and Kaede’s throwing her head back and arching her spine, howling as a streak of creamy white squirts out and splatters onto your belly. You just keep sliding your hand across her lubed-up shaft until the climactic cumshot trickles down to a little drool of watery aftershocks that dribble onto your fingers.");
	
	output("\n\nBashfully, Kaede looks pointedly away and mumbles <i>“S-sorry, [pc.name]. It’s been a while...”</i>");
	
	output("\n\nYou pat one of her firm backside’s cheeks, telling her that’s more than alright... if she thinks she can handle you taking charge for a bit. To tell the truth, the way she was clenching down on you just then, you’re not that far yourself.");
	
	output("\n\n<i>“Definitely,”</i> she purrs, managing to meet your gaze long enough to kiss you again.");
	
	output("\n\nWith Kaede onboard, you shift your grasp to her butt with both hands, hefting her up and onto her back. She gives a little cry of surprise as you plant her onto the face of her holoprojector table, but the way her tail wags when your [pc.cock] is suddenly thrust ");
	if (pc.balls > 0) output("balls-");
	output("deep into her tight hole tells you that she’s more than alright. You heft her legs up and around your shoulders, giving you something to lean against... and letting you get just that much deeper into the quivering passage clinging to your cock.");
	
	output("\n\nShe moans as your");
	if (pc.balls > 0) output(" balls")
	else output(" hips");
	output(" slap against her bent cheeks, but a lusty look and a twitch of her prick says she’s ready for more. Your hips slide back, nice and slow, dragging your [pc.cock] through the slick, hot vice of Kaede’s ass until just the crown’s spreading her dark hole open. As you do, you watch with glee as Kaede’s red shaft slowly climbs its way back until it’s standing as straight as a flagpole. One of her hands languidly slips down to wrap around it, stroking the still-sensitive length until she’s sucking in sharp, pleasured breaths.");
	
	output("\n\nYou give it back to her hard, slamming your hips back home and eliciting a wailing cry of pleasure from the halfbreed. That’s more like it! You lean in and start pumping your [pc.hips], short and fast thrusts into her sodden hole.");
	
	output("\n\nWet squelches echo through <i>Talon Rogue</i>’s common room as you fuck its captain senseless. Your cock hammers her tight ass, vigorously pounding away until you can feel the rising pressure tingling through your loins. You’re so close now you can almost taste it...");

	processTime(20+rand(15));

	clearMenu();
	addButton(0, "Facial", kaedeMyrellionFuckAssFacial, undefined, "Facial", "Pull your cock out of Kaede’s ass and cum all over her face!");
	addButton(1, "Creampie", kaedeMyrellionFuckAssCreampie, undefined, "Creampie", "Bust your nut inside Kaede’s tight little ass.");
}

public function kaedeMyrellionFuckAssFacial():void
{
	clearOutput();
	kaedeHeader(true);

	output("A wicked throught crosses your mind, only just managing to drown out the spasms of pleasure starting to wrack your body long enough to entice you into action. At the apex of a thrust, you rock your hips just a little further back, enough to pull yourself completely out of Kaede’s clenching hole. You lunge forward, grabbing Kaede’s head of auburn hair and lifting her up to look your one-eyed snake dead on.");
	
	output("\n\nShe goes wide-eyed, just in time for the first spurt of [pc.cumNoun] to squirt out from your [pc.cock] and splatter across her face. Kaede yelps and laughs as spunk smears over her lips and cheeks. You furiously stroke your prick, milking out every drop onto Kaede’s face and breasts, then trickles out onto her belly as your orgasm starts to subside.");

	kaedeMyrellionFuckAssCombine();
}

public function kaedeMyrellionFuckAssCreampie():void
{
	clearOutput();
	kaedeHeader();
	
	output("With a final cry of pleasure, you slam yourself to the hilt inside the halfbreed’s well-fucked ass. She clenches hard around you, voice joining yours as her body squeezes the cum right out of you. You feel the rush of semen hurtle through your [pc.cock] and into the dark depths of Kaede’s ass. Her breath catches as she feels your hot, sticky spunk coat her bowels.");
	
	output("\n\nYou manage a few last, jerky thrusts into her ass to empty your [pc.balls] into her.");

	kaedeMyrellionFuckAssCombine(true);
}

public function kaedeMyrellionFuckAssCombine(cumInside:Boolean = false):void
{
	output("\n\nBreathing hard, Kaede flops back against the holoprojector. Her half-hard prick twitches, resting against her belly and drooling a little bit of second-wave pre from its pointed tip. The air is heavy with the mixing scents of cum and sweat; the only sounds are you and Kaede panting, trying to catch your breath after the vigorous fucking.");
	
	output("\n\n<i>“Oh my God...”</i> Kaede moans, running a hand through her fiery hair. <i>“That was great, [pc.name].”</i>");
	
	output("\n\nYou smile down at her, patting her thigh. Her cock jumps a little at your hand’s nearness, almost tempting you into continuing your love-making by jacking the cute red shaft off. Instead, you slip out from between Kaede’s legs and flop back onto the couch");
	if (cumInside) output(", watching gleefully as a trickle of your [pc.cumNoun] drools out of her well-fucked ass");
	output(".");
	
	output("\n\nAfter a few moments of companionable quiet, Kaede grunts and sits up, crossing her legs over her crotch. She picks up the glasses she’d brought out beforehand and pours a couple of drinks out, one for each of you.");
	
	output("\n\nYou clink your glasses together, both laughing <i>“Cheers,”</i> before you drink.");
	
	if (flags["KAEDE_ENCOUNTERSEX_UVETO_OVERRIDE"] == undefined)
	{
		output("\n\nBy the time you finish your glass, Kaede’s making eyes towards her cabin, and the pile of clothes she’s doubtless left behind. <i>“So, uh, I should probably get going,”</i> she says, hopping off the table and clinking her glass onto the projector’s top. <i>“Still got that delivery to make... I’m sure that Fed guard’s thinking I fell off a cliff or something.”</i>");
		
		output("\n\n<i>“Yeah,”</i> you say, grabbing your [pc.gear]. <i>“This was fun, Kaede.”</i>");
		
		output("\n\nShe winks at you. <i>“Definitely. Maybe we can do it again sometime.”</i>");
		
		output("\n\nYou tell her you’re looking forward to it as she strides off into her cabin. She leaves the door open, letting you watch as she divests herself of the kinky lingerie and slips back into her boxers, jeans, and tanktop. You manage to get dressed quickly enough, and join Kaede on the way towards the airlock. As it’s opening up, she stops to grab your hands and plant a kiss on your cheek.");
		
		output("\n\n<i>“See you later, [pc.name],”</i> she says with a smile, heading off onto the tarmac. You disembark, heading back toward the transport hub. Hopefully you’ll get another chance at that cute piece of ass again sometime soon!");

		currentLocation = "600";
		generateMapForLocation(currentLocation);
		showName("AIRFIELD\nSOUTH");

		processTime(20+rand(10));
		pc.orgasm();
		
		clearMenu();
		addButton(0, "Next", mainGameMenu);
	}
	else
	{
		flags["KAEDE_ENCOUNTERSEX_UVETO_OVERRIDE"] = undefined;
		
		output("\n\nBy the time you finish your glass, Kaede’s cheeks are flushed, and you can see one of her hands has made its way to the [pc.cumNoun]-stains on her alabaster flesh, idly playing with the mess you made. <i>“Something tells me I can’t go to my meeting like this,”</i> she chuckles, licking a strand of spunk off one of her claw-like nails. You both laugh again, and Kaede rolls her head back with a sigh.");

		output("\n\n<i>“I better go get cleaned up. I don’t think Ashi’s sister would appreciate me swaggering in smelling like my lover’s cum. Then again... nah! Need a shower.”</i>");

		processTime(20+rand(10));
		pc.orgasm();
		
		//[Shower With] [Say Goodbye]
		clearMenu();
		addButton(0, "ShowerWith", uvetoKaedeShowerWith, true, "Shower With Her", "You’ve gotten sweaty and sticky after that close encounter, too. Suggest that you and Kaede shower up together.");
		addButton(1, "SayGoodbye", uvetoKaedeGoodbye, undefined, "Say Goodbye", "That’s enough of that. Say goobye to Kaede, and get back to business.");
	}
}

public function kaedeMyrellionSucknRide():void
{
	clearOutput();
	kaedeHeader(true);

	output("Your eyes wander inexorably towards the turgid red shaft resting on your belly. " + pc.catDog("You can’t help but lick your lips at the sight of it.", "Now that’s one doggy bone you can’t wait to lick!", false) + " Your hand slips down and wraps around her cock, and you suck in a sharp breath as you feel the hotness of it, more than a human’s ought to be, and diamond hard between your fingers. Kaede moans, leaning back on her knees and cupping one of her breasts as you start to tentatively stroke her length.");
	
	output("\n\n<i>“Oooh,”</i> she purrs, starting to move her hips. <i>“That’s nice...”</i>");
	
	output("\n\nYou’re sure the horny half-ausar would love to just sit there and let you jerk her off until she busts her nut all over your [pc.chest]");
	if (pc.isBimbo() || pc.isTreated()) output(" - and you would too, to be honest -");
	else output(",");
	output(" but you’ve got other plans for that sweet cock of hers. You switch your grip, going from the half-ausar’s sex to her hips, grabbing her and flipping the pair of you over. Kaede yelps, tail and ears tucking in defensively as she’s rolled onto her back. You end up on top now, straddling the dazed halfbreed with her juicy red prick nestled flush against your thigh. It’d be so easy to just sink down and spear yourself on it, take its full length into your [pc.vagOrAss] and ride it until the cows come home.");
	
	output("\n\n<i>Patience</i>, you have to tell yourself, slinking down off the couch and between Kaede’s splayed legs. She shivers, her tail flicking in your face as your fingers brush along her pale thighs and up to the tight little pouch of her balls. You can feel her body tremble as your fingertips brush the taut flesh of Kaede’s sack; her prick jumps to attention, though, and you can see the dark star of her ass clench when you draw near.");
	
	output("\n\nYou trace your way up the swell of the shemale’s sack, all the way up to the base of her red puppy pecker. She moans as you wrap your digits around her shaft, sheathing all but the tapered tip in your grip. Nice and slow, you angle her shaft towards your [pc.lips] and lean in, letting your [pc.tongue] play out and caress her crown. Her back arches, putting her whole body into the approach of your mouth like she’s trying to meet you halfway. Eager girl! You push her down again, pinning her to the sofa, and wrap your lips around the tip of her cock.");
	
	output("\n\nKaede’s got a wonderfully salty, earthy taste. Muskier than a human cock would be, and stronger smelling. Your heart flutters as the paradoxically masculine smells waft up to you, setting your lusts aflame. It’s impossible to resist the urge to slide your lips down that shaft, sucking up every inch of puppyslut flesh on offer. One by one, your fingers peel away from her rod, making way for your slow descent. It isn’t long before you can feel a pointed tip pressing into the back of your throat, bending ever so slightly as you plant a kiss on Kaede’s bare crotch.");
	
	output("\n\nYou look up at her, in time to see the cute halfbreed chewing on her lip and blushing like a rose. She reaches an unsure hand down to stroke your [pc.hair]. You answer the sweet gesture with a swirl of your tongue around the still-flaccid ball of her knot, sending a throbbing shudder through her prick. Something delightfully warm and sticky smears onto the back of your throat from where her crown is nestled, and the salty scent of pre-cum roils through your senses.");
	// {if bimbo/Treated/cum-dependent:
	if (pc.isBimbo() || pc.isTreated() || pc.isCumSlut()) output(" You wish you could just suck this little cutie off until she gives you a big, hot load of spunk to swallow down... but then you wouldn’t get to shove it in your [pc.vagOrAss]!");
	
	output("\n\nThe thought of Kaede’s knotty cock going somewhere other than your mouth spurs you on, urging you to slather her shaft with a nice, thick coating of spittle. You work your tongue from base to crown and down again, lavishing every inch of red puppy prick with wet affection. She answers your motions with cute little moans and twitches of her hips, bucking against your lips. You let her have her fun, thrusting her hips into you until she sounds like she’s barely holding on. Kaede cups her breasts, squeezing her nipples and moaning like a lusty whore. You enjoy every second of her sensual show until you’re more than satisfied with the glaze of spit-lube coating her cock.");
	
	output("\n\nEnough of that, then. You pull yourself off of the sumptuous shaft of shemale cock and start to crawl up her svelte little body, pushing Kaede back into the couch and straddling her slender hips. She looks up at you with those big, blue eyes of hers and rests her hands on your hips, gently guiding you down towards the pillar of canine meat between her legs. You wiggle your hips against her rod, letting it nestle");
	if (!pc.hasVagina()) output(" into the crack of your ass");
	else output(" against your thigh");
	output(".");
	
	output("\n\nA second of silent tension passes, Kaede staring at you, and you steadying yourself before you take the plunge. Finally, she gives you a little nod, and you start your slow descent.");
	if(pc.genitalLocation() <= 1) output(" Your fingers wrap around Kaede’s spit-slicked cock, angling it towards the waiting " + (pc.hasVagina() ? "lips" : "ring") + " of your [pc.vagOrAss].");
	else output(" You moan as Kaede takes her spit-slicked cock and angles it towards the waiting " + (pc.hasVagina() ? "lips" : "ring") + " of your [pc.vagOrAss].");
	output(" Your lover shudders as her pointed tip brushes the entrance to your hole, but you hold her steady as your [pc.hips] start to slide downwards.");
	
	output("\n\nYour breath catches in your throat, feeling tendrils of electric pleasure writhing through your body when Kaede’s cock starts to spread your [pc.vagOrAss] open.");
	if (pc.hasCock())
	{
		output(" Your own [pc.cock] jumps in response, feeling the pressure on your");
		if (!pc.hasVagina()) output(" prostate");
		else output(" g-spot");
		output(" reciprocating through your own prick. You");
		if(pc.genitalLocation() <= 1) output(" can’t help but wrap a few fingers around your [pc.cock], stroking yourself");
		else output("r [pc.cock] feels terribly neglected when your reach fails, all");
		output(" while you slide down Kaede’s length.");
	}
	output(" A moan escapes your lips, voice warbling as you feel the stiff, pointed shaft of Kaede’s prick spear your hole.");
	
	var ppKaede:PregnancyPlaceholder = getKaedePregContainer();
	var holeTightness:Number;

	if (pc.hasVagina())
	{
		holeTightness = pc.vaginas[0].looseness();
		pc.cuntChange(0, ppKaede.cockVolume(0), true, true, false);
	}
	else
	{
		holeTightness = pc.ass.looseness();
		pc.buttChange(ppKaede.cockVolume(0), true, true, false);
	}

	output("\n\n");
	if (holeTightness <= 1) output("<i>“Oooh, that’s tight!”</i> Kaede moans, arching her back and caressing one of her perky breasts.");
	else if (holeTightness <= 3) output("<i>“Oh, that’s nice...”</i> Kaede moans, arching her back into your descent. <i>“Nice and snug in there!”</i>");
	else
	{
		output("<i>“Woah,”</i> Kaede groans when you bottom out on her all but effortlessly. <i>“You’ve got a talented");
		if (pc.hasVagina()) output(" pussy");
		else output(" ass");
		output(", [pc.name]!”</i>");
	}
	
	output("\n\nYou give her a wink, settling your [pc.butt] down on the halfbreed’s lap. Your arms lace around her neck and shoulders, helping to steady you overtop her. Kaede smiles prettily at you, her fingers gently squeezing your [pc.hips], urging you to motion. Following the half-ausar’s movements, you start to rise up on your [pc.knees], shivering at the sensation of her throbbing length sliding out of you to the tip. You hold at the top, making Kaede moan in anticipation before letting gravity carry you back down into her lap until your ass rubs against her tight pouch of a sack. A few more movements like that and you’ve worked yourself up to a quick and playful bounce, shifting your hands down to her breasts for support, squeezing and pinching Kaede’s nipples until her voice is nothing but a stream of husky moans.");
	
	output("\n\nThe way she’s going, you don’t expect your lover to last much longer. While you can, you do everything in your power to speed your way to orgasm: guiding her hands up to play with your [pc.chest], rubbing at");
	if (pc.hasClit()) output(" the bud of your [pc.clit]");
	else output(" your own sensitive spots");
	output(", and shifting your [pc.hips] to make sure Kaede’s cock is grinding against the most tender parts of your slick passage. It’s a desperate race to catch up to your partner, but as she starts to murmur warnings of her impending orgasm, you’re able to answer her with a simple <i>“Me too,”</i> and pull her into a kiss.");
	
	output("\n\nA moment later, you feel Kaede’s knot pressing into your [pc.vagOrAss], and the first spurt of hot seed shooting into your");
	if (!pc.hasVagina()) output(" bowels");
	else output(" womb");
	output(". The feeling of that wonderfully sticky heat and the forceful stretch as Kaede hammers her knot into you sends you over the edge with her. You moan into the kiss, letting your [pc.vagOrAss] contract and squeeze around Kaede’s cock. The sensation of semen slathering over your");
	if (!pc.hasVagina()) output(" anal");
	else output(" vaginal");
	output(" walls sends shivers all through you, and your moans redouble into your lover’s lips. Your [pc.chest] presses against her breasts, and your arms wrap around Kaede to pull her tight against you. Both your hips grind against each other, ramming her knot deeper into your straining hole.");
	
	output("\n\nSeveral minutes of pleasurable moans and sighs follow as you and Kaede bask in the afterglow. Your hips gently rock, enjoying the fullness of the knot stretching you and grinding against your tender walls. Slowly but surely, the tie holding you together starts to deflate, releasing you from Kaede’s grasp.");
	
	if(pc.hasVagina()) pc.loadInCunt(ppKaede, 0);
	else pc.loadInAss(ppKaede);
	
	output("\n\nWhen you’re sure you can slip it out of you, you rise up on your [pc.knees] and ease Kaede’s cock on out. It pops wetly from your [pc.vagOrAss], leaving a trickling trail of cum down your thigh.");
	
	output("\n\n<i>“Oh my God...”</i> Kaede moans, running a hand through her fiery hair. <i>“That was great, [pc.name].”</i>");
	
	output("\n\nYou smile down at her, cupping her cheek and running your thumb across it. Her cock jumps a little at your hand’s nearness, almost tempting you into continuing your love-making by jacking the cute red shaft off. Instead, you roll out of Kaede’s lap and onto the couch beside her.");
	
	output("\n\nAfter a few moments of companionable quiet, Kaede grunts and sits up, crossing her legs over her crotch. She picks up the glasses she’d brought out beforehand and pours a couple of drinks out, one for each of you.");
	
	output("\n\nYou clink your glasses together, both laughing <i>“Cheers,”</i> before you drink.");
	
	if (flags["KAEDE_ENCOUNTERSEX_UVETO_OVERRIDE"] == undefined)
	{	
		output("\n\nBy the time you finish your glass, Kaede’s making eyes towards her cabin, and the pile of clothes she’s doubtless left behind. <i>“So, uh, I should probably get going,”</i> she says, hopping off the table and clinking her glass onto the projector’s top. <i>“Still got that delivery to make... I’m sure that Fed guard’s thinking I fell off a cliff or something.”</i>");
		
		output("\n\n<i>“Yeah,”</i> you say, grabbing your [pc.gear]. <i>“This was fun, Kaede.”</i>");
		
		output("\n\nShe winks at you. <i>“Definitely. Maybe we can do it again sometime.”</i>");
		
		output("\n\nYou tell her you’re looking forward to it as she strides off into her cabin. She leaves the door open, letting you watch as she divests herself of the kinky lingerie and slips back into her boxers, jeans, and tanktop. You manage to get dressed quickly enough, and join Kaede on the way towards the airlock. As it’s opening up, she stops to grab your hands and plant a kiss on your cheek.");
		
		output("\n\n<i>“See you later, [pc.name],”</i> she says with a smile, heading off onto the tarmac. You disembark, heading back toward the transport hub. Hopefully you’ll get another chance at that cute piece of ass again sometime soon!");

		processTime(45+rand(15));
		pc.orgasm();

		currentLocation = "600";
		generateMapForLocation(currentLocation);
		showName("AIRFIELD\nSOUTH");

		clearMenu();
		addButton(0, "Next", mainGameMenu);
	}
	else
	{
		flags["KAEDE_ENCOUNTERSEX_UVETO_OVERRIDE"] = undefined;
		
		output("\n\nBy the time you finish your glass, Kaede’s cheeks are flushed, and you can see one of her hands has made its way to the [pc.cumNoun]-stains on her alabaster flesh, idly playing with the mess you made. <i>“Something tells me I can’t go to my meeting like this,”</i> she chuckles, licking a strand of spunk off one of her claw-like nails. You both laugh again, and Kaede rolls her head back with a sigh.");

		output("\n\n<i>“I better go get cleaned up. I don’t think Ashi’s sister would appreciate me swaggering in smelling like my lover’s cum. Then again... nah! Need a shower.”</i>");

		processTime(45+rand(15));
		pc.orgasm();
		
		//[Shower With] [Say Goodbye]
		clearMenu();
		addButton(0, "ShowerWith", uvetoKaedeShowerWith, false, "Shower With Her", "You’ve gotten sweaty and sticky after that close encounter, too. Suggest that you and Kaede shower up together.");
		addButton(1, "SayGoodbye", uvetoKaedeGoodbye, undefined, "Say Goodbye", "That’s enough of that. Say goobye to Kaede, and get back to business.");
	}
}


/*Kaedepsawn Encounter
Savin

Kaedespawn Intro Whoo
Business
Pleasure
Combine
Go With Her
Meet Cass
PC Cock Vers. Here
Invite Kaede
Bust a Nut!
PC Vag Vers. Here
Leave

Kaedespawn Intro Whoo*/

//PC must have fucked Kaede before. 
//Play on New Texas during the day, on the square outside Iced Teats
public function kaedeThreeSomesOrSpawnOrSomethingCassTits():void
{
	showKaedeAndCass();
	flags["MET_CASS"] = 1;
	flags["KAEDE_NT_ENCOUNTER"] = 1;
	output("\n\nAs you’re heading down the long path through Tee’s Ranch, you cast a glance towards the colorful pillbox on the side of the road with its glowing neon Iced Teats sign. As you’re passing by, you see the door swing open and a pair of red-headed beauties saunter out: One, a busty, all-around voluptuous cow-girl crammed into a skin-tight jumpsuit that emphasizes her thick curves and jiggly assets, giving her a noticeable, damp-looking camel-toe besides. You’d easily mistake her for any other New Texan cow-girl, if not for the pair of furry tails swishing behind her.");
	output("\n\nThe other girl, holding the cow’s hand in one arm, and carrying a little pink cloth-wrapped bundle in the other, catches your attention even more. You recognize her after a second, thanks to the familiar huge wolf-ears peeking over her head and the fluffy red tail battering the ground behind her as she walks - it’s Kaede!");
	output("\n\nShe notices you about the same time, her tail suddenly goes from a steady pace to swishing a mile an hour behind her, and she waves eagerly. <i>“Hey, [pc.name]!”</i>");
	output("\n\nWhat’s she doing here, you wonder - and who’s the cow-girl she’s all friendly with? You wave back and head over, earning a big smile from both girls.");
	output("\n\n<i>“Oh, is this, like, </i>the<i> [pc.name]?”</i> the cow-girl giggles excitedly, fluttering her eyelashes at you. <i>“Kaede won’t stop talking about you, captain. I think you’ve made an impression on my shy little slut-puppy!”</i>");
	output("\n\n<i>“Shush!”</i> Kaede whines, flushing beet-red and tucking her ears down. <i>“Uh, h-hi [pc.name]. Good to see you.”</i>");
	output("\n\nYou smile at the cow-girl’s <i>“slut-puppy,”</i> ");
	if(pc.isMischievous()) output("and reach out to ruffle Kaede’s hair. <i>“Been talking about me, have you? ");
	else output("and ruffle Kaede’s hair. <i>“");
	output("Who’s your friend?”</i>");

	output("\n\n<i>“I’m Cass,”</i> the part kaithrit, part cow answers, taking a jiggly step closer and giving you a lascivious wink. Now that she’s in arm’s reach, you ");
	//if (half-)ausar/kaithrit:
	if(pc.horseScore() >= 3 || pc.ausarScore() >= 2 || pc.kaithritScore() >= 3 || pc.leithanScore() >= 3 || pc.felineScore() >= 5 || pc.canineScore() >= 5)
	{
		output("suddenly get hit with an overwhelming aura of fuck-pheromones billowing off her, positively seeping through her sexy suit. You instantly feel a flush of arousal as the giggling bimbo sidles up even closer, clearly aware of the effect she’s having on you, and enjoying every second of it. You half expect her to");
		if(pc.hasCock()) output(" bend over on the spot for you.");
		else output(" zip down that one-piece suit and ask you when the last time you’d eaten was.");
	}
	//elseif
	else output(" catch a whiff of something wet and lurid wafting off of the kaithrit cow-girl, like a bestial signal screaming <i>“I’m in heat: fuck me!”</i>");
	output(" Seeing the way you start squirming, Cass wiggles her hips and presses her shoulders together in a way that pushes up her big, bovine udders. <i>“</i>Super<i> pleased to meet you!”</i>");

	output("\n\nBefore you can decide on a response to her none-too-subtle display");
	if((pc.isBro() || pc.isAss()) && pc.hasCock()) output(" - at least, one that’s a little more nuanced than shoving her on her knees and giving her a taste of your [pc.cock] -");
	else output(",");
	output(" you see the pink bundle in Kaede’s arms squirm around, and a sudden shrill cry pierces the otherwise placid quietude of the ");
	if(hours > 0 && hours < 12) output("morning");
	else if(hours <= 5) output("afternoon");
	else output("evening");
	output(". <i>“Oh, what’s wrong sweetie?”</i> Kaede coos, bouncing the bundle gently in her arms. Is that...");

	output("\n\nKaede confirms your sudden suspicion, pulling the top hood of cloth down to reveal a tiny, pink head with a pair of tiny red wolf-ears perched on top of her thin layer of ginger hair. Kaede fusses at the baby, murmuring nonsense at her until the outburst abates, leaving the kid staring at you with huge, awestruck blue eyes while she sucks on her thumb. You catch sight of a single, slender tail wiggling around at the bottom of the bundle, a poof of red fur pluming from an otherwise feline-looking tail.");

	output("\n\n<i>“Sorry about that!”</i> Kaede chuckles, turning her attention back to you. <i>“Somebody’s being really whiny today. Oh, speaking of which... this is Kayla.”</i>");

	output("\n\n<i>“Say ‘hi’ to [pc.name], Kayla!”</i> Cass giggles, bouncing over and taking one of what must be her - or rather <i>their</i> - daughter’s hand and getting her to wave at you.");

	output("\n\nYou grin despite yourself and play along, leaning in and waving at the wide-eyed baby. She reaches her arms out to you, and before you know what’s happening, Cass is handing the curious kiddo off to you, and you’re awkwardly cradling the ginger half-breed - quarter breed? - while her parents lean in and play with her.");

	//if PC is topless and milky!:
	if(pc.isLactating() && pc.isChestExposed()) 
	{
		output("\n\nKayla pays them exactly no attention, though, as the baby does what babies do when a milky tit’s anywhere near them. You go wide-eyed in surprise as Kaede’s kid helps herself to a snack.");
		output("\n\n<i>“Oh my gosh!”</i> Kaede yelps, somehow managing to get redder than before. <i>“I-I’m so sorry I...”</i>");
		output("\n\n<i>“I think [pc.heShe] likes it!”</i> Cass grins, giving you a wink.");
	}
	else
	{
		output("\n\nYou cradle the cat-dog-girl in your arms, fussing at her and giving her your biggest smile.");
	}
	output(" A few minutes later, you manage to hand the giggling child back to her bovine parent, who all but rests her atop her gravity-defying tits.");
	output("\n\n<i>“So, what brings you to New Texas, Captain?”</i> Cass smiles. <i>“Business or pleasure?”</i>");
	//[Business] [Pleasure]
	processTime(15);
	clearMenu();
	addButton(0,"Business",businessKaedeVisit,undefined,"Business","You came to New Texas strictly for business - a wealthy planet like this is bound to get the attention of a soon-to-be business magnate like yourself.");
	addButton(1,"Pleasure",pleasureKaedeVisit,undefined,"Pleasure","New Texas is a pleasure resort world, after all. What else would you come here for?");
}

//Business
//You came to New Texas strictly for business - a wealthy planet like this is bound to get the attention of a soon-to-be business magnate like yourself.
public function businessKaedeVisit():void
{
	clearOutput();
	showKaedeAndCass();
	output("<i>“Business,”</i> you answer, trying to ignore the constant fuck-me aura radiating off the cat-cum-cow-girl.");
	output("\n\n<i>“That’s what I said the first time, too,”</i> she chuckles, tails swishing behind her. <i>“Lots of us spacers come here for work... but stay for the pleasure! Take it from me, the Treatment’s hard to resist... not that you’d want to.”</i>");
	postBusinessPleasureKaedeVisit();
}

//Pleasure
//New Texas is a pleasure resort world, after all. What else would you come here for?
public function pleasureKaedeVisit():void
{
	clearOutput();
	showKaedeAndCass();
	output("<i>“Pleasure,”</i> you smile, drinking deep of the fuck-me aura radiating off of the kitty-cow. By the way she smiles at your answer, something tells you it wouldn’t take much effort at all to get a little closer to her... maybe with Kaede at the same time.");
	postBusinessPleasureKaedeVisit();
}

//Combine
public function postBusinessPleasureKaedeVisit():void
{
	output("\n\n<i>“So, uh,”</i> Kaede says, quickly stepping ahead of Cass. <i>“Would you mind taking Kayla home, Cass? She’s looking pretty sleepy, and I’d love to catch up with [pc.name]...”</i>");
	output("\n\nThe cow-girl gives her lover a pouty look, but as if on cue her daughter makes a very loud, expressive yawn and nuzzles against her chest. <i>“Oh, alright. Somebody needs a nap, I guess! I’ll see you around, Captain,”</i> she winks before sashaying off, her broodmare-like hips swaying hypnotically as she walks down the road.");
	output("\n\nThe moment Cass has her back to you, Kaede slumps forward face-first into your chest, almost barreling you over. She clutches at your shoulders, a huge sigh escaping her lungs, and her big ears flop down against her head.");
	output("\n\n<i>“I am sooooo exhausted,”</i> the half-ausar whines, leaning heavily against you. <i>“Cass’s Treatment made it so she can’t think straight without just getting fucked </i>constantly<i>. I... I can’t keep up, [pc.name]. She’s draining me dry - I can’t feel anything between my legs. Heeeelp.”</i>");
	output("\n\nYou wrap your arms around the drained girl’s arms, supporting her as best you can - for such a skinny thing, she’s got some weight!");
	if(silly) output(" Must be all that tail-floof.");
	output(" You give her a few affectionate pats until she’s recovered enough to stand back up, running a hand through her bright orange hair.");
	output("\n\n<i>“Sorry,”</i> she sighs. <i>“I’m sure you didn’t want to hear that. I just... God, I need a break.”</i>");
	output("\n\nYou assure her that it’s alright. What’re friends for, after all? That said, you had no idea Kaede had a daughter. You have to admit you’re rather surprised.");
	output("\n\n<i>“Did Anno never mention? Seems like she never stops talking about Kayla when we’re together,”</i> she laughs. <i>“But, uh, yeah... I’ve got a baby girl. Believe me, I’m as surprised as you are. Cass and I go way back, though. I mean, we grew up together on Tavros, and I kind of had a crush on her in my teens, but I never would have expected... not with her, anyway. Not to say I’m not happy - Kayla’s absolutely amazing, isn’t she? I wouldn’t trade her for the world.”</i>");
	output("\n\nShe certainly was doting on the wide-eyed little crossbreed she fathered, though the way she’s talking, you imagine there’s got to be some kind of juicy story behind Kaede becoming a parent. She blushes a little at the question, saying, <i>“Tell you what: </i>Talon<i>’s parked in the weird barn-spaceport-thing down the street. Why don’t we go back to my place, and I’ll tell you the story over a drink... and maybe a lie-down? I really could use a nap.”</i>");
	output("\n\nWell, that’s a tempting offer. Do you go cuddle up with Kaede and let her tell you a tale, or do you have something else in mind?");
	//[Go With Her] [Meet Cass] [Leave]
	processTime(11);
	clearMenu();
	addButton(0,"Go With Her",hangOutWithKaede,undefined,"Go With Her","You’d be happy to go with her and hear Kaede’s story.");
	if(pc.hasGenitals()) addButton(1,"Meet Cass",meetCassWithKaede,undefined,"Meet Cass","Actually, you’d rather meet back up with her baby momma. Cass was giving you some pretty obvious signals, and if poor Kaede can’t sate the kitty-cow’s needs, well...");
	else addDisabledButton(1,"Meet Cass","Meet Cass","Cass won’t want to hang out with someone who can’t have a little sexy fun.");
	addButton(14,"Leave",leaveKaedeCassThreeSome,undefined,"Leave","You’ve got places to be and things to do. Leave Kaede to her own devices.");
}

//Go With Her
//You’d be happy to go with her and hear Kaede’s story.
//+Alcohol
public function hangOutWithKaede():void
{
	clearOutput();
	showKaede();
	author("Savin");
	output("<i>“Sure, let’s go,”</i> you answer, offering the tired-out pup your arm. She takes it gratefully, tucking in close to you as you make your way back towards the landing barn. All through the walk back, you feel Kaede’s auburn tail swishing heavily against your [pc.leg], wagging nice and fast to show her obvious pleasure. She smiles up at you from time to time, especially as you pass through customs; Ogram and Amma both give you a knowing look as you head into the landing bay.");
	output("\n\nYou find Kaede’s weathered old red-and-white colored freighter parked just a few spaces from your own vessel, currently in the middle of winching up several cargo crates and one of those old KihaCorp auto-loader drones. Guess Kaede’s double-dipping business with pleasure while she’s here on New Texas.");
	output("\n\nShe lowers the boarding ramp on the side of <i>Talon Rogue</i>’s bridge neck and beckons you aboard, into the comfortable embrace of the heavy air conditioning blasting inside. The heart of the ship’s main deck is given over to a cozy, circular rec room, with a plush couch curving around a holotable that’s covered with the carcasses of ");
	if(flags["MET_HERMAN"] == undefined) output("what looks like take out BBQ");
	else output("Chef Herman’s to-go box, with diet soda of course");
	output(". <i>“Ugh. I thought I cleaned that up,”</i> Kaede murmurs to herself, walking straight past the mess in her living room and punching the door to her cabin. The bulkhead slides open with a pneumatic hiss, revealing a small chamber and an even smaller bed, surrounded by posters for video games and heavy metal bands.");
	output("\n\n<i>“Coming?”</i> she asks, smiling at you over her shoulder and raising her tail invitingly. You follow her eagerly into her bedroom, stepping in just as Kaede’s hanging up her leather jacket and wiggling her tail out of her hole in her jeans. She lets out a relieved sigh, slipping the garment down and giving you a well-deserved look at her tight little butt, tightly hugged by her dark boxer briefs. Stripped down to her underpants and tanktop, Kaede fishes out a big bottle of whiskey from a cabinet and flops down onto the side of her bed, leaving plenty of room for you.");
	output("\n\nA few moments later and you’re leaning back against the bulkhead, sipping on a glass and letting your half-ausar lover snuggle against your [pc.chest]. <i>“Oh, I needed this,”</i> she murmurs, eyes drooping low. <i>“If I’d stayed with Cass much longer, I think I might’ve dropped from exhaustion. Maybe next time I’ll see if she can just drop Kayla off with me...”</i>");
	output("\n\nSpeaking of which, you recall something about Kaede owning you a story...");
	output("\n\n<i>“Right, right. I did say that,”</i> Kaede yawns. <i>“Let’s see... like I said, Cass and I grew up together. That was back before the Rush, when there weren’t nearly so many people on Tavros. Not a lot of kids, for sure, so we all sort of gravitated to one another. Especially us non-humans. Cass and I both wanted to grow up as spacers, just like our parents; we went to school together; Cass even went with me for my first Estrobloom battery when I hit my teens. We were close... I wanted to be closer, but I was so shy and awkward back then. Even more than I am now, if you can believe it.”</i>");
	output("\n\nYou’d kind of liked to have seen a cute, awkward younger Kaede trying to flirt with a feisty cat-girl.");
	output("\n\nKaede gives you a playful swat and finishes off her drink. <i>“Anyway, that didn’t really work out, and I went off to college, then got </i>Talon<i> here. Cass got her own ship, too, so there wasn’t much chance of us seeing each other for a few years... until out of nowhere, she shows up on my door, gone from a little rail of a girl with no tits or ass to speak of to, well, what you saw back outside. She’d taken the Treatment right after a job here on New Texas, I guess, and had her changes on the trip back. I guess I found out that night I’d inherited my ausar half’s sensitivity to, uh, pheromones. She was newly Treated, and I gave in to good old animal rut... you can imagine what happened after that.”</i>");
	output("\n\n<i>“Definitely. But after </i>that<i>?”</i>");
	output("\n\n<i>“After that...”</i> Kaede sighs. <i>“Well, I woke up the next morning alone. She’d split while I was sleeping it off. I went searching for her, tore up all of Tavros, but by the time I thought to check at the hangar, she and her ship were already gone. The next time I saw Cass was on a video message from a New Texan hospital, asking if I’d ever thought of any good girl’s names.”</i>");
	output("\n\n<i>“That’s rough,”</i> you say, holding Kaede a little closer.");
	output("\n\nShe murmurs her agreement, followed by a big yawn. <i>“Man, my love life is so weird. I accidentally knocked up my best friend, and my college sweetheart - who somehow still hasn’t proposed to me after all these years - thinks that’s just the best thing ever. Meanwhile I’m here on New Texas to meet the mother of my child while also doing space-trucker work for my wealthy leithan sugar-momma, and snuggled up to my girlfriend’s rich play" + pc.mf("boy boy","girl girl") + "friend. Sheesh,”</i> she laughs. <i>“It sounds even weirder when I say it, too.”</i>");
	output("\n\nYou’re not sure that really holds a candle to your adventures, but still... you suppose the frontier does lend itself to very unusual relationships. Or webs of relationships, in both your cases.");
	output("\n\nAnd what was that about proposing?");
	output("\n\nYou try and ask, but find the exhausted pup’s dozed off in your arms, nuzzling her cheek against your chest and breathing deep. You sigh and let her sleep, content to drift off in your lover’s embrace...");

	//[Next]
	//Pass 3 hours. Gain benefit of resting.
	pc.imbibeAlcohol(25);
	processTime(185);
	clearMenu();
	addButton(0,"Next",wentDrinkingWithKaedeAfterMeetingCass);
}

public function wentDrinkingWithKaedeAfterMeetingCass():void
{
	clearOutput();
	showKaede();
	output("You wake up some time later, feeling refreshed after your nap. Rubbing at your eyes and stretching, you look around and see that Kaede’s up and about, pacing barefoot through the rec room. You stay quiet for a few moments, appreciating the view of long, smooth legs and perky behind before you finally catch the half-breed beauty’s gaze, and give her a lazy wave.");
	output("\n\n<i>“Heyya,”</i> Kaede smiles. <i>“Hope you slept as well as I did. Just got up, myself. But boy did I need that.”</i>");
	output("\n\n<i>“Any time,”</i> you smirk, slowly pulling yourself out of the comfy bed and walking over to slip an arm around Kaede’s waist. She wags her tail and hugs you tight. <i>“So, what’s next?”</i>");
	output("\n\nShe answers with a shrug. <i>“I guess I should get back to Cass. She and Kayla are only going to be here until tomorrow. Should spend as much time with my girl as I can.”</i>");
	output("\n\nUnderstandable, though you wish you and Kaede could spend some more... quality time together.");
	output("\n\nShe blushes, but pushes away. <i>“Me too, but I’ve got to save up for Cass. Something tells me I’m not getting through the door without her jumping my bones. My poor, abused bone.”</i>");
	output("\n\n<i>“Alright, alright,”</i> you sigh, letting Kaede find her jeans and lead you out to the boarding ramp. <i>“We should do this again sometime, though. It was nice.”</i>");
	output("\n\n<i>“It was!”</i> she smiles, leaning ");
	if(pc.tallness >= 76) output("up");
	else if(pc.tallness < 64) output("down");
	else output("in");
	output(" to give you a peck on the cheek. <i>“Alright, I’m gonna go. See you soon?”</i>");
	output("\n\n<i>“Definitely.”</i>");
	output("\n\nShe smiles and bounds down the ramp, letting you follow her down into the barn as she vanishes into the crowd.");
	//[Next]
	flags["HUNG_WITH_KAEDE_AFTER_MEETING_CASS"] = 1;
	processTime(15);
	restHeal();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Meet Cass
//Actually, you’d rather meet back up with her baby momma. Cass was giving you some pretty obvious signals, and if poor Kaede can’t sate the kitty-cow’s needs, well...
//PC must not be genderless.
public function meetCassWithKaede():void
{
	clearOutput();
	showKaedeAndCass(false, true);
	flags["SEXED_CASS"] = 1;
	output("<i>“I’ve got a better idea,”</i> you say, letting your arms slide down the svelte half-breed’s back until you’re cupping her perky behind. <i>“Why don’t you and I go after Cass, and let me take care of her for you while you rest.”</i>");
	output("\n\nKaede’s blue eyes go wide, but you feel her fluffy tail spring up behind her. <i>“O-oh! That’s, um, that’s one idea,”</i> she murmurs, chewing on her lip. <i>“I couldn’t ask you to do that, but...”</i>");
	output("\n\n<i>“");
	if(pc.isMischievous()) output("I mean, if you’d rather watch than rest, I’d understand. I’d hate to interrupt your nap.");
	else if(pc.isAss()) output("Oh, don’t tell me you’re the jealous type.");
	else output("Well, if you don’t want to...");
	output("”</i>");

	output("\n\n<i>“No!”</i> Kaede blurts, a little too eagerly. <i>“It’s not that. I just didn’t think... I mean, Cass comes on hard like that to everybody, ya’know? I didn’t want you to think she... I mean that we... that...”</i>");

	output("\n\nYou grin at the poor, flustered puppy. <i>“So, do you want to go?”</i>");

	output("\n\n<i>“Yeah,”</i> she blushes, chewing on her lip.");

	output("\n\nKaede takes your hand and starts off at a brisk pace, leading you down the road in Cass’s wake. You follow close behind, appreciating the view of her quickly-wiggling tail and bouncing butt as the two of you make your way off of Tee’s Ranch and into a section of residential farmsteads scattered across the grassy fields.");

	output("\n\n<i>“This really is a pretty planet,”</i> Kaede comments as you walk. <i>“After growing up on Tavros... it’s kind of nice to get to hang out on a paradise planet. Even for a little while.”</i>");

	output("\n\nIt <i>is</i> a beautiful planet, though at the moment, you’re more interested in the beautiful cow-girls that occupy it. One cow-girl in particular, you think, as Kaede directs you to a small house at the end of the field you’re traversing. You can see Cass sitting on the front porch, happily nursing her little girl. She sees you coming a good hundred yards off and waves; a gesture returned by Kaede as you approach.");
	output("\n\n<i>“Hey you two!”</i> she calls, standing upright... and revealing that both her huge, impossibly perky pale mounds are completely bare, their sizable teats stained with moisture from her nursing. Kaede’s tail flicks up as you make your way onto the porch and she takes charge of her half-sleeping daughter, leaving Cass’s tits completely open for you inspection. The kitty-cow seems to find this entirely acceptable, and plants her hands on her hips with a broad smile at you. <i>“I’m surprised to see you back here. Figured you two would be off ‘catching up’ for a few hours. Not that I’m complaining,”</i> she adds, giving you a playful wink and taking a deep breath that brings her chest up a little closer for you.");
	output("\n\nWell, nobody’s ever accused a Treated girl of being too subtle.");
	output("\n\n<i>“Oh, we thought it would be more fun to hang out here,”</i> Kaede smiles. <i>“And [pc.name] decided " + pc.mf("he","she") + " wanted to get to know you.”</i>");
	output("\n\n<i>“Is that so?”</i> Cass grins. <i>“Well, why don’t we, like, go inside and get comfortable, huh?”</i>");
	output("\n\nYou tell the shameless cow that you’d very much like that, and let her and her bubble butt lead the way inside. The farmhouse is small but rustic on the inside, with wooden walls sporting electric lights and heavy pink curtains. A small sitting room greets you, complete with a cozy little two-seat couch and an old-school windowed holoscreen mounted on the wall across from it. Kaede and Kayla make their way through that room and up to a staircase at the back of the house.");
	output("\n\n<i>“I’m gonna go put Kayla down for that nap. Why don’t you two, uh... I’ll be back in a few minutes,”</i> she says, vanishing up the stairs with her daughter cradled in her arms.");
	output("\n\nThe topless cowgirl rounds on you the moment Kaede’s out of sight, a lustful smile painted on her big, plump, rosy lips.");
	output("\n\n<i>“So, you wanted to get to know me, huh?”</i> she grins, taking a long-legged step forward. <i>“Kaede’s had some good things to say about you, ya know. And I </i>know<i> she has good taste in " + pc.mf("boys","girls") + ".”</i>");
	output("\n\nEach stride brings the cow-girl closer until her chest is almost pressing against ");
	if(pc.biggestTitSize() < 8) output("you");
	else output("your own huge rack");
	output(", bathing you in the overwhelming aura of lust and feminine desire permeating the air around her. You take a deep breath of her amorous odor, and instantly find yourself ");
	if(pc.hasCock()) output("rock-hard");
	else output("burning with arousal");
	output(", staring intently at her huge, heaving chest. With your gaze transfixed, you can’t stop yourself from reaching out and grabbing a handful of milky tit, pulling the cow-girl right into your arms. She squeals happily, her feline tails rapping against the wall behind her as milk dribbles down around your fingers, and her soaked crotch presses against you through her skintight suit.");
	output("\n\n<i>“So let’s, like, get acquainted,”</i> she purrs, reaching down to grab your crotch. Her fingers ");
	if(pc.hasCock()) output("grasp at your tumescent [pc.cockNoun]");
	if(pc.isHerm()) output(" and ");
	if(pc.hasVagina()) output("sink into your eager [pc.cunt]");
	output(", gently pulling you towards the couch until you’re crashing down onto it, Cass sprawling tits-up under you with her thick thighs wrapping around your [pc.hips]. Her soaked crotch grinds noisily against your ");
	if(pc.isCrotchGarbed()) output("[pc.lowerGarmentOuter]");
	else output("[pc.skinFurScales]");
	output(" until you finally manage to tear her catsuit away to reveal the puffy pink lips of an utterly sodden pussy, bridged by thick ropes of fragrant fem-slime and burning with a needy heat that draws your fingers in; you push into the kitty-cow’s slit, spreading her nice and wide, feeling the remnants of the lustful beauty’s many, many recent tumbles in the hay with your mutual lover. Cass moans, arching her back and slathering your probing digits with a thick coating of translucent moisture.");
	output("\n\n<i>“Oooh, I think we’re gonna get along!”</i> Cass giggles, groping at her tits until a steady trickle of creamy white runs down her ample mounds.");
	//New pg. Herms can choose scene; otherwise pick from below.
	pc.lust(100);
	processTime(14);
	clearMenu();
	if(pc.isHerm())
	{
		addButton(0,"Use Cock",cockVersionOfCaedeCassFuck);
		addButton(1,"Use Tongue",vaginalCassKaedeThreesome);
	}
	else if(pc.hasCock()) addButton(0,"Next",cockVersionOfCaedeCassFuck);
	else addButton(0,"Next",vaginalCassKaedeThreesome);
}

//PC Cock Vers. Here
public function cockVersionOfCaedeCassFuck():void
{
	clearOutput();
	showKaedeAndCass(false, true);
	output("With the giggling cow-girl spreading her legs beneath you, sensually inviting you to take her as rough and hard as you’d like, you find yourself operating on bestial instinct, ramming your [pc.hips] forward and grinding your [pc.cock] against Cass’s sodden slit, all but slipping into her sultry folds. She arches her back, chewing a lip around a lusty moan as you slide your prick into her welcoming embrace.");
	output("\n\n<i>“Oooh, ");
	if(pc.cocks[0].cLength() < 6) output("don’t tell Kaede, but I looove tiny little cocks like yours! They just fit sooo nice!”</i> she purrs, squeezing her cavernous twat amazingly tight around you.");
	else if(pc.cocks[0].cLength() < 11) output("that’s a nice dick - the perfect size for my little pussy. Stretching me out so good!”</i> Cass smiles, wiggling happily under you as you slide easily in.");
	else 
	{
		output("that’s a big dick! ");
		if(pc.isTreated()) output("I love fucking you Treated bulls!");
		else output("Are you sure you’re not Treated?");
		output("”</i> she smiles, planting a hand on her belly to feel the bulge your cock is making inside her. <i>“Come on, shove it all in!”</i>");
	}
	output("\n\nYou’re more than happy to oblige, ramming your hips forward until the kitty-cow’s ");
	if(pc.cocks[0].cLength() < 14) output("soaked up every inch of cockflesh");
	else output("belly is bulging with the sheer volume of dick you’re giving her");
	output(". The couch rocks underneath you, creaking and shuddering with the powerful impacts of your pistoning hips. You imagine Kaede’s getting quite the aural treat by now - these walls can’t be that thick, after all, and Cass is moaning like a hyperporn starlet on her debut, rewarding each thrust with a shrill cry of pleasure.");

	output("\n\nBetween brutal pistons into the kitten’s soaked pussy, you feel her thick legs lock around your [pc.butt], drawing you deeper into her embrace. More pressing, though, are her hands ");
	if(pc.hasHair()) output("running through your [pc.hair]");
	else output("caressing your scalp");
	output(", forcefully guiding your head towards one of her volleyball-sized jugs. Your mouth opens on instinct, scooping up one of the cow-girl’s big, stiff nipples. She coos happily, pulling you into a world of silken-soft titflesh that sloshes around your [pc.face], contouring to the curves of your lips and nose to encase you in wonderful heat.");
	output("\n\nYou don’t even have to suck to start her inflated tits up, squirting a thick stream of sweet milk right into your waiting gob. Your eyes go wide, but you’re blinded by boobage, left only able to taste and feel your way around the lush cow-girl’s body. Your hands end up groping at her huge mounds, sinking your fingers into her yielding, smooth flesh and forcing more and more milk to gush up from her stiff teats. Of course, you’re not getting a drink for nothing: you wrap your [pc.tongue] around Cass’s pebbly promontory, licking and sucking on her teat on the one hand, and groping and pinching at the other. The poor over-stimulated kitty-cow moans, holding on tight and bucking against your thrusting cock, succumbing to pleasure in a screaming orgasm!");
	output("\n\nHot pussyjuice floods around your [pc.cock], adding another layer of lube to Cass’s already soaked-through twat. You just keep moving through her climax, sucking and groping and fucking to drive your bovine lover wild with pleasure. You’re nowhere near done yet, and you’re more than happy to make sure the cow cums over and over while you drain her mountainous tits.");
	output("\n\nOnly when you finally come up for fresh air, ready and raring to switch to Cass’s other tit, do you realize Kaede’s standing at the edge of the couch, staring down at you.");
	output("\n\n<i>“How Kayla went to sleep with you two going at it...”</i> she murmurs, batting aside Cass’s wandering hand as the kitty-cow tries to get a grip on her fly.");
	output("\n\n<i>“C’mon, babe,”</i> Cass purrs, trying now to grab Kaede’s waist. <i>“I’ve got two more holes just begging for you to, like, plunge right in!”</i>");
	output("\n\nKaede shudders, stepping around the couch and out of Cass’s reach. As she does, her hand runs across your bare back, eventually caressing your [pc.butt] between womb-deep thrusts into the mother of her child. <i>“Sorry, Cass, I don’t think I can go another round,”</i> she sighs, vanishing out of sight behind you. <i>“You’ve got me drained dry!”</i>");
	output("\n\nCass starts to laugh, but just ends up breaking down into a low, mooing moan. <i>“Ah, at least you brought me this hunk of meat!”</i> she grunts, smacking your ass. <i>“You were soooo right about [pc.himHer]! So good!”</i>");
	output("\n\nYou grin, keenly aware of Kaede watching you fuck her friend - and you’re fairly certain you saw a prominent little package peeking out from the puppy-slut’s pants. Maybe she’s a little more willing to hop in than she lets on... then again, it wouldn’t be hard to just bust your nut in her girlfriend’s cooch here and now! If you’re any judge, Cass is just on the verge of another orgasm... getting a nice dose of cum right in her womb would definitely push her over!");
	pc.lust(100);
	processTime(12);
	clearMenu();
	addButton(0,"Invite Kaede",inviteKaedeToCassFuck,undefined,"Invite Kaede","See if you can get both of your red-headed spacer babes in bed together...");
	//Bust a Nut!
	addButton(1,"Bust a Nut",bustANutDuringCassKaedeThreesome,undefined,"Bust a Nut","Go ahead and blow your load!");
}

//Invite Kaede
//See if you can get both of your red-headed spacer babes in bed together...
public function inviteKaedeToCassFuck():void
{
	clearOutput();
	showKaedeAndCass(true, true);
	output("<i>“C’mon, Kaede,”</i> you grin, wiggling your ass at the reticent half-breed. <i>“Why don’t you come on in?”</i>");
	output("\n\nShe chuckles nervously, shuffling her feet on the hard flood. <i>“Uh, you know, I’d love to, but... I mean, somebody’s got to keep an eye on Kayla, and...”</i>");
	output("\n\nHer excuses get cut off by a mooing moan from her lover at the climax of one of your thrusts. Kaede comes back into view, her erection painfully obvious through her jeans - and obviously uncomfortable for its owner. Kaede blushes, tail tucked between her legs, trying hard not to look at you as you hammer her lover into the couch. The cow-girl moans and moos with abandon, milky mammaries jiggling in the most delightful ways against your face.");
	output("\n\n<i>“Don’t be a - ah! - a spoil-sport!”</i> Cass giggles, wrapping her arms around your neck and burying your face into her quaking cleavage. <i>“You brought me this " + pc.mf("handsome","cute") + " slab of cock - don’t make me feel, like, totally guilty hogging [pc.himHer] all to myself.”</i>");
	output("\n\nYou can hear Kaede fidgeting. <i>“T-that’s alright, Cass. I’m, uh... still a little sore from this morning. And during breakfast. And right after... and in the bathroom during lunch. I gotta save up for, uh, for later...”</i>");
	output("\n\nSuddenly, you feel a hand grab your [pc.cock] mid-thrust, yanking your dick out of Cass’s silky snatch and onto her soft belly, cooling in a pool of her fuck-juices. <i>“Oh, is that all?”</i> your kitty-cow lover purrs, giving you a firm swat on the butt. <i>“I bet [pc.name] here would, like, totally fuck you right in the butt! Haha! Don’t blush like that, I know you’re a dirty little back-door minx!”</i>");
	output("\n\n<i>“Cass!”</i> Kaede snaps as you finally come up from breath from between the bimbo’s boobs. The halfbreed’s made the mistake of moving closer, within arm’s reach of her purring cum-dump. Cass’s hand is firmly locked in Kaede’s belt, fiddling with the buckle and refusing to let go. Finally, with a grunt of effort, Cass pulls her lover’s pants down around a painfully-hard red rocket, and yanks her down on the couch with the both of you.");
	output("\n\nKaede yelps, Cass laughs, and you find yourself getting pushed onto your knees between Cass’s spread legs, looking right down at Kaede’s bare bottom. The cat-girl’s hands grab her bum, groping it hard enough to elicit a gasp, and spreads the cheeks wide for your inspection.");
	output("\n\nYou’ve gotta admit, Kaede’s got a <i>great</i> ass: perfectly round, flawlessly smooth, with just a hint of extra weight that makes it bounce around when her lover gives it a swat. Between her freckled cheeks rests a tight, dark ring of an asshole, tucked securely over a small pouch of balls that are busy swaying around while their owner squirms.");
	output("\n\n<i>“B-but-”</i> Kaede stammers, right up until Cass gives her a full-on french kiss, pulling her beloved puppy-slut into a soft, jiggling embrace.");
	output("\n\n<i>“Butt. Right in the butt!”</i> Cass giggles, still spreading those cheeks wide for you. Chuckling to yourself, you let your [pc.cock] flop between Kaede’s vulnerable cheeks, trailing a glaze of Cass’s ample pussy-juices as it goes.");
	output("\n\nThe kiss seems to have relaxed Kaede, at least enough that all you get is a whimper and a wiggle of her tail when you press your [pc.cockHead] against her backdoor.");
	output("\n\nCass’s hand slips down and around the ginger’s hip, grabbing the throbbing red shaft dangling between her legs. <i>“As for this precious little prick,”</i> the kitty-cow murmurs, arching her back as Kaede’s hips rock forward in slow, tender acceptance of your first thrust. <i>“You just keep it nice and still, buried deep inside. Let [pc.name] milk all that sweet, yummy cum out for me. Think you can do that for me, lover?”</i>");
	output("\n\nKaede just nods emphatically, mouth agape in a wordless moan as she’s fucked deep into Cass’s cooch, and your [pc.cock] spears deep into her ample ass. Her flame-red tail flicks at your face, but she otherwise offers no resistance - no hint of discontent.");
	output("\n\n<i>“There’s a girl!”</i> her lover moans, guiding Kaede’s lips back to hers and wrapping her thick thighs around both your hips. <i>“Oooh, I can feel that naughty little knot! It sooo wants to come in too, doesn’t it?”</i>");
	output("\n\nYou rock your hips back a little, dragging a few inches of cockmeat back through the tightly squeezing grip of Kaede’s ass. Her choice: thrust forward, or lean back onto your cock. You can just barely hear a little grunt from the exhausted pup as she grinds her hips into Cass’s crotch. It’s the cow-girl that really lets you know the moment Kaede’s knot slips in, arching her back and crying out her lover’s name as she’s stretching as wide out as a fist.");
	output("\n\n<i>“F-fuck!”</i> Kaede stammers, struggling to support herself on her arms, away from Cass’s eager lips and the all-encompassing embrace of her tits. <i>“I... I came. I came...”</i>");
	output("\n\nCass just giggles and reaches up under Kaede’s shirt, groping at a perky little boob. <i>“I know, sweetie. Now get back down here and drain a tit for me... I know that tight little sack of yours has soooo much more left inside.”</i>");
	output("\n\n<i>“Gah!”</i> Kaede moans as you emphasize the cat-girl’s point by sliding your hips back in, burying yourself to the hilt in Kaede’s lush behind. <i>“C-can’t...”</i>");
	output("\n\nCass shushes her, guiding Kaede’s head down until the puppy-slut obediently latches onto one of Cass’s big, milky nipples and starts to suck. Something tells you she’s going to need to keep her strength up for this!");
	output("\n\nYou grab Kaede by the hips, pushing her and, by extension, Cass down flat against the couch, as tightly together as they can be with Kaede’s pointed pecker probably an inch deep in her lover’s womb and her knot leaving her lips yawning wide open. Kaede’s tail curls over her own back, an act of absolute, instinctual submission as you take her from behind again and again. The whole couch creaks uneasily under your pounding hips, swaying back and forth as three bodies locked in ecstasy undulate against each other, desperate for more.");
	output("\n\nYou vary your pace, mixing it up between long thrusts and period of short, fast hammer thrusts that leave Kaede gasping and panting, drooling milk everywhere. Kaede keeps her face more or less locked between a pair of enormous needy tits, though, and most of her feedback to you is her hips pushing back against your cock, or her asshole contracting in rhythmic spasms of pleasure as you milk another trickle of orgasm out of the exhausted ausar... deep in Cass’s quim.");
	output("\n\n<i>“That’s it, baby!”</i> Cass moans, rolling her head back against the arm of the couch. <i>“Don’t hold anything back... I want every last drop of my favorite puppy-stud’s cream. Pack me full of those little swimmers so I can get sooo pregnant again!”</i>");
	output("\n\n<i>“Gluh!”</i> Kaede manages to squeak, just as you hilt yourself against her ass. You feel her clench hard again - another orgasm, right on the heels of the first! Her lover coos with delight, more than happy to take it deep inside. Kaede’s ass is in a non-stop look of squeezes and contractions, desperate attempts to alternatively repulse your thrusting member or take you ever deeper, making sure you’re grinding against her prostate with every motion. No wonder she’s just dumping load after load of cream inside Cass’s welcoming womb.");
	output("\n\nWith that kind of treatment - not to mention verbal stimulation - you know you don’t have long to last. With the canny instinct only a cum-hungry New Texan cow can manage, Cass gleefully rubs her feet against your [pc.butt] and croons, <i>“What’s it gonna be, [pc.name]. Do you wanna have your chance to breed me? Or would you rather make a great big mess of my girlfriend’s lil’ butt? I wouldn’t blame you... if I had a dick, you couldn’t pry me outta there!”</i>");
	output("\n\nWhich two choice offers on the table, which of your lascivious lovers do you choose to grace with your climax?");
	processTime(17);
	pc.lust(100);
	IncrementFlag("KAEDE_FUCKED");
	//[Kaede’s Ass] [Cass’s Cunt]
	clearMenu();
	addButton(0,"Kaede’s Ass",cumInKaedesAssDuringCassThreesome,undefined,"Kaede’s Ass","Bust your nut in Kaede’s asshole. Cass wasn’t kidding: this little ginger sweetheart’s got the kind of ass you can only dream about!");
	addButton(1,"Cass’s Cunt",cumInCassesCuntDuringKaedeThreesome,undefined,"Cass’s Cunt","No way you’re passing up a second chance at that cum-hungry hole. Who knows, maybe even after all those orgasms out of her lover, you’ll still be the one to pack Cass with another kid?");
}

//[Kaede’s Ass]
//Bust your nut in Kaede’s asshole. Cass wasn’t kidding: this little ginger sweetheart’s got the kind of ass you can only dream about!
public function cumInKaedesAssDuringCassThreesome():void
{
	clearOutput();
	showKaedeAndCass(true, true);
	output("The choice practically makes itself. You grunt and grip Kaede’s hips a little tighter, a sure sign to her that she’s about to get a hot, sticky treat.");
	output("\n\n<i>“D-do it!”</i> she manages to cry, pulling herself off of Cass’s tit long enough to try and speak. <i>“I-I wanna feel what Cass does! Give it to me!”</i>");
	output("\n\nHer last word trails off into a mindless scream of pleasure as you pound her ass and blow your load, hammering all the [pc.cumNoun] you have to offer deep into her tight little pucker.");
	pc.cockChange();
	output("\n\n<i>“You can feel her respond with another, final orgasm of her own - just a little shudder and a weak clench of her backside around your cock, but Cass is more than happy to moan about how <i>“how fucking </i>stuffed<i>”</i> she is with Kaede’s cum.");
	output("\n\n<i>“Oh... Oh God,”</i> Kaede mumbles, face-planting between Cass’s tits. <i>“Everything is sore... and it feels <b>amazing</b>.”</i>");
	output("\n\n<i>“I know, sweetheart,”</i> Cass sighs, stroking her lover’s hair. As she does, you rock your hips back until your cockhead pops out of Kaede’s gaping behind, ");
	if(pc.cumQ() >= 250) output("filled with so much cum you could practically spoon it out.");
	else if(pc.cumQ() >= 100) output("its walls glazed by a thick coating of your spunk.");
	else output("its little ring sprinkled with steaming droplets of your aftershots.");
	processTime(2);
	clearMenu();
	addButton(0,"Next",postCassKaedeOrgasmEpilogue);
}

//[Cass’s Cunt]
//No way you’re passing up a second chance at that cum-hungry hole. Who knows, maybe even after all those orgasms out of her lover, you’ll still be the one to pack Cass with another kid?
public function cumInCassesCuntDuringKaedeThreesome():void
{
	clearOutput();
	showKaedeAndCass(true, true);
	flags["PUT_LOAD_IN_CASS"] = 1;
	output("<i>“Move that ass, Kaede!”</i> you grin, grabbing her by the butt and yanking her hips back. Kaede yelps in surprise as her knotted cock is unceremoniously unplugged from Cass’s sweet little slit, spraying a final wad of thin, watery spunk across the kitty-cow’s thighs from the sheer shock. You don’t bother to move Kaede any further, allowing her to continue resting atop Cass as you wipe your schlong off her butt and then drive it back home.");
	output("\n\n<i>“Woah!”</i> Cass manages to gasp, before any thought of forming words is washed out of her mind with shockwaves of pleasure that make her mammoth mammaries bounce like balloons. It’s a whole lot wetter in here since the last time you thrusted into Cass’s cooch, her already legendary dampness amplified by the better part of half an hour of uninterrupted fucking, and what must be a half-dozen loads from Kaede’s rapidly-diminishing stockpile of spunk.");
	output("\n\nUsing Kaede’s hips like handlebars, you hammer away at Cass’s welcoming kitty until she’s shrieking, and your cock is swelling with a rush of seed. <i>“That’s it! Give it to me!”</i> the bovine beauty bellows, thrusting her crotch up to meet your pistoning shaft so that just as you’re ready to burst, your [pc.cockHead] is battering the mouth of her cervix. You deposit your mighty load of [pc.cumNoun] as close to her ready womb as you can manage, breeding the hungry cow just the way she wants to be.");
	pc.cockChange();
	output("\n\n<i>“Ah!”</i> she gasps, flopping deflatedly against the seat of the couch, chest heaving and pussy clenching around your dick as you squirt out wad after wad of cum. <i>“Oh, Kaede, you really picked a winner this time...”</i>");
	output("\n\n<i>“My dick,”</i> Kaede whines, <i>“So... empty...”</i>");
	output("\n\nCass giggles and cups her lover’s cheeks, bringing her into a gentle kiss. <i>“Aw, there there. Why don’t you swing around so momma Cass can kiss it and make it all better... and maybe clean up the mess while you’re down there.”</i>");
	output("\n\nEver the eager submissive, Kaede swivels around awkwardly atop her lover, planting her red rocket right in Cass’s face and nesting her cheeks against the cow’s thick thighs. Slowly, gingerly, you pull yourself out of the sodden slit you’ve just bred, bopping Kaede in the nose with your [pc.cockHead]. Taking Cass’s request to mean cleaning <i>you</i> off too, Kaede opens wide and scarfs down your spent, softening cock. You shudder with overwhelming sensation - the same thing Kaede herself must be feeling from her own lover’s aftercare - but manage to stroke Kaede’s hair and tell her what a good girl she was until she’s gotten your prick shining and clean.");
	output("\n\n<i>“Yum,”</i> she murmurs breathily, eyes heavy with mounting exhaustion. <i>“You’ve got a really, really nice dick, [pc.name]. You should... unf... let me play with it more later...”</i>");
	output("\n\n<i>“Greedy girl!”</i> Cass mumbles around a mouthful of cock. <i>“Not wrong, though...”</i>");
	output("\n\nKaede yawns but, after a playful spank from Cass, buries her head in the cow-girl’s cooch and starts to lick up the sloppy, musky mess the two of you made down there.");
	processTime(6);
	pc.orgasm();
	//[Join In] [Leave]
	clearMenu();
	addButton(0,"Join In",joinInCleaningUpCassKaedePostScene,undefined,"Join In","It’s not fair to leave Kaede to clean up all by herself. Help the pooped puppy-slut out.");
	addButton(14,"Leave",postCassKaedeOrgasmEpilogue);
}

//[Join In]
//It’s not fair to leave Kaede to clean up all by herself. Help the pooped puppy-slut out.
public function joinInCleaningUpCassKaedePostScene():void
{
	clearOutput();
	showKaedeAndCass(true, true);
	output("Deciding that you can’t leave a job unfinished, you slink down to your [pc.knees] on the floor, leaning over the arm-rest to get your mouth right on level with Cass’s cooch.");
	output("\n\n<i>“W-what-”</i> Kaede starts, right until you give her a deep, long kiss... and scoop out a little of the cum she’s ready to swallow on your [pc.tongue], claiming a share of your mixed load for yourself. She murmurs a soft <i>“Oh. Ohhhh,”</i> and lets her eyes flit closed, enjoying the kiss while it lasts. When you break it, you give her a playful wink and lean in to Cass’s cum-slathered puss, dragging your [pc.tongue] between her thick labia and scooping up even more of Kaede’s cum.");
	output("\n\n<i>“Such a gentle" + pc.mf("","wo") + "man!”</i> Cass, now apparently much more clear-headed, giggles. <i>“You’ve definitely got a keeper here, baby.”</i>");
	output("\n\nKaede’s eyes widen, and she blushes an even darker shade of crimson. <i>“I don’t... I mean.. we...”</i>");
	output("\n\n<i>“Shush,”</i> you command, giving her another kiss before going back to work. She joins you after a moment, letting her tongue play around with yours until Cass arches her back and cries out a warning, just a little too late for the two of you to avoid a shower of fem-cum... and probably a good bit of your own cum, too, as your dual oral skills bring Cass to orgasm again. Laughing, you lick the mess off Kaede’s face, letting it turn into a final kiss before you rise.");
	processTime(3);
	clearMenu();
	addButton(0,"Next",postCassKaedeOrgasmEpilogue);
}

// Combine ALL
public function postCassKaedeOrgasmEpilogue():void
{
	clearOutput();
	showKaedeAndCass(true, true);
	output("You start to try and get up, but find yourself being pulled back down into the valley between the kitty-cow’s tits. She gives you a fierce hug and a more than playful tug on your [pc.cock], ending with a kiss on the cheek as she releases you from both her warm embraces. She sighs happily as you finally get away from the couch and start looking for your [pc.gear], watching your bare body with obvious appreciation.");
	output("\n\nKaede, though, is already asleep. She lets out a cute little snore, nuzzling against Cass’s thigh and crotch.");
	output("\n\n<i>“Poor thing’s worn out,”</i> Cass whispers. <i>“I definitely drained her too dry today, but... oh, I was so happy to see her again. I love my baby daddy here.”</i>");
	output("\n\nEven asleep, Kaede’s tail swishes happy in her lover’s face, apparently enjoying the honey-sweet tone of Cass’s voice. The kitty-cow gives you a big smile, <i>“I’d show you out, but I’m gonna let this poor girl rest. At least until I get hungry for a salty snack... She’s earned it.”</i>");
	output("\n\nYou can’t help but agree, and make sure to put a parting kiss on the top of Kaede’s head before you toss your kit on and head for the door.");
	output("\n\n<i>“I definitely want to see you again, [pc.name],”</i> Cass says, blowing a kiss your way as you leave.");
	processTime(7);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Bust a Nut!
//Go ahead and blow your load!
public function bustANutDuringCassKaedeThreesome():void
{
	clearOutput();
	showKaedeAndCass(false, true);
	flags["PUT_LOAD_IN_CASS"] = 1;
	output("Well, Kaede did bring you here for a reason: to satisfy her sexually-voracious lover! You latch on to Cass’s other tit, sucking hard until a spray of milk fills your cheeks, and start hammering your hips into her just as hard as you can. Cass throws her head back with a bestial moo of ecstasy, clenching hard around your pounding cock and wordlessly babbling, begging you to cum. At this point, you couldn’t resist her if you tried!");
	output("\n\nYou give the kitty-cow a rough bite on the nipple, one last spark of pleasure to send her over the edge again as your [pc.cock] throbs with impending need. One last thrust sees you buried as deep into her lurid sex as you can go before you blow, making sure your [pc.cockHead] is poised perfectly to flood her womb with seed. With a last, feral grunt, you let loose deep inside your bovine lover, feeling your cock swell up and shoot off in a shockwave of pleasure that leaves you gasping around Cass’s breast. The cow-girl moos and wiggles happily underneath you, soaking up every drop you have to give her");
	if(pc.cumQ() >= 2000) output(" until her belly is swollen between you, looking like she’s already pregnant again!");
	else output(", finally flopping back as your [pc.cumNoun] bastes her womb until you’re completely dry.");
	pc.cockChange();

	output("\n\n<i>“Oh... wow!”</i> Cass moans when you’ve finally finished, slowly starting to soften inside her. <i>“You don’t know how much I needed that...”</i>");
	output("\n\nSuddenly the delightfully bubbly tinge to her voice is gone. Just like Kaede said, you guess, Cass’s brain must be pretty much cum-fueled - and now that she’s gotten a recharge, you can see a distinct cunning in her eyes. You roll off of her, letting a little deluge of spent seed squirt out of her well-bred pussy, staining her thighs and the couch beneath her.");

	output("\n\nYou start to try and get up, but find yourself being pulled back down into the valley between the kitty-cow’s tits. She gives you a fierce hug and an unbelievably tight squeeze around your [pc.cock], ending with a kiss on the cheek as she releases you from both her warm embraces. She sighs happily as you roll off the couch and start looking for your [pc.gear], watching your bare body with obvious appreciation.");
	output("\n\n<i>“Thanks for covering for me,”</i> Kaede whispers, picking your discarded Codex up and handing it to you. <i>“With a performance like that, I think she’ll be alright for the rest of the day.”</i>");
	output("\n\n<i>“I can hear you, Kaede,”</i> Cass laughs, stretching and yawning. <i>“Sorry if I wore you out a little, earlier.”</i>");
	output("\n\nThe half-ausar smiles and pats her lover’s thigh. <i>“It’s fine. I’m just glad [pc.name] was here to take over for a little while. Speaking of which, it looks like you’re about ready to pass out.”</i>");
	output("\n\n<i>“I think [pc.heShe] actually wore </i>me<i> out,”</i> Cass grins, sitting up and squirting a little more of your cum from her snatch. <i>“Still, I should get some work done while I’m still nice and fucked.”</i>");
	output("\n\nKaede rolls her eyes as the cow-girl hops up and saunters upstairs, flesh jiggling enticingly with every step. Half of you wants to just follow her up there and see about a little more...");
	output("\n\n<i>“Here,”</i> Kaede says, throwing you a towel and breaking you out of her butt-induced trance. <i>“You’re, uh, kind of wet. I’ll walk you home when you’re done, if you want. Least I could do.”</i>");
	output("\n\nYou wave her off, telling your lover that she needs to rest while she can. You can find your way back to the ranch on your own. She nods and smiles, at least intent on walking to the edge of the porch with you. <i>“Thanks again, [pc.name]. So, um, that looked like a lot of fun, actually... maybe the three of us could get together some time and let me get in on the fun?”</i>");
	output("\n\nOh yeah. You definitely want to see what those two can do together.");
	output("\n\nSaying goodbye to Kaede, you saunter off into the New Texan sun, leaving the two spacer gals to tend to their child for the day.");
	processTime(17);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//PC Vag Vers. Here
public function vaginalCassKaedeThreesome():void
{
	clearOutput();
	showKaedeAndCass(false, true);
	output("You’ve never seen a kaithrit so completely soaked as Cass right now, like she’d boiling in an absolute swamp of excitement in that too-tight catsuit of hers. Her quim squelches and squirts as you drive your fingers inside and explore the slick, clenching walls of her inner sex.");
	output("\n\nThough you doubt you’ll be able to satisfy the buxom bovine’s cumsluttery addiction like Kaede... well, she tried... you can most certainly get Cass off a few times while her lover recovers from the hours of unending abuse of her cock. Giving Cass your best flirtatious smile, you shimmy down until your face is on level with her crotch and let your [pc.tongue] go to work.");
	output("\n\n<i>“Ooh!”</i> Cass giggles, rocking her legs and hips against your [pc.face]. Her meaty labia part at the insistent probing of your tongue, granting you access to the sultry passage between them. Your entrance gives the cat-girl a thrill, vocalized with a sensual moan. Her twin tails coil around your neck and shoulders, weakly urging you even deeper into her groin’s embrace.");
	output("\n\nYou’re more than happy to go along with her tails’ insistent pleas, burying yourself so deep between their owner’s legs that your nose grinds against her throbbing clit. Rubbing your nose back and forth elicits yet another lurid moan from the kitty-cow, making sure everyone knows just how much she appreciates your efforts. Her pussy does too, squeezing lovingly around your [pc.tongue] as you explore every inch of her lustful hole.");
	output("\n\nCass’s exuberant response to your ministrations goads you forward. You lick faster and deeper, eagerly lapping up those sweet juices of hers. In turn, you’re treated to a symphony of lusty moans and gasps of pleasure, rising in intensity with every flick of your tongue. With a chorus like that going on, you shouldn’t be surprised when you hear bootfalls on the stairs coming down toward you.");
	output("\n\n<i>“I’m amazed Kayla could fall asleep through all this,”</i> Kaede grumps. You feel a hand brush along your scalp as the half-ausar passes by the couch, deftly avoiding Cass trying to grab her crotch.");
	output("\n\nThe kitty-cow murmurs happily nonetheless, squeezing you between her thunderous thighs. <i>“I like your friend, Kaede!”</i> she purrs. <i>“[pc.HeShe]’s getting to know me reeeeeal well.”</i>");
	output("\n\n<i>“Looks like it,”</i> her lover answers, squatting down beside you and giving you a sweet smile. <i>“You sure look awful good there, [pc.name].");
	//Follower Anno:
	if(annoRecruited()) output(" I can see why Anno just hoards you all to herself.");
	else output(" Wouldn’t mind taking Cass’s place... some day.");
	output("”</i>");

	output("\n\nYou flash her a wink, dragging your tongue through the cleft of Cass’s puss until you’re flicking her clit. A little droplet of pussyjuice hits Kaede in the face, making her snicker and recoil, giving you some space to keep focusing on her girlfriend.");
	output("\n\nCass pouts, brushing her fingers on Kaede’s jeans. <i>“Aww, not joining us, sweetie? I bet [pc.name] here wouldn’t mind a little red rocket to play with down there, too!”</i>");
	output("\n\n<i>“Uhh,”</i> the redhead grimaces. <i>“I, uh, I like to watch...”</i>");
	output("\n\n<i>“Oooh, that’s sooo kinky! Why didn’t you tell me sooner, I - ahh! Right there, cutie! - I’d have totally invited you over when my crew was around... Next time, though! - let you </i>watch<i> while I ride a big throbbing dzaan cock till even those big, meaty balls are-”</i>");
	output("\n\n<i>“Thanks Cass anyway enjoy yourself bye,”</i> Kaede babbles, looking positively flushed as she scampers off back upstairs. Sporting, you notice, a not-unnoticable bulge in her jeans.");
	output("\n\nCass snickers and lets her hands fall to rest on her breasts, tugging at her oversized nipples. <i>“Poor thing. I... mmm, little deeper, honey... I shouldn’t have ridden her so hard this morning. She... ooh, getting close...”</i>");
	output("\n\nCass’s almost-coherent thought trails back off into lusty moos of pleasure as you tongue-fuck her. The way her chest is heavy, leaking trickles of milk into her fingers, while her cunt clenches is ever more desperate ways to try and milk your phantom cock... you know she’s just about ready to hit her breaking point.");
	output("\n\nAll that’s left for you to do is keep your [pc.tongue] wriggling between her juicy walls, letting the cow-girl ride her way through the coming climax. And ride she does, bucking her hips and grinding her cooch against your face, reaching down to rub her clit and bellow her pleasure to the heavens. You’re treated to a miniature waterfall of fem-cum that splatters across your cheeks, bathing you in Cass’s alluring scent even as your tongue drinks in the sweetly bitter taste of her twat all through her orgasm, right until she’s collapsing on the couch and gasping for breath.");
	output("\n\nOf course that doesn’t stop you or anything. You reckon Kaede’s gonna need plenty of time to recover...");
	processTime(19);
	pc.lust(50);
	clearMenu();
	//[Next]
	addButton(0,"Next",girlsCassMeetingEpilogue);
}

public function girlsCassMeetingEpilogue():void
{
	clearOutput();
	showKaedeAndCass(false, true);
	//Pass +1d3 hours
	//-25 Energy, add Sweaty condition
	output("Cass’s final orgasm barely elicits a whimper from the sweaty, cum-drenched kitty. It’s taken many, many rounds of vigorous oral sex to get her this far, but finally the treated slut’s starting to wear out despite all that sexual stamina. With a heavy sigh of contentment, you feel Cass let out the last of her tension around your sore tongue in a strained trickle of fem-cum, adding to the veritable lake the two of you have made on her couch.");
	output("\n\nYou’re pretty sure it’s water-proof, at least.");
	output("\n\nLeaving her insensate on the couch, you stagger up onto your [pc.feet] and collect the gear you’ve left scattered all over the floor. While you’re wearily re-equipping yourself, you hear Kaede coming back downstairs, tiptoeing around a now-sleeping Cass to give you a big kiss on the lips");
	if(silly || pc.isAusar()) output(", which spirals into her spending a few moments licking your face clean of her lover’s juices");
	output(".");
	output("\n\n<i>“Thanks for that, [pc.name],”</i> she whispers, giving you a firm hug. <i>“I’ve never... ever... been this worn out by someone before.”</i>");
	output("\n\nGiven that she knows Anno, that’s probably saying something.");
	output("\n\nShe offers to walk you home, but you wave her off, telling your lover that she needs to rest while she can. You can find your way back to the ranch on your own. She nods and smiles, at least intent on walking to the edge of the porch with you. <i>“Thanks again, [pc.name]. So, um, that looked like a lot of fun, actually... maybe the three of us could get together some time when I’m a little less exhausted.”</i>");
	output("\n\nOh yeah. You definitely want to see what those two can do together.");
	output("\n\nSaying goodbye to Kaede, you saunter off into the New Texan sun, leaving the two spacer gals to recover.");
	processTime(60+rand(120));
	pc.girlCumInMouth();
	pc.girlCumInMouth();
	pc.girlCumInMouth();
	pc.girlCumInMouth();
	pc.girlCumInMouth();
	pc.girlCumInMouth();
	pc.girlCumInMouth();
	pc.energy(-25);
	sweatyDebuff(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Leave
//You’ve got places to be and things to do. Leave Kaede to her own devices.
public function leaveKaedeCassThreeSome():void
{
	clearOutput();
	showKaedeAndCass();
	output("<i>“Sorry, Kaede, I’m kind of in the middle of something,”</i> you apologize, trying to let the poor pup down easy.");
	output("\n\n<i>“Oh, uh, yeah. Sure,”</i> she says with a sigh, rubbing the back of her neck. <i>“I guess I’ll head back to my ship and take that nap anyway. God knows I need it.”</i>");
	output("\n\nYou give her a nod and part ways with her, letting Kaede head off while you turn your attentions back to the garden world before you.");
	processTime(3);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
