//Mostly written by SomeKindofWizard

public function shekkaIsCrew():Boolean
{
	return (flags["SHEKKA_ONBOARD"] != undefined);
}
public function shekkaRecruited():Boolean
{
	return (flags["SHEKKA_RECRUITED"] == 1);
}
public function shekkaAddicted():Boolean
{
	return false;
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
		output("Shekka’s still there, cute as ever. Did you need anything else from her?");
	}
	else
	{
		output("Although it seems that Shekka doesn’t notice you on her approach, one of those floor-touching ears is flipped back, and her tail squirms nervously from side-to-side. She does a good job of looking busy... or maybe she actually <i>is</i> busy, thinking about it. She’s done a good job of converting your engine-room to an impromptu workshop. Although having a chest of tools has made a warm room even warmer, the body-suited Rask seems to be coping just fine.");
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
	addButton(2,"Spend Time",spendTimeWithShekka,undefined,"Spend Time","Spend some leisure time with your rasky crewmember.");
	if(pc.lust() >= 33) addButton(3,"Sex",shekkaCrewSexApproach);
	else addDisabledButton(3,"Sex","Sex","You aren’t quite in the mood for that.");
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
	addButton(14,"Back",crew);
}

//Appearance
public function crewShekkaAppearance():void
{
	clearOutput();
	showShekka();
	author("SomeKindofWizard or Fenoxo");
	output("You take your time to admire Shekka’s figure, and she strikes a little pose for you, fanning herself. It seems moving from her previous wasteland to your ship has done wonders for her diet. Or more correctly... probably added a little to her cup-size.");
	output("\n\nShe hasn’t seen fit to change out of her usual hex-patterned, Aegis-shipyards jumpsuit either. It clings to her body like an erotic second skin. Her nipples poke accusingly out as though shrinkwrapped, and the plump lips of her pussy seem almost engorged by the tight layer of nano-weave fabric. The rest of her body is much as it has always been; the broad, egg-laying hips of a Raskvel put the span of her shoulders to shame.");
	//if futa
	if(shekka.hasCock()) 
	{
		output("\n\nNot including, of course, her more recent addition of a turgid, bitch-breaking ");
		if(!shekka.hasCock(GLOBAL.TYPE_EQUINE)) output("throbb-knob");
		else output("horsecock");
		output(" as it struggles not to break out of her clothing.");
	}
	output("\n\nThe feathers that makes for her species’ hair is still dyed the adorable bubblegum-pink, flaring exotically at the top whilst hanging down to her back. The red-scaled alien’s ears don’t so much as emerge from her plumage as it does drape down her sides. Thick golden rings and studs jingle and jangle from them with every errant head-moving, ensuring she can never sneak anywhere. Her face is adorable and youthful, with a button nose, soft lips, and big, slitted eyes.");
	if(flags["SHEKKA_SPITDICTED"] == 1) output(".. although, those slit pupils are currently dilated as far as they can go, tracing the movement of your mouth with ill-disguised need.");
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
	clearMenu();
	addButton(14,"Back",approachCrewShekka,true)
	addButton(0,"Places",talkToShekkaAboutPlaces,undefined,"Places","Talk to Shekka about some of the places you’ve been.");
	addButton(1,"People",talkToShekkaAboutPeople,undefined,"People","Talk to Shekka about some of the people you know.");
	if(pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED) || flags["SHEKKA_SPITDICTED"] != undefined) addButton(3,"Addiction",shekkaAddictionWheeee);
	else addDisabledButton(3,"???","???","You need aphrodisiac spit for this...");
	if(flags["SHEKKA_SLEEPWITH_INTRODUCED"] != undefined) addButton(4,"Sleep With",shekkaRepeatBedTalkies);
	else addDisabledButton(4,"Sleep With","Sleep With","Once Shekka has suggested sharing the bed, she’ll be more amenable to this in the future.");
	if(!shekka.hasCock()) addButton(5,"Get A Dick",talkToShekkaAboutGettingADick,undefined,"Get A Dick","It’s always better to have a little extra.");
	else addDisabledButton(5,"Get A Dick","Get A Dick","Shekka already has a dick!");
}

//Places
public function talkToShekkaAboutPlaces():void
{
	clearOutput();
	showShekka();
	output("Which place will you discuss?");
	clearMenu();
	addButton(14,"Back",talkToCrewShekka);
	if(flags["SHEKKA_BEEN_TAVROS"] != undefined) addButton(0,"Tavros",shekkaTalksAboutTavros);
	else addDisabledButton(0,"Tavros","Tavros","Shekka hasn’t been there yet!");
	addButton(1,"Tarkus",talkToCrewShekkaAboutTarkus);
	if(flags["LANDED_ON_TEXAS"] == undefined) addDisabledButton(2,"???","???","You haven’t been to this location yet!");
	else if(flags["SHEKKA_BEEN_NT"] != undefined) addButton(2,"New Texas",talkToShekkaAboutNewTexas);
	else addDisabledButton(2,"New Texas","New Texas","Shekka hasn’t been there yet!");
	if(flags["VISITED_MYRELLION"] == undefined) addDisabledButton(3,"???","???","You haven’t been to this location yet!");
	else if(flags["SHEKKA_BEEN_MYRELLION"] != undefined) addButton(3,"Myrellion",shekkaMyrellionTalk);
	else addDisabledButton(3,"Myrellion","Myrellion","Shekka hasn’t been there yet!");
	if(flags["VISITED_UVETO"] == undefined) addDisabledButton(4,"???","???","You haven’t been to this location yet!");
	else if(flags["SHEKKA_BEEN_UVETO"] != undefined) addButton(4,"Uveto",shekkaUvetoTalk);
	else addDisabledButton(4,"Uveto","Uveto","Shekka hasn’t been there yet!");
}
//Tarkus
public function talkToCrewShekkaAboutTarkus():void
{
	clearOutput();
	showShekka();
	author("SomeKindofWizard");
	output("<i>“Soooo...”</i> you begin, wondering where to start with such a question. <i>“What do you think about Tarkus these days?”</i>");

	output("\n\nShekka squints, rubbing one of her ears. <i>“Tarkus itself? I mean, it’s highly likely in my lifetime I get to see it become a place worth living in. More than just a shitty little scrapyard pretending to be more. Right now though? Still dangerous, and unhealthy.”</i>");

	output("\n\nShe sighs and gives the matter a little more thought. <i>“I mean, I know you aren’t asking me for the tourist-planner description, after all you have been through, I should be going to </i>you<i> for advice on traversing the wastes out there.”</i>");

	//Annoquest done, goos saved//
	if(flags["ANNO_MISSION_OFFER"] == 3 && flags["DECK13_GRAY_PRIME_DECISION"] != 3)
	{
		output("\n\n<i>“There are less of those Goos than before, and the ones still out there are occasionally being given... uh, memory chits I think? I know that the Galotian queen wanted to try and lend a hand with their being-recognized as a race. Sounds neat to me! ");
		//gave bodies//
		if(flags["DECK13_GRAY_PRIME_DECISION"] == 1) output("Especially since their Captain’s doing well, she’s able to turn some heads... what with being a technically-ancient, mortal-turned-immortal sentient. ");
		//Goo bodies//
		if(flags["DECK13_GRAY_PRIME_DECISION"] == 2) output("There </i>is<i> a little issue with the fact that the queen is more than a little horrified that an entire ship’s worth emergent, innocent intelligences got wiped out and replaced by functionally dead people.");
		output("”</i>");
	}
	//Cont here
	output("\n\nYou wave her on to continue. <i>“Yeah, yeah. Okay, well. Sidians are still jerks. That’s probably racist, but still. They’re all sorta... dying out. If I’m honest there’s only one thing that’s truly bothering me, and it’s those fucking Goblins.”</i>");
	output("\n\nWow, racist, you remark, and she furrows her brows. <i>“You’re right, you’re right. They’re probably not all bad. But except for that crazy dude who sold weird condoms or whatever they were, they take advantage of my people in order to get us to mine resources for them. Or, y’know. Outright slavery.”</i> she cracks her knuckles slowly.");
	output("\n\n<i>“I’ve seen the syllabus for the new Rasks though. Unlike most of my people, I plan. I’m a planner. And hopefully all the new kids will turn out to be planners too. Happy, healthy planners... who won’t take any of their shit.”</i>");
	output("\n\nIt’s the first time you’ve ever seen her properly express her distaste about someone. It’s kind of scary.");
	//Domme//
	//?if() output("The urge to break her in has your fingers twitching///subby//Mnf.}");
	output("\n\nShekka takes a deep breath after that, fondly stroking a spanner. <i>“Well, with that little unpleasantness covered. Anything else, [pc.name]?”</i>");
	//Next: back to Places menu
	processTime(30);
	clearMenu();
	addButton(0,"Next",talkToShekkaAboutPlaces);
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
	clearMenu();
	addButton(0,"Next",talkToShekkaAboutPlaces);
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
	output("\n\n<i>“Don’t get me wrong, the sex part of the whole planet is great. The attractions are great, and the attractions are attractive.”</i> Shekka pauses to enjoy her silly word-play, nodding to herself. <i>“It’s the circumstance though. What they’ve done to their people is literally the opposite of what I did to mine. I can’t express how fucking terrifying that is. They </i>want<i> to be idiots, incapable of thinking about nothing but sex so that they can’t cause trouble. Sure, their planet is idyllic, but they had the luck to start off human. The only people who can take advantage of </i>them<i> are their own.”</i>");
	//Treated
	if(pc.isTreated()) output("\n\nThe Raskvel pauses, looking you up and down a few times. <i>“You know I don’t mean to offend you too, right? You stand out as a prime example of someone who can still get things done even with a terrible case of cockbrain. But I’m going to assume you didn’t start your life like that. Right?”</i> You nod; that’s right.");
	//Cont
	output("\n\n<i>“Also? Calling it ‘The Treatment’ just makes it kind of scary, as if you weren’t a citizen until you got your brain all jacked up... Which, again, I recognize the hypocrisy of that statement coming from me. I’ve literally done the same. You can see why I don’t like this place. The other side of the coin is a shitty place to be when you realize it’s probably just as shineless as the other.”</i>");
	output("\n\nShe sighs and crosses her arms, glancing away.");
	//Next: back to Places menu
	processTime(10);
	clearMenu();
	addButton(0,"Next",talkToShekkaAboutPlaces);
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
	else output("\n\n<i>“Hmmn... there is something appealing about those hard-body Reds. All that order they preach about makes them almost like machines, ya know? And that’s sort of exciting to me, like if I studied them long enough, I could puzzle out a way to squeeze a little bit of extra efficiency out of their society. They’re less like jerks than I expected, too. I even saw a few smile!”</i>");
	//Merge
	output("\n\n<i>“The golds are a hot sticky mess. I mean their boobs are freaking ginormous, but that hasn’t really done them any favors... and the way they breed is just so... </i>alien<i>. Everybody should get to lay eggs, not just one, big egged-up slut! Queens aside, the golds I’ve met have been perfectly friendly. </i>More than friendly.<i> And while they’re real organized, sort of like the reds, they seem to be a lot less strict about it. I like that. Appeals to my inner chaos-lizard, ya know?”</i>");
	output("\n\nFair enough.");
	//Next: back to Places menu
	//Make shekka not hate golds fen. SkoW is crazy. - DONE!
	clearMenu();
	addButton(0,"Next",talkToShekkaAboutPlaces);
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
	addButton(0,"Next",talkToShekkaAboutPlaces);
}

//People
public function talkToShekkaAboutPeople():void
{
	clearOutput();
	showShekka();
	clearMenu();
	addButton(14,"Back",talkToCrewShekka);
	var button:Number = 0;
	if(annoIsCrew()) addButton(button++,"Anno",shekkaAnnoTalk);
	if(azraIsCrew()) addButton(button++,"Azra",shekkaAzraTalk);
	if(bessIsCrew()) addButton(button++,chars["BESS"].short,shekkaBessTalk);
	if(celiseIsCrew()) addButton(button++,"Celise",shekkaCeliseTalk);
	if (hasGooArmor() || gooArmorIsCrew()) addButton(button++,chars["GOO"].short,talkToShekkaAboutNova);
	if(reahaIsCrew()) addButton(button++,"Reaha",shekkaReahaTalk);
	if(yammiIsCrew()) addButton(button++,"Yammi",talkToShekkaAboutYammi);

	if(button != 0) output("Who would you like to talk to Shekka about?");
	else
	{
		output("There is nobody to talk to Shekka about right now.");
	}
}
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
	clearMenu();
	addButton(0,"Next",talkToShekkaAboutPeople);
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
	addButton(0,"Next",talkToShekkaAboutPeople);
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
	addButton(0,"Next",talkToShekkaAboutPeople);
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
	addButton(0,"Next",talkToShekkaAboutPeople);
}

//Nova
public function talkToShekkaAboutNova():void
{
	clearOutput();
	showShekka();
	author("SomeKindofWizard");
	//If wearing Nova
	if(pc.armor is GooArmor) 
	{
		output("<i>“Heeeey... I’m right here!”</i> your armor says, forming a face to look up at you with a pout. The little Raskvel flinches in surprise before struggling to fight down snorts and giggles.");
		output("\n\n<i>“Obviously I think she’s a sweetheart, [pc.name]”</i> she says after a pause, grinning when the weaponized grey-goo climbs off of you to give her a hug.");
	}
	//Else
	else output("<i>“If I’d been told one of those rapey little monsters could turn out to be a wearable, weaponized bimbo-armor, I would have said that was crazy. But no... She is a total sweetheart. Sadly a bit out of my technological expertise or I’d have a poke around inside of her.”</i>");
	//Next: back to People menu
	processTime(4);
	clearMenu();
	addButton(0,"Next",talkToShekkaAboutPeople);
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
	addButton(0,"Next",talkToShekkaAboutPeople);
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
	addButton(0,"Next",talkToShekkaAboutPeople);
}

//Spend time
//On Tavros Station
public function spendTimeWithShekka():void
{
	clearOutput();
	showShekka();
	//On Tavros
	if(getPlanetName().toLowerCase() == "tavros station")
	{
		output("You ask if Shekka would like to take a break from... whatever it is she’s doing and hang out with you for a while. <i>“Hmmm, you’re asking me without that mischievous eyebrow wiggle, I assume you don’t mean sex?”</i>");
		output("\n\n<i>“The night’s still young–wait, I have a tell?”</i>");
		output("\n\nShekka snorts and brushes her quills to fluffy softness, inviting you to lead on.");
		output("\n\nConsidering you’re on Tavros, it only makes sense to get some time away from the ship. You are a little bit tall to be arm-in-arm, but you offer a hand which she takes with a smirk. <i>“So, where to?”</i> Shekka asks, eyes tracing over a few ships. There’s a recognizable twitch in her grip, and you have to guide her past before she gets in trouble tinkering.");
		processTime(2);
		clearMenu();
		addButton(0,"Anon’s Bar",shekkaTavrosHangoutOne);
		addButton(1,"Beth’s Broads",shekkaTavrosHangoutTwo);
	}
	//Not on Tavros
	else
	{
		output("You basically have to peel Shekka away from her impromptu work-desk, lifting her up and onto your ");
		if(pc.thickness > 65) output("broad, huggable ");
		else if(pc.tone >= 66) output("firm, muscular ");
		output("side before propping her up with a hand. <i>“I resent being carried around like a hatchling, [pc.name].”</i>");

		output("\n\n<i>“And yet you look so comfy and cute”</i> you tease, putting her down. <i>“Time to take a break, come hang out for a bit”</i>.");
		output("\n\nAlthough Shekka whines in complaint, she allows herself to be dragged away.");
		processTime(3);
		clearMenu();
		addButton(0,"Couch & TV",shekkaSofaHangout);
		addButton(1,"Bed",shekkaHangoutBed);
	}
}

//Option One
public function shekkaSofaHangout():void
{
	clearOutput();
	showShekka();
	author("SomeKindofWizard");
	output("Shekka seems immediately disappointed when the first thing you do is drop length-wise onto your old sofa to switch on the Holonet. <i>“...You’re kidding, right? You dragged me away for this?”</i>");
	output("\n\nWith a sigh, you drag her onto you, get comfortable and instruct her to watch. There is a little more grumbling before you have her head ");
	if(pc.biggestTitSize() >= 1) output("cushioned between your breasts");
	else output("laid up on your chest");
	output(". <i>“What are we even watching, [pc.name]?”</i>");

	output("\n\nYou shrug; it’s never really about what’s on, just that you’re comfortable while your brain spends some time being occupied. It appears to be some show called ‘How They Do It’. Shekka squints as the seemingly over-elaborate process of constructing ");
	if(silly) output("plumbos");
	else output("artisanal dildos");
	output(" plays out. <i>“This is all by hand? I don’t... I mean, a machine could handle it.”</i>");
	//LOL
	output("\n\nSmirking, you shake your head. <i>“It’s all about putting the proper care and affection in. Knowing that whoever’s enabling your good time pushed out all the shleem by hand, and shaved away the plubus and grumbo with manual tools.”</i>");
	output("\n\nShekka sighs, nuzzling into your chest for a moment before returning her attention to the screen. <i>“The narrator has a soothing voice at least. I swear half of those words are made up, but it makes sense when he says it.”</i>");
	output("\n\n<i>“I wonder if they re-use the freej juice for anything else?”</i> you wonder, as a particularly curvaceous gryvain woman lovingly shines the titanic tool down.");
	output("\n\n<i>“Looking at her, I could think of a few extra uses for it...”</i> the little Rask giggles, squeaking when you give the base of her tail a little squeeze.");
	output("\n\nEventually the channels transition to adverts that seem just as eclectic as the television itself.");

	//Time transitions three hours
	//Next: back to ship menu
	processTime(180);
	restHeal();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Option Two
public function shekkaHangoutBed():void
{
	clearOutput();
	showShekka();
	author("SomeKindofWizard");
	output("There isn’t anywhere in particular to go on the ship to take Shekka away from her work, but you have a pretty good idea of what to do. The little Rask smirks and raises a brow as you take her to the bedroom and begins to undress...");
	output("\n\nOnly to blink in confusion when you carry her into bed under the covers, put on some relaxing music, and go to sleep with a faceful of giant jingly ears. <i>“...Uh... [pc.name]?”</i> she asks, only to get no answer from you but an affirmative squeeze around the hips. <i>“You pulled me away from working for this?”</i>");
	output("\n\nYou just nod into her pink-quilled hair, letting out a soothing sigh. Shekka’s complaints gradually die down when you take one of her ears in your [pc.hand], rubbing and squeezing her. It isn’t enough to actually get the poor red-scaled cutie worked up, but it does quiet her down.");
	output("\n\nShe actually manages to drop off before you do, although your own lids sink closed soon enough. It isn’t until a few hours pass that the music you left playing changes into a soft alarm. From experience you remember that ignoring this alarm will result in Ausaril Death Metal being played loudly, a warning you pass on to Shekka when she grumbles complaints.");
	output("\n\n<i>“Hey, maybe I find metal roars to be relaxing”</i> she grunts, trying to get un-entwined from your nude form. You both manage to get redressed, just before the first thrumming drum-beats of Deth Gröwl kick to life.");
	if(annoIsCrew()) output(" Probably Anno’s fault.");
	output("\n\n<i>“It was a good nap, thank you for the company Shekka”</i> you say, putting on your most charming grin. Shekka blushes like a plum and waves it off.");
	output("\n\n<i>“Yeah, yeah, it’s fine... I enjoyed it too. I now smell like you completely, which will make for distracting thoughts, but oh well. You’ll just have to swing by later and help me scratch that itch, no?”</i>");
	output("\n\nAs if she could stop you.");
	processTime(180);
	restHeal();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Option One
public function shekkaTavrosHangoutOne():void
{
	clearOutput();
	showShekka();
	//put in anons
	generateMapForLocation("ANON'S BAR AND BOARD");
	author("SomeKindofWizard");
	output("Of course, the best place to go before anywhere else is Anon’s bar!");
	output("\n\nYou quickly discover that Shekka can put down a surprisingly decent amount of alcohol. ");
	if(pc.tolerance() < 50) output("More than you, actually");
	else output("It’s nothing to your own expertly-trained liver, but impressive nonetheless");
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
	addButton(0,"Next",mainGameMenu);
}	

//Option Two
public function shekkaTavrosHangoutTwo():void
{
	clearOutput();
	generateMapForLocation("BETHS BROADS");
	showShekka();
	author("SomeKindofWizard");
	//put in beth's
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
		if(flags["REAHA_ADDICTION_CURED"] == 1) output("Just thinking about how long it took for Reaha to recover makes this seem a little unlikely. ");
		output("Shekka shrugs helplessly <i>“I was addicted to you because it was fun. Fuck. Fuck it was so hot to crave you...”</i>");
		output("\n\n<i>“And you just had the cure around because you were enjoying it?”</i>");
		output("\n\nThe Raskvel smiles, taking another slow, deep breath. <i>“Yup, a different kind of addictive aphrodisiac, and a shit ton of caffeine. They’ll do battle in my brain or whatever for a while. Then I’m fine.");
		if(flags["REAHA_ADDICTION_CURED"] == 1) output(" It’s not like Reaha’s case, that girl spent fuck knows how long on synthetic lust drugs.");
		output("”</i>");
		output("\n\nWell... if she’s sure.");
		flags["SHEKKA_SPITDICTED"] = 1;
		processTime(20);
		//Next: Back to ship menu
		clearMenu();
		addButton(0,"Next",approachCrewShekka,true);
		//Greys out box until she’s addicted again, hovering over this says “You’ve already spoken to Shekka about her addiction”
	}
	//Shekka is Addicted
	//Selecting this when you have had sex with her at least once when you have aphrodisiac saliva gives this.
	else if(flags["SHEKKA_SPITDICTED"] == 1)
	{
		flags["SHEKKA_SPITDICTED"] = undefined;
		output("You bite the bullet and ask her outright; <i>“Shekka, are you addicted to me?”</i>");
		output("\n\nThe Rask in question gives the question maybe a half-heartbeat of thought before nodding. <i>“One hundred percent, [pc.name]. And before you say anything else? It is fucking <i>awesome</i>.”</i>");
		output("\n\nOkay. Not the response you were anticipating.");
		output("\n\n<i>“Like, think about it. I crave you, in a way that temporarily completes me. Sure, sometimes the addict-brain thing kicks in and I start to get a bit shaky without a hit... the tradeoff is an incredible orgasm all lip-to-lip.”</i>");
		output("\n\nJust thinking about it seems to have Shekka all juicy, judging by the way she squirms on the spot, pupils dilating. <i>“Look, [pc.name]. You don’t have to worry about me. The stuff you pump out is pretty damn clean chemically speaking. If you ever replace it, I should be able to drop the habit nooooo problem.”</i>");
		output("\n\nWell, if she’s sure...");
		//back to talk
		processTime(8);
		clearMenu();
		addButton(0,"Next",talkToCrewShekka);
	}
}

//Body
//Wherein we get Shekka to bolt on some of that sweet-sweet futa-donger.
public function talkToShekkaAboutGettingADick():void
{
	clearOutput();
	showShekka();
	author("SomeKindofWizard");
	output("There is no doubt about it. When it comes to women, the whole deal is immediately altered by a liberal application of dicks. It’s not a conversation you’ve ever breached with Shekka before, and when you do so, she squints at you.");
	output("\n\n<i>“Really? I, uh... I don’t know, Steele. I guess I never really put my thought into it. I’ve got this hips, these thighs, this ass...”</i> she gives her ass a spank for good measure, cooing as it sets the tender flesh to quivering. <i>“Do you think I need more?”</i>");
	output("\n\nShekka sighs and shrugs, looking you up and down as if she could gauge a proper response. You give the matter some thought as well, does she?");
	//Two Buttons: Get a dick and Stay girl
	processTime(3);
	clearMenu();
	addButton(0,"Get A Dick",giveShekkaFollowerADick);
	addButton(1,"Stay A Girl",stayAGirl);
}

//Get a dick
public function giveShekkaFollowerADick():void
{
	clearOutput();
	showShekka();
	author("SomeKindofWizard");
	output("<i>“Honestly...”</i> you begin, a wicked grin creeping across your [pc.face]. <i>“I’ve gotta say, it would be pretty hot...”</i>");
	output("\n\n<i>“Well, I mean... I get to pick what </i>kind<i> of cock, right?”</i> she answers, rubbing her chin idly. <i>“I want horse cock.”</i>");
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
	clearMenu();
	//Three Options: Not Yet, SynthSheath and Throbb
	addButton(0,"Not Yet",stayAGirl);
	if(pc.hasItemByClass(HorseCock)) addButton(1,"SynthSheath",synthsheathShekka,undefined,"SynthSheath","You have a handy-dandy artificial horse-cock right here. It’ll be so easy, so very easy to give her one.");
	else addDisabledButton(1,"SynthSheath","SynthSheath","You don’t have a synthetic horse-cock to slap on her.");
	//if(pc.hasItemByClass(Throbb)) addButton(2,"Throbb",throbbUpShekka,undefined,"Throbb","It’s not a horse-cock, but that can always be fixed later, right? Throbb’ll get her halfway there.");
	//else addDisabledButton(2,"Throbb","Throbb","You don’t have any throbb.");
}

public function stayAGirl():void
{
	clearOutput();
	showShekka();
	author("Fenoxo");
	output("<i>“Maybe later...”</i> you mutter, stroking your chin. It’ll be something to consider as an option for the future.");
	output("\n\nShekka shrugs, ears jangling. <i>“It’s real easy to forget that out here I can bolt on a dick lickity-split. I mean, if you’re really into that sort of thing, I wouldn’t mind fucking you till you wished </i>you<i> were full of eggs.”</i>");
	output("\n\nSounds like a plan.");
	clearMenu();
	addButton(0,"Next",approachCrewShekka,true);
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
	pc.destroyItemByClass(HorseCock);
	shekka.createCock();
	shekka.shiftCock(0,GLOBAL.TYPE_EQUINE);
	shekka.cocks[0].cLengthRaw = 14;

	shekkaCrewSexMenu();
	//Next: Sex scene
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
	if(9999 == 0) output(" You recognize it well; when your own abrupt growth occurred it felt like every inch of your brain was torn between cumming on the spot, and finding somewhere to hide yourself.");
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
	shekka.createCock();
	shekka.cocks[0].cLengthRaw = 7;
	processTime(20);
	pc.lust(10);
	clearMenu();
	addButton(0,"Next",approachCrewShekka,true);
}

//Shekka Share Bed Intro
//Sleeping without Shekka
public function shareShekkaBedProc():void
{
	clearOutput();
	showShekka();
	author("SomeKindofWizard");
	output("You’re partway to pulling off your [pc.clothes] when there’s a gentle tap on your leg. <i>“Hey, [pc.name]. Can’t help but notice that your bed is looking awfully not-full-of-Raskvel. Fancy changing that?”</i>");
	output("\n\nYou peek down at her, raising a brow slowly. That was a rather cheesy line. Shekka grins bashfully, grinding her foot into the floor. <i>“I’m not hearing a no! Well, not yet at least”</i>");
	processTime(1);
	flags["SHEKKA_SLEEPWITH_INTRODUCED"] = 1;
	clearMenu();
	addButton(0,"Share Bed",shareBedWithShekka);
	addButton(1,"No Share",dontShareBedWithShekka);
}

public function shareBedWithShekka():void
{
	clearOutput();
	showShekka();
	author("SomeKindofWizard");
	output("Too cute. You don’t so much as take her to bed as you do throw her into it, dropping ontop of her and nibbling at one particularly large ear, nuzzling until she squirms. <i>“Oooh fuck! Want!”</i>");
	flags["CREWMEMBER_SLEEP_WITH"] = "SHEKKA";
	//Sex Options:
	shekkaCrewSexMenu();
}

//No:
public function dontShareBedWithShekka():void
{
	clearOutput();
	showShekka();
	author("SomeKindofWizard");
	output("<i>“D’awwh. Well, give me a squeeze if you’d ever fancy it. I’m going to go crash as well.”</i> Shekka smiles warmly and gives you a little hip-wiggle for show. The little devil...");
	//Next: Sleep as usual, +5 lust
	clearMenu();
	sleep(false);
}

//Sleeping without Shekka and with Anno
public function shekkaBedIntroWithAnnoProc():void
{
	clearOutput();
	showBust(annoBustDisplay(),"SHEKKA");
	showName("ANNO &\nSHEKKA");
	author("SomeKindofWizard");
	output("You’re partway to pulling off your [pc.clothes] when there’s a gentle tap on your leg. <i>“Hey, [pc.name]. Can’t help but notice that your bed is looking awfully not-full-of-Raskvel. Fancy changing that?”</i>");
	output("\n\nBefore you get a chance to respond, Anno saunters out of your shower in all of her squishy, nude glory. <i>“Hrmn... you’re not trying to steal my sweet-dreamie-snuggles, are you?”</i> a couple of hops (giving you a delightfully bouncy show) over has her leaning over your shoulder. Her tits press against your back, ");
	if(pc.hasWings()) output("pushing your [pc.wings] out to the side.");
	else output("teasing you with a little wriggle.");

	output("\n\nShekka scowls, brow furrowing cutely. <i>“It’s not stealing if [pc.heShe] isn’t yours to own. And don’t you already have girlfriends? I’m all on my lonesome here.”</i>");
	output("\n\nTo her credit, the puppy-slut doesn’t immediately bury her foot in her mouth, pausing for a few breaths before doing so. <i>“You don’t have any girlfriends or boyfriends? Why not?”</i>");
	output("\n\nWishing you could pick her up by the scruff, you settle for reaching backwards over your shoulder to bap her on the nose, earning a little yelp of surprise. Shekka watches, snorting in amusement before continuing. <i>“No, Anno. I don’t. To be honest? It takes a little extra work for me to get in the mood. Really only [pc.name] seems to... y’know... </i>do<i> it for me.”</i>");
	output("\n\nAnno gasps, before a smug grin creeps across her face. <i>“you loooove " + pc.mf("hiiiim","heeeer") + "~”</i>");
	output("\n\n<i>“Shut up you bimbo!”</i> she shouts, cheeks beginning to purple. You silence them both before one of them gets teased a little too far.");
	processTime(10);
	clearMenu();
	flags["SHEKKA_SLEEPWITH_INTRODUCED"] = 1;
	addButton(0,"Both of You",bothOfYouShekka);
	addButton(1,"Just Anno",sleepWithJustAnno);
	addButton(2,"Just Shekka",sleepWithJustShekka);
}

public function shekkaRepeatBedTalkies():void
{
	clearOutput();
	showShekka();
	if(flags["CREWMEMBER_SLEEP_WITH"] != "SHEKKA" && flags["CREWMEMBER_SLEEP_WITH"] != "SHEKKA AND ANNO")
	{
		output("Do you want to invite Shekka into your bed at night?");
		clearMenu();
		if(annoIsCrew() && flags["ANNO_SLEEPWITH_INTRODUCED"] != undefined)
		{
			output(" Maybe you could add Anno for the perfect combination of short and stacked.");
			addButton(1,"Take Both",bothOfYouShekka);
		}
		addButton(0,"Take Shekka",shareBedWithShekka);
		addButton(14,"Back",talkToCrewShekka);
	}
	else
	{
		output("Shekka is currently warming your bed (and other places) at night. You can kick her out if you absolutely need.");
		clearMenu();
		addButton(0,"Empty Bed",kickShekkaOuttaBed);
		addButton(14,"Back",talkToCrewShekka);
	}
}

public function kickShekkaOuttaBed():void
{
	clearOutput();
	showShekka();
	output("You let Shekka know that you’d like a little more room in the bed for right now.")
	output("\n\n<i>“Awww, for serious?”</i> Shekka lets out a deep-seated sigh. <i>“I was just getting used to it.”</i> She shrugs. <i>“Well if you change your mind... you know where I’ll be.”</i> Shekka slips out, starting to unzip her suit.");
	flags["CREWMEMBER_SLEEP_WITH"] = undefined;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function bothOfYouShekka():void
{
	clearOutput();
	showBust(annoBustDisplay(),"SHEKKA");
	showName("ANNO &\nSHEKKA");
	author("SomeKindofWizard");
	//Both of you
	output("The obvious answer here is to just take the both of these fine women to bed, and you tell them as much. It takes a few moments for confusion to change into something wholly more curious, and Shekka is the first to speak up. <i>“I... I’unno. I was prepared for one bedbuddy.”</i>");
	output("\n\nDespite the nervousness of the shortstack’s voice, Anno leans in, tail wagging. <i>“Awww, can’t handle all this fluffy softness? These sweet sweet chest-pillows?”</i> responds the white-fluffed Ausar with an eye-capturing bounce of said chest-pillows. Trust her to dispel the tension with her ‘assets’. She squeals and giggles when you push her onto the bed, before rolling onto her back to give both you and Shekka her very best bedroom-eyes, trailing one fluffy limb down her front to her fragrant gulf.");
	output("\n\nYour hands help slip Shekka out of her tight-fitting suit, freeing her to the open air of your ship. Despite a few of her motions lacking surity, Anno practically helps you pull your new lover into the bed before you climb in after them.");
	flags["CREWMEMBER_SLEEP_WITH"] = "SHEKKA AND ANNO";
	processTime(3);
	clearMenu();
	sleep(false);
}

/*Sleep now
Fen note: Cut this bit. Didn't make much sense anywhere.
public function sleepNowWithShekkaAndAnno():void
output("\n\n	Grasping groping hands lay into you, but with a grumble you bat them away, earning a duo of half-worded complaints. Eventually they settle in properly though, and your bed somehow manages to accommodate you all. You rest your head on Anno’s chest, listening to her heartbeat, even while Shekka wraps herself around your lower-half, using you like an oversized pillow.");

output("\n\n//Next: sleep as normal, next day");*/

//Anno
public function sleepWithJustAnno():void
{
	clearOutput();
	showBust(annoBustDisplay(),"SHEKKA");
	showName("ANNO &\nSHEKKA");
	author("SomeKindofWizard");
	output("You run your fingers through your [pc.hair], looking over the two of them and trying to keep your expression plain. It may seem unfair, but Anno was here first. It’s not right to supplant her just because of that.");
	output("\n\nShekka lets out a deep-seated sigh and nods bashfully. <i>“You’re right, you’re right. Sorry for losing my temper.”</i> she directs the second part of her apology at Anno, who appears just as embarrassed to have started up an argument. You give them both head-ruffle, and Shekka slips out again, starting to unzip her suit.");
	output("\n\nNot wanting to hear anything from Anno, you give her a nudge towards the bed, earning a surprised yelp before tossing the covers over the both of you.");
	//Next: sleep as normal, next day
	flags["CREWMEMBER_SLEEP_WITH"] = "ANNO";
	processTime(2);
	clearMenu();
	sleep(false);
}

//Shekka
public function sleepWithJustShekka():void
{
	clearOutput();
	showBust(annoBustDisplay(),"SHEKKA");
	showName("ANNO &\nSHEKKA");
	author("SomeKindofWizard");
	output("It is true that Anno doesn’t particularly have any issues with finding companions... whereas if Shekka is struggling...");
	output("\n\nIt takes a valiant force of will not to look at the puppy-dog-eyes Anno is beaming your way. Judging by the look on Shekka’s face, she wasn’t prepared for that particular trap. A gentle boop on Anno’s nose breaks the spell, and she lets out a soft whine before giving up. <i>“Okay, okay... I understand. If you change your mind, you know where to find me.”</i>");
	output("\n\nThe snowy-furred Ausar gives you a peck on the cheek, plucks up her towel and clothing, and slips out of the room, giving you both a hip-swaying show as she goes. Your red-scaled shortstack looks up, appearing guilty as all hell. <i>“Crap... I’m sorry...”</i>");
	output("\n\nPutting your hands up in mock surrender, you announce there’s nothing you hate more than drama. It takes a few more babbled apologies, but eventually Shekka gives up and agrees, scrambling into your bed. <i>“Well then Captain, if that’s the case... think you could help me out of my suit?”</i> she licks her lips, waving her egg-layer-hips in your face enticingly.");
	output("\n\nAs if anyone could stop you.");
	flags["CREWMEMBER_SLEEP_WITH"] = "SHEKKA";
	processTime(2);
	clearMenu();
	sleep(false);
}

/*Asking Anno
Fen note: lazy
//If you’re sharing with Shekka and ask Anno to join you in bed, you can ask just her, or invite her to join you and Shekka. Asking her works as normal, following text is for inviting her to join you.
output("\n\n	<i>“What’s that Boss? You want me and scalebutt to make you into a little Steele Sandwich?”</i> Anno appears pensive, resting a finger demurely on her chin. The wagging of her tail can’t lie however.");

output("\n\n<i>“Hey Shekka!”</i> she abruptly calls, nearly spooking you out of your {skin/fur/scales}. <i>“Make some space in that bed! We’re going to squish up like a naughty little fuckpuddle tonight!”</i>");
output("\n\n//Next: conversation closes, sleeping is set as having Anno and Shekka shared");
*/

//Waking: Sharing Shekka
//Randomized chance of each scene occurring, Aphrodisiac scenes first; these are triggered by having the aphrodisiac tag on your tongue
public function shekkaSleepWithMornings():void
{
	clearOutput();
	showShekka(true);
	author("SomeKindofWizard");
	//Aphrodisiac
	if(pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED))
	{
		//1
		if(rand(2) == 0)
		{
			output("Needy fingers digging into your chest are the first thing to wake you up... followed very swiftly by a boiling-hot cunt pressing its flushed lips against ");
			if(pc.hasCock()) output("the shaft of [pc.oneCock]");
			else output("your [pc.leg]");
			output(", grinding slowly up and down. <i>“Fuck... I can’t help it... sorry for waking you up, [pc.name]... I– I just need this, I need this right now!”</i>");

			output("\n\nThere’s a surprising amount of strength in her grip as her body works and grinds, mouth wide open. <i>“I need you, your saliva, your touch! I woke up and it’s all I could think about! I need you to treat me like a wanton whore!”</i> Realizing her body is jonesing for a hit of your aphrodisiac-laden spit, you haul her up to your mouth, capturing her lips in yours. Her exultant moans drift into horny, lust-drunk whimpers as the chemical load dumps itself into her brain.");
			output("\n\nShe squirts onto your abdomen, sent immediately crashing into a surprise orgasm. For her own safety you end the kiss, nuzzling her as she quakes and twitches on you. <i>“Thanksh”</i> she mumbles drunkenly, even as her fingers plumb at her own now-puffy labia.");
			pc.lust(10);
		}
		//2
		else
		{
			output("As sleep finally scatters into wakefulness, you become aware of a great warmth, naked flesh, and smooth scales pressing down on your body. Your eyes peel open, seeing Shekka looking up at you hungrily ");
			if(pc.biggestTitSize() >= 2) output("from between your massive breasts");
			else output("with her chin perched on your pecs");
			output(". Her lids slowly open and close, and her hips raise up, wiggling like a predator about to pounce.");
			output("\n\nYou get perhaps halfway into a ‘Good Morning’ before she pounces, diving in for a hungry kiss. She has the dilated pupils of an addict, and the moment her tongue meets your it hits her like a shock of electricity. Shekka trembles atop you, whimpering into your mouth as she gets her fix, practically gushing from her now-flushed quim. Your hands instinctively grasp at her cushiony rear, giving her a slow squeeze until she stops moaning through your lips and comes up for air.");
			output("\n\n<i>“Ffffuck... [pc.name], I held out for as long as I could, I seriously needed my fix....”</i>");
			output("\n\nShe rolls off of you, idly stroking herself. <i>“Better than morning coffee...”</i>");
			pc.lust(10);
		}
	}
	//Normal
	else
	{
		//1
		if(rand(2) == 0)
		{
			output("A soft, trilling breathing tickles at one of your [pc.ears]. It’s a very much alien sound, as though it were a hint away from a sibilant hiss, or trickling birdsong. Peeking over your shoulder reveals an innocently sleeping face, and the need to climb out of bed and get on with your day has to pose a quick war with comfort.");
			output("\n\nYou reach around your back, planting your hands on warm, naked ass-cheeks. Although Shekka’s eyes stay closed, her breathing shifts. She’s probably awake now. Not that it stops you from continuing, massaging her expansive rear and rubbing the very base of her tail until the horny Rask struggles to fight down delighted little ‘coo-ing’ sounds. She finally fives up, nibbling your shoulder and moaning sweetly. <i>“A girl could get used to a little hands-on wakeup like that.”</i>");
			output("\n\nShekka gives you a quick spank, disentangling from your body and letting you up.");
		}
		//2
		else
		{
			output("Your dreams are interrupted by an all-encompasing sensation of warmth at your core, of dainty little fingers squeezing at your thighs. Opening your eyes to a brand new day feels a little bit too challenging, but you do so anyway at the rather insistent need to cum. Unknown waves of orgasm are apparently cresting the shores of your resolve, and a peek beneath the bedsheets reveals the culprit; Shekka.");
			output("\n\nHer ears are laid out across your legs, ass up in the air as the nude creature lovingly licks and kisses at ");
			if(pc.hasVagina()) output("your thoroughly-soaked slit");
			else if(pc.hasAKnot()) output("engorging knot");
			else output("turgid shaft");
			output(". The very first question on your lips is how long she’s been at it, but the breath is practically stolen from you after one exceptionally adoring kiss. Apparently it must have been a while since you’re immediately sent crashing into orgasm, ");
			if(pc.hasCock()) 
			{
				output("painting your own chest in [pc.cum]");
			}
			else output("coating her face in [pc.girlcum]");
			output(".");
			output("\n\nShekka licks her lips, ensuring the rest of your morning is taken up by her dutiful cum-cleaning tongue, before you’re given a nuzzle. <i>“Good morning, [pc.name]!”</i>");
		}
	}
	sleep(false);
}

public function shekkaCrewSexMenu():void
{
	clearMenu();
	penisRouter,[shekkaCrewFutaBendoverFuck,chars["SHEKKA"].vaginalCapacity(),false,0]
	if(pc.hasCock())
	{
		if(pc.cockThatFits(chars["SHEKKA"].vaginalCapacity()) >= 0) 
		{
			if(shekka.hasCock()) addButton(0,"Fuck Her",penisRouter,[shekkaCrewFutaBendoverFuck,chars["SHEKKA"].vaginalCapacity(),false,0],"Fuck Her","Bend Shekka over her desk and fuck her while she tries to keep working.");
			else addButton(0,"Fuck Her",penisRouter,[shekkaCrewBendoverFuck,chars["SHEKKA"].vaginalCapacity(),false,0],"Fuck Her","Bend Shekka over her desk and fuck her while she tries to keep working.");
		}
		else addDisabledButton(0,"Fuck Her","Fuck Her","You don’t have a dick small enough to fit her.");
	}
	else addDisabledButton(0,"Fuck Her","Fuck Her","You need to have a penis in order to bend her over her desk and fuck her.");

	if(pc.hasVagina()) 
	{
		if(shekka.hasCock()) addButton(1,"Tribadism",shekkaCrewFutaTailTrib,undefined,"Tribadism","A little bit of tribadism with the raskvel’s tail in the middle for added texture.");
		else addButton(1,"Tribadism",tribCrewVibeyVibe,undefined,"Tribadism","A little bit of tribadism with the raskvel’s tail in the middle for added texture.");
	}
	else addDisabledButton(1,"Tribadism","Tribadism","Tribadism requires you to have a vagina.");

	if(pc.hasCock() && pc.biggestCockVolume() > chars["SHEKKA"].vaginalCapacity() && pc.tallness >= 60 && pc.cumQ() >= 500) 
		addButton(2,"Big Dick",hugeEarShekkaFaps,undefined,"Big Dick Shenanigans","Use your over sized member on the small mechanic. She’s gotta have some way to please it, right?");
	else addDisabledButton(2,"Big Dick","Big Dick Shenanigans","This scene requires a large dick, a height of above five feet, and large volume of cum.");

	//MilkQ over 1000
	if(pc.milkQ() >= 1000 && pc.isLactating()) addButton(3,"FeedMilk",shekkaMilkDranking,undefined,"FeedMilk","Feed her some of the copious milk you’re carrying around.");
	else addDisabledButton(3,"FeedMilk","Feed Shekka Some Milk","You need to be lactating quite heavily to satisfy the little raskvel with your teats alone.");

	addButton(14,"Back",approachCrewShekka,true);
}

//Talk Menu Sex
//In the talk menu when Shekka is a crewmember, this is what the Sex Option brings up before providing options.
public function shekkaCrewSexApproach():void
{
	clearOutput();
	showShekka();
	//Non-Futa
	if(!shekka.hasCock())
	{
		output("Shekka grins at you, hips wiggling. <i>“I know that look in your eyes, [pc.name]. You wouldn’t happen to be looking for an opportunity to let off a little steam?”</i>");
		output("\n\nThe little Rask nibbles her bottom lip, and her tail flips up into her hands so that she can wring it in mock coyness. <i>“Because that would suit me juuust fine!”</i> Her flirting is interrupted by an almost human grunt from your engine, and she gives it a kick, scowling. <i>“Moving on.”</i>");
		//In heat
		if(pc.inHeat() && pc.hasVagina()) 
		{
			output("\n\nShe isn’t wrong considering you’re in heat. Every chemical signal in your body is centered on your core, begging to get off and be filled until your [pc.pussy] is a leaking mess. Shekka watches as you ");
			if(pc.tallness < 4*12+6) output("close the distance");
			else output("crouch down to her level");
			output(" and dip in for a kiss, growing more excited as your lips meet.");
			if(pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED)) output("\n\nShekka lets out a shuddering little moan, nipples instantly stiff and rigid through the suit, her eyes dilated from slits into circles. <i>“H-how... god-that’s-good... Uh... how do you wanna do it- me?”</i>");
			else output("\n\nShekka lets out a delighted little moan, nipples growing hard enough to be seen through her sheer suit. <i>“How do you wanna do it, [pc.name]?”</i>");
		}
		//In rut
		else if(pc.inRut() && pc.hasCock())
		{
			output("\n\nNo kidding. You’re in <i>rut</i> afterall, your [pc.cocks] ");
			if(pc.cockTotal() == 1) output("is");
			else output("are");
			output(" practically ");
			if(pc.cockTotal() == 1) output("an aching bar");
			else output("aching bars");
			output(" of red-hot iron ");
			if(!pc.isCrotchExposed()) output("in your [pc.crotchCover]");
			else output("against your naked thighs");
			output(". Shekka watches as you ");
			if(pc.tallness < 4*12+6) output("close the distance");
			else output("crouch down to her level");
			output(" before scooping her up and onto your hips. Her hands grab onto your ");
			if(pc.biggestTitSize() < 1) output("pecs");
			else output("tits");
			output(", squeezing them like handholds as you draw her into a hungry make-out.");
			if(pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED)) output("\n\nBy the time you’re done warming up, Shekka’s drooling and shuddering, staring at you in chemically-supplimented adoration. <i>“Oh fuuuuck... How do you want me, [pc.name]? Just fucking take me.”</i>");
			else output("\n\nBy the time you’re done warming up, Shekka’s gasping for breath. <i>“Oh fuck, how do you want me, [pc.name]?”</i>");
		}
		//Else
		else
		{
			output("\n\n<i>“A little roll-around wouldn’t hurt”</i> you say, grinning and crossing your [pc.arms].");
			output("\n\nShekka smiles and hops up to you, throwing her arms around your ");
			if(pc.tone >= 60 && pc.thickness >= 75) output("big strong ");
			else if(pc.tone < 40) output("soft, welcoming ");
			output("shoulders, nuzzling into your neck. <i>“Good. I don’t know what it is you do to me, but damn do I crave it. How do you want me?”</i>");
		}
	}
	//Futa
	else if(shekka.hasCock(GLOBAL.TYPE_EQUINE))
	{
		output("Ever since Shekka started packing a big ol’ horse-cock, the clear indentation of it stands out within her tight suit. She seems to pick up on the lewd look you give her, judging by the way it twitches in its confines, and her eyelashes flutter sweetly. She fluffs out her bright pink quills, putting on her best bedroom eyes. <i>“[pc.name], I daresay you’re looking to get a load off.”</i>");
		output("\n\nThat’s... not quite how that phrase is meant to be spoken, but judging by the way her prick is eagerly anticipating its chance to be a cum-cannon once more it was probably on purpose.");
		//In heat
		if(pc.inHeat() && pc.hasVagina())
		{
			output("\n\nShe isn’t wrong considering you’re in heat. Every chemical signal in your body is centered on your core, begging to get off and be filled until your [pc.pussy] is a leaking mess of rich futa spunk. Shekka watches as you ");
			if(pc.tallness < 4*12+6) output("close the distance");
			else output("crouch down to her level");
			output(" and dip in for a kiss, growing more excited as your lips meet.");

			if(pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED)) output("\n\nShekka lets out a shuddering little moan, nipples instantly stiff and rigid through the suit, though nowhere near as obvious as the throbbing, shrink-wrapped length. Her eyes dilate from slits into circles. <i>“H-how... god-that’s-good... Uh... how do you wanna do it- me?”</i>");
			else output("\n\nShekka lets out a delighted little moan, her cock presses against your body in accusation. <i>“How do you wanna do it, [pc.name]?”</i>");
		}
		//In rut
		else if(pc.hasCock() && pc.inRut())
		{
			output("\n\nNo kidding. You’re in <i>rut</i> afterall, your [pc.cocks] ");
			if(pc.cockTotal() == 1) output("is");
			else output("are");
			output(" practically ");
			if(pc.cockTotal() == 1) output("an aching bar");
			else output("aching bars");
			output(" of red-hot iron ");
			if(!pc.isCrotchExposed()) output("in your [pc.crotchCover]");
			else output("against your naked thighs");
			output(". Shekka watches as you ");
			if(pc.tallness < 4*12+6) output("close the distance");
			else output("crouch down to her level");
			output(" before scooping her up and onto your hips. Her cock is trapped ");
			if(pc.biggestTitSize() >= 5) output("between the plush softness of your breasts");
			else output("between the press of your modest chests");
			output(", already oozing pre into her suit. The smaller girl whimpers into a hard make-out, fingers squeezing at you.");
			if(pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED)) output("\n\nBy the time you’re done warming up, Shekka’s drooling and shuddering, staring at you in chemically-supplimented adoration. <i>“Oh fuuuuck... How do you want me, [pc.name]? Just fucking take me.”</i>");
			else output("\n\nBy the time you’re done warming up, Shekka’s gasping for breath. <i>“Oh fuck, how do you want me, [pc.name]?”</i>");
		}
		//Else
		else
		{
			output("\n\n<i>“A little roll-around wouldn’t hurt”</i> you say, grinning and crossing your [pc.arms].");
			output("\n\nShekka smiles and hops up to you, throwing her arms around your ");
			if(pc.tone >= 60 && pc.thickness >= 75) output("big strong ");
			else if(pc.tone < 40) output("soft, welcoming ");
			output("shoulders, nuzzling into your neck. Her prick has grown hard enough to jab you in the abdomen even while she moans sweetly. <i>“Good. I don’t know what it is you do to me, but damn do I crave it. How do you want me?”</i>");
		}
	}
	processTime(4);
	pc.lust(20);
	shekkaCrewSexMenu();
}

//Bendover Fuck
public function shekkaCrewBendoverFuck(x:int):void
{
	clearOutput();
	showShekka(true);
	author("Fenoxo and SKoW");
	output("Although it’s far smaller than the one in her warehouse, you flip Shekka around and nudge her towards the bench. <i>“Go ahead and work on... whatever that piece of my ship is. Just let me do all the work.”</i> Your fingers trace up her spine to her neck where a small, hidden clasp resides. Shekka shivers in anticipation once you find it. You artfully twist your thumb and index finger, releasing the catch and revealing her jumpsuit’s seam. The fabric parts slowly, opening just enough to let her pale crimson flesh peek through, the light sparkling off glossy scales as they’re exposed. <i>“Well? I’m waiting. I want to see maximum satisfaction here.”</i>");
	output("\n\nShekka, usually sassy and quick to react, looks at you uncertainly. Her tail swishes back and forth nervously, but she does as you ask, plucking up some (frankly expensive looking) parts from all over her workbench into a smile pile before you. A moment later, her confident smile returns. She presses her large rump back against you, curling her tail around your side so as not to interfere with the soft, sensuous press of her buttocks against your package. With just an earnest flex, her cheeks squeeze your [pc.cocks] harder.");
	output("\n\nOhhh, that feels nice. Blood surges to your genitals, and your breath shortens as your heartbeats accelerate. Grunting softly, you grab hold of her slowly releasing suit by its edges and tug, baring her shoulders in an instant. The edge of the fabric catches on her nipples, revealing the soft, eggplant-colored areolae a second before the tips of her nipples pop out over the edge. From there, it’s easy to peel the obstructing garment down past Shekka’s bare belly to her hips. The fit is much tighter there, and the press of her expansive ass against your [pc.cocks] makes choosing between continuing to grind against her or getting her out of her clothes an agonizingly difficult decision.");
	output("\n\n<i>“What’s the matter?”</i> Shekka wonders, applying some ED-80 to a particularly tight fixture to loosen the screws. <i>“Having a little trouble with unwrapping me?”</i>");
	if(pc.hasCock() || pc.hasVagina()) 
	{
		output(" She brings her tail up");
		if(pc.legCount > 1) output(" between");
		else output(" around");
		output(" your [pc.legOrLegs] to slide alongside ");
		if(pc.balls > 0) output("your [pc.sack]");
		else if(pc.hasVagina()) output("[pc.oneVagina]");
		else output("your [pc.base " + x + "]");
		output(".");
	}
	else output(" She curls her tail around to tease your [pc.asshole], the tip circling around the edge of your ring.");
	if(!pc.isNude()) output(" <i>“You haven’t even gotten yourself naked yet.”</i>");
	//Not naked yet
	if(!pc.isCrotchExposed())
	{
		output("Shuddering, you respond to her critique by stepping back and tearing out of your [pc.crotchCovers] in seconds, tossing the obstructing equipment back towards your ship’s hold. You ask, <i>“How’s that?”</i> though it’s revealed as a prideful hypothetical when your exposed form presses back against hers.");
	}
	//Merge
	output("\n\nYou press your [pc.cocks] harder against her - hard enough ");
	if(pc.cockTotal() > 1) output("for one ");
	output("to tease her clenching ring. Shifting the angle, you thread yourself lower between her thighs, pressing your length against the bump of her rear clit, feeling the suit sink into her slit around you as you tease her. Shekka’s busy motions on the table slow before being interrupted by an instinctive twitch of pleasure. The sound of her moan is muffled by her tightly-closed lips, but you hear it nonetheless.");
	output("\n\n<i>“What’s the matter?”</i> it’s your turn to ask. <i>“No wonder you used to be so worried about sex interfering with your work. All it takes is a little rub on one of your knobs to interrupt you.”</i>");
	output("\n\nShekka picks up the pliars she just dropped and grits her teeth. <i>“It... it just slipped is all!”</i> She goes back to work, pausing to whimper every now and again when [pc.oneCock] grinds against her clitty in a particularly delicious way. <i>“I’ll have finished cleaning this before you figure out how to... mmm... fuck my pussy.”</i> She glances over her shoulder to stick her tongue out at you and wink. That lengthy tongue shivers across her lips sensuously on the next thrust before she turns away once more. The little slut is egging you on!");
	output("\n\nTaking one hand off her skin-tight suit, you press your palm to her [shekka.belly], sliding it down to her mons from the opposite side of your slowly thrusting dick. You find the bump of her second clit and press your middle finger down, swiping it back and forth across the pleasure-sensitive bud.");
	output("\n\nYou might as well have hooked her clitties up to batteries judging by the way it makes her jolt. Shekka barks, <i>“Fuck, [pc.name]! Ung! T-take it easy, oooookay?”</i> Her gratuitous hips give a sexy wiggle, wanting more.");
	if(silly) output(" Those hips don’t lie.");

	output("\n\n<i>“Are you sure?”</i> You press and rub her from both sides, still working to peel her out of her jumpsuit. It’s slower going with just the one free hand, but you manage to time each tug with every twitch and buck. The alabaster fabric rolls halfway down her ass before catching between your paired forms. The front is hooked by your busily gyrating finger as well. Somehow she’s managed to oil up some steel wool, grinding it around the inside of some gunked-up seams.");
	output("\n\n<i>“Y-y-yes,”</i> Shekka answers, letting the cleaning wool drop from between her fingers. Not because of the overwhelming feelings coming from her thighs but because she’s finished with it. It’s hard to tell if she was answering your question or merely giving voice to her pleasure. Upon reflection, you realize that it doesn’t really matter much either way. Your [pc.cocks] ");
	if(pc.cockTotal() == 1) output("is");
	else output("are");
	output(" as hard as ");
	if(pc.cockTotal() == 1) output("a titanium bar");
	else output("titanium bars");
	output(", and there’s no way you’re going to pass up on your raskvel honey’s pussy.");

	output("\n\nYou pull away from the fidgeting mechanic. Her hands are shaking as she swaps components, and her breath is as ragged as and endurance runner’s. She’s still managing to do her work, though. The jumpsuit gives way around her hips, stretching before rolling down her scaly hips. It clings to her sopping-wet slit in liquid-assisted defiance before finally breaking away, carrying a glossy sheen as a memento of its time wedged into her crotch. You grunt in appreciation of the fine ass you’ve revealed while you push her clothing to the ground.");

	output("\n\nShekka’s tail pats the side of your face, right on your cheek, and she purrs, <i>“Mmmm, good [pc.boyGirl], but I think I might get this repaired before you can cum inside me.”</i> The naughty little limb snakes down your neck to your chest then around to your [pc.butt]. It slaps you for good measure. <i>“If this is the best you’ve got, maybe I should just let you at me the whole damn day. I could get so much done before you even wring a single orgasm out of my dripping... wet... cunt.”</i> She steps further apart to show you just how wet she’s become.");
	output("\n\nOh wow, is it ever. Her violet lips are absolutely sopping. Beads of clear lubricant hang from her labia as rain clings to a spider’s web. Plump and engorged, her meaty vulva is begging for a fuck. Both her clits are jutting out from between the soaked lips, and droplets hang on slick strands from them, sometimes releasing to patter on the floor. A small puddle has formed beneath the juicy raskvel, matching the one in her suit, proof of just how badly she needs you to fuck her.");
	output("\n\nIt’s too much: her taunting words, the tantalizing gates of pleasure so close that can feel the heat steaming off of them, and the submissive, bent-over pose. Even if you were determined not to fuck her, you couldn’t stop your [pc.hips] from lurching forward. You couldn’t stop your [pc.cock " + x + "] from spreading them wide");
	var y:int = -1;
	if(pc.cockTotal() > 1) 
	{
		y = pc.cockThatFits(shekka.analCapacity());
		if(y == x) y = pc.cockThatFits2(shekka.analCapacity());
		if(y == x) y = -1;
	}
	if(y >= 0) output(" or your [pc.cock " + y + "] from battering into her tight asshole");
	output(". You certainly wouldn’t be capable of holding back the growl that rips its way out of your throat as your body asserts its primal need to fuck and breed the female its been presented with.");
	pc.cockChange();

	output("\n\nShekka’s legs slam against her little table as you take her from behind, pressing on her hard enough that she winds up wrapping her perky chest around a pipe like an impromptu tit-fuck. Her lips cling to your piston like oiled cylinder walls, and as you really start to give it to her they only seal tighter around you. Every forceful thrust is accompanied by lurid squelches, every cock-hilting thrust matched by affectionate, muscular squeezes from Shekka’s box. The impacts cause you to bump her rearward clit repeatedly, and she moans each time. These raskvel were made to be fucked from any angle; no matter how you take them, one of their clits will be happily sparking.");
	output("\n\nYou settle into an easy, musical rhythm. Her swaying, pierced ears provide a pleasant jingling background while her staccato moans provide proof positive that’s getting the hard fucking she wanted. Shekka’s petite body feels almost entirely wrapped around your [pc.cock " + x + "] even though such a thing is impossible. Her tail is wrapped around your waist encouragingly, helping you to thrust into her as hard as absolutely possible. If you weren’t so caught up in the moment, you might be worried that you would bruise her thighs against the workbench. She wouldn’t let you stop, though. She’d tell you to get back to work. After all, she’s working.");

	output("\n\nIt’s hard to tell if she’s still working, actually. She did manage unwedge the cylinder from between her perky tits at least. Damn, her nipples look hard. And she seems to be trying to place it aside and get her hands on another, but she keeps throwing back her head and moaning. Her free hand keeps knocking over the little bottle of cleaning fluid and scrabbling against the workbench’s hard metal surface. Shekka might have made some good progress on her toy, but there’s no way she’s going to finish it in this condition.");

	output("\n\nShe’s little more than a slutty mess of fuckjuice and pleasure now - a tingling bundle of nerves spasming around your ");
	if(y >= 0) output("doubled dicks");
	else output("[pc.cock " + x + "]");
	output(" in an effort to please you. Her tongue lolls out of her mouth. There’s at least half a foot of organ there, tempting you into having the little gadget-slut clean you off afterwards. Holding her by the hips, you pound away, feeling her start to orgasm underneath you, gushing fluid over your [pc.knot " + x + "]");
	if(y >= 0) output(" and clenching around your [pc.cock " + y + "] with her pucker");
	output(". Right now, she’s the perfect little sextoy, and you’re using her like one.");

	output("\n\nFuck, she’s getting tighter every time! It’s actually starting to get hard to pull out of her, and the soaking-wet girl goo bathing you is challenging you to erupt. No, worse than that, her whole body is begging for a thick wad of your [pc.cumNoun]");
	if(y >= 0) output(" - even her ass");
	output(".");

	output("\n\nShekka babbles in a brief interlude between orgasms, <i>“Fucking fuck me! Cum!”</i> Of course, her pink eyes roll back and a second later, and her words transform into poorly enunciated \"yes\"es and \"ahh\"s of pleasure. Bending low over top of her, you feel the rising heat inside you, signaling that your own release is soon at hand. You wrap an arm under her chest, lifting her to press against your [pc.chest]. Grabbing tight, your palm encircles her breast, and you bottom out one last time");
	if(pc.hasKnot(x))
	{
		output(", your expanding knot");
		if(pc.hasKnot(y)) output("s");
		output(" slipping in");
	}
	output(".");

	var knot:Boolean = false;
	var knots:Boolean = false;
	if(pc.hasKnot(x)) knot = true;
	if(y >= 0)
	{
		if(pc.hasKnot(y)) knot = true;
		if(pc.hasKnot(x)) knots = true;
	}
	if(knot) 
	{
		output(", your expanding knot");
		if(knots) output("s");
		output(" slipping in");
	}
	output(".");

	//The knots have it
	if(knot)
	{
		output("\n\nThe feeling of seating yourself deeply inside her and being locked in place by your expanding biology only makes your climax that much hotter.");
		if(knots) output(" Doing that to both her holes at once is even better.");
		if(pc.cumQ() < 10)
		{
			output(" Dribs and drabs of [pc.cum] leak out from your ");
			if(y >= 0) output("doubled dicks");
			else output("[pc.cock " + x + "]");
			output(", oozing in thin flows into her oh-so-receptive body. You run out long before the ecstasy subsides. Perhaps you should let your [pc.balls] rest a bit in between orgasms.");
		}
		else if(pc.cumQ() < 25)
		{
			output(" Spurts of [pc.cum] splatter into her waiting body with explosive eagerness, your [pc.hips] twitching a little further forward with each successive ejaculation.");
		}
		else if(pc.cumQ() < 250)
		{
			output(" Thick blobs of [pc.cumNoun] explode out of you one after another, bathing Shekka’s interior");
			if(y >= 0) output("s");
			output(" in a thick coat of your [pc.cumColor] love. You hold position, secure in the knowledge that your knot");
			if(knots) output("s");
			output(" will pin every drop inside her.");
		}
		else if(pc.cumQ() < 4000)
		{
			output(" Massive blobs of [pc.cum] pour out of you, so voluminous that each barely has time to finish before the next ejaculation is erupting like a volcano. Poor Shekka’s body is absolutely filled with your [pc.cumColor] seed.");
			if(y >= 0) output(" Her belly even rounds from the combined injections.");
		}
		else
		{
			output(" Gigantic blasts of [pc.cum] force their way into Shekka’s eager tunnel");
			if(y >= 0) output("s");
			output(" packing ");
			if(y >= 0) output("them ");
			else output("it ");
			output("full with the first few injections. The next ones, sealed in by your knot");
			if(y >= 0) output("s");
			output(", swell her [shekka.belly] with added weight, giving her a positively pregnant appearance.");
			if(!knots && y >= 0) output(" Sadly, you don’t have knots to plug both sides, and waves of hot-pumping [pc.cumNoun] vent out over one of your [pc.cocks].");
			if(pc.cumQ() >= 9000) output(" Her wobbly, spunk-stuffed tummy grows so big that you worry for her health, but by then the fluid distention widens her passage enough for streams of it to sluice out over your crotch, venting the pressure.");
		}
		output("\n\nYou go limp, your ardor spent, but your knot");
		if(knots) output("s hold");
		else output(" holds");
		output(" you secure inside of her, giving you time to appreciate the outlines of her shoulderblades and the natural fragrance of her feathery hair.");
	}
	//No knot for you, come back next year.
	else
	{
		output("\n\nHer wet, milking walls coax you to a glorious a climax");
		if(y >= 0) output(", and the way her asshole is tugging at your dick doesn’t hurt either");
		output(". ");
		if(pc.cumQ() < 10) 
		{
			output("Dribs and drabs of [pc.cum] leak out from your ");
			if(y >= 0) output("doubled dicks");
			else output("[pc.cock " + x + "]");
			output(", oozing in thin flows into her oh-so-receptive body. You run out long before the ecstasy subsides. Perhaps you should let your [pc.balls] rest a bit in between orgasms.");
		}
		else if(pc.cumQ() < 25) 
		{
			output("Spurts of [pc.cum] splatter into her waiting body with explosive eagerness, your [pc.hips] twitching a little further forward with each successive ejaculation.");
		}
		else if(pc.cumQ() < 250)
		{
			output("Thick blobs of [pc.cumNoun] explode out of you one after another, bathing Shekka’s interior");
			if(y >= 0) output("s");
			output(" in a thick coat of your [pc.cumColor] love. You hold position, feeling some of it slop back out around your [pc.cock " + x + "], ");
			if(pc.balls == 0) output("running down your [pc.leg].");
			else output("clinging to your [pc.sack] to make it shine with sex.");
		}
		else if(pc.cumQ() < 4000)
		{
			output("Massive blobs of [pc.cum] pour out of you, so voluminous that each barely has time to finish before the next ejaculation is erupting like a volcano. Poor Shekka’s body is absolutely filled with your [pc.cumColor] seed.");
			if(y >= 0) output(" Her belly even rounds from the combined injections.");
		}
		else
		{
			output("Gigantic blasts of [pc.cum] force their way into Shekka’s eager tunnel");
			if(y >= 0) output("s");
			output(" packing ");
			if(y >= 0) output("them ");
			else output("it ");
			output(" full with the first few injections. The next ones, heavy as they are, swell her [shekka.belly] with added weight, giving her a positively pregnant appearance. Waves of excess, hot-pumping [pc.cumNoun] vent out over your [pc.cocks] as you continue to ejaculate, sluicing down your ");
			if(pc.balls > 0) output("[pc.balls]");
			else output("[pc.leg]");
			output(".");
			if(pc.hasCockFlag(GLOBAL.FLAG_FLARED)) output(" Your flared tip makes sure a fair portion of it shoots directly against her cervix.");
		}
		output("\n\nYou go limp, your ardor spent and your softening length");
		if(y >= 0) output("s");
		output(" slipping halfway out of her. You take the moment to appreciate the shapeliness of her shoulder blades and the natural scent of her feathery hair air.");
	}
	//Merge
	output("\n\nAfter a while of holding her like this, she comes down from her own plateau and cranes her head around to look at you, smiling. It isn’t a mere sated smile either - the kind that telegraphs just how well fucked she’s been. No. It’s a gloating, knowing smile. Although her fingers tremble in nerveless aftershocks, she neatly stacks a series of cleaned tubes that belong to your ship’s engine.");
	output("\n\nShekka gently pushes you back with her feet, letting your soaked [pc.cocks] fall away. She pulls herself up onto her workbench, rubbing her belly, a slightly vacant look in her eyes. <i>“I think we both won that little competition.”</i>");
	output("\n\n<i>“Oh?”</i> you say while wiping up.");
	output("\n\nShekka nods, giggling, her hand still on her belly. <i>“Fuck yes. I prefer my work to be on the fixing side compared to the cleaning, but cumming with an armload of sweet techy goodbits? That was nirvana. I’ll make sure to keep the chores stocked up in preparation for the next visit, and we can do this every time.”</i>");
	output("\n\nYou shrug, unable to hide the grin on your face. Your [pc.cum] is pooling between her legs on her bench, and she hasn’t noticed. <i>“Sure thing, babe.”</i>");
	output("\n\nShekka doesn’t even bother cleaning herself up. She just starts tugging on her jumpsuit, making sure its tight enough against her swollen crotch to hold in every drop. Judging by the audible squish it makes as it presses against her nethers, you can only assume it caught a fair amount of liquid action itself.");
	if(pc.cumQ() >= 4000) output(" It does an impressive job of stretching to accommodate her obscenely cum-gravid gut.");
	output(" She doesn’t comment on it, instead mentioning something about showering after reinstalling the pipes, but you think she might just like the feel of her pussy swimming in it.");
	processTime(30);
	fuckedShekka();
	shekka.loadInCunt(pc,0);
	if(y >= 0) shekka.loadInAss(pc);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Bendover Fuck Futa
public function shekkaCrewFutaBendoverFuck(x:int):void
{
	clearOutput();
	showShekka(true);
	author("Fenoxo and SKoW");
	output("Although it’s far smaller than the one in her warehouse, you flip Shekka around and nudge her towards the bench. There’s a small gasp and she has to wiggle her hips to keep her thick horse-cock from getting trapped against furniture. <i>“Go ahead and work on... whatever that piece of my ship is. Just let me do all the work.”</i> Your fingers trace up her spine to her neck where a small, hidden clasp resides. Shekka shivers in anticipation once you find it. You artfully twist your thumb and index finger, releasing the catch and revealing her jumpsuit’s seam. The fabric parts slowly, opening just enough to let her pale crimson flesh peek through, the light sparkling off glossy scales as they’re exposed. <i>“Well? I’m waiting. I want to see maximum satisfaction here.”</i>");
	output("\n\nShekka, usually sassy and quick to react, looks at you uncertainly. Her tail swishes back and forth nervously, but she does as you ask, plucking up some (frankly expensive looking) parts from all over her workbench into a smile pile before you. A moment later, her confident smile returns. She presses her large rump back against you, curling her tail around your side so as not to interfere with the soft, sensuous press of her buttocks against your package. With just an earnest flex, her cheeks squeeze your [pc.cocks] harder.");
	output("\n\nOhhh, that feels nice. Blood surges to your genitals, and your breath shortens as your heartbeats accelerate. Grunting softly, you grab hold of her slowly releasing suit by its edges and tug, baring her shoulders in an instant. The edge of the fabric catches on her nipples, revealing the soft, eggplant-colored areolae a second before the tips of her nipples pop out over the edge. From there, it’s easy to peel the obstructing garment down past Shekka’s bare belly to her hips. The fit is much tighter there (even more so with her additional endowment) and the press of her expansive ass against your [pc.cocks] makes choosing between continuing to grind against her or getting her out of her clothes an agonizingly difficult decision.");
	output("\n\n<i>“What’s the matter?”</i> Shekka wonders, applying some ED-80 to a particularly tight fixture to loosen the screws. <i>“Having a little trouble with unwrapping me?”</i>");
	if(pc.hasCock() || pc.hasVagina()) 
	{
		output(" She brings her tail up");
		if(pc.legCount > 1) output(" between");
		else output(" around");
		output(" your [pc.legOrLegs] to slide alongside ");
		if(pc.balls > 0) output("your [pc.sack]");
		else if(pc.hasVagina()) output("[pc.oneVagina]");
		else output("your [pc.base " + x + "]");
		output(".");
	}
	else output(" She curls her tail around to tease your [pc.asshole], the tip circling around the edge of your ring.");
	if(!pc.isNude()) output(" <i>“You haven’t even gotten yourself naked yet.”</i>");
	//Not naked yet
	if(!pc.isCrotchExposed())
	{
		output("Shuddering, you respond to her critique by stepping back and tearing out of your [pc.crotchCovers] in seconds, tossing the obstructing equipment back towards your ship’s hold. You ask, <i>“How’s that?”</i> though it’s revealed as a prideful hypothetical when your exposed form presses back against hers.");
	}
	//Merge
	output("\n\nYou press your [pc.cocks] harder against her - hard enough ");
	if(pc.cockTotal() > 1) output("for one ");
	output("to tease her clenching ring. Shifting the angle, you thread yourself lower between her thighs, pressing your length against the bump of her rear clit. Your dick is enveloped in the feeling of her suit sinking into her slit as you tease her, and the contours of her turgid balls are pushed slowly out of the way. Shekka’s busy motions on the table slow before being interrupted by an instinctive twitch of pleasure. The sound of her moan is muffled by her tightly-closed lips, but you hear it nonetheless.");
	output("\n\n<i>“What’s the matter?”</i> it’s your turn to ask. <i>“No wonder you used to be so worried about sex interfering with your work. All it takes is a little rub on one of your knobs to interrupt you.”</i>");
	output("\n\nShekka picks up the pliars she just dropped and grits her teeth. <i>“It... it just slipped is all!”</i> She goes back to work, pausing to whimper every now and again when [pc.oneCock] grinds against her clitty in a particularly delicious way. <i>“I’ll have finished cleaning this before you figure out how to... mmm... fuck my pussy.”</i> She glances over her shoulder to stick her tongue out at you and wink. That lengthy tongue shivers across her lips sensuously on the next thrust before she turns away once more. The little slut is egging you on!");
	output("\n\nTaking one hand off her skin-tight suit, you press your palm to her [shekka.belly], sliding it down to her cock. The massive (especially on a Raskvel) stallion-prick flops out from its confines, freeing up the musky scent of a horny herm accompanied by the dripping of thick beads of pre. She lets out a low, slow groan, before your hand wraps around her sheath, peeling it down in a quick, wet jerk.");
	output("\n\nYou might as well have crammed her down onto an arm-length dildo judging by the way her cunt tightens around the head of your dick, squeezing you through her suit. Shekka barks, <i>“Fuck, [pc.name]! Ung! T-take it easy, oooookay?”</i> Her gratuitous hips give a sexy wiggle, wanting more.");
	if(silly) output(" Those hips don’t lie.");
	output("\n\n<i>“Are you sure?”</i> You press and rub her from both sides, trailing down her shaft to grope and knead her churning balls while working to peel her out of her jumpsuit. It’s slower going with just the one free hand, but you manage to time each tug with every twitch and buck. The alabaster fabric rolls halfway down her ass before catching between your paired forms. The front hangs loose, trapped between your knob and her sack. Somehow she’s managed to oil up some steel wool, grinding it around the inside of some gunked up seams.");
	output("\n\n<i>“Y-y-yes,”</i> Shekka answers, letting the cleaning wool drop from between her fingers. Not because of the overwhelming feelings coming from her thighs, or the way your eager hand milks more juicy horse-pre out of her, but because she’s finished with it. It’s hard to tell if she was answering your question or merely giving voice to her pleasure. Upon reflection, you realize that it doesn’t really matter much either way. Your [pc.cocks] ");
	if(pc.cockTotal() == 1) output("is as hard as a titanium bar");
	else output("are as hard as titanium bars");
	output(", and there’s no way you’re going to pass up on your raskvel honey’s pussy.");

	output("\n\nYou pull away from the fidgeting mechanic. Her hands are shaking as she swaps components, and her breath is as ragged as and endurance runner’s. She’s still managing to do her work, though. The jumpsuit gives way around her hips, stretching before rolling down her scaly hips. It clings to her sopping-wet slit in liquid-assisted defiance before finally breaking away, carrying a glossy sheen as a memento of its time wedged into her crotch. You grunt in appreciation of the fine ass you’ve revealed while you push her clothing to the ground.");
	output("\n\nShekka’s tail pats the side of your face, right on your cheek, and she purrs, <i>“Mmmm, good [pc.boyGirl], but I think I might get this repaired before you can cum inside me.”</i> The naughty little limb snakes down your neck to your chest then around to your [pc.butt]. It slaps you for good measure. <i>“If this is the best you’ve got, maybe I should just let you at me the whole damn day. I could get so much done before you even wring a single orgasm out of my dripping... wet... cunt.”</i> She steps further apart to show you just how wet she’s become.");
	output("\n\nOh wow, is it ever. Her violet lips are absolutely sopping. Beads of clear lubricant hang from her labia as rain clings to a spider’s web. Plump and engorged, her meaty vulva is begging for a fuck. Both her clits are jutting out from between the soaked lips, and droplets hang on slick strands from them, sometimes releasing to patter on the floor. A small puddle has formed beneath the juicy raskvel, matching the one in her suit, proof of just how badly she needs you to fuck her.");
	output("\n\nAlong with all of that her meaty balls sway and twitch in time with her heartbeat, and her member is forced to point directly down to the floor, flaring eagerly and begging to be milked.");
	output("\n\nIt’s too much: her taunting words, the tantalizing gates of pleasure so close that can feel the heat steaming off of them, and the submissive, bent-over pose. Even if you were determined not to fuck her, you couldn’t stop your [pc.hips] from lurching forward. You couldn’t stop your [pc.cock " + x + "] from spreading them wide");
	var y:int = -1;
	if(pc.cockTotal() > 1) 
	{
		y = pc.cockThatFits(shekka.analCapacity());
		if(y == x) y = pc.cockThatFits2(shekka.analCapacity());
		if(y == x) y = -1;
	}
	if(y >= 0) output(" or your [pc.cock " + y + "] from battering into her tight asshole");
	output(". You certainly wouldn’t be capable of holding back the growl that rips its way out of your throat as your body asserts its primal need to fuck and breed the female its been presented with.");
	pc.cockChange();

	output("\n\nShekka’s legs slam against her little table as you take her from behind, pressing on her hard enough that she winds up wrapping her perky chest around a pipe like an impromptu tit-fuck. Her lips cling to your piston like oiled cylinder walls, and as you really start to give it to her they only seal tighter around you. Every forceful thrust is accompanied by lurid squelches, every cock-hilting thrust matched by affectionate, muscular squeezes from Shekka’s box. The impacts cause you to bump her rearward clit repeatedly, and she moans each time. At the same time, you press down on her back with one hand while the other sneaks down, capturing her turgid mast.");
	output("\n\nHer voice turns into an orchestra of lurid moans as her pleasure is doubled up; a teasing pinky toys with her stretchy cumslit, before trailing down to the base fast enough to make her balls slap into her frontward clit.");
	output("\n\nYou settle into an easy musical rhythm. Her swaying, pierced ears provide a pleasant jingling background while her staccato moans provide proof positive that’s getting the hard fucking she wanted. Shekka’s petite body feels almost entirely wrapped around your [pc.cock " + x + "] even though such a thing is impossible. Her tail is wrapped around your waist encouragingly, helping you to thrust into her as hard as absolutely possible.");
	output("\n\nThere would be cause for concern about bruising her if not for the way your busily-jerking arm keeps her thighs from smashing into the table too hard. Not that she would stop in such a case; she’d tell you to get back to work. After all, she’s working.");
	output("\n\nIt’s hard to tell if she’s still working, actually. She did manage unwedge the cylinder from between her perky tits at least. Damn, her nipples look hard. And she seems to be trying to place it aside and get her hands on another, but she keeps throwing back her head and moaning. Her free hand keeps knocking over the little bottle of cleaning fluid and scrabbling against the workbench’s hard metal surface. Shekka might have made some good progress on her toy, but there’s no way she’s going to finish it in this condition.");
	output("\n\nYou’d steal that stuff for lube if not for the fact you’re one-hundred percent sure if it’s for stripping metal clean, it doesn’t belong on a junker-slut Raskvel’s futa-junk. To be fair, there isn’t much need for it. The moisture from her own slobbering cunt drip down the back of her balls and into your waiting palm, happy to be used as lotion for her impromptu hand-job.");
	output("\n\nShe’s little more than a slutty mess of fuckjuice and pleasure now - a tingling bundle of nerves spasming around your ");
	if(y >= 0) output("doubled dicks");
	else output("[pc.cock " + x + "]");
	output(" in an effort to please you. Her tongue lolls out of her mouth. There’s at least half a foot of organ there, and you wonder how hard it would be for the little gadget-slut to suck herself off, perhaps tonguefuck that stretchy stallion cum-slit. Holding her by the hips, you pound away, feeling her start to orgasm underneath you, gushing fluid over your [pc.knot " + x + "]");
	if(y >= 0) output(" and clenching around your [pc.cock " + y + "] with her pucker");
	output(". Right now, she’s the perfect little sextoy, and you’re using her like one.");

	output("\n\nThick sweet orgasmic wetness is dredged up from her pussy as her body loses temporary track of its inhibitions, and your [pc.footOrFeet] are splashed with hot alabaster Shekka-cum. You refuse to let up on her cock however, and each of your thrusts is accompanied by a long jerk and another rope of cum.");
	output("\n\nFuck, she’s getting tighter every time! It’s actually starting to get hard to pull out of her, and the soaking-wet girl goo bathing you is challenging you to erupt. No, worse than that, her whole body is begging for a thick wad of your [pc.cumNoun]");
	if(y >= 0) output(" - even her ass");
	output(".");

	output("\n\nShekka babbles in a brief interlude between orgasms, <i>“Fucking fuck me! Cum!”</i> Of course, her pink eyes roll back and a second later, and her words transform into poorly enunciated \"yes\"es and \"ahh\"s of pleasure. Bending low over top of her, you feel the rising heat inside you, signaling that your own release is soon at hand. You wrap an arm under her chest, lifting her to press against your [pc.chest]. Her cock flails freely in the air, and you point it away from her bench before it has a chance to make a mess of her bits and pieces. Grabbing tight, your palm encircles her breast, and you bottom out one last time");
	if(pc.hasKnot(x))
	{
		output(", your expanding knot");
		if(pc.hasKnot(y)) output("s");
		output(" slipping in");
	}
	output(".");

	var knot:Boolean = false;
	var knots:Boolean = false;
	if(pc.hasKnot(x)) knot = true;
	if(y >= 0)
	{
		if(pc.hasKnot(y)) knot = true;
		if(pc.hasKnot(x)) knots = true;
	}
	if(knot) 
	{
		output(", your expanding knot");
		if(knots) output("s");
		output(" slipping in");
	}
	output(".");

	//The knots have it
	if(knot)
	{
		output("\n\nThe feeling of seating yourself deeply inside her and being locked in place by your expanding biology only makes your climax that much hotter.");
		if(knots) output(" Doing that to both her holes at once is even better.");
		if(pc.cumQ() < 10)
		{
			output(" Dribs and drabs of [pc.cum] leak out from your ");
			if(y >= 0) output("doubled dicks");
			else output("[pc.cock " + x + "]");
			output(", oozing in thin flows into her oh-so-receptive body. You run out long before the ecstasy subsides. Perhaps you should let your [pc.balls] rest a bit in between orgasms.");
		}
		else if(pc.cumQ() < 25)
		{
			output(" Spurts of [pc.cum] splatter into her waiting body with explosive eagerness, your [pc.hips] twitching a little further forward with each successive ejaculation.");
		}
		else if(pc.cumQ() < 250)
		{
			output(" Thick blobs of [pc.cumNoun] explode out of you one after another, bathing Shekka’s interior");
			if(y >= 0) output("s");
			output(" in a thick coat of your [pc.cumColor] love. You hold position, secure in the knowledge that your knot");
			if(knots) output("s");
			output(" will pin every drop inside her.");
		}
		else if(pc.cumQ() < 4000)
		{
			output(" Massive blobs of [pc.cum] pour out of you, so voluminous that each barely has time to finish before the next ejaculation is erupting like a volcano. Poor Shekka’s body is absolutely filled with your [pc.cumColor] seed.");
			if(y >= 0) output(" Her belly even rounds from the combined injections.");
		}
		else
		{
			output(" Gigantic blasts of [pc.cum] force their way into Shekka’s eager tunnel");
			if(y >= 0) output("s");
			output(" packing ");
			if(y >= 0) output("them ");
			else output("it ");
			output("full with the first few injections. The next ones, sealed in by your knot");
			if(y >= 0) output("s");
			output(", swell her [shekka.belly] with added weight, giving her a positively pregnant appearance.");
			if(!knots && y >= 0) output(" Sadly, you don’t have knots to plug both sides, and waves of hot-pumping [pc.cumNoun] vent out over one of your [pc.cocks].");
			if(pc.cumQ() >= 9000) output(" Her wobbly, spunk-stuffed tummy grows so big that you worry for her health, but by then the fluid distention widens her passage enough for streams of it to sluice out over your crotch, venting the pressure.");
		}
		output("\n\nYou go limp, your ardor spent, but your knot");
		if(knots) output("s hold");
		else output(" holds");
		output(" you secure inside of her, giving you time to appreciate the outlines of her shoulderblades and the natural fragrance of her feathery hair.");
		output(" Each tiny shift of your body brings with it an accompanying grunt from Shekka, and a helpless twitch from her overwrought cock.");
		if(pc.cumQ() >= 4000) output(" Although her body is weighed down by the sheer quantity of your [pc.cum], h");
		else output("H");
		output("er balls tighten up against her dick, a whole lot lighter than they were before your tryst.");
	}
	//No knot for you, come back next year.
	else
	{
		output("\n\nHer wet, milking walls coax you to a glorious a climax");
		if(y >= 0) output(", and the way her asshole is tugging at your dick doesn’t hurt either");
		output(". ");
		if(pc.cumQ() < 10) 
		{
			output("Dribs and drabs of [pc.cum] leak out from your ");
			if(y >= 0) output("doubled dicks");
			else output("[pc.cock " + x + "]");
			output(", oozing in thin flows into her oh-so-receptive body. You run out long before the ecstasy subsides. Perhaps you should let your [pc.balls] rest a bit in between orgasms.");
		}
		else if(pc.cumQ() < 25) 
		{
			output("Spurts of [pc.cum] splatter into her waiting body with explosive eagerness, your [pc.hips] twitching a little further forward with each successive ejaculation.");
		}
		else if(pc.cumQ() < 250)
		{
			output("Thick blobs of [pc.cumNoun] explode out of you one after another, bathing Shekka’s interior");
			if(y >= 0) output("s");
			output(" in a thick coat of your [pc.cumColor] love. You hold position, feeling some of it slop back out around your [pc.cock " + x + "], ");
			if(pc.balls == 0) output("running down your [pc.leg].");
			else output("clinging to your [pc.sack] to make it shine with sex.");
		}
		else if(pc.cumQ() < 4000)
		{
			output("Massive blobs of [pc.cum] pour out of you, so voluminous that each barely has time to finish before the next ejaculation is erupting like a volcano. Poor Shekka’s body is absolutely filled with your [pc.cumColor] seed.");
			if(y >= 0) output(" Her belly even rounds from the combined injections.");
		}
		else
		{
			output("Gigantic blasts of [pc.cum] force their way into Shekka’s eager tunnel");
			if(y >= 0) output("s");
			output(" packing ");
			if(y >= 0) output("them ");
			else output("it ");
			output(" full with the first few injections. The next ones, heavy as they are, swell her [shekka.belly] with added weight, giving her a positively pregnant appearance. Waves of excess, hot-pumping [pc.cumNoun] vent out over your [pc.cocks] as you continue to ejaculate, sluicing down your ");
			if(pc.balls > 0) output("[pc.balls]");
			else output("[pc.leg]");
			output(".");
			if(pc.hasCockFlag(GLOBAL.FLAG_FLARED)) output(" Your flared tip makes sure a fair portion of it shoots directly against her cervix.");
		}
		output("\n\nYou go limp, your ardor spent and your softening length");
		if(y >= 0) output("s");
		output(" slipping halfway out of her. You take the moment to appreciate the shapeliness of her shoulder blades and the natural scent of her feathery hair air.");
		if(pc.cumQ() >= 4000) output(" Although her body is weighed down by the sheer quantity of your [pc.cum], h");
		else output("H");
		output("er balls tighten up against her dick, a whole lot lighter than they were before your tryst.");
	}
	//Merge
	output("\n\nAfter a while of holding her like this, she comes down from her own plateau and cranes her head around to look at you, smiling. It isn’t a mere sated smile either - the kind that telegraphs just how well fucked she’s been. No. It’s a gloating, knowing smile. Although her fingers tremble in nerveless aftershocks, she licks her fingers clean of cream and neatly stacks a series of cleaned tubes that belong to your ship’s engine.");
	output("\n\nShekka gently pushes you back with her feet, letting your soaked [pc.cocks] fall away. She pulls herself up onto her workbench, rubbing her belly, a slightly vacant look in her eyes. <i>“I think we both won that little competition.”</i>");
	output("\n\n<i>“Oh?”</i> you say while wiping up.");
	output("\n\nShekka nods, giggling, her hand still on her belly. <i>“Fuck yes. I prefer my work to be on the fixing side compared to the cleaning, but cumming with an armload of sweet techy goodbits? That was nirvana. I’ll make sure to keep the chores stocked up in preparation for the next visit, and we can do this every time.”</i> Her cock pulses in agreement, shining with her own juices and your mixed cums.");
	output("\n\nYou shrug, unable to hide the grin on your face. Your [pc.cum] is pooling between her legs on her bench, and she hasn’t noticed. <i>“Sure thing, babe.”</i>");
	output("\n\nShekka doesn’t even bother cleaning herself up. She just starts tugging on her jumpsuit, making sure it’s tight enough against her swollen crotch to hold in every drop. There is a moment of effort on her part to tuck her equine endowment back against her thigh where it belongs.");
	output("\n\nJudging by the audible squish her suit makes as it presses fully home against her nethers, you can only assume it caught a fair amount of liquid action itself. ");
	if(pc.cumQ() >= 4000) output("It does an impressive job of stretching to accommodate her obscenely cum-gravid gut. ");
	output("She doesn’t comment on it, instead mentioning something about showering after reinstalling the pipes, but you think she might just like the feel of her pussy swimming in it.");
	processTime(30);
	fuckedShekka();
	shekka.loadInCunt(pc,0);
	if(y >= 0) shekka.loadInAss(pc);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Trib Vibrator Tail
public function tribCrewVibeyVibe():void
{
	clearOutput();
	showShekka(true);
	author("Fenoxo & SKoW");
	var x:int = rand(pc.totalVaginas());
	output("<i>“Let’s have a little bit of girlish fun, just you and me,”</i> you offer, trailing a finger down your midriff pointedly.");
	output("\n\nShekka grins wickedly, and her tail gently swats your [pc.butt]. Although you’ve proven your sexual proficiency before, she still delights in challenging you. <i>“We’ll just have to see if you can keep up with me.”</i>");
	output("\n\nYou ");
	if(pc.tallness >= 72) output("drop low to ");
	output("grab her around the waist, pulling her up into a surprise kiss - payback for the touch of her teasing tail. Her lips are soft against your own, compressed down by the force of the kiss, but her long, sinuous tongue winds into your own mouth, its pernicious wiggling inciting your [pc.tongue] into a dance.");

	//Aphrodisiac
	if(pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED)) output("\n\nThe chemical load hidden in your saliva hits the small woman like a dumptruck of fuck-hungry hormones. She squirms against you, pupils turning to dinner plates as her brain goes into overdrive. Her salivation redoubles, and her fingers dig into your [pc.chest] as she’s taken on a wild ride.");
	//Else
	else output("\n\nYou grab her by the back of the neck, the pink feathers of her hair soft between your fingers, and press her closer, tighter, her budding breasts against your [pc.chest].");
	//Merge
	output("\n\nHer breathing comes in short gasps between your entwined lips as she whimpers into your touch, but eventually her fingers get to work");
	if(!pc.isCrotchExposed()) output(", moving amidst your [pc.crotchCovers], exposing your [pc.skinFurScales] with deft contortions of her fingers");
	else output(", moving over your [pc.skinFurScales]");
	output(", crawling over your body to your [pc.nipples]. They gently tweak them while her tongue curls around your own, filling your mouth with inch after inch of the pliable organ.");
	if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output(" Your own flexible [pc.tongue] returns the efforts, turning your oral play to a helix of muscle.");
	output("\n\nThe two of you stagger around as Shekka’s hands grasp and squeeze at your [pc.ears], until ");
	output("your [pc.legOrLegs] ");
	if(pc.legCount == 1) output("is");
	else output("are");
	output(" unsteadily wobbling as you try to focus on twisting tongues and the slim fingers prodding at your");
	if(!pc.isCrotchExposed()) output(" increasingly nude");
	output(" form.");

	output("\n\nThe raskvel rides you like a bucking bronco, taking you to the ground once your excitement overwhelms your motor control. She breaks the kiss at last with a satisfied sigh. Her lips are glossy with shared saliva, and her meager chest is heaving with panting breaths. ");
	if(pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED)) output("After ingesting so much of your aphrodisiac saliva, her jumpsuit audibly squishes when she squirms ontop of you. ");
	output("Shekka grins and raises a finger to the neckline of her jumpsuit. <i>“Just a little bit of girlish fun.”</i> The suit parts, a line opening up down the center of her chest. She ");
	if(pc.biggestTitSize() < 1) output("greedily caresses your own, letting her fingernail dig in just a little.");
	else output("greedily gropes your tits, squeezing and caressing the orbs impulsively.");
	output(" <i>“Just a little bit.”</i>");

	output("\n\nThe slowly opening divide in the alabaster fabric widens with torturous slowness, but it affords you a detailed view of Shekka’s reddish scales and well-formed breasts. You grab hold of it on both sides and tug. It gives as if there was never anything holding it at all, allowing you to to yank it down to her flared hips in an instant. The raskvel’s puffy nipples pebble in your ship’s atmosphere and you let go of her suit to brush one with your thumb, eliciting a gasp of delight from the tiny alien.");

	output("\n\nShekka giggles and squirms, but she lifts her shapely bottom up off of you to to aid you in disrobing her. You tug it down her legs to her knees before giving up on the current positioning and rolling, pinning her underneath you so that you pull the offending garment entirely away. You toss it over your shoulder, and it lands in a shimmery heap, it’s owner naked and vulnerable below. You echo, <i>“A little fun,”</i> now that you’re above her, your [pc.vaginas] close enough to hers to kiss, the glittering wetness of your anticipation hanging from a [pc.clit] like a drop of dew.");
	output("\n\nHer tail curls up between your bodies to bar her violet entrance from sight. She giggles playfully, then bucks her hips upward, slamming the slightly-ridged texture of her tail into [pc.oneVagina]. You gasp in surprise and pleasure. The sudden press of her warm body against your entrance is at once tantalizing and mildly painful - more the former than the latter. Then, with a knowing grin, Shekka closes her eyes, an expression of pleased focus on her features.");
	if(flags["TIMES_TAILVIBED_WITH_SHEKKA"] != undefined)
	{
		output("\n\nYou remember the vibrator in her tail a second before it activates, but nothing could prepare you for how good her scales feel buzzing against your puffy, aroused entrance.");
	}
	//Not before
	else output("\n\nYou look on in confusion, but her tail answers your unspoken question with a powerful, throbbing buzz, vibrating wildly against your puffy, aroused entrance. It obviously has some kind of implant that lets it shake so... so... well.");
	output("\n\nA high pitched whimper slips from your lips while your [pc.hips] react to the pleasure with an instinctive, powerful thrust, pinning the ");
	if(pc.tallness >= 55) output("smaller");
	else output("equally small");
	output(" mechanic to the ground with your creaming-wet pussy, wrapping half of her tail with your folds. On the other side, her immensely engorged labia spread until you can feel them kissing around the trembling intruder. Both pussies lock into a sopping-wet embrace around her vibrating tail; you barely seem to be different creatures. Where once there were two aroused beings, there remains only a single, writhing beast of sapphic desire.");
	output("\n\nThe buzz of her tail quiets, drowned in a sea of feminine lubricants, but you are far from idle. Supporting yourself with one hand, you reach for one of Shekka’s breasts, grabbing on for dear life. It’s soft and supple, blushing hotly. You can feel the little Raskvel’s tiny heart hammering in her chest as you squeeze. The eager pushes and prods of her own fingers against your [pc.chest] abate. Instead, her arms close around your neck and pull you into her, kissing you once more. Her nails dig into your back, but your sense of pain is deadened by white hot bar of pleasure assailing your loins.");
	//Aphrodisiac
	if(pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED)) output("\n\nShe drinks down another dosage of chemical lust from your mouth, and her eyes roll back. Squirts of pleasure fountain out from around your pressed pussies as she tumbles headlong into an unexpected orgasm.");
	//Else
	else output("\n\nDamn, Shekka’s tongue is long. She could probably loop it around your tonsils if she wanted to, but she seems content to slide it against your mouth’s muscle, curling and squeezing it, sometimes constricting, boa-like around it.");
	//Merge
	output("\n\nYou lose yourself in the tangle of limbs, the ecstasy of one body pressed against another and the constant vibrations torturing your [pc.clit] with pleasure. The room seems to be spinning.... Wait, it is spinning!");
	output("\n\nWith a wicked grin Shekka pins you flat on your back, but it frees you to reach down and grab her ass, to feel her cheeks twitch and her muscles dance when a spasm of uncontrollable sexual energy convulses through her hips. She squirms, moaning into you. Your hands pull her harder against you, increasing the force of the tremors wracking your cunt - and hers. The scaley slut screams into your mouth and finally breaks the kiss, shrieking into your shoulder as she cums");
	if(pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED)) output(" yet again");
	output(". Her juices spatter over your [pc.legs] like rain from a typhoon. It’s all you can do to steady her thrashing form from tumbling to the floor while avoiding a cunt-wrenching cum all your own.");

	output("\n\nNervelessly fluttering, Shekka’s fingers telegraph her orgasm directly into your [pc.chestNoun], catching on your [pc.nipples] and pressing into the soft, nerve-packed tips. You close your eyes and grit your teeth, holding yourself back from the edge by sheer force of will. The petite beauty above twists and wiggles through euphoric spasms, secure in your arms, juicing twat still pressed to yours around the intrusive wiggling of her tail. You press your lips to hers in a tender kiss, and she slowly stills, only occasionally trembling through aftershocks.");
	output("\n\nStill holding tight to her, you feel the heated waves of ecstasy fluttering in your nethers, as irresistible as the ocean tides. The cunt-clenching tsunami crashes over your crumbling wall of willpower, bathing everything in tidepools of pleasure. Your eyes roll back a second before Shekka’s clear.");
	output("\n\nDredging through her own orgasmically-blown mind, the crafty girl acts as soon as she realizes what’s going on. Her tail, once a passive participant for you to grind against, slithers into your [pc.vagina " + x + "], still vibrating. Your convulsing, bliss-filled walls clamp onto it. You can feel the vibrations carry through your pliant, clinging flesh all the way to your [pc.clits].");
	if(pc.hasCock()) 
	{
		output(" Your [pc.cocks], pinned between the two of you, spurt");
		if(pc.cockTotal() == 1) output("s");
		output(" your [pc.cum] between your slick, squirming forms, simultaneously forgotten and yet adding another layer of bliss to your overpowering release.");
	}
	//Cuntchange
	pc.cuntChange(x,5,true,true,false);
	output("\n\nYou twist on the floor, the raskvel riding you, pumping you wildly. The air fills with the high-pitched sounds of your passion and the scent of your mixed secretions almost seems to steam the air around your sweaty, entwined bodies. Shekka pulls partway out to hold her tip against");
	if(pc.hasClit()) output(" [pc.oneClit]");
	else output(" your lips");
	output(", and the vibrating length drives your consciousness away in an explosion of ecstasy.");
	processTime(40+rand(10));
	pc.orgasm();
	chars["SHEKKA"].orgasm();
	clearMenu();
	addButton(0,"Next",shekkaGrindsFinish);
}


public function shekkaCrewGrindsFinish():void
{
	clearOutput();
	showShekka(true);
	author("Fenoxo & SKoW");
	output("You come to feeling wet and sticky all over, a small form perched atop you. Its brilliant, exuberant eyes blink at you, and your groggy mind identifies it as Shekka. She giggles, kissing you on the lips once more before standing up and offering a hand");
	if(pc.tallness >= 60) output(", a gesture that’s almost comical given the size difference");
	output(".");
	if(pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED)) output(" She sways slightly, hips wiggling and ready to pounce from the sample of your sinfully sensuous saliva.");

	output("\n\n<i>“Wow,”</i> you pant, still a little stunned.");

	//Never had vibrations before
	if(flags["TIMES_TAILVIBED_WITH_SHEKKA"] == undefined)
	{
		flags["TIMES_TAILVIBED_WITH_SHEKKA"] = 0;
		output("\n\nShekka beams. <i>“Subdermal vibrator implant.”</i>");
		output("\n\nThere’s no hiding your surprise.");
		output("\n\n<i>“What? You don’t have those back home?”</i>");
		output("\n\n<i>“No,”</i> you answer. At least, you’re pretty sure you don’t. You haven’t seen one before, anyway.");
		output("\n\nShe waggles her wiggly little appendage. <i>“Well, it’s nice, isn’t it?”</i>");
		output("\n\nIt is indeed.");
	}
	//Had 'em before
	else
	{
		output("\n\nShekka smirks as you get up on");
		if(pc.legCount == 1) output(" your");
		output(" wobbly [pc.legOrLegs]. <i>“It was only a little fun....”</i>");
		output("\n\nYou roll your eyes. <i>“It’s a good thing you’re not any bigger then! I’m not sure I could handle any more of you vibrating like that.”</i>");
	}
	output("\n\nShe snorts in amusement, scooping a mixture of your sexual juices from your [pc.tummy] before noisily slurping it up. Gathering your things, you and the little raskvel make yourselves as decent as you can, though the scent of your recent lovemaking is a practical fog in the suddenly far-too-stuffy engine room.");
	if(celiseIsCrew()) output(" Maybe you’ll have Celise do a quick roll-through here. It’s more than likely Shekka could use a dip in your gooey fuck-friend too.");
	output("\n\n<i>“Fuck... well, okay [pc.name] I’m going to wrap up a few things here, and strongly consider a nap.”</i>");
	//Pass 70-80 minutes
	//Orgasm + shekka orgasm
	flags["TIMES_TAILVIBED_WITH_SHEKKA"]++;
	fuckedShekka();
	//Pass 70-80 minutes
	processTime(30+rand(5));
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Trib Vibrator Tail Futa
public function shekkaCrewFutaTailTrib():void
{
	clearOutput();
	showShekka(true);
	var x:int = rand(pc.totalVaginas());
	output("<i>“Let’s have a little bit of girlish fun, just you and me,”</i> you offer, trailing a finger down your midriff pointedly.");
	output("\n\nShekka grins wickedly, and her tail gently swats your [pc.butt]. Although you’ve proven your sexual proficiency before, she still delights in challenging you. <i>“And leave this big boy out? A shame, but we’ll just have to see if you can keep up with me.”</i> She pointedly grasps the bulge straining against her thigh.");
	output("\n\nYou ");
	if(pc.tallness >= 72) output("drop low to ");
	output("grab her around the waist, pulling her up into a surprise kiss - payback for the touch of her teasing tail. Her lips are soft against your own, compressed down by the force of the kiss, but her long, sinuous tongue winds into your own mouth, its pernicious wiggling inciting your [pc.tongue] into a dance. The sheer fabric of her suit does nothing to hide the sultry heat of her futa-prick digging into your [pc.tummy], but the little Raskvel unabashedly grinds herself against you.");

	//Aphrodisiac
	if(pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED)) output("\n\nThe chemical load hidden in your saliva hits the small woman like a dumptruck of fuck-hungry hormones. She squirms against you, pupils turning to dinner plates as her brain goes into overdrive. Her salivation redoubles, and her fingers dig into your [pc.chest] as she’s taken on a wild ride.");
	//Else
	else output("\n\nYou grab her by the back of the neck, the pink feathers of her hair soft between your fingers, and press her closer, tighter, her budding breasts against your [pc.chest].");

	//Merge
	output("\n\nHer breathing comes in short gasps between your entwined lips as she whimpers into your touch, but eventually her fingers get to work");
	if(!pc.isCrotchExposed()) output(", moving amidst your [pc.crotchCovers], separating it from your [pc.skinFurScales] with deft contortions of her fingers");
	else output(", moving over your [pc.skinFurScales]");
	output(", crawling over your body to your [pc.nipples]. They gently tweak them while her tongue curls around your own, filling your mouth with inch after inch of the pliable organ.");
	if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output(" Your own flexible [pc.tongue] returns the efforts, turning your oral play to a helix of muscle.");
	output("\n\nThe two of you stagger around as Shekka’s hands grasp and squeeze at your [pc.ears], until your [pc.legOrLegs] ");
	if(pc.legCount > 1) output("are");
	else output("is");
	output(" unsteadily wobbling as you try to focus on twisting tongues and the slim fingers prodding at your");
	if(!pc.isCrotchExposed()) output(" increasingly nude");
	output(" form.");

	output("\n\nThe raskvel rides you like a bucking bronco, taking you to the ground once your excitement overwhelms your motor control. She breaks the kiss at last with a satisfied sigh. Her lips are glossy with shared saliva, and her meager chest is heaving with panting breaths. ");
	if(pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED)) output("After ingesting so much of your aphrodisiac saliva, her jumpsuit audibly squishes when she squirms ontop of you. ");
	output("Shekka grins and raises a finger to the neckline of her jumpsuit. <i>“Just a little bit of girlish fun.”</i> The suit parts, a line opening up down the center of her chest. She ");
	if(pc.biggestTitSize() < 1) output("greedily caresses your own, letting her fingernail dig in just a little.");
	else output("greedily gropes your tits, squeezing and caressing the orbs impulsively.");
	output(" <i>“Just a little bit.”</i>");

	output("\n\nThe slowly opening divide in the alabaster fabric widens with torturous slowness, but it affords you a detailed view of Shekka’s reddish scales and well-formed breasts. You grab hold of it on both sides and tug. It gives as if there was never anything holding it at all, allowing you to to yank it down to her flared hips in an instant. The raskvel’s puffy nipples pebble in your ship’s atmosphere and you let go of her suit to brush one with your thumb, eliciting a gasp of delight from the tiny alien.");

	output("\n\nShekka giggles and squirms, but she lifts her shapely bottom up off of you to to aid you in disrobing her. You tug it down her legs to her knees, allowing her cock free to slap down onto your [pc.tummy]. <i>“Girlish fun,”</i> you retort before giving up on the current positioning and rolling, pinning her underneath you so that you pull the offending garment entirely away. You toss it over your shoulder, and it lands in a shimmery heap, it’s owner naked and vulnerable below. You echo, <i>“Just a little,”</i> now that you’re above her, your [pc.vaginas] close enough to hers to kiss, the glittering wetness of your anticipation hanging from a [pc.clit] like a drop of dew.");

	output("\n\nHer tail curls up between your bodies to bar her violet entrance from sight. She giggles playfully, then bucks her hips upward, slamming the slightly-ridged texture of her tail into [pc.oneVagina]. You gasp in surprise and pleasure. The sudden press of her warm body against your entrance is at once tantalizing and mildly painful - more the former than the latter. Then, with a knowing grin, Shekka closes her eyes, an expression of pleased focus on her features.");
	//Happened before
	if(flags["TIMES_TAILVIBED_WITH_SHEKKA"] != undefined)
	{
		output("\n\nYou remember the vibrator in her tail a second before it activates, but nothing could prepare you for how good her scales feel buzzing against your puffy, aroused entrance.");
	}
	//Not before
	else output("\n\nYou look on in confusion, but her tail answers your unspoken question with a powerful, throbbing buzz, vibrating wildly against your puffy, aroused entrance. It obviously has some kind of implant that lets it shake so... so... well.");
	output(" Shekka shudders on top of you, oozing pre freely onto your stomach");
	if(pc.biggestTitSize() >= 2) output(" to pool between the underside of your tits");
	if(pc.hasCock()) output(" before mashing against your own [pc.cock]");
	output(".");

	output("\n\nA high pitched whimper slips from your lips while your [pc.hips] react to the pleasure with an instinctive, powerful thrust, pinning the ");
	if(pc.tallness >= 55) output("smaller");
	else output("equally small");
	output(" mechanic to the ground with your creaming-wet pussy, wrapping half of her tail with your folds. On the other side, her immensely engorged labia spread until you can feel them kissing around the trembling intruder. Both pussies lock into a sopping-wet embrace around her vibrating tail; you barely seem to be different creatures.");
	output("\n\nWhere once there were two aroused beings, there remains only a single, writhing beast of sapphic desire");
	if(!pc.hasCock()) output(" adorned with a fountaining cock.");
	else output("adorned with fountaining pricks.");

	output("\n\nThe buzz of her tail quiets, drowned in a sea of feminine lubricants, but you are far from idle. Supporting yourself with one hand, you reach down and take a hold of Shekka’s equine member, wrapping your fingers around her shaft to knead at its mottled flesh. The soft spongy exterior feels deathly hot to your [pc.hand], and immediately coats your digits in musky liquid.");

	output("\n\nYou can actually feel every single one of her hammering staccato heartbeats pulsing through it as you double her pleasure. The eager pushes and prods of her own fingers against your [pc.chest] abate. Instead, her arms close around your neck and pull you into her, kissing you once more. Her nails dig into your back, but your sense of pain is deadened by white hot bar of pleasure assailing your loins.");

	//Aphrodisiac
	if(pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED)) 
	{
		output("\n\nShe drinks down another dosage of chemical lust from your mouth, and her eyes roll back. Squirts of pleasure fountain out from around your pressed pussies and thick gouts of cum splash into ");
		if(pc.biggestTitSize() >= 5) output("your massive breasts");
		else if(!pc.hasMuzzle()) output("your chin");
		else output("the underside of your muzzle");
		output(" as she tumbles headlong into an unexpected orgasm.");
	}
	//Else
	else output("\n\nDamn, Shekka’s tongue is long. She could probably loop it around your tonsils if she wanted to, but she seems content to slide it against your mouth’s muscle, curling and squeezing it, sometimes constricting, boa-like around it.");

	//Merge
	output("\n\nYou lose yourself in the tangle of limbs, the ecstasy of one body pressed against another and the constant vibrations torturing your [pc.clit] with pleasure. The room seems to be spinning.... Wait, it is spinning!");

	output("\n\nWith a wicked grin Shekka pins you flat on your back, but it frees your free hand to reach around and grab her ass, to feel her cheeks twitch and her muscles dance when a spasm of uncontrollable sexual energy convulses through her hips. She squirms, moaning into you. Your hands pull her harder against you, increasing the force of the tremors wracking your cunt - and hers. The scaley slut screams into your mouth and finally breaks the kiss, shrieking into your shoulder as she cums");
	if(pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED)) output(" yet again");
	output(". Her juices spatter over your [pc.legOrLegs] like rain from a typhoon, and rich ivory paints your upper-half. It’s all you can do to steady her thrashing form from tumbling to the floor while avoiding a cunt-wrenching cum all your own.");

	output("\n\nNervelessly fluttering, Shekka’s fingers telegraph her orgasm directly into your [pc.chest], catching on your [pc.nipples] and pressing into the soft, nerve-packed tips. You close your eyes and grit your teeth, holding yourself back from the edge by sheer force of will. The petite beauty above twists and wiggles through euphoric spasms, secure in your arms, juicing twat still pressed to yours around the intrusive wiggling of her tail. You press your lips to hers in a tender kiss, and she slowly stills, only occasionally trembling through aftershocks.");
	output("\n\nStill holding tight to her, you feel the heated waves of ecstasy fluttering in your nethers, as irresistible as the ocean tides. The cunt-clenching tsunami crashes over your crumbling wall of willpower, bathing everything in tidepools of pleasure. Your eyes roll back a second before Shekka’s clear, her knob still oozing watery aftershocks.");

	output("\n\nDredging through her own orgasmically-blown mind, the crafty girl acts as soon as she realizes what’s going on. Her tail, once a passive participant for you to grind against, slithers into your [pc.vagina " + x + "], still vibrating. Your convulsing, bliss-filled walls clamp onto it. You can feel the vibrations carry through your pliant, clinging flesh all the way to your [pc.clits].");
	if(pc.hasCock()) 
	{
		output(" Your [pc.cocks], pinned between the two of you, spurt");
		if(pc.cockTotal() == 1) output("s");
		output(" your [pc.cum] between your slick, squirming forms, simultaneously forgotten and yet adding another layer of bliss to your overpowering release. It mixes on your body in a lurid puddle of sexual heat");
		if(pc.hasFur()) output(", making an utter mess of your [pc.skinFurScales]");
		output(".");
	}
	//Cuntchange
	pc.cuntChange(x,5,true,true,false);
	output("\n\nYou twist on the floor, the raskvel riding you, pumping you wildly while her dick slaps down against you loudly. The air fills with the high-pitched sounds of your passion and the scent of your mixed secretions almost seems to steam the air around your sweaty, entwined bodies. Shekka pulls partway out to hold her tip against [pc.oneClit], and the vibrating length drives your consciousness away in an explosion of ecstasy.");
	processTime(40+rand(10));
	pc.orgasm();
	chars["SHEKKA"].orgasm();
	clearMenu();
	addButton(0,"Next",shekkaCrewFutaGrindsFinish);
}

public function shekkaCrewFutaGrindsFinish():void
{
	clearOutput();
	showShekka(true);
	author("Fenoxo & SKoW");
	output("You come to feeling wet and sticky all over, a small form perched atop you. Its brilliant, exuberant eyes blink at you, and your groggy mind identifies it as Shekka. She giggles, kissing you on the lips once more before standing up and offering a hand");
	if(pc.tallness >= 60) output(", a gesture that’s almost comical given the size difference");
	output(".");

	output("\n\n<i>“Wow,”</i> you pant, still a little stunned.");
	//Never had vibrations before
	if(flags["TIMES_TAILVIBED_WITH_SHEKKA"] == undefined)
	{
		flags["TIMES_TAILVIBED_WITH_SHEKKA"] = 0;
		output("\n\nShekka beams. <i>“Subdermal vibrator implant.”</i>");
		output("\n\nThere’s no hiding your surprise.");
		output("\n\n<i>“What? You don’t have those back home?”</i>");
		output("\n\n<i>“No,”</i> you answer. At least, you’re pretty sure you don’t. You haven’t seen one before, anyway.");
		output("\n\nShe waggles her wiggly little appendage. <i>“Well, it’s nice, isn’t it?”</i>");
		output("\n\nIt is indeed.");
	}
	//Had 'em before
	else
	{
		output("\n\nShekka smirks as you get up on");
		if(pc.legCount == 1) output(" your");
		output(" wobbly [pc.legOrLegs]. <i>“It was only a little fun....”</i>");
		output("\n\nYou roll your eyes. <i>“It’s a good thing you’re not any bigger then! I’m not sure I could handle any more of you vibrating like that.”</i>");
	}
	output("\n\nShe snorts in amusement, scooping a mixture of your sexual juices from your [pc.tummy] before noisily slurping it up. Gathering your equipment, you and the little raskvel make yourselves as decent as you can, though the scent of your recent lovemaking is a practical fog in the suddenly far-too-stuffy engine room.");
	if(celiseIsCrew()) output(" Maybe you’ll have Celise do a quick roll-through here. It’s more than likely Shekka could use a dip in your gooey fuck-friend too.");
	output("\n\n<i>“Fuck... well, okay [pc.name] I’m going to wrap up a few things here, and strongly consider a nap.”</i>");
	//Pass 70-80 minutes
	//Orgasm + shekka orgasm
	flags["TIMES_TAILVIBED_WITH_SHEKKA"]++;
	fuckedShekka();
	//Pass 70-80 minutes
	processTime(30+rand(5));
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}