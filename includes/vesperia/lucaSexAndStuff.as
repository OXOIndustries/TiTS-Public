/* luca 2: you get to take her dick now
 * LUCA_SUBMISSION
 * LUCA_SAFEWORD
 * LUCA_ADDICTION: Luca's suppressants mean her addiction takes a while to build up. Yay drugs!
 * LUCA_JUST_TALKED: 4 activates [I Like You], 5 [Sex], 6 just removes the button
*/

public var isOralFixationEnabled:Boolean = true;

public function lucasVRTalkButton(btnSlot:int):void
{
	if (lucaVRsTried() >= 2) addButton(btnSlot, "VR Content", lucaTalkVRs, undefined, "VR Content", "Ask Luca about the content in her VR Simulations.");
	else addDisabledButton(btnSlot, "VR Content", "VR Content", "Maybe you should try some so you know what you're talking about.");
}

public function lucasJustTalkButton(btnSlot:int):void
{
	if (flags["LUCA_JUST_TALKED"] == undefined || flags["LUCA_JUST_TALKED"] < 4) addButton(btnSlot, "Just Talk", justTalkWithLuca, undefined, "Just Talk", "Talk with Luca.");
	else if (flags["LUCA_JUST_TALKED"] == 4) addButton(btnSlot, "I Like You", lucaDoTheConfessyThingy, undefined, "I Like You", (silly ? "Tell Luca that you want her to take you to pound town." : "Tell Luca that you like her."));
}

public function lucaTalkVRs():void
{
	clearMenu();
	clearOutput();
	showLuca();
	author("RequiemForAMeme");
	processTime(5);

	output("<i>\"Can you be more specific?\"</i> She asks you.");
	output("\n\n<i>\"" + (pc.isBimbo () ? "Well they all seem to end with the player in a compromising position" : "They all end with bonkers sex") + ",\"</i> you tell her.");
	output("\n\n<i>\"Well, [pc.Name], to be honest I've never really given it much thought. I just have a thing for submission and domination. I used to download tons of old visual novels with those themes and I would chase bad ends. I would spend days grinding through repetitive scenes just to get the next ending and see what happened. Apparently there was a market for that kind of thing. Anything else I can help you with?\"</i>");
	
	addButton(0, "Next", lucaTalkChoices);
}

public function justTalkWithLuca():void
{
	clearMenu();
	clearOutput();
	showLuca();
	author("RequiemForAMeme");

	//Oh god this switch is huge
	switch (flags["LUCA_JUST_TALKED"])
	{
		case 0:
		case undefined:
		default:
			processTime(5);
			output("<i>\"Hey Luca?\"</i>");
			output("\n\n<i>\"Yes [pc.Name]?\"</i>");
			output("\n\n<i>\"What is your favorite holo?\"</i> You ask her.");
			output("\n\nLuca stares at you and thinks for a moment.");
			output("\n\n<i>\"There's this super old holo, a B rate sci fi adventure named Solar Crusade. It's about a ragtag crew of young people searching for the homeworld of an ancient alien race that disappeared and left clues about a hidden cache of advanced technology on their homeworld. It's most definitely not a good holo, the dialogue is trashy, the sex scenes are awful and the plot is super generic. But I'll always love it.\"</i>");
			output("\n\nYou ask her why her favorite holo is a bad holo.");
			output("\n\n<i>\"To be honest I'm not sure. I've tried watching other holos like it but none of them do it for me. I get about ten minutes in and just get bored. Fun fact I was originally going to take up a career in the extranet holo industry because of Solar Crusade. I had my university courses all laid out and set up.\"</i>");
			output("\n\n<i>\"What happened?\"</i>");
			output("\n\n<i>\"My best friend introduced me to a neurologist at a game convention we were attending. He had assisted in the development of the latest at home VR system that had just come out. I ended up missing nearly half a day because I was so fascinated by his work. I pestered him all day, but he wasn't bothered by a flat chested, dark skinned Dzaan… After the convention I went home and immediately started looking at universities that he recommended.\"</i>");
			output("\n\n<i>\"Well I'm glad you changed your plans,\"</i> you tell her.");
			output("\n\n<i>\"And why is that?\"</i>");
			output("\n\n<i>\"If you did become a super successful and famous holomaker on some core world I wouldn't have been able to meet you.\"</i>");
			output("\n\n<i>\"Is that your way of saying you're happy to have met me?\"</i>");
			if (pc.isBimbo()) output("\n\n<i>\"Well duh silly.\"</i>");
			else if (pc.isNice()) output("\n\n<i>\"Well of course Luca.\"</i>");
			else output("\n\n<i>\"Was I being too subtle?\"</i>");
			output("\n\n<i>\"Well I'm happy to have met you too [pc.Name].\"</i>");

			IncrementFlag("LUCA_JUST_TALKED");
			addButton(0, "Next", lucaTalkChoices);
			break;

		case 1:
			processTime(10);
			output("You bring up something Luca mentioned the last time you flirted with her. <i>\"So Luca, you were flat chested?\"</i>");
			output("\n\nLuca lets out a deep sigh before answering. <i>\"Once upon my teenage years I was the only one of my sisters to have the chest of a board. They would tease me non stop about it.\"</i>");
			output("\n\n<i>\"Was it at least playful?\"</i>");
			output("\n\n<i>\"It was for my eldest sister. She would massage my breasts claiming 'If you rub them like this Luca they'll grow bigger!' but the joke's on her because they grew bigger than hers once I hit my twenties.\"</i>");
			output("\n\n<i>\"I don't believe you,\"</i> you say teasing her. ");
			output("\n\n<i>\"You know what? Here, hold on a second.\"</i>");
			output("\n\nLuca pulls out a tablet and uses it for a bit. She places it onto the counter and turns it so you both can see it. On the screen are eight young Dzaan teenage girls each in school dresses. Of the eight, seven of them have well endowed breasts.");
			output("\n\n<i>\"The one in the middle and on the right is me at sixteen,\"</i> Luca says pointing at the picture. The young Luca is holding a bag close to her knees and she doesn't look at the camera. Though her skin is bronze it's easy to see the red in her face. <i>\"Ugh I hate my hair in this picture.\"</i> The young Luca's hair is dark brown and bowl cut.");
			output("\n\nYou snicker and ask about her sisters.");
			output("\n\n<i>\"From left to right is Alyissa, Katerina, Ophira, my twin Calidora, me, and the triplets Clotho, Lachesis, and Atropos. Our mothers were very interested in the mythology of other races especially Ausars and Terrans. They have this stupid story where they started saving up all their money to move to either Ausaril or Terra and flipped a coin to decide. Ausaril won the flip, but it was out of their price range. They looked at Terra, but that was expensive too. In the end they settled on Mars and moved when they were able to afford it. This picture was taken during Alyissa's last year at our local academy.\"</i>");
			output("\n\nLuca swipes the image. The next picture is of Alyissa in a suit looking nervously at the camera while the rest of her sisters make silly poses and faces behind her. Luca and her twin Calidora are blowing up their cheeks and squinting their eyes.");
			output("\n\n<i>\"This was taken on Alyissa's first day of business school. We'd never seen her like that before, so we decided to immortalize it.\"</i>");
			output("\n\nLuca swipes the image. The next picture shows the next moment after the previous picture. Alyissa had spun around and begun chasing after her sisters.");
			output("\n\n<i>\"She was less than happy with our shenanigans.\"</i>");
			output("\n\nLuca swipes the image. The next picture is a selfie of a terran girl with neon blue hair covering her face and most of her body. Young Luca is in the background freaking out.");
			output("\n\n<i>\"This one is of Nora and I, she's my best friend. We met in my ninth year of the academy. A week after we met she shows up at our house to hang out and show off this new hair mod she got off the extranet. That stupid mod turned it into that obnoxious color, and she used too much, so it just started growing out. It kept growing and growing until I was panicking. She started laughing and said we just had to commemorate the moment with a picture.\"</i>");
			output("\n\nLuca swipes the image. The next picture is of Luca and Nora dressed in cosplay. Luca is wearing a bikini made of chains and cloths. Nora is wearing a leather duster and dressed as a dashing rogue that looks a bit familiar. Nora's hair in this picture is light brown and cut short for the costume.");
			output("\n\n<i>\"This is us for Halloween. There was this huge extranet holo franchise remake that happened in the summer and we fell in love with the characters. I went as this space princess and she went as this dick head smuggler.\"</i>");
			output("\n\nYou notice Luca lingering on the picture for a bit. She eventually swipes across the tablet. Luca spends the next hour showing off old pictures of her before her mods. You learn that her full name is Lucianna Vastnyr. Even though they're twins, Calidora is actually a Beta Dzaan. On a dare from Nora, Luca got a butterfly tattoo above her ass for nearly a year before her parents found out. For prom Luca went with Nora as her date. They dated for a few months after, but decided to just be friends. ");
			output("\n\nEventually though Luca stops when she gets called away to finish a patron's private session.");

			IncrementFlag("LUCA_JUST_TALKED");
			addButton(0, "Next", lucaTalkChoices);
			break;

		case 2:
			processTime(2);

			output("<i>\"I have a question for you Luca. Something that's been slightly gnawing at my curiosity for some time.\"</i>");
			output("\n\n<i>\"I'm not shy, [pc.Name]. Shoot.\"</i>");
			output("\n\n<i>\"" + (pc.isBimbo() ? "How do you like to fuck? Position? Are you into S&M? What about genders? All of it,\"</i> you ask giddily." : "What's your sexual preferences?\"</i> you ask as politely as you can."));
			output("\n\n<i>\"Well now. I'll answer your question if you answer it as well.\"</i>");
			output("\n\n<i>\"Deal.\"</i>");
			output("\n\n<i>\"I'll start. I prefer women with thick thighs and bubble butts,\"</i> Luca smiles fondly. <i>\"With that said I've had some male partners… hnng…\"</i> You see her shaft throb in excitement.");
			output("\n\n<i>\"Luca?\"</i>");
			output("\n\n<i>\"Sorry. Sorry, I was just thinking of this one feminine guy I dated. He was really into cosplay, he could pull off so many dresses I felt jealous some days. Anyway you're up.\"</i>");

			var genderQuestion:Function = function(gender:int):void
			{
				clearMenu();
				clearOutput();
				showLuca();
				author("RequiemForAMeme");
				processTime(1);

				output("<i>\"So do you prefer to be on top or bottom?\"</i> you ask.");
				output("\n\n<i>\"Top. Almost exclusively. I've tried being on the bottom before, never really liked it. How about you? " + (pc.hasCock() ? "Do you prefer top or bottom?" : "Do you prefer front door or back door?") + "\"</i>");
				
				flags["LUCA_PC_GENDER_PREF"] = gender;
				
				addButton(0, (pc.hasCock() ? "Top" : "Front Door"), holeQuestion, 0);
				addButton(1, (pc.hasCock() ? "Bottom" : "Back Door"), holeQuestion, 1);
			};
			
			var holeQuestion:Function = function(hole:int):void
			{
				clearMenu();
				clearOutput();
				showLuca();
				author("RequiemForAMeme");
				processTime(1);
				
				output("<i>\"So are you into bondage? If you are what role do you like?\"</i> Luca asks. You notice her body shift slightly in anticipation.");
				
				flags["LUCA_PC_HOLE_PREF"] = hole;
				if (pc.hasCock()) flags["LUCA_PC_HOLE_PREF"] += 2;
			
				addButton(0, "Dom", domSubQuestion, 0);
				addButton(1, "Sub", domSubQuestion, 1);
				addButton(2, "Switch", domSubQuestion, 2);
				addButton(3, "Not Into", domSubQuestion, 3);
			};
			
			var domSubQuestion:Function = function(role:int):void
			{
				clearMenu();
				clearOutput();
				showLuca();
				author("RequiemForAMeme");
				processTime(1);

				switch (role)
				{
					case 0: output("Luca looks disappointed as Dom comes out of your mouth. <i>\"I see [pc.Name]. I'm in the same ship… We'll have to exchange stories some time,\"</i> she says with a sly smile."); break;
					case 1: output("Luca bites her lip as the word 'sub' leaves your mouth. <i>\"Oh you are just <i>perfect</i> aren't you [pc.Name].\"</i> A tingle goes down your spine as you see her emerald eyes stare you down with predator like focus. <i>\"I personally love the dom position.\"</i>"); break;
					default: output("<i>\"I see. I prefer the dom role personally.\"</i>"); break;
				}
				output("\n\nIt seems like Luca is about to say something else as a drone approaches her. She is called away to a booth to address a customer. As she's walking away, you catch her enchanting eyes gazing back at you.");

				flags["LUCA_PC_ROLE_PREF"] = role;
				
				addButton(0, "Next", lucaTalkChoices);
			};
			
			IncrementFlag("LUCA_JUST_TALKED");

			addButton(0, "Men", genderQuestion, 0);
			addButton(1, "Women", genderQuestion, 1);
			addButton(2, "Herms", genderQuestion, 2);
			addButton(3, "Shemales", genderQuestion, 3);

			break;

		case 3:
			processTime(4);
			output("<i>\"[pc.Name],\"</i> Luca says. <i>\"I was just thinking about you.\"</i>");
			output("\n\n<i>\"Oh?\"</i>");
			output("\n\n<i>\"Yes. You've gotten to hear about me. Now I want to hear about you.\"</i>");
			output("\n\n<i>\"What would you like to know?\"</i> You ask.");
			output("\n\n<i>\"Tell me about your childhood. What was it like?\"</i>");
			switch (flags["PC_UPBRINGING"])
			{
				case GLOBAL.UPBRINGING_PAMPERED: output("\n\n<i>\"I grew up without ever really having to work for much. To be honest it probably hurt my impulse control.\"</i>"); break;
				case GLOBAL.UPBRINGING_ATHLETIC: output("\n\n<i>\"I'm pretty sure I was a part of more sport activities than classes at school. To be honest I spent more time outside on the field than inside studying.\"</i>"); break;
				case GLOBAL.UPBRINGING_BOOKWORM: output("\n\n<i>\"I spent most of my childhood reading and studying in a classroom or under a tutor. To be honest I didn't get outside much.\"</i>"); break;
				case GLOBAL.UPBRINGING_AUSTERE: output("\n\n<i>\"It was strange to say the least. If I wanted something I had to earn it, which is probably not something you'd think the " + pc.mf("heir", "heiress") + " to a multi billionaire would say.\"</i>"); break;
				default: case GLOBAL.UPBRINGING_BALANCED: output("\n\n<i>\"To be fully honest I did so many things as a kid that it would probably be easier to list of things I didn't do than the things I did do.\"</i>"); break;
			}
			output("\n\n<i>\"That sounds interesting. To be honest I couldn't imagine growing up as an only child. I video chat with all my sisters at least once a week.\"</i>");
			output("\n\n<i>\"What are they up too?\"</i> You ask.");
			output("\n\n<i>\"Alyissa and Katerina became business partners with some of our cousins on our homeworld, Heloith IV. They're each in charge of a resort with their harems. What did you do before the rush?\"</i>");
			switch (pc.characterClass)
			{
				case GLOBAL.CLASS_SMUGGLER: output("\n\n<i>\"Before the rush my job was basically a glorified delivery [pc.boyGirl]. I would be entrusted with a package and I'd get it to it's destination in a timely and safe fashion. Other times I would have to liberate a parcel from some less than upstanding individuals and get it to its proper owners.\"</i>"); break;
				case GLOBAL.CLASS_MERCENARY: output("\n\n<i>\"Before the rush I was part of a mercenary group. We would usually just chase down pirates, but sometimes we'd get specific bounties to track down. Lots of boring traveling with small moments of intense firefights.\"</i>"); break;
				default: case GLOBAL.CLASS_ENGINEER: output("\n\n<i>\"Before the rush my job was essentially working security as a tech " + pc.mf("guy", "gal") + ". I'd set up, build, repair and or program all sorts of things. I worked on everything from turrets and robots to blasters and electrified clubs.\"</i>");
			}
			output("\n\n<i>\"" + (pc.characterClass == GLOBAL.CLASS_ENGINEER ? "I guess we have a lot in common [pc.name]." : "Well that's much more exciting than my career.") + " I suppose I should tell you about Ophira. She's one of the main singers and dancers for <i>\"The Lost Stars\"</i> opera group. She always says that if her group ever comes to Vesperia I'll get front row seats.");
			output("\n\n<i>\"What's your twin up to?\"</i>");
			output("\n\n<i>\"Cali is a field medic in the Galactic Rush. Last time we spoke she was working in a triage center dealing with a bunch of idiot rushers that don't understand that unexplored alien worlds are full of danger. What are you hoping to get out of the rush?\"</i>");
			output("\n\nThus begins the story of your adventure. It takes a while and Luca asks a question here and there, but you manage to explain your quest and the things you've experienced so far. Luca quietly contemplates what you've told her. You break the silence by asking what her little sisters are up to.");
			output("\n\n<i>\"Those three… Clotho, Lachesis and Atropos run a restaurant call 'The Fates' on Mars. They each offer a different menu based on who's the head chef for the day. They opened it near our old home there. Once a year we all try to gather and meet up there... So your cousin. Do you hate [rival.himHer]?\"</i>");

			var replyFunc:Function = function(yesNo:int):void
			{
				clearMenu();
				clearOutput();
				showLuca();
				author("RequiemForAMeme");
				processTime(1);
				
				switch (yesNo)
				{
					case 0: output("<i>\"Yes. I hate [rival.name]. [rival.HeShe]'s trying to take my inheritance from me. They're trying to take the last thing dad left me. I just can't forgive that.\"</i>"); break;
					case 1: output("<i>\"No. I don't hate [rival.name]. Despite everything [rival.heShe] has done and probably will do I can't bring myself to hate them. Maybe it's because we're family or I'm too forgiving, but I don't hate [rival.himHer].\"</i>"); break;
					default: case 2: output("<i>\"To be honest with you Luca? I'm not sure. [rival.name] has done some terrible things to spite me. And I'm not sure how I feel about it all. At times I'm angry beyond belief and then other times I'm sad knowing that a member of my family despises me for reasons I may never know.\"</i>"); break;
				}

				output("\n\nLuca grabs your [pc.hand]. <i>\"If you ever need to talk about it I'll be here for you.\"</i>");
				output("\n\n<i>\"Thanks Luca,\"</i> you let go of her. <i>\"I should head out now.\"</i>");
				
				addButton(0, "Next", lucaTalkChoices);
			};

			IncrementFlag("LUCA_JUST_TALKED");
				
			addButton(0, "Yes", replyFunc, 0);
			addButton(1, "No", replyFunc, 1);
			addButton(2, "Not Sure", replyFunc, 2);

			break;
	}
}

public function lucaDoTheConfessyThingy():void
{
	clearMenu();
	clearOutput();
	showLuca();
	author("RequiemForAMeme");
	processTime(9);

	output("<i>\"Hi Luca,\"</i> you look around the Lotus eater. <i>\"Is there somewhere we could speak privately?\"</i>");
	output("\n\nLuca cocks an eyebrow. <i>\"Yeah, just hold on for a moment.\"</i> She makes a few keystrokes on the hardlight display. One of her butler drones appears before you two after a brief moment. <i>\"Sebastian, watch the desk for me.\"</i>");
	output("\n\n<i>\"As you wish, mistress,\"</i> the drone replies.");
	output("\n\n<i>\"Follow me, [pc.Name].\"</i> ");
	output("\n\nYou follow Luca into the back of the Lotus Eater. She takes you past all of the private rooms to a door with a handprint scanner. She unlocks the door and waves you inside.");
	output("\n\nYou step into a dimly lit room. In the back left corner you see a circular bed overflowing with pillows. Opposite is a workstation covered in tools, electronics, robotic parts and hardlight displays. Towards the door there is a couch and several reclining chairs sitting before an assortment of retro gaming consoles and flat screen monitors. On your left is a veritable library of classic holos and extranet shows. Finally there are dozens of sex toys and contraptions scattered throughout the room.");
	output("\n\n<i>\"Welcome to my room [pc.Name].\"</i> Luca closes the door behind you. <i>\"You wanted to talk privately.\"</i>");
	output("\n\n<i>\"" + (pc.isBimbo() ? "Luca I think we should like totally become fuck buddies.\"</i>" : "I like you Luca, I wanted to ask how would you feel about dating a" + (pc.isNice() ? "" : pc.mf(" handsome", " beautiful")) + " rusher like me?\"</i>"));
	output("\n\n<i>\"Well that was straight to the point… I like you too [pc.Name]...\"</i>");
	output("\n\n<i>\"That sounds like there's supposed to be a 'but' after that.\"</i>");
	output("\n\n<i>\"I guess you'd call me a high maintenance woman. We should sit down. This is going to take a bit.\"</i> Luca waves you over to her bed. Once you're both seated she continues. <i>\"So I have… no that sounds so bad when I start it like that… um fuck. This is more embarrassing than I thought it would be. I want you to know that I was planning this well thought out and heartfelt confession for you before you ruined it all by being upfront.\"</i>");
	output("\n\nYou laugh and tell Luca that you'll listen to whatever she has to say.");
	output("\n\n<i>\"Ok story time.\"</i> She breaths in and out a few times. <i>\"So I'm a Dzaan. An alpha Dzaan to be specific and our semen has addictive properties. Now this wouldn't be much of a problem as someone, well several someones actually, made drugs and treatments so that we can have sexual partners without getting them addicted to our dicks. It's a problem for me because those things don't work on me, well more specifically they stop working eventually.\"</i>");
	output("\n\n<i>\"Eventually?\"</i> you ask.");
	output("\n\n<i>\"I never told you the whole story of how Nora and I started dating after we graduated. It was fantastic, we were both young, we had known each other for years, and we took all the necessary precautions. We even asked my parents about what to do and what not to do, I thought my face was going to melt off that day… About a month into it Nora started to change, she became clingy and wanted to have sex more often, well even more often that usual for two horny teenagers. I didn't notice it because I was living in blissful ignorance. Fast forward about two months and one day I was spending time with Cali. Nora barged in freaking out and demanding I fuck her on the spot… I don't really want to go into specifics about that.\"</i>");
	output("\n\nYou tell Luca if she doesn't want to talk about it she doesn't have to.");
	output("\n\n<i>\"No. It's fine [pc.Name] I want you to know. You deserve to know if we ever want to make things work between us. Nora was given a medical examination and to no one's surprise she had become addicted to me. Nora received treatment while doctors did several tests on me to figure out why the drugs I was taking stopped working in the first place. One of them eventually contacted a U.G.C. specialist due to how unusual my case was.\"</i> Luca breathes deep. <i>\"The specialist did some tests and then about week later sat me down with my parents. He explained that I was born with a genetic defect.\"</i>");
	output("\n\n<i>\"A defect?\"</i> You ask.");
	output("\n\n<i>\"Yup. Due to how my genes work any drugs, treatments or mods I use will either not work at all, barely do anything or have unforeseen consequences. It's called Lasciel's Disease, it's not life threatening thankfully. It occurs in about one in a billion Dzaan, less than a thousand documented cases. And for me it took getting my best friend getting addicted to my cock to find out I had it.\"</i>");
	output("\n\nLuca pauses for a moment to gather her thoughts.");
	output("\n\n<i>\"Luckily it's manageable and I eventually found gene mods that would work with my body. As for my dick, I've found a drug that dilutes the effects enough to prevent addiction as long as my partner and I aren't fucking like rabbits. Every so often I get a one night stand with a close friend, usually Nora.\"</i>");
	output("\n\n<i>\"So you two are still friends.\"</i>");
	output("\n\n<i>\"Yes, we are. It took months of therapy before she showed signs of improvement, but she got back to her old self. Halfway through her therapy she escaped the hospital to break into my house and take me to dinner to celebrate the day we met. She never held a grudge, but she lost who she was because of me. I don't- I don't want that to happen to anyone else. I'm sorry [pc.Name] I think I just talked myself out of this. I think-\"</i>");
	output("\n\nYou pull Luca towards you and embrace her. <i>\"It's alright Luca. I'm not going to lose who I am. We can take it slow. We'll go at whatever pace you want.\"</i>");
	output("\n\nLuca wraps her arms around you. <i>\"I'm- I'm not sure. I just… I don't know [pc.Name].\"</i>");

	addButton(0, "Kiss Her", function():void
	{
		clearMenu();
		clearOutput();
		showLuca();
		author("RequiemForAMeme");
		processTime(1);

		output("You shift slightly and lock eyes with Luca. You draw her lips towards your own and kiss her. Luca responds by pulling you closer and spreading her plush lips against yours. For a split second you wonder if you should use your tongue, then Luca's forces its way into your mouth. Slowly, but surely you both begin to relax and make out for a few minutes.");
		output("\n\nLuca pulls herself away, visibly panting. <i>\"Alright [pc.Name]. We'll give this a chance. Let me know when you're ready.\"</i>");
		output("\n\n<i>\"As you wish, mistress.\"</i> You tease.");
		output("\n\nLuca laughs and playfully slaps your shoulder. You bid her farewell and leave for the time being.");
		
		flags["LUCA_JUST_TALKED"] = 5;
		
		addButton(0, "Next", function():void { moveTo(rooms[currentLocation].southExit); mainGameMenu(); });
	}, undefined, "Kiss Her", "Go for it.");

	addButton(1, "Be Friends", function():void
	{
		clearMenu();
		clearOutput();
		showLuca();
		author("RequiemForAMeme");
		processTime(1);

		output("<i>\"Everything's going to be alright Luca.\"</i> You tell her. <i>\"No matter what happens. I'll always be your friend.\"</i>");
		output("\n\n<i>\"Thanks. Thank you.\"</i> She tightens her arms around you. <i>\"Thank you so much [pc.Name].\"</i>");
		output("\n\nYou hold Luca for a few minutes. Eventually she breaks the embrace to return to work. You make sure that she's alright before you leave.");

		flags["LUCA_JUST_TALKED"] = 6;

		addButton(0, "Next", function():void { moveTo(rooms[currentLocation].southExit); mainGameMenu(); });
	}, undefined, "Be Friends", "Luca just needs you to be a friend. But you'll never be anything more.");
}

public function lucaSexRouter():void
{

}