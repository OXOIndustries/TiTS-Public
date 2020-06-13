//Brandy by HugsAlright

public function showBrandy(nude:Boolean = false):void
{
	showName("\nBRANDY");
	var nudeS:String = "";
	if(nude) nudeS = "_NUDE";
	showBust("BRANDY" + nudeS);
}

public function brandyCapacity():Number
{
	return 1000;
}

public function brandyAnalCapacity():Number
{
	return 700;
}

//Opening Navigational Text
public function brandyBonusShiiiit():void
{
	if(flags["MET_BRANDY"] == undefined)
	{
		output("You see a building: it’s very old-fashioned looking, made of red brick, and has what appear to be chimneys atop it. You’re able to make out a sign painted light manila just above the door, and in red and blue letters you read “Bailey’s Brewery”. The brewery has a dusty road leading to it, like most of New Texas, barred on both sides by grass that surrounds the alcohol producing plant. It isn’t open to the public, but there’s a stockyard filled haphazardly with barrels next to the factory.");
		output("\n\nIn your peripheral vision you can make out what appears to be a green-haired cowgirl working in the stockyard of the brewery: she’s hammering down the lids of barrels, and she’s looking your way.");
		addButton(0,"Cowgirl",brandyIntroductions,undefined,"Cowgirl","Investigate the curious bovine.");
	}
	//Repeatable Opening Scene
	else
	{
		output("You see a building: it’s very old-fashioned looking, made of red brick, and has what appear to be chimneys atop it. You’re able to make out a sign painted light manila just above the door, and in red and blue letters you read “Bailey’s Brewery”. The brewery has a dusty road leading to it, like most of New Texas, barred on both sides by grass that surrounds the alcohol producing plant. It isn’t open to the public, but there’s a yard filled haphazardly with barrels next to the factory. A hovertruck is parked nearby.");
		//show brandy if she isn't hanging with sally
		if (!isBrandyWithSally())
		{
			output("\n\nThe mute cowgirl, Brandy, is working nearby.");
			addButton(0,"Brandy",brandyRepeatApproaches,undefined,"Brandy","Talk to Brandy.");			
		}
	}
}

//Opening Scene
//[Cowgirl]
public function brandyIntroductions():void
{
	clearOutput();
	showBrandy();
	author("HugsAlright");
	if(silly) author("HugsItsNotAlright");
	output("You turn your gaze towards the curious cowgirl; she’s piqued your interest enough. She notices your change in direction and quickly looks away, returning to whatever it was she was doing before. You swear you hear a faint jingling. You take in her figure for a moment before moving forward; the Treatment certainly did its job: the cowgirl has a womanly hourglass figure with wide hips, and a nice cushy looking bottom. A cow-like tail swings behind her rear hypnotically. As you draw closer it seems she’s aware of your presence; her shoulders begin moving faster as she attempts to finish whatever work she’s doing. You’re definitely hearing a jingling sound now. Stopping in your tracks as you close in on her, you stand behind her for a moment.");
	output("\n\nFrom what you can see she’s working on a barrel, marked “Bailey’s Bovine Brewery”, and under that: “120 Proof”.");
	output("\n\nPowerful stuff.");
	output("\n\nThe cowgirl seems to be avoiding contact with you, hastily working and fidgeting, like she’s hoping you’re not there for her.");
	output("\n\n<i>“Hey,”</i> you finally call out.");
	output("\n\nShe jumps, setting her behind jiggling enticingly. Again, you hear the jingling.");
	output("\n\nShe turns around, revealing a pair of F-cups barely contained by her shirt, a large amount of cleavage on display for passersby like yourself to observe. Her eyes are hidden behind her green bangs. Her currently downward-facing cow-like ears part her hair, which ends in two ponytails on either side of her face. Of course, two adorable horns are perched atop her head.");
	output("\n\nThen you see a cowbell around her neck, and the source of the jingling becomes clear.");
	output("\n\nShe brings a finger to point at her face and her other arm behind her back as if to say <i>“Who, me?”</i>");
	output("\n\nYou give her a confused look.");
	if(pc.isAss()) output("\n\n<i>“Yeah, you.”</i>");
	else if(pc.isMischievous()) output("<i>“Uh, yeah,”</i> you chuckle, <i>“Who else?”</i>");
	else output("<i>“Yeah,”</i> you say calmly, a smile on your face, <i>“You.”</i>");

	output("\n\nShe blushes hotly and begins to feverishly look around, a distressed expression on her face. With a deep breath she puffs out her chest, and finally seems to calm herself. She looks at you and offers a wave with a shy smile; making her bell jingle and breasts wobble.");
	output("\n\nHer silence is more than a bit strange.");
	output("\n\n<i>“Can you talk at all?”</i> you question, ");
	if(pc.isAss()) output("crossing your arms with impatience");
	else if(pc.isMischievous()) output("a hint of laughter still hanging in your voice");
	else output("bringing your tone down to something gentler");
	output(".");

	output("\n\nA frown forms on the cowgirl’s face as she looks down at her feet and shakes her head, bell jingling. She looks back up at you, clear displeasure written across her face, and her posture shifts, making her look fairly uncomfortable.");
	if(pc.isNice() || pc.isMischievous() || pc.isBimbo()) output(" You feel a bit bad for asking, but at least you know now.");
	output("\n\nYou try to change the subject, <i>“Well, uh, do you have a name?”</i> You suddenly find yourself filled with dread, realizing that she probably can’t answer.");
	output("\n\nTo your surprise she nods and leans forward, bringing a hand to up to point at her collar bone. At first you think she’s trying to show you her cleavage, but quickly realize she’s pointing to her bell. You’re barely able to make out something faintly engraved into the cast-iron. You lean in closer to get a better look at what it says, bringing your face mere inches from the valley of her cleavage. You can feel the heat radiating off of her pale boobflesh, making your breath quicken slightly. Pulling yourself from the ever-expansive distraction of her breasts, you look at the bell and see that the engraving reads “Brandy”.");
	output("\n\n<i>“Brandy,”</i> you say aloud, pulling your head back as Brandy straightens herself, her previous somber look replaced by a soft smile. The buxom cowgirl nods in affirmation, happy that you asked. Her posture has grown more relaxed, her hands behind her back. Brandy seems pretty content in the silence.");
	output("\n\n<i>“I saw you looking at me earlier.”</i>");
	output("\n\nA blush quickly returns to the busty bovine’s cheeks, as she looks downwards once more. You can’t help but smile seeing a New Texas girl so shy. ");
	if(pc.isBro() || pc.isMischievous()) output("You decide to follow up, <i>“Well did you see anything you like?”</i> ");
	output("You hold your arms out, inviting her to look you over, and she briefly runs her eyes over you as she raises her head back up. Once she’s completed her inspection, Brandy looks you in the eyes and smiles a bit wider than before. She nods, bell jingling as she does so.");
	output("\n\nYou smile contentedly at the cowgirl and introduce yourself as <i>“[pc.name]”</i>. Maybe now that the ice is broken you can get to know each other a bit better.");
	flags["MET_BRANDY"] = 1;
	processTime(6);
	//increase affection +1
	brandyAffection(1);
	brandyMenu();
}

public function brandyMenu():void
{
	clearMenu();
	//[Appearance] Take a look at Brandy.
	addButton(0,"Appearance",brandyAppearance,undefined,"Appearance","Take a look at Brandy.");
	//[Talk] Have a pretty one-sided conversation.
	addButton(1,"Talk",talkToBrandywhine,undefined,"Talk","Have a pretty one-sided conversation.");
	//[Sex] Maybe the busty bovine is up for some fun.
	if(pc.isTaur()) addDisabledButton(2,"Sex","Sex","This is only possible for non-taurs.");
	else if(pc.lust() >= 33) addButton(2,"Sex",sexWithBrandy,undefined,"Sex","Maybe the busty bovine is up for some fun.");
	else addDisabledButton(2,"Sex","Sex","You aren’t turned on enough for that.");
	//[Exhibitionism] Take advantage of Brandy’s past. //Requires that the “Her Mods” scene be done, and a mischievous or hard personality, not taur or naga compatible.
	if(flags["BRANDY_MODS"] != undefined && !pc.isNice() && !pc.isTaur() && !pc.isNaga()) 
	{
		if(pc.lust() >= 33) addButton(3,"Exhibitionism",brandyExhibitionism,undefined,"Exhibitionism","Take advantage of Brandy’s past.");
		else addDisabledButton(3,"Exhibitionism","Exhibitionism","You aren’t aroused enough for that.");
	}
	else if(flags["BRANDY_MODS"] == undefined) addDisabledButton(3,"Exhibitionism","Exhibitionism","You don’t know enough about her past.");
	else addDisabledButton(3,"Exhibitionism","Exhibitionism","This is only possible for non-taurs and non-nagas who are of the mischievous or hard personality type.");
	//[Taur sex] Maybe Brandy can do something special for someone of your stature. //Requires PC to be a taur. 
	if(pc.isTaur() && pc.hasCock() && pc.cockThatFits(brandyCapacity()) >= 0) 
	{
		if(pc.lust() >= 33) addButton(4,"Taur Sex",taurTimeWithBrandy,undefined,"Taur Sex","Maybe Brandy can do something special for someone of your stature.");
		else addDisabledButton(4,"Taur Sex","Taur Sex","You aren’t aroused enough for that.");
	}
	else addDisabledButton(4,"Taur Sex","Taur Sex","You need to be a tauric creature with a penis that can fit inside Brandy for this.");

	addButton(14,"Leave",mainGameMenu);
}

//Repeatable intro
//[Brandy] //Requires the first opening scene to have been completed once.
public function brandyRepeatApproaches():void
{
	clearOutput();
	showBrandy();
	author("HugsAlright");
	if (silly) author("HugsItsNotAlright");
	
	//check affection level for intro
	var aff:int = brandyAffection();
	
	if (aff >= 100)
	{
		output("The steady jingle of Brandy’s bell gets louder and louder as you approach her, watching the cowgirl toil away at her work, mallet in hand, carefully inspecting each barrel her gaze meets. That is, until, you finally reach the girl, standing right behind her as you wait for her to notice you.");
		output("\n\nAfter some time passes, you decide to take the initiative and tap on Brandy’s shoulder, which makes her gasp silently and jump, and has the added effect of causing all her round, squishy bits to jiggle along with her bell. When the cowgirl turns around to see who it is, her face lights up, turning red with a big grin to match at the sight of your [pc.face].");
		output("\n\nAlmost immediately after she realizes who’s come to visit her, she wraps her arms around your back");
		
		if (pc.tallness > 72) output(", pulling you down into a nice, warm, booby-filled hug");
		else output(", scooping you up into a nice, warm hug, your face buried in her expansive chest");
		
		output(" as she moos and moos with an ecstatic tone.");
		
		if(pc.isAss()) output("\n\nYou roll your eyes but”</i>");
		else output("\n\nYou smile and");	
		
		output(" return Brandy’s embrace, leaving her to ride out her wave of excitement until she finally releases you from her grasp, letting you");
		
		if (pc.tallness > 72) output(" loose");
		else output(" fall");
		
		output(" from her svelte, girly arms with a big smile still on her face.");
		
		output("\n\n<i>“Moo, moo!”</i> the blushing cowgirl exclaims, clasping her hands together and eagerly awaiting any word from you.");
	}
	else if (aff >= 50 && aff < 100)
	{
		output("As you approach the quiet cowgirl, you notice one of her ears twitches at the sound of your");
		if (pc.isNaga()) output(" [pc.legs] sliding through gravel and dirt");
		else output(" [pc.footOrFeet] stepping against gravel and dust");
		
		output(", to which she quickly turns around. Her bell jingles and her face brightens with blush and happiness at the sight of your return. Finally closing in on her, Brandy raises a hand to wave at you and gives you an ecstatic, if somewhat quiet, <i>“Moo!”</i>");
	}
	else
	{
		output("You begin to [pc.walk] towards Brandy; the jingling of her bell grows ever louder as you close in, her tail swaying as she toils away at her work. She notices you eventually, looking over her shoulder once and doing a double take when she realizes who it is. The cowgirl turns around and offers a shy smile and a wave.");
	}
	//clear Brandy hug flag for gaining affection
	flags["BRANDY_AFFECT_HUG"] = 0;
	brandyMenu();
}

//Appearance
//[Appearance]
public function brandyAppearance():void
{
	clearOutput();
	showBrandy();
	author("HugsAlright");
	if(silly) author("HugsItsNotAlright");
	output("Brandy stands about 5\' 11\". Her hair is a minty green, parted by two bovine ears and ending in ponytails on either side of her face, her bangs hanging down in front of her eyes. Two small horns protrude from her head. Despite the bright, warm New Texas sun, Brandy’s skin has a fair complexion, bordering on pale, with a light smattering of freckles dotting her flesh.");
	output("\n\nOf course, that jingling cast-iron cowbell engraved with her name is wrapped around her neck.");
	output("\n\nHer body looks like what you’ve come to expect of New Texas women. Her shapely legs lead up to a nice cushy bottom that looks oh so soft and squeezable; a bovine tail swings behind her. A normal human pussy is sitting between her legs. Her body has a distinct hourglass figure, like most New Texan gals. Her F-cups, which look nice and soft and are topped with wide pink nipples, are barely being contained by her shirt; in fact they seem to be spilling out a bit.");
	output("\n\nOverall, Brandy is a beautiful girl.");
	//Other options from earlier should still be on the screen at this point, “Appearance” should be greyed out.

	brandyMenu();
	addDisabledButton(0,"Appearance","Appearance","You’re doing this right now.");
}

//“Talk”
public function talkToBrandywhine():void
{
	clearOutput();
	showBrandy();
	author("HugsAlright");
	if(silly) author("HugsItsNotAlright");
	output("What would you like to talk to her about?");
	//[Disability] Ask Brandy why she can’t speak.
	addButton(0,"Disability",brandyDisabilityTalk,undefined,"Disability","Ask Brandy why she can’t speak.");
	//[New Texas] Ask Brandy what she thinks of New Texas.
	addButton(1,"New Texas",newTexasBrandyTalk,undefined,"New Texas","Ask Brandy what she thinks of New Texas.");
	//[Herself] Learn a bit about the cowgirl.
	addButton(2,"Herself",talkToBrandyAboutHerself,undefined,"Herself","Learn a bit about the cowgirl.");
	//[Her Mods] Ask Brandy about her lactation mods. //Requires the [Suckle] scene to have been completed once.
	if(flags["SUCKLED_BRANDY"] != undefined || pc.hasKeyItem("Brandy's Letter")) addButton(3,"Her Mods",askBrandyAboutHerMods,undefined,"Her Mods","Ask Brandy about her lactation mods.");
	else addDisabledButton(3,"Her Mods","Her Mods","You have no idea if she’s even modded!");
	
	//[Hug] No words, only hugs.
	addButton(4, "Hug", hugBrandy, undefined, "Hug", "No words, only hugs.");
	
	//[Letter] talk about the letter she wrote you if you haven't already
	if (pc.hasKeyItem("Brandy's Letter") && flags["BRANDY_RELATIONSHIP"] == undefined) addButton(5, "Letter", brandyLetterTalk, undefined, "Letter", "Talk to Brandy about the contents of that letter she sent you.");
	
	//[Return]
	//Return should take the PC back to Brandy’s main menu, when an option is chosen all other talk options should be available, with the current chosen option greyed out.
	addButton(14,"Back",backToBrandyMain);
}
public function backToBrandyMain():void
{
	clearOutput();
	showBrandy();
	output("You still have Brandy’s attention. Is there anything else you would like to do?");
	brandyMenu();
}

//Disability
//[Disability]
public function brandyDisabilityTalk():void
{
	clearOutput();
	showBrandy();
	author("HugsAlright");
	if (silly) author("HugsItsNotAlright");
	
	//if have brandy letter, have different convo
	if (pc.hasKeyItem("Brandy's Letter"))
	{
		output("Now that you know how Brandy’s muteness came about, you decide to ask her if she can do anything about or if there’s a cure.");
		output("\n\nThe cowgirl only frowns down at her feet and shakes her head slowly, obviously distraught at that fact. Well, looks like the Treatment and her aforementioned medication mixed together must have had a more adverse side effect than you thought.");
		
		//if pc not an ass
		if (!pc.isAss()) output("\n\nAll the same, you smile at your melancholy cow-friend before bringing her into a surprise hug, which makes her jump with surprise at first before she quickly settles down and returns your embrace, throwing her arms around your back. You hold her for a short while, comforting the mute moo until she pulls back to reveal that her once sad look has been replaced with a soft smile. Brandy gives you a quiet, thankful moo as she parts from your hug.");
		
		//if a couple
		if (flags["BRANDY_RELATIONSHIP"] == 2) output("\n\nWell, verbal communication may still be a problem with Brandy, but at least she has someone like you now.");
	}
	else
	{
		output("<i>“So you can’t talk at all?”</i> you ask.");
		output("\n\nBrandy gazes at you, an uncomfortable look on her face. She scans the area around her, back and forth to make sure no one’s watching, then turns back to you when she’s made sure the coast is clear. Brandy licks her lips, purses them, and out comes a soft, shy voice fit for a girl like her.");
		output("\n\n<i>“M-moo.”</i>");
		output("\n\nWell that’s just adorable.");
		//pcMisch/Hard:
		if(pc.isMischievous() || pc.isAss()) output("\n\nYou have to summon all your willpower in order to suppress a chuckle trying to force it’s way out your lungs.");
		output("\n\n<i>“So how did you end up not being able to talk?”</i> you inquire.");
		output("\n\nBrandy sets her gaze on you, and holds out her arm, then taking her other hand, she brings it just above the inside of her elbow. The quiet queenie mimics the action of pressing down the plunger of a syringe into her arm.");
		output("\n\n<i>“The Treatment?”</i>");
		output("\n\nBrandy nods, but before you can draw any conclusions she holds out her other arm and makes the same gesture.");
		output("\n\nYou cock an eyebrow, <i>“The Treatment, and something else?”</i>");
		output("\n\nShe nods again, looking a bit sad at the fact.");
		output("\n\nYou follow up, <i>“So something else like another mod?”</i>");
		output("\n\nBrandy nods, bell jingling away somberly as she looks down at her feet. With your curiosity piqued you feel the need to dig a bit deeper, but it looks like this choice of topic is making your bovine friend fairly uncomfortable, making you reconsider. Instead, you place a comforting hand on her shoulder, causing her to jump with surprise and look up at you before thanking her for being open with you.");
		output("\n\nShe nods and smiles.");
		output("\n\nMaybe you could ask Brandy again once she’s gotten more comfortable with you.");
	}

	processTime(10);
	addDisabledButton(0, "Disability", "Disability", "You already spoke about this.");
	//increase affection +1
	brandyAffection(1);
}

//New Texas
//[New Texas]
public function newTexasBrandyTalk():void
{
	clearOutput();
	showBrandy();
	author("HugsAlright");
	if(silly) author("HugsItsNotAlright");
	output("<i>“So what do you think of New Texas?”</i>");
	output("\n\nBrandy holds out her hand and forms a thumbs-up, but wobbles it around more than a fair bit, trying to convey some form of discontent.");

	//pcBimbo/Bro:
	if(pc.isBro() || pc.isBimbo()) output("\n\nWhat? How could <i>anyone</i> not like this place?");
	else output("\n\nYou find that pretty understandable, given her circumstances.");

	//reahaCrew:
	if(reahaIsCrew()) output("\n\nLooks like Reaha isn’t the only woman disenfranchised with New Texas and The Treatment. You briefly wonder if the two of them would get along before focusing on the cowgirl before you once more.");
	processTime(3);
	addDisabledButton(1, "New Texas", "New Texas", "You already spoke about this.");
	//increase affection +1
	brandyAffection(1);
}

//Herself
//[Herself]
public function talkToBrandyAboutHerself():void
{
	clearOutput();
	showBrandy();
	author("HugsAlright");
	if(silly) author("HugsItsNotAlright");
	output("<i>“Well, what about you?”</i> you ask.");
	output("\n\nBrandy looks confused, raising an eyebrow cloaked in bangs and pointing to herself.");
	output("\n\n<i>“Yeah, you know, what you do and what you like. I’m interested.”</i>");
	output("\n\nThe cowgirl smiles at you and begins to look around, tapping a finger on her chin as she tries to find something that can give you some clue about her, bell ringing as she turns. Eventually her eyes come to rest upon the sign of the brewery. Turning back to you, she begins pointing at the sign, then at the barrels.");
	output("\n\n<i>“So you work here, right?”</i> Brandy nods, smile still on her face. <i>“And you do... something with the barrels?”</i>");
	output("\n\nBrandy holds her hand out flat and wiggles it, trying to communicate something along the lines of <i>“eh, close enough.”</i> The cowgirl continues to inspect her surroundings until it’s clear she gets an idea of something she can convey to you. She puts her palms together and holds them at a 90 degree angle and lets her head rest on them.");
	output("\n\n<i>“You like sleep.”</i> She nods again, bell jingling away.");
	output("\n\nShe continues, looking around for something she could use to convey a message. You fear there might not be much more she could tell you with her disability, but Brandy brings her eyes back to you, shy smile on her face, and points to you.");
	output("\n\n<i>“And you like me?”</i>");
	output("\n\nBrandy nods.");
	output("\n\nYou crack a smile at that.");
	processTime(11);
	addDisabledButton(2, "Herself", "Herself", "You already spoke about this.");
	//increase affection +1
	brandyAffection(1);
}

//Her mods
//[Her mods]
public function askBrandyAboutHerMods():void
{
	clearOutput();
	showBrandy();
	author("HugsAlright");
	if(silly) author("HugsItsNotAlright");
	//pcHard:
	if(pc.isAss()) output("<i>“So,”</i> you begin, <i>“What’s the deal with the alcoholic milk?”</i>");
	//pcMisch:
	else if(pc.isMischievous()) output("You eye up the expansive chest of the cowgirl before you for a moment, <i>“So, how’d you get to lactate brandy like that?”</i>");
	//Else:
	else output("Smiling at your bovine friend, you ask her if she happened to take any mods that have any effect on her lactation.");

	output("\n\nBrandy looks around for a moment, and turns to the barrels she’s working on, she waves her hand to beckon you closer. You get closer to the barrel, your mute friend is pointing at the company logo plastered on it.");
	output("\n\nYou follow up, <i>“The brewery gave it to you?”</i>");
	output("\n\nBrandy nods.");
	output("\n\n<i>“Why?”</i> you question.");
	output("\n\nShe turns her gaze to you for a moment, then begins looking around, taking a few steps in different directions, trying to get a better view of something. She begins pointing towards posters, billboards, and signs. Her bell rings and jingles as she juts her arm out to point. You think about what she’s trying to convey, and it quickly becomes obvious.");
	output("\n\n<i>“You were an advertisement?”</i> you say, a quizzical look forming on your face.");
	output("\n\nBrandy nods again, bell ringing in your ears.");
	output("\n\n<i>“So, uh, what kind of advertising did you do exactly?”</i>");
	output("\n\nBrandy still looks a bit blue, but leads you over to a nearby wall of the brewery. The red brick is covered with posters, all seemingly placed at random, as if put there by an apathetic Terran band promoter hanging up flyers. Drawing in a little closer to the posters, you notice they’re all the same. Each one features a huge-breasted cowgirl with what appears to be alcohol leaking from her tits. The text on the poster reads like a tabloid article, buzzwords all over, but one thing easily stands out from the rest: <i>“Straight from the tap!”</i>");
	output("\n\nNow it’s abundantly clear what Brandy was: free samples.");
	output("\n\nYou can’t decide if that’s sad or hot");
	if(pc.isBimbo()) output(", probably hot");
	output(". ");
	if(silly) output("You depraved bastard. ");
	output("Regardless, you can’t help but realize Brandy isn’t exactly center stage in the brewery, and open your mouth to speak again, <i>“But you don’t do that anymore, right?”</i>");

	output("\n\nThe cowgirl shakes her head, making her green ponytails bob and sway before she brings herself to a halt and moves over to pat her dainty hand on one of the barrels she was working on before you got there.");
	output("\n\n<i>“So, you work out here now?”</i> you ask, turning a few different directions and kicking up a bit of dust from the stockyard as you do so.");
	output("\n\nBrandy smiles and picks up her mallet again, nodding her head in affirmation.");
	output("\n\nSeems like mute moo enjoys her new job out here in the yard a bit more than boob-whoring as free-samples in the factory. Maybe she likes the quiet.");
	flags["BRANDY_MODS"] = 1;
	processTime(12);
	addDisabledButton(3, "Her Mods", "Her Mods", "You already spoke about this.");
	//increase affection +1
	brandyAffection(1);
}

//This scene will unlock the Exhibitionism scene
//Hug
//[Hug]
public function hugBrandy():void
{
	clearOutput();
	showBrandy();
	author("HugsAlright");
	if(silly) author("HugsItsNotAlright");
	output("You take a few strides forward towards the surprisingly shy cowgirl, a nervous look forming on her face as you close in on her. She has no idea what awaits her. Without warning, you spring forward and wrap your arms around her back, her F-cups pressing into you as you pull the cowgirl close. Brandy jumps and lets out a silent gasp at first, but quickly realizes what’s happening, then she just melts in your grasp. She throws her arms around you and holds you tight, her eyes closed as she takes in your warmth. You stay that way for a while, both of you happy to be in each other’s embrace, a feeling of happiness flowing through you.");
	output("\n\nSadly, that hug comes to an end eventually. You pull back and see Brandy smiling, her face beet-red.");
	processTime(3);
	addDisabledButton(4, "Hugs", "Hugs", "You already spoke about this.");

	if (flags["BRANDY_AFFECT_HUG"] == 0)
	{
		//increase affection +6
		brandyAffection(6);
		//set hug affection flag so the affection gain is limited to once per visit (reset in brandyRepeatApproaches)
		flags["BRANDY_AFFECT_HUG"] = 1;
	}
}

//Sex Scenes
//[Sex]
public function sexWithBrandy():void
{
	clearOutput();
	showBrandy();
	author("HugsAlright");
	if (silly) author("HugsItsNotAlright");
	
	//check affection level
	var aff:int = brandyAffection();
	
	if (aff >= 50)
	{
		output("You look Brandy up and down.");
		output("\n\n<i>“So,”</i> you say, taking a few strides closer to her and putting on your most seductive voice, <i>“Want to get out of here and have a little fun?”</i>");
		output("\n\n\Brandy knows what she wants and hastily nods and bites her lip, practically shaking with nervous excitement as you grab at the rim of her shirt.");
		output("\n\n<i>“So, where should we go?”</i> you ask, <i>“Your place again?”</i>");
		output("\n\nBrandy gives your an affirming moo, grabbing your hand and holding it tight. She begins to walk, leading you to wherever it is she wants to go. Eventually, you reach her house: a nice looking building with yellow walls. She opens the door and extends her free arm, inviting you in with a hesitant smile. Your hand is still in hers as she leads you through the home. The familiar house looks cozy and warm with hand-knitted quilts and blankets lining her furniture. Finally, you reach your destination: Brandy’s bedroom.");
		output("\n\nBrandy releases your hand, and rubs the back of her neck, trying to avert her gaze from you.");
		output("\n\n<i>“M-moo?”</i>");
		output("\n\nSmiling at her, you reach for the cowgirl’s hands and grab hold of them. Brandy looks into your eyes, blushing fiercely, and all you can do is lean in and kiss the girl. She’s a bit tense at first, but slowly succumbs to her lust and begins to return your kissing with force, your mouths opening to accept each other’s tongues. Brandy moos softly as you bring her closer to the bed, managing to sit the two of you down on the downy mattress. Soon after, you feel Brandy’s hand slips from yours and move toward your wrist, gently grabbing at your arm. She guides your hand across her thigh, fingers trailing along her smooth thighs and right between her legs. The cowgirl holds your digits there, and you’re quick to get the idea, smiling and digging your fingers into her still-clothed crotch. Brandy quivers and whimpers needily under the weight of your touch, obviously up for more than just some rubbing...");
	}
	else
	{
		output("You look the nervous cowgirl up and down, and you like what you see. Given her interest in you, and the fact that she IS a cowgirl, you don’t find it too far-fetched an idea that the two of you could have a bit of fun together.");
		output("\n\n<i>“So,”</i> you say, taking a few strides closer to her and putting on your most seductive voice, <i>“Want to get out of here and have a little fun?”</i>");
		output("\n\nBrandy seems like she doesn’t know how to respond; she stands there a moment, visibly shaking and sweating. You bite your lower lip and smile at her, grabbing at the rim of her shirt before the cowgirl comes back to reality with a nod.");
		output("\n\n<i>“So, where should we go?”</i> you ask, <i>“I’ve got a ship we cou-”</i>");
		output("\n\n<i>“Moo!”</i> Brandy interrupts.");
		output("\n\nYou look at her and she grabs your hand, holding it tight. She begins to walk, leading you to wherever it is she wants to go. Eventually you reach a building: a nice looking house with yellow walls. You assume it’s Brandy’s place. She opens the door and extends her free arm, inviting you in with a hesitant smile. Your hand is still in hers as she leads you through the house. The place looks overwhelmingly cozy, with soft looking blankets and quilts atop cushy furniture - and is that a fireplace you see in one room? Finally, you reach a room with a bed up against the wall, and you figure this must be your destination.");
		output("\n\nBrandy releases your hand, and rubs the back of her neck, trying to avert her gaze from you.");
		output("\n\n<i>“M-moo?”</i>");
		output("\n\nSmiling at her, you reach for the cowgirl’s hands and grab hold of them. Brandy looks into your eyes, blushing fiercely, and all you can do is lean in and kiss the girl. She’s a bit tense at first, but slowly succumbs to her lust and begins to return your kissing with force, your mouths opening to accept each other’s tongues. Brandy moos softly as you bring her closer to the bed, managing to sit the two of you down on the downy mattress.");
	}

	processTime(13);
	clearMenu();
	//[Suckle] Suckle them Cow titterinos.
	if(pc.isNaga())
	{
		addDisabledButton(0,"Suckle","Suckle","This is only possible for non-taurs.");
		addDisabledButton(1,"Moosionary","Moosionary","This is only possible for non-taurs.");
		addDisabledButton(2, "Titfuck", "Titfuck", "This is only possible for non-taurs.");
		if (aff >= 50)
		{			
			addDisabledButton(4,"Vaginal","Vaginal","This is only possible for non-taurs.");
			addDisabledButton(5,"M.Fingering","M.Fingering","This is only possible for non-taurs.");
		}
	}
	else
	{
		addButton(0,"Suckle",suckleDatMooTit,undefined,"Suckle","Suckle them Cow titterinos.");
		if(pc.hasCock() && pc.cockThatFits(brandyAnalCapacity()) >= 0)
		{
			//[Moosionary] //Requires PC to have a Cock.
			addButton(1, "Moosionary", moosionaryWithBrandy, undefined, "Moosionary", "Do it in the old fashioned way.");
		}
		else 
		{
			addDisabledButton(1,"Moosionary","Moosionary","You need a penis that fits inside Brandy for this.");
		}
		if(pc.hasCock()) addButton(2,"Titfuck",tittyFuckMissMooCow,undefined,"Titfuck","Have a little cleavage-humping fun.");
		else addDisabledButton(2, "Titfuck", "Titfuck", "You need a penis that fits inside Brandy for this.");
		
		if (aff >= 50)
		{			
			//[Vaginal] //Requires PC to have a cock and 50+ affection with her
			if(pc.hasCock() && pc.cockThatFits(brandyCapacity()) >= 0) addButton(4, "Vaginal", brandyVaginal, undefined, "Vaginal", "Fuck Brandy’s pussy like it was meant to be!");
			else addDisabledButton(4,"Vaginal","Vaginal","You need a penis that fits inside Brandy for this.");
			//[M.Fingering] //requires vagina and 50+ affection with her
			if (pc.hasVagina()) addButton(5, "M.Fingering", brandyMutualFingering, undefined, "M.Fingering", "Engage in some mutual fingering with the cowgirl.");
			else addDisabledButton(5,"M.Fingering","M.Fingering","You need a vagina to do this with Brandy.");
		}
	}
	//[Cuddle] Give the cowgirl something unexpected.
	addButton(3, "Cuddle", cuddleWithBrandy, undefined, "Cuddle", "Give the cowgirl something unexpected.");
	
	//[Return]
	addButton(14,"Back",backToBrandyMain);
	//Return should take the PC to Brandy’s main menu again.
	//After a sex scene is done the [Next] option should dump the PC outside of customs.
	//Exhibitionism isn’t part of this menu, just listed under sex scenes in the doc.
	//These comments apply to the “Taur sex” options.
	//None of these are taur compatible, only cuddle is naga compatible
}

//Suckle
//[Suckle]
public function suckleDatMooTit():void
{
	clearOutput();
	showBrandy(true);
	author("HugsAlright");
	if(silly) author("HugsItsNotAlright");
	output("Nudging her slightly, you gently put the girl on her back before climbing atop the toppled cowgirl and straddling her midsection. Brandy looks up at you, her breath ragged. You smile back down at her and cup her cheek, rubbing a thumb across her smooth skin. Leaning down you bring your [pc.lipsChaste] to hers one last time before you begin trailing kisses down her neck and to her collar bone; stopping to plant a long peck atop her breasts.");
	output("\n\nBrandy squirms a bit under you as you straighten yourself. You look down at your bovine lover and flash her a lustful grin before setting your gaze on her expansive chest. Wasting no time, you get your hands all over those lush, pale pillows, reaching down and grasping at Brandy’s big, soft breasts.");
	output("\n\nShe tenses, letting out a long <i>“M-mooooooooo!”</i> in a pleasured tone.");
	output("\n\nShe likes that, doesn’t she?");
	output("\n\nYou put your hands to work kneading and squeezing her tits, the wanton grin on your face growing ever larger, gazing into your lover’s eyes. A chorus of lust-filled moos erupts from the busty bovine as your hands play along her still-clothed tits, pert nipples stiffening underneath her shirt. You figure you should do something about that whole “clothes” thing. Bringing your hands back from her breasts, you resist the urge to put them right back where they were, the sudden absence of your grip on her tits causing Brandy to let out a little whimper of a moo.");
	output("\n\nYou grab the cowgirl’s shirt and pull it down just enough so her nipples pop free of their confines, licking your lips at the sight of her pink teats. Then you lean down, your [pc.butt] up in the air, a predatory look on your face, chin resting in the valley of her cleavage. Taking your finger and thumb to one of her big, supple nipples, you begin to tug and tweak it, and the stimulating sound of Brandy’s mooing once again fills the room. You take pleasure in watching her squirm in your grasp, mooing with each tweak, tug, and pinch of her stiff pink teats.");
	output("\n\nEventually you feel a trickle of liquid on one of your hands. Taking your gaze off Brandy, you move it to her breasts, only to notice a reddish-brown liquid flowing from her nipples. You’re fairly certain it isn’t milk of any kind, but there’s only one way to find out. You look your lover in the eyes again, letting your [pc.tongue] loll out of your mouth and bringing it to the bottom of her breast where the trail of lactation ends. You continue toying with her other nipple as you lick your way up Brandy’s tit, soaking your tongue in her nectars as you go, making sure not to miss a drop as you flick your tongue across her nipple.");
	output("\n\nYou straighten yourself and let the flavor of Brandy’s lactation play across your tongue: it’s potent, sweet, almost floral, more than a bit fruity, and definitely alcoholic.");

	//firstTime:
	if(flags["SUCKLED_BRANDY"] == undefined)
	{
		output("\n\nThe taste of brandy is the first thing to come to mind. Your thoughts wander for a moment, wondering if Brandy got her name before or after the gene mods. Shaking that quandary from your head, you look back up, only to see the cowslut in question smiling at you as you learn her flavor.");
	}
	output("\n\nWhatever it is coming out of her tits, you want more. Pulling Brandy’s shirt down all the way, you let her breast spill out into your hands; you squeeze them gently, eliciting a soft moo from their owner, beads of alcoholic nectar forming on her nipples. You bring your head back down to her stiff nipple, letting your tongue draw circles around it.");
	output("\n\nBrandy whimpers, <i>“m-m-m-mooOOooo.”</i>");
	output("\n\nYou decide you’ve teased the poor cowgirl enough and close your [pc.lips] around her stiff teat. The New Texas girl moos and brings her hands to your head, letting her fingers run through your [pc.hair] as you suckle on her face-filling tits. She tries to contain her pleasure only to release torrents of pleasured moos, one after the other. You let her sweet bounty flow down your throat, barely able to pull yourself off of one nipple with a wet “pop” and moving your mouth to the other to continue suckling.");
	output("\n\nYou’re not sure how long you’ve been sucking on Brandy’s tits, but eventually the thought crosses your mind that you might be drinking in a bit too much. However, you can’t seem to make yourself care enough to stop. So, your suckling continues until your legs begin to wobble and your arms feel weak, causing you to finally pull your mouth off Brandy’s stiff teats. She seems spent, her mooing quiet and tired. You try to talk to the exhausted broad, but what comes out of your mouth is slurred and barely recognizable as Terran. Losing your balance, your head falls into the valley of Brandy’s cleavage, leaving you sprawled out across her body.");
	output("\n\nYour vision begins to fade as you feel arms wrap around your shoulders, and before you pass out you faintly hear: <i>“Moo?”</i>");
	output("\n\n<b>Later...</b>");
	output("\n\nSome time passes before you wake up. Your head is pounding, but you’re surrounded by a familiar warmth. You manage to summon the strength to move your head. Casting your gaze upwards you see Brandy looking down at you, her arms still wrapped around you. You nuzzle your head back into her jugs, but you know it’s only a matter of time before you have to get up and continue your journey.");
	processTime(35);
	//increase affection +5
	brandyAffection(5);
	pc.milkInMouth();
	IncrementFlag("SUCKLED_BRANDY");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Next]
//M-m-m-moossionary
//[Moosionary]
public function moosionaryWithBrandy():void
{
	clearOutput();
	showBrandy(true);
	author("HugsAlright");
	if(silly) author("HugsItsNotAlright");
	var x:int = pc.cockThatFits(brandyAnalCapacity());
	if (x < 0) x = pc.smallestCockIndex();
	
	//get affection level
	var aff:int = brandyAffection();
	
	output("As your tongues explore each other’s mouths, you begin to move your [pc.hands] across Brandy’s smooth, pale skin, so warm to the touch. You make your way up from her shapely thighs, groping at her cushy lower cheeks, squeezing and kneading her plush bottom in your hands, making the cowgirl moo lewdly into your mouth. You don’t let up: you move your hands up to her waist, rubbing your hands up and down her curves until you reach the swell of her F-cups. You smile lustfully as the kissing continues while your hands reach up to the busty bovine’s breasts and squeeze.");
	output("\n\nBrandy breaks the kiss, leaving a trail of saliva between your [pc.lips] and hers. She lets out a long, loud <i>“Moooooooo!”</i> as you squeeze at her massive jugs.");
	output("\n\nYou take your hands off of the cowgirl’s breasts and reach for the buttons of her shirt: the only thing holding back a wave of bovine boobage. After undoing the buttons as fast as your lust-addled mind will allow, you pull the girl’s shirt open. Brandy’s breasts spill out, jiggling enticingly as they come to rest in your palms. Moving quickly, you get your hands all over her perky pink nipples, tugging on her teats until they stiffen completely, then tweaking and pinching at them. Brandy moos and moos, louder and louder, needier and needier as you play with her breasts.");
	output("\n\nIt all becomes too much for the lusty bovine; she falls back onto the bed, and you’re quick to follow her down. You take a break from the cowgirl’s breasts, letting her catch her breath as you move down to her thighs, running your hand up and down the inside of them. Eventually, you bring your hand to rest near her pussy and begin rubbing the side of your digits up and down the crotch of the girl’s pants, her breathing growing faster and faster.");
	output("\n\nBrandy lets out a series of whimpering moos, barely recovered from your previous boob-assault.");
	output("\n\n<i>“M-MOOOoooo!”</i>");
	output("\n\nMusic to your ears.\n\n");

	if(!pc.isCrotchExposed())
	{
		output("A feeling of discomfort overtakes your body as your stiffening [pc.cockNoun " + x + "] strains against your clothes. Pulling your hands back, you hastily begin to remove your [pc.crotchCovers]. Brandy catches her breath as you do so. She smiles at you and blushes, clearly enjoying the show. Taking notice of her gaze, you smile right back at her, the last of your clothes coming off. ");
	}
	output("You move back and straddle her knees before you grab at the cowgirl’s shorts. She’s happy to assist you as you pull them down, wiggling and kicking her legs to get the pesky legwear off.");
	output("\n\nYou remove the clothing barring the way to your goal, and soon find your gaze set upon Brandy’s pink pussy, glistening with fem-lube. At this point your [pc.cock " + x + "] is already hard as diamond");
	if(pc.hasKnot(x)) output(", and your knot is already inflated and ready to lodge itself inside your lover’s cunt");
	output(".");
	output("\n\nGetting down on all fours, you bring yourself close to Brandy, looking her in the eye, lust written upon your face, her hot breath hitting your cheeks. Her legs spread, knees coming up to your [pc.hips] before they wrap around your [pc.thighs]. You look down and line up your [pc.cock " + x + "] with her pink slit.");
	
	//skip this if affection is 50+
	if (aff < 50)
	{
		output("\n\nThen Brandy reaches down, and covers her sex.");
		output("\n\nYou look back up at her: she’s shaking her head, an apologetic look on her face.");
		//firstTime:
		if(flags["BRANDY_MISSIONARY"] == undefined)
		{
			output("\n\nWait, you have to stop and process this for a moment: a New Texas cow gal, saving herself? You shoot her a clearly confused look, and she shrugs her shoulders in response. You feel a little disappointed, maybe a little frustrated. She could’ve given you a warning in the form of bell ringing, or something.");
		}
		//Else:
		else output("\n\nWell, looks like it’s time to make use of the cowgirl’s <i>other</i> fun-holes again.");
		output("\n\nYour attention returns towards the matter at hand, though.");
		output("\n\nYou give your bovine lover a grin, <i>“Well I guess we’ll just have to make do with what we’ve got.”</i>");
		output("\n\nBrandy blushes and smiles at that.");
		output("\n\nShe moves her hands, once again allowing you to gaze upon her pink slit. ");
	}
	else output("\n\n");
	
	output("You place the underside of your [pc.cock " + x + "] against the lube-leaking hole and begin to roll your hips, rubbing your tool up and down her cunt. Brandy shudders and moos softly as you wet your [pc.cock " + x + "] with her fluids. You keep going until you get your [pc.cock " + x + "] nice and lubed up for the cowgirl, finally pulling back only to see your lover red-faced and biting her lip. You look down and line your cock up with Brandy’s pucker, pressing your [pc.cockHead " + x + "] into it, applying a little pressure and letting off. The soon-to-be buttslut moos softly as your cockhead presses into her dark star. You push harder, and harder, but she seems a bit tense, whining little moos making their way past her lips with each attempted thrust. You reach your hand up to the cowgirl’s cheek, cupping it; she brings her gaze to meet yours.");
	pc.cockChange();
	output("\n\n<i>“Just relax, Brandy,”</i> you say calmly to your lover, trying to reassure her.");
	output("\n\nShe nods, letting herself go limp, her muscles relaxing as she brings her hands down, grabbing at your [pc.butt]. You push your hips forward, and the resistance you felt before seems dissipated. As your [pc.cock " + x + "] slowly pushes into her, a <i>“MooooOOOOOOO!”</i> of pleasure and pain fills the air, your glans meeting her pucker. You continue your slow thrust into Brandy’s ass, her hands grabbing at your [pc.butt], trying to guide you into her. Her inner walls squeeze at your [pc.cock " + x + "], each inch you shove inside her making your mind cry out in pleasure, and you can’t help but let out a few lewd groans as your cock makes its way inside your lover’s ass. The chorus of Brandy’s pleasured moos echos in your ears as ");
	if(pc.hasKnot(x)) output("your knot reaches the cowgirl’s stretching asshole.");
	else output("your dick finally bottoms out inside her cushy bottom.");

	output("\n\nYou give Brandy a minute to adjust to the cock lodged inside her. She moos softly and wiggles under you. Hardly able to resist the urge to do so, you lean down and kiss the squirming cowgirl briefly before bringing yourself back up. She blushes fiercely in return as you both take in the pleasure of a moment’s silence.");
	output("\n\n<i>“Think it’d be okay if I start moving?”</i> you ask.");
	output("\n\nBrandy nods hurriedly, her breathing fast and ragged. With a smile you begin to pull your cock back out of her ass, slowly, at first, trying to cherish every moment as the girl’s sodden hole squeezes at your dick, your tool dispensing a few globs of warm pre on its way out. The busty bovine moos loudly as she feels your heat on her inner walls. Your [pc.cock " + x + "] finishes its exit from the cowgirl’s ass as your glans reaches her pucker.");
	output("\n\nAgain you take a moment, feeling the heat radiating off your lover’s body as you catch your breath. You start to thrust back in, faster than the first time, Brandy’s mouth forming an “o” as she lets out another long, pleasured moo and arches her back. The cowgirl’s sounds of approval encourage you to pick up the pace; you begin to roll your hips faster and faster, [pc.cock " + x + "] sliding in and out of Brandy’s pucker.");
	output("\n\nBrandy’s grip on your ass tightens as your speed picks up, your breath quickening as you feel your body straining to keep up with your rampant cow-lust. You watch the cowgirl’s massive tits quake with every thrust, every movement of your hips drawing a short moo of pleasure out of your lover. Her mooing and jiggling jugs push you further, making you move faster, groaning as your hips hammer into the lusty bovine’s soft bottom, setting it quaking each time your [pc.hips] meet hers.");
	output("\n\nYour mind is all but gone by the time you hear a long, drawn out <i>“M-mooooooooooOOOOOOOO!”</i> from Brandy. You feel her asshole clench around your cock and her muscles spasm as her orgasm ensues, and it isn’t long after that you feel yourself reach your edge.");
	//has Knot:
	if(pc.hasKnot(x)) 
	{
		output("\n\nYou thrust forward, your knot stretching your lover’s pucker as she lets out a surprised moo before your [pc.knot " + x + "] finally slips inside, expanding ever larger as your orgasm begins. Accompanied by a cry of pleasure, your [pc.cock " + x + "] begins to spasm, [pc.cum] spilling out into Brandy’s bowels as you jackhammer her ass, breeder’s knob lodged inside her. She just moos and moos as your hot [pc.cumNoun] fills her ");
		if(pc.cumQ() >= 2000) output(", her belly distending as you liberally pump her full of your [pc.cum]");
		output(".");
		output("\n\nShe moves her hands off your ass to your head, and pulls your face into her warm breasts, and slowly but surely, you begin to wind down from your orgasm, moaning into Brandy’s tits. You pull your head up from your bovine lover’s chest pillows as your climax passes: she’s smiling down at you, her legs unwrapping from around your thighs and coming to rest akimbo.");
		output("\n\nYou both know you’re going to be stuck here a while, Brandy offering a single soft <i>“moo~”</i> as she wraps her arms around you, holding you tight. You smile contentedly and place your head back into her cleavage, intent on enjoying the warmth of your new favorite pair of pillows as you sleep off your knot.");
	}
	//noKnot:
	else
	{
		output("\n\nYou thrust forward, burying your dick in your lover’s ass. With a cry of pleasure, your [pc.cock " + x + "] begins to spasm, [pc.cum] spilling out into Brandy’s bowels as you jackhammer her ass. She just moos and moos as your hot cum fills her");
		if(pc.cumQ() >= 2000) output(", her belly distending as you liberally pump her full of your [pc.cum]");
		output(".");
		output("\n\nShe moves her hands off your ass to your head, and pulls your face into her breasts. Slowly, you begin to wind down from your orgasm, moaning into Brandy’s tits. You pull your head up from your bovine lover’s chest pillows as your climax passes. She’s smiling down at you, her legs unwrapping from around your thighs and coming to rest akimbo.");
		output("\n\nYou pick yourself up and straighten yourself, and reluctantly begin to pull your [pc.cock " + x + "] out from Brandy’s ass, she moos quietly as you do so. Your cock finishes its exodus, leaving the spent cowslut’s pucker with a wet squelch, still-warm cum spilling out onto the covers of your lover’s bed.");
		output("\n\nYou bring yourself back down into Brandy’s jugs, content to sleep away the afterglow of your orgasm on your new favorite pair of pillows. She wraps her arms around you, offering a single soft <i>“moo~”</i>. It won’t be long before you have to focus on moving upwind again.");
	}
	processTime(20);
	//increase affection +5
	brandyAffection(5);
	pc.orgasm();
	clearMenu();
	if (pc.hasKnot(x))
	{
		addButton(0,"Next",knottyMoosionary, x);
	}
	else
	{
		processTime(30);
		IncrementFlag("BRANDY_MISSIONARY");
		addButton(0,"Next",mainGameMenu);
	}
	
}

public function knottyMoosionary(x:int):void
{
	clearOutput();
	showBrandy(true);
	author("HugsAlright");
	if(silly) author("HugsItsNotAlright");
	output("Waking up from your nap, you feel hands rubbing across your back. Looking up, you see Brandy, as you’d expect. She smiles and blushes, nodding her head slightly to get you to look down, only to realize your soft cock is still inside her, and going against all the feelings trying to keep you in your spot, you pick yourself up and straighten yourself. With some reluctance you pull your flaccid [pc.cockNoun " + x + "] out of the Brandy’s nice, soft bottom, causing a wet squelch as you do so.");
	if(pc.cumQ() >= 1000) output(" A seemingly endless amount of [pc.cum] spills out onto the sheets from Brandy’s gaped hole.");
	output("\n\nYou look to Brandy, a wide smile on her face; it seems she enjoyed herself. Unfortunately, you have to focus on your journey, and get yourself ready to keep moving.");
	processTime(30);
	IncrementFlag("BRANDY_MISSIONARY");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Titfuck]
public function tittyFuckMissMooCow():void
{
	clearOutput();
	showBrandy(true);
	author("HugsAlright");
	if(silly) author("HugsItsNotAlright");
	var x:int = pc.biggestCockIndex();
	output("As the kissing continues, your hands begin to make their way towards Brandy’s shirt, eager to reach the contents held within the cowgirl’s clothes. You begin to undo the buttons that are barely able to contain Brandy’s chest, only to stop halfway down her shirt in order to cup one of her massive tits and squeeze, your other hand joining soon after. Your bovine lover moos into your mouth as your hands work her breasts with seemingly a mind of their own. You barely manage to pull your hands away from her lush pillows and return to undoing buttons.");
	output("\n\nYour fingers are trembling by the time you reach the last clasp of her garment. Breaking the kiss, you pull your head back to see Brandy, her chest heaving as her breathing picks up; looks like she’s as eager to get this shirt off as you are. The busty bovine reaches her hands down to yours as you undo the last button, mooing softly as her breasts spill out of their confines. You watch them jiggle and come to a rest before getting your hands on them again. Bringing yourself closer to Brandy, you press your [pc.lips] to hers again, pushing yourself into her. The warmth of her soft boobflesh takes you away for a moment, making you forget about the worries plaguing your journey, if only just for a moment.");
	output("\n\nYou’re pulled back to the real world all too soon by ");
	if(!pc.isCrotchExposed()) output("the erection straining against your gear");
	else output("your throbbing erection");
	output(". You push Brandy down onto her back almost viciously.");

	output("\n\n<i>“M-moo?!”</i> She cries out as she lands on the mattress.");
	output("\n\nYou’re quick to get on top of the cowgirl and straddle her waist, ");
	if(!pc.isCrotchExposed()) output("and even quicker to begin removing your clothes. Brandy watches wide-eyed as you strip yourself on top of her and drop your pants. She seems impressed, blushing hotly as your [pc.cock " + x + "] brushes against her bare breasts.");
	else output("the bovine broad blushing hotly as your [pc.cock " + x + "] brushes against her bare breasts.");
	output(" You look down at her and smile, pulling yourself back a bit to line your cock up with Brandy’s cleavage. She gets the idea and brings her hands to the sides of her breasts and pushes them together.");
	output("\n\nYou begin to slide your [pc.hips] forward, ever-so carefully edging your [pc.cock " + x + "] into the valley of Brandy’s cleavage. You groan in pleasure as your tool makes it’s way between the cowgirl’s tits, the first few drops of your pre already spilling out onto her collarbone by the time your [pc.cock " + x + "] reaches the other side of Brandy’s cleavage.");
	output("\n\nThe big-breasted bovine looks up at you, an unsure look on her face. Then she cranes her neck forward and hesitatingly begins to lick up the [pc.cum] leaking from the head of your pre-dripping shaft. You shiver as her tongue wets your cockhead, bringing your gaze down to meet hers before giving her an appreciative smile and reaching a hand down to stroke her cheek with your thumb.");
	output("\n\nYou lean back, your hands resting on Brandy’s shapely thighs as you begin to slowly rock your [pc.hips] back and forth, dragging your cock back and forth between the valley of your lover’s tits. Her breast are soft and warm, and the way she’s holding them together makes them an almost perfect sheath for your [pc.cock " + x + "]. You groan loudly as your cock is caressed by the walls of Brandy’s boobflesh, pleasure and heat radiatiating through your body, clouding your mind in a haze of lust.");
	output("\n\nWithout warning, you lean forward and bring your hands to rest atop Brandy’s tits. The cowgirl lets out a surprised <i>“Moo!”</i> as you grasp at her tits, squeezing and kneading to your heart’s content. The cowgirl starts to moo loudly; she’s at the mercy of your hands. You pick up the pace, ");
	if(pc.balls > 0) output("[pc.balls] slapping into the bottom of Brandy’s chest with each thrust,");
	else output("hips slamming into the bottom of Brandy’s breasts with each thrust,");
	output(" her massive jugs quaking and jiggling enticingly with every move of your [pc.hips].");

	output("\n\nYou continue your rampant assault on Fort Boob as your hands happily toy with Brandy’s fun-bags, her moos driving you to move faster and faster. You’re panting at this point, your mind reduced to nothing but a rampant lust for cowgirl tits, quickly finding yourself close to your edge. With a feral grunt you thrust your [pc.cock " + x + "] between the lusty bovine’s full orbs one last time, groaning as your cock begins to spasm and giving her breasts a rough squeeze, drawing out a particularly loud <i>“MooooOOOOO!”</i> from your lust-addled lover. Your tool begins to empty its load all over poor Brandy’s face and collarbone. She lets out a surprised moo as the first spurt of hot liquid hits her chin, making her wince and close her eyes as you finish all over her face.");
	output("\n\nPanting heavily, you look down at Brandy’s cum-covered face and give yourself a few moments to take in your handiwork before falling backwards, letting yourself come to rest on her legs. You crane your neck forward, trying to look at your lover, but the cowgirl’s face is invisible behind her own tits, but thankfully, she lets out a satisfied little moo, letting you know you did a good job.");
	output("\n\nAt this point you’re content to let yourself lie down like this and rest before you start moving again, and you bet Brandy is too.");

	processTime(22);
	//increase affection +5
	brandyAffection(5);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Exhibitionism, I honestly feel bad doing this to poor Brandy.
//[Exhibitionism] //Not part of the actual sex menu.
public function brandyExhibitionism():void
{
	clearOutput();
	showBrandy(true);
	author("HugsAlright");
	if (silly) author("HugsItsNotAlright");
	
	//get affection level
	var aff:int = brandyAffection();
	
	//use standard scene if exibition less than 100
	if (aff < 100)
	{
		output("A devious look forms on your face as you look over the busty cowgirl, and she blushes hotly as your [pc.eyes] look her up and down. You saunter around the girl, but she keeps her gaze locked forward, gulping as you make your way behind her. Your eyes land upon Brandy’s gropeable-looking ass. You don’t even hesitate and grab her cushy cheeks, causing the bovine girl to suck in a silent gasp, managing to suppress a half-formed moo. She tenses and clenches her fist, looking over her shoulder at you, a worried look on her face.");
		output("\n\n<i>“It must’ve been nice,”</i> you whisper.");
		output("\n\nBringing your hands off the girl’s ass, you slowly bring them up her hips and waist as she squirms.");
		output("\n\n<i>“Your old job, I mean.”</i>");
		output("\n\nYou slide your hands up to the swell of Brandy’s tits, taking your time reaching around her front.");
		output("\n\n<i>“Getting fucked and sucked dry by strangers all day, must’ve been a dream for a little cowslut like you.”</i>");
		output("\n\nWith that last comment you pounce, squeezing the aforementioned cowslut’s massive breasts, kneading them in your diligent hands. Brandy does her best to keep quiet but ultimately fails, letting a whining little moo slip past her defenses. Her legs quiver as she begins to slip into your arms.");
		output("\n\n<i>“You like this, don’t you?”</i> you say, continuing to toy with Brandy’s soft tits.");
		output("\n\nBrandy nods vigorously, her bell jingling.");
		output("\n\n<i>“Reminds you of all the fun you had at your old job, doesn’t it?”</i>");
		output("\n\nShe nods again, letting out another quiet, needy moo.");
		output("\n\nYou smile and reach up to the rim of her shirt, boob already spilling out, and yank, Brandy’s shirt coming all the way down, and her breast falling out into your hands. The bovine girl moos a bit louder as her cushiony pillows are freed from their cloth-confines. You bounce the squirming cowgirl’s tits up and down in your hands, feeling the heft of the brandy-filled fun bags, before you move your grasp upwards and start tugging at the exposed brandy-cow’s already stiffening nipples. She lets out another whimpering moo, louder than the last. You squeeze Brandy’s tits and tug her nipples until her sweet nectars begin to trickle down from her breasts.");
		output("\n\nBrandy releases another long, needy <i>“Moooooooo!”</i>");
		output("\n\nShe begins to lose her balance under the weight of your mammary-focused ministrations, so you slowly bring the girl down to the ground. While still sitting up, you bring her head to rest on your [pc.chest] as she settles down onto her back, bare tits pointing skyward. You rub her brandy-smeared tits, coating your fingers in her delicious liquids before drawing your fingers to your mouth you lick them clean, letting her flavor roll around your mouth.");
		output("\n\n<i>“I can see why you got the job,”</i> you whisper into her bovine ear.");
		output("\n\nYou continue to focus on her tits, kneading the soft, warm orbs. Although you’re in the open, no one seems to be around... yet. You tug and twist Brandy’s pink teats, and she moos all the louder until, reaching down, the cowgirl grabs at her shorts and starts pushing them off, kicking her legs as she tries to remove them. She brings her legs up high and manages to rid herself of her lower garmnets, her sex exposed to the open. The busty, lusty bovine broad quickly reaches down and begins to rub her pink clit.");
		output("\n\n<i>“MoooOOOooOOO!”</i> she cries out loudly as she pleasures herself.");
		output("\n\nBrandy’s moos get louder, and they seem to be drawing attention: from around the corner of the brewery comes another cowgirl, wearing a shirt bearing the same logo as the barrels your currently-occupied lover usually works on.");
		output("\n\n<i>“Just what is going o- oh!”</i> She says as she clears the corner, only to see a naked cowgirl resting atop you.");
		output("\n\nYou pay no mind and keep focusing on Brandy’s tits, smiling as she rubs her own fingers along her pink slit. Not long after the new cowgirl arrives, a crowd follows her. They seem to be tourists on a tour of the brewery, and you figure that bovine woman must be the guide. The crowd is mainly made up of Terrans, but all of them are watching the scene unfold with great attention. Brandy looks up, and she’s mortified at the sight of the crowd, having to use all her strength to suppress her moos.");
		output("\n\nYou eye the crowd for a moment before leaning down, bringing your [pc.lips] close to Brandy’s cow-like ear.");
		output("\n\n<i>“C’mon Brandy, why don’t you sing for the crowd?”</i> you whisper.");
		output("\n\nYou give her leaking tits a nice firm squeeze.");
		output("\n\n<i>“M-moooo.”</i>");
		output("\n\n<i>“Aww, I know you can do better than that.”</i>");
		output("\n\nReaching your [pc.hands] up to her perky pink teats, you give them a little tug and pinch, rolling them between your finger and thumb.");
		output("\n\nShe loses her control at that: <i>“M-moooOOOooo!”</i>");
		output("\n\n<i>“Good girl,”</i> you whisper.");
		output("\n\nBrandy blushes deeper than you’ve ever seen.");
		output("\n\nYou kiss and nibble at Brandy’s ear as she continues to trace her fingers up and down her pussy. It isn’t much longer before the lusty bovine’s fingers delve into her own sodden box. She starts out slow, letting out a series long, soft moos as she fingers herself.");
		output("\n\nYou smile at the sight of your lover pleasuring herself.");
		output("\n\nAt this point most of the crowd has taken out various recording devices and have begun capturing video and taking pictures of you and Brandy, and the other cowgirl seems to be rubbing her own crotch.");
		output("\n\nBrandy begins to speed up; it seems like she’s intent on bringing herself to orgasm, despite the crowd. She moos louder and louder as her vigorous fingering increases in pace while you’re still toying with her breasts, eliciting little quivering moos from her, her breathing hastened. It isn’t long before Brandy releases an ear-pleasing moo that announces her orgasm.");
		output("\n\n<i>“MooooooooooOOOOOOOOOO!”</i>");
		output("\n\nThe little cowslut’s back arches as her pussy clenches down around her fingers, letting out a series of quivering moos as her climax continues, her hips bucking up into the air. Girlcum spills out onto her inner thighs and soaks the ground beneath her until Brandy comes down from her peak, breathing heavily, eyes closed as she brings her head to rest on your [pc.chest]. You kiss the exhausted cowgirl on the top of her head and rub your hands along her girly arms.");
		output("\n\n<i>“Good girl,”</i> you whisper again.");
		output("\n\nWith a smile you look up at the crowd, specifically the tour guide who suddenly stops her own impending public masturbation session.");
		output("\n\n<i>“Well, uh,”</i> she calls out, turning around to face the crowd, <i>“let’s leave the stockyard and continue our tour, shall we?”</i>");
		output("\n\nAnd with that, the crowd leaves you and Brandy, who’s currently fast asleep in your arms, brandy-leaking tits still bared to the open. You just hope she’ll be in a good mood when she wakes up.");
		processTime(22);
		//decrease affection -10
		brandyAffection(-10);
		pc.changeLust(10);
		pc.exhibitionism(2);
	}
	else
	{
		output("With a sly grin on your face, you saunter your way closer to Brandy, pressing yourself into her and grabbing at the hem of her shirt. ");
		output("\n\n<i>“So,”</i> you say, putting on your most seductive voice, <i>“Want to get out of here and have a little fun?”</i>");
		output("\n\nBrandy knows what she wants and hastily nods and bites her lip, practically shaking with nervous excitement as your grap at the rim of her shirt.");
		output("\n\nThe cowgirl goes to grab your hand, probably intending on leading you back to her place, but you’ve got other plans.");
		output("\n\n<i>“We don’t have to go </i>all<i> the way back to your house, do we?”</i> you ask, <i>“I don’t think I could wait that long, can’t we just stay here?”</i>");
		output("\n\nBrandy shivers nervously in her spot, <i>“M-moo?”</i>");
		output("\n\nYou grin at her apprehensive response and go to take hold of one of her hands, <i>“Yeah, c’mon, I’m sure we can find somewhere nice and quiet.”</i>");
		output("\n\nAnd with that, you’re leading Brandy off, who still seems a bit nervous and reluctant as you walk her through the stockyard. Eventually, you come across a nice, tall wall of barrels stacked on a few pallets that should provide adequate cover from prying eyes.");
		output("\n\n<i>“How’s this?”</i> you ask your anxious lover.");
		output("\n\nBrandy smiles and blushes, putting herself up against the wall of barrels and looking around to make sure the coast is clear before giving you a nod an affirming, <i>“M-moo”</i> while she rubs at the back of her neck.");
		output("\n\nSmiling at her acceptance of this exhibitionistic venture, you get low onto the ground behind some barrels and beckon Brandy to join you. With a chuckling moo, the cowgirl joins you on the stockyard turf, smiling and blushing. You lean her back against the stack of barrels and gently lean into her, pressing your lips to hers.");
		output("\n\nAny previous nervousness or apprehension Brandy may have been harboring vanishes as your kiss her, simply melting the cowgirl in your embrace. You slip your hands up to her breasts, giving those full orbs a gentle squeeze, resulting in a little moo from your lover before your fingers reach the buttons of her shirt. Grinning between kisses, you slowly undo Brandy’s clothing, moving from button to button until her top is straining to keep her liquor-filled tits contained. Her hands are over yours by the time you reach the last clasp keeping her chest confined, working with yours to undo it. Finally, the cowgirl’s tits come free with a contented moo from their owner as they come jiggling to a halt... right into your hands.");
		output("\n\nBefore you can do anything else with that bountiful bosom, though, Brandy moos quietly into your mouth and starts wiggling her hips. It’s only then you realize the needy New Texan is working her shorts off, pushing them down as fast she can until they’re at her knees. Breaking the kiss for a moment, you move your hands to help your lover get her clothes all the way off, tossing the denim garments aside.");
		output("\n\nAnd there’s it is: all of Brandy. You sit there on your knees for a moment, admiring the cowgirl’s bare form as she sits there and blushes with your [pc.eyes] working over her body. Instead of returning to your kiss, though, you bring your hands down to your lover’s bare breasts, making her silent breath stutter when your fingers brush against her sensitive flesh. You give her sinfully-soft tits a gentle squeeze that coaxes a little pleasured moo from the cowgirl. Kneading and fondling her chest for a moment, enjoying Brandy’s satisfied moos, you start to move your hands upward until your fingers are pinching at her big pink nipples. You tug and tweak at her teats until they’re stiff and beads of her golden-brown nectar are dripping from her peaks.");
		output("\n\nSmiling at the sight of her alcoholic bounty, you bend over and place your lips to her hard nipple, letting your [pc.tongue] loll from your mouth and flick across it, gathering up Brandy’s brandy as your [pc.lipsChaste] close around her teat. The cowgirl shudders as you take in her flavor and start to suckle and squeeze her tits, leaning back further into the stack of barrels. At the same time, you sink a free hand down between her thighs, causing Brandy to practically melt under you with a quiet, needy moo. You don’t waste any time and quickly sink a pair of digits between her already-soaked folds, spreading her lower lips and spilling her feminine fluids onto the ground. Louder, moaning moos fill the air as you draw your fingers in and out of the cowgirl’s leaking slit while you suckle on her stiff nipples, switching between breasts until the brandy doesn’t stop flowing down your throat.");
		output("\n\nIt goes on like that for a while, with Brandy mooing pleasurably as she gets wetter and wetter you get drunker and drunker off her delicious, fruity bounty.");
		output("\n\nThen you hear it, over the New Texan’s quiet, blissful noises: footsteps on gravel.");
		output("\n\nIt looks like your lover hears it too, because her breath catches as the sound draws closer, but you don’t stop.");
		output("\n\n<i>“Hey, Brandy?!”</i> a voice calls out from around the corner, <i>“You out here?!”</i>");
		output("\n\nThe cowgirl’s eyes widen as her name is called, biting down on her lip to prevent another bunch of moos from forcing their way out.");
		output("\n\nYou can see someone walk behind the wall of barrels out the corner of your eye: it’s a bull, wearing a shirt bearing the brewery’s logo. He jumps slightly when he catches you two in the act, but seems slightly relieved that he found his co-worker.");
		output("\n\nStill, you don’t stop, and keep suckling and fingering your lover right there on the ground for this random bull to see.");
		output("\n\n<i>“Whoa, hey there, don’t mean to interrupt,”</i> the New Texan begins to explain, <i>“But, uh, Brandy, the boss wants you to check that last batch of the 14-Special again, something about some lady finding a varmint in her whiskey or something... I dunno, boss said she needs you to look at it, though.”</i>");
		output("\n\nBrandy, with a beet-red face and a few barely-suppressed moos, turns to her co-worker and manages to give him a hurried nod.");
		output("\n\n<i>“Alright then,”</i> he continues, <i>“Just needed to relay that... I’ll just uh, get out of you two’s way then.”</i>");
		output("\n\nAnd with that, the cow-guy points a pair of finger-guns and awkwardly shuffles off, leaving you and Brandy alone again. ");
		output("\n\nAfter that, Brandy seems to simply let go, unable to hold in her pleasured moos any longer or stave off her orgasm. She lets out a single, long, blissful <i>“MoooooOOOOOO!”</i> as her whole body tenses under you, back arching. With all that alcohol moving through your system, you can just feel the cowgirl’s pussy clench down around you fingers, her innerwalls spasming and gushing girlcum out onto the ground and your open hand. She writhes in pleasure on the ground for quite some time before finally coming down from her peak, after having expelled what seems like gallons of girlcum all over the turf beneath you.");
		output("\n\nYou finally pull yourself from one of Brandy’s stiff nipples, slightly-reddened from your suckling, licking your lips of the last of her delicious bounty. Looking down through a lust-and-alcohol-hazed mind, you see your spent lover smiling and blushing with her expansive bust heaving, looking just about ready for a nap.");
		output("\n\nSuddenly feeling quite tired yourself, probably due to the all the breast-booze in your blood, you grin down at Brandy, managing to slur out <i>“Shee, that washn’t so bald...”</i> before collapsing on top of her.");
		output("\n\nAnd there you rest atop your naked lover, drunk and happy, ready to sleep off your stooper while Brandy rest with her afterglow on the soft grass of the stockyard before you both have to get back to work.");
		output("\n\nHopefully no one else comes to interrupt the two of you...");
		processTime(45);
		pc.changeLust(10);
		pc.exhibitionism(2);
		pc.milkInMouth();
	}
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Cuddle]
public function cuddleWithBrandy():void
{
	clearOutput();
	showBrandy();
	author("HugsAlright");
	if(silly) author("HugsItsNotAlright");
	output("As you and Brandy kiss, a feeling of warmth washes over your body, and you wrap your [pc.arms] around the lusty New Texan. You hold her close, letting her F-cups press into you. The bovine-beauty moos softly as her breasts strain against you, and she’s quick to follow your actions and brings her arms around your back. The hugging continues as your tongues explore each other’s mouths, a very special type of ecstasy running through your veins.");
	output("\n\nBefore too long, you pull yourself and the cowgirl down to the bed, still in each other’s arms. Time passes, and you eventually break the kiss to look at Brandy, feeling nothing but satisfaction as you gaze into her veiled eyes. You smile softly at her and rub your hands along her back. The brandy-cow smiles and blushes in your arms.");
	output("\n\nWith a little shimmy you move yourself downward in her grasp, getting yourself low enough to where all you can see is Brandy’s ever expansive chest, and bury your face in her cleavage. You don’t really do anything beyond that; you just lay there, feeling the warmth of the shy New Texan’s soft boobflesh as it caresses your cheeks.");
	output("\n\n<i>“Moo?”</i> questions Brandy, clearly confused.");
	output("\n\nYou manage to pull your head from their warm pillows, and look up at the cowgirl.");
	output("\n\n<i>“Shhhhh,”</i> is all you have to give her in response.");
	output("\n\nYour shushing gets muffled towards the end of your response as you bring your face back to the valley of Brandy’s cleavage. You can feel her adjust herself a bit as she settles in. She gets the idea: you pull your face from her breasts one last agonizing time, and look up to see her smiling, eyes closed as her hands play deftly across your back. You return your head to your lover’s lush chest pillows");
	if(pc.legCount != 1) output(", your [pc.legs] intertwining with Brandy’s as you both finally settle in.");
	else output(". You wrap your [pc.leg] around Brandy’s legs, making her squirm uncomfortably at first as your [pc.leg] embraces her, but she quickly settles in.");
	output("\n\nOf all the cowsluts on all the planets of all the galaxies, you’ve managed to find the one who’s content to simply cuddle, and what a lucky find it is.");
	output("\n\nBrandy lets out a quiet, happy moo as she holds you close. You feel your eyelids getting heavy, and you’re just too damn cozy in this cowgirl’s arms to resist the call of sleep. You let yourself slip into unconsciousness, head resting on the best pair of pillows on New Texas. You’ll definitely be ready for whatever is to come next in your travels after a nap like this, though, you’re not sure you’ll want to leave when you wake up.");
	//Recover energy and add one hour to clock.
	pc.energy(100);
	processTime(60);
	//increase affection +6
	brandyAffection(6);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Taur time
//[Taur sex]
public function taurTimeWithBrandy():void
{
	clearOutput();
	showBrandy();
	author("HugsAlright");
	if(silly) author("HugsItsNotAlright");
	output("You look the nervous cowgirl up and down, and you like what you see. Given her interest in you, and the fact that she IS a cowgirl, you don’t find it too far-fetched an idea that the two of you could have a bit of fun together.");
	output("\n\n<i>“So,”</i> you say, taking a few strides closer to her, putting on your most seductive voice, <i>“Want to get out of here and have a little fun?”</i>");
	output("\n\nShe seems like she doesn’t know how to respond; she just stands there, visibly shaking and sweating. You bite your lower lip and smile at her, grabbing at the rim of her shirt. Brandy comes back to reality with a nod.");
	output("\n\nHer nervous acceptance makes you smile, <i>“Know of any places that could accommodate people of my, uh, body type?”</i> you ask, drawing emphasis to your large, tauric lower body. Brandy pauses for a moment. She puts a dainty finger to her chin before letting out a sharp, quick <i>“Moo!”</i> and grabbing you by the hand, keeping a surprisingly firm grip on it as she leads you to wherever it is she’s going.");
	output("\n\nEventually you reach the Milk Barn, and you figure this must be where she’s taking you. Brandy leads you inside, the unmistakable smell of sex wafting into your nostrils as you walk through the barn before you come to an empty stall and your bovine guide finally releases your hand. She looks downward and blushes, rubbing the back of her neck and extending her other arm nervously, inviting you into the stall.");
	output("\n\n<i>“M-moo?”</i>");

	processTime(10);
	pc.changeLust(5);
	clearMenu();
	//[Miscreant Manor] You think you know a better spot where you could get this done. //Requires the PC to have been to miscreant manor. Requires cock.
	if(flags["MISCREANT_MANORED"] != undefined) addButton(0,"M. Manor",takeBrandyToMiscreantManor,undefined,"Miscreant Manor","You think you know a better spot where you could get this done.");
	else addDisabledButton(0,"M. Manor","Miscreant Manor","You need to have used Miscreant Manor for this.");
	//[The stall] Take the hint and use the breeding stall. //Requires cock.
	addButton(1,"The Stall",takeBrandyToAStallDate,undefined,"The Stall","Take the hint and use the breeding stall.");
	//[Return]
}

//The Stall
//[The stall]
public function takeBrandyToAStallDate():void
{
	generateMapForLocation("STALL EAST");
	
	clearOutput();
	showBrandy(true);
	author("HugsAlright");
	if(silly) author("HugsItsNotAlright");
	var x:int = pc.cockThatFits(brandyCapacity());
	if(x < 0) x = pc.smallestCockIndex();
	output("You take the hint and saunter into the stall, your long lower half trailing behind you, and a trembling Brandy not far behind that. You watch her pass in front of you and stop to look up at you. Looking down you give the girl a sly smile before you reach downward and cup her cheek, trying to calm her a bit before straightening your upper half.");
	output("\n\n<i>“So,”</i> you say, ");
	if(!pc.isCrotchExposed()) output("starting to remove your [pc.gear] ");
	output("<i>“How do you want to start this?”</i>");

	output("\n\n");
	if(!pc.isCrotchExposed() && !pc.isChestExposed()) output("You lose your final piece of clothing, tossing it to the side of the stall. ");
	output("Brandy is quivering as she gazes at your bare, tauric form, her blush deepening as she rubs her hands together nervously. The girl looks down at your half-hard cock and gulps before looking up at you again. She brings herself out of her trance and turns around, walking towards the brace of the stall that you figure can only be there for one purpose. Brandy shimmies out of her shorts, giving you a nice view of her plush ass before she takes the garment off and tosses it aside; she looks over her shoulder at you and cracks a nervous smile as she bends over, placing herself on the brace and gripping it tightly, her F-cups pressing into it as she settles in.");
	output("\n\nYou decide to take in the view for a moment, watching as Brandy spreads her legs just a little bit more, probably hoping to accommodate your length. Her cushy looking ass is a pleasing view, and it causes you to unconsciously take a few steps forward before leaning down and grabbing at it. The girl lets out a surprised little moo as you knead her ass in your grip. As you let your hands do their thing your gaze is drawn to Brandy’s lube-leaking pink slit, and you bring a hand off her ass to trace a finger up the girl’s pussy from clit to taint.");
	output("\n\nBrandy quivers, <i>“M-m-moooo.”</i>");
	output("\n\nYou bring your now fluid-covered finger up to your mouth as your lover gazes over her shoulder at you. You give the busty bovine a good view of your lusty mien as you lick your digit clean, taking in the taste of her arousal. Giving Brandy’s ass a tender slap, her head darts forward, looking straight ahead again as she winces, sucking in a silent gasp.");
	output("\n\nWith another couple steps forward you get ready to mount the horny cowgirl, bringing your front [pc.legs] around her shoulders. Brandy trembles as you close in on her, continuing your path forward until your [pc.cockHead " + x + "] brushes the folds of your lover’s sex, causing her to emit little whimpering moos. You smile at the sound of her pleasure and without any further hesitation, you unceremoniously slip your [pc.cockHead " + x + "] into her pink slit.");
	output("\n\n<i>“Moooooooo!”</i> Brandy cries.");

	//firstTime:
	if(flags["BRANDY_STALLED"] == undefined)
	{
		output("\n\nYou can feel her shaking beneath you, leading you to believe that this might be her first time with a taur of any kind.");
	}
	if(pc.isNice()) output("\n\n<i>“Don’t worry Brandy,”</i> you coo, trying to reassure her <i>“I’ll be gentle.”</i>");
	else output("\n\n<i>“Hope you’re ready, Brandy,”</i> you whisper with a smirk, your voice at a near-devious tone.");

	output("\n\nShe seems to steady a bit at the sound of your voice, giving you a good opportunity to continue your penetration. You begin to push into the cowgirl, slowly and steadily, her breathing picking up in speed. She begins to moo as your shaft makes its way inside her, each inch of [pc.cock " + x + "] you shove inside her makes her mooing louder and louder. You’re as far as you can get into the cowgirl when you come to a halt, the walls of Brandy’s love canal hugging your [pc.cock " + x + "] oh-so warmly, sending heat and pleasure radiating through your body.");
	pc.cockChange();
	output("\n\nBrandy is panting now, her grip on the brace loosened. It almost feels like she’d collapse if it weren’t for the cock inside her. The first few drops of your pre empty into the cowgirl’s sodden slit, the sudden heat causing her to let out a whimper of a moo. You begin to pull out of the girl, moving as slowly as you did putting it in, making her emit soft little moos as her cunt empties.");
	output("\n\nYou’re at the point when your cock is at risk of falling out of Brandy when a devious grin forms on your face, and you push your hips forward with lighting-fast speed, thrusting your [pc.cock " + x + "] back into her with one good stroke. Brandy cries out a long <i>“MOOOOOOOO!”</i> of pleasure and surprise as she’s suddenly filled with cock again. You’re pretty sure you’ve left the poor girl close to her edge with that: she’s panting and mooing needily, begging for more.");
	output("\n\nYou begin to move your [pc.hips], bringing your [pc.cock " + x + "] in and out of Brandy’s pussy, each thrust forward setting her bountiful behind jiggling. The cowgirl shifts under you, trying to pick herself up as you vigorously pound her pussy, but each thrust inward makes her collapse onto the brace, mooing and panting as [pc.cock " + x + "] is thrust in and out of her. All you can do is groan as your cock is massaged by Brandy’s warm, slick cunt, keeping your pace as the busty bovine’s mooing drives you onward.");
	output("\n\nBrandy seems to be lost to lust at this point, collapsed onto the brace, her cheek smushed against it, releasing quivering moos as she’s held in place by your [pc.cock " + x + "]. You’re not feeling too different from the minty-haired New Texan; you close your eyes as you hump, hump, hump away at the cushy rear end of the busty girl beneath you, only to have your thoughts broken by a loud <i>“MooooooOOOOOOOOO!”</i> from your bovine lover.");
	output("\n\nCowslut cunt clenches tightly around your shaft, her warm canal spasming around your [pc.cock " + x + "] as her orgasm ensues. You feel the cowgirl’s muscles tense as her climax continues, mooing long and lustfully as her body is rocked by pleasure. Brandy’s clenching canal and pleasured tones are enough to put you over your edge. You let out a long, needy groan as your [pc.cock " + x + "] spasms, releasing its bounty inside of your lover, who lets out a squealing little moo as you fill her pussy.");

	//decentCumAmount:
	if(pc.cumQ() >= 25) output("\n\nYour [pc.cum] begins to dribble out of the Brandy’s sex as your orgasm continues. The cowgirl under you is limp at this point, panting and mooing softly as you pump her full of cum.");
	output("\n\nYour climax finally comes to an end as the last few spurts of [pc.cumNoun] empty into the bovine broad’s supple slit, leaving the both of you breathing heavily. You have to use all your remaining strength to take a couple steps back and pull yourself out of Brandy, who lets out a little <i>“m-moooo”</i> at the sudden emptiness, cum leaking out of her spread hole and onto the floor of the stall. The exhausted bovine looks over her shoulder at you, and manages to give you a soft smile and a <i>“moo~”</i> before sitting her cum-soaked ass on the ground, ready for a nap.");
	output("\n\nYou smile and [pc.walk] over to her and bring your bottom half to lie down on the spunk-covered floor, beckoning Brandy over. The cowgirl slides herself over to you. You give the side of your tauric body a pat. She seems to get the idea and brings her head down to rest on your body, her eyes quickly closing as her breathing steadies. You bring your upper half to lie down on the floor with the rest of you; not exactly a post-coital snuggle, you think, but it’ll do just fine.");
	processTime(24);
	//increase affection +5
	brandyAffection(5);
	pc.orgasm();
	IncrementFlag("BRANDY_STALLED");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//The Stocks
//[The Stocks]
public function takeBrandyToMiscreantManor():void
{
	generateMapForLocation("531");
	
	clearOutput();
	showBrandy(true);
	author("HugsAlright");
	if(silly) author("HugsItsNotAlright");
	var x:int = pc.cockThatFits(brandyCapacity());
	if(x < 0) x = pc.smallestCockIndex();
	output("<i>“Hey, Brandy.”</i> you say, drawing the cowgirl’s attention, <i>“This place is nice and all, but I think I know somewhere better we could go.”</i>");
	output("\n\nYou smile down at the girl, bringing your hand down to her shoulder.");
	output("\n\nShe looks up at you and emits a nervous little <i>“Moo?”</i>");
	output("\n\nReaching your hand further down, you grab Brandy’s dainty hand, and after giving her arm a little tug, she’s quick to follow you as you [pc.walk] out of the Milk Barn. You walk for quite some time, Brandy’s bell jingling in your ear all the way, until, finally, you come to a stop as you reach your destination, though your bovine buddy tries to keep walking, like she’s hoping this isn’t the place you were talking about.");
	output("\n\nHer walking is halted as you give her arm another gentle tug, and the two of you bring your gaze to the crude wooden platforms and olde-timey stocks of Miscreant Manor.");
	output("\n\nThe minty-haired gal brings herself close to your [pc.ear] and gives you a clearly distressed moo.");
	output("\n\n<i>“Aww, c’mon Brandy,”</i> you respond as you begin to saunter your way up to the stocks. <i>“It’ll be fun, I promise.”</i>");
	output("\n\nWith that, you open the stocks and beckon Brandy over with a finger. She stands there for a moment, quivering, a worried look on her face as she weighs her current options in her head. It seems her desire to cum weighs out: the cowgirl takes a deep breath and walks forward slowly, her blush growing ever more red as she nears the stocks.");
	output("\n\nBrandy looks down at the stocks as she comes up onto the platform and gulps, turning around to gaze up at you, nervous look still on her face. You reach down and stroke her cheek, making her breathing steady a bit.");
	if(!pc.isCrotchExposed()) output(" With a grin on your [pc.face], you begin to strip off your [pc.gear] in front the cowgirl, and she watches attentively until your tauric form lies bare before her.");
	output("\n\n<i>“You ready?”</i> you ask.");
	output("\n\nBrandy needs only the motivation of looking at your [pc.cock " + x + "] before she nods and turns towards the stocks once more. She bends over, her cushy ass straining against her shorts as she places her head and hands into the stock. You gently close it around her neck and wrists and lock it, causing Brandy to squirm a bit, trying to look over her shoulder at you only to have her vision blocked by the stocks. The immobilized bovine tenses, anticipating whatever it is that’s coming next.");
	output("\n\nYou give the cowgirl a slap on the ass, eliciting a quiet moo from her, then bring your hands down to the hem of her shorts, which you yank. Brandy’s shorts come down easily, baring her ass to you. You give her plush lower cheeks a nice firm squeeze, drawing a loud <i>“M-moo!”</i> from your bovine lover. The cowgirl tenses up in your hands as she tries to suppress more moos making their way past her lips. Your gaze is quickly drawn to your lover’s drooling cunt. You smirk and bring your hands off Brandy’s ass, making her shift and wiggle, trying to see what you’re doing, but to no avail. You lovingly trace a finger up and down the pink slit, bringing forth short, quivering moos from the cowgirl. Lustful thoughts cloud your mind as you smile and let a single digit slip into her sodden box, probing her slick pussy until Brandy’s mooing gets louder and louder.");
	output("\n\n<i>“M-m-moooOOOOooo.”</i>");
	output("\n\nAt this point, you can see a few passersby begin to gather around the stocks to watch the spectacle, Brandy’s needy moos clearly drawing attention to the stocks.");
	output("\n\nYou think the poor girl’s had enough teasing for one trip to Miscreant Manor. Withdrawing your probing digit from the cowgirl, you begin to move forward until your stiffening cock is lined up with her rear. The immobilized New Texan nervously shifts and wiggles under you as you lift your [pc.cock " + x + "] up and drop it between Brandy’s soft cheeks. You rub it up and down the busty bovine’s ass-crack, letting her soft bottom caress your cockmeat until you’re rock solid, ready to give the bent-over cowgirl some <i>“authentic frontier justice”</i>.");
	output("\n\nYou take a couple steps back and line your [pc.cock " + x + "] up with your lawbreaker’s lube-soaked pink slit, your [pc.cockHead " + x + "] brushing her folds as you bring yourself to a stop. Looking out towards the crowd, you can only guess the look on Brandy’s face right now: beat-red, eyes closed, biting her lip. You smile at the thought of the nervous cowgirl before focusing on the matter at hand again. Not being one to waste anymore time than you already have, you push forward, shoving your [pc.cock " + x + "] into her steadily in one long stroke. Brandy moos loudly as your [pc.cockNoun " + x + "] makes its way inside her, pretty-pink love-tunnel squeezing at your shaft, making you groan with each inch you shove inside her.");
	pc.cockChange();
	output("\n\nYou’re as deep as you can get into the cowgirl when your push forward stops, taking a moment to listen to Brandy pant, her legs quivering against yours as she recovers from your unrelenting penetration. Looking out towards the crowd again, you notice it’s grown: you see tourist and locals alike, all fixated on the scene at hand, and you think you see a few of the locals trying to pleasure themselves as well.");
	output("\n\n<i>“Why don’t we give the nice people a show, huh Brandy?”</i> you say to the cowgirl beneath your tauric body.");
	output("\n\n<i>“M-moooo,”</i> is all she can manage as a response with your [pc.cock " + x + "] buried in her.");
	output("\n\nYou begin to pull out, and Brandy emits a few whimpering moos as her cunt is emptied, only getting about halfway out of her sodden box before you feel the need to be inside her again. With surprising speed you move your hips forwards again, filling the cowslut with [pc.cock " + x + "] once more, pre dribbling into your lover. Brandy lets out a long <i>“MooooOOOOOO!”</i> as you ram your hips into her again. You repeat the same action again and again, your lover’s warm canal clenching at your [pc.cock " + x + "] as she moos and moos.");
	output("\n\nYou’ve lost your focus on the crowd at this point; you close your eyes and bite your lip, trying to take your mind off the tightness surrounding your [pc.cock " + x + "], letting Brandy’s ceaseless pleasured moos drive you onwards. You hump her ass unconsciously, your mind nothing but a clump of lust at this point. The brandy-cow pants and moos under you as you hammer her pussy, your [pc.hips] colliding with hers and setting her ass jiggling each time. Your desire to cum overtakes any sense of “pacing” you may have had before; you move <i>faster</i>, fucking Brandy’s lube leaking cunt as fast as your tauric body can. Your mind struggles to keep up, groaning loudly and needily until you begin panting alongside (or on top of) your lover.");
	if(pc.biggestTitSize() >= 1) output("\n\nYou let your hands unconsciously drift to your [pc.breasts] and begin to squeeze and knead them, making you moan loudly, drowning out the sounds of Brandy’s pleasure temporarily.");
	output("\n\nYou can’t hold back your impending orgasm any longer. With a feral grunt you push forward, burying your [pc.cock " + x + "] inside of Brandy as your cock begins to spasm, drawing a particularly loud moo from the cowgirl. [pc.Cum] begins to fill your lover’s cunt, and that seems to be enough to put her over her edge.");
	output("\n\n<i>“MOOOOOOOOO!”</i> is the only warning you receive before Brandy’s pussy clamps down on your [pc.cock " + x + "].");
	output("\n\nThe cowgirl tenses and releases torrent after torrent of whimpering moos as her inner walls spasm around your cock. You feel her hips buck jerkily against yours a few times before she goes limp, your [pc.cock " + x + "] still pumping her pussy full of [pc.cum]. While you hump away at Brandy’s ass, your orgasm slowly comes to an end, leaving the both of you tired and panting.");
	output("\n\nFeeling your senses begin to return to you, you look up at the crowd that has gathered, your chest heaving. You see a few bulls jerking off to the scene, and a few heifers schlicking themselves, and the tourists, who seem to be dispersing, are putting away cameras.");
	output("\n\nYou reluctantly pull yourself out of the tired cowgirl beneath you. She moos softly as she’s finally emptied, your seed spilling out onto the platform, your cock twitching slightly. You take a few steps back and take a look at the art you’ve made of Brandy’s ass before walking towards the stocks, freeing her by opening the “punishment” device. The poor girl’s barely able to stand up, her legs shaking, but you’re quick to wrap your arms around the cowgirl to hold her up. She looks up at you, her face blushing deep red, and a smile stretching from ear to bovine-ear. She puts her face to your midsection and moos contentedly.");
	output("\n\n<i>“C’mon,”</i> you say, running a hand through Brandy’s hair. <i>“Let’s go get you cleaned up, lawbreaker.”</i>");
	processTime(35);
	//increase affection +5
	brandyAffection(5);
	pc.exhibitionism(2);
	pc.orgasm();
	IncrementFlag("BRANDY_MISCREANTED");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}