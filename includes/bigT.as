/*Character Overview
Fuckhueg bull-man, 10~ ft. tall with broad shoulders and powerful muscles. Dark brown hair, blue eyes. Has a nose ring, and ring piercings at the tip of each of his ears. In his mid forties, though he doesn't quite look it. 
Mostly human; same physical manifestations as Oggy: tail, ears, horns. Has HUGE steer horns, widely placed on the sides of his head. Poke through the brim of his big, white stetson. Get caught on things all the time. Also serve as great handlebars :D.
Dresses much nicer than you'd expect. Slacks, a white button-up shirt, and a big green tie {in silly mode, has cute little cows on it}. Still wears a big fucking white stetson, though. Open carries a big honking six-gun that looks like it fires .50 Browning, and a bowie knife. 
Tattooed like a fucking Russian mobster. PC won't see any of them, except if his sleeves get rolled up or something. (Used to be a big-time boxer or something? Would be a hilarious boss in the dungeon if so!)
Big talking, hard laughing, not too bright. T.'s a gentle giant, quicker to give somebody a crushing bear hug and a slap on the back than fight. Acts like a classic large ham, doubtless to be played by BRIAN BLESSED in the movie. 
Chomps Raxxian Blue cigars, which give off a pleasant, cinnamon smell and probably won't give you cancer. Have a mildly alcoholic effect rather than normal smokiness. 
Comes from a very wealthy, very old New Texas family. Traces his line back to the captain of the colony ship that brought the original colonists to NT. There's technically an election on New Texas, but the Tees have controlled the planet for centuries more or less without interference. Nobody pays attention to politics much, and everybody knows the name "Big T." when they go to the ballot box. Has run unopposed for six terms.
No official kids, and no wife. Has lots of bastards running around, but he's not sure who's going to inherit the family name. Jokes about Gianna succeeding him. At least, he's probably joking. 
Super-de-fucking-duper pro-Treatment. Says its the best thing that's ever happened to any colony, any system. Total peace everywhere, population's nice and steady, everyone's happy. It might be a chemical happiness, but hey, what more do people need than a good fuck and good meal, huh? Says NT is a Utopia for the ages, and he encourages all the wealthiest and most powerful people of the galaxy to visit early and often (hence the PC's invite). More than a few get Treated, and the planet prospers. 
Hints at a big Treatment factory hidden under the Ranch House (secret door behind gigantic stuffed Unibear). Is super dodgy when talking about the Treatment itself, says he doesn't really KNOW what's in it or how it's made -- it just works, and that's all he cares about.
He remembers the Alamo.*/

//Room Description
function bigTOfficeBonusBullshit():Boolean
{
	output("The office of the planetary governor, Big T., is a warm, spacious office with plenty of seats and couches and several bookshelves, looking more like an aristocrat's study than a government office. The room is dominated by a huge, oaken desk facing the door, a semi-circle of wood alight with monitors, holo-displays, and other readouts, all angled towards a huge, comfy-looking chair.");
	//if T isn't dead/broken:
	if(1 == 1) output("The towering bull-like governor is sitting at his desk, busily talking and typing, managing the world's affairs all from his desk.");
	showBust("BIGT");
	showName("BIG\nT.");
	author("Savin");
	if(flags["MET_ZEPHYR"] == undefined)
	{
		TsDoorIsLocked();
		return true;
	}
	else if(flags["MET_BIG_T"] == undefined) 
	{
		introToBigTSeeMeAfterClass();
		return true;
	}
	else
	{
		addButton(0,"Big T.",repeatBigTApproach,undefined,"Big T","Go talk to the Governor");
	}
	return false;
}

function showBigT():void
{
	showBust("BIGT");
	showName("BIG\nT.");
	author("Savin");
}

function TsDoorIsLocked():void
{
	clearOutput();
	output("You pull on the door, but all it does is rattle, locked.\n\nThe secretary just laughs to herself, making her implausibly large bust wobble.");

	currentLocation = "529";
	var map:* = mapper.generateMap(currentLocation);
	userInterface.setMapData(map);

	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Intro / First Time Meeting
//Lock the door into T's office until after having spoken with the seccy. outside, set up a meet&greet.
function introToBigTSeeMeAfterClass():void
{
	clearOutput();
	showBigT();
	flags["MET_BIG_T"] = 1;
	//{Something something transition from secretary here}
	output("You step through the door into Governor Tee's office. The inside is nothing like any government office you've seen before, looking more like a hunting lodge's lobby than the soulless, bleak affairs you're familiar with from the core worlds. The room's dominated by a huge oaken desk facing the door, a semi-circle of solid hardwood inlaid with enough holo-displays to light up the room. The screens show flickering glimpses of milk production, food exports, and the comings and goings of ships from all over the planet's many towns. Hunting trophies line the room, culminating in a massive stuffed creature behind the desk, looking something like a six-legged polar bear with a unicorn's horn jamming out from its head.");
	output("\n\nPacing in front of the desk is a huge, barrel-chested bull man. He's better dressed than you might have expected, clad in slacks and a white button-up shirt, just low enough to show a forest of dark, curly chest hair over taut muscles. The only Texan thing about his is the wide-brimmed white Stetson hat he's wearing, pierced by a pair of huge steer horns growing from his brow, and the over-sized six-gun slung low on his hip. For a man of his size, though, it looks like a popgun: New Texas's governor stands a formidable ten feet in height, at the least, and taller with his horns and cowboy hat added in. He's a wrecking ball of a man, massive and muscular, all crammed into business casual wear that looks ready to burst if he takes a deep breath.");
	output("\n\nSeeing you walk in, the governor points to a headset buried in one of his bovine ears and says, \"<i>Sorry, hoss, visitors a'comin'. We'll settle up later. Yeah. Ya'll take care, now.</i>\"");
	//if PC = male:
	output(pc.mf("He clicks off the headset and thrusts his hand out beneath a big, toothy grin. <i>\"Well howdy! Welcome to New Texas, partner!\"</i>","Over your shoulder and through the door, the governor shouts, \"<i>Zephyr! You didn't say our guest was a beautiful woman!</i>\"\n\n\"<i>You say that like anything </i>else<i> walks through your damn door!</i>\" comes the answer from the lobby. Tee guffaws, waving her off and extends a hand to you."));
	output("\n\nYou shake Big T.'s hand and introduce yourself. His grip's vice-like, crushing down on you as he pumps your arm eagerly. \"<i>Outstanding! Welcome to New Texas, " + pc.mf("Mr.","Ms.") + " Steele. I'm Governor Benjamin Tiberious Tee. Though most folks 'round here just call me Big T.</i>\"");
	output("\n\nHe ushers you into a big, plush seat and plops down behind his desk, kicking his feet up and pulling a huge, blue cigar from a drawer. \"<i>Enjoyin' your stay on New Texas so far, " + pc.mf("Mr.","Ms.") + " Steele? Lemme know if there's anything you need -- or if you've got questions! Most governor's have secretaries for that sorta thing, but mine's a little ornery for it, dontcha think?</i>\"");
	output("\n\n\"<i>I can hear you!</i>\" Zephyr snorts from outside.");
	//if Silly:
	if(silly) output("\n\n\"<i>Hrm. Gotta invest in some soundproofing one of these days,</i>\" Tee grunts, scratching his beard.");
	processTime(3);
	bigTMenu();
}

function bigTMenu():void
{
	addButton(0,"Talk",talkToBigT);
	addButton(14,"Leave",mainGameMenu);
}

//Repeat Intro
function repeatBigTApproach():void
{
	clearOutput();
	showBigT();
	output("\"<i>Howdy there, Steele. Take a load off,</i>\" Governor Tee grins, motioning to the seat across from his desk. He lights up a big, blue-crowned cigar as you settle in. \"<i>So, what can I do ya for?</i>\"");
	bigTMenu();
}

//Talk Scenes!
function talkToBigT(currentScene):void
{
	clearMenu();
	if(currentScene == talkWithBigTAboutNudeTexas) addDisabledButton(0,"New Texas","New Texas","You just finished that conversation.");
	else addButton(0,"New Texas",talkWithBigTAboutNudeTexas,undefined,"New Texas","Ask him what he thinks about his planet.");
	//The Treatment
	//Ask for the Governor's perspective on the galaxy-famous Treatment. 
	if(currentScene == theTreatmentFromBigTsPerspective) addDisabledButton(1,"The Treatment","The Treatment","You just finished that conversation!");
	else addButton(1,"The Treatment",theTreatmentFromBigTsPerspective,undefined,"The Treatment","Ask him about his thoughts on the Treatment.");
	//Old Colony
	//Locked behind the Treatment dialogue
	//Ask Big T. about the original New Texas colony.
	if(flags["TALKED_ABOUT_TREATMENT_WITH_BIG_T"] == undefined) addDisabledButton(2,"Old Colony","Old Colony","This topic is not available until you have discussed the treatment.");
	else if(currentScene == oldColonyBigTTalk) addDisabledButton(2,"Old Colony","Old Colony","You just finished discussing this.");
	else addButton(2,"Old Colony",oldColonyBigTTalk,undefined,"Old Colony","Ask Big T. about the original New Texas Colony.");
	//Tee Family
	//Ask Big T. about his family
	//Gated behind Old Colony talk
	if(flags["TALKED_ABOUT_COLONY_WITH_BIG_T"] == undefined) addDisabledButton(3,"Tee Family","Tee Family","This topic is not available until the old colony has been discussed.");
	else if(currentScene == bigTFamiryTalk) addDisabledButton(3,"Tee Family","Tee Family","You just finished discussing this!");
	else addButton(3,"Tee Family",bigTFamiryTalk,undefined,"Tee Family","Ask Big T. about his family.");
	addButton(14,"Back",bigTMenu);
}

//New Texas
//Talk with Big T. about New Texas itself
function talkWithBigTAboutNudeTexas():void
{
	clearOutput();
	showBigT();
	output("\"<i>So, tell me about your planet, Governor Tee,</i>\" you prompt. The governor's all too happy to oblige.");
	output("\n\n\"<i>Well this here a paradise world if ever there was one,</i>\" Big T. says proudly, leaning back in his chair and puffing his cigar. \"<i>Beautiful, friendly people. Verdant fields and open sky. Peaceful and happy.</i>\"");
	output("\n\nThere's a long pause after that. Long enough to make you think he's not going to say any more.");
	if(pc.isMischievous()) output("\n\n\"<i>Is that it? Is that your whole sell?</i>\" you ask, laughing.");
	else output("\n\n\"<i>Anything else to it?</i>\" you finally ask.");
	output("\n\nTee guffaws and slaps his knee. \"<i>That not enough for you, Steele? What else can ya want from a home, huh? Sure, it ain't the most exciting place in the galaxy. Just ask Ogram down at Customs. He's always complaining about now having pirates and kidnappers to shoot. Or at least he does when that Amma of his isn't keeping him busy. Ha! That's the real beauty of of our little world, isn't it? There's always something to distract you from your woes. Never a bad day on New Texas - and if it is, just pop down to the milk barn until it ain't one!</i>\"");

	output("\n\nTee laughs and shakes his head. \"<i>Life ain't all sex and milk, but there's enough of it on tap to keep anybody happy, thanks to the Treatment. That's what makes New Texas run, " + pc.mf("son","girl") + "! Or at least, run as smooth as it does for as long as it has. All the way back to the old colony days up 'till now!</i>\"");
	processTime(2);
	talkToBigT(talkWithBigTAboutNudeTexas);
}

//The Treatment
//Ask for the Governor's perspective on the galaxy-famous Treatment. 
function theTreatmentFromBigTsPerspective():void
{
	clearOutput();
	showBigT();
	//if Treated female: 
	if(pc.isBimbo() && pc.isTreated()) output("\"<i>So could you, like, tell me more about what I'm in for, all Treated and stuff?</i>\" you ask, fluttering your lashes at the governor.");
	//if Treated male:
	else if(pc.isTreated() && pc.isBro()) output("\"<i>So, what'd I sign on for with this whole Treatment thing, exactly?</i>\"");
	else output("\"<i>So, tell me more about this Treatment I've been hearing about.</i>\"");

	output("\n\nBig T. takes a long moment to think about that, puffing on his cigar and blowing clouds that smell more like cinammon than poison. \"<i>Well, I reckon you could hear plenty from darn near anybody here on New Texas. Shoot, that cute little blonde down in Customs, Amma, can't wait to gab anybody's ear off who'll listen about it. But heck, you're here and asking, so I guess I can give you the whole spiel, too!</i>\"");

	output("\n\nHe chuckles to himself and leans back in his chair in a way that makes his shirt and pants strain around his massive physique - and draws your eyes to the unmistakable bulge in the governor's britches. \"<i>Treatment's been around just as long as New Texas has been, just about. Original colonists slow-boated here, way 'fore the whole Warp Gate shenanigans came around. Just a bunch of people crammed into a ship, a deck of cryo pods, and as much seeds and supplies as they could squeeze in - all blastin' off into the great unknown. Lucky them, they ended up here on a garden world instead of sucked into a black hole or something! When our ancestors landed, they needed something to kickstart the population. And that's the Treatment in a nutshell!</i>\"");
	output("\n\n\"<i>Started out as a fertility drug all the colonists took way back when. Weren't as powerful then, but it let us spread out 'round the planet in a hurry. Over time, we've modified the Treatment to do all sorts of things. Makes everybody better in more ways than just baby making. " + pc.mf("Women","You women") + " get more libidinous, start lactating, put on curves in all the right places to make fellers drool. " + pc.mf("Us guys","Men like me") + " get bigger, burlier, hornier.\"</i>");
	output("\n\nTee laughs, pointing at the huge horns growing from the sides of his head when he notices where your gaze has wandered.");
	output("\n\n\"<i>At least that's what usually happens. Backfires sometimes, makes fellas girly and pretty little ladies into big, angry, muscle-bound-</i>\"");
	output("\n\n\"<i>Sure you wanna finish that sentence, Tee?</i>\" Zephyr shouts from the lobby.");

	output("\n\nTee grumbles something and adjusts his tie. \"<i>");
	//if PC is a faux-vine: 
	if(pc.isTreated() && pc.hasCock() && !pc.isBimbo()) output("Kinda like with you, little guy.");
	//PC is mooazon: 
	else if(pc.isTreated() && pc.hasVagina() && !pc.isBimbo()) output("Just like, uh, just like you, missy!");
	// if PC is Treated: 
	else if(pc.isTreated()) output("Don't </i>usually<i> happen, though. You turned out alright!");
	// if PC is unTreated:
	else output("That's all pretty rare, though, and even then, most folk turn out to like what the Treatment does to 'em. Ask that blonde boy out by the fields what he thinks of bulls these days! Hah!");
	output("</i>\"");

	//if PC has met Cameron: 
	if(flags["MET_CAMERON"] != undefined) output("\n\n...What?");
	else output("\n\nTee guffaws at a joke you don't quite get and taps some ash out from his cigar.");

	output("\n\n\"<i>Anyhoo, long and the short is that the Treatment's what makes sure New Texas the paradise it is. We're the biggest tourist spot there is for the galaxy's elite, and have the highest happiness ratings among the people of any system in the Confederacy! Makes good ol' New Texas just about as perfect as it gets!</i>\"");
	flags["TALKED_ABOUT_TREATMENT_WITH_BIG_T"] = 1;
	processTime(2);
	talkToBigT(theTreatmentFromBigTsPerspective);
}

//Old Colony
//Locked behind the Treatment dialogue
//Ask Big T. about the original New Texas colony.
function oldColonyBigTTalk():void
{
	clearOutput();
	showBigT();
	output("\"<i>What was New Texas like, back in the day? You mentioned the Treatment used to be something pretty different.</i>\"");
	output("\n\n\"<i>Sure,\"</i> Tee laughs, \"<i>Every place changes, right? Even New Texas's grown over the years since my great great etcetera grandpappy landed us all here generations. Used to be some native, non-sapient species here, and the place was a little less grassy for starters. Mostly dry, dusty plains, far as the eye could see. Course, we didn't come with much in the way of fancy terraformin' machines, no " + pc.mf("sir","ma'am") + ". Settled this world the old fashioned way, with guns and grit and a whole lot of hard work.</i>\"");
	output("\n\nTee gets a proud, faraway look as he speaks. \"<i>Back when men were men and women were women. 'Fore all this pre-fab colony nonsense, when you fought and bled for your stake of land! Even with the old Treatment doin' its thing, it was a long time 'fore we managed to settle the whole planet. Generations! Folk were living out of the original colony boat for decades, till we cleared out the biggest of the super-varmints. Practically a war, that was, the way my grandpappy told it. Huge bastards with claws and fangs thicker'n my arm, came raidin' at night to steal supplies, the bunch of scav-wolves. Even the little ones still around are a pain in the ass. Ask my girl Gianna sometime why she can't leave the property, she'll tell you what they still get up to.</i>\"");
	output("\n\n\"<i>You lived out of the colony ship?</i>\" you ask, cocking an eyebrow. Most colony ships back then would have been stripped down for scrap to make houses and other structures.");
	output("\n\n\"<i>Sure,</i>\" Tee shrugs, punching one of the buttons on his holoscreen. An image of a massive, sleek starship flickers to life. \"<i>Managed to actually land the damn thing... right 'round here, actually. Most colony ships just sorta crash, fall onto a good planet then wake the crew up outta cryo. Texas ship did it the other way around, see, and my great great etcetera grandpappy managed to land the big bastard. Perfect touchdown, not a scratch on 'er. Considerin' the creepy crawlies living here already, colonists figured it'd be better to stay aboard for the first while, till they could push the varms back a ways.</i>\"");
	output("\n\n\"<i>So what happened to the ship, then?</i>\" you ask. You haven't seen any gigantic colony ships sitting around.");
	output("\n\nTee laughs, \"<i>Great big sinkhole opened up a ways back, swallowed the old girl. Between you and me, the ranch house here's built right on top of 'er. Generator's still powering the whole ranch!</i>\"");
	processTime(2);
	flags["TALKED_ABOUT_COLONY_WITH_BIG_T"] = 1;
	talkToBigT(oldColonyBigTTalk);
}

//Tee Family
//Ask Big T. about his family
//Gated behind Old Colony talk
function bigTFamiryTalk():void
{
	clearOutput();
	output("\"<i>You talk a lot about your ancestors. Original colonists, right?</i>\"");
	output("\n\n<i>\"That's right,\"</i> Tee beams proudly. \"<i>Can trace my line all the way back to Captain Tiberia Tee, Commanding. First lady captain of a whole colony ship, she was. Husband was the helmsman, landed us here without a scratch on the old girl's hull.</i>\"");
	output("\n\nThat's a surprise. The New Texas expedition was led by a woman?");
	output("\n\nTee laughs at the question. <i>\"Sure, why not? Ain't nothing a man can do a woman can't!\"</i>");
	output("\n\n\"<i>Yeah, but, </i>the Treatment<i>...</i>\" you say, casting a glance out the governor's window to the ranch full of busty, air-headed sluts with little more than dick on their minds.");
	output("\n\nIt takes a moment for your implication to sink in. When it does, Tee guffaws and slaps his leg. \"<i>What, it was Tiberia's idea to begin with! She's the one that had us all taking the Treatment from the get-go. Gotta work hard to populate a new planet, she said. Course we don't </i>need<i> it anymore, but everyone just plain wants to! Her makin' everyone get Treated is what shaped New Texas into the paradise it is, sure as hell.</i>\"");
	output("\n\n\"<i>Anyway,</i>\" you say, figuring you can cut him off before another Treatment tirade. \"<i>So, the captain's descendants get to be governor, is that it?</i>\"");
	output("\n\n\"<i>Naw, we've got elections and all that,</i>\" Tee answers, a bit flatly. \"<i>Not a dictatorship or a kingdom, no, nothing like that. We're a right proper democracy, elections every two years. We Tees get elected plenty, but not </i>all<i> the time. Most folk think we've done right by 'em, and are more'n happy to have more of the same.");
	if(pc.isTreated()) output(" Heck, aren't you? All nice and Treated - you wouldn't give that for anything, would ya?");
	output("</i>\"");

	//if PC is Misch:
	if(pc.isMischievous()) output("\n\nSounds like the Tees have themselves a mighty nice set-up here....");
	else output("\n\nYou're not entirely convinced that's how Democracy usually works out.");

	output("\n\n\"<i>So, who's up next to inherit the Tee throne?</i>\" you ask, only half joking.");
	output("\n\nIf the Governor picks up on the joke, he doesn't acknowledge it. \"<i>Well, I don't have any proper kids. Well, I </i>probably<i> have loads of 'em, but none I know about. 'Who's your daddy?' is a pretty hard question to answer 'round here sometimes! Ha! Only kid I've legally got is my girl Gianna. You've met her, ain't ya?</i>\"");

	output("\n\nYou ");
	if(flags["MET_GIANNA"] != undefined) output("shake your head");
	else output("nod an affirmative");
	output(". Tee smiles proudly, blowing a big ring of smoke as he says, \"<i>She's a good girl. Met her by running her over with my truck! Heck of a way to meet your daughter, don't ya reckon? Well, not my daughter then. Adopted her later, when her owner forgot about her. What kind of fella does that, has a great girl like that and just leaves her? I don't even know.</i>\"");

	//If PC hasn't met Gigi: 
	if(flags["MET_GIANNA"] == undefined)
	{
		output("\n\n<i>\"Owner?\"</i> you ask.");
		output("\n\n\"<i>Hmm? Ah, right. Gianna's an android! Companion droid, real expensive model. Smart as a whip and damn pleasant to be around. Nicest girl I've ever met, even if she don't smell like a woman. Owner got Treated, moved in, but plumb forgot about his girl, just left her to rot on the ship. Damn shame.</i>\"");
		output("\n\n\"<i>So you adopted an android?</i>\"");
		output("\n\n\"<i>Darn tootin'!</i>\" Tee laughs. \"<i>Best decision I ever made. Got her citizenship and everything. Had to pull a couple strings, maybe change a law, but hey. Made her happy, and that's what matters.</i>\"");
	}
	processTime(3);
	talkToBigT(bigTFamiryTalk);
}
