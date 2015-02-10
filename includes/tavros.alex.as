import classes.Characters.PregnancyPlaceholder;
/*FIRST TIME INTRO
[No]
[Yes]
[Flirt]
[Yes]
[No]
[What are you?]
[Yes]
[More]
[Bail]
REPEAT INTRO (you didn’t tap that)
[Androgyne]
[Flirt]
[What are you]
[Bail Again]
REPEAT INTRO (You tapped that (or bailed at the last minute))
[Alex]
[Sex]
[Talk]
SEX (FUCKING FINALLY)
Aside: BUT WHAT DO DICK SIZES MEAN TO ALEX?
[Pitch Vaginal]
[Catch Vaginal]
[Frottage]
[Catch Anal]
[Bail Once More]*/

public function alexNameBustDiplay():void {
	userInterface.showBust("ALEX");
	if(flags["FUCKED_ALEX"] != undefined || flags["LAST_MINUTE_ALEX_BACK_OUT"] != undefined) userInterface.showName("\nALEX");
	else userInterface.showName("PRETTY\nBOY");
}

public function getAlexPregContainer():PregnancyPlaceholder
{
	var pregContainer:PregnancyPlaceholder = new PregnancyPlaceholder();
	pregContainer.createStatusEffect("Infertile");	
	return pregContainer;
}

//FIRST TIME INTRO
public function alexManHermIntro():void {
	if(flags["FUCKED_ALEX"] == undefined && flags["MET_ALEX"] == undefined) output("\n\nYour attention is drawn by a tall and very pretty... Man? Woman? A very pretty person leaning against the bar, clad in baggy pants tucked into boots and a strip of cloth wrapped tightly around their very flat chest. That combined with the close-cropped hair and slight but noticeable muscle tone makes you want to say it’s a man, but their lithe, narrow waist and flared hips imply otherwise. Before you can make a call, the person in question flashes you a brilliant smile your way and beckons you over.");
	else if(flags["FUCKED_ALEX"] == undefined && flags["LAST_MINUTE_ALEX_BACK_OUT"] == undefined) output("\n\nIt looks like that androgynous man from before is around again.");
	else 
	{
		output("\n\nYour ");
		if(flags["FUCKED_ALEX"] != undefined) output("fuck-");
		output("buddy Alex is hanging out in his usual spot at the bar, drinking something fruity looking and casting occasional lascivious glances your way.");
	}
	//Do you approach?
	//[Yes] [No]
	addButton(1,"Androgyne",approachAlex);
}

public function approachAlex():void {
	if(flags["MET_ALEX"] == undefined) approachAlexTheFirstTime();
	else if(flags["FUCKED_ALEX"] == undefined && flags["LAST_MINUTE_ALEX_BACK_OUT"] == undefined) repeatApproachAlex();
	else approachAlexAfterHavingSexOrAlmostHavingSex();
}

//[No]
//Androgyny isn’t really your scene, or maybe you’re just not in the mood right now. You wave back and shake your head {politely/dismissively}. They seem to take it pretty well, either way.
//	(Add “Androgyne” button when standing around the bar and go to repeat intro)

//[Yes]
public function approachAlexTheFirstTime():void {
	clearOutput();
	alexNameBustDiplay();
	author("RadicalBroseph");
	flags["MET_ALEX"] = 1;
	output("Why not? Looks like it could lead to a good time and even if not you might get to sate your curiosity at the very least. You make your way over and lean against the bar with your new companion.");
	output("\n\n<i>“Hey,”</i>  he says, because that’s definitely a male voice, though even up close it’s still pretty hard to tell just by looking at him. <i>“Like what you see? Or are you just here for the conversation?”</i>  The prettyboy winks, still grinning broadly and not at all subtly eyeing your assets in turn.");
	processTime(1);
	//[Flirt] [What are you?] [Bail]
	clearMenu();
	if(pc.lust() >= 33) addButton(0,"Flirt",flirtWithAlex);
	else addDisabledButton(0,"Flirt");
	addButton(1,"WhatAreYou?",askAlexWhatHeIs);
	addButton(2,"Bail",bailOnAlex);
}

//[Flirt]
public function flirtWithAlex():void {
	clearOutput();
	alexNameBustDiplay();
	author("RadicalBroseph");
	output("You grin back and tell him that you’re certainly not going to complain about the view. He laughs.");
	output("\n\n<i>“Well, you’re not so bad yourself. Always had a healthy appreciation for ");
	if(pc.biggestTitSize() < 1) output("a nice, toned chest");
	else if(pc.biggestTitSize() <= 4) output("a healthy handful");
	else output("an overflowing cup");
	output(", if you know what I’m saying.”</i>  The suggestive way he caresses his own chest makes it abundantly clear what, exactly, he’s saying. <i>“And of course a " + pc.mfn("strong jaw","pretty face","pretty face with a strong jaw") + " certainly doesn’t hurt.");
	//if masculine and breasts > C cup OR feminine and breasts = flat: 
	if(pc.mf("man","woman") == "man" && pc.biggestTitSize() >= 3 || pc.mf("","f") == "f" && pc.biggestTitSize() < 1) output(" Nice to see other people out there willing to mix and match too, so to speak.");
	output("”</i>");

	output("\n\nYour new friend leans in, a particularly wolfish smile on his face.");

	output("\n\n<i>“What do you say we cut to the chase and head up to my room for some fun?”</i>");
	processTime(2);
	//if taur with back mounted bits:
	if(pc.isTaur() || pc.isDrider()) 
	{
		output("  A thought seems to strike him after he says this, however, and he crouches momentarily to try to get a good look at your undercarriage. <i>“Though, uh. To be honest I’m not sure I’m exactly equipped to handle you. Sorry, but you might wanna look elsewhere.”</i>  He has the graces to look apologetic about it, at least. You get the feeling you’re not getting much of anything out of this guy.");
		
		//(kick back to bar menu)
		clearMenu();
		addButton(0,"Next",mainGameMenu);
		return;
	}
	//[Yes] [No]
	clearMenu();
	if(pc.lust() < 33) {
		output("\n\nYou aren't really turned on enough to hook up right now.");
		addDisabledButton(0,"Yes");
	}
	else addButton(0,"Yes",alexSexMenu);
	addButton(1,"No",noToAlyxSex);
}
//[Yes]
//(GO TO SEX)

//[No]
public function noToAlyxSex():void {
	clearOutput();
	alexNameBustDiplay();
	author("RadicalBroseph");
	output("This guy seems nice, if a little cocky, but you’re not really feeling it. You decline ");
	if(pc.isNice()) output("as politely as you can manage");
	else output("bluntly");
	output(" and he shrugs.");

	output("\n\n<i>“Suit yourself,”</i>  he says, seeming to take your rejection in stride. <i>“I’ll be around if you change your mind, though.”</i>");
	//(Add “Androgyne” button when standing around the bar and go to repeat intro)
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[What are you?]
public function askAlexWhatHeIs():void {
	clearOutput();
	alexNameBustDiplay();
	author("RadicalBroseph");
	flags["ASKED_ALEX_WHAT_HE_IS"] = 1;
	output("For a moment the guy actually looks surprised and almost a little taken aback, but before you can say anything else he’s started laughing. <i>“Well, aren’t you straightforward?”</i>  he says, sounding more bemused than anything else. <i>“I’m guessing you mean in terms of what I’m packing, yeah?”</i>");
	output("\n\nYou nod, saying that that’s about the gist of it.");

	output("\n\n<i>“Well, this thing,”</i>  he pulls down the cloth wrapped around his torso slightly, revealing a very flat but well-toned chest and giving you a good long look before pulling it back into place. <i>“Isn’t for decency’s sake. I like to think of myself as a man, but to tell you the truth? Downstairs I’m packing a little bit of both. Why limit myself to having half as much fun, right?”</i>  He leans back against the counter, giving you a very self-satisfied smile.");
	output("\n\n<i>“So, is that enough to answer your question or are you interested in learning a bit more?”</i>  The pointed way in which he looks you up and down when he says ‘more’ gives you the impression that he’s talking about a very hands-on sort of demonstration.");
	processTime(3);
	if(pc.isTaur() || pc.isDrider()) 
	{
		output("\n\nA thought seems to strike him after he says this, and he crouches momentarily to try to get a good look at your undercarriage. <i>“Though, uh. To be honest I’m not sure I’m exactly equipped to handle you. Sorry, but you might wanna look elsewhere.”</i>  He has the graces to look apologetic about it, at least. You get the feeling you’re not getting much of anything out of this guy.");
		//(kick back to bar menu)
		clearMenu();
		addButton(0,"Next",mainGameMenu);
		return;
	}
	output("\n\nWhat do you say?");
	//[Yes] [More]
	clearMenu();
	addButton(0,"More Please",alexSexMenu);
	addButton(1,"That'sEnough",thatsEnoughAlex);
}
//[More]
//(GO TO SEX)

//[Yes]
public function thatsEnoughAlex():void {
	clearOutput();
	alexNameBustDiplay();
	author("RadicalBroseph");
	output("Yeah, that’s about all the information you were after. The prettyboy looks more than a little bit disappointed, but his seemingly ever-present grin is back on again quickly enough.");
	output("\n\n<i>“Suit yourself,”</i> he says, shrugging. <i>“I’ll be around if you ever change your mind, though.”</i>");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Bail]
public function bailOnAlex():void {
	clearOutput();
	alexNameBustDiplay();
	author("RadicalBroseph");
	output("Come to think of it, this guy isn’t really your type. You make some pleasant small talk for a little while before making your excuses and going back to your business.");
	//(Add “Androgyne” button when standing around the bar and go to repeat intro)
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}


//REPEAT INTRO (you didn’t tap that)
public function repeatApproachAlex():void {
	clearOutput();
	alexNameBustDiplay();
	author("RadicalBroseph");
	output("You make your way over to the man once again.");

	output("\n\n<i>“Hey,”</i>  he says. <i>“Looking for a good time?”</i>");
	if(pc.isTaur() || pc.isDrider()) 
	{
		output("  A thought seems to strike him after he says this, and he crouches momentarily to try to get a good look at your undercarriage. <i>“Though, uh. To be honest I’m not sure I’m exactly equipped to handle you. Sorry, but you might wanna look elsewhere.”</i>  He has the graces to look apologetic about it, at least. You get the feeling you’re not getting much of anything out of this guy.");
		//(kick back to bar menu)
		clearMenu();
		addButton(0,"Next",mainGameMenu);
		return;
	}
	//[Flirt] [What are you?] [Bail Again]
	clearMenu();
	if(pc.lust() >= 33) addButton(0,"Flirt",alexSexMenu);
	else addDisabledButton(0,"Flirt");
	if(flags["ASKED_ALEX_WHAT_HE_IS"] == undefined) addButton(1,"WhatAreYou?",askAlexWhatHeIs);
	addButton(14,"Leave",bailOnAlexAgain);
}

//[Bail Again]
public function bailOnAlexAgain():void {
	clearOutput();
	alexNameBustDiplay();
	author("RadicalBroseph");
	output("You’re still not really into this kind of genderfuck stuff, and ");
	if(pc.isNice()) output("try to let him down gently");
	else output("tell him so");
	output(". He looks pretty disappointed, but shrugs it off easily enough.");

	output("\n\n<i>“Suit yourself,”</i>  he says, shrugging. <i>“I’ll be around if you ever change your mind, though.”</i>");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//REPEAT INTRO (You tapped that (or bailed at the last minute))
public function approachAlexAfterHavingSexOrAlmostHavingSex():void {
	clearOutput();
	alexNameBustDiplay();
	author("RadicalBroseph");
	//(Slip this in after the room description for the bar or however we’re handling NPCs wandering around in this game)
	output("You decide to pay Alex a visit.");
	output("\n\n<i>“Hey, [pc.name],”</i>  he says, grinning broadly at you. <i>“Taking a break from your busy life to visit little old me? You shouldn’t have.”</i>  He laughs, maybe a little more enthusiastically than is called for, and the two of you share some idle conversation.");
	output("\n\n<i>“So,”</i>  he asks, once the ice is sufficiently broken. <i>“You up for another round, or did you just come here to talk?”</i>");
	//[Sex] [Talk]
	clearMenu();
	addButton(0,"Sex",alexSexMenu);
	addButton(1,"Talk",talkToAlex);
	addButton(14,"Back",mainGameMenu);
}

//[Sex]
//(GO TO SEX)

//[Talk]
public function talkToAlex():void {
	clearOutput();
	alexNameBustDiplay();
	author("RadicalBroseph");
	//(Maybe there’ll be actual content here eventually but damn it I’m writing a fuckbuddy not a husbando)
	output("You tell Alex you’re good with just spending some fully-clothed, pants-on, platonic friends time with him.");
	output("\n\n<i>“Cool with me</i>,”  he says, shrugging. <i>“");
	if(flags["FUCKED_ALEX"] != undefined) output("You’re a good fuck, but i");
	else output("I");
	output("f I’m going to be totally honest here you outclass most of the folks around here in conversation too</i>.”");
	output("\n\nYou and Alex spend some ");
	if(silly) output("fully-clothed, pants-on platonic friends ");
	output("time together, chatting about your various adventures before you realize you need to get going and say your goodbyes.");
	processTime(10+rand(3));
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//SEX (FUCKING FINALLY)
public function alexSexMenu(display:Boolean = true):void {
	if(display) 
	{
		clearOutput();
		alexNameBustDiplay();
		author("RadicalBroseph");
		output("You tell him you think you’re up to it if he is.");
		output("\n\n<i>“Great,”</i>  he says, grin widening as he shoves a hand in his pocket and fishes around for a bit before pulling out a key. <i>“Head on up to my room and get yourself ready while I try to flag down the bartender so I can pay off my drink.”</i>");
		if(silly) output("  Wow, what a trusting guy. You think about stealing his room key for a little while before deciding against it. Theft would be way too annoying to implement just for a scene like this.");

		output("\n\nFeeling your ");
		if(pc.hasVagina() && pc.hasCock()) output("[pc.vaginas] slicken and [pc.cocks] harden");
		else if(pc.hasVagina()) output("[pc.vaginas] slicken");
		else if(pc.hasCock()) output("[pc.cocks] harden");
		else output("body grow hot");
		output(" with anticipation, you head up the stairs, find your new friend’s room, and head inside. It’s not really all that impressive, but given the state of this place in general that’s not a big surprise, and all that matters right now is that the bed looks comfortable enough. You’re just about out of your [pc.gear] when you hear a knock on the door and turn around to see ");
		if(flags["FUCKED_ALEX"] != undefined || flags["LAST_MINUTE_ALEX_BACK_OUT"] != undefined) output("Alex");
		else output("your partner");
		output(" peeking in. He whistles appreciatively.");

		//{If first time boning Alex (or if first time since changing genital configuration if that’s not too much of a bitch to code):
		if(flags["FUCKED_ALEX"] == undefined) {
			var he:String = pc.mfn("he","she","meh");
			//If herm:
			if(pc.hasCock() && pc.hasVagina())
			{
				output("\n\n<i>“I see someone else is big on batting for both teams,”</i>  he laughs, shutting the door behind him. <i>“Oh yeah, we’re going to have some fun.”</i>");
			}
			//If dick & masculine:
			else if(pc.hasCock() && he == "he")
			{
				output("\n\n<i>“Wow,”</i>  he says, shutting the door behind him as he admires your [pc.cocks].");
				if(pc.longestCockLength() <= 5.5) output(" <i>“You know, I’ve gotta say that living in a galaxy full of people splicing up to try and get the biggest, thickest dick has really made me appreciate the little things in life.”</i>  You roll your eyes as he takes a moment to laugh at his own joke. At least he seems to be into it.");
				else if(pc.longestCockLength() <= 10) output(" <i>“Call me old fashioned, but there’s almost nothing I love more than a good dick. And you, sir, have got a good dick.”</i>");
				else if(pc.longestCockLength() <= 18) output(" <i>“You’re quite the catch. I really hope you’re planning on fucking me with that, damn. Been a while since I had anything that big.”</i>");
				else output(" <i>“Holy fuck. Okay, I’m pretty flexible, but that’s going to take some work. Wow. How long did you have to work at getting it that big?”</i> You say you’ll tell him later, when there aren’t more pressing issues at hand.");
				output("\n\n<i>“Yeah, right, I figure you didn’t exactly come up here to tell me your life story,”</i> he says, shaking off his surprise.");
			}
			//If dick & feminine:
			else if(pc.hasCock() && (he == "meh" || he == "she"))
			{
				output("\n\n<i>“Never would’ve guessed that,”</i>  he says, shutting the door behind him as he admires your [pc.cocks].  <i>“Not that I’m complaining, of course. Who isn’t into ");
				if(pc.biggestTitSize() >= 1) output("chicks with dicks");
				else output("beautiful men");
				output(", am I right?”</i>");
			}
			//If pussy & feminine:
			else if(pc.hasVagina() && pc.mf("","she") == "she")
			{
				output("\n\n<i>“Wow,”</i>  he says, shutting the door behind him as he admires you from top to bottom");
				if(silly) output(" but mostly focusing on your [pc.chest]");
				output(". <i>“Call me old fashioned, but I’ve never been able to say no to a classic beauty like you.”</i>");
			}
			//If pussy & masculine:
			else if(pc.hasVagina()) {
				output("\n\n<i>“Wow,”</i> he says, shutting the door behind him as he admires you from top to bottom. <i>“You know, you don’t see a lot of people rocking that combo around. Chicks with dicks are a dime a dozen, but man do I love guys with cunts.");
				if(pc.biggestTitSize() > 2) output(" Not about to complain about your tits, either.");
				output(" Damn.”</i>");
			}
			//If genderless:
			else {
				output("\n\n<i>“Huh,”</i>  he says, shutting the door behind him and looking pretty damn puzzled. <i>“Well.”</i>  There’s a long, awkward moment where he just stares at you with a look on his face like he’s trying to work out some complex math problem. You sigh and ask if there’s something wrong.");
				output("\n\n<i>“No, no, I’ve got this,”</i>  he replies, not seeming wholly convinced himself but determined to rise to the challenge nonetheless. After another pause for consideration his cocky smile is firmly affixed on his face once again. <i>“Yeah, I’ve got this. Sorry, It’s just not every day I see something new, you know?”</i>  You concede that your attributes, or lack thereof, are pretty out of the ordinary.");
			}
		}
		output("\n\n<i>“So,”</i> he says, wasting no time in stripping out of his own clothes to reveal an already-hard, seven-inch human cock and two full, golfball-sized testicles. <i>“What are you waiting for?”</i>");
		output("\n\nYou ");
		if(pc.legCount > 1) output("stride");
		else output("slither");
		output(" forward confidently, wrapping your arms around his ");
		if(pc.tallness > 72) output("girly waist");
		else output("shoulders");
		output(". He seems to melt against you, more than pleased to let you take the lead as you maneuver him around so his back is to the bed and push him down. Moaning lustily into your mouth, he arches his back to press his flat, muscular chest against your [pc.chest]");
		if(flags["FUCKED_ALEX"] == undefined) 
		{
			output(" before stopping abruptly.");
				output("\n\n<i>“Shit</i>,” he says, pulling out of your lip-lock. <i>“Where’s my manners? My name’s Alex.”</i> He offers you a hand, which you take despite your mild confusion. Surprisingly, given everything else about him, his handshakes are very firm and manly. You introduce yourself in kind. <i>“Well it’s nice to meet you, [pc.name]. Not that I expect this to be much more than a wham, bam, thank you ma’am, but it’s just nice to know who you’re fucking, right?”</i>  Before you can respond, he’s pulled you back into a passionate kiss.");
		}
		output("\n\nYou explore Alex’s mouth with your tongue, tasting the last remnants of whatever fruity thing he’d been drinking before sneaking off with you and enjoying the low rumble of his moans against your [pc.lips] as he wriggles under you, gently pressing a knee up ");
		if(pc.hasStatusEffect("Genital Slit")) output("against your genital slit");
		else if(pc.isTaur() || pc.isGoo()) 
		{
			output("against where your torso meets your ");
			if(pc.isGoo()) output("soft, gel-like");
			else output("animalistic");
			output(" lower half");
		}
		else if(pc.hasVagina()) output("against your soaked netherlips");
		else if(pc.hasCock()) output("against your nearly unbearable hardness");
		else output("between your thighs");
		output(".");

		output("\n\n<i>“So,”</i>  he murmurs, <i>“How do you want to do this?”</i>");
		userInterface.showName("\nALEX");
	}
	//[Pitch Vaginal] [Catch Vaginal] [Frottage] [Catch Anal] [Bail Once More]
	//Pitch Vaginal is available to all dickhavers as long as their dicks are between their front set of legs.
	//Catch Vaginal is available to all vagina havers as long as their pussies are between their front set of legs until I go back and write a taur version.
	//Frottage isn’t written yet because I’m a lazy asshole.
	//Catch Anal is fun for everyone.
	
	clearMenu();
	//[Pitch Vaginal]
	//(Available to all dickhavers)
	if(pc.lust() >= 33)
	{
		if(pc.hasCock())
		{
			addButton(0,"Pitch Vaginal",pitchIntoAlexsBoyPussy);
			addButton(2,"Frottage",frottageWithAlex);
		}
		else {
			addDisabledButton(0,"Pitch Vaginal");
			addDisabledButton(2,"Frottage");
		}
		if(pc.hasVagina())
		{
			//[Catch Vaginal]
			//(Shoutout to all the cunthavers)
			addButton(1,"Catch Vaginal",catchVaginalFromAlex);
		}
		else addDisabledButton(1,"Catch Vaginal");
		addButton(3,"Catch Anal",catchAnalFromAlex);
	}
	else {
		addDisabledButton(0,"Pitch Vaginal");
		addDisabledButton(1,"Catch Vaginal");
		addDisabledButton(2,"Frottage");
		addDisabledButton(3,"Catch Anal");
	}
	addButton(14,"Leave",bailOutOnAlex);
	//Aside: BUT WHAT DO DICK SIZES MEAN TO ALEX?
	//That’s a good fucking question. This kind of game makes all sense of scale kind of fly out the window for me a bit so I’m not really sure. Call small dicks anything five inches or shorter unless they’re super thick, medium anything from six inches to a foot long, and big anything bigger than that. HUGE is probably something equivalent to being triple- or quadruple-fisted or something? I’d give you numbers but I don’t remember the cockarea equations offhand ever since we stopped assuming dicks were box-shaped, and also don’t want to have to do extensive dick math.

	//I don’t know when he stops being able to fit your dicks inside of him. I tried figuring out how big the pelvis is but then I remembered that no you can totally fit stuff bigger than an infant inside you back in CoC without worrying about your pubic symphysis even if you’ve got no hips so who knows. I leave it up to someone better at hyper than me.
}

//[Pitch Vaginal]
//(Available to all dickhavers)
public function pitchIntoAlexsBoyPussy():void {
	clearOutput();
	author("RadicalBroseph");
	alexNameBustDiplay();
	showBust("ALEX_NUDE");
	//If none of your cocks fit:
	if(pc.cockThatFits(200) < 0)
	{
		output("Alex glances back and forth between your [pc.cocks] and his comparitively small frame a few times, looking concerned.");
		output("\n\n<i>“I don’t think this is gonna work,”</i>  he says, hesitantly. <i>“Like, if I thought it was at all possible I’d be thrilled to give it a shot, but I’m not exactly a rahn, you know?”</i>  With an expression of intense disappointed longing on his face, he reaches out and pats your [pc.cockBiggest] as if to check if something that huge could really be real.");
		output("\n\n<i>“Don’t you get dizzy every time you pop a boner or something? Wow. Anyway, is there anything else you wanna try? I’m up for just about anything.”</i>");
		//(sex menu with all applicable options except Pitch Vaginal)
		alexSexMenu(false);
		return;
	}
	var x:int = pc.cockThatFits(200);
	//If one fits:
	output("You tell Alex to get on all fours and present himself to you; a command with which he happily complies, rolling over onto his stomach and quickly getting his knees under him so his full, heart-shaped butt is up in the air. His pussy, previously hidden from view by his cock and balls, is soaking wet and drooling down his thighs");
	if(pc.wetness() > 3) output(", though it’s nothing compared to yours");
	output(". Running two fingers teasingly up and down the length of his slit and giving special attention to the small, hard nub of his clit, you ask him if he’s ready for you.");

	output("\n\n<i>“Yes,”</i>  he gasps, voice hitching up to an almost feminine key. <i>“Yes, stop teasing, I need this.”</i>");

	output("\n\nGrinning, you withdraw your hand and give his ass an appreciative slap, pleased to see how well it jiggles. Alex just whimpers and wiggles his hips back and forth, trying to tempt you into taking action instead of taunting him any further. It certainly proves an effective tactic, and you find yourself with your hands gripping his wide, womanly hips as you align your [pc.cock " + x + "] with his slick folds.");
	//If small dick:
	if(pc.cocks[x].cLength() <= 5.5) {
		output("\n\nYou slide easily into his experienced cunt");
		if(pc.balls > 0) output(", [pc.balls] slapping wetly against his throbbing clit");
		output(". He’s loose around you but he moans nonetheless, apparently very turned on by the feeling of your [pc.cockHead " + x + "] rubbing against his well-used walls, and after a moment to adjust he’s able to clench down on your [pc.cock " + x + "] surprisingly well.");
	}
	//if medium dick:
	if(pc.cocks[x].cLength() <= 10) {
		output("\n\nSlowly, wanting to draw this out as much as possible, you press your [pc.cock " + x + "] inch by inch into his cunt, enjoying every ripple and spasm as he moans and tries to buck back against you for more. You’ve got your own ideas, though, and hold his hips steady until you’re fully sheathed inside of him, [pc.cockHead " + x + "] pressed against his cervix");
		if(pc.balls > 0) output(" and [pc.balls] slapping wetly against his throbbing clit");
		output(".");
	}
	//if big or HUGE dick:
	else if(pc.cocks[x].cLength() <= 18) 
	{
		output("\n\nIt takes a few tries, sliding the [pc.cockHead " + x + "] of your [pc.cock " + x + "] up and down his netherlips until the combination of your ");
		if(pc.cumQ() >= 100) output("copious ");
		output("pre-cum and his lady juices gets you wet enough to finally press in. Alex gasps as your massive head passes the comparatively tight entrance of his cunt, fingers tangling into the sheets as he’s stretched to capacity.");
	}
	//if HUGE dick:
	else 
	{
		output("\n\nActually feeling a little concerned, you ask if he’s going to be okay.");
		output("\n\n<i>“Fffffuck yeah,<i>”  he hisses through gritted teeth. <i>“Never better. Holy shit.”</i>  Good enough for you, you think, before getting back to your business.");
		output("\n\nHe’s tight, wonderfully tight to the point that you can actually feel his pulse pounding through the wet, hot walls of his pussy, and that’s just with the tip inside. You moan and ease in, stretching his already loose cunt even further, bit by bit until your cockhead is pressed flush against his cervix.");
	}
	//(DICK VIRGINITY CHECK)
	pc.cockChange();

	output("\n\nYou let him rock back against you for a little while, leaning forward ");
	//if breasts > B cup:
	if(pc.biggestTitSize() > 2) {
		output("and squishing your [pc.fullChest] against his back");
		if(pc.isLactating()) output(", smearing your [pc.milk] across his shoulders ");
		else output(", pressing your [pc.chest] against his back ");
	}
	output("while you tweak his small, perky nipples and nip at his ear. He moans, low and needy and starts to complain about you teasing him again before you pull almost all the way out and slam into him again suddenly");
	if(pc.cocks[x].cLength() <= 10) output(" with a wet slap of skin against skin as your [pc.hips] meet his, jiggling his rounded ass enticingly.");
	else output(", causing him to yelp as the head of your [pc.cock " + x + "] slams into his cervix.");
	if(pc.hasCuntTail()) output(" Feeling a little left out, your [pc.tailgina] stirs, swishing back and forth behind you before slipping around your waist to get a piece of the action. With a practiced, almost graceful movement, it slides its moist folds over Alex’s hip before rearing back and engulfing his cock in one smooth motion. Alex gasps, knees almost giving out from under him at the dual sensation of fucking and being fucked, but you manage to hold him up by his waist.");

	output("\n\nAfter this, you settle into a quick but steady rhythm, pulling him out and leaving him empty before filling him up again");
	if(pc.cockTotal() > 1 && pc.hasVagina())
	{
		output(", your extra dick");
		if(pc.cockTotal() > 2) output("s");
		output(" rubbing against his pussy-slicked balls and thighs while your own neglected cunt throbs with sympathetic need ");
		if(pc.wetness() >= 3) output(", soaking your thighs as well");
		output(".");
	}
	else if(pc.cockTotal() > 1) 
	{
		output(", your extra dick");
		if(pc.cockTotal() > 2) output("s");
		output(" rubbing against his pussy-slicked balls and thighs.");
	}
	else if(pc.hasVagina())
	{
		output(", your own neglected ");
		if(pc.vaginaTotal() == 1) output("pussy");
		else output("pussies");
		output(" throbbing with sympathetic need");
		if(pc.wetness() >= 3) output(" and soaking your thighs");
		output(".");
	}
 	output("\n\nHe’s probably not the best fuck in the galaxy but he has to be up there with the way he slams back into you in time to your thrusts and clenches around you");
 	if(pc.cocks[x].cLength() <= 5.5) output(" despite your size");
 	output(", almost like he’s milking your cock. You just about think you’re going to cum first until you hear him cry out, shuddering as his dick");
 	//no tailcunt:
 	if(!pc.hasTailCunt()) output(" spurts thick ropes of cum onto the sheets");
 	else output(" feeds thick ropes of cum into your hungry pussy tail");
 	output(" and his walls spasm wildly around you, wetting your thighs ");
 	if(pc.hasVagina() && pc.wetness() >= 3) output("even further ");
 	output("as he collapses forward onto the mattress. Looks like he’s a squirter too, on top of everything else. You follow shortly after him, ");
 	if(pc.cumQ() <= 40) {
 		if(!pc.hasKnot(x)) output("planting ");
 		else output("knot bulging as you plant ");
 		output("your seed deep in his pussy");
 	}
 	else if(pc.cumQ() <= 500) 
 	{
 		if(!pc.hasKnot(x)) output("unleashing ");
 		else output("knot swelling to full size as you unleash ");
 		output("gob after gob of thick [pc.cumNoun] inside of him");
 		if(!pc.hasKnot(x)) output(" until it starts to drip out around you");
 	}
 	else
 	{
 		output("unleashing such a massive, powerful torrent of [pc.cum] that his belly begins to round out, man-womb packed so full of your seed that he looks a few months pregnant");
 		if(!pc.hasKnot(x)) output(" even though most of it came rushing out around your cock");
 		else output(" thanks to your knot plugging his pussy so well that only a few thin streams can escape");
 	}
 	output(".");

 	output("\n\n<i>“Oh wow,”</i>  he groans, rolling onto his back and panting, cum ");
 	if(pc.cumQ() <= 25) output("dripping");
 	else if(pc.cumQ() <= 500) output("streaming");
 	else output("gushing");
 	output(" from his snatch");
 	if(pc.hasKnot(x) && pc.cumQ() > 500) output(" as your knot slips out of him. Tentatively, almost gingerly, he runs a hand over the taut mound of his stomach");
 	else if(pc.hasKnot(x)) output(" as your knot slips out of him");
 	else if(pc.cumQ() > 500) output(" as he runs a hand over the taut mound of his stomach");
 	output(". <i>“You’re one hell of a fuck, [pc.name]. Shit. Give me a bit to recover - I’m gonna need it. Feel free to use the shower.”</i>");

 	output("\n\nYou get yourself cleaned up, retrieve your clothes, and head back to the bar.");
 	if(flags["FUCKED_ALEX"] == undefined) flags["FUCKED_ALEX"] = 0;
	flags["FUCKED_ALEX"]++;
 	processTime(30+rand(15));
 	pc.orgasm();
 	clearMenu();
 	addButton(0,"Next",mainGameMenu);
 }

//[Catch Vaginal]
//(Shoutout to all the cunthavers)
public function catchVaginalFromAlex():void {
	clearOutput();
	author("RadicalBroseph");
	alexNameBustDiplay();
	showBust("ALEX_NUDE");
	var x:int = pc.cuntThatFits(20);
	if(x < 0) x = rand(pc.vaginas.length);
	output("You smile down at Alex and ");
	//if naga:
	if(pc.isNaga()) output("slither onto the bed to ");
	//if goo:
	else if(pc.isGoo()) output("slither onto the bed and envelop his thighs to ");
	//if biped:
	else output("climb on top of him, straddling his hips to ");

	output("position your womanly parts over his cock");
	if(pc.cockTotal() > 0) output(" while [pc.eachCock] stands proudly at attention");
	output(". He seems to catch on quickly enough, placing his manicured hands at the crests of your hips, though more to keep you steady than to take a leading role himself, it seems. With an agonizing slowness, you lower yourself down onto him, the lips of your [pc.vagina " + x + "] rubbing teasingly over his cock");
	if(pc.wetness(x) >= 3) output(" while your fluids sheath him in slick wetness before you’ve even taken him");
	output(". You can actually see him straining not to buck his hips or try to force you down onto him and you revel in it, savoring each moment as much as you can before it becomes too much for you and you drop down onto him with a wet slapping sound.");
	//(VAGINAL VIRGINITY/HYMEN CHECK)
	//Store virgin status first - it might come up later
	var isVirgin:Boolean = false;
	if(pc.vaginalVirgin) isVirgin = true;
	pc.cuntChange(x,20,true,true,false);
	//If tight:
	if(pc.vaginalCapacity(x) <= 25) 
	{
		output("\n\nAlex isn’t exactly big, or at least he isn’t one of the many behemoths you know are waiting out there, but he’s big enough to stretch you out. You can feel each and every vein and ridge on his cock and even the way it twitches slightly with his pulse as it fills you out deliciously");
		if(pc.hasCock()) output(", your [pc.cocks] twitching and leaking pre-cum over his stomach in sympathetic lust");
		if(pc.totalVaginas() > 1) 
		{
			output(" and even the causing the walls of your unused ");
			if(pc.totalVaginas() == 2) output("snatch");
			else output("snatches");
			output(" to rub against each other wonderfully");
			output(".");
		}
	}
	//if medium:
	else if(pc.vaginalCapacity(x) <= 50) 
	{
		if(!isVirgin) output("\n\nAlex’s isn’t exactly the biggest dick you’ve taken in your adventures, but he’s big enough to make you feel wonderfully filled, pressing against your walls in all the right ways");
		else output("\n\nAlex's isn't the biggest dick you've seen thanks to the extranet, but he's big enough to make you feel wonderfully filled, pressing against your walls in all the right ways.");
		//if herm:
		if(pc.hasCock())
		{
			output(" as your ");
			if(pc.cockTotal() == 1) output("cock twitches and leaks");
			else output("cocks twitch and leak pre");
			output(" over his stomach in sympathetic lust");
		}
		if(pc.totalVaginas() > 1)
		{
			output(" and even the causing your unused ");
			if(pc.totalVaginas() == 2) output("snatch to feel full, its");
			else output("snatches to feel full, their");
			output(" walls rubbing against each other");
		}
		output(".");
	}
	//if gaped:
	else 
	{
		if(!isVirgin) output("\n\nYou’ve seen some big cocks in your adventures, and in all honesty, Alex’s run of the mill, unenhanced human penis doesn’t really measure up. That doesn’t stop you from trying.");
		else output("\n\nYou're built for bigger cocks than his, and in all honesty, Alex's run of the mill, unenhanced human penis doesn't really measure up. That doesn't stop you from trying.")

		output(" Rolling your hips, you try to find a position where at least the head of his cock rubs against you and Alex, sensing your frustration and probably working through a bit of his own, tries to match you. Eventually the two of you settle on having you lie almost on top of him, supporting yourself on your elbows");
		if(pc.biggestTitSize() > 2) 
		{
			if(pc.hasCock())
			{
				output(", your breasts and [pc.cocks] sandwiched between the two of you, coating his chest in");
				if(pc.isLactating()) output(" your fluids");
				else output(" your pre-cum");
			}
			output(", your [pc.fullChest] sandwiched between your chests");
			if(pc.isLactating()) output(" and leaking your [pc.milk] all over him");
		}
		//if herm:
		else if(pc.cockTotal() > 1) output(", your [pc.cocks] sandwiched between you and getting pre everywhere");
		else if(pc.totalVaginas() > 1)
		{
			if(pc.totalVaginas() == 2) output(", though your unused snatch still feels");
			else output(", though your unused snatches still feel");
			output(" disappointingly empty");
		}
		output(".");
	}
	//if tailcock:
	if(pc.hasTailCock()) {
		output(" Your [pc.tailCock], seemingly feeling a bit left out, makes itself known, lashing about behind you before diving");
		//if naga:
		if(pc.isNaga()) output(" around your snakelike form");
		else if(pc.isGoo()) output(" around your amorphous lower half");
		else if(pc.isTaur()) output(" under your belly");
		else output(" under your [pc.butt]");
		output(" to plunge into Alex’s waiting cunt, causing him to buck in surprise and drive his cock deeper into you in turn.");
	}

	output("\n\nMoaning, you brace yourself and begin to bounce up and down on your lover’s cock, ");
	if(pc.wetness(x) < 3) output("feeling it in exquisite detail as it passes through your walls and netherlips");
	else output("enjoying the wet squish-squish-squish each movement brings");
	output(".");
	if(pc.biggestTitSize() >= 1)
	{
		//if breasts: 
		output(" Your tits ");
		if(pc.biggestTitSize() <= 2) output("jiggle with a slight, but satisfying weight");
		else if(pc.biggestTitSize() <= 5) output("bounce wildly and slap against your chest with a satisfying heft");
		else output("threaten to smack you in the face");
		if(pc.hasCock()) output(", and your");
	}
	else if(pc.hasCock()) output(" Your");
	if(pc.hasCock()) output("[pc.eachCock] slap against his stomach wetly");
	output(" as you move faster and faster, moaning ecstatically as Alex thrusts up each time to meet you on the way down.");

	output("\n\nYou’re close, you’re very close ");
	//if tight:
	if(pc.vaginalCapacity(x) <= 25) output(", and you’re sure you’re going to come first. Doubly so when Alex reaches down and");
	//if medium or gaped:
	else 
	{
		output(", but you’re a little disappointed to note that it seems like Alex is going to come first, at least until he reaches down and");
	}
	if(pc.hasCock()) output(" starts to jack off [pc.oneCock]");
	else output(" starts to play with [pc.oneClit]");
	output(". Slamming your hips down onto his one last time, you come, hard");
	if(pc.hasCock() && pc.hasTailCock()) output(", your [pc.cocks] and tail-cock");
	else if(pc.hasCock()) output(", your [pc.cocks]");
	else if(pc.hasTailCock()) output(", your tail-cock");
	if(pc.hasCock() || pc.hasTailCock()) 
	{
		output(" following shortly after");
		if(pc.hasCock())
		{
			//low cum quantity:
			if(pc.cumQ() < 25) output(", spattering his chest with [pc.cum]");
			//medium cum quantity:
			else if(pc.cumQ() <= 150) output(", painting his chest with your [pc.cum]");
			else output(", thoroughly coating him in your copious [pc.cum]");
		}
	}
	output(". The orgasmic rippling of your [pc.vaginas]");
	if(pc.hasTailCock()) output(" combined with the sensation of hot cum filling his cunt");
	output(" is enough to send him over the edge, moaning and arching his back as his seed spurts up inside of you, painting your insides white.");

	output("\n\n<i>“Oh wow,”</i>  he groans, panting as you roll off of him. <i>“You’re one hell of a fuck, [pc.name]. Shit. Give me a bit to recover - I’m gonna need it. Feel free to use the shower.”</i>");
	output("\n\nYou get yourself cleaned up, retrieve your clothes, and head back to the bar.");
	if(flags["FUCKED_ALEX"] == undefined) flags["FUCKED_ALEX"] = 0;
	flags["FUCKED_ALEX"]++;
	processTime(30+rand(15));
 	pc.orgasm();
	if(pc.hasVagina()) pc.loadInCunt(getAlexPregContainer());
 	clearMenu();
 	addButton(0,"Next",mainGameMenu);
}

//[Frottage]
//(Dickhavers again (Fun variant for herms if I get to it))
public function frottageWithAlex():void {
	clearOutput();
	alexNameBustDiplay();
	author("RadicalBroseph");
	showBust("ALEX_NUDE");
	var x:int = pc.biggestCockIndex();
	output("Smiling ");
	if(pc.isAss()) output("wolfishly");
	else output("sweetly");
	output(", you ");
	if(!pc.isTaur()) output("sit down on the bed and gesture for Alex to sit in your lap.");
	else output("gesture for Alex to kneel on the bed so his crotch is level with yours.");
	output(" He’s quick to comply, getting into position ");
	if(!pc.isTaur()) output("straddling you");
	else output("on the bed");
	output(" and bracing himself against you, leaning in to press his firm, toned chest against your");
	if(pc.biggestTitSize() < 1) output("s");
	else output(" [pc.fullChest]");
	output(", your ");
	//If multicock:
	if(pc.cockTotal() == 2) 
	{
		output("dual dicks coming to rest on either side of Alex’s, forming a tight V-shape that he seems to be having some trouble resisting the urge to fuck.");
		output("\n\n<i>“Oh man,”</i> he moans, rocking his hips against yours, his pre-slicked cock sliding back and forth across the sensitive bundle of nerves at the meeting of your [pc.cocks]. <i>“You’re really making me reconsider saving up for some more exotic splices " + pc.mf("man","babe") + ". This is too much.”</i>");
		output("\n\nHe fidgets a little while longer before managing to calm down, taking your hands and moving them to his hips as if to ask you to help him keep steady.");
	}
	//3+ dicks:
	else if(pc.cockTotal() > 2)
	{
		output("[pc.cocks] nestling around his like a phallic bouquet, surrounding his hard, throbbing cock in a cluster of rigid man-meat. Alex moans loudly, bucking his hips against yours as he’s seemingly overwhelmed by the sensation of being surrounded by your multitude of dicks.");
		output("\n\n<i>“Oh man,”</i>  he moans, rocking his hips against yours, his pre-slicked cock lost in your forest of manhood, being rubbed against on all sides");
		if(pc.cumQ() >= 150) output(" and coated in your pre");
		output(". <i>“You’re really making me reconsider saving up for some more exotic splices " + pc.mf("man","babe") + ". This is too much.”</i>");
		output("\n\nHe fidgets a little while longer, getting his cock properly acquainted with your [pc.cocks] while you place your hands on his hips to steady him.");
	}
	//If one cock:
	//If small:
	else if(pc.cocks[x].cLength() <= 5.5) {
		output("cocks pressed together between your [pc.belly] and his flat stomach. His member, while pretty respectable by pre-enhancement standards, is definitely on the smaller end of the scale, but even so it ");
		if(pc.cocks[x].cLength() <= 4) output("dwarfs");
		else output("is noticeably bigger than");
		output(" yours, looming over it and pressing it back against your [pc.skin].");
		output("\n\n<i>“It’s so cute,”</i>  Alex coos, arms still draped around your shoulders. <i>“I almost wanna put a little hat on it or something.”</i>");
		output("\n\nYou ");
		if(pc.isNice()) output("smile");
		else if(pc.isMischievous()) output("laugh");
		else output("give him a stern look");
		output(" and get back to business, placing your hands on his waist to steady him.");
	}
	//If medium:
	else if(pc.cocks[x].cLength() <= 10)
	{
		output("cocks pressed together between your [pc.belly] and his flat stomach, your [pc.cockHead " + x + "] rubbing against his smooth skin");
		if(pc.cumQ() >= 100) output(" and drooling pre-cum all over him");
		output(". Alex, seemingly a fan of moderation, has a smaller dick than yours");
		if(pc.cocks[x].cLength() <= 6.5) output(", though not by much,");
		output(" and leans back briefly to give your [pc.cock " + x + "] one last appreciative once-over before draping his arms over your shoulders while you place your hands on his waist to steady him.");
	}
	//If big:
	else
	{
		output("[pc.cock " + x + "] dwarfing his and forcing him to lean back with its monstrous girth. You almost can’t feel Alex’s cock against yours at all, but his smooth chest");
		if(pc.biggestTitSize() >= 3) output(" on the underside of your member combined with the warm embrace of your own [pc.chest] around the rest");
		else output(" rubbing against the underside of your member");
		output(" is definitely enough to compensate. Murmuring happily, he leans in and kisses the ");
		if(pc.cocks[x].cLength() >= 30) output("shaft");
		else output("head");
		output(" of your cock");
		if(pc.cumQ() >= 100) output(", smearing your pre-cum over his full lips");
		output(" as you reach around to place your hands on his waist.");
	}
	
	//if hard: 
	if(pc.isAss()) {
		output("\n\n<i>“Get ready,” you tell him, tightening your grip.");
	}
	//if not:
	else
	{
		output("\n\n<i>“Ready?”</i> you ask, ");
		if(pc.isNice()) output("kissing him on the nose.");
		else if(pc.isMischievous()) output("flashing him a winning smile.");
	}
	output(" Alex nods, almost bouncing in anticipation. Assured that he’s worked up enough for your liking, you begin to move your hips. You start off slow, at first, letting ");
	if(pc.cumQ() >= 50) 
	{
		output("your ");
		if(pc.cumQ() >= 150) output("copious ");
		output("pre-cum ");
	}
	else output("Alex’s pre-cum ");
	if(pc.isLactating()) output("and the [pc.milk] steadily leaking down your chest from your [pc.nipples]");
	output(" coat the two of you thoroughly for smoother and smoother strokes. Seemingly overwhelmed by the sensation of ");
	if(pc.cockTotal() > 1) output("being surrounded by your hard, ready cocks");
	else if(pc.cocks[x].cLength() <= 5.5) output("your [pc.cockHead " + x + "] gliding across his cock");
	else if(pc.cocks[x].cLength() <= 10) output("your [pc.cock " + x + "] rubbing against his");
	else output("his little boy-clit rubbing against your titanic tool");
	output(", your androgynous lover moans and presses himself against you, ");
	if(pc.biggestCockLength() >= 25) output("leaning around your [pc.cockBiggest] to hide his face against your shoulder, effectively jerking you off with the crook of his elbow in the process");
	else 
	{
		output("hiding his face against your [pc.chest]");
		if(pc.biggestTitSize() >= 2) output(" and murmuring his approval into your cleavage");
	}
	output(".");

	output("\n\n<i>“M-more,”</i>  he gasps, breath hot against your [pc.skin]. <i>“Harder, please.”</i>");

	output("\n\nYou’re only happy to oblige. Sliding your hands down his back to grasp his full, round ass - one part for leverage and two parts for your own pleasure - you begin to pick up the pace. The wet sound of skin against cum-slick skin fills the air as you thrust against him, ");
	
	if(pc.cockTotal() > 1) output("his cock almost lost among your [pc.cocks]")

	else if(pc.hasCockFlag(GLOBAL.FLAG_PREHENSILE)) {
		output("your wet cock twining around his");
	}
	//small/med/big dick:
	else if(pc.cocks[x].cLength() <= 18) output("the wonderful friction of your cocks driving you to greater speeds");
	//Huge donger
	else {
		output("essentially using ");
		if(pc.biggestTitSize() >= 3) output("your [pc.chest] and his chest and arms");
		else output("both of your torsos and arms");
		output(" as a person-sized onahole for your mighty manhood");
	}
	//balls and taur/’pillar: 
	if(pc.balls > 0 && pc.isTaur()) 
	{
		output("as your [pc.sack] swings heavily below you");
		if(pc.ballSize() > 6) output(", slapping against the side of the bed");
		output(" with each trust");
	}
	//Hermy balls taur
	else if(pc.balls > 0 && pc.hasVagina())
	{
		output("as your [pc.sack] swings heavily below you and your neglected cunt");
		if(pc.totalVaginas() > 1) output("s contract");
		else output(" contracts");
		output(" rhythmically");
	}
	//Just a herm
	else if(pc.hasCock() && pc.hasVagina()) {
		output("as your neglected cunt");
		if(pc.totalVaginas() > 1) output("s contract");
		else output(" contracts");
		output(" rhythmically");
		if(pc.isTaur() && pc.wetness(0) >= 3) output(", drooling down your thighs");
		else if(pc.wetness(0) >= 3) output(", soaking the sheets");
	}
	output(". You’re just nearing the edge yourself when Alex starts to shudder and scrabble at your back.");

	output("\n\n<i>“Shit, [pc.name], I’m coming.”</i>  One final buck of his hips sends him over, painting");
	if(pc.cocks[x].cLength() > 18) output(" his chest and the underside of your [pc.cock " + x + "]");
	else output(" both of your chests with sticky white strands");
	output(". His cunt clenches in sympathetic orgasm, wetting ");
	if(pc.isTaur()) output("his girlish thighs and the sheets below him");
	else output("your thighs");
	output(" with femcum as he writhes and pants, trying to catch his breath.");

	if(pc.isAss()) output("\n\nYou point out that you haven’t cum yet, before he has a chance to get too relaxed.");

	output("\n\n<i>“Sorry,”</i>  he says, sounding more than a bit winded. <i>“Couldn’t hold off any longer. Here, let me make it up to you.”</i>  ");
	//taur/’pillar: 
	if(pc.isTaur()) output("Sliding off the bed, he kneels in front of you");
	else output("Sliding back off your lap, he leans forward");
	output(" and takes your still-hard [pc.cockBiggest] in ");
	if(pc.cocks[x].cLength() >= 12) output("both of his hands ");
	else output("his hands ");
	output("and starts to jerk you off. It’s obvious that he’s pretty tired, but he gets to the task with enthusiasm, ");

	//If small cock:
	if(pc.cocks[x].cLength() <= 5.5) {
		output("taking your whole member into his mouth in one smooth movement");
		if(pc.cockTotal() > 1) {
			output(" as he tends to ");
			if(pc.cockTotal() == 2) output("the other");
			else output("the rest");
			output(" with his hands");
			if(pc.cockTotal() > 2) output(", dividing his attentions between your spares as equally as he can manage");
		}
		output(". He hums around it contentedly, tongue skillfully tickling the underside");
		if(pc.balls > 0 && pc.hasVagina())
		{
			output(" while he");
			//3+cocks:
			if(pc.cockTotal() > 2) output(" takes a break from handjobs to cup");
			else output(" cups");
			output(" your [pc.balls] with one hand and toys with the folds of your [pc.vaginas] with the other");
		}
		else if(pc.hasVagina())
		{
			output(" while he");
			//3+cocks:
			if(pc.cockTotal() > 2) output(" takes a break from handjobs to slide");
			else output(" slides");
			output(" a hand up the inside of your thigh and rubs his fingers across the folds of your femsex");
		}
		else if(pc.balls > 0)
		{
			output(" while he ");
			if(pc.cockTotal() > 2) output(" takes a break from handjobs to cup");
			else output(" cups");
			output(" and toy");
			if(pc.cockTotal() <= 2) output("s");
			output(" with your [pc.balls]");
		}
		output(".");
	}
	//If medium cock:
	else if(pc.cocks[x].cLength() <= 10)
	{
		output("taking a deep breath before taking your whole member into his mouth in one smooth movement, flinching a little as your [pc.cockHead " + x + "] bumps against the back of his throat but managing it nonetheless. After a pause to get himself situated he starts to bob his head, swallowing and swirling his tongue to stimulate your whole length");
		//if multicock herm: 
		if(pc.cockTotal() > 1 && pc.hasVagina())
		{
			output(" as he divides his attention between your spare cock");
			if(pc.cockTotal() > 2) output("s");
			output(" and your needy [pc.vaginas], deft hands playing over them like a skilled musician plays his instrument");
		}
		//if multicock:
		else if(pc.cockTotal() > 1)
		{
			output(" as he tends to ");
			if(pc.cockTotal() == 2) output("your other cock");
			else output("the rest of your cocks");
			output(" with his hands");
			if(pc.cockTotal() > 2) output(", dividing his attentions between them as equally as he can manage");
		}
		//if herm:
		else if(pc.hasVagina())
		{
			output(" as he slides a hand up the inside of your thigh and rubs his fingers over the lips of your [pc.vaginas], teasing your [pc.clits]");
		}
		output(".");
	}
	//If big cock:
	else if(pc.cocks[x].cLength() <= 18)
	{
		output("wrapping both of his hands around your shaft and taking your [pc.cockHead " + x + "] into his mouth. It takes him a second to work out how to best pleasure your [pc.cockBiggest]");
		if(pc.hasVagina() || pc.cockTotal() > 1)
		{
			//herm or multicock:
			output(" along with the rest of you");
		}
		output(" with the limited tools available to him, but he manages, ");
		//pure male, 1 cock:
		if(!pc.hasVagina() && pc.cockTotal() == 1) output("fingers tracing over veins and ridges, touching delicate and feather-light one moment and squeezing rhythmically the next while his skillful tongue swirls over your head.");
		else if(!pc.hasVagina()) output("hands darting between your members as he kisses and sucks at the length of each in turn, multitasking skillfully and letting no cock go neglected for too long.");
		else
		{
			output("sparing a hand to toy with your [pc.clits]");
			if(pc.cockTotal() > 1) output("while the other tends to your spare rod");
			if(pc.cockTotal() > 2) output("s");
			output(". His fingers dance over your slick folds");
			if(pc.cockTotal() == 2) output(" and hard cock");
			else if(pc.cockTotal() > 2) output(" and hard cocks");
			output(", teasing and toying while he swirls his tongue and hums around you.");
		}
	}
	//If huge cock:
	else
	{
		output("wrapping both of his hands around your shaft and trailing slow, sucking kisses along the underside of your [pc.cockBiggest] and trailing his tongue in torturously slow circles over your [pc.cockHead " + x + "]. One man pleasuring your impressive length and girth with just his mouth and hands is something of a feat");
		if(pc.cockTotal() > 1 || pc.hasVagina()) output(" by itself");
		output(", but he manages");
		if(pc.cockTotal() > 1 || pc.hasVagina())
		{
			output(", even sparing a moment for your ");
			if(pc.cockTotal() > 2 && pc.hasVagina()) output("spares and your poor, neglected [pc.vaginas]");
			else if(pc.cockTotal() > 2) output("spares");
			else output("poor, neglected [pc.vaginas]");
			output(". His lips and hands are wonderfully soft as he works you over, ");
			if(pc.cockTotal() == 1 && !pc.hasVagina()) output("delivering immense pleasure despite not even being enough to fully wrap around your titanic tool");
			else if(!pc.hasVagina()) output("darting from cock to cock, tracing over veins and pressing insistently at sensitive spots to try to distribute the pleasure evenly");
			else if(pc.cockTotal() == 1) output("fingers rubbing insistently at your [pc.clits] and over your netherlips as he continues to lavish your cock with affection");
			else output("darting from cock to cock and rubbing insistently at your [pc.clits], making sure no part of you goes neglected for too long");
		}
		output(".");
	}
	output("\n\nA few long moments of intensive care under Alex’s near-worshipful mouth and hands are enough to send you over. Finally, you cum, ");
	if(pc.cumQ() <= 25) output("spattering his face with streaks of [pc.cumColor]");
	else if(pc.cumQ() <= 100) output("painting his face a lovely shade of [pc.cumColor] and drenching him thoroughly");
	else output("blasting him with such a torrent of [pc.cum] that he reels backwards");
	if(pc.hasVagina())
	{
		output(" while your [pc.eachVagina] bears down on his fingers");
		if(pc.isSquirter()) output(" and gush femcum");
	}
	output(".");

	output("\n\n<i>“Oh wow,”</i> Alex groans, ");
	if(pc.cumQ() > 25) output("wiping [pc.cum] out of his eyes and ");
	output("collapsing back onto the bed now that his duty is done. <i>“You’re one hell of a fuck, [pc.name]. Shit. Give me a bit to recover - I’m gonna need it. Feel free to use the shower.”</i>");
	output("\n\nYou get yourself cleaned up, retrieve your clothes, and head back to the bar.");
	if(flags["FUCKED_ALEX"] == undefined) flags["FUCKED_ALEX"] = 0;
	flags["FUCKED_ALEX"]++;
	processTime(30+rand(15));
 	pc.orgasm();
 	clearMenu();
 	addButton(0,"Next",mainGameMenu);
}

//[Catch Anal]
//(Fun for everyone)
public function catchAnalFromAlex():void {
	clearOutput();
	alexNameBustDiplay();
	author("RadicalBroseph");
	showBust("ALEX_NUDE");
	//if taur or some kind of caterpillar thing:
	if(pc.isTaur()) output("You straighten up, leaving Alex lying on the bed, then pull a graceful about-face, turning so your [pc.butt] faces him, and glance over your shoulder as you sway your [pc.hips] seductively.");
	//if biped, naga, goo, tripod: 
	else output("You roll over, off of Alex and onto your stomach again, wriggling your hips seductively as you reach back to pull the cheeks of your [pc.butt] apart and put your [pc.asshole] on full display.");

	//If PC has vagina:
	if(pc.hasVagina()) 
	{
		output("\n\nAlex seems a little confused by the gesture, but he stands up and grabs your waist, getting himself into position.");
		output("\n\n<i>“Are you sure?”</i> he asks. <i>“I’ve always thought assplay was, I don’t know, less fun. There’s a reason I saved up for years to get myself a pussy of my own.");
		if(pc.ass.looseness() >= 4) output(" Looks like you’d know better than me from the looks of things, though");
		output(".”</i>  You reassure him that you can absolutely have as much fun with your ass as you can with your cunt, if not more.");
	}
	//If PC male or unsexed:
	else
	{
		output("\n\nAlex grins, standing up and grabbing waist to get himself into position.");
		output("\n\n<i>“Well, alright then,”</i>  he says, reaching down between his legs to gather up a handful of the slick moisture already drenching his thighs at your lewd display. With a practiced hand, he spreads his self-made lubrication over his cock, giving it a few quick strokes before");
		if(pc.buttRating() <= 5) output(" placing his hands on your hips again");
		else output(" spreading your cheeks apart");
		output(" and lining himself up with your entrance.");
	}
	//if tight asshole:
	if(pc.ass.looseness() < 2) 
	{
		output("\n\nYou brace yourself, willing yourself to relax and accept the penetration. Alex’s copious juices ease the process a bit, but thanks to how tight you are it’s still slow and just on the right side of painful. After what feels like an eternity of being stretched around him he finally hilts himself, his balls coming to rest gently against your ");
		if(pc.hasVagina()) output("[pc.vaginas]");
		else if(pc.hasCock()) output("taint");
		else output("featureless crotch");
		output(".");
	}
	//if medium asshole:
	else if(pc.ass.looseness() < 4) 
	{
		output("\n\nYou relax, readying yourself for the coming fuck, and thanks to Alex’s copious juices he’s able to slide in with one swift motion, hilting himself inside of you with his balls slapping against your ");
		if(pc.hasVagina()) output("[pc.vaginas]");
		else if(pc.hasCock()) output("taint");
		else output("featureless crotch");
		output(".");
	}
	//if gaped asshole:
	else
	{
		output("\n\nYou’re more than ready to be filled and let Alex know, slamming your [pc.butt] back against his hips as soon as he gets his head in, your ");
		if(pc.hasVagina()) output("[pc.vaginas]");
		else if(pc.hasCock()) output("taint");
		else output("featureless crotch");
		output(" slapping against his balls. He yelps, doubling over slightly for a moment before recovering.");
	}
	//(ANAL VIRGINITY CHECK)
	pc.buttChange(20,true,true,false);

	output("\n\n<i>“Shit,”</i> he hisses through gritted teeth, clinging to your [pc.hips] as if for dear life. <i>“You’re so ");
	if(pc.ass.looseness() < 2) output("hot and tight");
	else output("hot");
	output(".”</i>  You look back over your shoulder at him and ask if he’s just going to stand there or if he’s going to fuck you. Grunting, he buckles down and gets to moving his hips, slowly at first, but gradually picking up speed at your encouragement. Leaning back into his every thrust, you moan encouragements to him, urging him faster and faster until his hips meet yours again and again at a feverish pace.");

	//If biped/naga/goo/tripod and breasts > B cup:
	if(!pc.isTaur() && pc.biggestTitSize() >= 2) {
		output("\n\nYour breasts ");
		//B-C cup:
		if(pc.biggestTitSize() <= 3) output("bounce freely");
		else if(pc.biggestTitSize() <= 10) output("sway pendulously");
		else if(pc.biggestTitSize() <= 25) output("swing back and forth heavily");
		else output("rest on the mattress");
		output(" beneath you, ");
		if(pc.isLactating()) output("making the sheets wet and sticky with your [pc.milk]");
		else output("adding greatly to the wild ride");
		if(pc.biggestTitSize() > 25) output(" as your [nipples] rub against the bedspread");
		output(".");
	}
	//if tailcock: 
	if(pc.hasCockTail()) output("\n\nAs if roused from its slumber by all this vigorous activity, your [pc.tail] rises to attention, swishing back and forth briefly before snaking around Alex’s hip and plunging deep into his neglected cunt, which only serves to spur him on to greater speeds as he shudders and moans.");

	//if herm: 
	if(pc.hasCock() && pc.hasVagina()) {
		output("\n\nYour mixed sexual juices drip onto the sheets with every thrust as you’re overwhelmed by the dual sensations of Alex’s balls slapping against your [pc.vaginas] and his cock rubbing against your prostate over and over again.");
	}
	//if female:
	else if(pc.hasVagina()) {
		output("\n\nYour juices coat his balls and your thighs ");
		if(pc.wetness() >= 3) output(", dripping onto the sheets with every thrust and you gasp, hardly able to stand it all.");
	}
	//if male:
	else if(pc.hasCock())
	{
		output("\n\nYour cock ");
		if(pc.cumQ() <= 500) output("drips");
		else output("streams");
		output(" pre onto the sheets with every thrust, the pressure on your prostate almost too much to bear.");
	}
	//if unsexed:
	else {
		output("\n\nYour [pc.asshole] clenches and unclenches with every thrust, the sensations coming from your sensitive ring being ");
		if(pc.ass.looseness() <= 2) output("stretched so much");
		else output("fucked so well");
		output(" almost too much to bear.");
	}
	output(" Alex seems to feel the same, his moans growing breathier and his thrusts more uneven as his manicured fingernails dig into your [pc.skin] slightly. Before you know it he’s cumming, thrusting into you with one final, loud slap of skin against skin and emptying his balls into your waiting ass");
	if(pc.hasTailCock()) output(", his cunt drooling and clenching around your [pc.tailCock]");
	else output(", his neglected cunt drenching his thighs");
	output(". The sensation of all that thick, hot hermspunk painting your insides white is enough to send you over, ");
	
	if(pc.hasCock() && pc.hasVagina())
	{
		output("your own [pc.vaginas] spasming wildly");
		if(pc.wetness() >= 3) output(" and adding to the growing pool of pussy juices accumulating around Alex’s knees on the bed");
		output(" while your [pc.cocks] gush [pc.cum] all over the sheets");
		if(pc.cumQ() >= 400) output(" and puddling around your [pc.feet]");
		output(".");
	}
	if(pc.hasVagina()) {
		output("your own [pc.vaginas] spasming wildly");
		if(pc.wetness() >= 3) output(" and adding to the growing pool of pussy juices accumulating around Alex’s knees on the bed");
		output(".");
	}
	//if male:
	else if(pc.hasCock())
	{
		output("your own [pc.cocks] gushing your [pc.cum] all over the sheets");
		if(pc.cumQ() >= 400) output(" and puddling around your [pc.feet]");
		output(".");
	}
	//if unsexed:
	else output("your ass squeezing Alex’s cock like a vice, trying to milk him for every last drop of cum he can give before finally relaxing.");

	output("\n\n<i>“Oh wow,”</i>  he groans, panting as he collapses onto the bed beside you");
	if(pc.hasTailCock()) output(", your [pc.tailCock] finally slipping out of him");
	output(". <i>“You’re one hell of a fuck, [pc.name]. Shit. Give me a bit to recover - I’m gonna need it. Feel free to use the shower.”</i>");

	output("\n\nYou get yourself cleaned up, retrieve your clothes, and head back to the bar.");
	if(flags["FUCKED_ALEX"] == undefined) flags["FUCKED_ALEX"] = 0;
	flags["FUCKED_ALEX"]++;
	processTime(30+rand(15));
 	pc.orgasm();
	pc.loadInAss(getAlexPregContainer());
 	clearMenu();
 	addButton(0,"Next",mainGameMenu);
}
//[Bail Once More]
public function bailOutOnAlex():void {
	clearOutput();
	alexNameBustDiplay();
	userInterface.showName("\nALEX");
	author("RadicalBroseph");
	output("Now that you’re actually here, you’re not so sure you want this anymore. You tell Alex that before he gets his hopes up too high.");
	output("\n\n<i>“Shit, really?”</i>  he asks, looking a little insulted. <i>“Well, I’m not going to force you or anything but man, what a letdown. I’ll see you later, I guess.”</i>");

	output("\n\nYou ");
	if(pc.isAss()) output("shrug dismissively");
	else output("apologize");
	output(", get dressed, and head back to the bar.");
	if(flags["FUCKED_ALEX"] == undefined) flags["LAST_MINUTE_ALEX_BACK_OUT"] = 1;
	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
