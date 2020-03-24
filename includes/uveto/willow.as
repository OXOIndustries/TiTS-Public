/*
Coded by Maye

Flags
	WILLOW_MET: undefined - hasn't met, 0 - met, 1 - Sexed
	WILLOW_AFFECTION: 0 to 100
	WILLOW_FLIRT: Tracks whether you've flirted with her that meeting. Only matters before you first visit her place.
	WILLOW_HOME: Talked about Willow's home - for continuity.
	WILLOW_HERSELF: Talked about Willow herself for the first time. One of three topics the player need to chat with her during the meal to progress.
	WILLOW_PAST: Talked about Willow's Past for the first time. One of three topics the player need to chat with her during the meal to progress.
	WILLOW_UVETO: Talked about why Willow is on Uvetor for the first time. One of three topics the player need to chat with her during the meal to progress.
	WILLOW_HAS_GRAV_CUFFS: 1 - Has given Willow Grav Cuffs
	WILLOW_VAG_SEXED: How many times you've fucked her puss with one cock or a dildo.
	WILLOW_BUTT_SEXED: How many times you've fucked her butt with one cock or a dildo.
	WILLOW_DBLPEN: How many times you've fucked her vag and butt at the same time.
	WILLOW_DBLPEN_VAG: How many times you've DP'd her vag.
	WILLOW_TRPVAG: How many times you've TP'd her vag.
	WILLOW_VAG_NO_CUFFS: Track if you've experienced the VagNoCuffs scene.
	WILLOW_DBLVAG_CUFFS: Track if you've experienced the DblVagCuffs scene.
	WILLOW_SISTER_TALK: Track if you've talked about her sister.
	WILLOW_BROTHER_TALK: Track if you've talked about her brother.
	WILLOW_MAID_OUTFIT: Undefined - Haven't given, 0 - Isn't wearing, 1 - Wear for me only, 2 - Wear in the bar
	WILLOW_LEATHER_OUTFIT: Undefined - Haven't given, 0 - Isn't wearing, 1 - Wearing
	WILLOW_LATEX_OUTFIT: Undefined - Haven't given, 0 - Isn't wearing, 1 - Wearing
	WILLOW_PIRATE_OUTFIT: Undefined - Haven't given, 0 - Isn't wearing, 1 - Wearing
	WILLOW_CHEERLEADER_OUTFIT: Undefined - Haven't given, 0 - Isn't wearing, 1 - Wearing
	WILLOW_BUNNY_OUTFIT: Undefined - Haven't given, 0 - Isn't wearing, 1 - Wearing
	WILLOW_SCHOOL_OUTFIT: Undefined - Haven't given, 0 - Isn't wearing, 1 - Wearing
*/
public function willowBonus(button:Number):void
{
	/* DISABLED pending extensive cleanup.
	if(flags["WILLOW_MET"] == undefined)
	{
		output("\n\nYou take a cursory look around and spot a new face. It’s a new waitress and a pretty cute one at that... if you like demons. Yep. She looks like a demon straight out of One God mythology: red skin, horns, the whole deal. You notice with appreciation that she has a curvy, heart-shaped ass topped by a spaded tail and supple, perky breasts.");
		addButton(button,"Waitress",willowIntro);
	}
	//[Willow] (Scene description after talking to her)
	else if (flags["WILLOW_MET"] == 0)
	{
		output("\n\nYou see the waitress, Willow, if you recall correctly, walking around as she takes orders.");
		addButton(button,"Willow",willowIntro);
	}
	else
	{
		output("\n\nYou grin as you see your pet running around taking orders and take a seat, waiting for her to approach.");
		addButton(button,"Willow",willowLoverMenu,0);
	}*/
}

public function showWillowName():void
{
	userInterface.showName("\nWILLOW");
}
public function willowBustDisplay(nude:Boolean = false):String
{
	return "WILLOW" + (nude ? "_NUDE" : "");
}
public function showWillow(nude:Boolean = false):void {
	showBust(willowBustDisplay(nude));
	showWillowName();
	author("Archangel99");
}
	
public function willowAffection(add:Number = 0):Number
{
	if (flags["WILLOW_AFFECTION"] == undefined) flags["WILLOW_AFFECTION"] = 0;	
	
	//affection is locked at 100 so no more adding or subtracting
	if (flags["WILLOW_AFFECTION"] >= 100)
	{
		flags["WILLOW_AFFECTION"] = 100;
	}
	else
	{
		if(add != 0) flags["WILLOW_AFFECTION"] += add;
		if(flags["WILLOW_AFFECTION"] > 100) flags["WILLOW_AFFECTION"] = 100;
		if(flags["WILLOW_AFFECTION"] < 0) flags["WILLOW_AFFECTION"] = 0;
	}	
		
	return flags["WILLOW_AFFECTION"];
}
	
//Pre Sex Encounter Menu	
public function willowIntro():void
{
	clearOutput();
	clearMenu();
	showWillow();
	if(flags["WILLOW_MET"] == undefined)
	{
		output("You walk over to an empty table and sit, waiting for her to come and take your order. It isn’t long before she appears, a cheery smile on her face and hands you a menu. <i>“Hello there " + pc.mf("sir.", "miss.") + " My name is Willow and I’ll be your server today! What would you like to order?”</i> She asks in a slightly bubbly voice. You notice her eyes running over your body when she thinks you aren’t looking. She’s definitely interested, that’s for sure...");
	
		flags["WILLOW_MET"] = 0;
	}
	else if (flags["WILLOW_MET"] == 0)
	{
		output("You walk in and see the demonic waitress serving customers their orders. You take your seat and wait for her to approach.");
		output("\n\nShe eventually makes her way over to you and greets you with a smile. <i>“Hey there! Welcome back. Can I get you anything?”</i> She asks, smiling."); 	
	}
	addButton(0,"Order",willowFood);
	if ((pc.hasCock() || pc.hasHardLightStrapOn())&&!pc.isTaur()) addButton(1, "Flirt", willowFlirt);
	else if (pc.isTaur()) addDisabledButton(1,"Flirt","Flirt","Willow doesn’t seem interested in taurs.");
	else addDisabledButton(1,"Flirt","Flirt","You should get a cock or a strapon before you do this.");
	
	addButton(14,"Leave",willowLeave,0);
	processTime(5);
}

//Post Sex Encounter Menu
public function willowLoverMenu(sceneChoice:int):void
{
	clearOutput();
	clearMenu();
	showWillow();
	if (sceneChoice==0)
	{
		output("When you take a seat at the bar, you see Willow serving a customer a few tables away. She hasn’t noticed you yet, so you take the opportunity to just let your eyes roam over her a bit. She seems happier, more upbeat and chipper since the first time you met her. You, of course, had much to do with that.... ");
		output("\n\nEventually, however, she does notice you when she turns and her face breaks out into a smile that practically lights up the room, her eyes shining as well. She holds up a finger, mouths at you: “one minute!” Then hurries off into the bar’s kitchen.");
		output("\n\nShe comes back out and immediately​ throws her arms around you, followed by a wet kiss to the cheek. <i>“Hey there! I wasn’t expecting to see you today!”</i> She says with a smile.");
		if(pc.isNice()) output("\n\n<i>“Well why wouldn’t I come back to see this beautiful lady, hmm?”</i> You ask with a smile.");
		else output("\n\n<i>“If you want, I could just get up and leave!”</i> You say, making a face at her, which results in her sticking her tongue out at you.");
		output("\n\nWillow laughs and kisses your cheek again before standing and clearing her throat, trying to ignore the rest of the bar which happens to be giving the two of you knowing looks. <i>“So anyway, [pc.master], what did you want to order today?”</i> She asks, smiling.");
	}			
	else output("Willow looks at you expectantly.");
	
	addButton(0,"Order Food",willowFood);
	addButton(1,"Order Drink",willowDrink);
	addButton(2,"Talk",willowTalk,0);
	addButton(3,"Her Place",willowHerPlace,0);
	addButton(4,"Gift",willowGiftIntro,0);
	addButton(14,"Leave",willowLeave,0);
}


public function willowLeave(sceneChoice:int):void
{
	clearOutput();
	clearMenu();
	showWillow();
	
	if (flags["WILLOW_FLIRT"] == 0)flags["WILLOW_FLIRT"] = 1;
	if(sceneChoice==0)
	{
		output("<i>“Ah, no. I’m sorry, I just remembered I have business elsewhere,”</i> you say shrugging apologetically."); 
		if(flags["WILLOW_MET"] == 1)output("\n\n<i>“Oh...Ok. Come see me soon,”</i> she says glumly.");
		else output("\n\n<i>“Oh that’s alright. Come again soon!”</i> She says cheerily.");
	}
	else
	{	
		output("<i>“Actually... on second thought... I think I’ll pass. I’m not really in the mood.”</i> You sigh."); 
		output("\n\n<i>“Aw... alright. I’ll see you later, then?”</i> She asks hopefully."); 
		output("\n\n<i>“I’m sure you will.”</i> You say, chuckling and leaning forward to plant a kiss on her head, which makes her giggle happily as you walk away.");
	}
	addButton(0,"Next", mainGameMenu);
	processTime(2);	
}

//Should we just cut this? It's kinda dumb. He just said TiTS drink menu. I' can't steal most of Hana's cause it's unique scenes for her.
//Yeah, she just gives you mead. Adapted from Hana since Willow works at the Freezer apparently.
public function willowDrink():void
{
	clearOutput();
	userInterface.showName("\nWILLOW");
	showBust(willowBustDisplay());
	author("Magic Ted"); //This is on purpose.

	output("There are a dizzying amount of options just for mead alone, but you end up just going with one of the simple, cheap varieties. Can’t get too special with mead - but you can’t go wrong, either. As you tap the screen to make your order, you jealously note that there’s quite a discount for local residents - it might as well be free!");
	
	output("\n\nBy the time you look up from your codex again she has already placed the pale-golden drink in front of you in a tall glass, complete with a little glass coaster. No sooner are you served, she’s back serving other, leaving you with nothing to do but relax and enjoy the smooth, easy going, honey sweet booze. There really is nothing wrong with going for mead.");

	clearMenu();
	addButton(0, "Next", mainGameMenu);
	
	pc.credits -= 5;
	pc.imbibeAlcohol(15);
	processTime(5);
}
	
//He had a button calling for a scene called [Order] but didn't write it. I just stole the text from the [Order Food] button he wrote below and adapted it. Should we just cut this? It's kinda dumb.
public function willowFood():void
{	
	clearOutput();
	clearMenu();
	showWillow();
	
	if (flags["WILLOW_MET"] == 0) 
	{
		output("<i>“Right away, [pc.sir]!”</i> She says, pulling out a tablet, her fingers poised over the screen and looking at you expectantly.");
		output("\n\nYou decide to order a nice grilled cheese sandwich. It arrives quickly and you enjoy the gooey cheese with every bite as you watch the waitress run around serving people.");	
		if (flags["WILLOW_FLIRT"] != 0 && (pc.hasCock() || pc.hasHardLightStrapOn())&&!pc.isTaur()) addButton(1, "Flirt", willowFlirt);// Can still flirt with Willow if you never have this encounter.
		else if (pc.isTaur()) addDisabledButton(1,"Flirt","Flirt","Willow doesn’t seem interested in taurs.");
		else if(flags["WILLOW_FLIRT"] != 0) addDisabledButton(1,"Flirt","Flirt","You should get a cock or a strapon before you do this.");
		addButton(14,"Leave",willowLeave,0);
	}	
	else
	{
		output("You decide to order a nice grilled cheese sandwich. It arrives quickly and you enjoy the gooey cheese with every bite as you watch your favourite waitress run around serving people.");
		addButton(0,"Next", willowLoverMenu,1);
	}
	processTime(5);
}

public function willowFlirt():void
{	
	clearOutput();
	clearMenu();
	showWillow();

	output("<i>“Well, the thing I want isn’t exactly on the menu...”</i> you say, looking at her in a way that leaves no doubt as to your intentions.");
	output("\n\n<i>“O-oh. Um... I....”</i> She’s clearly flustered, her cheeks blushing redder. <i>“I’m sorry, [pc.sir], but... no flirting on the job!”</i> She says with an apologetic smile.");
	output("\n\n<i>“Well that’s too bad,</i> you sigh and smile, looking down at your menu, about to put the thought out of your mind when you hear a murmur.");
	output("\n\n<i>“I get off work in a couple hours, so if you don’t mind waiting, maybe we can.... Ahem!”</i> She clears her throat and looks at you, chewing her bottom lip, a smile playing at the corners of her mouth. <i>“Your order, " + pc.mf("sir", "miss") + "?”</i>");

	addButton(0,"Wait",willowDinnerTalk,5);
	addButton(1,"Don’t Wait",dontWait4Willow);
	processTime(2);

}
public function dontWait4Willow():void
{
	clearOutput();
	clearMenu();
	showWillow();
	
	output("<i>“Actually, no. I’ve got business to take care of. Maybe later?”</i> You say, shrugging apologetically."); 
	output("\n\n<i>“Ah. Okay then.”</i> She murmurs, her shoulders drooping slightly before perking back up. <i>“Well, would you like anything to order, then?”</i> She asks.");
	
	addButton(0,"Order",willowFood);
	addButton(14,"Leave",willowLeave,0);
	
	flags["WILLOW_FLIRT"] = 0;
	processTime(1);
}

public function willowDinnerTalk(choice:int):void // If you waited for Willow
//Player is intentionally unable to leave until they've finished all of Willow's talk options. Otherwise it would fuck the whole script up.
{
	clearOutput();
	clearMenu();
	showWillow();
	
	if(choice==0)//Ask Willow about her Past
	{
		output("<i>“Tell me about your past, Willow. Parents, siblings, I want to hear it all,”</i> you say, slicing off a bit of steak and bringing the fork to your mouth to take a bite. Mmm. This is delicious....");
		output("\n\n<i>“Hm? Well... I grew up on Solan 7, a desert planet just inside the Middle Rim. I had a normal childhood; had pretty much everything a kid could want and loving parents too. My siblings consisted of one very annoying older brother and a very doting younger sister. Dad is a hunter and a good one too,”</i> she says with pride. <i>“There were dangerous animals in the deserts and the bounty office paid out a hefty sum for their skulls, so that was pretty much our bread and butter,”</i> she eats a bit of her food before continuing. <i>“Mom.... Mom was a farmer and grew what she could in the sand. And she...”</i> Willow sniffles. <i>“She died a day after I left.”</i>");
		output("\n\nYou place your hand on hers and offer your condolences.");
		output("\n\n<i>“N-no. I’m sorry. I shouldn’t have gotten so worked up like that...”</i> she murmurs, dabbing at her eyes with a tissue. <i>“Anyway, Dad was a human, Mom was a half-ausar. I turned out looking human, sis and bro got some doggy traits. Chad got a tail and Mina got dog ears,”</i> she says, smiling fondly at the memory.");
		output("\n\n<i>“If I may ask... why did you leave?”</i> You ask tentatively.");
		output("\n\n<i>“I... I don’t want to talk about it,”</i> she says, pushing her food around the plate.");
		flags["WILLOW_HOME"]=1;
		processTime(5); //Each talk is 5 minutes.
	}
	else if(choice==1)//Ask Willow why she is on Uveto
	{
		output("<i>“Why are you here on this frozen hell of a planet? Tired of the hot sand?”</i> You ask cheekily, eating more of the food.");
		output("\n\n<i>“That’s one reason!”</i> She laughs. <i>“Plus I wanted to get away from home, you know? It was getting kinda cramped. Aaaand I wanted to provide for myself. Figured I’d come to this place. The toves pay well!”</i> She says, shrugging.");
		output("\n\nYou nod. Toves being rich, yes they pay well... when it suits them. Otherwise, they would pay you minimum wage, less if they could. You suspect she’s earning less than her parents earned back home, yet she seems to be quite happy here.");
		flags["WILLOW_UVETO"]=1;
		processTime(5); //Each talk is 5 minutes.
	}
	else if(choice==2)//Ask Willow About herself
	{
		output("<i>“Tell me about yourself. Hobbies, favourite foods, people, colors, whatever you can think of! Fetishes too, if you’d like. We could act out some of them later,”</i> you say, winking. She blushes hard, her cheeks darkening as she raises an eyebrow and tries to hide a smile.");
		output("\n\n<i>“Well... my name is Willow, as you already know. My hobbies are painting, collecting shiny gems and reading! My favourite foods would be... this,”</i> she says, pointing her fork down at her pasta, <i>“eggs and steak. As for colors, black, silver and red. Although wearing red is kinda pointless,”</i> she giggles. <i>“Don’t really have any favourite people, but as for my fetishes, uhm....”</i> She blushes again. <i>“I- I like being tied down and... used by a big strong man or woman that can fuck me silly....”</i> She immediately hides her face behind a napkin. You raise an eyebrow at that. ");
		if (silly) output("Well helloooo Nurse!");
		else output("Well hel-lo miss subby!");
		output(" You grin, plans already running through your head.");
		flags["WILLOW_HERSELF"]=1;
		processTime(5); //Each talk is 5 minutes.
	}
	else if(choice==3)//Drop it
	{
		output("<i>“Sorry. I was just curious,”</i> you say.");
		output("\n\nShe nods. <i>“Anything else you want to talk about?”</i>");
		willowAffection(2);
		flags["WILLOW_PAST"] = 1;
	}
	else if(choice==4)//Push it
	{
		output("<i>“Come on. Tell me. Please?”</i> You beg.");
		output("\n\nShe sighs. <i>“Jeez, [pc.name] there was a giant flashing red hint back there.... I just felt a little cooped up is all,”</i> she says, not meeting your eyes. She’s clearly hiding something, but you decide to drop it for now.");
		willowAffection(-5);
		flags["WILLOW_PAST"] = 1;
	}
	else if (choice==5)//Intro scene
	{
		output("You decide not to order but wait for her instead. An hour and a half later you see her check out, put on a coat and walk over to your table. You stand up,greet her and hold out your arm. <i>“May I?”</i> You ask, flashing her a grin. She nods, smiles and loops her arm through yours.");
		output("\n\n<i>“Where are we going?”</i> She asks, looking at you. You notice her irises are a deep purple, ringed with red and set in black sclera.");
		output("\n\n<i>“Somewhere nice. Know any good places? I’m new around here,”</i> you say, looking around the place.");
		output("\n\n<i>“I know the perfect place!”</i> She says, pulling you along until you stand in front of a homey looking restaurant. <i>“Best food on the planet! And not that stuff that comes out of a dispenser. I mean the real stuff, cooked by real hands!”</i> She says excitedly.");
 		output("\n\n<i>“If you say so...”</i> you chuckle, humoring the girl for now. You both walk in and head over to an empty table. Shortly, a kaithrit male comes over and takes your orders. Willow orders some sort of a pasta dish and you order a good old fashioned steak. While you wait for your order, you can’t help but take a jab at Willow. You just let a [pc.guyGirl] take you out on a date without even asking [pc.hisHer] name?”</i> You tease, eyes twinkling. Her eyes go wide and she blushes again.");
		output("\n\n<i>“W-well uhm.... What’s your name then?”</i> She asks, smiling a little.");
		output("\n\n<i>“[pc.name]. [pc.name] Steele,”</i> you answer. She gasps, her jaw falling open and her eyes going wide again. It’s kinda adorable, actually.");
		output("\n\n<i>“Steele? The Steele!?”</i> she says in a voice loud enough for the people a few tables over to hear and turn their heads, suddenly attracting a little more attention than you would have liked. Willow notices and puts her head in her hands.");
 	 	output("\n\n<i>“Oh my, I’m so sorry! I just got a little overexcited,”</i> Willow smiles bashfully. <i>“But really. What’s a [pc.guyGirl] like you doing in a place like this!? You should be flying around the galaxy blowing up pirates, looking for treasure and all that!”</i> You tell her your story, about how your father has sent you on an epic quest to reclaim your inheritance and how you’ve been traveling the stars seeking your fortune. She listens to your monologue in rapture, her head propped up by her palms. She simply stares at you for a minute after you finish and take a sip of your drink, which had arrived while you were talking.");
 	 	output("\n\n<i>“That was.... Wow,”</i> she says with raised eyebrows. <i>“Well, now that you’ve told me about yourself, I suppose you want to know something about me too.”</i>");
		output("\n\nAt this point, your food has arrived and she’s eating slowly while looking at you.");
		output("\n\nWhat do you ask her about?");
		
		processTime(90);
		
		addButton(0,"Past",willowDinnerTalk,0);
		if(flags["WILLOW_HOME"] != undefined) addButton(1,"Why Here",willowDinnerTalk,1);
		else addDisabledButton(1,"Why Here","Why Here?","You don’t know much about her past to ask that!");
		addButton(2,"Her",willowDinnerTalk,2);
	}
	if(choice==0)
	{	
		addButton(0,"Drop It",willowDinnerTalk,3);
		addButton(1,"Push It",willowDinnerTalk,4);
	}
		
	else if(flags["WILLOW_MET"]==1)
	{
	
		addButton(0,"Past",willowDinnerTalk,0);
		if(flags["WILLOW_HOME"] != undefined) addButton(1,"Why Here",willowDinnerTalk,1);
		else addDisabledButton(1,"Why Here","Why Here?","You don’t know much about her past to ask that!");
		addButton(2,"Her",willowDinnerTalk,2);
		addButton(3,"Demon?",willowTalk,1);
		addButton(4,"Sister",willowTalk,2);
		addButton(5,"Brother",willowTalk,3);
		addButton(6,"Dad",willowTalk,4);
		addButton(7,"Hobbies",willowTalk,5);
		addButton(14,"Back",willowLoverMenu,1);
	}
	else if (flags["WILLOW_UVETO"]!=undefined && flags["WILLOW_HERSELF"]!=undefined && flags["WILLOW_PAST"]!=undefined) addButton(0,"Next",willowKissScene,0);
	else
	{
		if (flags["WILLOW_PAST"]==undefined)addButton(0,"Past",willowDinnerTalk,0);
		if (flags["WILLOW_UVETO"]==undefined) addButton(1,"Why Here",willowDinnerTalk,1);
		if (flags["WILLOW_HERSELF"]==undefined)addButton(2,"Her",willowDinnerTalk,2);
	}
}

public function willowKissScene(sceneChoice:int):void
{
	clearOutput();
	clearMenu();
	showWillow();
	
	flags["WILLOW_FLIRT"] = 1;
	
	if (sceneChoice==0)
	{
		output("After the two of you finish your meal, you pay the bill like a proper courteous person. You offer her your arm, which she gladly takes as you lead her out onto the frozen streets of Uveto. She turns to you, looking up as her eyes shine. <i>“I had a really great time tonight, [pc.name]. I hope we can do this again!”</i> She says, smiling. She looks like she’s expecting a little something extra. What do you do?");
		addButton(0,"Kiss Her",willowKissScene,1);
		addButton(1,"Tease",willowKissScene,2);
		addButton(2,"Leave",willowKissScene,3);
		processTime(15); //Half hour meal. 15 from Talks and 15 from finishing overall.
	}
	else if(sceneChoice==1)
	{
			output("You’ll be damned if you don’t give this girl what she wants. Your finger slides under her chin as you tilt her face up, pressing your lips to hers. You feel a quick gust of air on your cheek, a sign that she had just gasped. You pull away after a few seconds, your finger still resting on her chin. <i>“I enjoyed myself too, Willow. We definitely should do this again.”</i> You murmur into her ear, turning to walk away.");
			willowAffection(5);
	}
	else if(sceneChoice==2)
	{
		output("You cup her chin and lean in close for a kiss and brush your lips against hers. <i>“Tease!”</i> she whines, punching you lightly in the chest, but smiling. <i>“In truth, I had a great time, Willow. We’re definitely doing this again,”</i> you say, turning to leave.");
		willowAffection(2);	
	}
	else if(sceneChoice==3)
	{
		output("<i>“Yeah. We definitely should do this again!”</i> you say, turning to leave.");
	}
	if (sceneChoice!=0)
	{
		addButton(0,"Next",willowSexMenu);
	}
}

//Subsequent Visits to Willow's place route through this function
public function willowHerPlace(sceneChoice:int):void
{
	clearOutput();
	clearMenu();
	showWillow();
	
	if(sceneChoice==0)
	{
		moveTo("WILLOWS ROOM");
		output("<i>“I’m feeling a little like... fucking my subby bitch. Got anything for that?”</i> You ask with a wink."); 
		output("\n\nShe raises her eyebrows. <i>“Uh.... Well... I suppose I can get some free time off.”</i> She mumbles."); 
		output("\n\n<i>“Well what are you waiting for? Go!”</i> You command, spanking her ass. She yelps and quickly runs to her boss, who raises an eyebrow when she sees her coming."); 
		output("\n\nThere seems to be an exchange, consisting mostly of giggles on the boss’s part, before Willow comes running back to you, flushing purple and grabbing your hand to drag you all the way to her house. She was clearly embarrassed about it. Well, whatever. Free sex!");
		output("\n\nSoon, you reach her place, climbing the steps and entering the room.");
		processTime(15);//Travel Time
	}	
	output("Willow looks at you expectantly.");
	
	if (!pc.isTaur()) addButton(0,"Sex",willowSexMenu);
	else if (pc.isTaur()) addDisabledButton(0,"Sex","Sex","Willow’s room is way too small to have sex with a taur.");
	addButton(1,"Wear Clothes",willowWearClothes,0);
	addButton(14,"Leave",willowLeave,1);
}

//First Visit to Willow's place routes through the SexMenu
public function willowSexMenu():void
{
	clearOutput();
	clearMenu();
	showWillow(true);

	if (flags["WILLOW_MET"] != 1)
	{
		moveTo("WILLOWS ROOM");
		output("<i>“Hooold it right there, [pc.misterMiss]!”</i> she says. You turn around and raise an eyebrow. <i>“ What kind of a lady would I be if I didn’t let the [pc.manWoman] who treated me so nicely walk away without a treat...?”</i> She says, beckoning to you with a finger. You grin and walk to her.");
		output("\n\nShe turns and falls into step beside you, leading you to her apartment which is a somewhat short and ugly building, with brown walls and hardly any windows to speak of. She climbs the steps, her ass swaying from side, giving you something to fix your eyes on the whole way. She leads you right to the top of the building, where there’s a small, somewhat triangular door set into the wall. She unlocks the door, steps inside and holds the door open, grinning and beckoning for you to enter.");
		output("\n\nYou step inside and look around the small room. It is sparsely decorated with wood walls and floors; lit by a single bulb hanging down from the ceiling which casts a warm yellow glow. The room is warm, heated from underneath by some unknown source. It’s evident Willow has tried to spruce the place up. A vase filled with blue flowers sits on a nightstand next to a double bed. The shelves of a bookcase on the left side of the room are filled with various books as well as one glittering green gem. In the back there is a window overlooking the frozen settlement, its lights shining and sparkling in the darkness. In the center of the room is a small round table with two chairs. A small stove and sink is placed in the corner with an unwashed pan in the sink. ");
		output("\n\n<i>“Well... Welcome to mi casa!”</i> Willow says. <i>“I know it’s not much, but... it’s home!”</i> She does a little twirl to show off the room. You smile as you take in the room. Rather homey and cozy, you think to yourself.");
		output("\n\n<i>“Nice place you got here. I like it,”</i> you say.");
		output("\n\n<i>“So... What do you wanna do?”</i> she asks with a sultry expression that leaves no doubt as to her meaning.");
		output("\n\nYou raise an eyebrow at her provocative look and step forward, grabbing her around the waist to pull her closer, your lips locking with hers. Her hands go up to your face, eyes drifting closed as she purrs softly, eagerly returning the kiss.");
		output("\n\nYour hands hook under her shirt, pulling it up and over her head before tossing it aside and then drop lower to squeeze her ass. Unbuckling her jeans, you pull them down and off, tossing them to join her shirt. Her bra and panties soon follow and she looks at you while panting slightly, eyes wide and bright, her naked body yours to do with as you please.");
	}
	else
	{	
		output("You grin and step closer, kissing her as you take her clothes off, getting in good gropes every now and then. ");
		output("Within minutes, she’s naked and ready for you, her eyes staring into yours with a lusty light in them. What do you want to do with your sunny little slut?");
		if (flags["WILLOW_HAS_GRAV_CUFFS"] != 1||!pc.hasItemByClass(GravCuffs)) (" She did mention that she liked being tied down and dominated... Perhaps you should buy a pair of grav cuffs from that bondage shop on Tavros for next time.");
	}
	if (flags["WILLOW_HAS_GRAV_CUFFS"] == 1||pc.hasItemByClass(GravCuffs))
	{
		if (pc.hasCock() || pc.hasHardLightStrapOn()) addButton(0, "Vaginal", willowGravCuffs, 0);
		else if (!pc.hasCock()||!pc.hasHardLightStrapOn())addDisabledButton(0,"Vaginal","Vaginal","Get a cock or a strapon.");
		if (pc.hasCock() || pc.hasHardLightStrapOn()) addButton(1, "Anal", willowGravCuffs, 4);
		else if (!pc.hasCock()||!pc.hasHardLightStrapOn())addDisabledButton(1,"Anal","Anal","Get a cock or a strapon.");
		
		//DBL PEN BUTTON + MISSED REQS
		if (flags["WILLOW_BUTT_SEXED"] !=undefined&& flags["WILLOW_AFFECTION"] >= 20 && (pc.cocks.length >= 2||(pc.hasCock()&&pc.hasTailCock()&&!pc.hasParasiteTail()))) addButton(2,"DblPen",willowGravCuffs,8);
		else if (flags["WILLOW_BUTT_SEXED"] ==undefined) addDisabledButton(2,"DblPen","Double Penis","Willow can’t be an anal virgin.");
		else if (flags["WILLOW_AFFECTION"] < 20) addDisabledButton(2,"DblPen","Double Penis","Willow hasn’t gained enough affection for you.");
		else if (!pc.hasCock())addDisabledButton(2,"DblPen","Double Penis","You must have at least one front cock.");
		else if (pc.hasTailCock()&&pc.hasParasiteTail())addDisabledButton(2,"DblPen","Double Penis","You can’t have a parasitic tailcock.");
		else if (!pc.hasCocks())addDisabledButton(2,"DblPen","Double Penis","Get another cock or get a tailcock.");
		
		//DBL VAG PEN BUTTON + MISSED REQS	
		if (flags["WILLOW_VAG_SEXED"] >=3 && flags["WILLOW_AFFECTION"] >= 40 && (pc.cocks.length >= 2||(pc.hasCock()&&pc.hasTailCock()&&!pc.hasParasiteTail()))) addButton(3,"DblStuffVag",willowGravCuffs,10);
		else if ((flags["WILLOW_VAG_SEXED"]<3)||(flags["WILLOW_VAG_SEXED"]==undefined)) addDisabledButton(3,"DblStuffVag","Double Stuff Vagina","Willow’s pussy isn’t used to your cock yet.");
		else if (flags["WILLOW_AFFECTION"] < 40) addDisabledButton(3,"DblStuffVag","Double Stuff Vagina","Willow hasn’t gained enough affection for you.");
		else if (!pc.hasCock())addDisabledButton(3,"DblStuffVag","Double Stuff Vagina","You must have at least one front cock.");
		else if (pc.hasTailCock()&&pc.hasParasiteTail())addDisabledButton(3,"DblStuffVag","Double Stuff Vagina","You can’t have a parasitic tailcock.");
		else if (!pc.hasCocks())addDisabledButton(3,"DblStuffVag","Double Stuff Vagina","Get another cock or get a tailcock.");
	}
	else
	{
		if (pc.hasCock() || pc.hasHardLightStrapOn()) addButton(0, "Vaginal", willowSexScenes, 0);
		else if (!pc.hasCock()||!pc.hasHardLightStrapOn())addDisabledButton(0,"Vaginal","Vaginal","Get a cock or a strapon.");
		if (pc.hasCock() || pc.hasHardLightStrapOn())addButton(1,"Anal",willowSexScenes,4);
		else if (!pc.hasCock()||!pc.hasHardLightStrapOn())addDisabledButton(1,"Anal","Anal","Get a cock or a strapon.");
		//DBL PEN BUTTON + MISSED REQS
		if (flags["WILLOW_BUTT_SEXED"] !=undefined&& flags["WILLOW_AFFECTION"] >= 20 && (pc.cocks.length >= 2||(pc.hasCock()&&pc.hasTailCock()&&!pc.hasParasiteTail()))) addButton(2,"DblPen",willowSexScenes,8);
		else if (flags["WILLOW_BUTT_SEXED"] ==undefined) addDisabledButton(2,"DblPen","Double Penis","Willow can’t be an anal virgin.");
		else if (flags["WILLOW_AFFECTION"] < 20) addDisabledButton(2,"DblPen","Double Penis","Willow hasn’t gained enough affection for you.");
		else if (!pc.hasCock())addDisabledButton(2,"DblPen","Double Penis","You must have at least one front cock.");
		else if (pc.hasTailCock()&&pc.hasParasiteTail())addDisabledButton(2,"DblPen","Double Penis","You can’t have a parasitic tailcock.");
		else if (!pc.hasCocks())addDisabledButton(2,"DblPen","Double Penis","Get another cock or get a tailcock.");
		
		//DBL PEN BUTTON + MISSED REQS
		if (flags["WILLOW_VAG_SEXED"] >=3 && flags["WILLOW_AFFECTION"] >= 40 && (pc.cocks.length >= 2||(pc.hasCock()&&pc.hasTailCock()&&!pc.hasParasiteTail())))addButton(3,"DblStuffVag",willowSexScenes,10);
		else if ((flags["WILLOW_VAG_SEXED"]<3)||(flags["WILLOW_VAG_SEXED"]==undefined)) addDisabledButton(3,"DblStuffVag","Double Stuff Vagina","Willow’s pussy isn’t used to your cock yet.");
		else if (flags["WILLOW_AFFECTION"] < 40) addDisabledButton(3,"DblStuffVag","Double Stuff Vagina","Willow hasn’t gained enough affection for you.");
		else if (!pc.hasCock())addDisabledButton(3,"DblStuffVag","Double Stuff Vagina","You must have at least one front cock.");
		else if (pc.hasTailCock()&&pc.hasParasiteTail())addDisabledButton(3,"DblStuffVag","Double Stuff Vagina","You can’t have a parasitic tailcock.");
		else if (!pc.hasCocks())addDisabledButton(3,"DblStuffVag","Double Stuff Vagina","Get another cock or get a tailcock.");
	}
	
	////TRPL PEN VAG BUTTON + MISSED REQS
	if (flags["WILLOW_DBLPEN_VAG"] >=3 && flags["WILLOW_AFFECTION"] >= 70 && (pc.cocks.length == 3||((pc.hasCocks()||(pc.hasCock()&&pc.tailCount>1))&&pc.hasTailCock()&&!pc.hasParasiteTail())))addButton(4,"TrplStuffVag",willowSexScenes,12);
	else if ((flags["WILLOW_DBLPEN_VAG"]<3)||(flags["WILLOW_DBLPEN_VAG"]==undefined)) addDisabledButton(4,"TrplStuffVag","Triple Stuff Vagina","Willow’s pussy still needs to get used to your two cocks.");
	else if (flags["WILLOW_AFFECTION"] < 70) addDisabledButton(4,"TrplStuffVag","Triple Stuff Vagina","Willow hasn’t gained enough affection for you.");
	else if (!pc.hasCock())addDisabledButton(4,"TrplStuffVag","Triple Stuff Vagina","You must have at least one front cock.");
	else if (pc.hasTailCock()&&pc.hasParasiteTail())addDisabledButton(4,"TrplStuffVag","Triple Stuff Vagina","You can’t have a parasitic tailcock.");
	else if (!pc.hasCocks())addDisabledButton(4,"TrplStuffVag","Triple Stuff Vagina","Get more cocks or tailcocks.");
	
	if (flags["WILLOW_MET"] == undefined) processTime(15);//Travel Time for first visit.
	if (flags["WILLOW_MET"] == 1) addButton(14,"Back",willowHerPlace,1); // Player is forced to experience a sex scene first time through. Otherwise story stops making sense. On return visits the player is able to leave.
	flags["WILLOW_MET"] = 1;
}

public function willowGravCuffs(sceneChoice:int):void
{	
	clearOutput();
	clearMenu();
	showWillow();
	output("You tilt your head at her. She did mention that she liked being tied down and dominated... Perhaps you could use those GravCuffs... she’d definitely like it. Do you use them?"); 
	
	addButton(0,"Yes",willowSexScenes,sceneChoice+1);
	addButton(1,"No",willowSexScenes,sceneChoice);
}

public function willowSexScenes(sceneChoice:int):void
{	
	clearOutput();
	clearMenu();
	showWillow(true);
	
	//Cock check shit
	var cIdx:int = (pc.hasCock() ? pc.biggestCockIndex() : -1);
	var cIdx2:int = (pc.cocks.length >= 2 ? pc.biggestCockIndex2() : -1); //Returns 0 if pc doesn't have 2 cocks
	var cIdx3:int = (pc.cocks.length >= 3 ? pc.biggestCockIndex3() : -1); //Returns 0 if pc doesn't have 3 cocks
	
	var cock1:String = "[pc.cock " + cIdx + "]";
	var cock2:String = "";
	var cock3:String = "";
	if(cIdx2 >= 0) cock2 = "[pc.cock " + cIdx2 + "]";
	else if (pc.hasTailCock()) cock2 = "[pc.tailCock]";
	if(cIdx3 >= 0) cock3 = "[pc.cock " + cIdx3 + "]";
	else if (pc.hasTailCock() && pc.tailCount > 1) cock3 = "[pc.tailCock]";
	
	//Knot check shit
	var knot:Boolean = false;
	var knots:Boolean = false;
	if(cIdx >= 0)
	{
		if(pc.hasKnot(cIdx)) knot = true;
		if(cIdx2 >= 0)
		{
			if(pc.hasKnot(cIdx2)) knot = true;
			if(pc.hasKnot(cIdx)) knots = true;
		}
	}
	
	//Leave GravCuffs at Willow's place so you don't have to carry them around.
	if (flags["WILLOW_HAS_GRAV_CUFFS"] == undefined && InCollection(sceneChoice, [1, 5, 9, 11])) 
	{
		flags["WILLOW_HAS_GRAV_CUFFS"] = 1;
		pc.destroyItemByClass(GravCuffs);
		outputCodex("Oops, looks like you forgot your GravCuffs at Willow’s place. At least you won’t need to bring them next time.");
	}
	
	//General sex scene stuff. Decided to pass 8 hours cause you take a nap at Willow's place. 
	//All sex scenes give +5 affection. Boost this if you want to decrease the influence of gifts in increasing Willow's affection.
	if (sceneChoice != 1 && sceneChoice != 5)
	{
	 	willowAffection(5);
		processTime(480);
		pc.orgasm();
	}
	
	if ((sceneChoice!=1)&&(sceneChoice!=5))
	{
		addButton(0,"Leave",move,rooms["WILLOWS ROOM"].eastExit);
	}
	
	//Vag No Grav Cuffs
	if (sceneChoice==0)
	{
		if (flags["WILLOW_VAG_NO_CUFFS"]==undefined) output("You grin and wrap your arms around her waist like a lover. She giggles,about to rest her head on your chest when you suddenly lock your foot behind hers and push her back, tripping her and sending her sprawling onto the bed. <i>“Ow! Heeey! That’s no way to treat a lady!”</i> She whines, smirking.");
		else output("You grin and twirl a finger, indicating that she should get on the bed. She smiles back and gets onto the bed, her legs spread invitingly as she bends over for you.");
		if (!pc.isNude()) output(" You quickly toss your [pc.gear] to the side and clamber onto the bed, straddling her.");
		if(!pc.hasCock()) output("\n\nYou quickly grab your [pc.hardlightCock] and attach it to the holster.");
		if (flags["WILLOW_VAG_NO_CUFFS"]==undefined)
		{
			output("\n\n<i>“Last I checked... You said you liked being dominated,”</i> you lean down and grab her neck, pulling her up closer to you. <i>“Does that still apply?”</i> You ask, baring your teeth in a predatory grin.");
 			output("\n\n<i>“Wha-? I- Y-yes. It does,”</i> she says, her eyes wide with anticipation and maybe a little bit of fear. You feel her breath coming quicker, her heart pounding faster, blood pulsing through the veins under your fingers.");
			output("\n\n<i>“Good. Because right now... You’re mine!”</i> You growl into her ear, rolling her over so her back is to you, her ass in the air. Her hands are next to her head, the fingers splayed out, her chest rising and falling quickly. <i>“Mm... I have to say, you have a really nice ass... full and round...,”</i> you murmur, caressing it, spreading her cheeks to reveal her dark star and- Oh! She’s actually getting off on this! Her pussy is wet, a single drop of excitement hanging from her clit.");
			output("\n\n<i>“Uhm, t- thank you?”</i> She mumbles into the pillow. You deliver a sharp spank to her ass. She jerks forward, gasping. Her pussy gets wetter, the drop falling, soon followed by more.");
			output("\n\n<i>“Thank you what?”</i> You ask, your hands roving over her ass, groping and squeezing the soft flesh.");
			output("\n\n<i>“T-thank you... M- [pc.master]?”</i> She says, as if slightly unsure of the word on her tongue.");
			output("\n\n<i>“That’s right, [pc.master]. From now on, that’s going to be the only thing you shall call me, unless I expressly say otherwise,”</i> you say, giving her pussy a long, slow lick. She trembles and lets out a slight moan at the contact, her pussy now dripping steadily.");
			output("\n\n<i>“Yes, [pc.master]!”</i> She cries out.");
		}
		output("She looks back over her shoulder with horny puppy eyes. <i>“Would [pc.master] please make use of [pc.hisHer] servant?”</i> She asks and you detect a pleading tone in her voice. You deliver another hard spank to her ass. Willow hisses with pain and pleasure, letting out a soft coo.");
		output("\n\n<i>“Beg me properly...”</i> you whisper into her ear, sitting back and completely avoiding any contact with her. She turns, still on her hands and knees and presses her head to the mattress in a show of complete submissiveness.");
		output("\n\n<i>“Would [pc.master] please make use of [pc.hisHer] servant?”</i> She asks again, not making eye contact this time. You grin, grabbing her around the waist and rolling her over, your weight more than enough to pin the weaker, submissive girl down. Her back is to you again and she makes nary a sound. Yet, you feel the shiver of anticipation running through her body, the servant waiting for her [pc.master] to use her like a toy.");
		output("\n\n<i>“Yes. Yes I will...”</i> You murmur, your hips drawing back, dragging your ");
		if (cIdx >= 0) output("[pc.biggestCock]");
		else output("[pc.hardlightCock]");
		output(" through the lips of her dripping pussy before slowly sinking your entire length in with one slow thrust. ");
		if (cIdx2 >= 0) output("Your other cock slides over her butt, rubbing between the soft cheeks of her ass and against her twitching asshole.");
		output("Willow shivers and moans, feeling every inch of her [pc.master]’s cock filling her tight hole. Her pussy wraps around your ");
		if (cIdx >= 0) output("[pc.biggestCock]");
		else output("[pc.hardlightCock]");
		output(", the walls warm, tight and wet around your ");
		if (cIdx >= 0) output("sensitive flesh.");
		else output("synthetic cock.");
		output(" You moan softly, your hips pressed to hers. You slowly draw back before roughly slamming in, continuing with that pace. Willow moans loudly, gasping and trembling with each thrust into her tight pussy.");
		output("\n\n<i>“M-[pc.master]. A-aah! Your cock feels so guh-good!”</i> She groans, her dialogue interrupted by moans. You shift so you’re poised directly above her, your hands closed tight around her wrists as you quickly pick up the pace, pounding faster into her. She moans loudly in delight, her ass rippling with every hard thrust. <i>“Yes! Yes, [pc.master]! Fuck me! Aaaah!”</i> She gasps out, her tongue hanging out of her mouth, eyes rolled slightly back into her head. You rear back and slap her ass twice, hard, one slap for each cheek. She moans louder at that, her walls tightening around you. <i>“C-cumming!”</i> Is the only warning you get before a spray of girlcum hits your thighs. Her pussy tightens up and contracts almost painfully around your ");
		if (cIdx >= 0) output("[pc.biggestCock]");
		else output("[pc.hardlightCock]");
		output(", wringing it for its cum. ");
		if (cIdx >= 0)
		{
			output("\n\nWith a roar, you grab her tail and slam into her one last time,your [pc.balls] unloading everything they have to pack this tight pussy full of [pc.cumType].");
			if (knot || knots)output("Your knot swells up in preparation and you brutally fuck the knot into her, Willow screaming in pain and pleasure.");
			output("Your dick spurts ropes and ropes of [pc.cumColor] cum into her womb"); 
			if (cIdx2 >= 0) output(" and over her back");
			output(", filling it up so much that Willow simply can’t hold all of it in, ");
			if (knot || knots)output("but your swollen knot ensures that it stays there.");
			else output("and some of it spurts back out around your [pc.biggestCock], dripping onto the bed sheets."); 
			if (pc.cumQ() >= 4000) output(" Her stomach bloats into a nice round cum gut.");
			output(" She groans weakly and flops to the side, rubbing her belly. <i>“Thank you, [pc.master]...”</i> she murmurs.");
		} 
		else 
		{
			output("With a groan, you grab her tail and buck your hips against her a few more times before you orgasm as well. Unfortunately, you don’t have a real cock, so all you can really experience is the intense rush of ");
			if (pc.hasVagina()) output("pleasure as you spray your own femcum across her mattress.");
			else output("dampened pleasure to organs that are no longer there.");
		}
		output("\n\n<i>“You’re welcome, pet,”</i> you say, lying down next to her for a quick nap. Willow passes out almost immediately and after a few hours of napping with your arm around her, you unfortunately have to get up to leave. You write a little note and toss it onto the bedside table, telling her you’ll be back soon for more fun.");
		if(!pc.isNude())output(" You then gather up and put on your [pc.gear] before leaving the apartment, closing the door softly behind you.");
		
		if (flags["WILLOW_VAG_NO_CUFFS"]==undefined) flags["WILLOW_VAG_NO_CUFFS"] == 1;
		IncrementFlag("WILLOW_VAG_SEXED");
	}
	//Vag Grav Cuffs Position Choice
	else if (sceneChoice==1)
	{
		output("You whistle and your set of GravCuffs fly into the air, hovering behind you. Willow’s eyes widen at the sight."); 
		if (pc.hasItemByClass(GravCuffs)&&flags["WILLOW_HAS_GRAV_CUFFS"] != undefined) output("<i>“GravCuffs? Oh my, someone came prepared!”</i> She says");
		else output("<i>“Again?”</i> She asks");
		output(", a tiny smile playing at her lips. Without a word, you snap your fingers and the cuffs lock around her ankles and wrists. They lighten her mass, causing her to hover in the air and await your next command. You could either fuck her against the wall, or use the bed.");
		
		addButton(0,"Wall",willowSexScenes,2);
		addButton(1,"Bed",willowSexScenes,3);
	}
	//Vag - Wall Variant Grav Cuffs
	else if (sceneChoice==2)
	{
		output("You decide to fuck her against the wall. At your command, the cuffs move over to the wall, latching on to the wood paneling in such a way that her arms and legs are spread wide. Her body is bent over, her ass presented to you, almost like she was locked between two pillories. A sacrifice to the predator. That thought makes you grin wider. ");
		if (flags["WILLOW_VAG_SEXED"]==undefined) output("You see that her pussy is already dripping");
		else output("Her pussy is dripping already, as usual");
		output(", the drops collecting into a tiny puddle below. You take a few steps closer, until you’re right behind her, almost touching her. She shivers, whether from anticipation or the embarrassment of being so... exposed, in front of someone like this. Or maybe just the thought of you being so close to her, but not doing anything, is driving her crazy.");
		output("\n\nYou reach out and lightly stroke a finger down her back. Slowly, teasingly, caressingly. She mewls at the contact, but does nothing else. You lightly rake your fingers over the full curves of her ass and her pussy starts dripping even faster. You touch her everywhere except her most sensitive areas with feather touches, driving her closer and closer to the edge, but never pushing her over. <i>“[pc.Master]!”</i> she squeals, a long, drawn out wail. <i>“Please stop teasing meee!”</i> She whines pleadingly. ");
		output("\n\n<i>“Mm. Why should the [pc.master] listen to the slave?”</i> You ask, running the tip of your finger through her labia and swirling the wet digit around her asshole, never pressing in. She shivers and moans, trying to buck her hips backwards to get your finger in her hole, but you move with her hips, keeping the pleasure close, yet far, far away. She groans and you decide the poor girl has had enough."); 
		if(!pc.isNude()) 
		{
				output(" You step back, tossing your [pc.gear] off to the side, your ");
				if (cIdx >= 0) output("[pc.biggestCock]");
				else output("[pc.hardlightCock]");
		 		output(" hard and ready. Y");
		}
		else
		{
		 	output(" Your "); 
			if (cIdx >= 0) output("[pc.biggestCock]");
			else output("[pc.hardlightCock]");
			output(" hard and ready, y");
		}
		output("ou step close, pressing the tip of your ");
		if (cIdx >= 0) output("[pc.biggestCock]");
		else output("[pc.hardlightCock]");
		output(" into her pussy before bottoming out in one hard thrust. ");
		if (cIdx2 >= 0) output("Your other "+ cock2 +" slides up through the crack of her ass, the soft flesh serving to provide you with a buttjob.");
		output("\n\nWillow lets out a loud moan of pure bliss, finally getting to feel her [pc.master]’s [pc.biggestCock] after all the teasing [pc.manWoman] inflicted. You spank her ass hard, making the flesh ripple and eliciting a kinky moan from Willow. You pull out, spank her other cheek and slam back in, alternating between thrusting in and slapping. The flesh reddens under your open palm. Hisses of pain and moans of pleasure fall out of Willow’s mouth, her long, demonic tongue hanging out as her eyes cross.");
		output("\n\nYou grab her breasts, squeezing and twisting her nipples as you pick up the pace, pounding her harder and faster. She lets out a sound that’s halfway between a scream and a moan, cumming as you do so. Her toes curl and her pussy tightens up as her girlcum sprays over your thighs. Damn, she’s a squirter!");
		if (cIdx >= 0)
		{
			output("\n\nThe sudden tightening is too much for you, ");
			output("and you feel your [pc.balls] start to churn with cum,"); 
			if(knot || knots)output("your knot swelling, ");
			output ("ready to pack her full. After a few hard slams, ");
			if (knot || knots)output("you roughly fuck the knot into her, making her scream out with pain and pleasure at the sudden stretching. ");
			else output ("you bury yourself deep in her and cum, spraying rope after rope of cum into her. ");
			if(cIdx2 >= 0) output ("Your other "+ cock2 +" sprays its load over her back. ");
			output ("There’s so much, ");
			if (knot || knots)output("but your knot ensures that nothing flows back out, keeping her pussy filled with cum.");
			else output("that it flows back out around your [pc.biggestCock], dripping to the floor and mixing with her juices. ");
			output ("By the time you’re done, she has a nice round belly full of cum. She goes limp in the bindings, her head hanging."); 
		}
		else
		{
			output("\n\nWith a grunt, you grab her hips and buck your hips a few more times before you orgasm as well. Unfortunately, you don’t have a real cock, so all you can really experience is the intense rush of ");
			if (pc.hasVagina()) output("pleasure as you spray your own femcum across her floor."); 
			else output("dampened pleasure to organs that are no longer there.");
		}
		output("\n\nYou unlock the bindings and gently pick up the limp girl. She hasn’t passed out, but is mostly out of it. Don’t expect her to be having a conversation anytime soon. You lay her down on the bed, getting in after her and pulling the covers over yourselves. She snuggles backwards, closer to her beloved [pc.master]. "); 
		if (cIdx >= 0)
		{
			output("Your ");
			if (cIdx2 >= 0) output("[pc.cocks] stiffen");
			else output ("[pc.cock " + cIdx + "] stiffens");
			output(" again at the closeness and warmth of her body.");
		}
		output("She’s just too damn sexy... You wrap an arm around her and settle in for a nap.");
		output("\n\nWhen you wake, you find her staring at you with a slight smile on her face. <i>“I enjoyed that, [pc.master]. I hope we can do that again...”</i> She murmurs, dragging a long fingernail down the middle of your [pc.chest].");
		output("\n\n<i>“I’d love to stay and do so, but as they say, I’ve got things to see and people to do!”</i> ");
		if(!pc.isNude())output("You say, rolling out of bed and getting dressed. Willow sits up and watches with smouldering, lusty eyes as you clad your sexy body in your [pc.gear]. ");
		output("You walk out of the room, waving goodbye as she blows you a kiss.");
		
		
		IncrementFlag("WILLOW_VAG_SEXED");
	}
	//Vag - Bed Variant Grav Cuffs
	else if (sceneChoice==3)
	{
	
		output("You decide to fuck her on the bed. About as classic and unoriginal as you can get. At your command, the cuffs latch onto the bedposts, leaving her spread-eagle on her back and totally at your mercy. You grin and walk close. Tracing your fingers up the undersides of her feet, up her shins, thighs, stomach, between her cleavage, to finally stop at her throat. Her mouth is slightly open and her breath comes a little quick; her body tensed in anticipation. You grab her cheeks. <i>“Who’s your [pc.master]?”</i> You ask.");
		output("\n\n<i>“You are, [pc.master],”</i> she replies, a small grin tugging at the corners of her lips.");
		output("\n\n<i>“Whose property are you?”</i> You ask.");
		output("\n\n<i>“Yours, [pc.master],”</i> she replies, ever the perfect, obedient slave.");
		output("\n\n<i>“Good,”</i> you reply. ");
		if(!pc.isNude())output("Stripping off your [pc.gear] y");
		else output("Y");
		output("ou get onto the bed, straddling her. You look down at her form, admiring the swells of her breasts and the curves of her ass. <i>“Quite a nice body you have, pet...”</i> you murmur, running your hands up her sides and grabbing her breasts, your thumbs drawing circles over her hardened nipples. She lets out a little moan at that and you can feel her crotch start to get warm below you.");
		output("\n\n<i>“T-thank you, m-[pc.master],”</i> she murmurs, letting out another soft moan. You stop playing with her breasts and move yourself slightly downwards, now straddling her knees. You bend forward and blow some air on her pussy. The cold air makes her give out a tiny little coo. <i>“Aah! [pc.Master]! Why are you ");
		if (flags["WILLOW_VAG_SEXED"]!=undefined) output("always");
		output("such a tease!?”</i> She whines, trying to wiggle her hips and get your hardening [pc.cocks] between her legs.");
		output("\n\n<i>“Because it’s fun to drive someone crazy with lust before fucking them silly,”</i> you reply, drawing a finger through her labia, making her shiver and moan. She seems to be abnormally sensitive... You should probably ask her about that later. But for now, you want to enjoy this fine pussy on offer before you. Pushing your finger in, you slowly start thrusting it in and out, her dripping wetness making it more than easy. She throws her head back and moans loudly, her thighs trying to clench around your head, but unable to, as they are cuffed to the bed. You grin and continue to slowly thrust your finger in and out of her, keeping her on the edge.");
		output("\n\n<i>“Aaaah! [pc.Master] please stop teasing me and fuck me!”</i> She squeals, looking at you with pleading eyes. You grin.");
		output("\n\n<i>“Give me a good reason to,”</i> you say, sitting back and running your hands up and down her thighs.");
		output("\n\n<i>“Wha-? Um... My pussy feels great?”</i> She offers with a weak grin.");
		output("\n\nYou shake your head. <i>“Had plenty of pussies. No offence, but yours isn’t exactly on the top,”</i> you say, your thumb rubbing in circles on her mons, right above her pussy. She squirms under your ministrations, trying to get your fingers to touch her dripping wet pussy.");
		output("\n\n<i>“Aah! Mm! Er... Because... because you like using me like a toy?”</i> She squeaks, still wiggling about, still desperately trying to get your fingers in her pussy.");
		output("\n\n<i>“Clooose, but no. You’re getting warmer, though; and I don’t mean just down here,”</i> you say, running your fingers over her labia with feather touches. She bites her lip and squirms again. ");
		output("\n\n<i>“B-because I love having your [pc.cockNoun] in my d-dripping wet pussy, f-fucking my brains out while I scream in m-mindless pleasure?”</i> She asks, blushing heavily, her words punctuated by gasps.");
		output("\n\n<i>“Bingo,”</i> you murmur, slowly thrusting your hard ");
		if (cIdx >= 0) output("[pc.biggestCock]");
		else output("[pc.hardlightCock]");
		output(" into her pussy."); 
		if (cIdx2 >= 0) output(" Your other "+ cock2 +" rubs over her clit, stimulating her even further.");
		output(" She moans loudly, shuddering as her body finally receives the cock it has been craving. Her walls wrap tightly around your ");
		if (cIdx >= 0) output("[pc.biggestCock]");
		else output("[pc.hardlightCock]");
		output(", already trying to milk it for its cum.");
		output("\n\n<i>“Oh god yeeeeessss!”</i> She wails, her eyes rolled back slightly as her tongue hangs out of her mouth. You bend over her, take a nipple in your mouth and begin rolling it between your teeth. Your other hand goes up and glomps onto one of her breasts, squeezing and groping the soft flesh, pinching and teasing the nipple too. You start sawing back and forth, her breasts jiggling with every impact. She gasps and moans and a sudden gush of fluids around your ");
		if (cIdx >= 0) output("[pc.biggestCock]");
		else output("[pc.hardlightCock]");
		output(" alerts you to the fact that she just came. You continue to slam into her, driving her wilder and wilder with pleasure. You feel your orgasm coming, ");
		if (cIdx >= 0) 
		{
			output("[pc.balls] twitching and churning,");
			if (knot || knots) output("your knot swelling,");
	 		output("ready to give her your seed.");
		}
		else output (".");
	
		if (cIdx >= 0)
		{
			output("\n\n<i>“You’re going to cum, aren’t you, [pc.master]? Do it. Do it! I want to feel your seed rushing into me, filling me up and marking me as yours! Do iiiittt!”</i> She squeals, tightening up around your ");
			if (cIdx >= 0) output("[pc.biggestCock]");
			else output("[pc.hardlightCock]");
			output(", ready to receive your cum."); 
		}
		// {If strapon: Even if you don’t have any to give.}
		//output("That’s the last straw. ");
		if (cIdx >= 0)
		{
			output(" With a roar, you grab her hips and slam in one last time,"); 
			if (knot || knots)output("ramming the knot in");
			output("as your [pc.cumType] rushes up your dick to fill her womb. She moans loudly in total bliss as she’s utterly filled up. ");
			if (pc.cumQ() >= 3000) output("Her belly bulging out, making her look at least two months pregnant!");
			output("The feeling of your [pc.cumType] rushing into her sets off another orgasm and she opens her mouth in a soundless scream, her back arching as a weak groan escapes. <i>“Ohhh... So... Full...”</i> she murmurs, her eyes half closed, her body going limp.");
		}
		else
		{
	
			output("With a groan, you grab her tail and buck your hips furiously against her a for a minute more before you orgasm as well. Unfortunately, you don’t have a real cock, so all you can really experience is the intense rush of ");
			if (pc.hasVagina()) output("pleasure as you spray your own femcum across her floor."); 
			else output("dampened pleasure to organs that are no longer there.");
		}
		output("\n\nYou unlock the cuffs and lie down next to the well-fucked girl, running your nails over her skin. <i>“I take it you enjoyed that?”</i> You ask, a cheeky grin on your face. She turns to you, panting slightly, then reaches out and yanks you into a kiss, her long tongue dancing around with yours. You stay like that for almost a whole minute, just kissing, before she pulls back.");
		output("\n\n<i>“Does that answer your question?”</i> She murmurs happily, smiling as she looks you in the eyes. You nod, wrapping her up in a hug and settling down for a nap. When you wake a few hours later, she is still asleep. You carefully slide out of her embrace, ");
		if(!pc.isNude())output("gathering up and putting on your [pc.gear], ");
		output("leaving her a note as you leave the room.");
	
		IncrementFlag("WILLOW_VAG_SEXED");
	}
	//Anal No GravCuffs or choosing not to use them
	else if (sceneChoice==4)
	{
		output("<i>“Get on the bed. On your hands and knees. I want to fuck your ass,”</i> you say. Her eyes go a little wide at such a blatant statement to fuck, but she obeys, getting on the bed, then on her hands and knees, her lovely curvy rump raised in the air, tail swishing about nervously. ");
		if(!pc.isNude())output("Taking your [pc.gear] off, y");
		else output("Y");
		output("ou get on your knees behind her, pushing her tail to the side as it absentmindedly bats you around the face. You reach out and spread her cheeks, getting a good look at her asshole and pussy. ");
		if (cIdx >= 0) output("Your [pc.cocks] start" + (pc.cocks.length == 1 ? "s" : "") + " to stiffen merely from the thought of pounding this tight ass. ");
		output("You bring your hand back, sticking the thumb into your mouth and lick over it, getting it nice and slathered up in your spit. Then, you press your spit-slicked digit to her backdoor. ");
		if (flags["WILLOW_BUTT_SEXED"]==undefined)
		{
			output("She squeaks and immediately tightens up, almost squirming away.");
			output("\n\n<i>“M-[pc.master], I don’t- don’t have any experience with s-stuff going in b-back there,”</i> she says, her eyes a little fearful.");
			output("\n\n<i>“Wait. You’re an anal virgin?”</i> You ask, the surprise on your face quite clear. She blushes and nods. <i>“Oh. I see. Well... Let me take over, okay? I’ll make you feel good. I promise. Now, loosen up a bit and let me in,”</i> you say soothingly, rubbing her butt with your other hand. She nods and loosens up. You press your thumb into her dark star and she lets out a little squeak of discomfort.");
			output("\n\n<i>“[pc.Master], it- it feels w-weird!”</i> She stammers, her walls clenching down around your thumb.");
			output("\n\n<i>“I know. It’s your first time, so it will feel weird at first. Just give it a little while,”</i> you murmur back,");
		}
		else output("She lets out a little moan, her ass twitching around your digit. <i>“My ass again, m-[pc.master]? You have good tuh-taaaste!”</i> She says, her voice acquiring a slightly higher pitch since you’re");
		output ("still thrusting your thumb in and out of her ass, pulling it to the side to stretch her out a little wider. You notice her pussy starting to get wetter. It’s not dripping, but definitely getting wetter. You move your other hand to her labia, sliding two fingers into her pussy while your thumb rubs over her clit. This elicits a loud moan and a slight loosening of her ass as she relaxes a little. You quickly slide the wet fingers out, Willow whining a little in protest. That quickly changes when you press both of the slick digits to her asshole alongside your thumb and slide them in. She lets out a cute gasp and a hum of either pleasure or discomfort. You can’t really tell.");
		output("\n\nYou pull the fingers to the side, giving you a clear view into her asshole. <i>“Aaah! M-[pc.master]! Wh-what are you d-doing back there!?”</i> She squeals,");
		if (flags["WILLOW_BUTT_SEXED"]!=undefined)output(" still");
		output(" uncomfortable at someone viewing something that is normally so private and hidden. You slip your fingers out of her ass, letting it clench back up to a more normal extent. You rub your ");
		if (cIdx >= 0)output("[pc.biggestCock]");
		else output("strapon");
		output(" under her dripping pussy, rubbing her clit back and forth with the head, getting it nice and lubed up before pressing it to her asshole and slipping past her sphincter. She lets out a loud ");
		if (flags["WILLOW_BUTT_SEXED"]==undefined) output ("mewl"); 
		else output("moan");
		output(" as she feels your tip slide into her, immediately tightening up around the thick appendage, ");
		if (flags["WILLOW_BUTT_SEXED"]==undefined) output ("preventing you from moving.");
		else output("already wringing you for your cum."); 
		output(" You sigh and bend forwards, rubbing and groping her breasts, trying to get her to relax so you can slide your dick in further. She pants as you play with her breasts, her ass loosening slightly. You take the opportunity and thrust in deeper. She grunts in ");
		if (flags["WILLOW_BUTT_SEXED"]==undefined) output ("pain");
		else output("pleasure");
		output(" as you thrust in and you slow down, playing with her nipples to ");
		if (flags["WILLOW_BUTT_SEXED"]==undefined) output ("override the pain with pleasure.");
		else output("stimulate her even more.");
		output(" She lets out a cute moan and her asshole loosens up a little more, but you don’t thrust in, content to drag your ");
		if (cIdx >= 0) output("[pc.biggestCock]");
		else output("[pc.hardlightCock]");
		output(" back and forth through the part of her ass you have already conquered. She makes a series of short gasping moans, her anal walls squeezing tight around your ");
		if (cIdx >= 0) output("[pc.biggestCock]");
		else output("[pc.hardlightCock]");
		output(" as you penetrate her.");
		output("\n\n<i>“M-[pc.master]! M-more! Please! Aaah! God I love your ");
		if (cIdx >= 0) output("[pc.biggestCock]");
		else output("[pc.hardlightCock]");
		output("!”</i> She says, suddenly thrusting her hips back to meet yours. You grin and drive in, burying the rest of your ");
		if (cIdx >= 0) output("[pc.biggestCock]");
		else output("[pc.hardlightCock]");
		output(" in her tight ass. She lets out a loud a scream of mixed pleasure and pain, her ass spasming around your ");
		if (cIdx >= 0) output("[pc.biggestCock]");
		else output("[pc.hardlightCock]");
		output(". You rear back and slam deep into her with one hard thrust and she immediately orgasms, squealing as her ass wrings your ");
		if (cIdx >= 0) output("[pc.biggestCock]");
		else output("[pc.hardlightCock]");
		output(" for its cum");
		if (cIdx < 0) output(", which, unfortunately, you don’t have");
		output(". You grit your teeth, trying to hold back your orgasm. You manage to succeed");
		if (pc.balls>0)output(", your balls churning in protest");
		output(". Her body goes limp, her ass loosening enough to let you really ram in properly.");
		if (flags["WILLOW_BUTT_SEXED"]==undefined)output(" You have, in a not very gentle manner, claimed her anal virginity!");
		output("\n\nYou don’t hesitate, ramming into her ass with hard, deep thrusts, the slapping of your hips meeting hers echoing around the room. She moans and gasps loudly with each thrust, her ass starting to contract around your ");
		if (cIdx >= 0) output("[pc.biggestCock]");
		else output("[pc.hardlightCock]");
		output(" again. You deliver a sharp spank to one cheek and she squeaks loudly, immediately tightening up noticeably. You moan, your orgasm drawing inexorably closer as you rail her ass. You spank her lovely ass every time you pull back out, her involuntary squeezing bringing you closer and closer, until finally, with a snarl, you ram yourself deep into her ass, ");
		if (knot || knots)output("fucking your swollen knot through her tight sphincter and earning another loud scream of pure bliss, ");
		output("your orgasm finally boiling over. You blast rope after rope of hot [pc.cumType] into her bowels, her stomach bulging out with the sheer size of your load, ");
		if (knot || knots)output("your knot packing it in tight.");
		else("filling her so full that your cum spurts back out, staining your thighs.");
		output(" Your orgasm sets hers off as well and she cums hard, her empty pussy twitching as it searches for your ");
		if (cIdx >= 0) output("[pc.biggestCock]");
		else output("[pc.hardlightCock]");
		output(". Girlcum spurts out, ");
		if (cIdx >= 0) output("mixing with the cum on your [pc.lowerBody].");
		else
		{
			output("splattering over your thighs as she goes limp. With a snarl, you ram yourself deep into her ass a few more times before you orgasm as well. Unfortunately, you don’t have a real cock, so all you can really experience is the intense rush of ");
			if (pc.hasVagina()) output("pleasure as you spray your own femcum across her mattress."); 
			else output("dampened pleasure to organs that are no longer there.");
		}
		output("\n\nYou gently lift her abused body and lower it back down on its side, lying down beside her for a quick nap. She lets out a little purr ");
		if (cIdx >= 0) output("and rubs her swollen belly. <i>“Mm... So full... Thank you, [pc.master]...”</i> She murmurs");
		output(", rubbing her head back against you. You just smile and squeeze her soft body tighter, your eyes drifting to a close as you fall asleep.");
		output("\n\nYou wake in a few hours, Willow still fast asleep, your ");
		if (cIdx >= 0)
		{
		 	output(cock1);
			if (knot || knots)output(" and knot");
			output(" having deflated and slipped out on its own.");
		}
		else output("strapon still buried inside her.");
		output(" You quietly get out of bed and get dressed. <i>“Leaving so soon?”</i> Looking up, you see her sitting in the bed, gazing at your half naked body.");
		output("\n\n<i>“Yeah, unfortunately. As they say, I got things to do and people to see.”</i> You ");
		if(!pc.isNude())output("put your [pc.gear] on and "); 
		output("lean forwards to kiss her, your tongue slipping out and twirling around with hers. She returns the kiss with a little moan, wrapping her arms around your neck and pulling you closer. <i>“Please stay... Just a while longer...”</i> She murmurs after a few seconds of kissing. You relent and lie down beside her again, just running your hands over her body as you kiss her over and over again. After a while of cuddling, you get up to leave and she waves you off, blowing you a kiss as you leave, shutting the door behind yourself.");
	
		flags["WILLOW_BUTT_SEXED"] +=1;
		
	}
	
	else if (sceneChoice==5)
	{
		output("Your eyes drop to her curvy rump. You think she would look rather sexy bent over the bed with your dick in her ass... Hell, even up against the wall! Do you fuck her against the wall or on the bed?"); 
		addButton(0,"Wall",willowSexScenes,6);
		addButton(1,"Bed",willowSexScenes,7);
	}
	
	//Anal Wall Grav Cuffs
	else if (sceneChoice==6)
	{
		output("You whistle sharply and your GravCuffs fly into the air, quickly snapping around her wrists and slamming her against the wall. She lets out a surprised squeak as she finds herself pressed up against the surface, her breasts squishing to the side as her legs are spread, giving you a perfect view of her wet pussy and delectable asshole.");
		if(!pc.isNude())output("You grin and lick your lips, slipping out of your [pc.gear] and tossing it to the side.");
		output("\n\n<i>“M-[pc.master]? What are you doing?”</i> She asks, quivering with excitement and the arousal of being in such an exposed position in front of her [pc.master]. ");
		output("\n\n<i>“Just hush and wait,”</i> you murmur, stepping closer to her and running a hand over her heart shaped ass. She does exactly that, but her ass sways slightly, as if unconsciously trying to attract you into fucking her silly; not that you need it, anyway. You stick a finger into her pussy, swirling it around. Willow lets out a muffled moan through her lips when you do so, her pussy immediately starting to drip clear lubricant. You add another finger, getting them nice and wet before pulling them out and pressing them to her ass. She immediately tightens up. ");
		if (flags["WILLOW_BUTT_SEXED"]==undefined)
		{
			output("\n\n<i>“[pc.Master], I- I have no experience with bu-butt stuff.”</i> Willow murmurs, looking over her shoulder.");
			output("\n\n<i>“You’re an anal virgin?”</i> You ask, raising an eyebrow. She nods, blushing hard. The thought of claiming this fresh, tight, virgin asshole makes your [pc.cocks] surge with blood, ready to pack her bowels full of cum. You almost jump her right then and there, but you force yourself to wait. Since it’s her first time, you decide to be a little gentle and let her enjoy this.");
		}
		else output("\n\n<i>“My ass again, [pc.master]? You really love my ass, don’t you?”</i> She says cheekily, wiggling her butt.");
		output("\n\n<i>“Relax and let me get my fingers in, will you?”</i> ");
		if (flags["WILLOW_BUTT_SEXED"]==undefined) output("It’s going to feel amazing. I promise.”</i>");
		output(" You say soothingly, your fingers still pressing insistently at her ");
		if (flags["WILLOW_BUTT_SEXED"]==undefined) output("virgin butthole.");
		else output("tight ass.");
		output(" She nods and turns back to the wall, confident that her [pc.master] would never hurt her when it didn’t feel pleasurable as well. Her ass relaxes, just enough to let you get the first knuckle in, before tightening up again.");
		if (flags["WILLOW_BUTT_SEXED"]==undefined) output("\n\n<i>“Suh-sorry [pc.master]! It just feels so... strange!”</i>");
		else output("\n\n<i>“Mm! Oh th-that still feels a little we-weird!”</i>");
		output(" She says, looking over her shoulder once more before loosening up again, letting you push the finger in the rest of the way. ");
		if (flags["WILLOW_BUTT_SEXED"]==undefined) output("She lets out a grunt, unused to feeling things in her ass.");
		else output("She lets out a moan, loving the feeling of her [pc.master]’s fingers thrusting into her asshole.");
		output(" You slowly pull your finger back out, adding the second lubed up finger on the next thrust. She lets out another grunt, trying to adjust to the fingers in her insanely tight ass, her legs shaking. You slowly thrust the fingers in and out of her ass, building up the tempo of finger fucking her. ");
		if (flags["WILLOW_BUTT_SEXED"]==undefined) output("She slowly changes from grunts of discomfort to moans of slight pleasure,");
		else output("She lets out a lewd moan,");
		output(" her ass pushing back slightly against your fingers. Your other hand drops to her pussy, your thumb rubbing circles over her clit while a finger slips into her pussy and rubs her g-spot. This earns a loud moan and a fresh gush of lubricant.");
		output("\n\n");
		if (cIdx >= 0)
		{
		 	output("You slide your [pc.biggestCock] under the dripping stream, getting it lubed up for the imminent ass fucking. ");
		}
		if (flags["WILLOW_BUTT_SEXED"]==undefined)
		{
			 output("<i>“[pc.Master], I-I think you can try s-sticking your ");
			if (cIdx >= 0) output("[pc.biggestCock]");
			else output("[pc.hardlightCock]");
			output(" in my ass now.”</i>");
		}
		else output("<i>“[pc.Master], please go ahead and s-stick it in my ass n-now!”</i>");
		output("Willow murmurs, giving her hips a shake.");
		output("\n\n<i>“Oh? When did ");
		if (flags["WILLOW_BUTT_SEXED"]==undefined) output("the virgin become an expert?”</i>");
		else output("you become such a buttslut?”</i>");
		output(" You say in a mocking voice. She blushes and returns to facing the wall. You grin and step back, lining up your ");
		if (cIdx >= 0) output("[pc.biggestCock]");
		else output("[pc.hardlightCock]");
		output(" with her asshole and pushing in. She whimpers as she feels your tip slip past her sphincter and immediately tightens up. You sigh in irritation before leaning forward and grabbing one of her breasts with one hand, the other going down to play with her clit, trying to override the pain she is feeling. This earns a pleased moan and a slight loosening of her asshole. You take the advantage and push in deeper. Her ass is vice tight and hot as an oven! You can feel the beat of her heart pounding through her anal walls as they squeeze around your ");
		if (cIdx >= 0) output("[pc.biggestCock].");
		else output("[pc.hardlightCock].");
		output("\n\nBut you haven’t bottomed out yet. You continue to push in slowly, fighting for every inch. Willow groans as you bury your ");
		if (cIdx >= 0) output("[pc.biggestCock]");
		else output("[pc.hardlightCock]");
		output(" in her ass, trying to keep herself as loosened up as possible. After almost a full two minutes of fighting her ");
		if (flags["WILLOW_BUTT_SEXED"]==undefined) output("virginally");
		else output("still almost virginally");
		output (" tight ass and the urge to just ram home, you finally bottom out in her spasming ass.");
		if (flags["WILLOW_BUTT_SEXED"]==undefined) output(" You have claimed her anal virginity!");
		output("\n\nWillow shudders and groans as she feels your full length buried in her ass. <i>“Oh god! I can f-feel every inch of it! W-why is my ass s-so sensitiiive!?”</i> She squeaks, panting with the exertion of trying to keep her ass loose enough for her [pc.master] to fuck her properly.");
		output("\n\n<i>“Don’t know, but that just means you’re going to enjoy this a lot more than others,”</i> you say, rubbing her butt. You stay still for a few minutes, letting her adjust, before you slowly draw back, until just the tip of your ");
		if (cIdx >= 0) output("[pc.biggestCock]");
		else output("[pc.hardlightCock]");
		output(" is spreading her asshole open. You then drive in with one long slow thrust, bottoming out in one go before repeating it; Willow letting out ragged gasps as you slowly fuck her ass. You deliver a sharp spank to her ass while you’re pulling out and she gasps and tightens up hard around your dick. You push in, then spank her ass while pulling back out, setting up a rhythm, alternating each cheek.");
		output("\n\n<i>“Oh god yes! Fuck my ass [pc.master]! Fuck it raw ");
		if (cIdx >= 0)output("and fill it with your seed!");
		output("”</i> She screams, thrusting her ass back against you. You pick up the pace a little, thrusting into her at a more normal pace. With her increased sensitivity, she’s practically in heaven right now, moaning loudly in bliss, her head lolling back as her tongue hangs out of her mouth. ");
		if (flags["WILLOW_BUTT_SEXED"]!=undefined) 
		{
			output("You know she’s had enough experience with butt stuff now to really take a rough pounding. You go even faster, rutting her ass like a [pc.manWoman] possessed. She squeals loudly, her ass easily able to accommodate your ");
			if (cIdx >= 0) output("[pc.biggestCock]. ");
			else output("[pc.hardlightCock]. ");
		}
		output("You continue spanking her ass, her anal walls squirming tight around you with every slap, almost seeming to milk you.");
		if (cIdx >= 0)
		{
			output(" It isn’t long before you feel the urge to cum rising,");
		 	if (pc.balls>0)output(" your balls throbbing with need,");
			if (knot || knots)output(" your knot swelling,");
			output(" as you get closer and closer to an orgasm. With a growl, you hilt yourself in her tight asshole,"); 
			if (knot || knots)output(" spearing your knot into her, stretching her wide and");
			output(" eliciting a loud scream of pleasure as you finally cum, streams of [pc.cumType] pumping into her bowels, bloating her stomach. She cums when she feels your [pc.cumType] rushing into her, moaning and spraying girlcum over your [pc.lowerBody].");
		} 
		else
		{
			output(" With a roar, you grab her tail and piston into her ass a few more times before you orgasm as well. Unfortunately, you don’t have a real cock, so all you can really experience is the "); 
			if (pc.hasVagina()) output("intense rush of pleasure as you spray your own femcum across her floor.");
			else output("intense rush of dampened pleasure to organs that are no longer there.");
		}
		output("\n\nYou both pant as you come down from your orgasm highs. After a few seconds you unlock the cuffs and pick up her trembling body, gently laying her down on the bed. <i>“I think- I think I like it when you fuck my ass, [pc.master]");
		if (cIdx >= 0)output(",”</i> she says as she rubs her belly. <i>“So full and warm...”</i> She murmurs, rubbing her head back against you.");
		else output(".”</i>");
		output(" You grin and kiss her forehead.");
 		output("\n\n<i>“Told you so,”</i> you murmur back, hugging her soft, warm body close as you both drift off to sleep. ");
 		if (cIdx >= 0)
 		{
 			output("You awaken an hour or so later, your dick "); 
 			if (knot || knots)output("and knot");
 			output("having deflated,and fallen out on its own.");
 		}
 		output("Willow lies there with her eyes half closed, staring at your face.");
		output("\n\n<i>“You’re so cute when you sleep, [pc.master],”</i> she says, giggling and poking your nose. You roll your eyes and get out of bed");
		if(!pc.isNude())output(", putting your [pc.gear] back on");
		output(". You leave the apartment, waving, Willow blowing you a kiss as you walk out.");
		
		IncrementFlag("WILLOW_BUTT_SEXED");
	}
	
	//Anal Bed Grav Cuffs
	else if (sceneChoice==7)
	{
		output("Without a word, you whistle and your GravCuffs fly into the air, locking around her wrists and ankles. She lets out a little <i>“eep!”</i> as they slowly rotate before pinning her down to the bed, her face down and ass up. Tail swishing helplessly in the air, her pussy and asshole are exposed as her legs are spread. She looks over her shoulder. <i>“M-[pc.master]? What are you do-ah!”</i> She’s interrupted as you suddenly spank her upraised ass.");
 		output("\n\n<i>“Quiet. I’m going to fuck your ass,”</i> you say, getting on the bed behind her and grabbing her soft cheeks, spreading them wide.");
		output("\n\n<i>“O-oh. I’ll just u-um- ah!”</i> She’s interrupted by another spank.");
		output("\n\n<i>“You’re going to lie there and take it!”</i> You growl, noticing how wet her pussy is getting from being treated like this.");
		output("\n\n<i>“Y-yes, [pc.master],”</i> she murmurs. You grab her ass and run your hands over her soft round buttocks, kneading her plush ass. She lets out a pleased coo at that, looking over her shoulder. <i>“You really like my ass, don’t you, [pc.master]?”</i> She says with a coy look.");
		output("\n\n<i>“That should be obvious already,”</i> you say, slapping her ass again, this time getting a kinky moan. ");
		if(!pc.isNude())output("You step back for a moment as you take off your [pc.gear] and toss it to the side before getting back on the bed behind her, y");
		else output("Y");
		output("our [pc.cocks] hard and ready. You rub ");
		if (cIdx2 >= 0)output("them");
		else output("it"); 
		output("back and forth under her dripping pussy, getting ");
		if (cIdx2 >= 0)output("them");
		else output("it");
		output(" nice and lubed up before pressing one into her tight backdoor. With a single long, slow thrust, you sink to the hilt. She lets out a loud, drawn out moan as you drive in, her ass spasming and twitching around your length as her back arches, trying to ease the penetration; but the bonds prevent her from going much further. She shakes and shudders when you finally stop, her anal walls rippling around your ");
		if (cIdx >= 0) output("[pc.biggestCock]");
		else output("[pc.hardlightCock]");
		output(" as she tries to adjust.");
 		output("\n\nYou wait for a moment, giving her a breather before you slowly draw back out, earning another round of shaking and loud moaning from your beta. You pause when you’re almost out of her ass, just your [pc.cockHead] spreading her asshole, before you slam back in, in one hard thrust, making her scream in pleasure. Her spasming anal walls start wrapping tight around her [pc.master]’s cock, wringing it for it’s cum. You grit your teeth and fight your rising orgasm, trying not to orgasm so soon. Again, you slowly draw out before slamming back in, the slow slapping of your hips reverberating off the walls.");
 		output("\n\nShe moans lewdly, her tongue hanging out as you ream her ass, eyes rolled halfway back. She suddenly shudders and clear girlcum shoots out from between her legs, most of it getting on your [pc.lowerBody]. You grin and spank her ass, making her squeak and tighten up. <i>“Such a naughty girl... cumming before your [pc.master]. I’ll just have to punish you for that!”</i> You say, picking up the pace as you alternate between slapping her ass and hammering into her tight hole. She moans and goes limp, letting you have your way with her. A constant stream of moans, both muffled and loud, pour out of her mouth with every thrust into her abused asshole.");
		output("\n\nYou lean forwards and grab her breasts, the new position letting you get even deeper into her ass than before. You use her breasts as leverage, roughly squeezing and groping the flesh with every thrust. She lets out a cute gasp as you play with her breasts, looking back over her shoulder at you with lust filled eyes as you rail her ass. You bend your neck down and possessively bite her neck, making her gasp again as your teeth meet her skin. She starts thrusting her ass back against you, meeting your thrusts midway, throwing her head back and moaning openly.");
		output("\n\nAfter a few more minutes of hard fucking, you feel your orgasm start to peak, ");
		if (knot || knots)output("your knot starting to swell, ");
		output("and you ram into her ass even faster. ");
		if (cIdx >= 0)
		{
			output("<i>“You’re going to cum, aren’t you, [pc.master]? Cum! Please fill my ass with your warm [pc.cumType]! Stuff me full!”</i> She says, looking over her shoulder at you. With an invitation like that, you can hardly refuse. You grab her tail and hilt in her ass, ");
			if (knot || knots)output("burying your knot in as well, earning a loud scream of pleasure and ");
			output("groaning as your orgasm finally boils over, ropes of [pc.cumType] shooting into her."); 
			if (pc.cumQ() >= 3000) output("The sheer volume of your cum makes her stomach bloat out");
			if (pc.cumQ() >= 5000) output("and she looks ready to pop out twins!");
			else(".");
			output("She groans and goes limp again, letting you fill her up. Groaning, you finish and start unlocking the cuffs. Once that is done you roll the both of you to the side, with her back to yours. She coos happily as she rubs her swollen belly.");
		}
		else
		{
			output("With a grunt, you grab her tail and hilt yourself deep in her ass before you orgasm as well. Unfortunately, you don’t have a real cock, so all you can really experience is the intense rush of ");
			if (pc.hasVagina()) output("pleasure as you spray your own femcum across her mattress."); 
			else output("dampened pleasure to organs that are no longer there.");
		}
		output("\n\n<i>“So nice and warm...”</i> She murmurs, snuggling closer to you. You wrap an arm around her and pull her even closer, your [pc.chest] pressing into her back. She rubs her head against your chin, her horns a little too close to your face for comfort. You duck your head slightly so as not to hit them and kiss her neck. She giggles and kisses you back, the kiss evolving from a friendly peck to a deep, loving kiss; her tongue slipping out to twine around yours. She reluctantly pulls away and kisses your cheek. <i>“Goodnight, [pc.master],”</i> she murmurs, her head falling to the pillow. She is asleep in minutes, her deep, even breathing soothing you. You, too, fall asleep beside her.");
		output("\n\nYou wake a few hours later and find Willow still curled up next to you. During the night, she shifted around and is now facing you. She is sleeping on her hands, her hair falling across her face as she smiles slightly, dreaming about something happy. You smile a bit too, not wanting to move and disturb the cute little succubus. However, it isn’t long before she wakes, blinking the sleep out of her eyes. As soon as they lock onto you the smile on her face grows even wider. She leans over and plants a kiss on your lips. <i>“Last night was amazing, [pc.master]. As always!”</i> She murmurs, nuzzling your cheek.");
		output("\n\nYou kiss her back and wink. <i>“I aim to please, my little slut. I’m pretty sure we kept the neighbours up last night...”</i> You murmur, grinning. She giggles again and reaches down under the covers to poke your [pc.cocks].");
		output("\n\n<i>“Not surprising. You’ve got the best");
		if (cIdx2 >= 0)output(" dicks");
		else output(" dick");
		output(" around, [pc.master]!”</i> She says. <i>“Not to mention you’re horny almost all the time,”</i> she adds.");
		output("\n\nYou chuckle and roll out of the bed");
		if(!pc.isNude())output(", putting your [pc.gear] back on");
		output(". Willow watches you with a smile all the while, her tail flicking in the air. She blows you a kiss as you leave and you catch it, pressing it to your chest before you close the door and walk down and out of the building.");
	
		IncrementFlag("WILLOW_BUTT_SEXED");
	}
	
	//Double Penetration No Cuffs
	else if (sceneChoice==8)
	{
		output("You look over your subby demon slut’s curvy body, your eyes settling on her ass. You just can’t decide... Fuck her incredibly tight ass or fuck her amazing pussy? Well... You look down at your [pc.lowerBody]. If you’ve already got the tools, why not do the job? You grin and walk up to her, pushing her down onto the bed. She lets out an ‘oof!’ Before sitting up and making a pouty face at you. <i>“Why so rude, [pc.master]? All you had to do was ask!”</i> She says, sticking her tongue out at you. Raising an eyebrow you walk to her, pushing her down onto her back before climbing onto her and straddling her waist, pinning her down under your weight");
		if(!pc.isNude())output(" as you start stripping off your [pc.gear]");
		output(".");
		output("\n\n<i>“Last I checked, slaves don’t get to order their [pc.master]s around. They are supposed to roll over when the [pc.master] says roll over, bend over when the [pc.master] says bend over and beg for a dick when the [pc.master] says beg for a dick,”</i> you say, leering at her as you lean down to grab her breasts. She lets out a little coo as you start playing with them, twisting the nipples and groping the soft red flesh.");
		output("\n\n<i>“Mm! I’m s-sorry, [pc.master]. Please forgive me!”</i> She says, giggling as she pokes your nose. Hmm. It seems she still doesn’t take you all that seriously... Time to show her who’s the boss around here.");
		output("\n\nYou grab her around the waist and flip her over. <i>“Hmm... you’re going to have to beg me better than that,”</i> you growl into her ear. She lets out a little squeak of either excitement or fear, maybe both. You can’t really tell and don’t really care. Her ass is wriggling, trying to get you aroused enough to fuck her silly. You roll your eyes and give her two hard spanks across the cheeks. She lets out a loud gasp and jerks forward, the force of the blows sending ripples through her ass. You can hear her panting and smell the arousal in the air. Her ass and pussy look so inviting from this angle, twitching as they eagerly wait for your [pc.cocks]. You flop your lengths onto her ass, rubbing them back and forth between her butt cleavage.");
		output("\n\nShe coos as she feels your [pc.cocks] rub back and forth. <i>“[pc.master], ple- please fuck your little slave!”</i> She whines, swaying her hips back and forth.");
		output("\n\nThat simply won’t do. You let loose another stinging slap to her ass and she jerks forward. <i>“That’s not good enough,”</i> you say. Then, you lean forward and growl into her ear. <i>“I want you to beg for it. Really beg for it!”</i>");
		output("\n\nShe gulps. <i>“M-[pc.master], I-I want your [pc.biggestCock]! I wuh-want them to- to stuff me full, f-fuck me silly and then bloat me with your [pc.cumType]! Please, [pc.master], just fuck meeee!”</i> She wails. You smile and nod appreciatively.");
		output("\n\n<i>“Now that’s the way to beg for your [pc.master]’s [pc.cocks]! Now I’m going to reward you with them!”</i> You say, grinning. You rear back and spread her cheeks, thumbing her asshole as you do so, stretching it out just a little to prepare it for the imminent fucking. Then, you run one of your [pc.cocks] under her dripping pussy to get it lubed up, grinding against her clit. This makes her moan, quite lewdly. Once your appendages are lubed up, you press both to her holes. With a grunt, you slowly start sinking yourself in. Willow throws her head back and lets loose a loud, sexy, very drawn out moan as you slowly feed your [pc.cocks] into her. Soon her asshole and pussy start contracting and rippling around you, helping to pull you in.");
		output("\n\n<i>“What lewd holes you have, my little fucktoy, so eager to suck me in!”</i> You say after you’ve finally bottomed out inside her hot body. Her holes are so tight! You can feel every beat of her heart pulse through her anal walls, while her pussy feels like a warm, wet oven; you could just melt in there!");
		output("\n\n<i>“Aaah! Oh god... [pc.master], my holes belong to you forever! I feel so full with your [pc.cocks] in me.”</i> She babbles happily. You grin and slowly draw back, earning more lewd moans from your subby demon slut. <i>“M-[pc.master] please just fuck me! Use me like your t-toy!”</i> She squeals, with just the tips of your [pc.cocks]spreading her holes open. With an invitation like that, you can hardly refuse. With a grunt, you drive your [pc.cocks] into her. <i>“Oh god fuck yeeeeessss!”</i> She screams, her tongue hanging out of her mouth as you ram into her tight holes. Without giving her time to rest, you set up a rough pounding tempo, your hips slapping hard into her delicious ass as you fuck her. A stream of pleasured grunts, groans and moans fall from your beta’s mouth as you rail her holes. Your hand wraps around her tail, using it as leverage as you slam into her. She lets out a little squeak each time her tail is pulled and her holes tighten up around your [pc.cocks]. Ooh. Now that feels nice! You give her tail another rough yank as you lean over her body to get in even deeper, continuing to ram your cocks into her. She continues to squeak and her holes tighten up again, spasming wonderfully around your [pc.cocks]. With your other hand, you press her down further into the bed, her soft breasts squishing out to the sides. She lets out a little mewl as she is forced into such a submissive position, loving every moment of it. You pick up the pace, thrusting faster into her holes; wet squelching noises issuing from them as they try and fail to keep your [pc.cocks] in.");
		output("\n\nWith a girly scream, Willow suddenly cums, her holes tightening up and spasming around your lengths as girlcum squirts over your thighs. You grin and ram into her even faster, using her cum as fresh lubricant. She lets out a high pitched moan as her still-sensitive walls continue to be fucked. You can feel your own orgasm approaching ");
		if(knot)
		{
			output("your knot");
			if(knots)output("s");
			output(" starting to swell,");
			
		} 
		output("and you go even faster, loud moans and slaps echoing around the room as you brutally fuck her tight holes. With a loud grunt, you finally hilt deep inside her ");
		if(knot)
		{
			output(", eliciting a scream of pleasure as your knot");
			if(knots)output("s stretch");
			else output("stretches");
			output(" her wide,");
		} 		
		output("and cum, blasting rope after rope of [pc.cumType] into her pussy and bowels. ");
		if (pc.cumQ() >= 4000) output(" Your prodigious load bloats her belly until she ends up looking at least five months pregnant! ");
		output("Your orgasm sets off another one of hers, causing her to let out another scream. A mixture of your cum and hers starts squirting out from the pressure, creating a wet pool on the bed. She limply flops forward, panting as she winds down from the intense sex.");
		output("\n\nYou lie down next to her, pulling her soft, warm body close to yours. <i>“So... Learned your lesson, my little slut?”</i> You murmur into her ear. She gives a weak nod and almost immediately passes out. You chuckle and wrap your arms tightly around her, kissing her cheek before you, too, fall asleep; the comforting warmth if your lover making it all the more easy.");
		output("\n\nWhen you wake Willow isnt there. You quickly sit up and look around, before the smell of fresh food assails your nostrils. Damn that smells good. Your stomach rumbles in agreement. You look over to the stove, where you see a naked Willow humming as she cooks something. Smells like pancakes! You quietly get out of bed and sneak up behind her, before wrapping her in a tight hug. She gives a little squeal and a giggle as you grab her from behind. <i>“Good morning [pc.master]! I hope you like pancakes!”</i> She says, smiling as she tosses another pancake onto an already sizable stack. She sets the pan aside and turns around in your arms, her breasts pressing up against your [pc.chest]. She ");
		if (pc.tallness >=72) output("stands on her tiptoes"); 
		else output("bends over");
		output(" and kisses you on the lips before taking the plate of pancakes and walking over to the table, her hips swaying the whole way. You follow, sit down opposite her and dig in. <i>“Woah. These are amazing!”</i> You say, as you stuff your mouth full of them.");
		output("\n\n<i>“Of course they are. I made them!”</i> She says, giggling and poking your cheek. She eats a few too and before long, the two of you are sated. You rub your full belly before getting up and kissing her cheek. <i>“Well, I gotta go, doll. Catch you later!”</i> You say,");
		if(!pc.isNude())output(" putting your [pc.gear] back on and rushing out the door,");
		output(" catching a blown kiss from Willow as you do so.");
	
		IncrementFlag("WILLOW_DBLPEN");
	}
	
	//Double Penetration Grav Cuffs
	else if (sceneChoice==9)
	{
		output("You whistle and your GravCuffs fly into the air, hovering around Willow like menacing sentries. <i>“Er... What are you going to do, [pc.master]?”</i> She asks a little apprehensively, eyes fixed on the GravCuffs. You grin and snap your fingers, causing the cuffs to immediately lock around her wrists and ankles. As she is lifted into the air she lets out a little ‘eep!’");
		output("\n\n<i>“Hmm... Now what shall I do with my naughty little pet...?”</i> You murmur, smiling as you walk around the suspended slave. <i>“Maybe this?”</i> You align your GravCuffs so that her legs are spread to the sides while her hands are bound above her head. <i>“Hmm, maybe another time. Maybe this?”</i> You change their location, bending her arms and legs back so it looks like she is being hung from the ceiling by her wrists and ankles; which has the wonderful added effect of squeezing her buttcheeks upwards. <i>“Yes, I believe this shall do...”</i> You murmur, walking in a circle around her and spanking her ass when you return to your original position.");
		output("\n\nWillow lets out a little groan at that, a single drop falling from her pussy. You step closer and draw your finger through the lips of her labia, earning another little moan and put the wet digit in your mouth before sucking on it a little. Eh? She tastes vaguely like vanilla! She must sense your surprise, because she turns her head to you (well, as much as she can given her position) and says; <i>“Ah yeah. Should have told you about that, [pc.master]. Um... The transformatives I took made me like this!”</i> She giggles and wiggles her butt at you. <i>“Go ahead and have another taste!”</i>");
		output("\n\n<i>“Don’t mind if I do!”</i> You say before bending down to her ass and spreading her cheeks apart, exposing her dripping, tasty pussy. You lean forwards and take a long, slow lick, your tongue teasing at the entrance to her vagina. She moans and shivers and you feel her vaginal walls twitching, like they were trying to pull a cock in. You spank her ass, making her gasp. <i>“Naughty girl! Such a lewd pussy you have, always needy for a cock!”</i> You say with a chuckle.");
		output("\n\n<i>“Wh-what? No! N-not always! Just-”</i> She quickly shuts up. You raise an eyebrow and take another long, slow lick, enjoying the taste of vanilla dripping from her vagina.");
		output("\n\n<i>“Juuust...?”</i> You say, gripping her butt and digging both your thumbs into her asshole. She lets out a squeak as her anus is so suddenly toyed with, but doesn’t reply. Looks like she’s going to need a bit of punishment to set her straight! You start to lick and tease her clit with your tongue while thrusting your thumbs in and out of her asshole. Her thighs twitch around you as she starts moaning and groaning in pleasure. You continue this treatment until you feel her orgasm approaching, then suddenly stop. She mewls in frustration and looks over her shoulder.");
		output("\n\n<i>“" + pc.mf("Masteeerrr!", "Mistreeess!") + "I’m so close! Just a little longer! Please!”</i> She whines.");
		output("\n\n<i>“Not until you tell me what you were about to say!”</i> You say, grinning at her. She shakes her head and turns away, her hair bouncing as she does so. You wait until she winds down from her near-orgasm before you resume the teasing, building her closer and closer to her orgasm but never letting her pop. It doesn’t take long and by the fourth denied orgasm, she finally screams in frustration.");
		output("\n\n<i>“Yours! I was about to say just yours, okay!? My pussy is always needy for your ");
		if (cIdx2 >= 0) output("[pc.cocks]");
		else output("[pc.cock " + cIdx + "] and [pc.tailCock]");
		output(". Now please stop teasing me and fuck me [pc.master]! Please!”</i> She yells.");
		output("\n\n<i>“Well why didn’t you say so earlier?”</i> You say with a grin, chuckling as you stand and pat her ass. <i>“A good slave needs to be rewarded for being so in love with her [pc.master]’s cock!”</i> You say");
		if(!pc.isNude())output(" as you take off your [pc.gear] and toss it to the side");
		output(", letting your [pc.cocks] flop onto her ass. Thanks to your teasing earlier she’s already wet and ready for you, so without much further ado you peel her cheeks apart and ram your dicks right in. She lets out a scream of pleasure and immediately cums when your [pc.cocks] suddenly fill her ass and pussy. Her walls clamp down tight on your lengths, spasming as she sprays vanilla girlcum all over your thighs. You wait till she has calmed down and is softly panting from her orgasm before you start moving, slowly grinding your cocks in and out of her holes. She groans as her sensitive holes are rubbed by your [pc.cocks] and she squeezes down on your lengths again, moaning as you slowly thrust in and out of her.");
		output("\n\n<i>“M-[pc.master]- Please- More! I need more!”</i> She groans, trying to thrust her hips back against you, urging you to pick up the pace. You slow down and chuckle as your [pc.cocks] move slow enough to give a turtle a run for its money. Willow whines in frustration. ");
		output("\n\n<i>“" + pc.mf("Masteeerrr!", "Mistreeess!") + "Pleaaaase!”</i> She begs, squirming around in her bonds.");
		output("\n\n<i>“Since when do you give the orders around here, hmm pet? Are you the slave or are you the mistress?”</i> You ask, teasing her as you insert a thumb into her ass alongside your [pc.cocks], stretching her out even more.");
		output("\n\n<i>“Aaah! Mm! I’m sorry [pc.master]!”</i> She moans, her ass squeezing down a little on your intruding digit. You shake your head and chuckle before you start moving again, driving into her harder and faster than before. She moans loudly, in a bliss that only being filled with her favourite cocks can bring and her holes tightening up again. You give her ass a hard slap before you pick up the pace, making her gasp loudly, her mouth falling open into a perfect ‘O’ shape. <i>“Oh! Fuck! Aah! So good! Yes!”</i> She moans as you ram into her tight holes, which start squeezing harder in return.");
		output("\n\nYou grab her hips and use them as leverage, slamming her body back against your own with every thrust. You feel your orgasm building up,");
		if(knot)
		{
			output(" your knot");
			if(knots)output("s");
			output(" starting to swell up,");
		} 
		output(" your [pc.balls] starting to churn, ready to pump this subby little bitch full of [pc.cumType]. With a roar, you grab her tail and yank it, making her squeal loudly as you slam into her one last time."); 
		if(knot)
		{
			output(" Your swollen knot");
			if(knots)output("s stretch");
			else output(" stretches");
			output(" her wide open, causing Willow to scream in pain and pleasure as she is stretched to her limit,");
		}
		output(" Your orgasm finally boils over, [pc.cumColor] ropes of [pc.cumType] spilling into her pussy and ass; which squeeze down tighter, milking you for more of your [pc.cumType]. She herself has an orgasm, her girlcum squirting over your [pc.lowerBody]. "); 
		if (pc.cumQ() >= 4000) output(" Your cum bloats her belly, making her look heavily pregnant. ");
		output("Panting, you deactivate the GravCuffs and hold Willow’s limp body in your arms. Walking over to the bed with your dicks still inside her, you flop over onto the bed, letting her rest atop you.");
		output("\n\n<i>“Mm... that was... more intense than usual, [pc.master].”</i> She murmurs, tilting her head up to kiss your cheek.");
		output("\n\n<i>“Isn’t it always intense when it’s with me?”</i> You ask, raising an eyebrow and grinning as you run your hands through her wavy hair, before tilting her head up to kiss her lips. She gives a happy little purr as she leans into the kiss, her long tongue coming out to play with your [pc.tongue], wrapping and twirling over it as she kisses you passionately. You hug her tighter, closing your eyes as you make out with Willow. After a full minute of kissing, she pulls back and plants a last, chaste kiss on your [pc.lips] before laying her head down on your [pc.chest].");
		output("\n\n<i>“Goodnight, [pc.master].”</i> She murmurs, her hands resting on your chest.");
		output("\n\n<i>“Goodnight,”</i> You whisper back, before drifting off to sleep.");
		output("\n\nYou awake the next morning, with Willow missing. You sit up and look around a little anxiously, but don’t have to wait long as she walks out of the bathroom in a minute, her belly flat again. <i>“Oh! Good morning [pc.master]! I hope you didn’t miss this lovely body for too long?”</i> She asks, grinning. You roll your eyes and then hoist yourself out of the bed, before walking up to her and kissing her neck. She tilts her head to let you get at her neck more easily, purring a little lustily as you nibble at her.");
		output("\n\n<i>“Sorry love, but as much as I’d love to stay... I gotta go.”</i> You murmur, your hand traveling down Willow’s back and giving her lovely rump a squeeze.");
		output("\n\n<i>“Ooh! Well go on, then, you crazy, brave, sexy planetary explorer!”</i> She says, giggling and poking your nose. You chuckle and turn away before ");
		if(!pc.isNude())output("putting your [pc.gear] back on and ");
		output("heading out, catching a blown kiss from Willow.");
	
		IncrementFlag("WILLOW_DBLPEN");
	}
	
	////Double Vag Penetration No Cuffs
	else if (sceneChoice==10)
	{
		output("You walk up to Willow and wrap your arms around her waist, pulling her close as you kiss her, your tongue slipping into her mouth. She lets out a cute little ‘ooh!’ Then a happy purr when you kiss her before wraping her arms around your neck, kissing you back. Her tongue is quite long and she proves it quickly enough, by wrapping it around yours like a cocoon as she winks at you. Smirking a little, you drop your hand into her pants from behind, searching for her pussy. She gasps when your fingers find it and you thrust three fingers in, while your thumb rubs in slow circles over her clit.");
		output("\n\nHer body shivers with pleasure at her [pc.master]’s touch and she moans into the kiss, hugging you tighter. Then, without a word, you break the kiss and push her back onto the bed. She lands with a little ‘oof!’ Pouting, she crosses her arms under her breasts. <i>“It was going so romantically!”</i> She whines, sticking her tongue out at you. You roll your eyes");
		if(!pc.isNude())output(" and strip naked, tossing your [pc.gear] to the side");
		output(" before hopping onto the bed. Pushing Willow over you start pinning her down by her wrists. She lets out a tiny gasp, her chest heaving a little as her breath quickens, her eyes meeting yours.");
		output("\n\n<i>“So... [pc.master]...As always... I’m yours... So wh-what are you going to d-do with your subby little sl-slut?”</i> She stammers. Just the mere fact that you’re this close to her is making her nervous.");
		output("\n\n<i>“Hmm... I think I’ll test out just how much that pussy of yours can take...”</i> You murmur, grinding your already hard [pc.cocks] against her moist slit. She lets out a breathy little moan and lifts her hips a bit, grinding back against you.");
		output("\n\n<i>“S-so, you’re saying you wanna shove ");
		if (cIdx2 >= 0)output("b-both of those [pc.cocks]");
		else output("that [pc.cock " + cIdx + "] and [pc.tailCock]");
		output(" into my t-tiny, tight pussy?”</i> She asks, wrapping her arms around your neck as she continues to grind against you.");
		output("\n\nYou practically tear her clothes off before replying. <i>“Yep. That’s exactly what I’m saying...”</i> Pressing your [pc.biggestCock] to her dripping wet pussy, you can smell her arousal in the air. It spurs you on to slam the rest of your length in, eliciting a lusty moan from Willow as you stretch her wide open. You let it sit for a moment before starting a slow back and forth motion, rolling your hips as you bend your head to suck on one of her nipples. Moaning, she throws her head back, her walls squeezing tight around your [pc.cocks] as you grind it slowly in and out of her tight love canal. Your "+ cock1 +" grinds against her clit, stimulating her even further. Knowing how much of a buttslut she is, your hand moves down from her wrist and wriggles under her back. Eventually, you find your way to her asshole and force three of your fingers in. Her back arches as she gasps loudly at the penetration, moaning at your subsequent thrusting, her pussy spasming around your [pc.biggestCock]. You keep up this treatment for a few minutes, grinding back and forth slowly as you finger her ass, before you decide it is time for the main course.");
		output("\n\nYou line your "+ cock1 +" with her dripping pussy and slowly start pushing it in, careful to go slow lest you hurt her. She grunts in discomfort at the initial penetration, but soon moans like a whore, her toes curling against the bedsheets as you sink the rest of your "+ cock1 +" into her hole. It’s a rather tight fit, of course, what with there being two cocks in one hole, but Willow doesn’t seem to mind. She is babbling incoherently as her vagina clamps down like a vice around your [pc.cocks], milking them for their cum. You rest for a minute, more to fight off your own orgasm than to let her adjust, before you start moving again. You maintain a slow pace at first and Willow’s tongue lolls out of her mouth, her eyes rolling back into her head when you start to move again. You continue the slow grinding, gyrating your hips a little to try and get her dripping wet pussy to loosen up a little. She pants and moans like a bitch in heat at the sensation of being stretched to capacity as two dicks fill her tight pussy.");
		output("\n\nYour ministrations pay off and she relaxes a bit more, letting you pick up the pace. You slam into her, mashing your pelvises together faster and harder. She lets out strangled moans and gasps as your ");
		if (cIdx2 >= 0)output("[pc.cocks]");
		else output("[pc.cock " + cIdx + "] and [pc.tailCock]");
		output(" hit her cervix with every thrust, her mind going blank with pleasure. <i>“Yes! Yes! Fuck me [pc.master]! Harder! Ah! Fuck! Yes! Your ");
		if (cIdx2 >= 0)output("[pc.cocks]");
		else output("[pc.cock " + cIdx + "] and [pc.tailCock]");
		output(" feel so good inside me!”</i> Willow screams, bucking her hips against you, her already tight pussy clamping down even harder.");
		output("\n\nYou groan and start fucking her even harder, your hips a blur of motion as you piston into her vagina. Her legs lock around your [pc.hips], keeping you there as you rut your little beta like an animal. Your hand goes down from her other wrist and grabs at her breast, squeezing it and flicking the nipple. Your other hand is still hard at work, roughly thrusting three fingers into her ass. Her moans hit a higher pitch and you feel her body start to tense up in preparation for a massive orgasm. You help it along of course, by bending your head down and kissing her, your tongue worming its way into her mouth.");
		output("\n\nAs you predicted, this pushes her over the edge and she explodes into another orgasm, her eyes rolling back into her head as she screams in pleasure, squirting her cum all over your [pc.legs], her pussy tightening up even further as it wrings your ");
		if (cIdx2 >= 0)output("[pc.cocks]");
		else output("[pc.cock " + cIdx + "] and [pc.tailCock]");
		output(" for their cum. You growl in pleasure at the almost painful tightness and slam into her a few more times before blowing your load, deep. She moans loudly and creams herself again as she feels your [pc.cumType] flow into her womb. "); 
		if (pc.cumQ() >= 4000) output(" bloating her stomach and giving her a large, jiggly cum gut.");
		output("\n\nWith a groan, you slowly lay down atop her. <i>“That... was intense.”</i> You say, panting as you wind down from your orgasm.");
		output("\n\n<i>“The f-feeling is mutual, m-[pc.master].”</i> Willow murmurs, stroking your [pc.hair], her legs still locked around you. You gently reach back and pry her legs apart, chuckling as you roll to the side, letting the two of you lie side by side, facing each other. Willow reaches out to tenderly stroke your face. <i>“[pc.Master]... my [pc.master]...”</i> She murmurs, smiling softly as she rubs her thumb in circles over your cheek. You smile and snuggle closer, nuzzling into her. She purrs and hugs you, her head resting on your arms as she drifts off to sleep. You look down at her moment before planting a kiss on her forehead and going to sleep as well.");
		output("\n\nYou wake to the smell of cooking food and immediately sit up as your stomach gives out a loud growl. <i>“Good morning, hungry stomach!”</i> A voice at the stove says. You look to see a naked Willow flipping an omelette onto a plate before walking over with a glass of water. <i>“Breakfast in bed! Hope you like it, [pc.master]!”</i> She says, setting the plate and glass down in front of you. You reach for the omelette and almost dig in, when you realize Willow hasn’t cooked up anything for herself. You look to the food and then to her, as if asking her whether she has eaten. <i>“Oh no, [pc.master]. I couldn’t- Ack!”</i> She yelps as you suddenly reach over and pull her into your lap. <i>“M-[pc.master], what are you doing?”</i> She asks in confusion, but still smiling as you reach forward and grab a knife and fork.");
		output("\n\n<i>“What does it look like? I’m feeding my little slut!”</i> You say, chuckling and slicing apart a piece of the omelette. You take the first bite and bite into the cheesiest, most flavourful, most delicious omelette you’ve ever eaten. Your stomach gurgles in pleasure, which makes Willow giggle. Then, you cut the next piece and feed it to her. It continues like that for quite a while, the two of you eating in alternate bites, until the omelette is finally finished. Then, you set the plate aside and sigh happily, hugging Willow’s body to yours. She eagerly snuggles with you, wanting to stay as close to you as she can. Eventually, however, you have to leave. ");
		if(!pc.isNude())output("After putting your [pc.gear] on, ");
		else output("Y");
		output("ou plant a goodbye kiss to her forehead, followed by an ass spank, you leave the room, catching an air kiss with a grin on your face.");

		IncrementFlag("WILLOW_DBLPEN_VAG");
	}
	
	//Double Vag Pen with Cuffs
	else if (sceneChoice==11)
	{
	
		output("You grin at Willow.");
		output("\n\n<i>“Ohhh no. I know that smi- Aiie!”</i> She yelps as she’s interrupted by you whistling for your GravCuffs, which immediately snap around her ankles and wrists before hoisting her into the air. Your grin spreads wider as you walk closer to your bound slave, before planting a little kiss on her nose.");
		output("\n\n<i>“So... What do I do with you today...? Hmm. Decisions!”</i> You say, rotating the cuffs to leave her exposed in various lewd positions. Finally, you settle for keeping her arms bound above her and her legs bent as they are spread to the side.");
		output("\n\n<i>“M-[pc.master]! I f-feel so... so ex-exposed!”</i> Willow says, blushing a darker shade of red.");
		output("\n\n<i>“That’s the whole point of this, my dear,”</i> you chuckle, reaching forward and unbuttoning her jeans. You pull them down before stroking her pussy with your index finger, which makes her coo a little, her pussy dampening almost immediately. <i>“My my. Someone’s a horny little slut...”</i> You murmur, flicking your finger over her clit before dragging it back down through her pussy lips. Using her own juices as lube, you start moving your finger in slow, teasing circles over her asshole, prodding and poking, but never pushing in.");
		output("\n\n<i>“" + pc.mf("Masteeerrr!", "Miiisstreeeess!") +"</i> She whines, her face twisted with arousal and desperation as she wiggles vainly in place, trying to get a little more stimulation from the teasing. You immediately pull your finger back and tut.");
		output("\n\n<i>“Mm-mm. Naughty girls don’t get rewards!”</i> You say, giving your groin a subtle sway as you wink at her. Whimpering, she shuts her mouth. Grinning, you reach forward once more, sliding your finger slowly through her pussy lips before pushing it into her vagina nice and slowly. She moans at that, her walls tightening around your finger as if it was a dick. To be more specific, <i>your</i> dick. You chuckle and thrust your finger in and out of her pussy before adding two more, enjoying the way she moans and how her pussy squeezes your fingers.");
		output("\n\nEventually, you decide the poor girl has had enough and you move closer,");
		if (!pc.isNude())
		{
			output(" shedding your [pc.gear] as you go,");
			output(" letting your ");
			if (cIdx2 >= 0)output("[pc.cocks]");
			else output("[pc.cock " + cIdx + "]");
		}
		output(" swing free. Willow eyes them with lust in her eyes, her mouth parting slightly. You grin and rub your hands over her thighs, before you let your phalluses flop onto her pussy and start grinding back and forth. She moans as they rub over her clit and tries to grind back against you, wanting your dicks in her. Well, eager slaves like her should be rewarded, right?");
		output("\n\nYou lower your hips and thrust your [pc.biggestCock] into her tight hole. She moans loudly and her pussy, already dripping wet from the teasing, starts spasming and sucking your cock in, her walls squeezing your dick like a glove. Moaning, you roughly slam the rest of your length in, making her squeal. You start grinding back and forth, burying your [pc.biggestCock] in her squeezing, wringing pussy, moaning at the sensation of her hot, wet walls sucking you in. You fuck her at a normal pace, slamming in fast and pulling out slowly. She moans with every thrust, looking at you with lusty eyes, her breasts and ass jiggling with the impacts. The mere sight of that face, with her lewd, lusty gaze, is enough to make you want to rut her like an animal and fill her up with cum!");
		output("\n\nBut, you wait. It wouldn’t do to ruin all the fun before the climax... ");
		output("\n\nYou take hold of your ");
		if (cIdx2 >= 0)output("other "+ cock2);
		else output("[pc.tailCock] and slowly line it up with her pussy."); 
		if(flags["WILLOW_DBLVAG_CUFFS"] == undefined)
		{
		 	output("Her eyes go wide. <i>“M-[pc.master]? I- Uh- I’m not sure they’re going to f- fit...”</i> She says, gulping.");
			output("\n\n<i>“Just relax and they will.”</i> You murmur, pressing the tip of your ");
			if (cIdx2 >= 0)output(cock2);
			else output("[pc.tailCock]");
			output(" to her pussy along with the other phallus already there. She nods, taking a deep breath to try and relax as she looks on, her body shivering with anticipation. Your ");
			if (cIdx2 >= 0)output(cock2);
			else output("[pc.tailCock]");
			output(" spreading her entrance wide open and she grunts a little in discomfort, barely managing to fight off the urge to squeeze down on your dicks. Every inch you push inside elicts a shudder and moan from Willow, but eventually you manage to bottom out. The moment you do so, however, her pussy squeezes your dicks so hard you feel like they’re going to pop off!");
			output("\n\n<i>“Ugh! Fuck! Willow! Loosen up!”</i> You grunt, giving her none-too-gentle slaps across her ass as you struggle not to cum.");
			output("\n\n<i>“S-sorry! It’s just- I- I feel so fu-full!”</i> She squeals, panting. But she does manage to loosen up slightly and you breathe a sigh of relief. It would have been awkward explaining to the doctors just how the blood flow to your phallic organs had suddenly been cut off...");
			flags["WILLOW_DBLVAG_CUFFS"] = 1;
		}
		else
		{
			output("\n\nA slow grin spreads across her face. <i>“Again, [pc.master]? You really like feeling my walls squeeze down nice and hard around you as you force your junk into my box, don’t you?”</i> She says, giggling as you groan at her pun.");
			output("\n\nYou shake your head and sink your ");
			if (cIdx2 >= 0)output("[pc.cocks]");
			else output("[pc.cock " + cIdx + "] and [pc.tailCock]");
			output(" into her pussy. She lets out a long, loud, slutty moan as your cocks sink into her and looks at you with eyes glazed over with lust, panting slightly as she looks deeply into your eyes.");
		}
		output("\n\nGiving her a moment to adjust, you slowly start grinding back and forth in short thrusts, which makes her moan a little as you work her vagina out, giving it a nice stretch. You gyrate your hips each time you hilt, loosening her up further so you can really start to pound away at her.");
		output("\n\n<i>“M-[pc.master], p-please-”</i> Willow moans, looking at you with desperation in her eyes. ");
		output("\n\n<i>“Please what...?”</i> You ask, stopping your thrusting to look down at her, a smirk on your face.");
		output("\n\n<i>“[pc.Master], p-please, fuck me harder!”</i> Willow moans.");
		output("\n\n<i>“Mm... Beg for it. I want to hear you begging like a good, slutty little slave.”</i> You growl, pulling back so your ");
		if (cIdx2 >= 0)output("[pc.cocks]");
		else output("Both your dicks");
		output(" are positioned right at the entrance to her pussy, the tips barely spreading her hole open.");
		output("\n\n<i>“Ah! I- I- want your cocks, [pc.master]! I want to feel your ");
		if (cIdx2 >= 0)output("[pc.cocks]");
		else output("[pc.cock " + cIdx + "] and [pc.tailCock]");
		output(" pounding away at my slutty pussy! I want to cum just from your cocks, [pc.master]!”</i> Willow squeals.");
		output("\n\nYou bend down and give her a little kiss on the lips as you huskily whisper into her ear. <i>“Good girl.”</i> With that, you draw back and start slamming into her hard and fast.");
		output("\n\nWillow’s eyes go wide and she gasps loudly at the sudden change in pace, which is immediately followed by a slutty moan as the cocks she loves fill her pussy. She cums almost immediately, her eyes rolling back as femcum sprays over her thighs. You don’t let up, continuing to rail her pussy like a [pc.manWoman] possessed. She cries out again and again in bliss as your cocks fill her, toes curling in the air behind you as her pussy squeezes and wrings your ");
		if (cIdx2 >= 0)output("[pc.cocks].");
		else output("[pc.cock " + cIdx + "] and [pc.tailCock].");
		output("You’re treated to a delightful view of her breasts bouncing and jiggling due to the hard thrusting and you can’t help but bend down to lock your lips around one of the nipples, sucking and grazing your teeth along the sensitive flesh. Her moans hit a higher pitch at your ministrations, her pussy tightening up again as her body prepares for another orgasm. You pick up the pace, ramming into her even faster as you too, near orgasm.");
		output("\n\nFinally, with a loud, sweet cry, Willow hits her orgasm and another gush of girlcum sprays across your thighs. Roaring, you grab her ass and slam in, blowing your load deep inside her. Ropes and ropes of [pc.cumColor] [pc.cumType] splatter her walls"); 
		if (pc.cumQ() >= 4000) output(", bloating her stomach up to epic proportions thanks to your prodigious load");
		output(".");
		output("\n\nWith a groan, you slap her ass and pull out"); 
		if (pc.cumQ() >= 4000) output(",a waterfall of cum pouring out of her pussy");
		output(". You unlock the cuffs and take her down, grunting a little at the additional weight and walk over to the bed before laying her on the sheets.");
		output("\n\n<i>“Whew... That was pretty intense, hmm?”</i> You murmur. When you don’t get a reply, you give Willow a little poke. She doesn’t move. The poor girl has passed out from the wild sex! You chuckle and wrap your arms around her, getting comfy. You drift off to sleep with a smile on your face and your lover curled up beside you.");
		output("\n\nThe next morning, you wake up to an annoying squeaking noise. Groaning, you roll over to see Willow’s naked butt pointed at you while she mops up the floor. <i>“Ugh, what the hell is that noise!?”</i> You groan, covering your head up with the pillow. There’s a sudden influx of loud squeaks before Willow plops her butt down on the bed next to you.");
		output("\n\n<i>“Mopping up the mess!”</i> She says, grinning. <i>“Cum is such a pain in the ass to clean... Look! It’s still stained right there!”</i> She says, nudging you and pointing to a barely-visible stain on the floor.");
		output("\n\n<i>“Oh. Yeah... I see what you mean...”</i> You murmur, your hand shooting out from under the covers to give her rump a squeeze. She gasps and looks down at you with a playful frown before slapping your groping hands away.");
		output("\n\n<i>“No! I just cleaned up the mess! We are not making another one!”</i> She says, sticking her tongue out at you before hopping off the bed. <i>“Hmm... Pretty sure I had some of that stuff in the cupboard....”</i> You hear her mutter, before walking over to the sink and bending over to open the cupboard below.It gives you a rather nice view of the full cheeks of her rear, her pussy and tight little asshole all crowned by her spaded tail. After a bit of rummaging and butt-jiggling, she pops back up with some sort of cleaning product, which she pours liberally onto the floor before scrubbing away at it again, this time with less force.");
		output("\n\nWell, at least that annoying squeaky noise is gone..."); 
		output("\n\nYou roll out of bed");
		if(!pc.isNude())output(" and put your [pc.gear] back on,");
		output(" giving your lover a little kiss before you leave. Willow smiles and waves as you walk out and you blow her another kiss, which she catches and holds over her heart. Grinning, a warm fuzzy feeling filling you, you shut the door and turn to go about your day.");
		
		IncrementFlag("WILLOW_DBLPEN_VAG");

	}
	
	//Triple Vag Pen
	else if (sceneChoice==12)
	{
		output("Stepping towards Willow, a salacious grin on your face, you push her down onto the bed. She falls on her butt, breasts bouncing and looks up at you confused.");
		output("\n\n<i>“What was tha-? Oh.”</i> She stops speaking, noticing your grin. <i>“This... is going to be good. Or not.”</i> She chuckles nervously.");
		output("\n\nYou laugh and jump on her, bowling her over as you start to tickle her. She squeals and wriggles around, trying to escape your fingers. She rolls over and claws at the bed, laughing hysterically as you mercilessly tickle her armpits. <i>“" + pc.mf("Masteeerrr!", "Miiisstreeeess!") +" Stoooop! My ribs are- Ahahaha!- My ribs are hurting!”</i> She squeals, her face starting to turn purple. You chuckle and relent, lying over your slave’s back as you hug her.");
		output("\n\nBut... all that wriggling around with her sexy body has gotten your [pc.cocks] nice and hard and you let her know it, rubbing your bulge against her ass. She looks back over her shoulder and smiles at you. <i>“Hard already, master? Go ahead and stick it in.”</i> She coos, wiggling her butt back against you. Letting out a low growl, your hands move up to squeeze her tits, hard. She moans, biting her lip as you continue to grope her breasts. Finally, after a few minutes of teasing the poor demon morph, you move your hands away and pull her tight jeans down, baring her plump red rump and lacy black panties to your hungry eyes.");
		output("\n\nA quick spank to her ass elicits a gasp. The subsequent spank to her other cheek instead receives a kinky moan from the horny woman.");
		output("\n\n<i>“My my... such a wanton little slut, aren’t we?”</i> You murmur, hands running over her lovely red rump.");
		output("\n\n<i>“For you, [pc.master]? Always!”</i> She says, giggling.");
		output("\n\nShaking your head, you slap her ass again, earning another lusty moan. You hook a finger into her panties pulling them down, revealing her twitching little pucker and dripping pussy. Sometimes, you wonder if she gets wet just from seeing you...");
		output("\n\nYou lean over her again. <i>“Say... how about taking in three this time?”</i> You whisper huskily into her ear.");
		output("\n\n<i>“Wh- Wha-? Three? Three cocks? I think that’s too much, even for me.”</i> She murmurs, looking back at you, a frown on her face.");
		if(pc.isNice()) output("\n\n<i>“Well, if I can get you wet enough, maybe it won’t hurt that much?”</i> You ask as you gently massage her breasts.");
		else if(pc.isMischievous()) output("\n\n<i>“Come on. It can’t be that hard. You’ve taken two before. Three isn’t that much of a stretch!”</i> You say with a little snort, which makes her groan and slap a palm to her face.");
		else output("\n\n<i>“Oh? Let’s find out, shall we?”</i> You murmur with an evil grin.");
		output("\n\n<i>“I’ll... I’ll give it a go, [pc.master]... But if it hurts, we’re not doing this again!”</i> She states, frowning​ back at you.");
		output("\n\n<i>“Alright then!”</i> You say, grinning and sliding back, positioning your head between her spread legs. our [pc.tongue] draws through the lips of her labia, earning a pleased little coo in return. It quickly turns into a breathy moan as you push your tongue inside her pussy, Willow bucking her hips up into your face in response, grinding her clit against you.");
		output("\n\nYour tongue instinctively seeks out her most delicate spot and she lets out a loud squeal when you find it, copious amounts of wetness drenching her pussy even further. You wriggle your tongue inside her, ");
		if(pc.hasTongueFlag(GLOBAL.FLAG_LONG))output("even teasing her cervix, ");
		output("before finally judging she’s wet enough for your cocks.");
		output("\n\nWillow looks up at you, her eyes filled with lust, panting as she awaits your next move. You admire her form: The perfect, heaving breasts, the sheen of sweat glazing her red skin, her lusty, glazed purple eyes, the slim, toned midriff and the swell of her ass. Your [pc.cocks] are painfully hard, straining and throbbing ");
		if(!pc.isNude())
		{
			output("\n\n hard against your pants.");
			output("\n\nOh. Right. Your pants. You rip off your [pc.gear] tossing it aside.");
		}
		else output("in the air.");
		output("\n\nYour [pc.cocks] flop onto her groin and you grin down at her. <i>“You ready?”</i>");
		output("\n\n<i>“Uhhh... no?”</i> She grins sheepishly.");
		if(pc.isNice()) output("\n\n<i>“Don’t worry. It’ll only hurt for a bit. And you know me. I’ll make this as pleasurable for you as I can.”</i> You murmur, leaning down to kiss her. She smiles, returning the kiss, her arms wrapping around your neck to hold you close.");
		else if(pc.isMischievous()) output("\n\n<i>“Gooood. Just the way I like it!”</i> You laugh, making her groan and slap a palm to her face. Again.");
		else output("\n\n<i>“Well, ready or not, I don’t care. I need to fuck!”</i> You growl, tightening your grip around her hips, making Willow gulp in anticipation.");
		output("\n\nYou slowly sink your ");
		if (cIdx2 >= 0)output("[pc.biggestCock] and "+ cock2);
		else output("[pc.cock " + cIdx + "] and [pc.tailCock]");
		output(" into her wet, warm and welcoming pussy. Willow moans obscenly as she’s stretched wide, her long nails digging into your​ back as her eyes roll back into her head.");
		output("\n\n<i>“Yeeeeesss! Oh fuck, [pc.master] I love your cocks!”</i> She groans, moaning and squealing happily as you slowly start grinding back and forth, your cocks sinking deeper and deeper into her pussy.");
		output("\n\nBottoming out, you start gyrating your hips in circles, stretching her out so she can take the third cock in. She coos at the feeling of your ");
		if (cIdx2 >= 0)output("[pc.biggestCock] and "+ cock2);
		else output("[pc.cock " + cIdx + "] and [pc.tailCock]");
		output("stretching her out, grinding back against you, trying to get as much pleasure as she can. But... you have other plans.");
		output("\n\nYou pull out, immediately spanking her ass, making her jerk forwards with a gasp. It turns into a low, sexy purr as she looks over her shoulder. <i>“Are you going to do it now, [pc.master]? Are you going to fill my slutty pussy with your ");
		if (pc.cocks.length == 3) output("[pc.cocks]");
		else if (pc.cocks.length == 2) output("[pc.cocks] and [pc.tailCock]");
		else output ("[pc.cock " + cIdx + "] and [pc.tailCocks]");
		output("? Hmm? Come on... I know you want it.”</i> She purrs, swaying her ass seductively back and forth.");
		output("\n\nYou immediately jump her, growling and grabbing her breasts as you pull her back against you. You ram your ");
		if (cIdx2 >= 0)output("[pc.biggestCock] and "+ cock2);
		else output("[pc.cock " + cIdx + "]");
		output("home, making her scream with pleasure as you enter her hard and fast. You slow down just enough to place your ");
		if (pc.cocks.length >= 3) output(cock3);
		else if (pc.cocks.length == 2) output("[pc.tailCock]");
		else output("[pc.tailCocks]");
		output(" at the entrance to her pussy, then with the next thrust you slam it in.");
		output("\n\nEyes wide with shock, Willow lets loose a scream of pure bliss that echoes off the walls, her long tongue hanging out of her mouth and her eyes crossing. You don’t stop moving, repeatedly slapping her ass before grabbing her hips and pounding into her even harder and faster. Her pussy feels like a hot, wet, incredibly tight glove around you; your personal hole. Yours to fuck and fuck and fuck whenever you want. The thought makes you sink deeper into the haze of lust already clouding your vision and you pick up the pace, growling and snarling like an animal as you continue to pound into her pussy, her ass rippling from your thrusts. ");
		output("\n\nWillow looks back at you with pure, unabashed love ");
		if(pc.isNice()) output("and lust ");
		output("as you wreck her pussy, lovely moans and squeals cascading out of her mouth. <i>“Yes [pc.master]! Harder! Faster! Fuck me like the toy I am!”</i> She screams. Somehow, you push yourself even further, slamming her face down into the bed and leaning over her as you pound her doggy style, squeezing and groping her breasts as leverage.");
		output("\n\nShe screams with pleasure at the renewed pace, cumming almost immediately, her entire body jerking and twitching as femcum sprays over your legs. She lets out a low, desperate moan as her pussy squeezes your appendages hard, desperately milking you for your cum.");
		output("\n\nAnd milk you she does. With a loud roar, you slam deep into her pussy ");
		if(knot)
		{
			output("your knot");
			if(knots)output("s");
			output(" thankfully staying out of her pussy this time; ");
			
		} 
		output("as you cum, hot [pc.cumColor] [pc.cum type] spraying deep into her womb.");
		output("\n\nWillow moans and shudders as she feels your cum stuffing her full");
		if (pc.cumQ() >= 40000) output(", filling her up... and up... and up, until there’s simply no more room and it starts spurting back out in pressurised jets;");
		else if (pc.cumQ() >= 3000) output(", bloating her belly to near pregnant sizes;");
		output(" and she goes limp, unable to move.");
		output("\n\nYou chuckle laying down behind the well fucked demon, her pussy still twitching weakly around your cocks as it tries to keep the cum in.");
		output("\n\n<i>“Mmm... good girl. Drained your [pc.master] dry. Congratu-”</i> You pause and wave a hand in front of her face, to no response. Looks like she passed out. As usual, you chuckle to yourself. It’s a little adorable, really...");
		output("\n\n <i>“-lations.”</i> You murmur, pulling the covers over yourselves as you bed down for the night, your cocks still buried in their warm, snug hole.");
		output("\n\nThe next morning, you wake to find her still asleep, though this time with a flat belly​. She must have gotten up sometime during the night to drain herself and crawled back into bed without waking you. Sneaky little woman...");
		output("\n\nFor a moment you lie there, taking in all the details of her perfect, demonic face, her exquisite body, her voluptuous curves... and count yourself lucky that <i>you</i> were the person she fell in love with and not ");
		if(pc.isNice()||pc.isMischievous()) output("someone else.");
		else output("some other random jerk.");
		output("\n\nWith that thought in mind, you write her a little note saying goodbye and thanking her for the wonderful sex.");
		output(" You");
		if(!pc.isNude())output(" pick up your [pc.gear], get dressed");
		output(" and step out of the room.");
		
		IncrementFlag("WILLOW_TRPVAG");
	}
}	
	
public function willowTalk(sceneChoice:int):void
{
	clearOutput();
	clearMenu();
	showWillow();
	
	if (sceneChoice!=0)processTime(5); //Each talk is 5 minutes.
	
	if (sceneChoice==0)
	{

		output("<i>“Hmm... Nah. I just feel like talking.”</i> You say, grinning up at her.");
		output("\n\n<i>“Oh. Alright then, [pc.master]. What would you like to talk about?”</i>");
	}
	//Demon Talk Choice
	else if (sceneChoice==1)
	{
		output("<i>“So... how’d you turn into a demon? Ancient​ curse or something?”</i> You ask, smiling.");
		if(flags["SERA_UNLOCK_LUCIFIER"] != undefined)output("\n\n<i>“So... I know there are mods that can make you look more demonic and... pardon me for saying this, but... you don’t really look like you can afford them. So how did this happen?”</i> You ask, looking her up and down.");
		output("\n\n<i>“Oh, this? Well... That... is actually a kinda funny story. I told you how my dad was a hunter, right? Wandering around the wastes hunting animals and all that. Out there, he found a big box full of these sorta glazed apples or something. They didn’t look poisonous or anything, so he brought them back home. I, being... I guess... six or seven at the time, saw a box full of giant sweets and decided to have a whole bunch, just for kicks. Little did we know, they were a transformative. Aaaand...”</i> She waves a hand over herself. <i>“Tadaaa!”</i>");
		output("\n\n<i>“Let me guess... your dad went batshit crazy.”</i> You murmur, trying to suppress a laugh.");
		output("\n\n<i>“Yep!”</i> she says with a nervous chuckle.");
		output("\n\n<i>“Probably used the belt.”</i>");
		output("\n\n<i>“... Yep.”</i> she mutters, grimacing slightly.");
		output("\n\n<i>“Left you black and blue?”</i> You ask, smiling wryly.");
		output("\n\n<i>“... Yep...”</i> she sputters, sighing.");
		output("\n\n<i>“Well, I can’t say you didn’t deserve it. I mean, you did eat a whole bunch of what could have been something dangerous. But then again, your dad was also at fault for leaving the stuff in range of a small kid.”</i> You say with a chuckle.");
		output("\n\n<i>“Well, yeah. He admitted as much later, after he’d cooled down a bit. He forgave me, though and I forgave him. Mom, for some reason, found this whole thing hilarious. Wouldn’t stop laughing the whole day and would break out into fits of giggles whenever I walked into the room. She also laughed till she cried every time someone brought up the incident!”</i> Willow says, smiling fondly at the memory.");
		output("\n\n<i>“Hey, worth it. You must have been the envy of the boys and girls when you grew up, right?”</i> You ask, raising an eyebrow.");
		output("\n\n<i>“Yeah, but it attracted all the... ‘wrong kinds’ of boys, if you know what I mean.”</i> Willow says, looking at you meaningfully.");
		output("\n\n<i>“Ah. Yeah. I see what you mean. Those kinds. Got it.”</i> You say, still restraining a smile.");
		output("\n\n<i>“Yeah... so was there anything else you wanted to talk about?”</i> She asks, smiling sheepishly.");
	}
	//Sister Talk Choice
	else if (sceneChoice==2)
	{
		output("<i>“So how’s your sister doing?”</i> You ask.");
		output("\n\n<i>“My sister? Oh... well, last I heard, she was working as a secretary at a mining firm somewhere in the Outer Rim. Its some new company that recently sprung up and started mining some expensive resources or something​.”</i> Willow says, waving a hand.");
		output("\n\n<i>“You don’t keep in touch, then?”</i> You ask, tilting your head slightly.");
		output("\n\n<i>“What? Oh, no no. It’s not like that!”</i> She says, laughing. <i>“No, it’s just that getting messages from the Outer Rim to here is kinda expensive. You know, the distance and all.”</i> She says, shrugging."); //Is this Kosher?
		output("\n\nYou nod your understanding. <i>“So what does this sister of yours look like?”</i> You ask. ");
		output("\n\n<i>“Umm... last I saw her, she still had the dog ears. And she’s got auburn hair... with hazel eyes.”</i> She says, tapping her notepad.");
		output("\n\n<i>“Ah. I see.”</i> You murmur, filing the information away. Who knows, you may meet her in your travels!");
		if(pc.isMischievous())
		{
			output("\n\n<i>“Yeah? And what about her... Assets?”</i> You ask, grinning.");
			output("\n\n<i>“Um- What!? I- I don’t know! I never paid any attention to that!”</i> She says, flustered.");
			output("\n\n<i>“Ooh, sounds like someone may have been checking their sister out!”</i> You say, laughing as she swats your head with the notepad.");
		}
		if (flags["WILLOW_SISTER_TALK"] == undefined)flags["WILLOW_SISTER_TALK"] = 1;
	}
	//Brother Talk Choice
	else if (sceneChoice==3)
	{
		output("<i>“So how’s your brother?”</i> You ask.");
		output("\n\n<i>“Oh, he’s doing good. Working as a mercenary bodyguard for some big shot corporate tycoon or something.”</i> She says, chuckling.");
		output("\n\nYou raise your eyebrows at that. <i>“Wow. Sounds like he’s doing pretty good for himself. Better than your sister, at least.”</i> You say.");
		output("\n\n<i>“Yeaaah, I gotta agree with you there. Working as a secretary for a new company doesn’t really pay well, but... she always had a good eye for the companies that might turn out to be profitable.”</i> Willow murmurs.");
		output("\n\n<i>“Right... so what does your brother look like? Any chance I might have met him?”</i> You ask."); 
		if (pc.characterClass == GLOBAL.CLASS_MERCENARY)output(" <i>“I mean​, I’m a merc too.”</i> You add.");
		output("\n\n<i>“Well, like I said before, he’s got a big, poofy, curly tail. Uhh... brown furred, but he may have changed the color. Always said it looked too much like the sand. Um...He’s got green eyes, courtesy of my mom. But then again, he may have changed the color. Aaaand he’s got a doggy dick.”</i> She says.");
		output("\n\n<i>“Wait a minute. How do <b>you</b> know he’s got a doggy dick?”</i> You ask, narrowing your eyes at her as a grin slowly starts to spread across your face.");
		output("\n\n<i>“Well, there was this one time I accidentally walked in on him jerking off...”</i> Willow mutters, before trailing off.");
		output("\n\n<i>“And then...?”</i> You ask, your grin growing wider.");
		output("\n\n<i>“Turned around like as if I didn’t see anything and walked right back out.”</i> She says, shaking her head as you laugh.");
		if(pc.isMischievous())
		{
			output("\n\n<i>“Then I bet you turned around and hopped on his dick to finish him off! Goodness! Naughty girl!”</i> You say, tutting, right before yelping in pain as she smacks you with the notepad.");
			output("\n\n<i>“No, I didn’t do that, idiot! Get your mind out of the gutter!”</i> She groans, giving you another smack for good measure. <i>“I just turned and​ walked right back out!");
		}
		if (flags["WILLOW_BROTHER_TALK"] == undefined)flags["WILLOW_BROTHER_TALK"] = 1;
	}
	//Dad Talk Choice
	else if (sceneChoice==4)
	{
	
		output("<i>“And your dad? How is he?”</i> You ask.");
		output("\n\n<i>“Oh, still working on the farm. Except he’s gotten older and crankier. You have no idea how many times I get messages ending with: <i>“Fuck this sand!”</i></i> She says, chuckling a little.");
		output("\n\n<i>“Your dad is all alone out there on the farm?”</i> You ask, frowning slightly.");
		output("\n\n<i>“Umm... not exactly. He’s bought a few droids and hired hands to help him out around the farm. He mostly just shows them the ropes and then pays them after the harvest. Plus, he still keeps up his hunting, although he goes for smaller and easier prey now.”</i> She says.");
		output("\n\n<i>“Ah. I see. That’s good. At least he’s surviving, yeah? That’s what matters.”</i> You say, smiling at her.");
		output("\n\n<i>“Mmhmm. That’s what matters.”</i> She says, smiling back at you.");
		if (flags["WILLOW_SISTER_TALK"] == 1 && flags["WILLOW_BROTHER_TALK"] == 1)
		{
			output("\n\n<i>“Say...Maybe I should meet the family sometime. You know. You get to show off your new boyfriend and I get to meet your family.”</i> You say, rubbing your chin.");
			output("\n\n<i>“Careful, [pc.master]. Dad still has his hunting rifle and don’t forget, my brother is a mercenary.”</i> She says, chuckling.");
			output("\n\n<i>“Oh please. They’ll love me. Everybody loves me.”</i> You say with a snort, which makes her giggle and playfully smack your head.");
		}	
	}
	//Hobbies Talk Choice
	else if (sceneChoice==5)
	{
	
		output("<i>“So, you have any hobbies?”</i> You ask, looking up at her.");
		output("\n\n<i>“Yes! Yes I do! I like collecting shiny rocks, or basically any kind of mineral that shines. I also like reading books and painting too; and I like colorful flowers.”</i> She says.");
		output("\n\n<i>“Oh? I’ll keep an eye out for shiny rocks and flowers, then.”</i> You say, chuckling and poking her nose. <i>“Anything for you, babe.”</i> You murmur, smiling.");
		output("\n\n<i>“Really!? Thanks! You’re the best, [pc.master]!”</i> She squeals, pulling you into a hug, which mostly consists of smushing your head between her breasts.");
		output("\n\nYou laugh and slowly extricate yourself from the warm, soft flesh. <i>“Calm down, Willow. You’re making a scene.”</i> You murmur, looking around pointedly.");
		output("\n\n<i>“Don’t care! You’re the best and I want everyone to know it!”</i> She​ says, though in a lower voice this time and still grinning.");
		pc.changeLust(5);
	}
	
	addButton(0,"Past",willowDinnerTalk,0);
	addButton(1,"Why Here",willowDinnerTalk,1);
	addButton(2,"Her",willowDinnerTalk,2);
	addButton(3,"Demon?",willowTalk,1);
	addButton(4,"Sister",willowTalk,2);
	addButton(5,"Brother",willowTalk,3);
	addButton(6,"Dad",willowTalk,4);
	addButton(7,"Hobbies",willowTalk,5);
	addButton(14,"Back",willowLoverMenu,1);
}

public function willowGiftIntro(sceneChoice:int):void
{		
		clearOutput();
		clearMenu();
		showWillow();

		output("Do you want to gift her Clothes or an Item?");
		addButton(0,"Gift Clothes",willowGiftClothes,0);
		addButton(1,"Gift Item",willowGiftItem,0);	
		addButton(14,"Back",willowLoverMenu,1);
}

public function willowGiftItem(sceneChoice:int):void
{
	clearOutput();
	clearMenu();
	showWillow();
	
	if (sceneChoice!=0)addButton(0,"Next",willowLoverMenu,1);
	if (sceneChoice!=0)processTime(10);
	
	//Gift Item Menu
	if (sceneChoice==0)
	{	
		output("What item would you like to give Willow?");
		if(pc.hasItemByClass(Kirkite)) addButton(0,"Kirkite",willowGiftItem,1,"Kirkite","Give Willow a chunk of Kirkite.");
		else addDisabledButton(0,"Kirkite","Kirkite","You don’t have any Kirkite.");
		if(pc.hasItemByClass(Satyrite)) addButton(1,"Satyrite",willowGiftItem,2,"Satyrite","Give Willow a chunk of Satyrite.");
		else addDisabledButton(1,"Satyrite","Satyrite","You don’t have any Satyrite.");
		if(pc.hasItemByClass(Picardine)) addButton(2,"Picardine",willowGiftItem,3,"Picardine","Give Willow a chunk of Picardine.");
		else addDisabledButton(2,"Picardine","Picardine","You don’t have any Picardine.");
		if(pc.hasItemByClass(Picardine)) addButton(3,"Savicite",willowGiftItem,4,"Savicite","Give Willow a chunk of Savicite.");
		else addDisabledButton(3,"Savicite","Savicite","You don’t have any Savicite.");
		if(pc.hasItemByClass(VenusBloom)) addButton(4,"Give Flower",willowGiftItem,5,"Give Flower","Give Willow an exotic flower.");
		else addDisabledButton(4,"Give Flower","Give Flower","You don’t have any exotic flowers.");
		addButton(14,"Back",willowLoverMenu,1);
	}
	//Kirkite
	if (sceneChoice==1)
	{
		output("<i>“I got you something I think you’d like.”</i> You say, rummaging through your bag.");
		output("\n\n<i>“Oh? What is it?”</i> She asks, peering over your shoulder.");
		output("\n\n<i>“This!”</i> You say, popping back up with a kirkite crystal in your hand.");
		output("\n\n<i>“Oh, that’s nice!”</i> Willow says, taking the crystal from you and holding it carefully in her hands. <i>“This is the one that they use to make superconductors or something, right?”</i> She asks, rolling it around.");
		output("\n\n<i>“Mmhm. Fetches around... Two thousand something credits on the market.”</i> You say, grinning.");
		output("\n\n<i>“Yes, so I’ve heard! Thanks a lot, [pc.master]!”</i> She says, smiling and leaning over to give you a kiss on the lips.");
		
		pc.destroyItemByClass(Kirkite);
		willowAffection(10);
	}
	//Satyrite
	if (sceneChoice==2)
	{
	
		output("<i>“Guess what I found.”</i> You say, grinning and holding up the Satyrite crystal.");
		output("\n\n<i>“Oh wow! Satyrite, isn’t it? That’s so cool! That’s like, the more expensive and valuable cousin of kirkite, isn’t it?”</i> She says, grinning and holding out her hands for it like a little kid expecting a present.");
		output("\n\nYou chuckle and place it in her hands. <i>“That it is, my dear. I like the color. Shiny and vibrantly striped. You like that, right?”</i> You say, smiling.");
		output("\n\n<i>“Wow, thanks a lot, master!”</i> She says, giggling and kissing your nose. <i>“This means a lot to me.”</i> She says, smiling and holding the crystal to her breasts.");
		
		pc.destroyItemByClass(Satyrite);
		willowAffection(20);
	}
	//Picardine
	if (sceneChoice==3)
	{
		output("You hold up a Picardine crystal. <i>“Guess what I found!”</i> You say, grinning.");
		output("\n\nWillow’s jaw drops. <i>“Is... Is that... what I think it is...?”</i> She asks, her eyes wide with disbelief.");
		output("\n\n<i>“Yes. A Picardine crystal.”</i> You say, handing the crystal to her. <i>“It’s pretty rare and- Oof!”</i> You suddenly grunt as you are hugged forcefully by a very happy demon.");
		output("\n\n<i>“Thank you! Thank you so much!”</i> She squeals, hugging you tighter, almost squeezing the air out of you.");
		output("\n\n<i>“Yes, now if you wouldn’t mind letting me breathe!?”</i> You wheeze, trying to get her to go easy on you.");
		output("\n\n<i>“Oh. Sorry.”</i> She says with a giggle, before backing up a little and looking down at the crystal. <i>“It’s... it’s beautiful, [pc.master]. I can never repay this...”</i> She murmurs, turning the crystal over in her hands.");
		output("\n\n<i>“You don’t have to. You being with me is enough.”</i> You murmur, hugging the demon as she smiles at you. <i>“It looks rather plain though...”</i>");
		output("\n\n<i>“I don’t care. It’s the thought that counts.”</i> She murmurs, smiling and nuzzling you.");
		
		pc.destroyItemByClass(Picardine);
		willowAffection(30);
	
	}
	//Savicite
	if (sceneChoice==4)
	{
		output("<i>“I found this while exploring out there.”</i> You say, carefully taking out the stone with a gloved hand and handing it to Willow.");
		output("\n\n<i>“Oh? What’s this?”</i> She asks, peering over the green rock.");
		output("\n\n<i>“It’s Savicite. Apparently it makes you more lustful if you touch it with your bare hands. Hence the gloves.”</i> You say, grinning.");
		output("\n\n<i>“Wait. It’s radioactive?”</i> Willow asks, frowning and backing up.");
		output("\n\n<i>“What? No! It’s just... well... they haven’t fully figured it out yet, but no, it’s not radioactive. Just makes you horny. Really horny...”</i> You mutter"); 
		if (flags["UVETO_HUSKAR_FOURSOME"] == 1) output("thinking back to that time with Anno and her colleagues, with that big Savicite dildo.");
		else output(".");
		output("\n\n<i>“Umm... So... I should wear gloves?”</i> She murmurs, her hands inching closer.");
		output("\n\n<i>“No, not really.”</i> You say, dropping the stone into her hands, trying to keep a straight face.");
		output("\n\nOn a horny girl like her, the effect is almost instantaneous. She lets out a little moan and glares at you for a moment while the smell of her arousal fills the air.");
		output("\n\n<i>“Oh, you ass. You are so- Oooh!- so dead!”</i> She whines, stumbling off with the stone still in hand as she tries to escape before she makes an even bigger mess of her panties.");
		
		pc.destroyItemByClass(Savicite);
		willowAffection(10);
		pc.changeLust(20);
	
	}
	//Give Flower
	if (sceneChoice==5)
	{
		output("<i>“I got you something.”</i> You say, taking out a flower from the jungles of Mhen’ga.");
		output("\n\n<i>“Oh wow! Pretty!”</i> Willow says, smiling as she takes the large purple flower, before sniffing it. <i>“What is it, master?”</i> She asks.");
		output("\n\n<i>“Venus pitcher bloom.”</i> You say, grinning.");
		output("\n\n<i>“Oh, you mean those nasty things that trap people for ages while they harvest their cum? Oh master, what you must have gone through to get this for me!”</i> She says, smiling and giving you the big doe eyes.");
		output("\n\n<i>“Heh, yeah, of course...”</i> You murmur, deciding not to mention the fact that all you had to do was say nope! But, the humid trek through that horrible jungle counts for something!...Right?");
		output("\n\n<i>“Aww! I love you!”</i> She squeals, giving you a quick hug before running off to put the flower in some water and leaving you feeling warm and fuzzy.");
		
		pc.destroyItemByClass(VenusBloom);
		willowAffection(20);
	}
}

public function willowGiftClothes(sceneChoice:int):void
{
	clearOutput();
	clearMenu();
	showWillow();
	if (sceneChoice==0)
	{
		//Gift Clothes Menu
			
		if (flags["WILLOW_MAID_OUTFIT"] == undefined)
		{
			if(pc.hasItemByClass(MaidOutfit)) addButton(0,"MaidO.",willowGiftClothes,1,"MaidO.","Give Willow a Maid Outfit.");
			else addDisabledButton(0,"MaidO.","MaidO.","You don’t have a Maid Outfit.");
		}
		if (flags["WILLOW_LEATHER_OUTFIT"] == undefined)
		{
			if(pc.hasItemByClass(LeatherStrapHarness)) addButton(1,"L.Harness",willowGiftClothes,2,"L.Harness","Give Willow a Leather Harness.");
			else addDisabledButton(1,"L.Harness","L.Harness","You don’t have a Leather Harness.");
		}
		if (flags["WILLOW_LATEX_OUTFIT"] == undefined)
		{
			if(pc.hasItemByClass(LatexBodysuit)) addButton(2,"LtxBdy",willowGiftClothes,3,"LtxBdy","Give Willow a Latex Outfit.");
			else addDisabledButton(2,"LtxBdy","LtxBdy","You don’t have a Latex Outfit.");
		}
		if (flags["WILLOW_PIRATE_OUTFIT"] == undefined)
		{
			if(pc.hasItemByClass(SpacePirateOutfit)) addButton(3,"S.Pirate O.",willowGiftClothes,4,"S.Pirate O.","Give Willow a Space Pirate Outfit.");
			else addDisabledButton(3,"S.Pirate O.","S.Pirate O.","You don’t have a Space Pirate Outfit.");
		}
		if (flags["WILLOW_CHEERLEADER_OUTFIT"] == undefined)
		{
			if(pc.hasItemByClass(CheerleaderUniform)) addButton(4,"Chr.Ldr.",willowGiftClothes,5,"Chr.Ldr.","Give Willow a Cheerleader Uniform.");
			else addDisabledButton(4,"Chr.Ldr.","Chr.Ldr.","You don’t have a Cheerleader Uniform.");
		}
		if (flags["WILLOW_BUNNY_OUTFIT"] == undefined)
		{
			if(pc.hasItemByClass(BunnyOutfit)) addButton(5,"Bunny O.",willowGiftClothes,6,"Bunny O.","Give Willow a Bunny Outfit.");
			else addDisabledButton(5,"Bunny O.","Bunny O.","You don’t have a Bunny Outfit.");
		}
		if (flags["WILLOW_SCHOOL_OUTFIT"] == undefined)
		{
			if(pc.hasItemByClass(SchoolgirlOutfit)) addButton(6,"S.Girl O.",willowGiftClothes,7,"S.Girl O.","Give Willow a Schoolgirl Outfit.");
			else addDisabledButton(6,"S.Girl O.","S.Girl O.","You don’t have a Schoolgirl Outfit.");
		}
		addButton(14,"Back",willowLoverMenu,1);
	}
	
	//Doing it like this avoids logical problem of player backing out after clicking Gift Clothes.
	else
	{	
		processTime(5);
		output("<i>“Willow, I’ve got something for you to wear.”</i> You say, grinning.");
		if(flags["WILLOW_GIFT_CLOTHES"] == undefined)
		{	
			output("<i>“Something to wear? What for? I have enough clothes.”</i> She says.");
			output("\n\n<i>“Well, these are some... special kinda clothes.”</i> You say, winking at her. <i>“And, of course, there will be more!”</i>");
			output("\n\n<i>“Special kind of-? Ohhhh. I get it. Never mind.”</i> She says, chuckling and shaking her head.");
			flags["WILLOW_GIFT_CLOTHES"] = 1;
			
		}
		else output("\n\n<i>“Oh? What did you get this time?”</i> She asks, smiling excitedly.");
		
		//Give Maid Outfit	
		if (sceneChoice==1)
		{
			output("<i>“A kinky, french maid outfit!”</i> You say, grinning at her.");
			output("\n\n<i>“Whoa. Kinky alright!”</i> She says, giggling and taking the frilly outfit.");
			output("\n\n<i>“Yep. A perfect dress for the perfect servant!”</i> You say, grinning smugly.");
			output("\n\nWillow laughs and kisses you on the cheek before folding the dress to keep it in her bag later.");
			flags["WILLOW_MAID_OUTFIT"] = 0;
			pc.destroyItemByClass(MaidOutfit);
		}	
		//Give Leather Outfit	
		else if (sceneChoice==2)
		{
			output("<i>“I got this for you. Hope you like it.”</i> You say, handing her the leather harness.");
			output("\n\n<i>“Um...The fuck?”</i> She mumbles, raising an eyebrow as she holds the tangle of leather straps up. <i>“Which end is up and which end is down?”</i> She asks, helpless.");
			output("\n\nYou chuckle and explain to her how to put it on; starting with the collar and ending with the straps at the bottom.");
			output("\n\n<i>“Alright... definitely not wearing this in public...”</i> She says, chuckling and rolling up the bundle of straps for the journey home. <i>“But thanks, [pc.master].”</i> She says, giving you a smile.");
			flags["WILLOW_LEATHER_OUTFIT"] = 0;
			pc.destroyItemByClass(LeatherStrapHarness);
		}
		//Give Latex Outfit	
		else if (sceneChoice==3)
		{
			output("<i>“Say... I’ve been wanting to try a fetish of mine...”</i> You start.");
			output("\n\n<i>“Aaaand...?”</i> Willow asks, raising an eyebrow.");
			output("\n\n<i>“And I got you this.”</i> You say, grinning and holding up a shiny black latex bodysuit.");
			output("\n\nWillow’s jaw drops, before a little laugh escapes. <i>“You’re joking. Latex!?”</i> She says, laughing.");
			output("\n\n<i>“Hey, try it on. It’s not too late to try latex!”</i> You say, grinning like a cheesy porn advert man.");
			output("\n\n<i>“Umm... maybe later. In <b>private</b>.”</i> She says, giving you a look, which you accept for now.");
			flags["WILLOW_LATEX_OUTFIT"] = 0;
			pc.destroyItemByClass(LatexBodysuit);
		}
		//Give Pirate Outfit	
		else if (sceneChoice==4)
		{
			output("You don’t say anything. You just hold up the outfit and grin.");
			output("\n\nShe gasps and pulls the clothes from your hands. <i>“Ohmigosh! I always wanted one of these!”</i> She squeals, giving you a kiss and a hug. <i>“These are so-”</i> That’s when she takes a closer look. <i>“Waaait a minute... this isn’t​... Oh you ass!”</i> She groans, glaring as you laugh your head off.");
			output("\n\n<i>“Yes, my dear. Leather outfit. Perfect for a Dom who’s going to get the tables turned on them.”</i> You say, winking at her as she huffs.");
			output("\n\n<i>“Lewd as these clothes may be... thanks, [pc.master].”</i> She says, rolling her eyes before giving you a kiss on the cheek.");
			flags["WILLOW_PIRATE_OUTFIT"] = 0;
			pc.destroyItemByClass(SpacePirateOutfit);
		}	
		//Give Cheerleader Outfit
		else if (sceneChoice==5)
		{
			output("You hand over a cheerleader outfit to Willow.");
			output("\n\n<i>“Oh, this looks kinda... okay, I guess.”</i> She says with a little chuckle, before spotting​ the pom poms. Her face lights up with glee. <i>“Oh hell yes! I’m flashing these in your face every chance I get!”</i> She says, giggling and grabbing them to shake them in your face.");
			output("\n\nAs your world turns to flashy pink strips for a while, you kinda regret buying it, but you’re happy to see her happy!");
			flags["WILLOW_CHEERLEADER_OUTFIT"] = 0;
			pc.destroyItemByClass(CheerleaderUniform);
		}
		//Give Bunny Outfit		
		else if (sceneChoice==6)
		{
			output("You smile as you hold up the bunny outfit to Willow.");
			output("\n\n<i>“Aww! This is pretty cute!”</i> She says, giggling and swatting the little bob of a tail.");
			output("\n\n<i>“Totally agree. I had a feeling you’d look absolutely adorable and sexy, in it, so I got it for you.”</i> You say, chuckling.");
			output("\n\n<i>“Aww! Thanks!”</i> She squeals, giving you a hug and a kiss.");
			flags["WILLOW_BUNNY_OUTFIT"] = 0;
			pc.destroyItemByClass(BunnyOutfit);
		}
		//Give Schoolgirl Outfit	
		else if (sceneChoice==7)
		{
			output("You hand Willow a schoolgirl outfit.");
			output("\n\n<i>“Okay... out of everything you’ve ever brought me, this is the one that’s setting off alarm bells in my head...”</i> She says, chuckling.");
			output("\n\n<i>“Oh come on! Schoolgirl outfits are totally a fetish! And who the heck would even mistake you for a schoolgirl!?”</i> You argue.");
			output("\n\nShe snorts and kisses your cheek. <i>“Fair enough, [pc.master]. I suppose, if you like it that much, I’ll wear it for you.”</i> She says, smiling.");
			flags["WILLOW_SCHOOL_OUTFIT"] = 0;
			pc.destroyItemByClass(SchoolgirlOutfit);
		}
		addButton(0,"Next",willowLoverMenu,1);
	}
}

public function willowWearClothes(sceneChoice:int):void
{
	clearOutput();
	clearMenu();
	showWillow();
	
	if (sceneChoice == 0)
	{
		output("What outfit would you like Willow to wear?");
		//Wear Clothes Menu
		if (flags["WILLOW_MAID_OUTFIT"] == 0) addButton(0,"MaidO.",willowWearClothes,1,"Maid Outfit","Have Willow wear the Maid Outfit.");
		else if (flags["WILLOW_MAID_OUTFIT"] == 1 || flags["WILLOW_MAID_OUTFIT"] == 2) addDisabledButton(0,"MaidO.","Maid Outfit","Willow is already wearing the Maid Outfit.");
		else addDisabledButton(0,"MaidO.","Maid Outfit","You haven’t given her a Maid Outfit.");
				
		if (flags["WILLOW_LEATHER_OUTFIT"] == 0) addButton(1,"L.Harness",willowWearClothes,2,"Leather Harness","Have Willow wear the Leather Harness.");
		else if (flags["WILLOW_LEATHER_OUTFIT"] == 1) addDisabledButton(1,"L.Harness","Leather Harness","Willow is already wearing the Leather Harness.");
		else addDisabledButton(1,"L.Harness","Leather Harness","You haven’t given her a Leather Harness.");
		
		if (flags["WILLOW_LATEX_OUTFIT"] == 0) addButton(2,"LtxBdy",willowWearClothes,3,"Latex Bodysuit","Have Willow wear the Latex Outfit.");
		else if (flags["WILLOW_LATEX_OUTFIT"] == 1) addDisabledButton(2,"LtxBdy","Latex Bodysuit","Willow is already wearing the Latex Outfit.");
		else addDisabledButton(2,"LtxBdy","Latex Bodysuit","You haven’t given her a Latex Outfit.");
		
		if (flags["WILLOW_PIRATE_OUTFIT"] == 0) addButton(3,"S.Pirate O.",willowWearClothes,4,"Space Pirate Outfit","Have Willow wear the Space Pirate Outfit.");
		else if (flags["WILLOW_PIRATE_OUTFIT"] == 1) addDisabledButton(3,"S.Pirate O.","Space Pirate Outfit","Willow is already wearing the Space Pirate Outfit.");
		else addDisabledButton(3,"S.Pirate O.","Space Pirate Outfit","You haven’t given her a Space Pirate Outfit.");
		
		if (flags["WILLOW_CHEERLEADER_OUTFIT"] == 0) addButton(4,"Chr.Ldr.",willowWearClothes,5,"Cheerleader Uniform","Have Willow wear the Cheerleader Uniform.");
		else if (flags["WILLOW_CHEERLEADER_OUTFIT"] == 1) addDisabledButton(4,"Chr.Ldr.","Cheerleader Uniform","Willow is already wearing the Cheerleader Uniform.");
		else addDisabledButton(4,"Chr.Ldr.","Cheerleader Uniform","You haven’t given her a Cheerleader Uniform.");
		
		if (flags["WILLOW_BUNNY_OUTFIT"] == 0) addButton(5,"Bunny O.",willowWearClothes,6,"Bunny Outfit","Have Willow wear the Bunny Outfit.");
		else if (flags["WILLOW_BUNNY_OUTFIT"] == 1) addDisabledButton(5,"Bunny O.","Bunny Outfit","Willow is already wearing the Bunny Outfit.");
		else addDisabledButton(5,"Bunny O.","Bunny Outfit","You haven’t given her a Bunny Outfit.");
		
		if (flags["WILLOW_SCHOOL_OUTFIT"] == 0) addButton(6,"S.Girl O.",willowWearClothes,7,"Schoolgirl Outfit","Have Willow wear the Schoolgirl Outfit.");
		else if (flags["WILLOW_SCHOOL_OUTFIT"] == 1) addDisabledButton(6,"S.Girl O.","Schoolgirl Outfit","Willow is already wearing the Schoolgirl Outfit.");
		else addDisabledButton(6,"S.Girl O.","Schoolgirl Outfit","You haven’t given her a Schoolgirl Outfit.");
		
		addButton(14,"Back",willowHerPlace,1);
	}
	else
	{
		if (sceneChoice!=1)addButton(0,"Next",willowHerPlace,1);
		
		//Wear Maid Outfit
		if (sceneChoice==1)
		{
			output("You tell Willow to put on her maid outfit.");
			output("\n\nShe raises an eyebrow, but does as you ask, making a little show of it as she does so. She pulls on the gloves and stockings first, before putting on the short, skimpy dress and frilly headdress.");
			output("\n\n<i>“How’s this, master?”</i> She asks, giggling.");
			output("\n\n<i>“You really want an answer to that?”</i> You ask, chuckling as your boner answers for you.");
			output("\n\n<i>“You want me to wear this in the bar too, or is it just something only <i>you</i> want to see me in?”</i> She asks, tilting her head.");
			
			addButton(0,"Bar",willowWearClothes,8,"Bar","Wear it in the bar.");
			addButton(1,"Just Me",willowWearClothes,9,"Just Me","Wear it just for me.");
			
		}
		//Wear Leather outfit	
		else if (sceneChoice==2)
		{
			output("<i>“Come on. Put this on.”</i> You say, grinning as point at the mass of leather strips hanging in her closet.");
			output("\n\n<i>“Ummm... How the fuck do I even...?”</i> She trails off, looking at the dress with a raised eyebrow.");
			output("\n\nYou sigh and beckon her over. When she moves closer, you help her get into it. After a few long minutes of adjusting straps, she finally stands there with the leather harness on.");
			output("\n\n<i>“T-this... is so... lewd...”</i> She mumbles, looking down at the skimpy outfit with a blush already spreading across her face.");
			output("\n\n<i>“Oh come on. You look sexy as hell!”</i> You say, grinning as your eyes feast on the sight of Willow in a black leather harness. Her breasts are squeezed and plumped up slightly, with her nipples covered by the straps. The rest of her body is covered by the straps in a criss-cross pattern, until they reach her butt, where they went around the curves and right between her legs to cover up the naughty bits. Barely. Her legs have the same criss-cross pattern all the way down to her ankles.");
			output("\n\n<i>“R-really now...?”</i> She mumbles, shaking her head. <i>“It does feel rather...”</i> She pauses as she searches for the right word. <i>“Liberating.”</i> She murmurs.");
			output("\n\n<i>“That’s my girl.”</i> You say, grinning and spanking her butt, which makes her squeak and glare at you.");
			output("\n\n<i>“Hmph! I’m only wearing this because you like it, [pc.master]!”</i> She huffs, crossing her arms and pouting.");
			output("\n\n<i>“Mmhm. I know. Thank you darling.”</i> You say, chuckling as you turn to leave, with Willow grumbling something behind your back.");
			
			flags["WILLOW_LEATHER_OUTFIT"] = 1;
		}
		//Wear Latex Outfit	
		else if (sceneChoice==3)
		{
			output("<i>“Put on that latex suit I got you,”</i> you grin.");
			output("\n\n<i>“Ah. Your weird fetish thingy.”</i> She says, chuckling and stripping naked before putting the suit on. It perfectly hugs every curve of her body, leaving almost nothing to the imagination. <i>“Ooh man. This one I like.”</i> She says, chuckling, before doing a little twirl for you. <i>“How does it look, master?”</i> She asks, giggling.");
			output("\n\n<i>“Hmm... Lemme just confirm one thing...”</i> You mutter before grabbing her hips and pulling her down into your lap.");
			output("\n\n<i>“M- [pc.master]? W-what are you d-doi- Oh!”</i> She squeaks as you suddenly dig your fingers into her ass and pussy.");
			output("\n\n<i>“Nothing. Just checking if there were holes back here for easy access.”</i> You say, chuckling as you keep teasing her holes.");
			output("\n\nShe lets out a cute little moan and then a little sigh of disappointment as you pull your fingers back out. <i>“You’re so mean sometimes, [pc.master]...”</i> She murmurs, poking your nose.");
			output("\n\nYou chuckle and kiss her back, before getting up to leave; Willow murmuring about how good she looks in the bodysuit as she examines herself in the mirror.");
			
			flags["WILLOW_LATEX_OUTFIT"] = 1;
		}
		//Wear Pirate Outfit	
		else if (sceneChoice==4)
		{
			output("<i>“Hey, why don’t you put on that pirate outfit thing I got for you?”</i> You ask with a smile.");
			output("\n\n<i>“Oh you mean that thing with all the tight leather and stuff?”</i> She asks, walking off and coming back with the outfit, before stripping naked and putting it on. <i>“So? How do I look?”</i> She asks, chuckling as she stands there fully clad in tight leather gear that hugs her body in all the right ways.");
			output("\n\n<i>“You look like one of those kinds of women who pretend to be a Dom, but secretly enjoy submissive sex.”</i> You snicker.");
			output("\n\n<i>“Oh shut up, you!”</i> She huffs, crossing her arms under her squishy breasts and making a face at you. <i>“I like this!”</i>");
			output("\n\n<i>“I didn’t say I didn’t like it, now did I?”</i> You murmur, chuckling and winking at her.");
			output("\n\n<i>“Wha-? Oh. You had me going for a second there... [pc.master].”</i> She murmurs, shaking her head, before sashaying closer and pushing you into a chair. She bends over so her breasts are right in front of your face. <i>“What are your orders, Captain?”</i> She asks in a sultry tone, before giggling at the rather aroused look on your face.");
			output("\n\n<i>“Uhhh... Nothing. No orders. But I should probably be going.”</i> You say, before wriggling out from under her and giving her ass a spank as you hurry out before you wind up in an hour long sex session with the lovely succubus.");

			flags["WILLOW_PIRATE_OUTFIT"] = 1;
		}	
		//Wear Cheerleader Outfit
		else if (sceneChoice==5)
		{
			output("<i>“So I’ve been thinking....”</i> You murmur, tapping your chin.");
			output("\n\n<i>“Oh boy. That’s not gonna end well.”</i> Willow says dryly.");
 			output("\n\n<i>“Shush. I’ve been wondering how you’d look in that cheerleader costume.”</i> You murmur, grinning.");
			output("\n\n<i>“Please tell me you’re joking. I had enough of that crap in high school!”</i> She whines.");
			output("\n\n<i>“Huh? What do you mean?”</i> You ask, raising an eyebrow.");
			output("\n\n<i>“Well... After I turned into... Well... this...”</i> She says, motioning to her body; <i>“A lot of perverts came out of the woodwork. One of them being my gym teacher. She made me dress in the skimpiest fucking costume they had, just so she could look at all my fun bits. Claimed it was for team building and morale. All I could see was their building boners.”</i> She says, rolling her eyes.");
			output("\n\n<i>“Oh. Well, I don’t blame her. You’re hot.”</i> You say, chuckling.");
			output("\n\n<i>“Thanks for the compliment.”</i> She says, rolling her eyes.");
			output("\n\nYou suddenly reach over and pull her into your lap. <i>“I mean it.”</i> You grumble, looking into her eyes.");
			output("\n\n<i>“O-oh. Thanks, [pc.master].”</i> She murmurs, blushing a little as she lays her head on your chest.");
			output("\n\n<i>“You’re welcome. Now go out on that costume.”</i> You say, grinning.");
			output("\n\nShe sighs and gets off you, before undressing and putting the cheerleader costume on. The costume is obviously skimpy. What could one expect after purchasing it from a fetish shop? The blouse is short and tight enough that it shows about half of the underside of her breasts and the skirt tiny enough to flash her whole ass to anyone who happened who looks in her direction.");
			output("\n\n<i>“Yep. Exactly the same thing.”</i> She mutters.");
			output("\n\n<i>“How many times did your tits pop out while doing the cheerleading routines?”</i> You ask, trying to hold back a laugh.");
			output("\n\n<i>“More times than I care to count.”</i> She says flatly. You can’t help but let out a little snort of laughter at that. <i>“But hey. At least our team usually won the matches.”</i> She says with a shrug.");
			output("\n\n<i>“Yeah. So keep this on for now. Cheer me on when I’m fucking you.”</i> You say, chuckling.");
			output("\n\n<i>“[pc.Master], I’m saying this as nicely as possible. Please go die in a ditch somewhere.”</i> She says sweetly.");
			output("\n\n<i>“Haa haa. Now you’re keeping that one on for a while.”</i> You say, grinning right back.");
			output("\n\n<i>“Gah! Fine.”</i> She grumbles, rolling her eyes.");

			flags["WILLOW_CHEERLEADER_OUTFIT"] = 1;
		}
		//Wear Bunny Outfit		
		else if (sceneChoice==6)
		{
			output("<i>“Alright. I want you to put on that bunny suit I got you.”</i> You murmur, grinning.");
			output("\n\n<i>“Ah... that one. Yes [pc.master].”</i> She murmurs, nodding as she takes out the bunny suit out of her closet");
			output("\n\nShe tosses her clothes off and starts putting the suit on, pulling it up over her naked body. The suit fits quite well, hugging her breasts tightly and pushing them up to make them appear even bouncier than before. The material hugs her ass as well, making it look curvier and more spankable.");
			output("\n\n<i>“Don’t forget the bunny ears, ri-”</i> Willow interrupts you, snatching the ears you are holding. She puts them on, right on top of her horns.");
			output("\n\n<i>“What about the p-”</i> You’re interrupted again as she yanks the leggings from your hands, hastily pulling them on as well.");
			output("\n\n<i>“Well? How do I look?”</i> She asks, giggling. The bunny ears on top of her horns look rather silly and the fact that her demon tail is missing looks odd, but you don’t have the heart to tell your happy pet she looks pretty silly in it.");
			output("\n\n<i>“You look... nice.”</i> You say, in a neutral tone.");
			output("\n\n<i>“... Really now?”</i> She coos, stepping forwards. Her hips are swaying in that sexy way that she knows turns you on. <i>“Not sexy enough for you to bend me over and fuck... my brains... out...?”</i> She purrs, stepping closer with each word, until she’s right in front of you. Then, she sits down on your lap, before putting her arms over your shoulders, pressing her breasts into your face. She starts grinding back and forth on your lap, trying to get you aroused enough to fuck her.");
			output("\n\nYou suddenly bring your hands down hard on her ass, which makes her yelp and look down at you. <i>“M-[pc.master]?”</i> She squeaks, looking at you.");
			output("\n\nYou pick her up and toss her down onto the bed, before pinning her down by the arms. For a moment, both of you are looking into the other’s eyes and time seems to slow down.");
			output("\n\nHer breathing gets quicker and heavier; and your eyes travel down slightly, watching her chest rise and fall with her breathing. They slowly travel back up to her face, with her slightly parted lips and wide, expectant eyes. Then, you lean down and kiss her, pushing your tongue into her mouth.");
			output("\n\nShe closes her eyes and wraps her arms around you, holding you there as the two of you make out.");
			output("\n\nHer long tongue worms into your mouth as well, wrapping around your tongue and flicking it around. After a moment, you break the kiss, panting slightly.");

			flags["WILLOW_BUNNY_OUTFIT"] = 1;
			pc.changeLust(20);
		}
		//Wear Schoolgirl Outfit	
		else if (sceneChoice==7)
		{
			output("<i>“Hey Willow?”</i> You ask. ");
			output("\n\n<i>“Hmm?”</i> She mumbles, apparently absorbed in a book.");
			output("\n\n<i>“I want you to wear some clothes.”</i>");
			output("\n\n<i>“Oh? Which kind?”</i> She asks, not even looking up from her book.");
			output("\n\n<i>“The skimpy, slutty kind.”</i> You say, as you point at the schoolgirl outfit hanging in her closet. This gets her attention and she looks up. She looks at the dress for a minute before looking at you.");
			output("\n\n<i>“You’re joking, right? I am not wearing that.”</i> She says, shaking her head. <i>“I already tried that cheerleader one on for you, but this one is a nope.”</i> She says, still shaking her head.");
			output("\n\n<i>“Aw come on. Just try it!”</i> You plead.");
			output("\n\n<i>“Bah. Fine. But only because it’s you asking.”</i> She grumbles, before sitting and throwing her clothes off. Then, she puts on the outfit.");
			output("\n\nThe blouse hugs her body tightly, showing off a bit of cleavage, while also being short enough to show off her midriff. The skirt, like the cheerleader outfit, is also short enough to flash anyone walking past.");
			output("\n\n<i>“Hmm. I like it.”</i> You say, grinning.");
			output("\n\n<i>“Brings back way too many memories.”</i> She says, shaking her head and lying back down on the bed to continue reading. She crosses one knee over the other, unintentionally giving you a show of her panties and the curve of her ass.");
			output("\n\nYou barely restrain yourself from rolling her over and spanking her ass raw. But, you do settle for a compromise. You reach forward, pull her panties down slightly and slip your fingers into her pussy.");
			output("\n\nHer whole body goes rigid and her pussy clenches down tightly around you. You hear a tiny squeak, but no other indication that she felt anything.");
			output("\n\nThen, you slowly thrust your fingers in and out, fingering the poor demon. You hear another intake of breath, followed by her tail starting to twitch. She’s still hiding her face behind the book, though you doubt she’s reading anymore.");
			output("\n\nYour thrusting gets faster and your thumb starts rubbing her clit. This finally gets a response out of her. A response in the form of a loud gasp of pleasure, followed by her tossing the book to the side as she moans out loud.");
			output("\n\nYour ring and pinky finger push themselves into her ass and this finally makes her cum. She squeals loudly, shooting a stream of cum over the bed and your fingers.");
			output("\n\n<i>“Heh. Just like a virgin schoolgirl.”</i> You say, chuckling as you stand up.");

			pc.changeLust(30);
			flags["WILLOW_SCHOOL_OUTFIT"] = 1;
		}
		//Wear Maid Outfit in the bar
		else if (sceneChoice==8)
		{
			output("<i>“I want you to wear it in the bar too.”</i> You say, grinning evilly.");
			output("\n\nShe raises her eyebrows, but nods. <i>“On one condition. I wear panties. I don’t want random people groping me!”</i> She says, wagging her finger in your face. <i>“I’m not a complete slut!”</i>");
			output("\n\n<i>“Hmm... things we’ve done in the bed would indicate otherwise...”</i> you say, rubbing your chin, before getting knocked on the head by her throwing a book at you.");
			output("\n\n<i>“S-shut up! That’s personal!”</i> She squeaks.");
			output("\n\nYou laugh and sit up, rubbing your forehead. <i>“Still, wear it to the bar too, okay?”</i> You say with a grin.");
			output("\n\n<i>“Hmph! Fine.”</i> She huffs, crossing her arms and looking to the side, still blushing.");
			flags["WILLOW_MAID_OUTFIT"] = 2;
		}
		//Wear Maid Outfit only for you
		else if (sceneChoice==9)
		{
			output("<i>“Nah. Just when I’m around.”</i> You say, chuckling. <i>“You’re mine and don’t you ever forget that. No way I’m showing you off to the rest of the world.”</i>");
			output("\n\nShe blushes and smiles at you, before walking over and giving you a hug. <i>“Thank you, [pc.master]. That means a lot.”</i> She whispers in your ear, before sitting in your lap. You spend a bit of time cuddling with your pet before getting up to leave, with her waving goodbye.");
			flags["WILLOW_MAID_OUTFIT"] = 1;
		
		}
		
		//Flags reset
		if (sceneChoice!=8 && sceneChoice!=9)flags["WILLOW_MAID_OUTFIT"] = 0;
		if (sceneChoice!=2)	flags["WILLOW_LEATHER_OUTFIT"] = 0;	
		if (sceneChoice!=3)	flags["WILLOW_LATEX_OUTFIT"] = 0;
		if (sceneChoice!=4) flags["WILLOW_PIRATE_OUTFIT"] = 0;
		if (sceneChoice!=5) flags["WILLOW_CHEERLEADER_OUTFIT"] = 0;
		if (sceneChoice!=6)	flags["WILLOW_BUNNY_OUTFIT"] = 0;
		if (sceneChoice!=7)	flags["WILLOW_SCHOOL_OUTFIT"] = 0;
		
		processTime(15);
	}		
}		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
