public function showLiriel(nude:Boolean = true):void
{
	showName("\nLIRIEL");
	showBust("LIRIEL");
}

public function lirielStandActiveHours():Boolean
{
	if (flags["IRELLIA_QUEST_STATUS"] == 2 || flags["IRELLIA_QUEST_STATUS"] == 3) return false;
	if (hours >= 6 && hours < 18) return true;
	return false;
}

//Initial Encounter
public function lirielMyrellionBonus(btnSlot:int = 0):Boolean
{
	// First Time: 
	if (flags["LIRIEL_MET"] == undefined)
	{
		clearOutput();
		author("Foxxling");
		showLiriel();
		
		output("As you’re walking through Mushroom Park, you take a second to look at the tall tree-like mushrooms above your head. It’s really amazing how different the flora and fauna of other planets can be.");
		output("\n\nSuddenly, a pair of white-gloved arms take advantage of your distraction and slide around your midsection. Two big tits, as soft as they are warm, gently mash into your back as the unseen and unnoticed lady pulls you close.");
		output("\n\n<i>“Hey sexy,”</i> you hear in a clearly feminine voice... but there is nothing feminine about the hot slab of meat you feel being pressed against your [pc.ass]. <i>“How about you bend over and let good ol’ Liriel make you feel </i>real<i> good?”</i>");
		output("\n\nYour face snaps toward the voice and you are met with a pair of lust-filled violet eyes above a huge brilliant-white smile. Two green antennae, tipped with bright purple balls on the ends, sprout from her vibrant purple hair. This Liriel lady seems intent on pounding your [pc.asshole] but is, despite the forwardness of her approach, obviously waiting for permission.");
		output("\n\nWhat will you do?");
		
		flags["LIRIEL_MET"] = 1;
		processTime(2);
		variableRoomUpdateCheck();
		var map:* = mapper.generateMap(currentLocation);
		userInterface.setMapData(map);
		
		clearMenu();
		addButton(0, "No", lirielIntroOptions, 0, "No", "Start with saying no, that could work...");
		addButton(1, "Go Ahead", lirielIntroOptions, 1, "Go Ahead", "Submit to the gorgeous green babe. Let her have her way with your butt and anything else she feels like taking advantage of. Just in case it hasn’t sunk in, <i>she</i> will be in charge...");
		return true;
	}
	
	// Repeatable:
	// Afterwards she will have an npc icon and be approachable like all other store vendors are.
	
	// There is a 50% chance that there will be a bunch of myr women standing around in little green men clothing.
	var myrWomen:Boolean = false;
	if (!pc.hasStatusEffect("Little Myr Women") && rand(2) == 0)
	{
		pc.createStatusEffect("Little Myr Women", 0, 0, 0, 0, true, "", "", false, 360);
	}
	// Give it a 3-hour crowd with a 3-hour cooldown period.
	if (pc.hasStatusEffect("Little Myr Women") && pc.getStatusMinutes("Little Myr Women") > 180) myrWomen = true;
	
	if (flags["LIRIEL_MET"] < 2) addButton(btnSlot, "Stand", lirielApproach, myrWomen, "Liriel’s Stand", "Visit Liriel at her stand.");
	else addButton(btnSlot, "Stand", lirielApproach, myrWomen, "The Little Green Man", "Visit Liriel at her stand.");
	
	return false;
}

public function lirielIntroOptions(response:int = 0):void
{
	clearOutput();
	author("Foxxling");
	showLiriel();
	clearMenu();
	
	// No
	if (response == 0)
	{
		if (pc.isBimbo())
		{
			output("It takes you a second to remember that you actually don’t want her big, thick cock filling your [pc.asshole] but when you recall that little tidbit, you pull away from the woman with all the indignation you can muster... which isn’t much considering how horny you are.");
			pc.changeLust(5);
		}
		else if (!pc.isAss())
		{
			output("Regardless of how you feel about the manner in which she is flirting with you, you politely extricate yourself from her arms and put some distance between you and this Liriel in a manner that is not rude but also clear in your intent to not get pounded into submission.");
		}
		else
		{
			output("Feeling annoyed, you turn and glare into the woman’s face until she gets the hint to remove her big dick away from your [pc.ass] and get her big tits off you.");
			output("\n\nShe backs away slowly.");
		}
		output("\n\nLiriel pouts, looking disappointed as she says, <i>“Alright... well if you ever change your mind, I’ll be... over here... I guess.”</i> She turns away for a second and that’s when you notice a high tech, small metal structure shaped like a child’s lemonade stand. She walks over to it and sits down, pouting.");
		
		processTime(2);
		
		addButton(0, "Next", mainGameMenu);
	}
	// Go Ahead / Sex
	else if (response == 1)
	{
		// First Time: {no chance of the myr women being present during ambush}
		output("You give this Liriel person a smile since you’re down for a little subbing. Before you can actually say anything though, she releases a soul piercing scream of pure, unadulterated joy. She grabs you by the wrist and practically drags you over to a mushroom that is just at waist height. From the loving way she rubs its hard, sturdy cap you don’t believe you’re going to be the first person she has had bent over this particular mushroom.");
		output("\n\nYou figure to hell with it and");
		if (pc.isAssExposed()) output(" strip off your [pc.gear]");
		else output(" drop your excess gear");
		output(" without delay before allowing the jolly green lady to bend your naked body over her favorite mushroom.");
		// if (pcAssIsSmall):
		if (pc.buttRating() < 4)
		{
			output("\n\n<i>“Oh, my,”</i> she says, as she palms your [pc.ass]. <i>“It’s so cute! And when it’s like this, I can get it all inside easier without all that softness to spread apart! This is AWESOME! I can see that gorgeous hole without you even spreading your");
			if (pc.legCount > 1) output(" [pc.legOrLegs]");
			else output(" cheeks");
			output("!”</i> She hops up and down on the spot, her big green tits flopping around with glee. She massages your bottom, getting a good, long feel as she talks to herself about how much she’s going to enjoy filling your [pc.asshole] with cream.");
		}
		// if (pcAssIsMedium):
		else if (pc.buttRating() < 10)
		{
			output("\n\n<i>“Wow!”</i> she says as she palms your [pc.ass]. <i>“Such a nice booty you got here! I can’t wait to play with these gorgeous cheeks. I’m an ass lover if you couldn’t tell and, my, oh my, what a nice ass! It’s not super small or super cheeky; it’s just right.”</i> She hops up and down on the spot, big green tits flopping around with glee. Then she rubs her fat cock across your ass cheeks.");
		}
		// if (pcAssIsHeavy):
		else
		{
			output("\n\n<i>“Oh, my!”</i> she whispers to herself as she palms your [pc.ass]. <i>“This ass is going to be mine. Look at those sexy cheeks! How wonderful, how glorious. I can’t wait to stuff my big fat cock in that butthole, it is going to be lovely!”</i> She hops up and down on the spot, big green tits flopping around with glee. Then she rubs her fat cock across your ass cheeks, smearing precum all over your [pc.skinFurScales].");
		}
		
		processTime(2);
		pc.changeLust(10);
		pc.createStatusEffect("Liriel Intro Buttfuck");
		
		addButton(0, "Next", lirielButtSex, false);
	}
}

// Shop Hub
public function lirielApproach(myrWomen:Boolean = false):void
{
	clearOutput();
	author("Foxxling");
	showLiriel();
	
	output("Liriel’s shop, if you can call it that, is simply a stand topped with a sign displaying a picture of her caressing her lush tits. At first look, it would seem little more than a kissing booth at some rinky-dink fair.");
	if (flags["LIRIEL_TALK_STAND"] == undefined) output(" However, the humming sound emitting from it does make you wonder if it is actually something a little more advanced than a stainless steel box.");
	else output(" However, you know that this booth is a state-of-the-art trunk with three high tech storage compartments that Liriel uses to store her wares.");
	
	if (myrWomen) output("\n\nThere are several gold myr standing around conversing. Some are wearing tight fitting T-shirts with a little green alien face on the front while others are wearing similar tank tops that show off their impressive busts.");
	
	// First Time
	if (flags["LIRIEL_MET"] < 2)
	{
		if (flags["LIRIEL_BUTTSEXED"] != undefined) output("\n\nLiriel gives you a big smile as her hand reaches down and begins rubbing her cock beneath the table and says, <i>“Hey there, welcome to my shop, The Little Green Man.”</i>");
		else output("\n\nLiriel sees you and gives you a dispassionate, but still polite, smile as you approach her little stand. When she speaks her words sound bored and rehearsed, <i>“Hello, welcome to my shop, The Little Green Man.”</i>");
		
		flags["LIRIEL_MET"] = 2;
	}
	// Repeatable
	else
	{
		/* No text? */
		output("\n\n<i>“He");
		if (flags["LIRIEL_BUTTSEXED"] != undefined) output("y");
		else output("llo");
		output(", welcome to The Little Green Man.”</i>");
	}
	
	processTime(1);
	
	lirielMainMenu(myrWomen);
}

public function lirielMainMenu(myrWomen:Boolean = false):void
{
	// Shop setup
	shopkeep = chars["LIRIEL"];
	if (pc.hasStatusEffect("Armstrong Discount")) shopkeep.sellMarkup = 0.75;
	else shopkeep.sellMarkup = 1;
	
	clearMenu();
	addButton(0, "Appearance", lirielAppearance, undefined, "Appearance", "Take in Liriel’s buxom green form.");
	addButton(1, "Talk", lirielTalkResponse, [0, myrWomen], "Talk", "Have a conversation with the green beauty.");
	addButton(2, "Shop", buyItem, undefined, "Shop", "Have a look at the wares of The Little Green Man.");
	if(pc.lust() >= 33) addButton(3, "Sex", lirielSexMenu, myrWomen, "Sex", "Sexy times with Liriel.");
	else addDisabledButton(3, "Sex", "Sex", "You are not aroused enough for this.");
	addButton(14, "Leave", mainGameMenu);
}
public function lirielBackMenu(fromMenu:int = 0):void
{
	clearOutput();
	showLiriel();
	
	var myrWomen:Boolean = (pc.hasStatusEffect("Little Myr Women") && pc.getStatusMinutes("Little Myr Women") > 180);
	
	switch(fromMenu)
	{
		case 0:
			output("Liriel teasingly sways her verdant boobs as she adjusts her position.");
			break;
		case 1:
			output("You turn back to Liriel who flashes you a bright smile through her violet-colored lips.");
			break;
		case 2:
			output("<i>“Aww,”</i> Liriel visibly pouts when you reconsider.");
			break;
	}
	
	lirielMainMenu(myrWomen);
}

// Appearance
public function lirielAppearance():void
{
	clearOutput();
	author("Foxxling");
	showLiriel();
	
	output("Liriel Armstrong stands at an imposing 6 feet and 2 inches tall. She has vibrant violet hair that looks almost professionally styled. Two green antennae sprout from her purple locks, each sporting a purple ball at the end. Her eyes are so bright you’d swear they glow and her violet painted lips so plush and full you have to admit that they are very kissable. She is wearing a pristine white outfit, etched with small glowing cyan markings along its clean surface. However, said outfit does nothing to hide any of her “private” parts with its design, seeming more at home in a sex club than a publicly accessible locale.");
	output("\n\nHer two huge, green, G-cup knockers are exposed for the viewing pleasure of any who are interested, each sporting its own big, purple, three-inch wide nipple.");
	output("\n\nFramed by the white of her leggings is a big, mean, green terran cock with an angry purple head partially shrouded in foreskin. It sits there, mingling in the state between full erection and flaccidity. It is about a foot long and a full three inches wide. The monster cock sits on a pillowy cushion of two low-hanging apple-sized testes.");
	output("\n\nAnd from her body shape, you know if she were to turn around, her ass would be a big jiggly delight for people who are into that sort of thing.");
	
	addDisabledButton(0, "Appearance");
}


// Talk
public function lirielTalkMenu(arg:Array):void
{
	var response:int = arg[0];
	var myrWomen:Boolean = arg[1];
	
	clearMenu();
	addButton(0, "Herself", lirielTalkResponse, [1, myrWomen], "Herself", "Ask Liriel to tell you about herself.");
	addButton(1, "Her Body", lirielTalkResponse, [2, myrWomen], "Her Body", "Ask Liriel about her physical appearance.");
	if (pc.isNice()) addButton(2, "Yourself", lirielTalkResponse, [3, myrWomen], "Yourself", "Maybe introducing yourself will impress her....");
	else addButton(2, "Yourself", lirielTalkResponse, [3, myrWomen], "Yourself", "Boast about being a Steele. That’ll impress her....");
	if (flags["LIRIEL_TALK_BODY"] != undefined) addButton(3, "The Stand", lirielTalkResponse, [4, myrWomen], "The Little Green Man", "Ask Liriel about her shop.");
	addButton(14, "Back", lirielBackMenu, 0);
}
public function lirielTalkResponse(arg:Array):void
{
	clearOutput();
	author("Foxxling");
	showLiriel();
	
	var response:int = arg[0];
	var myrWomen:Boolean = arg[1];
	
	// Menu
	if (response == 0)
	{
		output("What would you like to talk about?");
		lirielTalkMenu([response, myrWomen]);
	}
	// Herself
	else if (response == 1)
	{
		output("You Ask Liriel to tell you about herself.");
		output("\n\nShe blinks twice in confusion and says, <i>“Erm... Like what?”</i>");
		output("\n\nRephrasing the question, you ask her what kind of person she is.");
		output("\n\n<i>“The HAPPY kind of course!”</i> she practically shouts with a big smile. <i>“It’s very hard to get a gal like me down. I’m just a peppy ball of dominant dick lady fun! I’m also the type of girl that likes long walks in the vacuum of space - while tethered to a ship -”</i> she gives a high pitched peal of laughter that causes her exposed tits to jiggle, <i>“...don’t want my eyeballs sucked out of my head or anything like that. I don’t really know... I’m a fun person, I guess. I like the color green almost as much as I like the color purple. Um... My favorite hobbies are anal and retro sci-fi... Does that answer your question?”</i> she says, giving you a look like she hopes she doesn’t have to answer anything else so open-endedly.");
		output("\n\nYou decide to spare her and continue the conversation by asking how she ended up on Myrellion.");
		output("\n\nThis makes her jump up and down on the spot, her bare breasts bouncing in the process, <i>“Because it’s just the cutest little planet!”</i> You recall the mostly barren red earth of the planet that greeted you when you landed and figure that beauty must really be in the eye of the beholder, <i>“And with the planet rush going on, what better way to try and revive an awesome retro fashion craze than to come to a new planet and tap a fresh market?”</i>");
		output("\n\nYou shrug. In truth the myr and terrans have vastly different anatomies so you don’t know how they’d like earth fashion, especially old earth fashion. As if reading your thoughts, she follows with, <i>“Modifying the outfits for the myr and letting them know it’s space age fashion helps a lot.”</i>");
		
		processTime(10);
		
		lirielTalkMenu([response, myrWomen]);
		addDisabledButton(0, "Herself");
	}
	// Her Body
	else if (response == 2)
	{
		//First Time
		if (flags["LIRIEL_TALK_BODY"] == undefined)
		{
			output("Before you ask Liriel about her appearance, you check your codex to make 100% sure it has no data on her alien species. It just reads her as a human female.");
			
			if (pc.isBimbo() || pc.isBro())
			{
				output("\n\nYou try to think of a delicate way to ask her about her looks. Once you’ve come up with one you say, <i>“So");
				if (pc.isBimbo()) output(", like, where’d get those cute feelers from");
				else output(" what is you looking like that for anyway");
				output("?”</i>");
				output("\n\nNailed it.");
			}
			else if (!pc.isAss())
			{
				output("\n\nLooking at her, it is plain to see that she is probably just modded; but since you’re curious as to why, you come up with a delicate way to ask her about her mods. Once you do, she smiles and leans forward in a way that makes you believe she’s eager to discuss this.");
			}
			else
			{
				output("\n\nShe’s obviously modded to hell and back so you don’t feel the need to be delicate as she’s probably has had to answer this question a bunch of times posed by lesser people. You go ahead and just ask her why she looks like that. The way you ask could be seen as a bit rude but you can’t bring yourself to care. Despite this she smiles and leans forward... she obviously likes to talk about this.");
			}
			
			flags["LIRIEL_TALK_BODY"] = 1;
		}
		//Repeatable
		else
		{
			output("You ask Liriel to rehash the story she told you about her mods and why she has them. She smiles broadly at the opportunity to tell you about the body she is so proud of again.");
		}
		
		output("\n\n<i>“Well back on Terra, this was long before humans had warp gate technology or even definitive proof of life on other planets, there were stories of little green people. These aliens were all kinds of strange. They abducted cows, made odd designs in crops and even probed human butts! Most of the people didn’t believe in them, but some did. Stories of little green men lasted on through the years until the humans on Terra began colonizing their own solar system. Many expected to find these little green men,”</i> she says matter of factly while nodding her head.");
		output("\n\n<i>“However, it was all just one big hoax. It was multiple generations of swindlers, greedy liars and con men pushing a legend so that they could trick money out of the pockets of those who believed them. After space flight was achieved and the colonization of the only other planet capable of sustaining life began, the human colonists figured they were alone in the universe and started a new pop culture sensation about the little green men.");
		output("\n\nThen after decades of research into cosmetics, color changing via consumables collided with alien mania and suddenly everyone wanted to be green and purple,”</i> she says.");
		output("\n\n<i>“So the form I’m in now is the result of me using an old transformative mod made by the Armstrong cosmetics department. It does little more than change the color of your body parts though--it also increases the size of existing sex organs. Um, that last part is actually an updated feature! We also got rid of all the side effects and added some nice surprises in the sexual fluids department as well. It is so great though! I love retro things like this so to look this way is kind of a dream come true for me.”</i>");
		output("\n\nYou nod in agreement. If it makes her happy that is what really matters.");
		
		processTime(5);
		
		lirielTalkMenu([response, myrWomen]);
		addDisabledButton(1, "Her Body");
	}
	// Yourself
	else if (response == 3)
	{
		if (flags["LIRIEL_BUTTSEXED"] == undefined && flags["LIRIEL_TITFUCKED"] == undefined)
		{
			// First Time
			if (flags["LIRIEL_TALK_YOURSELF"] == undefined)
			{
				if (pc.isNice()) output("You feel like you should introduce yourself. It would be the polite thing to do.");
				else output("You honestly feel like doing a bit of bragging. Time to talk about yourself.");
				
				flags["LIRIEL_TALK_YOURSELF"] = 1;
			}
			// Repeatable
			else
			{
				if (pc.isNice()) output("You decide to re-introduce yourself. Just in case she forgot something.");
				else output("Despite how this went last time, you go ahead and try again... What is the worse that could happen?");
			}
			
			if (pc.isBimbo() || pc.isBro())
			{
				output("\n\nYou start off by telling Liriel that you are one sexy " + pc.mfn("guy","gal","person") + " and then laugh. Seeing the obvious for herself, she laughs with you. You recall how she wanted to pound your sweet ass when she first laid eyes on you - and with a sexy bum like yours, who can blame her? You’ve got one nice keister. Everyone should want a piece of you. Oh, and lastly you give her your name, almost forgetting that important piece of information. How else would she know what to scream during sex should the two of you have any?");
				output("\n\nLiriel smiles big as she reaches down and rubs her now erect length while saying, <i>“I can definitely see that.”</i> with a soft, sexual note in her horny voice. Well, that’s something you can both agree on!");
				
				pc.changeLust(5);
			}
			else if (pc.isNice())
			{
				output("\n\nWith a gracious smile you reach out a polite hand for her to shake. Liriel looks confused at first but smiles anyway and gives you a firm handshake. You introduce yourself with your full name and politely proceeed with some chit chat for a little while. You have to admit that you expected a bit more excitement at the mention of your name but Liriel just smiles and nods like any customer service rep would do.");
			}
			else
			{
				output("\n\nYou launch into an aggressive campaign of self promotion. You extol your virtues and talk spectacularly about the many feats of skill you are capable of and the things you’ll probably do with your life. All the while, you leave out the part about the immense fortune you will inherit, the quest you are on and your family name. Then, as your speech draws to an end, you top it off by spilling all the withheld information. Aside from that bit about the probes, you finally close with one last detail, your name.");
				output("\n\nYou look back at Liriel. After a slight pause, her head jerks her from a trance, as if she had zoned out for a second.");
			}
		}
		else
		{
			output("In all honesty, she just doesn’t seem very impressed and appears to be politely humoring you. You talk about yourself some more to see if she bites and she doesn’t. Seems like this was a waste of time.");
		}
		
		processTime(5);
		
		lirielTalkMenu([response, myrWomen]);
		addDisabledButton(2, "Yourself");
	}
	// The Little Green Man
	else if (response == 4)
	{
		output("When you ask Liriel about her store front, she instantly bounces up and down, unable to contain herself");
		if (flags["LIRIEL_BUTTSEXED"] != undefined || flags["LIRIEL_TITFUCKED"] != undefined) output(" and sending drops of yogurt flying");
		output(" as her tits bounce with her.");
		output("\n\n<i>“Okay, so like you know how occasionally there will be a clothing fad from yester-year? Like when people start dressing the way their parents or grandparents did back when they were little...? Well, the clothing we sell is an extreme version of that. The clothes here are so retro that they predate terran use of the warp gates. However, they’ve been revamped and updated to align with current galactic standards. The designs are completely 100% the same though--just like what terrans wore during my favorite part of history: the colonization of our original solar system. You see, right as space flight technology was becoming a commercial enterprise, people were curious about the possibility of life on our sister planet, The Red Planet. My family made a fortune in those early days, trade-marking the little green alien and selling stylish black and green clothes,”</i> she says while absent-mindedly bouncing.");
		output("\n\n<i>“In the end, the stories of little green men turned out to be false and our company’s merchandise took nosedive in sales right after. The entire enterprise threatened to collapse... until a breakthrough was made with specially-designed space suits! They became the next fashion craze while at the same time, reviving the former little green alien mania. Then Lucille Armstrong, who was head of the little green empire, had the bright idea to create a cosmetics department that specialized in a consumable potion which would turn the user into a little green person, complete with cute antennae. What we sell here are the updated and modified versions of that potion,”</i> she finishes, beaming.");
		output("\n\nYou whistle low and mention that her family must be mega rich.");
		output("\n\nShe shrugs, <i>“Yeah, true. We don’t even own a business at this point. We, meaning the entire family, live off the interest generated by the family investors. There is literally so much money, we could all split it and we’d still have enough credits to take care of each individual’s household for several generations... but I don’t really care about that. I just like selling this merchandise and telling people about the wonderful fashion sense found in retro-terran history.”</i>");
		output("\n\nKeeping your reaction to the immensity of her abundant wealth to yourself, you instead ask her why she doesn’t have a better storefront.");
		output("\n\nShe smiles as if she were a spider and you are a bug who just buzzed into her web. She suddenly stands up, her dick swinging between her legs as she walks around the stand and raises her hand, <i>“It has a dynamic screen made up of millions of shifting nanobots that can make the sign into any shape I want. It also has a holographic emitter so that I can attract customers with colorful swirling designs and living advertisements.”</i>");
		output("\n\nHer hand moves down to rest on the counter, her exposed tits jiggling slightly as she does so. <i>“This is a dimension-compressing cabinet. You scan in a non-biological object and it somehow stores it inside. I don’t know how that works exactly but it has near-infinite storage capacity. It also stores food and drink and can compress its own mass, except for a small saucer - which I could pick up and put in my pocket.”</i>");
		output("\n\nShe presses a button and a bright light goes off. Then, the whole stand is gone... save for a small silver disk in its place. Liriel picks it up, flips it in the air like a coin, and says, <i>“So basically the reason I don’t have a better store front is because there </i>is<i> no better store front!”</i>");
		output("\n\nShe chuckles good-naturedly as she puts the disk down and rubs its surface. The bright light flashes again and <i>poof</i>, her little lemonade stand is back were it was.");
		
		processTime(15);
		
		flags["LIRIEL_TALK_STAND"] = 1;
		
		lirielTalkMenu([response, myrWomen]);
		addDisabledButton(3, "The Stand");
	}
}

// Sex
public function lirielSexMenu(myrWomen:Boolean = false):void
{
	clearOutput();
	author("Foxxling");
	showLiriel();
	
	output("Liriel smiles in anticipation.");
	output("\n\nHow would you like to get off?");
	
	clearMenu();
	addButton(0, "Get Fucked", lirielButtSex, myrWomen, "Get Fucked", "Let Liriel bend you over and have her way with your anal sleeve.");
	if (pc.hasCock()) addButton(1, "Tit Fuck", lirielTitFuck, myrWomen, "Tit Fuck", "Those luscious knockers can’t be just for show...");
	else addDisabledButton(1, "Tit Fuck", "Tit Fuck", "You don’t have the proper anatomy for that!");
	addButton(14, "Back", lirielBackMenu, 2);
}

// Repeatable:
// Picking Sex in the repeatable interaction uses this alternate introduction
public function lirielButtSex(myrWomen:Boolean = false):void
{
	clearOutput();
	author("Foxxling");
	showLiriel();
	
	var firstTime:Boolean = false;
	if (flags["LIRIEL_BUTTSEXED"] == undefined) firstTime = true;
	
	if (!pc.hasStatusEffect("Liriel Intro Buttfuck"))
	{
		output("You say something to the effect of wanting Liriel to fuck you and a seemingly divine elation spreads across her face as she alights with joy at the prospect of sinking her cock into your ass and hammering away until she explodes inside you. Her exposed cock twitches to what you can only imagine as the naughty thoughts running through her head. The thick, rigid length of fuckmeat drips as you stare at it. It even flinches as if in greeting.");
		output("\n\nWhen you look up, you find Liriel lustfully eyeing you with a smirk, <i>“Well...”</i> she says, <i>“Let’s do this thing.”</i>");
		if (myrWomen)
		{
			output("\n\nYou hear a sudden whoop that reminds you two of the surrounding audience. The gaggle of gals giggle in unison and wiggle their fingers at you and Liriel. They are obviously going to be enjoying the show.");
			if (pc.exhibitionism() >= 66) output(" Knowing that they’re going to be watching gets you even more excited for the rough fuck ahead.");
			else output(" You feel a little self conscious but also a little excited. The girls seem to like you, so what is the harm?");
		}
		output("\n\n");
		if (firstTime || flags["LIRIEL_BUTTSEXED"] == 1) output("This time, ");
		output("Liriel helps you remove your " + (pc.isAssExposed() ? "excess gear" : "[pc.gear]") + " and allows you to climb");
		if (firstTime || flags["LIRIEL_BUTTSEXED"] == 1) output(", unmolested,");
		output(" onto her favorite mushroom. As you lean your");
		if (!pc.isAssExposed()) output(" bare");
		output(" body against the mushroom, you notice several wet spots on the mushroom - as if it has recently been in use. You lay down anyway since there is no pretense here. You’re both here for the same thing, a good, long, hard fuck.");
		output("\n\nThe eager emarald-skinned vendor greets your [pc.ass] like an old friend");
		if (myrWomen) output(" and you hear a few cat calls and encouraging whistles from the witnessing crowd of customers");
		output(".");
		output("\n\n");
	}
	else pc.removeStatusEffect("Liriel Intro Buttfuck");
	
	output("Looking back over your shoulder, you watch as Liriel appraises your ass in obvious delight. She rubs your bare bottom before jumping up and down with glee. Her tits undulate and her waving nipples release drops of thick, purple liquid.");
	if (firstTime) output(" It seems to be a bit thicker than milk.");
	else output(" Which you know to be yogurt.");
	output(" After calming herself down, she places a white gloved hand against each of her plump nipples.");
	if (firstTime) output(" She squeezes her big green tits together until the thick but smoothly textured substance oozes out a large amount into her hands.");
	else output(" She squeezes her big green tits together until she’s got a large amount of yogurt collected in each hand.");
	output(" She looks down at the purple goop fondly and says, <i>“Blueberry yogurt is such a great lubricant,”</i> before smearing it onto your upturned [pc.asshole]. She finger fucks the fruity snack into you, adding another glob and then another, until your hole is caked with the thick yogurty goodness.");
	if (pc.race() == "hrad")
	{
		output("\n\nLiriel kneels behind you and drops a comment about how beautiful your hradian ass is. She leans forward and places her lips on your [pc.asshole], sucking the yogurt from your pucker with a loud slurp. She teasingly licks and hums against your ass. The sensation it creates causes your eyes to water.");
		output("\n\nSuddenly her gloved hand slaps your exposed cheek. She sucks, licks, kisses and spanks your ass in equal measure before she rises and re-lubes your hole with more of her purple yogurt.");
	}
	
	output("\n\nLiriel then straightens up and grabs her cock.");
	if (myrWomen) output(" A hush falls upon your audience.");
	output(" You look forward and take a deep breath as you wait for the inevitable.");
	
	// if (assIsElastic)
	if (pc.elasticity >= 4)
	{
		output("\n\nYou begin to feel the thick, bullet-shaped head of the buxom babe’s cock nosing the entrance of your rear passage. Its tip leaks profusely, lubing your [pc.asshole] even more as she dips her cockhead into you with a cross-eyed sigh. She plunges into you suddenly, bottoming out in one violently pleasurable thrust.");
		output("\n\n<i>“An ass built for fucking,”</i> she croons with a big greedy grin plastered across her face. <i>“It feels so fucking good. You might wanna hold onto that mushroom, dear, ‘cause momma’s cummin’...”</i>");
	}
	// if (assIsTight):
	else if (pc.ass.looseness() <= 1)
	{
		output("\n\nYou begin to feel the thick, bullet-shaped head of the buxom babe’s cock sliding against your rear entrance. It leaks profusely, wetting your [pc.asshole] even more as it begins to nose its way inside. You try to relax, but can’t help clenching your teeth as you feel your anal ring being stretched across her fat cock. You");
		if (pc.legCount > 1) output(" spread your [pc.legOrLegs] and");
		output(" arch your back, doing anything you can to let that big dick into your [pc.asshole].");
		output("\n\n<i>“It’s a little hard to get up in here,”</i> she says. Looking back, you watch Liriel pout for a second before saying, <i>“...but all things cum to those who take!”</i>");
		output("\n\nHer first attempt to thrust into you is met with all the resistance your body can muster. You continue to grit your teeth and groan as your body is assaulted by an army of sensations ranging from euphoria to ecstasy. She strains to submerge the full length of her cock into you before wiggling the big green monster around, stirring your guts as she finally fully pentrates you down to the hilt. She keeps doing this until your ass properly relaxes and she can take things up a notch.");
		output("\n\nAnd take things up a notch she does.");
	}
	// if (assIsMedium)
	else if (pc.ass.looseness() <= 3)
	{
		output("\n\nYou begin to feel the thick, bullet-shaped head of the buxom babe’s cock nosing the entrance of your rear passage. Its tip leaks profusely, lubing your [pc.asshole] even more as she dips her cockhead into you with a cross-eyed sigh.");
		output("\n\n<i>“What a nice ass,”</i> she swoons as she rubs her cock against your insides. <i>“It gives where you want it and resists where you need it... so nice, so good...”</i> she says, practically drooling above you.");
		output("\n\nShe moves in and out of you slowly. Yet soon she grows impatient with the easy pace.");
	}
	// if (assIsGaped)
	else
	{
		output("\n\nYou begin to feel the thick, bullet-shaped head of the buxom babe’s cock nosing the entrance of your rear passage. Its tip leaks profusely, lubing your [pc.asshole] even more as she thrusts her entire cock into you with a giddy giggle.");
		output("\n\n<i>“Somebody likes the butt stuff,”</i> she says with a bright grin as she swirls her hips to stir your insides. <i>“I’m gonna have a good time inside this booty,”</i> she says, practically drooling above you.");
		output("\n\nShe flexes her penile muscle to flick her dick while it is still inside of you.");
	}
	
	pc.buttChange(chars["LIRIEL"].cockVolume(0));
	
	output("\n\nSuddenly her hips crash into your [pc.ass] and soon her dual apple-sized balls are slapping against you as she roughly fucks you so hard the mushroom beneath you shudders in response.");
	if (myrWomen) output(" The myr ladies are cheering, taking bets and otherwise encouraging Liriel to fuck you even harder.");
	output(" Your back arches as she takes full advantage of your position to sink every inch of her big, uncut cock into your [pc.ass]. Heat and arousal have you delirious as you are fucked raw and without mercy. Soon your screams of delight climb to a pitch that rattles your throat, your voice breaking every time she buries the entire length of that big meaty bone in your backyard.");
	
	output("\n\nLiriel’s gloved hand lands on your ass with a hard smack");
	if (myrWomen) output(" that causes the ladies cheers to become almost deafening,");
	output(" before she takes you by the waist and really starts to go to town. You can feel her cock getting even bigger inside of you as it swells, preparing for the inevitable. When she reaches the transcendent bliss of climax, her cock bloats up once more before releasing her huge load, hosing down your insides. She keeps fucking you into her ‘shroom, your stomach swelling as cum runs down your inner thighs like a waterfall.");
	if (pc.hasCock())
	{
		// if (cumNormal)
		if (pc.cumQ() < 100)
		{
			output("\n\nThe flooding of your bowels combines with the violent abuse of your prostate to send you over the edge and you cum hard, [pc.eachCock] making a mess of your belly as your trapped dick");
			if (pc.cockTotal() != 1) output("s");
			output(" expel");
			if (pc.cockTotal() == 1) output("s");
			output(" [pc.cum], painting a small portion of mushroom and your stomach [pc.cumColor].");
			output("\n\nYou clench your teeth as she fucks your spasming hole at top speed, taking full advantage of your orgasm to increase her own pleasure.");
		}
		// if (cumHigh)
		else if (pc.cumQ() < 500)
		{
			output("\n\nThe flooding of your bowels combines with the violent abuse of your prostate to send you over the edge and you cum hard. Your body presses back into the rapid butt fucking as [pc.eachCock] sprays the mushroom with thick ropes of [pc.cum]. Your voice comes out in a tortured huff as she forces your hips back down to the mushroom, putting your [pc.fullChest] and stomach into the puddle of [pc.cumVisc] mess your still spurting dick");
			if (pc.cockTotal() == 1) output(" is");
			else output("s are");
			output(" creating.");
			output("\n\nYou clench your teeth as she fucks your still spasming hole at top speed, taking full advantage of your orgasm to increase her own pleasure.");
		}
		// if (cumVeryHigh)
		else if (pc.cumQ() < 5000)
		{
			output("\n\nThe flooding of your bowels combines with the violent abuse of your prostate to send you over the edge. You push back as you feel [pc.eachCock] swell");
			if (pc.cockTotal() == 1) output("ing");
			output(". With a hoarse cry [pc.eachCock] explodes, sending shotgun blasts of [pc.cum] splattering violently against the mushroom head. Your orgasm rages on until the entire cap is covered in spunk. Once your climax has subsided, she forces you down into your own [pc.cumColor] mess.");
			output("\n\nThe entire time Liriel hammers your still spasming hole at top speed, taking full advantage of your orgasm to increase her own pleasure.");
			pc.applyCumSoaked();
		}
		// if (cumExtreme)
		else
		{
			output("\n\nThe flooding of your bowels combines with the violent abuse of your prostate to send you over the edge. Your eyes roll back into your skull when you push back, lifting from the mushroom in a sudden surge of strength as you feel [pc.eachCock] swell");
			if (pc.cockTotal() == 1) output("ing");
			output(". You yell to the heavens as your violent climax sends blasts of [pc.cum] crashing onto the mushroom like mini-tsunamis of your own creation. She continues to fuck the cum out of you as your ejaculate covers the mushroom. Even then your orgasm rages on until you feel the mess flooding your [pc.feet]. You roar and scream in a way that only seems to make Liriel even happier.");
			if (myrWomen) output(" Somewhere in the distance you hear a loud, <i>“DAMN!”</i> then a gaggle of laughter with some affirmations sprinkled in.");
			output("\n\nThe entire time Liriel hammers away at your still spasming hole at top speed, taking full advantage of your orgasm to increase her own pleasure.");
			pc.applyCumSoaked();
		}
	}
	else if (pc.hasVagina())
	{
		output("\n\nSomehow her rough domination of your rear entrance has effected the front because you hear yourself squealing in delight as [pc.eachVagina] begin");
		if (pc.totalVaginas() != 1) output("s");
		output(" to pump [pc.girlcum] to join the syrupy spooge already painting your [pc.legOrLegs]. You tremble and groan as your climax reaches its apex before you’re coming down from your rectal abuse-induced high.");
		output("\n\nThe entire time Liriel continues hammering away at your still spasming hole at top speed, taking full advantage of your orgasm to increase her own pleasure.");
	}
	else
	{
		output("\n\nLiriel’s merciless pounding of your [pc.asshole] has your stomach churning. Soon you feel the need to scream welling up inside of you and scream you do, as loud as you can until your voice grows hoarse. Mixed sensations of tension and relief was over you and you feel both tired and alive. You tremble and groan from the climatic release and find your eyes are watering.");
		output("\n\nThe entire time Liriel continues to hammer away at your still spasming hole at top speed, taking full advantage of your orgasm to increase her own pleasure.");
	}
	
	output("\n\nLiriel keeps fucking you until she cums twice more. Each time you climax with her");
	if (pc.hasLegs()) output(" and widen your [pc.legOrLegs]");
	output(", desperate to be fucked for a blissful eternity that ends all too soon. Shivering from the rough, passionate fuck you stand. The area between your");
	if (pc.legCount != 1) output(" [pc.legOrLegs] and");
	output(" [pc.butts] is covered in her syrupy white cum and from the way she looks at you, you know she had a great time. You’re both heaving and happy.");
	output("\n\nWithout warning, she pulls you into a deep kiss, her plush tits are pressed against your [pc.fullChest]. For a moment, the two of you swap spit before she pushes away. She smiles for a second then aims a soft, playful slap at your rear before sauntering away, heading back to her simple silvery storefront and giving you a great view of her big green butt in the process.");
	
	processTime(35);
	pc.loadInAss(chars["LIRIEL"]);
	pc.loadInAss(chars["LIRIEL"]);
	pc.loadInAss(chars["LIRIEL"]);
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	if (myrWomen) pc.exhibitionism(2);
	
	//Player gets 25% discount at store for 24 hours, Liriel does not disclose this information.
	if (!firstTime) pc.createStatusEffect("Armstrong Discount", 0, 0, 0, 0, true, "", "", false, 1440);
	
	IncrementFlag("LIRIEL_BUTTSEXED");
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

// TiTS Fuck
// adds to exhibition score
public function lirielTitFuck(myrWomen:Boolean = false):void
{
	clearOutput();
	author("Foxxling");
	showLiriel();
	
	// Select cock!
	var x:int = rand(pc.cocks.length);
	
	//First Time
	if (flags["LIRIEL_TITFUCKED"] == undefined)
	{
		if (pc.isCrotchExposed() && pc.isAssExposed())
		{
			output("You can’t stop staring at Liriel’s massive purple nipples. They’re so luscious, so big and soft that you find yourself absent mindedly rubbing your already exposed groin. [pc.EachCock] begin");
			if (pc.cockTotal() == 1) output("s");
			output(" to drip with need and you look up to see Liriel smiling confidently at you.");
			output("\n\n<i>“Well I guess you can play with the girls.”</i> she says, rubbing circles onto her big green tits. When you make a motion to take things to somewhere more private, she simply leans forward and drops her big tits on the counter before saying, <i>“Look hun, you");
			if (pc.isNude()) output("’re already bare assed and you");
			output("r cock");
			if (pc.cockTotal() != 1) output("s");
			output(" are hard enough to break rocks. We can do this riiight here.”</i>");
		}
		else
		{
			output("You gaze upon Liriel’s massive purple nipples and hungrily salivate a little. They look so soft and inviting that you can’t help but wonder what it would feel like to fuck those sexy tits.");
			output("\n\nShe clears her throat to get your attention--You’ve obviously been caught staring at her rack. <i>“Like what you see hun...?”</i>");
			output("\n\nYou nod in response as [pc.eachCock] swell");
			if (pc.cockTotal() == 1) output("s");
			output(" in agreement.");
			output("\n\nShe continues, <i>“...then take all that flim flamery off and come play with me!”</i> she says, dropping her big green tits on the counter to punctuate her statement.");
			
			if (myrWomen)
			{
				output("\n\nYou disrobe on command and once you’re buck-ass naked, you hear soft bursts of laughter and scandalized breaths, reminding you of the watchful audience spectating you two. The ladies around are appraising your nude form with wide eyed approval. You definitely feel a bit exposed");
				if (pc.exhibitionism() >= 66) output(" and you love every second of it. You slide your hands across your [pc.fullChest] and wrap a fist around your [pc.cock " + x + "], giving it a few long strokes.");
				else output(" and it is a little disconcerting but their encouragement more than makes up for it. The way a few of the ladies grab themselves makes you almost excited to have them watching you.");
			}
			else
			{
				output("\n\nOnce you’re buck-ass naked, Liriel looks around and heaves a sigh. It is almost as if the green babe would prefer there be an audience watching you in the act - kinda like she wants to show you off.");
			}
		}
	}
	
	//Repeatable
	else
	{
		output("You already know Liriel is determined to get down so you make no introductions or even ask. You");
		if (!pc.isCrotchExposed() || !pc.isAssExposed()) output(" strip your [pc.gear] off,");
		output(" whip your [pc.cockNoun " + x + "] out and wag it at her. She swoons in response.");
		
		if (myrWomen)
		{
			output("\n\nSmall bursts of soft giggles remind you that you have an audience. The ladies around are appraising your nude form with wide eyed approval. You feel a bit exposed");
			if (pc.exhibitionism() >= 66) output(" and you love every second of it. You slide your hands across your [pc.fullChest] and wrap a fist around your [pc.cock " + x + "], giving it a few long strokes.");
			else output(" and its a little disconcerting but their encouragement more than makes up for it and the way a few of the ladies grab themselves makes you almost excited to have them watching you.");
		}
		else
		{
			output("\n\nLiriel looks around and heaves a sigh. It is almost as if the green babe would prefer an audience.");
		}
	}
	
	output("\n\nYou walk up to Liriel’s luscious green tits and she lifts one G-cup breast, offering you her big purple teat. A stream of light purple-colored yogurt slides from her pert nipple. She smiles up at you before giving a soft moan of consent. So you step forward with [pc.cock " + x + "] in hand and bask in the scent of blueberries as it rushes out from her big vibrant purple nips.");
	
	if (pc.cocks[x].thickness() <= 3)
	{
		output("\n\nLiriel smiles as you gaze upon the offered nipple. Her nipples are wide enough to encompass your [pc.cock " + x + "] so you place the head of your dick against the purple surface and push forward. The big fuckable nipple relents and makes a slight slurping sound as you penetrate her enlarged milk duct.");
		output("\n\n");
		if (myrWomen) output("Your feminine viewers give a single unified gasp as they watch you slide your shaft forward. ");
		output("Once you’ve submerged as much of your [pc.cock " + x + "] as you can you hold, you look back at Liriel’s face. She has bitten her lower lip and her eyes are closed with an appearance of supreme bliss. Then her smile falters and she opens to look you in the eyes with a sudden incredulous expression, <i>“Well on with it then.”</i> She says loudly before reaching around her bust and smacking your bare ass playfully.");
		if (myrWomen) output(" The ladies seem to really love that and you hear several phrases like, <i>“You tell [pc.him] girl!”</i> and other such playful banter.");
		output("\n\nWith a good-natured chuckle you begin to rock your hips, sliding your [pc.cock " + x + "] in and out of the vibrant purple teat. Liriel squeals in delight as you gently fuck her nipple, testing the milk duct with each push. Warm blueberry yogurt spills from her breasts with every thrust, leaking down your");
		if (pc.balls > 0) output(" [pc.balls] and inner thighs");
		else output(" [pc.legOrLegs]");
		output(", causing a pleasurable, wet trickling sensation.");
		output("\n\nWhen Liriel begins to go cross eyed you increase the pace. Her nipple is the perfect size: not too big and loose but also not too small and tight as to hinder your strokes. Each time you sink your [pc.cock " + x + "] into that big green tit you see it undulate as it absorbs your momentum. Each thrust is harder than the last, slowly speeding up in rhthym and watching Liriel’s expression change.");
		if (myrWomen) output("\n\nYou turn your lust filled eyes onto the world around you, only to find that you’ve forgotten that you have an audience. The myr ladies are watching with baited breaths. Some are tweaking their nipples with mixed expressions of arousal, confusion and curiousity - possibly wondering what having big, fuckable nipples would be like. Others are openly drooling at the sight while rubbing their own tits.");
		output("\n\n<i>“I love it when my nipples get fucked.”</i> Liriel says before grabbing you by the [pc.ass] and pulling you in until you’re fucking her sexy ass for all it’s worth. You hold onto the green tit and groan as your [pc.cock " + x + "] punches into her boob as deep as it can over and over. When you feel your orgasm coming, something you do must alert Liriel to it because she immediately pulls her tit from your cock and spreads her breasts and lips on full display in front of you. Not wanting to lose the feeling, you quickly grab your cock and pump it, pointing it straight at Liriel who eagerly licks her lips. Seeing those gorgeous tits with streaks of your precum and her blueberry yogurt across their surface brings your cum boiling to the surface.");
	}
	else if (pc.cocks[x].thickness() > 3 && pc.cocks[x].thickness() <= 5)
	{
		output("\n\nLiriel smiles as you gaze upon the offered nipple. The nipples are wide enough to encompass your [pc.cock " + x + "] so you place the head of your dick against the purple surface and push forward. You encounter resistance as the head of your dick is larger than the offered nip. You almost stop and place your [pc.cock " + x + "] into the crevice of her pretty green breasts but then you see her reaching forward. She groans as she spreads her nipple wide enough to encompass your [pc.cockHead " + x + "]");
		if (myrWomen) output(", drawing a gasp from the ladies who, moments before, were just shopping");
		output(". Blueberry yogurt spills from her teat as she opens it up for you and you push your dick into the enlarged milk duct.");
		output("\n\n");
		if (myrWomen) output("Your feminine audience gives a single unified gasp as they watch you slide your shaft forward. ");
		output("The edges of the vibrant purple nipple are stretched razor-thin as they are stretched by your advance. Once you’ve submerged as much of your [pc.cock " + x + "] as you can, you look back at Liriel’s face. Her bitten lip trembles and her eyes shut tight in an appearance of jubilation bordering on pain. Then her smile falters and she opens to look you in the eyes with a sudden incredulous expression, <i>“Well fuck already - you can’t stretch a gal open and then stop. Get to it!”</i> she says loudly before reaching around her bust and smacking your bare ass hard.");
		if (myrWomen) output(" The ladies seem to really love that and you hear several phrases like, <i>“You tell [pc.himHer], girl!”</i> and other such playful banter.");
		output("\n\nWith a good natured chuckle you begin to rock your hips, sliding your [pc.cock " + x + "] in and out of the vibrant purple teat. The walls of her widened nipple are suckered onto the surface on your cock and Liriel squeals in agonized delight as you gently fuck her nipple, testing the milk duct with each push. Warm blueberry yogurt spills from her breasts with every incursion, leaking down your");
		if (pc.balls > 0) output(" [pc.balls] and inner thighs");
		else output(" [pc.legOrLegs]");
		output(", causing a pleasurable, wet trickling sensation.");
		output("\n\nHer nipple is so tight you have to admit you’re a little afraid of hurting her. Yet she mumbles something, a stream of words of which only one is clear: faster. So you speed up, gently increasing the pace. Each time you sink your [pc.cock " + x + "] into that big green tit you see it undulate as it absorbs your momentum. It appears she is enjoying it all and each thrust comes at her harder than the last and you watch Liriel’s expression change.");
		if (myrWomen) output("\n\nYou turn your lust filled eyes onto the world around you, only to find that you’ve forgotten that you have an audience. The myr ladies are watching with baited breaths. Some are tweaking their nipples with mixed expressions of arousal, confusion and curiousity - possibly wondering what having big, fuckable nipples would be like. Others are openly drooling at the sight while rubbing their own tits.");
		output("\n\n<i>“I love it when my nipples get fucked.”</i> Liriel says before grabbing you by the [pc.ass] and pulling you in until you’re fucking her sexy ass for all it’s worth. You hold onto the green tit and groan as your [pc.cock " + x + "] punches into her boob as deep as it can over and over. When you feel your orgasm coming, something you do must alert Liriel to it because she immediately pulls her tit from your cock and spreads her breasts and lips on full display in front of you. Not wanting to lose the feeling, you quickly grab your cock and pump it, pointing it straight at Liriel who eagerly licks her lips. Seeing those gorgeous tits with one nipple wide and leaking purple yogurt brings your cum boiling to the surface.");
	}
	else
	{
		output("\n\n<i>“Sorry hun,”</i> Liriel says as you take a step closer, <i>“...but that’s way too thick for some nipple action.”</i> And with that, she leans forward and turns over, showing off her impressive green rack in all its glory. Apparently you’ve been upgraded to full titty fuck.");
		output("\n\nSo you climb onto the buxom broad, sitting your bare ass on her slim tummy, and place your [pc.cock " + x + "] between her warm emerald tits. As you do, she takes her tits in hand and smashes them together before saying, ");
		if (myrWomen) output("<i>“Ladies, make sure you try this at home,”</i> to the crowd of myr women who respond with much swooning and fawning.");
		else output("<i>“Go ahead tiger, show me how much you like these big ol’ knockers.”</i>");
		output("\n\nYou begin to rock back and forth, reaching down to aid her in pressing her tits tight around your [pc.cock " + x + "]. She moans when you begin to increase the pace, enjoying the eroticism of the moment and apparently loving any attention her tits get. You tweak one of her three-inch wide nipples and receive a handful of thick blueberry yogurt.");
		output("\n\nShe groans loudly before saying, <i>“Lick it babe,”</i> in a voice that sounds mid-climax.");
		output("\n\nWhen you lick the purple yogurt you find a pleasant taste that, honestly, gets you a little hotter. Lathering the rest of the fruity cream on her bust, you prepare to really fuck her tits. You watch as your rapid thrusts cause the soft, round flesh to undulate even though the warm skin is pressed inward by a total of four hands. You knead her breast flesh as she calls out. Her nipples must be very sensitive because each time your hands slide across them, she practically screams.");
		if (myrWomen) output("\n\nYou remember your audience and wonder why it is suddenly so quiet. Looking back, you see the myr women watching, wide-eyed in amazement. Some of them have gone so far as to put their hands into their little green man panties. Others watch, legs held tightly together and jaws agape. One couple has even started an intense make out session. It appears your audience is really enjoying the show.");
		output("\n\nYou bear down, looking deep into Liriel’s lust filled eyes as your [pc.cockHead " + x + "] repeatedly peaks through her impressive cleavage. The two of you fall into a mutually pleasurable pattern. You fuck into those bliss inducing tits and she moans hungrily. Then, when her leaking tits inevitably cover your hands in blueberry goop, you lick your fingers, causing her eyes to widen and her voice to climb. That is when you feel it, a dull ache in your loins that spurs you to fuck harder into her soft warm tits. Your hips become a blur as your entire body curls around the sensation of release.");
	}
	
	output("\n\nYelling like a mad" + pc.mf("man","woman") + " you thrust forward and unleash your fresh load right into Liriel’s face.");
	//if (cumNormal)
	if (pc.cumQ() < 100)
	{
		output(" The spurts of [pc.cumNoun] paint streaks of [pc.cumColor] across her visage that drips down onto her bust.");
		if (myrWomen) output("\n\nThe ladies watching break into wild applause. Both you and Liriel turn towards the group of alien t-shirt wearing ant ladies and give two big smiles.");
	}
	//if (cumHigh)
	else if (pc.cumQ() < 500)
	{
		output(" Long ropes of [pc.cumNoun] stretch across her green visage, hair and tits, leaving streaks of [pc.cumColor] across her happy features.");
		if (myrWomen) output("\n\nThe ladies watching begin to hoop and holler in gleeful approval. In response, both you and Liriel turn towards them and each give a thumbs up and a big smile.");
	}
	//if (cumVeryHigh)
	else if (pc.cumQ() < 5000)
	{
		output(" The blasts of [pc.cumNoun] catch Liriel by surprise and you hear a loud yelp that quickly becomes a gurgling sound as your climax paints Liriel’s entire visage and hair [pc.cumColor].");
		if (myrWomen) output("\n\nAn almost deafening roar of applause and cheering punctuates your ejaculation. Looking down, you watch as Liriel wipes her face with white gloved hands before you both turn to your audience and give a thankful wave.");
	}
	//if (cumExtreme)
	else
	{
		output(" The massive blast of [pc.cumNoun] catches Liriel off guard and she lets out a loud, <i>“Oh Fuuc...”</i> that quickly becomes a gurgling sound as her throat fills with your baby batter. You groan deeply as your dick spray paints Liriel’s entire visage and bust [pc.cumColor], as well as a good portion of the silver shop stand... not to mention the huge puddle it leaves on the dry earth below.");
		if (myrWomen) output("\n\nYou’re left heaving and Liriel sputters beneath you. This is all you hear for a brief moment as you try to catch your breath. Then, a deafening roar of your female audience tells you they refuse to be forgotten after such a spectacular show. You look back and see that several myr women have joined since the last time you saw them all and boy are they excited. They cheer so loudly and enthusiastically it kind of hurts your [pc.ears] but both you and Liriel are gracious enough to respond with generous smiles and magnanimous waves.");
	}
	
	output("\n\nWith that done, you rise and begin to help Liriel clean up as best you can.");
	if (myrWomen) output(" A few ladies from the audience are brave enough to approach the two of you and fawn over the performance. The rest soon return to what they were doing before, quietly conversing to each other - except instead of just talking about clothes, they’re also talking about you and Liriel’s public tit show.");
	
	processTime(35);
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	if (myrWomen) pc.exhibitionism(2);
	
	IncrementFlag("LIRIEL_TITFUCKED");
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
