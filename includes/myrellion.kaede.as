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
	if (9999 == 0) output(" you’re looking for a probe your father launched out here onto Myrellion");
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
	if (pc.originalRace == "ausar") output(" You’re sure that was a relieved gesture, at least.");
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
	var map:* = mapper.generateMap(currentLocation);
	userInterface.setMapData(map);
	showName("THE\nGOLDEN PEAK");

	kaedeMyrellionBarTalkMenu();
}

public function kaedeMyrellionBarTalkMenu():void
{
	clearMenu();
	addButton(0, "Her Job", kaedeMyrellionTalkJob, undefined, "Her Job", "Ask Kaede about her space-trucker job.");
	addButton(1, "RhenWorld", kaedeMyrellionTalkRenWorld, undefined, "RhenWorld", "Ask Kaede about this RhenWorld contract she's got.");
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
	
	output("\n\nShe gives you a wry look. <i>“It wasn’t. I’m still paying </i>Talon<i>  off, a chunk out of every paycheck I get. I’m so far in debt over her I can barely see the light, but she’s worth every credit. Every single one,”</i> Kaede says, her lips softening into a far-away smile.");
	
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
	
	output("\n\nKaede blushes, cheeks reddening like rosepetals as you start to ask your question. <i>“I, uh, got lucky is all,”</i> she says, running a hand through her crimson hair. <i>“I bumped into a V.P. of the company in an elevator on Tavros. We, uh.... we hit it off, I guess, and she invited me to come do a few jobs for the company.”</i>");
	
	output("\n\n<i>“You hit it off, huh?”</i>");
	
	output("\n\nKaede’s cheeks flush a little darker. She looks like a big, red beet! <i>“I, uh, I mean... um...”</i> she babbles, clapping her hands to her face. You chuckle and pat Kaede’s back, making her canid ears perk.");
	
	output("\n\n<i>“I would have worked for them anyway! I mean, I’ve done work for RhenWorld before, and now that they’re mining here on Myrellion, they need a lot of private ships to move their cargo here and there and all. I just, uh, I guess I jumped to the top of the list.”</i>");
	
	output("\n\nYou eye the blushing halfbreed, and decide to give her a break on the matter. <i>“So, what’re they mining here? Seems pretty dangerous,");
	if (9999 == 9999) output(" what with the war going on");
	else output(" even with the war over with");
	output(".”</i>");
	
	output("\n\n<i>“Must be worth it. They’ve made a pretty big deal with the, uh, something or other Federation here. The ones that control pretty much the whole planet, anyway. From what Ashinari told me, the ant-folk here are working hard to get off-worlders invested here. They’re giving away mining rights away like candy. They’ve got no use for Oxonium, Thorolium, a bunch of other rare elements. Not to mention there’s gold and silver and all that to be had. It’s a rich planet, and a lot of the hard work’s already done. After all, the myr live underground to begin with. Plenty of caverns and tunnels to get RhenWorld and the other mega-corps started.”</i>");
	
	output("\n\nInteresting. <i>“I knew XenoGen was interested in the golds,”</i> you say, thinking back to your initial meeting with Juro, and the hordes of XenoGen employees you’ve seen wandering around. <i>“So the Federation’s courting mining companies, now?”</i>");
	
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
	
	output("\n\n<i>“Yeah, that’s him!”</i> Kaede laughs, <i>“Zeke Entara. Y’know, I walked in on him talking about some big Steele Tech contract way back.  Months ago now, it must have been. Must have been your ship, now that I think about it.”</i>");
	
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
		
		output("\n\nThe cat-woman grunts and rubs her temple. <i>“Doesn’t matter. Nevermind, kid.”</i>");
		
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

	//{If PC's fucked Kaede before:
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
		addButton(0, "It's Fine", kaedeMyrellionBarTheDIsFine, undefined, "It's Fine", "Tell Kaede you're fine with her and her dick.");
		addButton(1, "Nevermind", kaedeMyrellionBarNoDPls, undefined, "Nevermind Then", "Thanks for the heads up. You're not really into the D.")
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

	output("After a couple of minutes, you hear the hiss of the cabin door sliding open. Kaede takes a long-legged stride back into the main chamber, drawing your eyes back her way. She’s mostly naked, save for a translucent pink bra that cups her small breasts, and a pair of lacey pink stockings clipped to a garter that hugs her slender hips. She’s got no panties on, showing off an eight-inch shaft of canine cock dangle freely between her legs.");
	
	output("\n\nKaede’s holding a pair of small glasses in one hand, and a dark bottle of whiskey in the other.");
	
	output("\n\n<i>“Thanks for waiting. I thought I’d go ahead and get changed,”</i> Kaede says with a little smile. Her bare feet make a little patter across the metallic deck as she approaches you, nice and slow with a seductive sashay of her hips. You watch appreciatively as the svelte girl approaches, giving your eyes time to wander all across the body on display for you: from her long, slender legs to her small pouch of a sac hiding behind a proud canine shaft, and up to the handful of tit she’s sporting, each tipped with a stiff little nipple poking into the silky material of her bra.");
	
	output("\n\nHer tail swishes slowly behind her, curling around one of her legs as she sets her glasses and bottle down, and slips into your lap. You lean back into the couch, your hands reaching up to caress Kaede’s hips, pulling her close. The feeling of hot, stiff girl-cock coming to rest on your belly sends a shiver through you - one that pales in comparison to the next as Kaede’s hand reaches down to caress your own crotch, and her small lips brush against your [pc.lips]. Your eyes flutter closed, and you return the kiss, suckling one the halfbreed’s lower lip and squeezing your fingers into her tight ass.");
	
	output("\n\n<i>“I guess the drinks can come later,”</i> she purrs, breaking the kiss just long enough to speak.");
	
	output("\n\nIt looks like this horny halfbreed’s entirely at your disposal...");

	// [Fuck Ass] [Suck & Ride]
	flags["KAEDE_FUCKED"] = 1;
	
	processTime(15 + rand(5));
	
	clearMenu();
	if (pc.hasCock() && pc.smallestCockVolume() <= 250) addButton(0, "Fuck Ass", kaedeMyrellionFuckAss, undefined, "Fuck Her Ass", "The way you're sitting now, it'd be so easy to just slide your cock right into the randy shemale's tight little hole...");
	else addDisabledButton(0, "Fuck Ass", "Fuck Her Ass", "It'd be so easy to just slide your cock right into the randy shemale's tight little hole... if you had one that could squeeze up in there.");
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
	
	output("\n\n<i>“Is it... is it okay if I start moving?”</i> Kaede asks after a moment, cupping one of her perky tits. She speaks, the white bubble at the tip of her shaft pops, drooling down over your fingers in a sticky wet mess.");
	
	output("\n\nChuckling, you say that it’s normally you who’d be asking that. Kaede giggles, shifting her legs to get a better hold on the couch before she starts to move her hips. You find yourself sucking in a sharp breath as Kaede’s hips lift out of your lap, carrying her a few inches along the length of your shaft, and oh so slowly back down again. With every inch of motion, her cock twitches cutely in your hand, dragging through your fingers as her hips move, then thrust back in again. Flashing Kaede a little grin, you grab the bottle of lube off of her and squirt a little into your own hand, giving her cute canid prick a nice and slick tunnel to fuck just like she’s giving you.");
	
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
	addButton(0, "Facial", kaedeMyrellionFuckAssFacial, undefined, "Facial", "Pull your cock out of Kaede's ass and cum all over her face!");
	addButton(1, "Creampie", kaedeMyrellionFuckAssCreampie, undefined, "Creampie", "Bust your nut inside Kaede's tight little ass.");
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
	
	output("\n\nWith a final cry of pleasure, you slam yourself to the hilt inside the halfbreed’s well-fucked ass. She clenches hard around you, voice joining yours as her body squeezes the cum right out of you. You feel the rush of semen hurtle through your [pc.cock] and into the dark depths of Kaede’s ass. Her breath catches as she feels your hot, sticky spunk coat her bowels.");
	
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
	
	output("\n\nBy the time you finish your glass, Kaede’s making eyes towards her cabin, and the pile of clothes she’s doubtless left behind. <i>“So, uh, I should probably get going,”</i> she says, hopping off the table and clinking her glass onto the projector’s top. <i>“Still got that delivery to make... I’m sure that Fed guard’s thinking I fell off a cliff or something.”</i>");
	
	output("\n\n<i>“Yeah,”</i> you say, grabbing your [pc.gear]. <i>“This was fun, Kaede.”</i>");
	
	output("\n\nShe winks at you. <i>“Definitely. Maybe we can do it again sometime.”</i>");
	
	output("\n\nYou tell her you’re looking forward to it as she strides off into her cabin. She leaves the door open, letting you watch as she divests herself of the kinky lingerie and slips back into her boxers, jeans, and tanktop. You manage to get dressed quickly enough, and join Kaede on the way towards the airlock. As it’s opening up, she stops to grab your hands and plant a kiss on your cheek.");
	
	output("\n\n<i>“See you later, [pc.name],”</i> she says with a smile, heading off onto the tarmac. You disembark, heading back toward the transport hub. Hopefully you’ll get another chance at that cute piece of ass again sometime soon!");

	currentLocation = "600";
	var map:* = mapper.generateMap(currentLocation);
	userInterface.setMapData(map);
	showName("AIRFIELD\nSOUTH");

	processTime(20+rand(10));
	pc.orgasm();
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function kaedeMyrellionSucknRide():void
{
	clearOutput();
	kaedeHeader(true);

	output("Your eyes wander inexorably towards the turgid red shaft resting on your belly.");
	if (pc.race().indexOf("ausar") != -1) output(" Now that’s one doggy bone you can’t wait to lick!");
	else output(" You can’t help but lick your lips at the sight of it.");
	output(" Your hand slips down and wraps around her cock, and you suck in a sharp breath as you feel the hotness of it, more than a human’s ought to be, and diamond hard between your fingers. Kaede moans, leaning back on her knees and cupping one of her breasts as you start to tentatively stroke her length.");
	
	output("\n\n<i>“Oooh,”</i> she purrs, starting to move her hips. <i>“That’s nice...”</i>");
	
	output("\n\nYou’re sure the horny half-ausar would love to just sit there and let you jerk her off until she busts her nut all over your [pc.chest]");
	if (pc.isBimbo() || pc.isTreated()) output(" - and you would too, to be honest -");
	else output(",");
	output(" but you’ve got other plans for that sweet cock of hers. You switch your grip, going from the half-ausar’s sex to her hips, grabbing her and flipping the pair of you over. Kaede yelps, tail and ears tucking in defensively as she’s rolled onto her back. You end up on top now, straddling the dazed halfbreed with her juicy red prick nestled flush against your thigh. It’d be so easy to just sink down and spear yourself on it, take its full length into your [pc.vagOrAss] and ride it until the cows come home.");
	
	output("\n\n<i>Patience</i>, you have to tell yourself, slinking down off the couch and between Kaede’s splayed legs. She shivers, her tail flicking in your face as you fingers brush along her pale thighs and up to the tight little pouch of her balls. You can feel her body tremble as your fingertips brush the taut flesh of Kaede’s sack; her prick jumps to attention, though, and you can see the dark star of her ass clench when you draw near.");
	
	output("\n\nYou trace your way up the swell of the shemale’s sack, all the way up to the base of her red puppy pecker. She moans as you wrap your digits around her shaft, sheathing all but the tapered tip in your grip. Nice and slow, you angle her shaft towards your [pc.lips] and lean in, letting your [pc.tongue] play out and caress her crown. Her back arches, putting her whole body into the approach of your mouth like she’s trying to meet you halfway. Eager girl! You push her down again, pinning her to the sofa, and wrap your lips around the tip of her cock.");
	
	output("\n\nKaede’s got a wonderfully salty, earthy taste. Muskier than a human cock would be, and stronger smelling. Your heart flutters as the paradoxically masculine smells waft up to you, setting your lusts aflame. It’s impossible to resist the urge to slide your lips down that shaft, sucking up every inch of puppyslut flesh on offer. One by one, your fingers peel away from her rod, making way for your slow descent. It isn’t long before you can feel a pointed tip pressing into the back of your throat, bending ever so slightly as you plant a kiss on Kaede’s bare crotch.");
	
	output("\n\nYou look up at her, in time to see the cute halfbreed chewing on her lip and blushing like a rose. She reaches an unsure hand down to stroke your [pc.hair]. You answer the sweet gesture with a swirl of your tongue around the still-flaccid ball of her knot, sending a throbbing shudder through her prick. Something delightfully warm and sticky smears onto the back of your throat from where her crown is nestled, and the salty scent of pre-cum roils through your senses.");
	// {if bimbo/Treated/cum-dependant:
	if (pc.isBimbo() || pc.isTreated() || 9999 == 0) output(" You wish you could just suck this little cutie off until she gives you a big, hot load of spunk to swallow down... but then you wouldn’t get to shove it in your [pc.vagOrAss]!");
	
	output("\n\nThe thought of Kaede’s knotty cock going somewhere other than your mouth spurs you on, urging you to slather her shaft with a nice, thick coating of spittle. You work your tongue from base to crown and down again, lavishing every inch of red puppy prick with wet affection. She answers your motions with cute little moans and twitches of her hips, bucking against your lips. You let her have her fun, thrusting her hips into you until she sounds like she’s barely holding on. Kaede cups her breasts, squeezing her nipples and moaning like a lusty whore. You enjoy every second of her sensual show until you’re more than satisfied with the glaze of spit-lube coating her cock.");
	
	output("\n\nEnough of that, then. You pull yourself off of the sumptuous shaft of shemale cock and start to crawl up her svelte little body, pushing Kaede back into the couch and straddling her slender hip. She looks up at you with those big, blue eyes of hers and rests her hands on your hips, gently guiding you down towards the pillar of canine meat between her legs. You wiggle your hips against her rod, letting it nestle");
	if (!pc.hasVagina()) output(" into the crack of your ass");
	else output(" against your thigh");
	output(".");
	
	output("\n\nA second of silent tension passes, Kaede staring at you, and you steadying yourself before you take the plunge. Finally, she gives you a little nod, and you start your slow descent. Your fingers wrap around Kaede’s spit-slicked cock, angling it towards the waiting");
	if (pc.hasVagina()) output(" lips");
	else output(" ring");
	output(" of your [pc.vagOrAss]. Your lover shudders as her pointed tip brushes the entrance to your hole, but you hold her steady as your [pc.hips] start to slide downwards.");
	
	output("\n\nYour breath catches in your throat, feeling tendrils of electric pleasure writhing through your body when Kaede’s cock starts to spread your [pc.vagOrAss] open.");
	if (pc.hasCock())
	{
		output(" Your own [pc.cock] jumps in response, feeling the pressure on your");
		if (!pc.hasVagina()) output(" prostate");
		else output(" g-spot");
		output(" reciprocating through your own prick. You can’t help but wrap a few fingers around your [pc.cock], stroking yourself while you slide down Kaede’s length.");
	}
	output(" A moan escapes your lips, voice warbling as you feel the stiff, pointed shaft of Kaede’s prick spear your hole.");
	
	var holeTightness:Number;

	if (pc.hasVagina())
	{
		holeTightness = pc.vaginas[0].looseness();
		pc.cuntChange(0, 50, true, true, false);
	}
	else
	{
		holeTightness = pc.ass.looseness();
		pc.buttChange(50, true, true, false);
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
	if (!pc.hasVagina()) output(" your own sensitive spots");
	else output(" the bud of your [pc.clit]");
	output(", and shifting your [pc.hips] to make sure Kaede’s cock is grinding against the most tender parts of your slick passage. It’s a desperate race to catch up to your partner, but as she starts to murmur warnings of her impending orgasm, you’re able to answer her with a simple <i>“Me too,”</i> and pull her into a kiss.");
	
	output("\n\nA moment later, you feel Kaede’s knot pressing into your [pc.vagOrAss], and the first spurt of hot seed shooting into your");
	if (!pc.hasVagina()) output(" bowels");
	else output(" womb");
	output(". The feeling of that wonderfully sticky heat and the forceful stretch as Kaede hammers her knot into you sends you over the edge with her. You moan into the kiss, letting your [pc.vagOrAss] contract and squeeze around Kaede’s cock. The sensation of semen slathering over your");
	if (!pc.hasVagina()) output(" anal");
	else output(" vaginal");
	output(" walls sends shivers all through you, and your moans redouble into your lover’s lips. Your [pc.chest] presses against her breasts, and your arms wrap around Kaede to pull her tight against you. Both your hips grind against each other, ramming her knot deeper into your straining hole.");
	
	output("\n\nSeveral minutes of pleasurable moans and sighs follow as you and Kaede bask in the afterglow. Your hips gently rock, enjoying the fullness of the knot stretching you and grinding against your tender walls. Slowly but surely, the tie holding you together starts to deflate, releasing you from Kaede’s grasp.");
	
	output("\n\nWhen you’re sure you can slip it out of you, you rise up on your [pc.knees] and ease Kaede’s cock on out. It pops wetly from your [pc.vagOrAss], leaving a trickling trail of cum down your thigh.");
	
	output("\n\n<i>“Oh my God...”</i> Kaede moans, running a hand through her fiery hair. <i>“That was great, [pc.name].”</i>");
	
	output("\n\nYou smile down at her, cupping her cheek and running your thumb across it. Her cock jumps a little at your hand’s nearness, almost tempting you into continuing your love-making by jacking the cute red shaft off. Instead, you roll out of Kaede’s lap and onto the couch beside her.");
	
	output("\n\nAfter a few moments of companionable quiet, Kaede grunts and sits up, crossing her legs over her crotch. She picks up the glasses she’d brought out beforehand and pours a couple of drinks out, one for each of you.");
	
	output("\n\nYou clink your glasses together, both laughing <i>“Cheers,”</i> before you drink.");
	
	output("\n\nBy the time you finish your glass, Kaede’s making eyes towards her cabin, and the pile of clothes she’s doubtless left behind. <i>“So, uh, I should probably get going,”</i> she says, hopping off the table and clinking her glass onto the projector’s top. <i>“Still got that delivery to make... I’m sure that Fed guard’s thinking I fell off a cliff or something.”</i>");
	
	output("\n\n<i>“Yeah,”</i> you say, grabbing your [pc.gear]. <i>“This was fun, Kaede.”</i>");
	
	output("\n\nShe winks at you. <i>“Definitely. Maybe we can do it again sometime.”</i>");
	
	output("\n\nYou tell her you’re looking forward to it as she strides off into her cabin. She leaves the door open, letting you watch as she divests herself of the kinky lingerie and slips back into her boxers, jeans, and tanktop. You manage to get dressed quickly enough, and join Kaede on the way towards the airlock. As it’s opening up, she stops to grab your hands and plant a kiss on your cheek.");
	
	output("\n\n<i>“See you later, [pc.name],”</i> she says with a smile, heading off onto the tarmac. You disembark, heading back toward the transport hub. Hopefully you’ll get another chance at that cute piece of ass again sometime soon!");

	processTime(45+rand(15));
	pc.orgasm();

	currentLocation = "600";
	var map:* = mapper.generateMap(currentLocation);
	userInterface.setMapData(map);
	showName("AIRFIELD\nSOUTH");

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}