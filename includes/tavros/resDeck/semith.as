//Available Flags

//MET_SEMITH:					If the PC met Semith before (true or undefined)
//SEMITH_LAST_DAY_CHALLENGED:	Last day Semith was challenged to a chess match
//SEMITH_IS_IN_CHESS_AREA:		If Semith is in the chess area - needed so his NPC flag doesn't vanish when time passes during a match (true, false or undefined)
//SEMITH_APARTMENT_ENTERED:		If the PC entered Semith's apartment in the past (true or undefined)
//SEMITH_SEXED:					Counts the time the pc had sex with Semith (int 1+ or undefined)
//SEMITH_TALK_ROUND:			How often Semith was talked to during the current match, used to trigger win/lose scene
//SEMITH_INVITED_PC:			If the PC was invited by Semith to check by his apartment (true or undefined)
//SEMITH_DAY_LAST_SMOKED:		Last day the PC and Semith smoked some Roshan blue (int, 1+)
//SEMITH_HAS_PC_IN_APARTMENT:	If the PC is currently in Semith apartment (true, false, or undefined)


//display semith's name + author infos
public function showSemith(nude:Boolean = false):void
{
	if(flags["MET_SEMITH"]) showName("\nSEMITH");
	else showName("IMPISH\nMAN");
	if(nude) showBust("SEMITH_NUDE");
	else showBust("SEMITH");
	author("Nonesuch");
}

//increase the amount of times the player had sex with Semith by x0
public function semithSexed(times:int):void {
	if(flags["SEMITH_SEXED"] == undefined) flags["SEMITH_SEXED"] = 0;
	flags["SEMITH_SEXED"] += times;
}

//returns true/false depending if pc played chess with Semith today
public function playedChessWithSemithToday():Boolean {
	if(days == flags["SEMITH_LAST_DAY_CHALLENGED"]) return true;
	else return false;
}

//between 12 o'clock and 17 o'clock display Semith chess blurb
public function playSemithChessScene():void 
{
	//if time is between 12 and 17 o'clock and player did not play against Semith today
	if(hours >= 12 && hours <= 17)
	{
		if(!playedChessWithSemithToday())
		{
			output("\n\nAs you enter the area, you notice the chess area sees some activity. Near one of the tables");
			if(!flags["MET_SEMITH"]) output(" a short, rather debonair male with red skin and a curving, scorpion-like tail sits relaxed on a bench, reading a media device.");
			else output(" Semith relaxes on a bench, leisurely flicking through his media device as ever. You could probably get a game from him if you wished.");
			if(!flags["MET_SEMITH"]) addButton(0, "Approach", approachSemithPlayingChess, undefined, "Approach", "Walk over to the impish looking man and say hello.");
			else addButton(0, "Semith", approachSemithPlayingChess, undefined, "Semith", "Walk over to Semith and say hello.");
		}
		else
		{
			if(flags["MET_SEMITH"]) addDisabledButton(0, "Semith", "Semith", "You already said hello to Semith.");
		}
	}
}

//checks if the player wins the chess game with Semith
public function winsSemithsChessGame():Boolean 
{
	var random:int;
	var won:Boolean = false;
	
	//if pc int below 60%, 1/5 chance of wining
	if(pc.IQ() < 60) 
	{
		random = rand(5);
		if(random == 0) won = true;
	}
	//if pc int is between 60% und 80%, 2/5 chance of wining
	else if(pc.IQ() >= 60 && pc.IQ() <= 80) 
	{
		random = rand(5);
		if(random <= 1) won = true;
	}
	//if pc has 80% Int or more, 2/3 chance of wining
	else 
	{
		random = rand(3);
		if(random <= 1) won = true;
	}
	
	return won;
}

//returns true or false depending if int was gained from the chess match or not
public function attemptIntGainFromSemithChessMatch(): Boolean
{
	var old_int:int = pc.intelligence();
	var new_int:int = pc.slowStatGain("intelligence", 1);
		
	if(new_int > old_int) return true;
	else return false;
}

//talk to Semith out on North West Plaza
public function approachSemithPlayingChess():void 
{
	clearOutput();
	showSemith();
	
	if(!flags["MET_SEMITH"]) {
		output("The red-skinned male sees you coming, leisurely flicks off his device and gives you a good-humored smile.");
		output("\n\n<i>“Ah! Here for a game of chess? I do hope so. There’s a real lack of challengers on this station.”</i> He offers you his hand.");
		
		if(pc.tallness > 77) output(" The fact he has to climb onto the bench to do this does not seem to harm his air of self-possession. His hand");
		else output(" It");
		
		output(" feels hot and strangely smooth in your grip; aside from his head the alien’s skin is hairless and quite smooth. <i>“The name’s Semith, pleased to meet you. And you might be...?”</i>");
		output("\n\nYou tell him.");
		output("\n\n<i>“[pc.name] Steele, you say?”</i> His eyebrows raise and his tail curls inwards. <i>“Well, in that case I absolutely insist you sit down. I must see how one of my future business rivals plays!”</i>");
		
		flags["MET_SEMITH"] = true;
		
		if(!CodexManager.entryUnlocked("Vulkrimi")) 
		{
			output("\n\n<b>Your codex vibrates, discretely informing you that it has updated with the details of Semith’s race - the vulkrimi.</b>");
			CodexManager.unlockEntry("Vulkrimi");
		}
		//update Semith display name after introduction
		showSemith();
	} else {
		output("Semith sees you coming, and gives you his lazy, trademark, smile as he puts down his device.");
		output("\n\n<i>“Good afternoon, [pc.name]. Here for a game, I hope?”</i> Impish enthusiasm glitters in his eyes.");
	}
	
	processTime(3);
	
	clearMenu();
	addButton(0, "Play", playChessWithSemith, undefined, "Play", "Sit down to play a match of chess with Semith.");
	addButton(1, "Decline", notPlayChessWithSemith, undefined, "Decline", "You decline Semith’s offer to play chess with him.");
}

//decline playing chess with Semith
public function notPlayChessWithSemith():void 
{
	clearOutput();
	showSemith();
	
	output("<i>“Maybe some other time,”</i> you say. The vulkrim sighs.");
	output("\n\n<i>“What a pity. I’m usually here in the afternoons, if you ever get the itch.”</i> He returns to his screen.");
	
	processTime(1);
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

//play chess with Semith
public function playChessWithSemith():void 
{
	clearOutput();
	showSemith();
	
	//reset talk rounds for this match
	//once player talked twice, determine winner/loser of the match
	flags["SEMITH_TALK_ROUND"] = 0;
	//make sure Semith NPC flag is visible even as time passes beyond 17 o'clock
	flags["SEMITH_IS_IN_CHESS_AREA"] = true;
	
	output("You plant yourself down at the white end of the nearby table, and Semith sits down opposite. The holographic display flicks on, your pieces arrayed in front of you - sideways, upwards, and once the game begins, increasingly in a quantum there/not there state. 4D chess is not for the faint-hearted.");
	output("\n\n<i>“So how has Tavros been treating you, [pc.name]?”</i> asks the dapper vulkrim, studying your first move with a measured smirk, before gazing into your eyes. Perhaps he hopes to distract you with conversation. Perhaps two can play at that game.");
	
	processTime(2);
	
	semithTalkNavigation();
}

//buttons for talking with Semith out on North West Plaza
public function semithTalkNavigation(activeTopic:Function = undefined):void 
{
	clearMenu();
	
	if(activeTopic == semithAppearance) addDisabledButton(0, "Appearance", "Appearance", "You are looking at him right now.");
	else addButton(0, "Appearance", semithAppearance, undefined, "Appearance", "Give the vulkrim a once over.");
	if(activeTopic == semithTalksAboutKnowingThePc) addDisabledButton(1, "Know me?", "Know me?", "You just spoke about that.");
	else addButton(1, "Know me?", semithTalksAboutKnowingThePc, undefined, "Know me?", "Find out how Semith knows you by name.");
	if(activeTopic == semithTalksAboutVulkrimi) addDisabledButton(2, "Vulkrimi", "Vulkrimi", "You just spoke about that.");
	else addButton(2, "Vulkrimi", semithTalksAboutVulkrimi, undefined, "Vulkrimi", "Ask Semith about his race.");
	if(activeTopic == semithTalksAboutHimself) addDisabledButton(3, "Him", "Semith", "You just spoke about that.");
	else addButton(3, "Him", semithTalksAboutHimself, undefined, "Semith", "Ask the vulkrim about himself.");
}

//renders a description of Semith's appearance.
//Param: Boolean: if function was called during chess scene. (False: it was called from the apartment)
public function semithAppearance(calledForChessScene:Boolean = true): void 
{
	clearOutput();
	showSemith();
	
	output("Semith is a 4\'11\" maroon-skinned vulkrim. He isn’t squat or dwarf-like, his thin but fairly muscular frame entirely proportional to his size. Like most vulkrimi he has had the majority of his natural carapace armor removed, retaining only the two covering his shoulders, like two shiny black shoulder-guards. His skin is smooth, hairless and looks like it might be quite stretchy. However, he has gene-modded himself so he has dark brown, human-like hair on his head: shoulder length and swept back on his scalp, crafted into arching brows and an immaculate beard on his face. He has a narrow but quite handsome face, with a strong, roman nose, high cheekbones and pointed ears, and sports a pair of small, curved horns. He dresses as smartly as he grooms, in a casual blazer, cotton shirt and trousers.");
	output("\n\nHis most obviously alien feature is his big, scorpion-like tail, bursting out above his thin, athletic butt and curving right around over his head. He has had it de-stung, so it simply has a blunt, ankylosaurus-like tip - albeit with a curious, horizontal slit.");

	if(flags["SEMITH_SEXED"] > 0) output(" You know by now that inside that is sheathed a six inch gene-modded secondary dick, which is quick to become erect and slide out when aroused. Between his smooth, muscular thighs his other foreskinned cock - a similar size and shape but complete with a bloated pair of balls and a sheath - is to be found.");
	
	output("\n\nAltogether he gives the impression of what Lucifer might look like, were he a quite small, semi-retired businessman giving it some casual charm.");
	
	if(calledForChessScene) semithTalkNavigation(semithAppearance);
	else semithMenuNavigation(semithAppearance);
}

public function semithTalksAboutKnowingThePc():void 
{
	clearOutput();
	showSemith();
	
	output("<i>“So you know my name?”</i> you ask quizzically, as you move a knight to c3(y)²."); // or: c3(y)<sup>2</sup>, or: c3(y)^2, if the unicode character derps.
	output("\n\n<i>“Well, of course!”</i> replies Semith, who responds by tapping a pawn forward in three dimensions with unnerving speed. <i>“I only dabble in stocks and shares really - I haven’t the will or need for it to be a full-time job - but even I know about Steele Tech, and how its former owner decided to select its inheritor. Sensational stuff! Brilliantly eccentric billionaire behaviour, the kind of thing every businessman dreams of being able to do one day. On some of the insider tip websites I go to, the dedicated thread about you doubles in size every minute.”</i>");
	output("\n\n<i>“Really?”</i> you say uneasily. Some sympathy creeps into Semith’s mischievous, smouldering gaze.");
	output("\n\n<i>“It must be quite tough being saddled with that kind of celebrity, particularly straight after the death of your father,”</i> he goes on in a more sober tone. <i>“I am sorry. I would hate to have that kind of attention fixed on me, whatever the circumstances were.”</i> He considers the board thoughtfully. <i>“If it’s any consolation, I don’t think you’re that widely talked about outside of business circles. It’s just the way that world is - fevered and incestuous. Fortunes are on the line, after all.”</i>");
	output("\n\n<i>“How is Steele Tech doing?”</i> you ask, as you take/don’t take his castle.");
	output("\n\n<i>“Shares collapsed a bit after Victor’s retirement, but have been doing pretty well since,”</i> the vulkrim replies, reasserting a small part of perceivable reality and warping his castle back in. <i>“I took the opportunity of the fall in shares to purchase some.”</i> He grins at you, unable to contain his urbane wickedness. <i>“I have something like a 0.4% interest in your continued successes, [pc.name]. Why do you think I didn’t suggest gambling money on this game?”</i>");
	
	processTime(20 + rand(10));
	
	flags["SEMITH_TALK_ROUND"]++;
	
	if(flags["SEMITH_TALK_ROUND"] < 2) semithTalkNavigation(semithTalksAboutKnowingThePc);
	else
	{
		clearMenu();
		addButton(0, "Next", wrapUpSemithChessMatch);
	}
}

public function semithTalksAboutVulkrimi():void 
{
	clearOutput();
	showSemith();
	
	output("<i>“Tell me about the vulkrimi,”</i> you say, as you ponder that part of the board which can be seen in three dimensions. <i>“Are you guys pretty active in the rush?”</i>");
	output("\n\n<i>“In a manner of speaking,”</i> Semith replies. The compact, red-skinned devil watches you think with measured interest, as if even the wrinkles of your frown are telling him something about you. <i>“We have a reputation of being a pack of ne’er-do-wells, only travelling to the frontier in order to engage in piracy. Which is difficult for me to say isn’t true, seeing as I used to be a pirate myself. Got out of that game a while ago of course, moved my fortune into a more sanitary profession. A slightly more sanitary profession,”</i> he amends with a quiet grin.");
	output("\n\n<i>“What’s with the tail?”</i> you ask, biding for time. Maybe if you sacrifice your knight you can draw out his queen, wherever it is...");
	output("\n\n<i>“The secret to our continued existence, that’s what!”</i> Semith exclaims, his tail flexing inwards in surprise at the question. <i>“We are an all male race, [pc.name]; our women died out many centuries ago. In order to reproduce we use our stings to, ah, imbue wombs in others...”</i> The blunt tip of his scorpion-like appendage jerks inwards and outwards suggestively. <i>“...before doing the deed as you might normally expect. I had my sting removed when I moved into business, though. I got the distinct impression it made other people uncomfortable - not really the kind of thing someone wants to see bobbing over the head of your stockbroker. I had it gene-modded to something more... traditionally enjoyable.”</i> Your eyes are unavoidably drawn to the wide, horizontal slit on the club-like end to his tail. It doesn’t look like a vagina; more like a housing for something...");
	output("\n\n<i>“And your people weren’t tempted to gene mod some of themselves back into females?”</i> you query. You decide to shift your knight into a paradoxical state instead.");
	output("\n\n<i>“We can no longer produce pure strain vulkrimi that way,”</i> he sighs, sliding a bishop six spaces forward on the other side of the board. <i>“And our culture has changed to accommodate how we are now. Being both male and bearing children is expected amongst us, [pc.name], however difficult that might be for you to contemplate; please don’t imagine we are there to be improved. As far as gene-modding is concerned,”</i> he goes on in a lighter tone, <i>“that’s one of the reasons why the U.G.C. were still eager to uplift us, despite us being such a disreputable bunch of scoundrels. The likes of Xenogen were </i>desperate<i> to study our degradable womb-instilling properties. Thank goodness for corporate greed!”</i>");
	
	processTime(20 + rand(10));
	
	flags["SEMITH_TALK_ROUND"]++;
	
	if(flags["SEMITH_TALK_ROUND"] < 2) semithTalkNavigation(semithTalksAboutVulkrimi);
	else
	{
		clearMenu();
		addButton(0, "Next", wrapUpSemithChessMatch);
	}
}

public function semithTalksAboutHimself():void 
{
	clearOutput();
	showSemith();
	
	output("<i>“So you’re into business?”</i> you ask.");
	output("\n\n<i>“To a certain degree,”</i> Semith replies, grimacing as if the prospect of being ‘into business’ is a bit distasteful to him. <i>“I came into a large amount of wealth a few years back, and chose to invest most of it in a range of different stocks and shares. I live quite comfortably off liquidating the odd interest here and there, reinvesting in the right things when the opportunity arises.”</i>");
	output("\n\n<i>“Where did this wealth come from?”</i> you poke. You block the advance of his castle with a Euclidian pawn.");
	output("\n\n<i>“Piracy,”</i> he answers, with a winsome smile. <i>“Imagine, in the lead-up to the opening of the planetary rush, the level of traffic in and around major spaceports. Imagine the haste with which some commercial haulers planned their journeys, the lack of proper forethought or security. Imagine how eager some travellers were to jump to completely unknown systems, once the warp gates had opened. It was a bonanza, for some.”</i> His black eyes move back to the board.");
	output("\n\n<i>“Every pirate in the galaxy thinks the next job is their last,”</i> he goes on after a little while. <i>“They always need just a little more for the retirement fund. But the hardest part of the job is getting out of it. Actually saving your gains, instead of blowing it all on throbb and indentured hookers at the next station. Being smart enough to launder it little by little, in a way that doesn’t tie a U.G.C.-funded noose around your neck. Cutting your ties and disappearing in a way that isn’t going to plant a plasma bolt in your back. Not sticking out like a sore sting when you sidle back into legal society. And even then, if you can manage all that... you never stop looking over your shoulder. Never.”</i>");
	output("\n\nHe takes your pawn and smiles at you ruefully. <i>“Stay out of that game and concentrate on getting hold of your inheritance. Trust me on that, [pc.name].”</i>");
	
	processTime(20 + rand(10));
	
	flags["SEMITH_TALK_ROUND"]++;
	
	if(flags["SEMITH_TALK_ROUND"] < 2) semithTalkNavigation(semithTalksAboutHimself);
	else
	{
		clearMenu();
		addButton(0, "Next", wrapUpSemithChessMatch);
	}
}

//end the chess match, called up once the player picked two talk options
public function wrapUpSemithChessMatch(): void 
{
	clearOutput();
	showSemith();
	
	var intGained:Boolean = attemptIntGainFromSemithChessMatch();
	
	//PC loses against Semith
	if(!winsSemithsChessGame()) 
	{
		output("Semith taps a knight forward and then looks at you with the smug smirk of someone waiting for you to get the joke. It takes you a few moments to see it. He’s had you in checkmate for... how long? It just wasn’t observable in this part of the universe. You scowl.");
		if(intGained) output(" At least you can see how he managed to do it. You won’t let that happen next time!");
		else output(" It’s impossible for you to work out how that even happened! Stupid game.");
		
		output("\n\n<i>“Good game, [pc.name],”</i> the vulkrim says cheerily, leaning over the table to shake your hand. You are engulfed in his dense, slightly spicy aftershave.");
		if(flags["SEMITH_APARTMENT_ENTERED"] == true)
		{
			output("\n\n<i>“As ever. Drop by at mine, if you get the chance. Your company is always a pleasure.”</i> He holds your gaze hungrily for a moment longer, and then sweeps back to his park bench.");
		}
		else {
			output("<i>“It’s great to meet someone who’s up for the challenge. If you’re ever in the east side of the residential deck in the evening, do feel free to knock on number 107, come and have a smoke... or anything else that takes your fancy.”</i> He holds your gaze roguishly for a moment longer, and then sweeps back to his park bench.");
			output("\n\nHe certainly acts a lot taller than he is.");
		}
	}
	//Pc wins against Semith
	else 
	{
		output("Semith taps a knight forward and then looks at you with a smug smirk.");
		output("\n\n<i>“Checkmate.”</i>");
		output("\n\n<i>“Indeed,”</i> you reply. You reach over and move your castle back into three dimensional play, trapping his king. At the same time, his knight that you Schrödingered four turns ago winks out of existence. The vulkrim stares at the board, dumbfounded.");
	
		if(!intGained) output(" Honestly, this game was so easy to your masterful intellect that you didn’t have to stretch yourself at all.");
		else output(" You smirk. Your brain throbs a bit from some of the calculations you had to make, but you feel a surge of confidence from the fact that they ultimately paid off.");
	
		output("\n\n<i>“Amazing,”</i> Semith says, shaking his head, before looking back at you with admiration. <i>“Ha! Very well played.”</i> He leans over and shakes your hand vociferously. You are engulfed in his dense, slightly spicy aftershave.");
		if(flags["SEMITH_APARTMENT_ENTERED"] == true)
		{
			output("\n\n<i>“As ever. Drop by at mine, if you get the chance. Your company is always a pleasure.”</i> He holds your gaze hungrily for a moment longer, and then sweeps back to his park bench.");
		} else {
			output("<i>“It’s great to finally meet a worthy player on this station. If you’re ever in the east side of the residential deck in the evening, do feel free to knock on number 107, come and have a smoke... or anything else that takes your fancy.”</i> He holds your gaze roguishly for a moment longer, and then sweeps back to his park bench.");
			output("\n\nHe certainly acts a lot taller than he is.");
		}
	}
	
	processTime(10 + rand(5));
	
	flags["SEMITH_INVITED_PC"] = true;
	flags["SEMITH_IS_IN_CHESS_AREA"] = false;
	flags["SEMITH_LAST_DAY_CHALLENGED"] = days;
	//rooms["RESIDENTIAL DECK 7"].removeFlag(GLOBAL.NPC);
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

//check if the player can enter the apartment and what message to display if not
public function knockToEnterSemithsApartment():void
{
	clearOutput();
	clearMenu();
	
	//inform player he can't enter because he doesn't know the apartment owner
	if(!flags["SEMITH_INVITED_PC"])
	{
		output("You don’t know anyone here.");
		addButton(0, "Next", mainGameMenu);
	}
	//or tell him Semith isn't home
	else if(flags["SEMITH_INVITED_PC"] && hours <= 17)
	{
		//player tried to visit before 17 o'clock
		if(hours < 12) output("It is probably too early in the day to visit Semith");
		else output("Semith doesn’t appear to be home");
		output(", maybe you should come back later.");
		addButton(0, "Next", mainGameMenu);
	}
	else
	{
		showSemith();
		output("You rap against the apartment door.");
		output("\n\nSemith appears as the door opens. <i>“Hello, [pc.name], good to see you again. Please, come in.”</i>");
		
		flags["NAV_DISABLED"] = undefined;
		
		addButton(0, "Next", enterSemithsApartment);
	}
}
public function enterSemithsApartment():void
{
	//showSemith();
	
	move("RESIDENTIAL DECK SEMITHS APARTMENT");
	
	flags["SEMITH_HAS_PC_IN_APARTMENT"] = true;
	
	addButton(0, "Semith", semithMenu, true);
}
public function playSemithsApartmentScene():Boolean
{
	if (hours <= 17)
	{
		//player was in the apartment but should be booted from there, because its after midnight 
		//(Maybe he smoked Roshan with Semith or he arrived late to begin with)
		if(flags["SEMITH_HAS_PC_IN_APARTMENT"] == true)
		{
			clearOutput();
			showSemith();
			output("Before you even realize it’s past midnight and Semith escorts you, almost regretfully, to the door. <i>“Come by whenever you’re in the neighbourhood, [pc.name].");
			//need to check last day, as it's after midnight now
			if(flags["SEMITH_DAY_LAST_SMOKED"] != undefined && flags["SEMITH_DAY_LAST_SMOKED"] +1 == days) 
			{
				output(" A chess player who says exactly what’s on their mind after a few puffs! You are truly wonderful.");
			}
			else output(" It’s always good talking to you.");
			output("”</i>");
			lockSemithsDoor(false);
		}
		//in either case throw them out
		moveTo("RESIDENTIAL DECK 10");
		showLocationName();
		clearMenu();
		addButton(0, "Next", mainGameMenu);
		return true;
	}
	//or, if player knows Semith and arrives between 17 o'clock and midnight, show his apartment
	else
	{
		showSemithsApartment();
		return false;
	}
}

public function showSemithsApartment():void {
	//showSemith();
	
	flags["SEMITH_HAS_PC_IN_APARTMENT"] = true;
	
	addButton(0, "Semith", semithMenu);
}

//Semith menu when approaching him in his apartment
public function semithMenu(fromEntry:Boolean = false):void {
	clearOutput();
	showSemith();
	if(fromEntry) output("The vulkrim directs his attention towards you.");
	else output("<i>“Oh! [pc.name]. How nice,”</i> the vulkrim says as he turns towards you.");
	output(" Classical jazz billows from a positively old-fashioned looking device sitting on a nearby shelf. He looks more disheveled than he usually does in the park, with the top buttons on his shirt undone and his swept back hair is slightly ruffled.");
	if(flags["SEMITH_DAY_LAST_SMOKED"] != days) output(" <i>“I was just about to have a puff of Roshan blue. Care to join me?”</i>");
	
	semithMenuNavigation();
}

//buttons for talking with semith in his apartment
public function semithMenuNavigation(activeTopic:Function = undefined):void {
	clearMenu();
	
	if(activeTopic == semithAppearance) addDisabledButton(0, "Appearance", "Appearance", "You are looking at him right now.");
	else addButton(0, "Appearance", semithAppearance, false, "Appearance", "Give the vulkrim a once over.");
	
	if(activeTopic == semithEnjoysSomeRoshanBlue) addDisabledButton(1, "Sure", "Roshan Blue", "You just did that - for a couple of hours no less.");
	else if(flags["SEMITH_DAY_LAST_SMOKED"] == days) addDisabledButton(1, "Roshan", "Roshan Blue", "You had enough Roshan blue for one day.");
	else addButton(1, "Sure", semithEnjoysSomeRoshanBlue, undefined, "Roshan Blue", "It’ll feel good, man.");
	
	if(activeTopic == semithSexMenu) addDisabledButton(2, "Sex", "Sex", "You just did that.");
	else
	{
		if
		(	(	!pc.hasGenitals()
			||	(pc.isHerm() && pc.biggestVaginalCapacity() < chars["SEMITH"].cockVolume(0) && pc.cockThatFits(chars["SEMITH"].analCapacity()) < 0)
			||	(pc.hasVagina() && pc.biggestVaginalCapacity() < chars["SEMITH"].cockVolume(0))
			||	(pc.hasCock() && pc.cockThatFits(chars["SEMITH"].analCapacity()) < 0)
			)
		&&	pc.analCapacity() < chars["SEMITH"].cockVolume(0)
		)
			addDisabledButton(2, "Sex", "Sex", "You can’t do this for some reason... You’ll need to have genitals or an asshole that can fit him...");
		else if(pc.lust() >= 33) addButton(2, "Booty Call", semithSexMenu, undefined, "Booty Call", "You’re here to fuck. Make that clear.");
		else addDisabledButton(2, "Booty Call", "Booty Call", "You are just not aroused enough for that.");
	}
	
	addButton(14, "Leave", mainGameMenu);
}

//player and Semith smoke some Roshan blue
public function semithEnjoysSomeRoshanBlue():void {
	clearOutput();
	showSemith();
	
	output("Semith ushers you into his lounge. You sink into one of his many overstuffed leather couches and watch as he fiddles with a small fountain-like device at the centre of the room. With a pleasingly sensuous hum, a huge, shimmering bubble oozes out of the thing’s vertically aligned nozzle and wobbles through the air towards you, apparently of its own volition.");
	output("\n\n<i>“Be my guest,”</i> grins Semith, sitting back on one of his armchairs and watching his device protrude more and more bubbles into the air. The first bubble has floated close enough for you to see that, within its diaphanous, rainbow skin, it’s holding a cloudy blue substance. You suppose you’ve just got to - you reach forward and sink your [pc.lips] into the bubble. The tickly, slightly wet membrane attaches itself to your mouth, and fades away when you inhale the blue smoke, leaving only the memory of its touch.");
	output("\n\nWhat an intriguing way of doing... that. You sigh as you feel the warm, perfumed air permeate through you, making you feel like your mind is slowly, carefully being unraveled. The bubbles hanging in the air and the piano noodling stop seeming slightly weird, more positively delightful.");
	output("\n\n<i>“Do you actually believe in all of this stuff?”</i> you ask. The thought tickles you enough to " + pc.mf("chuckle", "giggle") + " hysterically. Another bubble floats over helpfully, and you breathe into it happily. <i>“The chess, the artwork, the - music. All the while you fiddle with people’s money and smoke blue. You really are a pirate pretending to be a gentleman, aren’t you?”</i>");
	output("\n\n<i>“I used to pretend,”</i> Semith admits. The small demon gazes at the ceiling ruminatively. <i>“Then I found I genuinely enjoyed this life.”</i>");
	output("\n\nYou spend an extremely relaxing couple of hours with the vulkrim, taking advantage of the sensuous smoke to disseminate all manner of subjects. The insights you come up with are brilliant, universe-shaking.");
	output("\n\n<i>“Very good, yes,”</i> laughs Semith. <i>“I never did truly see how incredible a five-fingered hand is! But I think you’ve had enough.”</i>");
	
	//Effect removed when player next sleeps, see game.as sleep()
	//lowers willpower by 30% ups XP Gain by 25%
	pc.createStatusEffect("Roshan Blue",0,0,0,0,false,"Icon_DizzyDrunk","You see everything so very clear now - if only you could focus a little better.",false,0);
	flags["SEMITH_DAY_LAST_SMOKED"] = days;
	
	//A couple of hours later
	processTime(120 + rand(120));
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function semithSexMenu():void {
	clearOutput();
	showSemith(true);
	
	output("<i>“Actually,”</i> you say, giving him a devilish grin which easily beats his own, <i>“I’m here for something a bit more");
	if(pc.isBimbo()) output(", like,");
	output(" vigorous. What do you think?”</i>");
	
	output("\n\nSemith’s eyebrows arch slightly, and he considers you up and down with measured interest.");
	output("\n\n<i>“I think,”</i> he murmurs, <i>“I could get on board with that.”</i>");
	output("\n\nHe curls his hot hand into yours and leads you into his living room. The big, squashy, leather-encased sofas are perfect to curl your [pc.legOrLegs] onto and explore the compact demon’s body with your hands, removing his shirt and trousers to reveal more and more of his lightly toned, smooth, red-skinned body");

	if(pc.isChestGarbed()) {
		output(" whilst he does the same with your clothes, hot, skilled fingers peeling off your [pc.upperGarments]");
		if(pc.hasBreasts()) output(" to let your [pc.chest] loll out");
	}
	if(pc.isCrotchGarbed()) {
		output(" before lying back and watching with open hunger as you remove your ");
		//don't undress armor again, done above
		if (pc.isChestGarbed()) output("[pc.lowerGarment]")
		else output("[pc.lowerGarments]")
		if(pc.hasCock()) output(" and let [pc.eachCock] flop out.");
	}
	
	output(" His thick, six inch cock is already pointing urgently upwards, protruding well out of its sheath and foreskin, but it seems to tighten even more when you touch the curious scattering of small holes below his shoulder blades, his breath catching in his throat.");
	output("\n\nSomething bobbing above your head moves your attention upwards; from the round tip of his curving scorpion tail another blunt, bulbous penis is emerging, not as erect as the one between his legs perhaps, but even thicker and longer. The deeply masculine smell of combined aftershave, leather and musk is heavy in your nostrils, and heat is pulsing with increasing urgency down to your [pc.groin].");
	output("\n\n<i>“So what,”</i> husks a naked Semith, lying back and drinking you in with relaxed enjoyment, <i>“did you have in mind?”</i>");
	
	//Don't pass time here, else it can happen pc gets booted from the room (which is fine after sex)
	
	if(!pc.hasCock()) addDisabledButton(0, "Buttfuck", "Buttfuck", "You need a cock to buttfuck the vulkrim.");
	else if (pc.hasCock() && pc.cockThatFits(chars["SEMITH"].analCapacity()) < 0) addDisabledButton(0, "Buttfuck", "Buttfuck", "You are too well endowed for Semith.");
	else addButton(0, "Buttfuck", semithSexButtfuck, undefined, "Buttfuck", "Fuck his snack-sized ass.");
	
	if(!pc.hasVagina()) addDisabledButton(1, "Doggie", "Doggie", "You need a pussy for Semith to fuck it.");
	//can't imagine there are pc which can't fit in Semith mini dick, but checked non the less:
	else if (pc.hasVagina() && pc.biggestVaginalCapacity() < chars["SEMITH"].cockVolume(0)) addDisabledButton(1, "Doggie", "Doggie", "Your tiny cunt is too small for Semith’s prick.");
	else addButton(1, "Doggie", semithSexDoggieStyle, undefined, "Doggie", "Take his cock in the pussy.");
	
	if(pc.analCapacity() < chars["SEMITH"].cockVolume(0)) addDisabledButton(2, "Catch Anal", "Catch Anal", "Semith’s dick is too much for your butt.");
	else addButton(2, "Catch Anal", semithSexCatchAnal, undefined, "Catch Anal", "Take it up the butt in a consensual manner.");
}

public function semithSexButtfuck():void {
	clearOutput();
	showSemith(true);
	
	var x:int = pc.cockThatFits(chars["SEMITH"].analCapacity());
	if(x < 0) x = pc.smallestCockIndex();
	
	output("You answer that question by forcibly turning that smirk over into the leather, exposing his rear. His red hips are fairly full and muscular, but the ass itself is pert and narrow - incredibly cutely-sized, even for a guy as small as this. You clamber on top of him, breathing into his pointed ear and bending the chitin of his curving tail away and down with the weight of your [pc.chest], flopping your [pc.cock " + x + "] onto his tiny buttocks. The rounded segments of his tail quiver slightly beneath you.");
	output("\n\n<i>“You’ll, um... be careful back there, won’t you?”</i> Semith says, slightly muffled. For the first time, he sounds less than completely self-assured. He tenses up a bit when you begin to rub your cock between his asscheeks, delighting in how smooth and warm his stretchy skin is. You frown; him being all tensed is absolutely no good for your purposes. <i>“I don’t... very rarely... like this...”</i> He trails off in a sighing gasp when you reach around and find those evidently extremely sensitive holes below his shoulder blades. You stroke at those at the same time as you slide your [pc.cock " + x + "] along the line of his crack, using that wonderful, sleek pertness to work more heat and urgency into your sex whilst you make him get used to its presence, opening his cheeks with your hardness to expose his incredibly tight, red anus.");
	output("\n\nHe tightens up again when you press your [pc.cockhead " + x + "] against it, gasping gruffly, and for a moment you think it’s going to be impossible. The need swelling your");
	
	if(pc.balls > 0) output(" [pc.balls]");
	else output(" cock");
	
	output(" compels you with pulsing insistence to find a solution. You move a hand down from the vulkrim’s holes to find the thick root of his semi-erect, foreskinned dick, first gently stroking it and then firmly wringing it when it becomes rock-hard and almost burningly hot in your hand.");
	output("\n\n<i>“Ooh. Okay, so you’re... good at that...”</i> huffs Semith, arching his back a bit, tail bumping excitedly into your [pc.chest]. You grin and up the jerking of your wrist a bit, still stroking away at his holes with your other hand. You haven’t withdrawn your [pc.cockhead " + x + "], and you can feel his incredibly tight rose relaxing a bit around it. <i>“Keep doing it exactly like that...”</i> demands the pint-sized alien, seemingly unaware. <i>“Exactly like that...”</i>");
	output("\n\nYou push forward and penetrate that incredibly tight ass, opening his fuckhole with one determined thrust of your [pc.hips]. He cries out and clenches up almost unbearably around your bulging meat... and then he relaxes slightly, with deep breaths getting used to how you’re stretching him, aided by the deep lust you’ve stoked in him by teasing his most sensitive areas. You grin; putty in your hands. You keep wanking him with generous pulls of your wrist as you bury more and more of your [pc.cock " + x + "] in him with careful pushes of your hips, luxuriating in how wonderfully close his hot flesh clutches around you, urging you on to make full, flagrant use of this red cocksleeve.");

	if(pc.tallness > 64) output("\n\nAs your rut deepens, it gets increasingly hard to ignore the urge to pick the little devil up, bounce him on your lap, walk him around embedded on your dick... as fun as that might be, you feel that might be a little rude. Still, once every inch of your cock is rammed deep into his ass, it’s impossible not to grip his shoulders and move him up and down your length, using him like an onahole that grunts and gasps, clearly exasperated by this treatment but too caught up by the intensity of the sex to be able to vocalize it.");
	else output("\n\nIt’s fairly unusual for you to have a partner who doesn’t completely overwhelm you with their size. You are able to grip your [pc.legOrLegs] into his sofa, clasp his strong hips with your hands and really pump into the little devil, enjoying the chorus of gasps and grunts this draws out of him.");
	pc.cockChange();

	output("\n\nYou clap your [pc.hips] Semith’s pint-sized ass again, shivering and biting your [pc.lips] at how his hot tunnel clenches up and down your [pc.cock " + x + "]. Oh Void, that is good. It’s imperative you make him enjoy this as much as possible, so he lets you do it again, and again... the bobbing of his tail ahead of you, his second, cock flopping around above his well-groomed head, catches your attention. You catch it, move your hand up and down his thick meat at the same time as once again, you send your masterful grip running along the shaft between his hard hips, giving him a double reach-around as you continue to thrust into his delightful tightness.");
	output("\n\n<i>“Fuck,”</i> groans Semith, hands tightening on the leather, head thrown back. <i>“That’s... fucking ridiculous... ”</i> He simply howls when you gently circle the sensitive, bulging head of his tail cock with a single finger, and his tunnel clutches up around the steady pump of your [pc.cock " + x + "]. Both of his dicks bulge and then flex out jets of pearly white cum, spattering freely over the soft leather and carpet, coaxed out by the firm wring of your hands and the filthy slap of your");

	if(pc.balls > 0) output(" [pc.balls]");
	else output(" [pc.hips]");
	
	output(" against his cute, miniscule butt. A few stars appear in your eyes from the way his dual orgasm makes him tighten down on your buried, straining dick, but you manage to keep an handle on your own overwhelming arousal, waiting for the vulkrim to cry and spurt out his last before piling gleefully into your own juicy high.");
	output("\n\nSemith can only groan woozily, flopped over the arm of his settee as you clasp his naked, flesh and pack his guts full of [pc.cum], flexing into him again and again, surging out every last drop of your liquid heat.");

	if(pc.cumQ() > 1500) output(" There’s no way someone so small can take the gallons of seed you spray out, and a large amount of your jizz mingles with Semith’s, dripping and splattered everywhere.");

	output("\n\nWhen you are finally spent, you withdraw your gently throbbing cock out of the little demon’s badly abused ass - it comes free with an almost audible “pop” - and flop back onto a part of the sofa not plastered in cum, watching him with a glow of post-coital contentment as he slowly turns over, chest still heaving, and looks over at you with disbelief and gratification fighting for control of his narrow, handsome features.");
	output("\n\n<i>“Do you do this a lot, then?”</i> he says eventually. The amount of semen currently soaking into his expensive furnishings catches his attention and he sighs. <i>“Barge into people’s homes and then bugger them senseless? Even I didn’t do that in my pirate years.”</i>");
	output("\n\n<i>“Wasted opportunity, if you ask me,”</i> you reply with a winning smile. He flicks his tail at you exasperatedly as he gets up, cocks flopping, to go find his clean-bot, but you can tell from the satiated smile he’s trying not to show you that you succeeded in making him enjoy this.");
	output("\n\nBy the time you’ve cleaned yourself up Semith is back in his shirt and trousers, lolling back and enjoying his smoke-bubble machine; it’s as if nothing occurred at all.");
	
	pc.orgasm();
	semithSexed(1);
	processTime(20 + rand(15));
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function semithSexDoggieStyle():void {
	clearOutput();
	showSemith(true);
	
	var x:int = pc.cuntThatFits(chars["SEMITH"].cockVolume(0));
	if(x < 0) x = pc.biggestVaginaIndex();
	
	//for multi cunted pc, check if/what second vag can take Semith's cock
	var hasSecondVaginaWhichCanFitSemithCock:Boolean = false;
	var y:int = 0;
	if(pc.vaginas.length > 1) {
		
		for(var index:int = 0; index < pc.vaginas.length; index++) {
			//ignore already found vag
			if(x != index) {
				//since the tail lacks a length/width take Semith cock volumn + 10 as
				//the tail is described as 'thicker' at some point
				if(pc.vaginalCapacity(index) >= chars["SEMITH"].cockVolume(0) + 10) {
					y = index;
					hasSecondVaginaWhichCanFitSemithCock = true;
				}
			}
		}
	}
	
	//if pc is tail sexed in this scene
	var tailSexed:Boolean = false;
	
	output("You smirk and disengage from him, deliberately sliding your [pc.leg] over the hot, red hardness of his dick as you turn around and give him a coy look around the curve of your [pc.butt].");
	output("\n\n<i>“I dunno, big boy,”</i> you tease. <i>“See anything that interests you?”</i>");
	
	//can't use [pc.eachVagina] because of sentence begin
	output("\n\nYour [pc.vaginas]");
	if(pc.vaginas.length > 1) output(" are");
	else output(" is");
	
	output(" already");
	
	if(pc.wettestVaginalWetness() < 5) output(" slick with arousal");
	else output(" drooling eager arousal down your [pc.thigh]");
	
	output(", and little twinges of pleasure reach into your core when Semith silently shifts over and traces your labia with his fingers. He fingers you curiously but skilfully, holding back whatever eagerness he feels to explore your wet sex thoroughly, stoking your own heat as he reaches his hot, smooth fingers up to the knuckle inside your tunnel");
	if(pc.hasClit()) output(" and curling over [pc.eachClit]");
	output(", until need is prickling your [pc.skin] and your breath is coming thick.");
	
	//different kind of interjections based on height, amount of vaginas
	if(pc.tallness > 78) 
	{
		output("\n\n<i>“Hmm,”</i> he says at last, humor and lust rising and ebbing in his well-pronounced tones. Both of you kneeling as you are, the size difference between you is such that he’s pretty much addressing your pussy. <i>“This is going to be slightly tricky. But... ”</i> He grips your [pc.hips] and winches himself upwards. Over your shoulder, you watch the impish male stand up and position himself so his feet are on");
		//technically what apears to be the knee of a horse is not actually its knee
		//but I doubt people really care
		if (pc.isTaur()) output(" the backs of your knees");
		else output(" your [pc.legOrLegs]");
		output("\n\n; on the tips of his toes, he can press his hard, thick meat against the folds of your [pc.vagina " + x + "]. Your laugh turns to a gasp as he shifts his athletic hips to firmly push his smooth head against your dripping hole. <i>“...what kind of vulkrim would I be if I didn’t at least try?”</i> he finishes with a lusty grin.");
	}
	else if(pc.tallness < 59) 
	{
		output("\n\n<i>“Oh, this is very nice,”</i> he says at last, and you can hear genuine delight in his urbane, mischievous tone. His other hand runs up your flank, thrilling at what it can reach - and grip. Your " + pc.mf("chuckle", "giggle") + " turns into a gasp when his fingers reach your [pc.chest]");
		if(pc.hasNipples()) output(" and encircle a [pc.nipple].");
		else output(" brushing it with his thumbs.");
		
		output(" <i>“It is so rare for me to enjoy someone even more appropriately sized than me,”</i> he growls lustfully. His other set of digits leave your [pc.vagina " + x + "] and are replaced by the feeling of his hard, thick meat brushing against your folds. <i>“I am going to relish every moment of this.”</i>");
	} 
	else if(pc.vaginas.length > 1)
	{
		output("\n\n<i>“My word,”</i> he murmurs, fingers curling into first one of your pussies then");
		if(pc.vaginas.length == 2) output(" the other");
		else output(" another");
		
		output(" until they are");
		if(pc.vaginas.length == 2) output(" both");
		else output(" all");
		
		output(" unfurled and wet, the need to get filled pulsing through you. You can hear your own intense lust mirrored in his own quiet tones. <i>“That </i>is<i> interesting. I wonder...?”</i> Thoughts about what he might be considering are pushed out of your head when, a second later, he pushes his hard, thick meat against the folds of your [pc.vagina " + x + "].");
	}
	
	//Else just start the fun
	output("\n\nWith a long, drawn-out sigh, the small, athletic vulkrim slides his cock home, opening your hole with his pointed head and filling your eager sex up with hot, thick demon dick. There’s practically no friction; his stretchy skin offers no resistance as it slides further and further in, right up until you feel his hot, dense balls touch your [pc.thighs]. The folds of his foreskin, though... you whuff as he draws back and they drag at your sensitive walls, then gasp slightly when he grasps you tight and pumps home again, pleasure momentarily inundating you. After several slow, loving strokes like this, Semith finds a steady rhythm, the tight muscles you can feel in his hot, slim hips easily able to keep him ardently plunging his fat, six inch cock into the wet satin of your [pc.vagina " + x + "].");
	
	pc.cuntChange(x, chars["SEMITH"].cockVolume(0), true, true, false);
	
	//Another blurb for the tall
	if(pc.tallness > 78) 
	{
		output("\n\nHe struggles for the support to properly go at the mighty edifice of your rear, standing as he is on tiptoes just to reach it; you have to " + pc.mf("laugh", "giggle") + " and gaze back at him with heavy-lidded condescension when twice he almost falls out.");
		output("\n\n<i>“Need to think,”</i> he huffs ruefully the second time. <i>“Really quite difficult when you’re making love to " + pc.mf(" a giant", " an amazone") + "... ”</i> He solves the problem by energetically wrapping his wiry legs around the upper part of your [pc.hips], providing all the traction he needs to clutch your sides and powerfully hammer his hot, smooth dick into your [pc.vagina " + x + "] with fervent pumps of his tight hips. He bends into you deeply from this position, making you quiver with pleasure, your laughter replaced with sighing enjoyment each time he presses home, submitting to the filthy pleasure of being bent over and fucked by someone much smaller than you.");
	}
	
	//Tail sex checks:
	//check if Semith can fuck the pcs cunt tail with his scorpion tail cock 
	if(pc.hasCuntTail()) 
	{
		output("\n\n<i>“Oh hello,”</i> he suddenly says, slowing down. <i>“Who are you?”</i> It’s initially impossible for your pleasure-simmering mind to imagine what he’s talking about; it’s only when hot, smooth fingers find and run along the dripping insides of the opening to your [pc.cuntTail] that you understand. Your murmured protestation turns into a low groan as he stokes the needy impulses of your alien cunt with firm strokes of his fingers, turning them from their usual low background hum to an all-consuming burn, oozing [pc.femcum] freely.");
		output("\n\n<i>“What a charming appendage. Could’ve been designed with vulkrimi in mind!”</i> Semith laughs, still balls deep in your [pc.vagina " + x + "]. Your tail responds to his stroking by reactively batting greedily at his groin. <i>“No, not that - up. Good girl. Here... ”</i> You feel a totally different bluntness, thicker and longer than the length currently rubbing the insides of your first pussy, bump against your [pc.cuntTail]’s entrance, which reacts by rearing up eagerly. Your eyes cross as a second later, the little devil drives his big scorpion cock into your cunt tail, sending an unstoppable wave of parasitic pleasure coursing into you. Your [pc.lips] are forced open by a " + pc.mf("groan", "moan") + " of filthy delight as he thrusts firmly into both of your pussies, the ecstasy of getting doubly penetrated overwhelming you.");
	
		tailSexed = true;
	}
	//if pc has more than one vag and a second vag can take his cock
	//so the first vag can be tail fucked instead
	else if(pc.vaginas.length > 1 && hasSecondVaginaWhichCanFitSemithCock)
	{
		output("\n\nHe slows down a few moments later, just as the pleasure thrumming through your body was really beginning to take hold. You gasp as you feel his spear-like head stretch your entrance as he pulls out, murmuring a disappointed query.");
		output("\n\n<i>“I have to try something,”</i> Semith breathes. You gaze over your shoulder at him and, seeing what he intends, you eagerly arch your [pc.butt], splaying [pc.eachVagina] for him. <i>“I’ve never been with someone who had more than one before, and... there...”</i> His words dissolve into a gratified groan as he pierces your [pc.vagina " + y + "] with his six inch frictionless dick, sliding himself into your other needy, wet hole. At the same time, with his craning scorpion tail bent all the way over his shoulder, he probes at your already-opened [pc.vagina " + x + "] with his thicker, veined appendage-dick. You gasp and then squeal with delight, clutching at the couch leather as he finally rams it home with a decisive thrust, filling your first pussy up with a far larger helping of hard cock at the same time as beginning to pump into your second with the six incher. They bend into each other through your slick, sensitive walls, ramping up the ecstasy of being double penetrated to inhuman heights.");
		
		pc.cuntChange(y, chars["SEMITH"].cockVolume(0), true, true, false);
		tailSexed = true;
	}
	//if pc has one vag and Semith's prick feels too tiny for the chosen pussy
	//do a double pen with his tail cock into the hangar vag
	else if(pc.vaginalCapacity(x) > (chars["SEMITH"].cockVolume(0)) * 3) 
	{
		output("\n\nThe sensation is nice but not exactly mind-blowing; a simple six inch imp dick, particularly one as smooth as his, can barely touch the sides of your [pc.vagina " + x + "], and although you meet each slap of his thighs against your [pc.butt] with a pleased sigh to encourage him, you cannot help but begin to fantasize about much larger forms of insertion to keep your own arousal up.");
		output("\n\n<i>“Hardly ideal, is it?”</i> murmurs Semith. You start slightly at how closely he mirrored your own thoughts. <i>“Hang on a moment... let me try something.”</i> You gaze over your shoulder at him and, seeing what he intends, you eagerly arch your [pc.butt] for him. A moment later, his chitinous scorpion tail craned right over his shoulder, the longer, thicker protrusion of his second dick pushes impatiently against your wide, wet opening. You open your mouth with delight as it stretches you wide and then thrusts inwards alongside his other dick, its elastic surface easily able to slide into your well-gaped twat and cram you full of hot, hard flesh.");
		output("\n\nThat’s more like it! You cry out with glee as Semith thrusts both of his packed pricks into you with a gratified groan, the texture of them sliding over your stretched pussy walls making you clutch the leather and tense up around them in delight.");
		
		//cock volumen multiplied by 2 + 10 (because it is described as 'thicker')
		pc.cuntChange(x, chars["SEMITH"].cockVolume(0) * 2 + 10, true, true, false);
		tailSexed = true;
	}
	
	output("\n\nHe may be pretty small, but the vulkrim is an energetic and evidently experienced lover. He pumps into your slick, tender cunt");
	if(pc.vaginas.length > 1) output("s");
	output(" steadily, shifting his narrow hips around in the down-spells until he finds an angle which makes you clench up with delight, before fucking you right there, quickly driving you up to a pulsing orgasm. You buck your [pc.butt] into him eagerly as electric contractions seize up [pc.eachVagina] and");
	
	output(" your whole body");
	if(pc.hasCuntTail()) output(", alongside your [pc.cuntTail],");
	
	if(pc.girlCumQ() > 25) output(" dribbles");
	else output(" gushes");
	
	output(" copious amounts of [pc.femcum] onto his slim hips, but Semith himself keeps his pushing slow and steady, exhaling his enjoyment at making you peak like this.\n\nOnce you’re an oozing, [pc.tongue]-lolling mess on his couch he keeps going, thrusting his demon dick");
	if(tailSexed) output("s");
	
	output(" into your unfurled");
	if(pc.vaginas.length == 1) output(" muff");
	else output(" pussies");
	
	output(" gently but firmly, rekindling your lust until you are " + pc.mf("groan", "moan") + "ing your wordless approval. Only then does the vulkrim step up the pace, spearing into your hole");
	if(tailSexed) output("s");
	
	output(" ardently");
	if(tailSexed) output(", chitinous tail flexing eagerly");
	
	output(", all of his mannered refinement gone as he grips your [pc.hips] tightly and roughly pumps his way to his high, balls slapping into your sweat-and-[pc.femcum]-dappled thighs again and again.");
	output("\n\nHis dicks swell up and then surge hot demon cum into [pc.eachVagina]");
	
	if(pc.hasTailCunt()) output(" and the milking tightness of your [pc.cuntTail]");
	output(". The sensation of getting packed out with thick, alien seed is inescapably wonderful, and you orgasm again to it, your cunt");
	if(tailSexed || hasSecondVaginaWhichCanFitSemithCock) output("s");
	
	output(" eagerly kneading Semith’s smooth, thick length");
	if(tailSexed || hasSecondVaginaWhichCanFitSemithCock) output("s");
	
	output(" for every last drop. You hump each other fiercely for long seconds, riding out the shared high, carelessly");
	if(pc.isSquirter()) output(" spraying");
	else output(" drooling");
	
	output(" [pc.femcum], cum");
	
	if(pc.isLactating()) output(" and [pc.milk]");
	output(" all over his expensive furniture.");
	
	//if vags were not switched load in first, else second
	if(!(pc.vaginas.length > 1 && hasSecondVaginaWhichCanFitSemithCock)) pc.loadInCunt(chars["SEMITH"], x);
	else pc.loadInCunt(chars["SEMITH"], y);
	
	//feed tail cunt if available
	if(pc.hasTailCunt()) pc.loadInCuntTail(chars["SEMITH"]);
	
	output("\n\nYou loll onto the couch and look over at him with heavy-lidded satisfaction once it’s over, very pleased with your diminutive booty call. The vulkrim grins back hugely, casually leaned back, oozing dicks lolling. Somehow there still isn’t a hair out of place on his head.");
	output("\n\n<i>“Pretty nice to come back to that after a day of tedious stock-trading,”</i> he murmurs. <i>“You’ll be sure to come around again, right [pc.name] Steele?”</i>");

	output("\n\nHe lets you use his shower, which is typically luxuriant");
	if(pc.tallness < 59) output(" especially as it’s perfectly designed for someone of your height");
	output(" although you have to scooch down quite a bit to use it");
	
	output(". By the time you get back the mess you gleefully created has been entirely cleaned up and Semith is back in his shirt and trousers, lolling back and enjoying his smoke-bubble machine; it’s as if nothing occurred at all.");
	
	pc.orgasm();
	processTime(20 + rand(15));
	pc.shower();
	semithSexed(1);
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function semithSexCatchAnal(): void {
	clearOutput();
	showSemith(true);
	
	output("You shift over so you are on top of him, sliding your [pc.belly] deliberately up his hard, thick erection, matching his grin as you hold his eye.");
	output("\n\n<i>“I see,”</i> the pipsqueak says, ogling your [pc.groin] with a characteristic blend of lust and arch mirth written on his narrow, handsome features. <i>“That’s nice. You still haven’t answered my... oh.”</i>");
	
	if(pc.tallness > 59)
	{
		output("\n\nYou turn around and slide his smooth, pointed bludgeon of a cock into the crease of your [pc.ass], slowly letting your weight bear down on him as you do. You press him right down into the plush, cool leather of his squashy sofa with your greater mass. The sensation is amusing, luxuriant and erotic at the same time - just right.");
		output("\n\n<i>“Aargh,”</i> Semith groans, sounding slightly muffled. <i>“Please do be careful... doing that... ”</i> The thought that you might drown him in his own expensive furniture occurs, making you " + pc.mf("chuckle.", "giggle."));
	} 
	else 
	{
		output("Your compact frame barely makes an impact on him though, and he lustily grips your [pc.hips], thrusting his fiercely erect dick between your butt-cheeks impatiently.");
		output("\n\n<i>“I love this,”</i> he growls. <i>“Your body is exactly the right size and shape for fucking, has anyone ever told you that?”</i>");
	}
	
	output("You enjoy the sensation of the hot, compact weight of the vulkrim trapped beneath you for a few moments - rubbing your body up and down his smooth, sexy skin");
	if(pc.ass.wetness() > 3) output(" and lubing his cock thoroughly with your oily [pc.anus], a slick, sensual movement which makes him groan with approval");
	
	output(", building your arousal towards the main event. You raise yourself up, press your [pc.anus] against his pointed crown, and then sigh as you allow gravity to open you up and slowly fill your back passage with hard, thick demon meat. His burgundy hands tighten on your [pc.hips] as you engulf him.");
	
	//needs to be saved so a potential devirgify message follows the right paragraph
	var wasVirginUntilNow:Boolean = pc.analVirgin;
	pc.buttChange(chars["SEMITH"].cockVolume(0), true, true, false);
	
	if(!wasVirginUntilNow && pc.ass.looseness() >= 3) output("\n\nYour ass pussy is well used to getting royally fucked by now, and the matter of taking every inch of a fat six inch imp dick is trifling.");
	else output("\n\nIt’s only tough for a moment; like the rest of him, Semith’s dick is a flawlessly smooth tool, exactly meant to open you up like this.");
	
	output(" You grin over your shoulder at him when you feel his dense balls touch your [pc.butt], the initial intensity of it morphing into the wonderful sensation of having a cock spreading and rubbing into your colon.");
	output("\n\n<i>“This is nice and all,”</i> grunts Semith");
	
	if(pc.tallness > 59) output(", pressed far down into the overstuffed couch");
	output(" as you begin to rock slowly on top of him, humming as sensation twinges into");
	
	if(pc.hasCock()) output(" your [pc.cock], making it tense up");
	if(pc.hasCock() && pc.hasVagina()) output(" and");
	if(pc.hasVagina()) output(" your [pc.vagina], pleasure prodded into it through your walls");
	
	output(", <i>“but do you think we could - ?”</i>");
	output("\n\nHe directs with jerks of his tight, muscular thighs, and after a few more seconds of slowly rotating your [pc.hips], you relent, lolling onto your side and spooning your [pc.butt] into him");
	
	if(pc.tallness > 59) output(", enabling him to shift out of the fairly large, soft depression you made");
	output(".");
	
	output("<i>“That’s more like it,”</i> he sighs, hands sliding up and down your [pc.belly]");
	if(pc.hasBreasts()) output(" and [pc.chest]");
	output(", dick still wedged firmly in your rear. <i>“As much as getting suffocated by you would be a pleasant way of dying, I’d quite like to do this more...”</i> he trails off in a groan as you tighten up around his length, biting your [pc.lip] as delicious sensation pulses through you as you do it.");
	
	output("\n\nSlowly he gets into it, your rhythmic kneading of his dick with flexes of the hips stoking his ardor, and before long he’s clutching you tight and intently sliding his smooth, red cock in and out of your [pc.anus].");
	
	//large/loose butt
	if(pc.analCapacity() >= chars["SEMITH"].cockVolume(0) * 2 && pc.ass.looseness() >= 2) output("You tense your muscles as much as you can, concentrating on giving him as tight a fuck as possible.");
	
	output(" The sensation is intense enough for you to gasp each time he mires himself up to the base in your clenching, kneading hole - particularly when his hot, glossy fingers travel around your waist and find your");
	
	if(pc.hasCock()) output(" [pc.cock], coiling");
	else output(" [pc.vagina], frigging");
	output(" you with strong, confident movements.");
	
	output("\n\nYou can do things with your hands too, though. You reach behind you until you catch hold of his scorpion tail cock, which has been slapping itself around like a big, incredibly rude snake this entire time. Firmly rubbing its dense flesh up and down has the delicious effect of morphing Semith’s husky exhalations into outright groans, and he picks up the pace, eagerly ploughing your [pc.butt] for all he is worth, hands slithering over your [pc.groin] fervidly.");
	output("\n\nHis dick presses into your ass again and again, and you are jackhammered into orgasm, clenching up gleefully around him as");
	
	if(pc.hasCock()) output(" your [pc.cock] tightens up and spurts [pc.cum] in uncontrolled pulses");
	if(pc.hasCock() && pc.hasVagina()) output(" and");
	if(pc.hasVagina()) {
		output(" your [pc.vagina], pleasure prodded into it through your walls");
		if(pc.girlCumQ() > 25) output(" floods");
		else output("moistens");
		output(" his hand with [pc.girlcum], quivering to the bestial use your ass-pussy is being put to");
	}
	
	output(". Semith can’t last long against the rippling of muscles in your [pc.anus] and the coil of your hand, and he molds himself tightly to your back as he cums with a delighted grunt, packing your colon with hot, gooey semen and spraying more musky payload liberally all over the carpet from his tail-cock.");
	output("\n\nYou part from him with a gratified hum, pretending for a moment to sit back on top of him with your cum-leaking asshole.");
	output("<i>“Get away with you, you incorrigible");
	
	if(pc.tallness > 59) output(" ogre");
	else output(" pixie");
	
	output(",”</i> the vulkrim scolds. <i>“As if you haven’t made a big enough mess... there’s a shower on the floor above.”</i>");
	
	output("\n\nHe lets you use his shower, which is typically luxuriant");
	if(pc.tallness < 59) output(" especially as it’s perfectly designed for someone of your height");
	output(" although you have to scooch down quite a bit to use it");
	
	output(". By the time you get back the mess you gleefully created has been entirely cleaned up and Semith is back in his shirt and trousers, lolling back and enjoying his smoke-bubble machine; it’s as if nothing occurred at all.");
	output("\n\n<i>“Do let this be a regular thing, [pc.name] Steele,”</i> he says, with a fond, rakish grin. <i>“You, and your behind, are excellent company.”</i>");
	
	pc.orgasm();
	pc.loadInAss(chars["SEMITH"]);
	
	processTime(20 + rand(15));
	pc.shower();
	semithSexed(1);
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function updateDescriptionWithSemithsEventualPresence():Boolean
{
	//Player knows where Semith lives
	if(flags["SEMITH_INVITED_PC"] == true)
	{
		if(hours <= 17)
		{
			output(" The lights are off and it looks shut up tight — it seems like Semith is not at home.");
			lockSemithsDoor();
		}
		else
		{
			output(" A number of mellow lights are on — it looks like Semith is home.");
			if(!flags["SEMITH_HAS_PC_IN_APARTMENT"]) lockSemithsDoor();
		}
	}
	else
	{
		if(flags["MET_SEMITH"] == undefined || hours <= 17) lockSemithsDoor();
	}
	//Render end of original room description
	output("\n\nYou can head east and follow the long walkway, or west and to the central plaza.");
	
	return false;
}
private function lockSemithsDoor(addKnock:Boolean = true):void
{
	flags["SEMITH_HAS_PC_IN_APARTMENT"] = undefined;
	flags["NAV_DISABLED"] = NAV_SOUTH_DISABLE;
	if(addKnock) addButton(0, "Knock", knockToEnterSemithsApartment, undefined, "Knock", "Knock on the door to apartment 107.");
}
