//Mostly written by SomeKindofWizard

public function shekkaIsCrew():Boolean
{
	return (flags["SHEKKA_ONBOARD"] != undefined);
}
public function shekkaRecruited():Boolean
{
	return (flags["SHEKKA_RECRUITED"] != undefined);
}

//Post-Crew Menu
//Clicking on Shekka’s name when you’re selecting Ship Followers gives you the current description.
public function approachCrewShekka(back:Boolean = false):void
{
	clearOutput();
	showShekka();
	author("SomeKindofWizard");
	if(back)
	{
		output("Shekka's still there, cute as ever. Did you need anything else from her.");
	}
	else
	{
		output("Although it seems that Shekka doesn’t notice you on her approach, one of those floor-touching ears is flipped back, and her tail squirms nervously from side-to-side. She does a good job of looking busy... or maybe she actually <i>is<i> busy, thinking about it. She’s done a good job of converting your engine-room to an impromptu workshop. Although having a chest of tools has made a warm room even warmer, the body-suited Rask seems to be coping just fine.");
		output("\n\n<i>“Hey Shekka”</i> you say, smirking when she doesn’t jump in surprise. The curvy shortstack flips back her ears and ruffles her feathers out.");
		output("\n\n<i>“G’");
		if(hours < 12) output("mornin’");
		else if(hours < 18) output("noon");
		else output("evenin’");
		output(" [pc.name]. Is there anything I can do you for?”</i>");
	}
	shekkaCrewMenu();
}

public function shekkaCrewMenu():void
{
	clearMenu();
	addButton(0,"Appearance",crewShekkaAppearance);
	addButton(1,"Talk",talkToCrewShekka);
	/*Her menu looks as follows:
		//Appearance
		//Talk
		//	Planets
		//Tarkus
		//Tavros //Unlocked by going there with her on crew
		//New Texas //Unlocked by going there with her on crew
		//Myrellion //Unlocked by going there with her on crew
		//Uveto //Unlocked by going there with her on crew
		//Crew
		//	Anno
		//	Azra
		//	Bess
		//	Celise
		//	Nova
		//	Reaha
		//	Yammi	
		//Spend Time //Either do Tavros shit or Ship shit
		//??? //Turns into <i>“Addiction”</i> if you have aphrodisiac spit and she sleeps with you
		//Body //starts a conversation line about being Futa
		//Sex
		//	Bend her over
		//	Cum play //For people with them nuki nuts
		//	Ear play //now with a variation for smaller cocks	
		//	Anno Threesome
		//	Bed sex
		//		Be ridden
		//		Hard lovin’
		//	Get fucked //Greyed out unless Shekka Futa
		//		Anal
		//		Oral
		//		Vagoo
	*/
}

//Appearance
public function crewShekkaAppearance():void
{
	clearOutput();
	showShekka();
	author("SomeKindofWizard or Fenoxo");
	output("You take your time to admire Shekka’s figure, and she strikes a little pose for you, fanning herself. It seems moving from her previous wasteland to your ship has done wonders for her diet. Or more correctly... probably added a little to her cup-size.");
	output("\n\nShe hasn’t seen fit to change out of her usual hex-patterned, Aegis-shipyards jumpsuit either. It clings to her body like an erotic second skin. Her nipples poke accusingly out as though shrinkwrapped, and the plump lips of her pussy seem almost engorged by the tight layer of nano-weave fabric.  The rest of her body is much as it has always been; the broad, egg-laying hips of a Raskvel put the span of her shoulders to shame.");
	//if futa
	if(shekka.hasCock()) 
	{
		output("\n\nNot including, of course, her more recent addition of a turgid, bitch-breaking ");
		if(!shekka.hasCock(GLOBAL.TYPE_EQUINE)) output("throbb-knob");
		else output("horsecock");
		output(" as it struggles not to break out of her clothing.");
	}
	output("\n\nThe feathers that makes for her species’ hair is still dyed the adorable bubblegum-pink, flaring exotically at the top whilst hanging down to her back. The red-scaled alien’s ears don’t so much as emerge from her plumage as it does drape down her sides. Thick golden rings and studs jingle and jangle from them with every errant head-moving, ensuring she can never sneak anywhere. Her face is adorable and youthful, with a button nose, soft lips, and big, slitted eyes.");
	if(9999) output(".. although, those slit pupils are currently dilated as far as they can go, tracing the movement of your mouth with ill-disguised need.");
	output("\n\nShe bounces on her heels, adding a little clicker-click of her clawed feet to the music of her ears. <i>“If you want a proper look at me, I’m happy to accommodate!”</i>");
	clearMenu();
	addButton(0,"Next",approachCrewShekka,true);
}

//Talk
public function talkToCrewShekka():void
{
	clearOutput();
	showShekka();
	author("SomeKindofWizard");
	output("You let her know that you’re just down for a chat, and she puts down some miscellaneous machined-piece down on the floor–hopefully that didn’t come from your engine.");
	processTime(2);
	//9999
}

//Places
//Tarkus
public function talkToCrewShekkaAboutTarkus():void
{
	clearOutput();
	showShekka();
	author("SomeKindofWizard");
	output("<i>“Soooo...”</i> you begin, wondering where to start with such a question. <i>“What do you think about Tarkus these days?”</i>");

	output("\n\nShekka squints, rubbing one of her ears. <i>“Tarkus itself? I mean, it’s highly likely in my lifetime I get to see it become a place worth living in. More than just a shitty little scrapyard pretending to be more. Right now though? Still dangerous, and unhealthy.”</i>");

	output("\n\nShe sighs and gives the matter a little more thought. <i>“I mean, I know you aren’t asking me for the tourist-planner description, after all you have been through, I should be going to <i>you<i> for advice on traversing the wastes out there.”</i>");

	//Annoquest done, goos saved//
	if(9999)
	{
		output("\n\n<i>“There are less of those Goos than before, and the ones still out there are occasionally being given... uh, memory chits I think? I know that the Galotian queen wanted to try and lend a hand with their being-recognized as a race. Sounds neat to me! ");
		//gave bodies//
		if(9999) output("Especially since their Captain’s doing well, she’s able to turn some heads... what with being a technically-ancient, mortal-turned-immortal sentient. ");
		//Goo bodies//
		output("There <i>is<i> a little issue with the fact that the queen is more than a little horrified that an entire ship’s worth emergent, innocent intelligences got wiped out and replaced by functionally dead people.");
		output("”</i>");
	}
	//Cont here
	output("\n\nYou wave her on to continue. <i>“Yeah, yeah. Okay, well. Sidians are still jerks. That’s probably racist, but still. They’re all sorta... dying out. If I’m honest there’s only one thing that’s truly bothering me, and it’s those fucking Goblins.”</i>");
	output("\n\nWow, racist, you remark, and she furrows her brows. <i>“You’re right, you’re right. They’re probably not all bad. But except for that crazy dude who sold weird condoms or whatever they were, they take advantage of my people in order to get us to mine resources for them. Or, y’know. Outright slavery.”</i> she cracks her knuckles slowly.");
	output("\n\n<i>“I’ve seen the syllabus for the new Rasks though. Unlike most of my people, I plan. I’m a planner. And hopefully all the new kids will turn out to be planners too. Happy, healthy planners... who won’t take any of their shit.”</i>");
	output("\n\nIt’s the first time you’ve ever seen her properly express her distaste about someone. It’s kind of scary.");
	//Domme//
	//?if(9999) output("The urge to break her in has your fingers twitching///subby//Mnf.}");
	output("\n\nShekka takes a deep breath after that, fondly stroking a spanner. <i>“Well, with that little unpleasantness covered. Anything else, [pc.name]?”</i>");
	//Next: back to Places menu
	processTime(30);
	clearMenu();
	addButton(0,"Next",9999);
}

//Tavros //Unlocked by going there with her on crew
public function shekkaTalksAboutTavros():void
{
	clearOutput();
	showShekka();
	author("SomeKindofWizard");
	output("<i>“I was wondering what your opinion was on Tavros.”</i> You begin, eyeing Shekka up and down. She immediately breaks out into a bright smile, clapping her hands together.");
	output("\n\n<i>“Terrifying!”</i> she says with delight, wiggling her hips.");
	output("\n\nThe response gives you a moment’s pause, but the curvy egg-layer doesn’t leave you curious for too long. <i>“Let’s look at it this way. Back when I lived on Tarkus the only thing that scared me was the dangers I already knew about. Tavros? Sweet stars and suns [pc.boyGirl]! There is now so much I don’t know. And somehow I’m fairly sure I could fix every last part of it!”</i>");
	output("\n\nHer cheerful smile becomes a briefly bashful grin <i>“Nearly got in trouble trying to tweak some girl’s engine, apparently ship security? Noooot fans of unsolicited repairs on dry-docked stuff, even if it looks half like scrap. Maybe I was just nostalgic.”</i>");
	output("\n\n<i>It couldn’t be, could it?</i>");
	output("\n\n<i>“The drinking is cool, the totally open sexual stuff is as exciting as it is mind-blowing... although I admit I’d have more fun doing that stuff with you than any other random spacer,”</i> she giggles when you roll your eyes before continuing. <i>“It’s a space station, except it’s right here in the middle of galactic fuck-nowhere, drawing in more varieties of aliens and droids and sex and drugs and foods than I’ve literally ever been able to dream of. And I dream pretty big.”</i>");
	if(pc.isBro()) output("\n\n<i>“Yeah, I think it’s a cool place too.”</i>");
	else if(pc.isBimbo()) output("\n\n<i>“Ohmigosh, I love it too Shekka!”</i>");
	else output("\n\n<i>“It certainly sounds like a glowing endorsement to me then.”</i>");
	output("\n\nShekka smirks, shaking her head a little. <i>“It </i>is<i> still scary though. I’m a small girl and there is so much I don’t know about the UGC. I’m like an oil-pit to a scrak-lizard for all manner of fast-talking scammers. I wasn’t aware that so many of the various bipedal species were total pieces of shit.”</i>");
	output("\n\nFair point.");
	//Next: back to Places menu
	processTime(10);
	//9999
}

//New Texas //Unlocked by going there with her on crew
public function talkToShekkaAboutNewTexas():void
{
	clearOutput();
	showShekka();
	author("SomeKindofWizard");
	output("Alright, the curiosity is too much; what does Shekka think about New Texas? Fun? Sexy? Exciting?");
	output("\n\n<i>“Awful”</i> Shekka says, with a smirk.");

	//Normal
	if(!pc.isBimbo()) output("\n\n<i>“Oh... care to explain why?”</i>");
	//Bimbo
	else output("\n\n<i>“But, but like, the sex!”</i>");
	//Merge
	output("\n\n<i>“Don’t get me wrong, the sex part of the whole planet is great. The attractions are great, and the attractions are attractive.”</i> Shekka pauses to enjoy her silly word-play, nodding to herself. <i>“It’s the circumstance though. What they’ve done to their people is literally the opposite of what I did to mine. I can’t express how fucking terrifying that is. They <i>want<i> to be idiots, incapable of thinking about nothing but sex so that they can’t cause trouble. Sure, their planet is idyllic, but they had the luck to start off human. The only people who can take advantage of <i>them<i> are their own.”</i>");
	//Treated
	if(pc.isTreated()) output("\n\nThe Raskvel pauses, looking you up and down a few times. <i>“You know I don’t mean to offend you too, right? You stand out as a prime example of someone who can still get things done even with a terrible case of cockbrain. But I’m going to assume you didn’t start your life like that. Right?”</i> You nod; that’s right.");
	//Cont
	output("\n\n<i>“Also? Calling it ‘The Treatment’ just makes it kind of scary, as if you weren’t a citizen until you got your brain all jacked up... Which, again, I recognize the hypocrisy of that statement coming from me. I’ve literally done the same. You can see why I don’t like this place. The other side of the coin is a shitty place to be when you realize it’s probably just as shineless as the other.”</i>");
	output("\n\nShe sighs and crosses her arms, glancing away.");
	//Next: back to Places menu
	processTime(10);
	clearMenu();
	addButton(0,"Next",);
}

//Myrellion //Unlocked by going there with her on crew
public function shekkaMyrellionTalk():void
{
	clearOutput();
	showShekka();
	author("SomeKindofWizard");
	output("How does she feel about Myrellion? Plenty of sexy addictive Reds and squishable Honey-pot Golds there.");

	//If Shekka’s Addicted
	if(shekkaAddicted()) output("\n\n<i>“Well... the reds I... I got a chance to see a few. That was... yeah.”</i> Shekka chews on her bottom lip, staring at your own kisser in accusation. <i>“It’s better with you though.”</i>");
	//Else
	else  output("\n\n<i>“Hmmn... there is something appealing about those hard-body Reds. I feel like I have to be careful around them. But they’re less– okay no, wait. I was going to say ‘less like jerks than I expected’, but that still doesn’t sound particularly good. They’re stern and orderly and I assumed that would make them all act like grade-A tossbaskets. But nope. I even saw a few smile.”</i>");
	//Merge
	output("\n\n<i>“The golds I can take-’em-or-leave-’em. Their boobs are freaking ginormous, but something about them strikes me as... off. Like they kind of want to feel sorry for me because I’m not them.”</i> Shekka sighs and ruffles her quills, mulling the words over. <i>“They’re nice enough to my face though... which I suppose is what matters? They’re willing to overlook whatever social stigma is going on to be pleasant to strangers.”</i>");
	output("\n\nFair enough. They’ve only ever been good... very good... to you.");
	//Next: back to Places menu
	//9999 Make shekka  not hate golds fen. SkoW is crazy.
	clearMenu();
	addButton(0,"Next",9999);
}

//Uveto //Unlocked by going there with her on crew
public function shekkaUvetoTalk():void
{
	clearOutput();
	showShekka();
	author("SomeKindofWizard");
	output("Shekka reflexively shivers, rubbing at her arms. <i>“Something I learned from my first visit there? Rasks are not built for that level of cold. Seeing snow for the first time was awesome, but I damn-near froze my scales off just standing around.”</i> The cold was an obvious thing to mention, but you push her for a little more info.");
	output("\n\n<i>“Eh... I never went out into the wastes, since I’m not a crazy spacer like you. After the first visit pretty much just stayed on the station, where it’s warm. Oh! I did get a squishy hug from one of those bigger, fluffier Ausar girls. That warmed me up a bit.”</i>");
	output("\n\nNo kidding? You give her a questioning look, and she clears her throat, blushing purple. <i>“We didn’t do anything. Maybe we would’ve, but one of those feathery fuckmuppets were watching and complaining about something. Bit of a mood killer.”</i>");
	//Next: back to Places menu
	processTime(8);
	clearMenu();
	addButton(0,"Nex",9999);
}

//People
//Anno
public function shekkaAnnoTalk():void
{
	clearOutput();
	showShekka();
	output("<i>“Alright”</i> you begin, sizing the little Raskvel up. <i>“What do you think about Anno?”</i>");
	output("\n\nShekka grunts and huffs. <i>“Super annoying. She thinks she’s so smart too. And she’s so... so bouncy and stuff, and she doesn’t seem bothered by anything”</i>");
	output("\n\nUh huh... you give her an even look, waiting for her to crack. <i>“Okay, okay! She’s... she’s alright I guess. Don’t you dare tell her I kind of enjoy having a rival nerd. I’m still better than her, and her stupid university degrees.”</i>");
	output("\n\nThat sounds a lot more like it. It’s tempting to give her another poke and see if you can learn something really juicy, but the poor girl’s cheeks are already starting to turn to plums.");
	//Next: back to People menu
	processTime(5);
	//9999
}

//Azra
public function shekkaAzraTalk():void
{
	clearOutput();
	showShekka();
	output("<i>“Azra, huh? Well... it would be intimidating how she’s as tall as four of me stood on my shoulders. But she’s been nothing but cool. I admire that she’s determined to learn more about the Galaxy.”</i> She hesitates for a moment, looking up at you carefully. <i>“That said, it does seem like an awful lot of danger is involved. I’d never forgive her if she got you hurt chasing after some kind of fuckable lilypad.”</i>");
	output("\n\nYou give her a reassuring pat on the head, rubbing the base of her ear until she starts to coo. <i>“Unfair, distracting me like that...”</i> You ask if there’s anything more about her she finds interesting than just her job.");
	output("\n\n<i>“...Alright, so maybe I want to scale her like a big, fuckable mountain, mash my face into her rack, and see just how good she is with those lovely large hands. Put in a good word for me, okay?”</i>");
	processTime(5);
	//Next: back to People menu
	clearMenu();
	addButton(0,"Next",9999);
}

//Bess
public function shekkaBessTalk():void
{
	clearOutput();
	showShekka();
	output("Shekka frowns at your next query, ears jingling as she shifts her head from side-to-side. <i>“Weird, I guess. They got dumped in the middle of the wastes by someone, and now they’re here. Maybe I’ve been watching too much shitty holo-drama, but I half expect her to reveal some kind of hidden malevolent directive and laser-blast us to hell.”</i>");
	output("\n\n<i>“Also bots that are super synthetic don’t do it for me. I like that clunky, scrappy style. I want to see some metal, and bolts. I want our sexable future to be shiny and chrome!”</i>");
	output("\n\nCool.");
	//Next: back to People menu
	processTime(5);
	clearMenu();
	addButton(0,"Next",9999);
}

//Celise
public function shekkaCeliseTalk():void
{
	clearOutput();
	showShekka();
	author("SomeKindofWizard");
	output("When you bring up the issue of Celise to her, Shekka’s head immediately whips around. <i>“She’s not here, is she? Last time I took a nap at the engines I woke up to find myself totally spotless.”</i>");
	output("\n\n<i>“So?”</i> you ask <i>“She cleaned up?”</i>");
	output("\n\n<i>“I was also naked. I went to sleep in my suit. And my pussy felt so plump and tingly. I’m okay with fooling around, but I’d rather she didn’t pull a stealth on me.”</i>");
	output("\n\nYou promise to bring that up with your green gooey friend, inviting Shekka to continue.");
	output("\n\n<i>“Other than that, she does a lovely job keeping the place spotless. The odd hug-on-demand seems like fair trade for a loving companion, you know? It was weird being around a Goo that didn’t have some kind of assault-for-juices-protocol.”</i>");
	output("\n\nMaybe she does, she’s just a lot gentler about it.");
	processTime(5);
	clearMenu();
	addButton(0,"Next",9999);
}

//Nova
public function talkToShekkaAboutNova():void
{
	clearOutput();
	showShekka();
	author("SomeKindofWizard");
	//If wearing Nova
	if(9999) 
	{
		output("<i>“Heeeey... I’m right here!”</i> your armor says, forming a face to look up at you with a pout. The little Raskvel flinches in surprise before struggling to fight down snorts and giggles.");
		output("\n\n<i>“Obviously I think she’s a sweetheart, [pc.name]”</i> she says after a pause, grinning when the weaponized grey-goo climbs off of you to give her a hug.");
	}
	//Else
	else output("<i>“If I’d been told one of those rapey little monsters could turn out to be a wearable, weaponized bimbo-armor, I would have said that was crazy. But no...  She is a total sweetheart. Sadly a bit out of my technological expertise or I’d have a poke around inside of her.”</i>");
	//Next: back to People menu
	processTime(4);
	clearMenu();
	addButton(0,"Next",9999);
}

//Reaha
public function shekkaReahaTalk():void
{
	clearOutput();
	showShekka();
	author("SomeKindofWizard");
	output("Shekka looks down at her chest with a frown. <i>“I’m jealous of those big ol’ milky tits of hers. I’m happy to admit that much. Also she dodged getting herself retardulated by the Treatment, which I suppose I approve of... I can’t imagine how guilty she must have felt knowing she still wanted to look like a curvy milk-tank. I said something kind of rude to her when we first spoke, I assumed she was Treated... she took it well, and made me feel like an asshole. Which I deserved.”</i>");
	output("\n\nAfter that, she smiles and nods in satisfaction. <i>“She’s good people, and her milk is delicious. Look after that Moo.”</i>");
	processTime(3);
	clearMenu();
	addButton(0,"Next",9999);
}

//Yammi	
public function talkToShekkaAboutYammi():void
{
	clearOutput();
	showShekka();
	author("SomeKindofWizard");
	output("<i>“You have a habit for trying to rescue people with money, don’t you?”</i> Shekka asks, grinning. <i>“I don’t know that I have much to say about her, but sweet scrap and stars she cooks an awesome meal... do you think my thighs look fat?”</i>");
	output("\n\nTrick question, you’re sure.");
	output("\n\nShekka snorts and slaps you on the leg <i>“Ass. But yeah, I like her, she’s nice. I can’t cook for crap, until meeting her I’d never had anything so incredibly delicious. You’re so lucky she’s not in some high-class establishment right now.”</i>");
	processTime(3);
	clearMenu();
	addButton(0,"Next",9999);
}

//Spend time
//On Tavros Station
public function spendTimeWithShekka():void
{
	clearOutput();
	showShekka();
	if(onTavros9999)
	{
		output("You ask if Shekka would like to take a break from... whatever it is she’s doing and hang out with you for a while. <i>“Hmmm, you’re asking me without that mischievous eyebrow wiggle, I assume you don’t mean sex?”</i>");
		output("\n\n<i>“The night’s still young–wait, I have a tell?”</i>");
		output("\n\nShekka snorts and brushes her quills to fluffy softness, inviting you to lead on.");
		output("\n\nConsidering you’re on Tavros, it only makes sense to get some time away from the ship. You are a little bit tall to be arm-in-arm, but you offer a hand which she takes with a smirk. <i>“So, where to?”</i> Shekka asks, eyes tracing over a few ships. There’s a recognizable twitch in her grip, and you have to guide her past before she gets in trouble tinkering.");
		processTime(2);
		clearMenu();
	}


output("\n\nNot on Tavros");
output("\n\nYou basically have to peel Shekka away from her impromptu work-desk, lifting her up and onto your {broad, huggable/firm, muscular} side before propping her up with a hand. <i>“I resent being carried around like a hatchling, [pc.name].”</i>");

output("\n\n<i>“And yet you look so comfy and cute”</i> you tease, putting her down. <i>“Time to take a break, come hang out for a bit”</i>.");

output("\n\nAlthough Shekka whines in complaint, she allows herself to be dragged away.");

output("\n\nOption One");

output("\n\nShekka seems immediately disappointed when the first thing you do is drop length-wise onto your old sofa to switch on the Holonet. <i>“...You’re kidding, right? You dragged me away for this?”</i>");

output("\n\nWith a sigh, you drag her onto you, get comfortable and instruct her to watch. There is a little more grumbling before you have her head {cushioned between your breasts/laid up on your chest}. <i>“What are we even watching, [pc.name]?”</i>");

output("\n\nYou shrug; it’s never really about what’s on, just that you’re comfortable while your brain spends some time being occupied. It appears to be some show called ‘How They Do It’. Shekka squints as the seemingly over-elaborate process of constructing artisan dildos plays out. <i>“This is all by hand? I don’t... I mean, a machine could handle it.”</i>");

output("\n\nSmirking, you shake your head. <i>“It’s all about putting the proper care and affection in. Knowing that whoever’s enabling your good time pushed out all the shleem by hand, and shaved away the plubus and grumbo with manual tools.”</i>");

output("\n\nShekka sighs, nuzzling into your chest for a moment before returning her attention to the screen. <i>“The narrator has a soothing voice at least. I swear half of those words are made up, but it makes sense when he says it.”</i>");

output("\n\n<i>“I wonder if they re-use the thleeb juice for anything else?”</i> you wonder, as a particularly curvaceous gryvain woman lovingly shines the titanic tool down.");

output("\n\n<i>“Looking at her, I could think of a few extra uses for it...”</i> the little Rask giggles, squeaking when you give the base of her tail a little squeeze.");

output("\n\nEventually the channels transition to adverts that seem just as eclectic as the television itself.");

output("\n\n//Time transitions three hours");
output("\n\n//Next: back to ship menu");


output("\n\nOption Two");

output("\n\n	There isn’t anywhere in particular to go on the ship to take Shekka away from her work, but you have a pretty good idea of what to do. The little Rask smirks and raises a brow as you take her to the bedroom, and begin to undress...");

output("\n\nOnly to blink in confusion when you carry her into bed under the covers, put on some relaxing music, and go to sleep with a faceful of giant jingly ears. <i>“...Uh... [pc.name]?”</i> she asks, only to get no answer from you but an affirmative squeeze around the hips. <i>“You pulled me away from working for this?”</i>");

output("\n\nYou just nod into her pink-quilled hair, letting out a soothing sigh. Shekka’s complaints gradually die down when you take one of her ears in your {hand/paw}, rubbing and squeezing her. It isn’t enough to actually get the poor red-scaled cutie worked up, but it does quiet her down.");

output("\n\nShe actually manages to drop off before you do, although your own lids sink closed soon enough. It isn’t until a few hours pass that the music you left playing changes into a soft alarm. From experience you remember that ignoring this alarm will result in Ausaril Death Metal being played loudly, a warning you pass on to Shekka when she grumbles complaints.");

output("\n\n<i>“Hey, maybe I find metal roars to be relaxing”</i> she grunts, trying to get un-entwined from your nude form. You both manage to get redressed, just before the first thrumming drum-beats of Deth Gröwl kick to life. {Probably Anno’s fault}.");

output("\n\n<i>“It was a good nap, thank you for the company Shekka”</i> you say, putting on your most charming grin. Shekka blushes like a plum and waves it off.");

output("\n\n<i>“Yeah, yeah, it’s fine... I enjoyed it too. I now smell like you completely, which will make for distracting thoughts, but oh well. You’ll just have to swing by later and help me scratch that itch, no?”</i>");

output("\n\nAs if she could stop you.");

output("\n\n//Time transitions three hours");
output("\n\n//Next: back to ship menu");





//Option One
public function shekkaTavrosHangoutOne():void
{
	clearOutput();
	showShekka();
	//9999 put in anons
	author("SomeKindofWizard");
	output("Of course, the best place to go before anywhere else is Anon’s bar!");
	output("\n\nYou quickly discover that Shekka can put down a surprisingly decent amount of alcohol. ");
	if(9999) output("More than you, actually");
	elee output("It’s nothing to your own expertly-trained liver, but impressive nonetheless");
	output(". By the time shots have started to be ordered your table has a good card game going. The pink-haired Rask took a few rounds to figure out what’s going on, but by round six the pot is practically cascading into her little arms. <i>“Read ‘em and weep, suckers!”</i>");
	output("\n\nOnce she has your hand back in hers (which she nuzzles into affectionately now) she hands you a credit chit. <i>“Here y’go... that wash fun, should cover the drink...”</i>");
	//Increase drunkenness by 2 if physique greater than 20, by 4 if less.
	
	processTime(60);
	pc.imbibeAlcohol(20);
	processTime(60);
	pc.imbibeAlcohol(20);
	processTime(60);
	pc.imbibeAlcohol(20);
	processTime(60);
	pc.imbibeAlcohol(20);
	processTime(60);
	pc.imbibeAlcohol(20);
	//Time passes by five hours, back to ship menu
	clearMenu();
	addButton(0,"Next",move,"SHIP INTERIOR");
}	

//Option Two
public function shekkaTavrosHangoutTwo():void
{
	clearOutput();
	showShekka();
	author("SomeKindofWizard");
	//9999 put in beth's
	output("Maybe it’s lacking in the romantic-hangout angle, but there’s a perfectly useable stripclub.");
	output("\n\nAlthough Shekka makes a face at your suggestion, she seems happy to be led along to Beth’s Busty Broads. Her hands squeeze at yours tighter at the sight of a towering, latex-coated Gryvain Futa. ");
	if(flags["MET_TERENSHA"] != undefined) output("Terensha; hard not to miss that girl...");
	else output("You’ll have to see her later...");
	output(" She gives you both a wink, and then walks right past... just in time for her nethers to give you a wink too, planted between two expansive asscheeks.");
	output("\n\n<i>“Okay [pc.name]... I think this place is pretty great.”</i>");
	output("\n\nThe two of you grab a spot at the back, and Shekka climbs into your lap");
	if(pc.hasCock())
	{
		output(", hotdogging your ");
		if(pc.isErect()) output("unrepentant");
		else output("burgeoning");
		output(" erection between her own cushiony backside");
	}
	else if(pc.hasVagina()) output(", grinding her tail between your thighs for a teasing rub against your [pc.pussy]");
	output(". A few drinks come, and the both of you while away a few hours admiring men and women of various kinds as they dance and strut...");
	output("\n\nEventually the teasing becomes too much, and after fingering Shekka through her suit until she cums for perhaps the third time, she practically races you back to your ship for a romp. The smell of sex, booze, and perfume clings to the both of you in a heady aroma, and her eyes are glazed over with need.");
	processTime(120);
	pc.lust(40);
	currentLocation = "SHIP INTERIOR";
	shekkaCrewSexMenu();
}

//Addiction
//This shows up as ??? and is greyed out unless you have addictive spit (such as red myr)
public function shekkaAddictionWheeee():void
{
	clearOutput();
	showShekka();
	author("SomeKindofWizard");
	//No More Aphrodisiac
	//Selecting this when you no longer have aphrodisiac saliva will result in the following
	if(pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED))
	{
		output("<i>“Hey, Shekka... about your, uh... addiction?”</i> you begin, looking the curvy girl up and down. Shekka blinks a few times, staring at your face.");
		output("\n\n<i>“...You don’t smell like it anymore. Oh. Oooh...”</i> she mutters, sniffing a few times.");
		output("\n\nIgnoring the fact that she can apparently pick up that scent on your lips, you squat down to get ");
		if(pc.tallness < 7*12) output("eye-to-eye");
		else output("closer to eye level");
		output(". <i>“Are you going to be okay?”</i> you ask.");

		output("\n\nShekka’s eyes skirt about the room, unconsciously twitching. She nervously scratches at her ear, before walking away <i>“Yeah, just... uh. Wait here a moment...”</i>");
		output("\n\nA few minutes pass, and Shekka returns, looking flushed. She rubs idly at a nipple hard enough to be seen through her suit. <i>“All good, I’m cured.”</i> she says with a confident smile.");
		output("\n\nThat easy?! You stare, aghast. ");
		if(curedReaha9999) output("Just thinking about how long it took for Reaha to recover makes this seem a little unlikely. ");
		output("Shekka shrugs helplessly <i>“I was addicted to you because it was fun. Fuck. Fuck it was so hot to crave you...”</i>");
		output("\n\n<i>“And you just had the cure around because you were enjoying it?”</i>");
		output("\n\nThe Raskvel smiles, taking another slow, deep breath. <i>“Yup, a different kind of addictive aphrodisiac, and a shit ton of caffeine. They’ll do battle in my brain or whatever for a while. Then I’m fine.");
		if(curedReaha9999) output(" It’s not like Reaha’s case, that girl spent fuck knows how long on synthetic lust drugs.");
		output("”</i>");
		output("\n\nWell... if she’s sure.");
		processTime(20);
		//Next: Back to ship menu
		clearMenu();
		addButton(0,"Next",mainGameMenu);
		//Greys out box until she’s addicted again, hovering over this says <i>“You’ve already spoken to Shekka about her addiction”</i>
	}
	//Shekka is Addicted
	//Selecting this when you have had sex with her at least once when you have aphrodisiac saliva gives this.
	else if(9999)
	{
		output("You bite the bullet and ask her outright; <i>“Shekka, are you addicted to me?”</i>");
		output("\n\nThe Rask in question gives the question maybe a half-heartbeat of thought before nodding. <i>“One hundred percent, [pc.name]. And before you say anything else? It is fucking <i>awesome</i>.”</i>");
		output("\n\nOkay. Not the response you were anticipating.");
		output("\n\n<i>“Like, think about it. I crave you, in a way that temporarily completes me. Sure, sometimes the addict-brain thing kicks in and I start to get a bit shaky without a hit... the tradeoff is an incredible orgasm all lip-to-lip.”</i>");
		output("\n\nJust thinking about it seems to have Shekka all juicy, judging by the way she squirms on the spot, pupils dilating. <i>“Look, [pc.name]. You don’t have to worry about me. The stuff you pump out is pretty damn clean chemically speaking. If you ever replace it, I should be able to drop the habit nooooo problem.”</i>");
		output("\n\nWell, if she’s sure...");
		//9999 back to  talk
		processTime(8);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
}

//Going back to Shekka's talk menu
output("\n\n<i>“What else did you want to talk about, [pc.name]?”</i>");

//Body
//Wherein we get Shekka to bolt on some of that sweet-sweet futa-donger.
public function talkToShekkaAboutBody():void
{
	clearOutput();
	showShekka();
	author("SomeKindofWizard");
	output("There is no doubt about it. When it comes to women, the whole deal is immediately altered by a liberal application of dicks. It’s not a conversation you’ve ever breached with Shekka before, and when you do so, she squints at you.");
	output("\n\n<i>“Really? I, uh... I don’t know, Steele. I guess I never really put my thought into it. I’ve got this hips, these thighs, this ass...”</i> she gives her ass a spank for good measure, cooing as it sets the tender flesh to quivering. <i>“Do you think I need more?”</i>");
	output("\n\nShekka sighs and shrugs, looking you up and down as if she could gauge a proper response. You give the matter some thought as well, does she?");
	//Two Buttons: Get a dick and Stay girl
	processTime(3);
	//9999
}

//Get a dick
public function giveShekkaFollowerADick():void
{
	clearOutput();
	showShekka();
	author("SomeKindofWizard");
	output("<i>“Honestly...”</i> you begin, a wicked grin creeping across your [pc.face]. <i>“I’ve gotta say, it would be pretty hot...”</i>");
	output("\n\n<i>“Well, I mean... I get to pick what <i>kind<i> of cock, right?”</i> she answers, rubbing her chin idly. <i>“I want horse cock.”</i>");
	//Pc has a horse cock:
	if(pc.hasCock(GLOBAL.TYPE_EQUINE)) output("\n\n<i>“Well, you only had to ask.”</i> you say, smirking and patting your crotch. Shekka snorts in amusement, shaking her head hard enough to set her long ears to jingle-jangling.");
	//Else 
	else if(pc.hasCock()) output("\n\nYou look down at your own [pc.cock], frowning and shifting side-to-side. Shekka follows your gaze, quirking a brow.");
	else output("\n\nYou look down at your own bare crotch, frowning and shifting side-to-side. Shekka follows your gaze, quirking a brow.");
	//Merge
	output("\n\n<i>“Not what I meant. I mean, if I go full futa, I want a big ol’ swingy horse cock. With those juicy flares! You know... a proper cum-cannon on my short frame. Hot, right?”</i>");
	output("\n\nIt’s not the first time you’ve seen such a thing. Sounds good at the very least; Shekka certainly has the bottom-half necessary to support a big ");
	if(silly) output("ol’ floppy horsey-donger.");
	else output("equine member.");
	processTime(5);
	//9999
	//Three Options: Not Yet, SynthSheath and Throbb
}

//SynthSheath
public function synthsheathShekka():void
{
	clearOutput();
	showShekka();
	author("SomeKindofWizard");
	output("You haul out a big floppy equine phallus, complete with balls. The small Rask’s eyes are drawn to the way it sways from side-to-side.");
	output("\n\n<i>“Is that what I think it is, [pc.name]?”</i>");
	output("\n\n<i>“Yup”</i> you answer simply, hefting the weight of it in your hands, before holding it out to her, base-first.");
	output("\n\nShekka accepts its, looking the whole thing over as though it might bite. <i>“This looks more like a fuck-sleeve, Steele. Are you sure?”</i> She lifts the slit built into the SynthSheath’s flat base, giving it an idle sniff. <i>“Smells clean. And kinda... surgical-y? Makes sense I suppose. It hasn’t been hooked on to someone; no way to produce musk.”</i>");
	output("\n\nYou hadn’t been anticipating the scientific analysis of the horse-cock, but it’s rather adorable watching her examine the whole thing so closely. It comes as a surprise when she–without ceremony–plants it on her crotch, right above one of her twinned pleasure-buttons.");
	output("\n\nAfter glancing around for somewhere out of the way, you settle for leaning up against the wall, enjoying your front-row seat to this transformation. The first thing to change are the eyes... perhaps that’s a silly thing to notice, but her pupils turn saucer-like as her brain begins pumping hot feel-good throughout her system. She lets out a low moan, dropping to her knees. Although her hands don’t leave the base of what is soon to be her brand-new horse-cock.");
	output("\n\nThe short-stack’s tail lashes about wildly as her grip tightens on the expansive equine prick; all at once the veins on it seem to come to life. She takes her hands away from it in surprise, and the member doesn’t fall away from her crotch. Indeed there’s no evidence of a seam at all. The prick shifts to the natural red of her flesh as it becomes one with her crotch. <i>“O-okay [pc.name]. This. Hohfuck–”</i>");
	output("\n\nWords fail Shekka as pre begins to bead at the head of her broad cumslit. Her mouth hangs open, tongue practically unfurling in time with a low, horny moan. The previously false-looking balls tense up and churn with freshly-forming seed. <i>“Well, there’s the musk...”</i> you add, as the sexual bouquet of horny raskvel mixes with Shekka’s brand new cock. Her hands explore the length of it, fingers hefting the weight of her balls as they continue to firm up.");
	output("\n\n<i>“S-steele... oh stars. The prostate is forming somewhere in here, I can feel it. It’s like someone’s crammed a fucking cum-button somewhere in there.”</i> Shekka gasps, flopping onto her front and pinning the still pre-oozing prick between her body and the cool metal floor of the spaceship. <i>“H-help me out, [pc.name]! I’m going to fucking burst!”</i>");
	processTime(20);
	pc.lust(10);
	//Next: Sex scene
	//9999
}

//Throbb
public function throbbUpShekka():void
{
	clearOutput();
	showShekka();
	author("SomeKindofWizard");
	output("Well, it isn’t a horse-cock, but when it comes to dick-fixing juices, you have the hookup to hand...");
	output("\n\nShekka eyes the syringe with trepidation as you hand it to her, and she spends a few additional moments scrolling over the label. <i>“Okay, I’ll use it, because I am curious as hell. But we’re taking a trip to the station so I can grab something with a little giddy-up, okay?”</i> There’s a glimmer in her eyes at the terrible joke, but you let the moment pass without comment. <i>“...Hmph.”</i> she pouts, popping the cap off of the syringe.");
	output("\n\nShe sinks it into her thigh without a moment’s hesitation, depressing the plunger while she nibbles on her bottom lip. <i>“Huh, I didn’t even feel the needle go in. How promising that the anaesthetic on this black-market cock-sauce is actually decent quali... qual... oh my.”</i>");
	output("\n\nThe words seem to drift away from her in time with the chemical load that pounds its way furiously into her system, rewriting and reforming flesh.");
	output("\n\nYou can see in real-time how her red skin grows more flushed, and her body starts to glisten with sweat as it tries to compensate for the abrupt shift in her hormones.");
	//Started female, have a dick:
	if(9999) output(" You recognize it well; when your own abrupt growth occurred it felt like every inch of your brain was torn between cumming on the spot, and finding somewhere to hide yourself.");
	output(" The raskvel woman squirms on the spot, trying to figure out what to do with herself. Her tail begins buzzing away in response to the way her body slips into lusty-fucking overdrive.");
	output("\n\n<i>“Ah fuck, it’s happening. I can feel it!”</i> No kidding; you can see how her hips roll on the spot as though she were treating you to a pole dance... except that she was about to bring the pole herself. Her clit begins to swell; that’s the first evidence at least. A new one seems intent on growing beneath, but her body takes its own shortcuts. Part of the show isn’t particularly attractive. For instance watching a cumslit grow in real-time is more than a little discomforting.");
	output("\n\nThe way pre builds at the head of a freshly growing cock, or the sight of twinned thick balls dropping into place however? That’s a particularly fine point of the show, especially when the slickness of her own cunt polishes the brand-new balls to an alluring shininess. The subtle scent of her feminine nectar becomes the mixed-musk of a futa-girl. Each of the shortstack’s heartbeats bring additional length to her cock, until it stands almost painfully hard and pointed directly at you.");
	output("\n\n<i>“Is that it? We definitely need to make this fucker into a hor-... horse–”</i> Shekka’s breath hitches up. Her balls tense up, clenching towards her brand-new dick. Her unseen prostate churns over with fresh, unknown pressure. And then she cums like a fountain, immediately painting your [pc.tummy] with pearlescent jizz. Your companion tries her best to apologize, or speak, or anything at all, but her eyes cross and yet more cum is produced.");
	output("\n\nIt would have been worth keeping a timer going because the poor little thing seems to orgasm for a painfully long time, making a mess of both yourself and the floor.");
	if(celiseIsCrew()) output(".. if Celise is around, you’re sure she’d appreciate it.");
	output(" She takes a few long, deep breaths, clutching at her modest chest and squeezing her nipples between her fingers. <i>“Okay... that was awesome.");
	if(pc.hasCock()) output(" I can see why you seem to enjoy filling me up so much.");
	output(" The moment we turn this thing into a foot of stallion schlong, I’m going to turn the walls white.”</i>");
	pc.destroyItemByClass(Throbb);
	processTime(20);
	pc.lust(10);
	clearMenu();
	addButton(0,"Next",approachCrewShekka,true);
}

/*Shekka Share Bed
public function shareShekkasBed():void
{
	output("\n\nSleeping without Shekka");
output("\n\n	You’re partway to pulling off your [pc.clothes] when there’s a gentle tap on your leg. <i>“Hey, [pc.name]. Can’t help but notice that your bed is looking awfully not-full-of-Raskvel. Fancy changing that?”</i>");

output("\n\nYou peek down at her, raising a brow slowly. That was a rather cheesy line. Shekka grins bashfully, grinding her foot into the floor. <i>“I’m not hearing a no! Well, not yet at least”</i>");

output("\n\n//Yes:");
output("\n\n	Too cute. You don’t so much as take her to bed as you do throw her into it, dropping ontop of her and nibbling at one particularly large ear, nuzzling until she squirms. <i>“Oooh fuck! Want~!”</i>");
output("\n\n//Sex Options:");

output("\n\n//No:");
output("\n\n	<i>“D’awwh. Well, give me a squeeze if you’d ever fancy it. I’m going to go crash as well.”</i> Shekka smiles warmly and gives you a little hip-wiggle for show. The little devil...");
output("\n\n//Next: Sleep as usual, +5 lust");



output("\n\nSleeping without Shekka and with Anno");
output("\n\n	You’re partway to pulling off your [pc.clothes] when there’s a gentle tap on your leg. <i>“Hey, [pc.name]. Can’t help but notice that your bed is looking awfully not-full-of-Raskvel. Fancy changing that?”</i>");

output("\n\nBefore you get a chance to respond, Anno saunters out of your shower in all of her squishy, nude glory. <i>“Hrmn... you’re not trying to steal my sweet-dreamie-snuggles, are you~?”</i> a couple of hops (giving you a delightfully bouncy show) over has her leaning over your shoulder. Her tits press against your back, {//wings//pushing your wings out to the side///nowings//teasing you with a little wriggle}.");

output("\n\nShekka scowls, brow furrowing cutely. <i>“It’s not stealing if {he/she} isn’t yours to own. And don’t you already have girlfriends? I’m all on my lonesome here.”</i>");

output("\n\nTo her credit, the puppy-slut doesn’t immediately bury her foot in her mouth, pausing for a few breaths before doing so. <i>“You don’t have any girlfriends or boyfriends? Why not?”</i>");

output("\n\nWishing you could pick her up by the scruff, you settle for reaching backwards over your shoulder to bap her on the nose, earning a little yelp of surprise. Shekka watches, snorting in amusement before continuing. <i>“No, Anno. I don’t. To be honest? It takes a little extra work for me to get in the mood. Really only [pc.name] seems to... y’know... <i>do<i> it for me.”</i>");

output("\n\nAnno gasps, before a smug grin creeps across her face. <i>“you loooove {hiiiim/heeeer}~”</i>");

output("\n\n<i>“Shut up you bimbo!”</i> she shouts, cheeks beginning to purple. You silence them both before one of them gets teased a little too far.");

output("\n\n//Both of you");
output("\n\n	The obvious answer here is to just take the both of these fine women to bed, and you tell them as much. It takes a few moments for confusion to change into something wholly more curious, and Shekka is the first to speak up. <i>“I... I’unno. I was prepared for one bedbuddy.”</i>");

output("\n\nDespite the nervousness of the shortstack’s voice, Anno leans in, tail wagging. <i>“Awww, can’t handle all this fluffy softness? These sweet sweet chest-pillows?”</i> responds the white-fluffed Ausar with an eye-capturing bounce of said chest-pillows. Trust her to dispel the tension with her ‘assets’. She squeals and giggles when you push her onto the bed, before rolling onto her back to give both you and Shekka her very best bedroom-eyes, trailing one fluffy limb down her front to her fragrant gulf.");

output("\n\nYour hands help slip Shekka out of her tight-fitting suit, freeing her to the open air of your ship. Despite a few of her motions lacking surity, Anno practically helps you pull your new lover into the bed before you climb in after them.");
output("\n\n//Sex");
output("\n\n	");
output("\n\n//Sleep now");
output("\n\n	Grasping groping hands lay into you, but with a grumble you bat them away, earning a duo of half-worded complaints. Eventually they settle in properly though, and your bed somehow manages to accommodate you all. You rest your head on Anno’s chest, listening to her heartbeat, even while Shekka wraps herself around your lower-half, using you like an oversized pillow.");

output("\n\n//Next: sleep as normal, next day");

output("\n\n//Anno");
output("\n\n	You run your fingers through your [pc.hair], looking over the two of them and trying to keep your expression plain. It may seem unfair, but Anno was here first. It’s not right to supplant her just because of that.");

output("\n\nShekka lets out a deep-seated sigh and nods bashfully. <i>“You’re right, you’re right. Sorry for losing my temper.”</i> she directs the second part of her apology at Anno, who appears just as embarrassed to have started up an argument. You give them both head-ruffle, and Shekka slips out again, starting to unzip her suit.");

output("\n\nNot wanting to hear anything from Anno, you give her a nudge towards the bed, earning a surprised yelp before tossing the covers over the both of you.");
output("\n\n//Next: sleep as normal, next day");
output("\n\n//Shekka");
output("\n\n	It is true that Anno doesn’t particularly have any issues with finding companions... whereas if Shekka is struggling...");

output("\n\nIt takes a valiant force of will not to look at the puppy-dog-eyes Anno is beaming your way. Judging by the look on Shekka’s face, she wasn’t prepared for that particular trap. A gentle boop on Anno’s nose breaks the spell, and she lets out a soft whine before giving up. <i>“Okay, okay... I understand. If you change your mind, you know where to find me.”</i>");

output("\n\nThe snowy-furred Ausar gives you a peck on the cheek, plucks up her towel and clothing, and slips out of the room, giving you both a hip-swaying show as she goes. Your red-scaled shortstack looks up, appearing guilty as all hell. <i>“Crap... I’m sorry...”</i>");

output("\n\nPutting your hands up in mock surrender, you announce there’s nothing you hate more than drama. It takes a few more babbled apologies, but eventually Shekka gives up and agrees, scrambling into your bed. <i>“Well then Captain, if that’s the case... think you could help me out of my suit?”</i> she licks her lips, waving her egg-layer-hips in your face enticingly.");

output("\n\nAs if anyone could stop you.");
output("\n\n//Next: sleep as normal, next day");

output("\n\nAsking Anno");
output("\n\n//If you’re sharing with Shekka and ask Anno to join you in bed, you can ask just her, or invite her to join you and Shekka. Asking her works as normal, following text is for inviting her to join you.");
output("\n\n	<i>“What’s that Boss? You want me and scalebutt to make you into a little Steele Sandwich?”</i> Anno appears pensive, resting a finger demurely on her chin. The wagging of her tail can’t lie however.");

output("\n\n<i>“Hey Shekka!”</i> she abruptly calls, nearly spooking you out of your {skin/fur/scales}. <i>“Make some space in that bed! We’re going to squish up like a naughty little fuckpuddle tonight!”</i>");
output("\n\n//Next: conversation closes, sleeping is set as having Anno and Shekka shared");
output("\n\nWaking: Sharing Shekka");
output("\n\n//Randomized chance of each scene occurring, Aphrodisiac scenes first; these are triggered by having the aphrodisiac tag on your tongue");
output("\n\n//Aphrodisiac");

output("\n\n//1");
output("\n\n	Needy fingers digging into your chest are the first thing to wake you up... followed very swiftly by a boiling-hot cunt pressing its flushed lips against {the shaft of your [pc.cock]/your leg}, grinding slowly up and down. <i>“Fuck... I can’t help it... sorry for waking you up, [pc.name]... I– I just need this, I need this right now!”</i>");

output("\n\nThere’s a surprising amount of strength in her grip as her body works and grinds, mouth wide open. <i>“I need you, your saliva, your touch! I woke up and it’s all I could think about! I need you to treat me like a wanton whore!”</i> Realizing her body is jonesing for a hit of your aphrodisiac-laden spit, you haul her up to your mouth, capturing her lips in yours. Her exultant moans drift into horny, lust-drunk whimpers as the chemical load dumps itself into her brain.");

output("\n\nShe squirts onto your abdomen, sent immediately crashing into a surprise orgasm. For her own safety you end the kiss, nuzzling her as she quakes and twitches on you. <i>“Thanksh”</i> she mumbles drunkenly, even as her fingers plumb at her own now-puffy labia.");
output("\n\n//Next: Lust +25");

output("\n\n//2");
output("\n\n	As sleep finally scatters into wakefulness, you become aware of a great warmth, naked flesh, and smooth scales pressing down on your body. Your eyes peel open, seeing Shekka looking up at you hungrily {from between your massive breasts/with her chin perched on your pecs}. Her lids slowly open and close, and her hips raise up, wiggling like a predator about to pounce.");

output("\n\nYou get perhaps halfway into a ‘Good Morning’ before she pounces, diving in for a hungry kiss. She has the dilated pupils of an addict, and the moment her tongue meets your it hits her like a shock of electricity. Shekka trembles atop you, whimpering into your mouth as she gets her fix, practically gushing from her now-flushed quim. Your hands instinctively grasp at her cushiony rear, giving her a slow squeeze until she stops moaning through your lips and comes up for air.");

output("\n\n<i>“Ffffuck... [pc.name], I held out for as long as I could, I seriously needed my fix....”</i>");

output("\n\nShe rolls off of you, idly stroking herself. <i>“Better than morning coffee...”</i>");
output("\n\n//Next: day as normal, lust +20");

output("\n\n//Normal");

output("\n\n//1");
output("\n\n	A soft, trilling breathing tickles at one of your [pc.ears]. It’s a very much alien sound, as though it were a hint away from a sibilant hiss, or trickling birdsong. Peeking over your shoulder reveals an innocently sleeping face, and the need to climb out of bed and get on with your day has to pose a quick war with comfort.");

output("\n\nYou reach around your back, planting your hands on warm, naked ass-cheeks. Although Shekka’s eyes stay closed, her breathing shifts. She’s probably awake now. Not that it stops you from continuing, massaging her expansive rear and rubbing the very base of her tail until the horny Rask struggles to fight down delighted little ‘coo-ing’ sounds. She finally fives up, nibbling your shoulder and moaning sweetly. <i>“A girl could get used to a little hands-on wakeup like that.”</i>");

output("\n\nShekka gives you a quick spank, disentangling from your body and letting you up.");
output("\n\n//Next; ship menu as usual");

output("\n\n//2");
output("\n\n	Your dreams are interrupted by an all-encompasing sensation of warmth at your core, of dainty little fingers squeezing at your thighs. Opening your eyes to a brand new day feels a little bit too challenging, but you do so anyway at the rather insistent need to cum. Unknown waves of orgasm are apparently cresting the shores of your resolve, and a peek beneath the bedsheets reveals the culprit; Shekka.");

output("\n\nHer ears are laid out across your legs, ass up in the air as the nude creature lovingly licks and kisses at {your thoroughly-soaked slit/engorging knot/turgid shaft}. The very first question on your lips is how long she’s been at it, but the breath is practically stolen from you after one exceptionally adoring kiss. Apparently it must have been a while since you’re immediately sent crashing into orgasm, {painting your own chest in [pc.cum]/coating her face in [pc.girlcum]}.");

output("\n\nShekka licks her lips, ensuring the rest of your morning is taken up by her dutiful cum-cleaning tongue, before you’re given a nuzzle. <i>“Good morning, [pc.name]!”</i>");
output("\n\n//Next; ship menu as normal");
output("\n\nWaking: Sharing Shekka/Anno");
output("\n\n//Probably just 50/50 a Shekka or Anno scene");*/