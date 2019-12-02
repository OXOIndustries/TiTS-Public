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
public function bigTOfficeBonusBullshit():Boolean
{
	output("The office of the planetary governor, Big T., is a warm, spacious office with plenty of seats and couches and several bookshelves, looking more like an aristocrat’s study than a government office. The room is dominated by a huge, oaken desk facing the door, a semi-circle of wood alight with monitors, holo-displays, and other readouts, all angled towards a huge, comfy-looking chair.");
	//if T isn't dead/broken:
	if(9999 == 9999) output("The towering bull-like governor is sitting at his desk, busily talking and typing, managing the world’s affairs all from his desk.");
	showBust("BIGT");
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

public function showBigT(nude:Boolean = false):void
{
	if(nude) showBust("BIGT_NUDE");
	else showBust("BIGT");
	showName("\nBIG T");
	author("Savin");
}
public function getBigTPregContainer():PregnancyPlaceholder
{
	var ppBigT:PregnancyPlaceholder = new PregnancyPlaceholder();
	if(!ppBigT.hasCock()) ppBigT.createCock();
	ppBigT.shiftCock(0, GLOBAL.TYPE_EQUINE);
	ppBigT.balls = 2;
	ppBigT.ballSizeRaw = 12;
	ppBigT.createPerk("Fixed CumQ", 4000, 0, 0, 0);
	return ppBigT;
}

public function TsDoorIsLocked():void
{
	clearOutput();
	showZephyrDeets();
	output("You pull on the door, but all it does is rattle, locked.\n\nThe secretary just laughs to herself, making her implausibly large bust wobble. <i>“You’ll need to talk to me if you want to get in there, but why don’t you save us both the time and just leave?”</i>\n\nRude.");

	moveTo("529");

	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Intro / First Time Meeting
//Lock the door into T's office until after having spoken with the seccy. outside, set up a meet&greet.
public function introToBigTSeeMeAfterClass():void
{
	clearOutput();
	showBigT();
	flags["MET_BIG_T"] = 1;
	//Something something transition from secretary here
	output("You step through the door into Governor Tee’s office. The inside is nothing like any government office you’ve seen before, looking more like a hunting lodge’s lobby than the soulless, bleak affairs you’re familiar with from the core worlds. The room’s dominated by a huge oaken desk facing the door, a semi-circle of solid hardwood inlaid with enough holo-displays to light up the room. The screens show flickering glimpses of milk production, food exports, and the comings and goings of ships from all over the planet’s many towns. Hunting trophies line the room, culminating in a massive stuffed creature behind the desk, looking something like a six-legged polar bear with a unicorn’s horn jamming out from its head.");
	output("\n\nPacing in front of the desk is a huge, barrel-chested bull man. He’s better dressed than you might have expected, clad in slacks and a white button-up shirt, just low enough to show a forest of dark, curly chest hair over taut muscles. The only Texan thing about him is the wide-brimmed white Stetson hat he’s wearing, pierced by a pair of huge steer horns growing from his brow, and the over-sized six-gun slung low on his hip. For a man of his size, though, it looks like a popgun: New Texas’s governor stands a formidable ten feet in height, at the least, and taller with his horns and cowboy hat added in. He’s a wrecking ball of a man, massive and muscular, all crammed into business casual wear that looks ready to burst if he takes a deep breath.");
	output("\n\nSeeing you walk in, the governor points to a headset buried in one of his bovine ears and says, <i>“Sorry, hoss, visitors a‘comin’. We’ll settle up later. Yeah. Ya’ll take care, now.”</i>");
	//if PC = male:
	output(" " + pc.mf("He clicks off the headset and thrusts his hand out beneath a big, toothy grin. <i>“Well howdy! Welcome to New Texas, partner!”</i>","Over your shoulder and through the door, the governor shouts, <i>“Zephyr! You didn’t say our guest was a beautiful woman!”</i>\n\n<i>“You say that like anything </i>else<i> walks through your damn door!”</i> comes the answer from the lobby. Tee guffaws, waving her off and extends a hand to you."));
	output("\n\nYou shake Big T.’s hand and introduce yourself. His grip’s vice-like, crushing down on you as he pumps your arm eagerly. <i>“Outstanding! Welcome to New Texas, " + pc.mf("Mr.","Ms.") + " Steele. I’m Governor Benjamin Tiberious Tee. Though most folks ‘round here just call me Big T.”</i>");
	output("\n\nHe ushers you into a big, plush seat and plops down behind his desk, kicking his feet up and pulling a huge, blue cigar from a drawer. <i>“Enjoyin’ your stay on New Texas so far, " + pc.mf("Mr.","Ms.") + " Steele? Lemme know if there’s anything you need -- or if you’ve got questions! Most governor’s have secretaries for that sorta thing, but mine’s a little ornery for it, dontcha think?”</i>");
	output("\n\n<i>“I can hear you!”</i> Zephyr snorts from outside.");
	//if Silly:
	if(silly) output("\n\n<i>“Hrm. Gotta invest in some soundproofing one of these days,”</i> Tee grunts, scratching his beard.");
	processTime(3);
	bigTMenu();
}

public function bigTMenu():void
{
	clearMenu();
	addButton(0,"Talk",talkToBigT,talkToBigT);
	if(pc.lust() >= 33) addButton(1,"Sex",sexWithBigTMenu,undefined,"Sex","Try for some sexy times with the planetary Governor.");
	else addDisabledButton(1,"Sex","Sex","You aren’t aroused enough to try seducing Big T right now.");
	addButton(14,"Leave",mainGameMenu);
}

//Repeat Intro
public function repeatBigTApproach():void
{
	clearOutput();
	showBigT();
	output("<i>“Howdy there, Steele. Take a load off,”</i> Governor Tee grins, motioning to the seat across from his desk. He lights up a big, blue-crowned cigar as you settle in. <i>“So, what can I do ya for?”</i>");
	bigTMenu();
}

//Talk Scenes!
public function talkToBigT(currentScene:Function):void
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
public function talkWithBigTAboutNudeTexas():void
{
	clearOutput();
	showBigT();
	output("<i>“So, tell me about your planet, Governor Tee,”</i> you prompt. The governor’s all too happy to oblige.");
	output("\n\n<i>“Well this here a paradise world if ever there was one,”</i> Big T. says proudly, leaning back in his chair and puffing his cigar. <i>“Beautiful, friendly people. Verdant fields and open sky. Peaceful and happy.”</i>");
	output("\n\nThere’s a long pause after that. Long enough to make you think he’s not going to say any more.");
	if(pc.isMischievous()) output("\n\n<i>“Is that it? Is that your whole sell?”</i> you ask, laughing.");
	else output("\n\n<i>“Anything else to it?”</i> you finally ask.");
	output("\n\nTee guffaws and slaps his knee. <i>“That not enough for you, Steele? What else can ya want from a home, huh? Sure, it ain’t the most exciting place in the galaxy. Just ask Ogram down at Customs. He’s always complaining about not having pirates and kidnappers to shoot. Or at least he does when that Amma of his isn’t keeping him busy. Ha! That’s the real beauty of our little world, isn’t it? There’s always something to distract you from your woes. Never a bad day on New Texas - and if it is, just pop down to the milk barn until it ain’t one!”</i>");

	output("\n\nTee laughs and shakes his head. <i>“Life ain’t all sex and milk, but there’s enough of it on tap to keep anybody happy, thanks to the Treatment. That’s what makes New Texas run, " + pc.mf("son","girl") + "! Or at least, run as smooth as it does for as long as it has. All the way back to the old colony days up till now!”</i>");
	processTime(2);
	talkToBigT(talkWithBigTAboutNudeTexas);
}

//The Treatment
//Ask for the Governor's perspective on the galaxy-famous Treatment. 
public function theTreatmentFromBigTsPerspective():void
{
	clearOutput();
	showBigT();
	//if Treated female: 
	if(pc.isBimbo() && pc.isTreated()) output("<i>“So could you, like, tell me more about what I’m in for, all Treated and stuff?”</i> you ask, fluttering your lashes at the governor.");
	//if Treated male:
	else if(pc.isTreated() && pc.isBro()) output("<i>“So, what’d I sign on for with this whole Treatment thing, exactly?”</i>");
	else output("<i>“So, tell me more about this Treatment I’ve been hearing about.”</i>");

	output("\n\nBig T. takes a long moment to think about that, puffing on his cigar and blowing clouds that smell more like cinammon than poison. <i>“Well, I reckon you could hear plenty from darn near anybody here on New Texas. Shoot, that cute little blonde down in Customs, Amma, can’t wait to gab anybody’s ear off who’ll listen about it. But heck, you’re here and asking, so I guess I can give you the whole spiel, too!”</i>");

	output("\n\nHe chuckles to himself and leans back in his chair in a way that makes his shirt and pants strain around his massive physique - and draws your eyes to the unmistakable bulge in the governor’s britches. <i>“Treatment’s been around just as long as New Texas has been, just about. Original colonists slow-boated here, way ‘fore the whole Warp Gate shenanigans came around. Just a bunch of people crammed into a ship, a deck of cryo pods, and as much seeds and supplies as they could squeeze in - all blastin’ off into the great unknown. Lucky them, they ended up here on a garden world instead of sucked into a black hole or something! When our ancestors landed, they needed something to kickstart the population. And that’s the Treatment in a nutshell!”</i>");
	output("\n\n<i>“Started out as a fertility drug all the colonists took way back when. Weren’t as powerful then, but it let us spread out ‘round the planet in a hurry. Over time, we’ve modified the Treatment to do all sorts of things. Makes everybody better in more ways than just baby making. " + pc.mf("Women","You women") + " get more libidinous, start lactating, put on curves in all the right places to make fellers drool. " + pc.mf("Us guys","Men like me") + " get bigger, burlier, hornier.”</i>");
	output("\n\nTee laughs, pointing at the huge horns growing from the sides of his head when he notices where your gaze has wandered.");
	output("\n\n<i>“At least that’s what usually happens. Backfires sometimes, makes fellas girly and pretty little ladies into big, angry, muscle-bound-”</i>");
	output("\n\n<i>“Sure you wanna finish that sentence, Tee?”</i> Zephyr shouts from the lobby.");

	output("\n\nTee grumbles something and adjusts his tie. <i>“");
	//if PC is a faux-vine: 
	if(pc.isTreated() && pc.hasCock() && !pc.isBimbo()) output("Kinda like with you, little guy.");
	//PC is mooazon: 
	else if(pc.isTreated() && pc.hasVagina() && !pc.isBimbo()) output("Just like, uh, just like you, missy!");
	// if PC is Treated: 
	else if(pc.isTreated()) output("Don’t </i>usually<i> happen, though. You turned out alright!");
	// if PC is unTreated:
	else output("That’s all pretty rare, though, and even then, most folk turn out to like what the Treatment does to ‘em. Ask that blonde boy out by the fields what he thinks of bulls these days! Hah!");
	output("”</i>");

	//if PC has met Cameron: 
	if(flags["MET_CAMERON"] != undefined) output("\n\n...What?");
	else output("\n\nTee guffaws at a joke you don’t quite get and taps some ash out from his cigar.");

	output("\n\n<i>“Anyhoo, long and the short is that the Treatment’s what makes sure New Texas the paradise it is. We’re the biggest tourist spot there is for the galaxy’s elite, and have the highest happiness ratings among the people of any system in the Confederacy! Makes good ol’ New Texas just about as perfect as it gets!”</i>");
	flags["TALKED_ABOUT_TREATMENT_WITH_BIG_T"] = 1;
	processTime(2);
	talkToBigT(theTreatmentFromBigTsPerspective);
}

//Old Colony
//Locked behind the Treatment dialogue
//Ask Big T. about the original New Texas colony.
public function oldColonyBigTTalk():void
{
	clearOutput();
	showBigT();
	output("<i>“What was New Texas like, back in the day? You mentioned the Treatment used to be something pretty different.”</i>");
	output("\n\n<i>“Sure,”</i> Tee laughs, <i>“Every place changes, right? Even New Texas’s grown over the years since my great great etcetera grandpappy landed us all here generations ago. Used to be some native, non-sapient species here, and the place was a little less grassy for starters. Mostly dry, dusty plains, far as the eye could see. Course, we didn’t come with much in the way of fancy terraformin’ machines, no " + pc.mf("sir","ma’am") + ". Settled this world the old fashioned way, with guns and grit and a whole lot of hard work.”</i>");
	output("\n\nTee gets a proud, faraway look as he speaks. <i>“Back when men were men and women were women. ‘Fore all this pre-fab colony nonsense, when you fought and bled for your stake of land! Even with the old Treatment doin’ its thing, it was a long time ‘fore we managed to settle the whole planet. Generations! Folk were living out of the original colony boat for decades, till we cleared out the biggest of the super-varmints. Practically a war, that was, the way my grandpappy told it. Huge bastards with claws and fangs thicker‘n my arm, came raidin’ at night to steal supplies, the bunch of scav-wolves. Even the little ones still around are a pain in the ass. Ask my girl Gianna sometime why she can’t leave the property, she’ll tell you what they still get up to.”</i>");
	output("\n\n<i>“You lived out of the colony ship?”</i> you ask, cocking an eyebrow. Most colony ships back then would have been stripped down for scrap to make houses and other structures.");
	output("\n\n<i>“Sure,”</i> Tee shrugs, punching one of the buttons on his holoscreen. An image of a massive, sleek starship flickers to life. <i>“Managed to actually land the damn thing... right ‘round here, actually. Most colony ships just sorta crash, fall onto a good planet then wake the crew up outta cryo. Texas ship did it the other way around, see, and my great great etcetera grandpappy managed to land the big bastard. Perfect touchdown, not a scratch on ‘er. Considerin’ the creepy crawlies living here already, colonists figured it’d be better to stay aboard for the first while, till they could push the varms back a ways.”</i>");
	output("\n\n<i>“So what happened to the ship, then?”</i> you ask. You haven’t seen any gigantic colony ships sitting around.");
	output("\n\nTee laughs, <i>“Great big sinkhole opened up a ways back, swallowed the old girl. Between you and me, the ranch house here’s built right on top of ‘er. Generator’s still powering the whole ranch!”</i>");
	processTime(2);
	flags["TALKED_ABOUT_COLONY_WITH_BIG_T"] = 1;
	talkToBigT(oldColonyBigTTalk);
}

//Tee Family
//Ask Big T. about his family
//Gated behind Old Colony talk
public function bigTFamiryTalk():void
{
	clearOutput();
	showBigT();
	output("<i>“You talk a lot about your ancestors. Original colonists, right?”</i>");
	output("\n\n<i>“That’s right,”</i> Tee beams proudly. <i>“Can trace my line all the way back to Captain Tiberia Tee, Commanding. First lady captain of a whole colony ship, she was. Husband was the helmsman, landed us here without a scratch on the old girl’s hull.”</i>");
	output("\n\nThat’s a surprise. The New Texas expedition was led by a woman?");
	output("\n\nTee laughs at the question. <i>“Sure, why not? Ain’t nothing a man can do a woman can’t!”</i>");
	output("\n\n<i>“Yeah, but, </i>the Treatment<i>...”</i> you say, casting a glance out the governor’s window to the ranch full of busty, air-headed sluts with little more than dick on their minds.");
	output("\n\nIt takes a moment for your implication to sink in. When it does, Tee guffaws and slaps his leg. <i>“What, it was Tiberia’s idea to begin with! She’s the one that had us all taking the Treatment from the get-go. Gotta work hard to populate a new planet, she said. Course we don’t </i>need<i> it anymore, but everyone just plain wants to! Her makin’ everyone get Treated is what shaped New Texas into the paradise it is, sure as hell.”</i>");
	output("\n\n<i>“Anyway,”</i> you say, figuring you can cut him off before another Treatment tirade. <i>“So, the captain’s descendants get to be governor, is that it?”</i>");
	output("\n\n<i>“Naw, we’ve got elections and all that,”</i> Tee answers, a bit flatly. <i>“Not a dictatorship or a kingdom, no, nothing like that. We’re a right proper democracy, elections every two years. We Tees get elected plenty, but not </i>all<i> the time. Most folk think we’ve done right by ‘em, and are more‘n happy to have more of the same.");
	if(pc.isTreated()) output(" Heck, aren’t you? All nice and Treated - you wouldn’t give that for anything, would ya?");
	output("”</i>");

	//if PC is Misch:
	if(pc.isMischievous()) output("\n\nSounds like the Tees have themselves a mighty nice set-up here....");
	else output("\n\nYou’re not entirely convinced that’s how Democracy usually works out.");

	output("\n\n<i>“So, who’s up next to inherit the Tee throne?”</i> you ask, only half joking.");
	output("\n\nIf the Governor picks up on the joke, he doesn’t acknowledge it. <i>“Well, I don’t have any proper kids. Well, I </i>probably<i> have loads of ‘em, but none I know about. ‘Who’s your daddy?’ is a pretty hard question to answer ‘round here sometimes! Ha! Only kid I’ve legally got is my girl Gianna. You’ve met her, ain’t ya?”</i>");

	output("\n\nYou ");
	if(flags["MET_GIANNA"] == undefined) output("shake your head");
	else output("nod an affirmative");
	output(". Tee smiles proudly, blowing a big ring of smoke as he says, <i>“She’s a good girl. Met her by running her over with my truck! Heck of a way to meet your daughter, don’t ya reckon? Well, not my daughter then. Adopted her later, when her owner forgot about her. What kind of fella does that, has a great girl like that and just leaves her? I don’t even know.”</i>");

	//If PC hasn't met Gigi: 
	if(flags["MET_GIANNA"] == undefined)
	{
		output("\n\n<i>“Owner?”</i> you ask.");
		output("\n\n<i>“Hmm? Ah, right. Gianna’s an android! Companion droid, real expensive model. Smart as a whip and damn pleasant to be around. Nicest girl I’ve ever met, even if she don’t smell like a woman. Owner got Treated, moved in, but plumb forgot about his girl, just left her to rot on the ship. Damn shame.”</i>");
		output("\n\n<i>“So you adopted an android?”</i>");
		output("\n\n<i>“Darn tootin’!”</i> Tee laughs. <i>“Best decision I ever made. Got her citizenship and everything. Had to pull a couple strings, maybe change a law, but hey. Made her happy, and that’s what matters.”</i>");
	}
	processTime(3);
	talkToBigT(bigTFamiryTalk);
}

//New Texas Ending: Governess/First Gentleman of New Texas.
// A certain number of times having sex with Tee, he asks you to be his beau and stay on New Texas with him. Since he's a man of means, and NT is pretty chill, it's an invitation to live in the lap of luxury (literally) with Tee for the rest of your days.

//Sex Menu
public function sexWithBigTMenu():void
{
	clearOutput();
	showBigT();
	author("JimThermic");
	output("You gaze at the masculine breadth of Big T’s chest, and your cheeks warm up. Now that you’re a little closer, you can smell his powerful, intoxicating scent. It’s the smell of a genuine New Texan bull - generations of alphas culminating into one glorious male specimen.");
	output("\n\nWhen Tee flexes his arms, the tugging of his tight shirt across those muscular pecs makes your loins ache. What would it be like to trail your fingers across those hard, chiseled muscles, you wonder-?");
	output("\n\nYou’re suddenly aware that he’s staring at you, and you freeze like a doe in the headlights. While you’re standing there paralyzed, the ten foot bull man gets up and strides across the room to you. You let out a surprised noise as his muscular arms wrap around your waist, pulling you roughly against him.");
	output("\n\nWhen you look up, his riveting blue eyes are staring down at you. <i>“");
	if(!pc.isTreated()) output("I’m not so good at telling with the non-treated " + pc.mf("boys","girls") + ", but even I can tell you’re as riled up as a filly in heat.");
	else output("You, " + pc.mf("boy","darlin’") + ", look as riled up as a filly in heat.");
	output("”</i> His deep, rough voice thunders down from above. <i>“I think there’s something we can do about that, don’t you--?”</i>");

	output("\n\nAs if punctuating his statement, a large, powerful hand trails down your back and ");
	if(!pc.isTaur()) output("squeezes your [pc.ass]. Almost by instinct, you push it into his grasp, shivering with delight as he teases your rump.");
	else output("rests at the small of your back.");
	output(" The look in his eyes speaks volumes - he clearly has plans for you.");

	output("\n\nTee then brazenly pushes his hips forward, and you feel an obvious stiffening against your [pc.skinFurScalesNoun]. You look down and let out a sharp gasp - they seriously weren’t joking when they called him ‘Big T’. It looks like he’s got a fire hose stashed down those slacks!");
	output("\n\n<i>“How about it, " + pc.mf("boy","darlin’") + " -- want to be mated by a real bull?”</i>");
	//treated:
	if(pc.isTreated()) output("\n\nYou’re giddy with delight!");
	else output("\n\nYour head is spinning, and you find yourself seriously entertaining the idea.");
	output(" You, [pc.name] Steele, servicing the biggest bull on New Texas? And it looks like his cock is proportional to his body size....");

	pc.lust(15);
	//[Desk BJ] [Drunken Cow{boy/girl}] [Pitch T] 
	//Written:
	// DeskBJ.tooltip: Blow Tee from under his desk just like all the other cowgirl sluts!
	// DrunkenCowgirl.tooltip: Knock back a few drinks with Tee, then take him for a ride...
	// PitchT.Tooltip: Suggest turning things around on the bullish alpha male.
	addButton(0,"Desk BJ",bigTHasABigDDeskBlowjob,undefined,"Desk BJ","Blow Tee from under his desk just like all the other cowgirl sluts!");
	if(pc.cuntThatFits(400) >= 0 || pc.analCapacity() >= 400) addButton(1,"DrunkenCowgirl",drunkenCowgirlBoy,undefined,"DrunkenCowgirl","Knock back a few drinks with Tee, then take him for a ride....");
	else addDisabledButton(1,"DrunkenCowgirl","DrunkenCowgirl","You can’t possibly handle such a big dick. You’ll need to do something to loosen up first.");
	if(pc.hasCock())
	{
		if(pc.cockThatFits(500) >= 0) addButton(2,"Pitch T",pitchTOverATable,undefined,"Pitch T","Suggest turning things around on the bullish alpha male.");
		else addDisabledButton(2,"Pitch T","Pitch T","Big T is a big guy, but you’re a little too big to fuck him without injuring him.");
	}
	else addDisabledButton(2,"Pitch T","Pitch T","You need a dick to bend Big T over his desk.");
	addButton(3,"Get Ridden",getRiddenByBigT,undefined,"On New Texas, the bull rides you!");
	addButton(14,"Back",bigTMenu);
	//Not Written Yet:
	// Get Ridden: Get bent over and screwed by a politician. At least New Texas is up-front about it.
	// BullOrgy.tooltip: Tee holds a conference with a bunch of bulls, and you’re jam-packed in the middle!
	// Staff3Way.tooltop: Tee calls in Zephyr to fuck you from both sides.
}

//Desk BJ
public function bigTHasABigDDeskBlowjob():void
{
	clearOutput();
	showBigT(true);
	author("JimThermic");
	output("Before you know it, Big T heads back to his chair, sits down, and spreads his legs. You find yourself following him, and without words, sinking down between them. ");
	if(!pc.isTreated() && !pc.isBimbo()) output("You’ll just give him a blowjob. One blowjob and you’ll leave, right?");
	else output(" Bulls are meant to be blown by cows, and you’re a cow, so you’ll blow him - it’s that simple!");

	output("\n\nYou reach up and undo the zip of his slacks, only to find out it’s easy access. When you undo it, his gargantuan, flared stallion-cock immediately flops out. Void, it’s a gigantic rod of pure love muscle and as thick as an arm. Are you even going to be able to tackle such a monstrously large cock? You feel a quiver of delight just <i>looking</i> at it.");

	if(pc.isChestGarbed()) output("\n\nReturning the favor, you slowly strip off your [pc.upperGarments]. ");
	else output("\n\n"); 
	if(pc.lowerUndergarment.shortName != "") output("Clad in just your [pc.lowerUndergarment], you");
	else output("You");
	output(" stroke your [pc.chest] and look up at Tee. His blue eyes are filled with unashamed lust as he ogles your naked form, enjoying the show you’re giving him.");

	output("\n\n<i>“Hot damn, that’s a mighty fine sight--!”</i> Tee exclaims, reaching down to tweak one of your [pc.nipples]. You let out a whimpering sigh as his thick fingers squeeze and tease your sensitive nub. The man sure knows how to wrangle " + pc.mf("a young buck in!","a woman in!"));
	output("\n\nThrowing your head back, you sigh at the feeling of his powerful digits caressing your prickled [pc.nippleColor] areola, and sending pleasure coursing through your [pc.breasts].");
	if(pc.isLactating()) output(" A stream of [pc.milk] excitedly squirts from your [pc.nippleNoun] and you moan with delight.");
	else output(" The masterful bull coaxes your aching nips until they are taut and tingling.");

	output("\n\nHis impressive dangling manhood hangs between his thick, muscular thighs. That flaring, pink head makes you tingle all over with barely restrained desire. Inching closer, you lean forward and lick it with your tongue. It’s so heady and strong - you giddily lap up his distinctly masculine taste.");

	output("\n\nTee groans and lolls back his head as you lap submissively at his ridiculously huge cock head. You run your [pc.tongue] around his flat fleshy head, feeling it intermittently flare with bullish delight. You feel a little burst of pride, knowing that the governor is enjoying your efforts.");
	output("\n\nYour tongue darts into every groove of his twitching stallion head, bathing it in your warm saliva. Sliding your hands up, you wrap them around his sizable sheathe. He’s so big your fingers strain to meet! Not letting anything rush you, not even your own desire, you stroke his impressive horse cock with long, lusty strokes, lightly wringing it with your digits.");
	output("\n\nTee lets out a deep, rumbling groan and arches his hips into your eager hands and mouth. You blow air gently on his glistening tip and watch him shiver with delight from the mixed sensations. You’re rewarded as a thick bead of pre drools out of his sizable urethra, and you lean forward to greedily lap it up. Drool runs down your cheeks as you slide your [pc.tongue] inside of his cock hole, delving for every drop of his delicious bull sperm.");
	output("\n\nWhen you pull back, you’re delighted to see a thin string of his glistening spunk stretching from the tip of his flat tipped stallion to your tongue. You pull back and back until it breaks and spills down your chin and chest, feeling a giddy rush of delight. You dive back for more, sucking and nursing his tip, all the while wringing his base for more of his heady cream. Every drop is heaven in liquid form, and you want more--!");
	output("\n\nSpurred forward by lusty need, you try to slide your [pc.lips] around his massive cock head, feeling your jaw strain with the effort. The second Tee’s dick touches your tongue, you’re utterly swept up in his incredibly strong taste, and another dollop of pre erases all other thoughts. You close your eyes, utterly content to suck his mighty flat-tipped stallion, sucking and trembling as his hot sperm slides down your throat.");

	output("\n\nSuddenly, you feel his powerful hands reach around behind your head. You offer no resistance as the burly bull encourages you to take his girthy member inch by inch. You moan and tremble with delight as his big, strong member fills out your narrow throat, claiming it as his and stretching to fit his incredible shape. Your [pc.thighs] deliciously quiver - you’re not sure how much hotter you can get until you’re liberally creaming ");
	if((pc.hasCock() || pc.hasVagina()) && pc.lowerUndergarment.shortName != "") output(" in your [pc.lowerUndergarment]!");
	else output("yourself!");

	output("\n\nWhen his flat-headed stallion cock finally bottoms out deep in your gullet, you swoon with absolute delight. You gurgle noisily around Tee’s cock, your nose buried deep against his mighty base. You dizzyingly inhale his musky, masculine scent as more pre-cum drools down your throat. Sucking on his cock feels so right, like it belongs in your mouth!");
	var called:Boolean = (rand(2) == 0);
	//50% chance of this occurring / Phone call during BJ
	if(called)
	{
		output("\n\nThere’s a beeping on Tee’s console, but you’re too high from sucking his glorious cock to notice. You’re barely aware of him groaning and ushering you underneath the desk, or the governor pressing the accept call button. You keep happily sucking him off, greedily worshipping his cock from between those powerful muscled thighs.");
		output("\n\n<i>“Governor Tee! I’m glad I got ahold of you. A shipment of milk has gone missing. The ship hands got distracted in the milking pen again!”</i> An irritated voice exclaims from above your head.");
		output("\n\nIs someone distracting him from your wonderful blowjob, and more importantly, from getting your delicious bull cream? You cradle his massive, virile balls in your hands and bob your head back and forth, deliberately trying to distract Big T from the call, feeling a naughty, possessive instinct overtake you. Your eyes flick upwards, eagerly watching his reaction.");
		output("\n\nBig Tee can’t help himself, roughly thrusting his hips to meet your every motion. His flat tip flares in your throat as he struggles to control himself. <i>“A-ah heck! I’m sure that milk’ll show up soon enough, maybe sooner than you think--?”</i> He grabs your head and grinds you against his base, and your [pc.thighs] tremble with delight.");
		output("\n\nAs the man on the screen complains more, you slide your tongue teasingly along the underside of his mammoth cock, and Tee’s eyes roll back. <i>“Tee, are you rolling your eyes at me--?!?”</i> The man yells. ");
		output("\n\nCompletely ignoring him, Tee suddenly grabs your head and shoves forward, letting out a bellowing roar. <i>“...I’M COMING--!”</i> You utterly bliss out as he buries his flat-tipped horse cock down your throat, where it flares and explodes. Thick jets of hot bull semen slides down your gullet and you swallow Tee’s cum eagerly, trembling as it slides into your eager belly.");
		pc.exhibitionism(1);
	}
	else // No phone call
	{
		output("\n\nDesperate for more of his spunk, you greedily worship his cock from between those powerful muscled thighs. With a spare hand you cradle his massive, virile balls in your hands, all the while bobbing your head back and forth on his delicious meatstick. Your eyes flick upwards, eagerly watching his reaction.");
		output("\n\nBig Tee can’t help himself, roughly thrusting his hips to meet your every motion. His flat tip flares in your throat as he struggles to control himself. He grabs your head and grinds you against his base, and your [pc.thighs] tremble with delight. You up the ante, sliding your tongue teasingly along the underside of his mammoth cock, and his eyes roll back.");
		output("\n\nUnable to hold out any longer, Tee suddenly grabs your head and shoves forward, letting out a bellowing roar. You utterly bliss out as he buries his flat-tipped horse cock down your throat, where it flares and explodes. Thick jets of hot bull semen slides down your gullet and you swallow Tee’s cum eagerly, trembling as it slides into your eager belly.");
	}
	output("\n\nYour [pc.thighs] shake spastically and you ");
	if((pc.hasCock() || pc.hasVagina())) 
	{
		output("drench ");
		if(pc.lowerUndergarment.shortName != "") output("your [pc.lowerUndergarment]");
		else output("them");
		output(" with your ");
		if(pc.hasCock() && !pc.hasVagina()) output("[pc.cum]");
		else if(!pc.hasCock() && pc.hasVagina()) output("[pc.girlCum]");
		else output("[pc.cum] and [pc.girlCum]");
	}
	else output("thoroughly cream yourself");
	output(". Every inch of your body trembles as an indescribable joy fills your entire being, and you know it has to do with Tee’s gooey cream spurting and sliding down your throat.");
	output("\n\nYou hold out for as long as you can, before his sheer potency makes you pull back and slide his spasming horse-cock from your semen-slick mouth. Tee’s thick creamy jizz splatters all over your [pc.face] and [pc.chest], coating them in his sloppy spooge. You look up at him with dazed [pc.eyeColor] eyes, your cheeks and front slathered with his glorious seed, ");
	if(pc.lowerUndergarment.shortName != "") output("and your [pc.underGarment] utterly soaked.");
	else output("quivering with delight.");

	output("\n\n");
	//If called: 
	if(called) output("You dreamily realize the man on the line has logged off, apparently thinking he was being yelled at. ");
	output("A little giggle rises from your throat as you rub Tee’s slick, musky seed into your [pc.skin], utterly drunk off the warmth and smell of his zesty spunk. You’re not the only one turned on by your state, as Tee lets out an animalistic rumble.");
	output("\n\n<i>“Oooh, " + pc.mf("boy","girl") + ", you have NO idea how sexy you look right now. I could fuck those [pc.lips] all over again,”</i> Tee lustily growls. His sticky stallion is stirring once more between those powerful thighs, and you swoon with delight. Another round--?");
	processTime(12);
	var ppBigT:PregnancyPlaceholder = getBigTPregContainer();
	pc.loadInMouth(ppBigT);
	pc.loadInMouth(ppBigT);
	pc.loadInMouth(ppBigT);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",bigTCockSuckPartII);
}
public function bigTCockSuckPartII():void
{
	clearOutput();
	showBigT(true);
	author("JimThermic");
	output("<b>-- Some Time Later --</b>");
	// An hour
	output("\n\nWhen you finally leave Big T’s office, you’re barely able to put one foot in front of the other without tripping. You hold your [pc.gear] to your cum covered [pc.chestSimple]. You’re in a complete daze as you stumble giddily pass his receptionist,");
	if(!pc.isNude()) output(" half");
	output(" naked and too spaced out to care.");
	output("\n\nAs you leave, you barely register the governor buzzing Zephyr on the intercom, and the rough, breathless voice that follows. <i>“...Cancel my next few appointments, Zephyr. This bull’s all worn out!”</i>");
	sexedBigT();
	// Might want to kick the player two squares south after this. 
	flags["FUCKED_BY_BIGT"] = 1;
	processTime(59);
	pc.orgasm();
	currentLocation = "526";
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Drunken Cowgirl/Boy
// Must be able to vaginally or anally take Big T's cock.
// Big T's cock is 24 inches long and about six inches wide. Fuckhuge bullcock.
//700
public function drunkenCowgirlBoy():void
{
	clearOutput();
	showBigT(true);
	author("JimThermic");
	pc.imbibeAlcohol(60);
	var x:int = pc.cuntThatFits(400);

	output("<i>“");
	if(!pc.isTreated()) output("Whoa there, cowboy. How about we knock back a few drinks and see where things go from there?");
	else output("Mmmm, I’d totally love that. Drinks first?");
	output("”</i> You ");
	//untreated:
	if(!pc.isTreated() && !pc.isBimbo()) output("wink");
	else output("giggle");
	output(", gesturing towards the bottle of fine reserve New TX whiskey on his shelf. You can’t play <i>that</i> easy to get - not without a little foreplay!");
	output("\n\nThe broad-brimmed texan bull raises an eyebrow and lets out a throaty chuckle. <i>“Like the fine stuff, eh " + pc.mf("boy","darlin’") + "? Why not!”</i> He pulls out two crystal clear whiskey glasses and pours a good wallop of the amber fluid into each. <i>“Hope you like ‘em neat, ‘cause I don’t serve them any other way - it’d be disrespectful to the liquor.”</i>");
	output("\n\nSitting down and leaning back into his massive, comfy looking chair, Big T shoots you a charming grin. You grab your own glass and sit up on his desk rather seductively, knocking back your glass.");
	output("\n\nAs soon as you’re done, he tops it up, and soon you’re going shot for shot.");
	output("\n\nWith each drink, you feel a slow flush spreading across your [pc.skinFurScales]. The fuzzy sensation in your head makes it hard to want to worry about it, though. After a lot of laughs and several drinks, your eyes greedily gravitate towards the sizable bulge in his slacks.");
	output("\n\nTee seems to notice your stare, and brazenly unzips his pants. You gasp as the bull displays his prodigious prick, his flat-tipped glans flaring cheekily before your eyes. Talk about rearing your head!");
	output("\n\n<i>“Still fancy a ride, " + pc.mf("handsome", "cowgirl") + "?”</i> the muscular man offers once more. One of his hands wrap around his fleshy length, stroking it slowly. It steadily rises, like an impressive monument of manhood sticking out of his business slacks.");

	output("\n\nWithout a moment’s hesitation, you begin stripping off your [pc.gear]. You can feel Tee’s eyes hungrily swallowing up the sight of your naked [pc.skinFurScalesNoun], and enjoying the sight of your bare [pc.chestNoun]. Once you’re completely in the buff, Tee takes off his cowboy hat and places it on your head. Somehow being allowed to wear it feels special, and you flush with delight.");

	output("\n\nNow properly attired for bull riding, you climb into the burly man’s lap and wrap your arms around his wide, muscular neck. With no small amount of trepidation -- and excitement -- you graze the tip of his equine head ");
	if(x >= 0) output("between your [pc.thighs] and");
	else output("between your [pc.butts] and");
	output(" against your ");
	if(x >= 0) output("[pc.vagina " + x + "]");
	else output("[pc.asshole]");
	output(". You shiver with delight as it flares against your ");
	if(x >= 0) output("silky lips");
	else output("sensitive pucker");
	output(" - he truly is a raring bull!");

	output("\n\nYou drunkenly grind against him, teasing his strong, pulsing cock with your ");
	if(x >= 0) output("silky [pc.pussyColor] folds");
	else output("[pc.skinColor] rump");
	output(". Tee is moaning out loud and rocking to your sensuous rhythm, his powerful hands upon your waist. Suddenly you feel a gooey surge against your ");
	if(x >= 0) output("[pc.vagina " + x + "]");
	else output("[pc.asshole]");
	output(", and you flush with delight - seems the bull is enjoying himself!");

	output("\n\nGyrating your hips in slow, insistent circles, you smear your ");
	if(x >= 0) output("[pc.vagina " + x + "]");
	else output("[pc.asshole]");
	output(" with his slick bull cream. Once you’re thoroughly lubed up with his warm, lumpy cum, he eases himself inside of you. Inch by inch, you feel Tee’s glorious stallion filling you up, and your [pc.thighs] tremble with delight.");
	if(x >= 0) pc.cuntChange(x,400);
	else pc.buttChange(400);

	output("\n\nWhen his awesome tip bottoms out inside of your ");
	if(x >= 0) output("snatch");
	else output("butt");
	output(", you let out a dreamy sigh, squeezing your arms around his neck. The stocky stud flexes his impressive love muscle inside of you and you squeal with delight, your inner walls rippling spasmodically around his shaft. A hot rush washes over your loins, and you ");
	if(pc.hasCock() && pc.hasVagina()) output("spurt your [pc.cum] all over his washboard abs. Your [pc.girlCum] naughtily gushes and dribbles down his length, and you excitedly flush - ");
	else if(pc.hasCock()) output("spurt your [pc.cum] all over his washboard abs. You excitedly flush as your seed dribbles lewdly down [pc.eachCock] - ");
	else if(x >= 0) output("cream yourself around him. Your [pc.girlCum] naughtily gushes and dribbles down his length, and you excitedly flush - ");
	else output("spasm from a minor orgasm. Afterwards, you excitedly flush - ");
	output("you can’t believe you just came from him entering you!");

	output("\n\nTee grins and begins bouncing you in his lap. You moan out loud, drunkenly digging your fingers into the back of his neck as your [pc.chest] bob");
	if(pc.biggestTitSize() >= 1) output("s");
	output(" before his lips. His mouth is soon pressed against your [pc.nipples], sucking and teasing them, while you’re thoroughly pounded from below. You’re utterly overwhelmed with the delicious sensations assaulting your body, ");
	if(x >= 0) output("your [pc.pussy] still super-sensitive from your orgasm.");
	else output("and your inner walls quiver and clench his thrusting sheath.");

	output("\n\nSuddenly you hear a loud smacking noise and feel a delicious sting on your [pc.ass] - Tee just spanked you! You’re turned on by the hot throbbing of your buttock and the impressive clapping noise, heightening your excitement. The huge stud spanks and squeezes your buttocks, teasing them just like your [pc.chest], and assaulting your entire body with electrifying sensation. You’re in the hands of a master, and he plays you like an instrument, bringing you ever closer to glorious crescendo. Lewd, smacking noises fill the air where your loins meet, yours and his becoming stickier with every passing moment.");
	output("\n\nYou cum again and again, losing track of how many times you’ve ");
	if(pc.hasCock() && pc.cumQ() >= 10 && x >= 0) output("splattered his muscular abdomen and sheath in your [pc.cum] and [pc.girlCum]");
	else if(pc.hasCock() && pc.cumQ() >= 10) output("splattered his muscular abdomen with your [pc.cum]");
	else if(x >= 0) output("trembled and drenched his sheath in your [pc.girlCum]");
	else output("trembled and came around his glorious length");
	output(". You’re a helpless traveler on the sea of lust, bouncing wildly in his lap and letting out pleasured cries as he as he feverishly pistons your ");
	if(x >= 0) output("[pc.vagina " + x + "]");
	else output("[pc.asshole]");
	output(" from below. Your insides clench and ripple around his thick manhood, bringing him to his peak.");
	output("\n\nWithout warning, Tee tightly grabs your waist and slams you down onto him, his flaring tip spewing potent bull seed ");
	if(x >= 0)
	{
		if(pc.isPregnant(x)) output("directly into your eager womb");
		else output("directly into your eager passage");
	}
	else output("deep into your trembling bowels");
	output(". The searing heat fills you up and you squeal shrilly in delight, cumming spastically once more around his pulsating prick.");

	output("\n\nHis incredible girth seals up your ");
	if(x >= 0) output("[pc.vagina " + x + "]");
	else output("[pc.asshole]");
	output(" leaving nowhere for his wildly spurting spunk to go. Soon you’re bloated with his seed, your stomach swelling to accommodate it until your belly is ");
	if(!pc.hasPregnancy()) output("full and round. You delightedly sigh and rub the [pc.skinFurScales] of your stomach - it’s like you’re pregnant with Tee’s baby.");
	else output("even bigger than before. You delightedly sigh and rub the [pc.skinFurScales] of your stomach - it’s like you’re pregnant with several children instead of one!");
	output("\n\nIn your shared post orgasmic haze, you passionately make out for a while, totally plugged up on his lap. When the new texan governor pulls you off, his lumpy cream gushes out from your dilated ");
	if(x >= 0) output("[pc.vaginaNoun " + x + "]");
	else output("[pc.assholeNoun]");
	output(". The sensation of glorious release pushes you over the brink. You cry out and climax once more, his steamy semen unloading from your well-worn ");
	if(x >= 0) output("snatch");
	else output("ass");
	output(".");

	output("\n\nWhen you finally leave Big T’s office, you’re barely able to put one foot in front of the other without tripping. You hold your [pc.gear] to your chest, your [pc.thighs] utterly coated in bull cum. You giddily pass his receptionist,");
	if(!pc.isNude()) output(" half");
	output(" naked and too spaced out to care. What a ride!");
	// Might want to kick the player two squares south after this. 
	flags["FUCKED_BY_BIGT"] = 1;
	processTime(70);
	var ppBigT:PregnancyPlaceholder = getBigTPregContainer();
	if(x >= 0)
	{
		pc.loadInCunt(ppBigT, x);
		pc.loadInCunt(ppBigT, x);
		pc.loadInCunt(ppBigT, x);
	}
	else
	{
		pc.loadInAss(ppBigT);
		pc.loadInAss(ppBigT);
		pc.loadInAss(ppBigT);
	}
	pc.orgasm();
	sexedBigT();
	currentLocation = "526";
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Pitch T
//Pitch Big T over table.
public function pitchTOverATable():void
{
	clearOutput();
	showBigT(true);
	author("JimThermic");

	var x:int = pc.cockThatFits(500);
	if(x < 0) pc.smallestCockIndex();

	output("Not one to be outdone, you pointedly ");
	//not rear dick:
	if(!pc.isTaur()) output("grind your own package against Tee, showing him he’s not the <i>only</i> one with one of those.");
	else output("squeeze Tee’s firm, muscular ass.");
	output(" <i>“I like the idea of a bull ride - but only if I’m the one riding the bull,”</i> you sultrily tell him.");

	output("\n\nTee’s powerful brows shoot up, not to mention the impressive bulge in his pants. <i>“Lookin’ to ride the biggest bull about, eh? Can’t say I don’t enjoy a good cock every now and then - just ask Zephyr!”</i> he chuckles. It seems he’s on board with the idea of taking your [pc.cock " + x + "]!");

	output("\n\nBoth of you start feverishly making out as you strip off each other’s gear. Once");
	if (!pc.isNude()) output(" you’re both");
	else output(" he’s");
	output(" completely in the buff -- with the exception of his stetson -- the huge, heavyset bull bends over the desk. You run your fingers down his impressively defined back. Each muscle is so perfect and well defined - it’s quite the sight to see him bent over like this!");

	output("\n\nLetting your digits descend, you firmly grab his posterior in both hands. His hard asscheeks are built for thrusting and squeezing - he’s truly a perfect stallion of a man. Tee trembles as you squeeze and tease his well developed rump, clearly getting off on your forceful grip. Between his thick thighs, you can see the bull’s gigantic flat-tip horsecock beating against the desk - someone’s raring to go!");
	output("\n\n<i>“Oh, you’re really getting into this. I wouldn’t think you were the sort, governor,”</i> you cheekily tease. At the same time, you slip one of your fingers between his buttocks. His pucker is so large compared to your finger that it’s a cinch to slip it inside. Once you realize how easy it is, you slip in two more fingers.");
	output("\n\nTee groans with pleasure as you wiggle your digits around inside of his massive ass. <i>“Ain’t got no problems with pleasure, darlin’. I reckon we bulls wouldn’t have such sensitive butts if we ain’t supposed to poke around in ‘em!”</i>");
	output("\n\nYou reach down between Tee’s thighs and tease his hefty sack with your fingers. At the same time you massage and milk his prostate. The low, rugged noise of pleasure and his clenching anus tells you you’re definitely hitting the right spot. What a large sweet zone this big man has!");
	output("\n\n<i>“Your fingers are great, darlin’, but how’s about you try something a little deeper?”</i> The bare-assed bull leans over his desk, presenting himself to you. Seeing the powerful male governor offer himself to you wearing nothing but a cowboy hat gets your blood flowing, especially to your [pc.cocks]! You grab his hips and grind yourself between those massive asscheeks. A single clench of his cheeks makes you groan out loud. He has amazing control of his glutes and sure knows how to use them!");
	output("\n\n<i>“Fuck my ass, " + pc.mf("boy","girl") + ", I want to feel you inside of me!”</i> Tee gruffly coaxes you, all the while clenching your [pc.cock " + x + "] hard between his muscular buttocks and grinding back against you. Each backwards push strokes off your straining hard shaft");
	if(pc.cockTotal() > 1) output("s");
	output(" in the most delicious way, sending jolts of delight coursing through your loins.");

	output("\n\nYou moan and look forward, only to see Tee looking back with a cheeky white-toothed grin. You grab his steer horns and pull your [pc.cocks] back - you’re going to fuck him all right! With a powerful thrust, you bury your [pc.biggestCock] deep inside of his massive pucker and sink it right down to the hilt. The governor groans as your [pc.biggestCockHead] teases the deepest part of his rectum, flexing and stretching against his warm insides.");
	pc.cockChange();

	output("\n\nA single flex of his donut around your [pc.sheath] and your mind utterly blanks with pleasure - one second the bull’s ass is loose, the next it’s achingly tight! It’s like your [pc.biggestCock] is on a rollercoaster ride. Giving yourself over to carnal desire, you grind your hips against his muscular ass, thoroughly fucking the big bull’s ass from behind with lusty abandon.");
	output("\n\nYour hips slap together in primal rhythm, the air filled with urgent gasps and deep moans. His velvety hot insides squeeze and wring your thrusting [pc.cockNounSimple " + x + "]. Each time you thrust, his powerful hips push back to meet you, rubbing your [pc.cockHead " + x + "] deep in his ass before pulling out again. Suddenly clenching his horns is a necessity!");
	var teesButt:int = 1;

	// Multicocks
	if(pc.cockTotal() > 1)
	{
		var y:int = pc.smallestCockIndex();
		if(pc.cockVolume(x) + pc.cockVolume(y) < 500)
		{
			teesButt = 2;
			output("\n\nBefore you know it, you’re backing up and slipping another cock into his spacious ass. Your doubled dicks press together and rub deep inside his accommodating back door. When he clenches around your tightly packed shafts, you’re in exquisite, all consuming bliss, your cocks being wrung by this burly bull’s ass at once!");
		}
	}
	output("\n\nSuddenly you’re increasing speed to a frenzied pace, utterly pounding Tee’s ass as you revel in the exquisite pleasure seizing your [pc.cocks]. Forcefully grabbing his hips, you thrust and grind your ");
	if(teesButt > 1) output("dickheads");
	else output("dickhead");
	output(" against his prostate, leaking your [pc.cumVisc] pre against his buzzer.");
	output("\n\nIt’s too much for Tee, and with a bellowing cry the heavyset bull climaxes, clenching your ");
	if(teesButt > 1) output("phalli");
	else output("phallus");
	output(" in a vice like grip as he unloads all over his own desk. Gigantic loads of creamy bull spunk shoot all over his mahogany desk, coating it in his thick and virile spunk as he spasms around your shaft");
	if(teesButt > 1) output("s");
	output(". Seeing the massive bull unload with your dick");
	if(teesButt > 1) output("s");
	output(" in his ass sends you right over the edge as well, and you climax hard with him.");

	output("\n\nYour orgasm is throttled, however, as your [pc.cum] surges up your [pc.cocks] only to be obstructed by his clenching ring. You’re utterly consumed by mind-numbing pleasure as you’re forcefully kept at the pinnacle of your climax. Pleasure-pain seizes your loins, your release denied, until Tee’s ass finally lets up. Your [pc.cum] explodes into his ass all at once and you nearly black out, holding onto his horns for dear life.");

	output("\n\nYou cling to them and spurt burst after burst of spunk into the big bull’s ass. Finally you can hold yourself up no more and fall against his muscular back. You can feel yourself quivering, and he too, both of you absolutely wrecked from your respective orgasms. It takes you a long time to slide off, and when you finally do, your [pc.cumVisc] [pc.cumNoun] drools down his barrel-like thighs, coating them in [pc.cumColor].");
	output("\n\n<i>“...Hot damn. It’s been a long time since I’ve came like that from a bull ride!”</i> Tee guffaws. It takes him a while to turn around on his wobbly legs and seat himself in his chair. <i>“Ahh--! I don’t think I’m going to be walking anywhere for the rest of the day, no siree.”</i>");
	output("\n\nAfter slipping your gear back on, you say goodbye to Tee and slip out. You notice Zephyr is giving you a smug, knowing look. Well, it wasn’t exactly like the two of you were quiet, and she’s probably familiar with his noise....");
	// Might want to kick the player two squares south after this. 
	flags["FUCKED_BY_BIGT"] = 1;
	processTime(29);
	pc.orgasm();
	sexedBigT();
	currentLocation = "526";
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function sexedBigT():void
{
	if(flags["SEXED_BIG_T"] == undefined) flags["SEXED_BIG_T"] = 0;
	flags["SEXED_BIG_T"]++;
}

//Get Ridden
// Option to choose Vaginal or Anal Sex for this scene if PC has a vagina. 
public function getRiddenByBigT():void
{
	clearOutput();
	showBigT(true);
	// Decides if Tee is fucking the PC's vag or ass. Figured I'd give the girls at least one scene option to get some buttsex on. 
	if(pc.hasVagina())
	{
		output("Does he take you in your pussy, or your ass?");
		//[Pussy] [Ass]
		clearMenu();
		var x:int = pc.cuntThatFits(400);
		if(x < 0) x = rand(pc.totalVaginas());
		addButton(0,"Pussy",getRiddenByBigWheee,x);
		addButton(1,"Ass",getRiddenByBigWheee);
	}
	else getRiddenByBigWheee();

}

public function getRiddenByBigWheee(target:int = -1):void
{
	clearOutput();
	showBigT(true);
	output("All it takes is the slightest of nods. Just one tiny dip of your head and the handsome bull begins to unzip his pants. You part your lips with anticipation. A needy flush runs across your [pc.skinFurScales].");
	output("\n\nThings get even hotter when he flops out his stupendously huge stallion cock. His pink-headed prick flares invitingly to you, beckoning you closer. You find yourself wandering forward under its spell. When you reach him, you are guided down ");
	if(pc.hasKnees()) output("on your knees ");
	output("until your [pc.lips are] inches away from his loins.");

	output("\n\n<i>“Lick it,”</i> Tee commands you, his voice rumbling like thunder. The order makes your heart flutter a little, and you find yourself obediently inching forward. You reach out and run your [pc.tongue] along his fleshy sheath. Each and every tastebud meekly brushes along the alpha male’s manhood. You worship it with your mouth, lapping up and down, slathering it with your sticky saliva in the process.");
	output("\n\nHis prodigious prick begins to thicken and inch upwards. A rush of pride rises within your chest as you realize you’re doing a good job. Spurred on by his arousal - and turned on yourself - you suckle gently on his low-hanging spheres. There, his bullish scent is dizzyingly rich. Without thinking, you find yourself burying your face in his balls - drinking in his musky masculine smell - and letting out a muffled moan of delight.");
	output("\n\n<i>“Mmm, like the smell of a home-grown bull, darlin’?”</i> His powerful digits ");
	if(pc.hasHair()) output("run through your [pc.hair]");
	else output("stroke the top of your head");
	output(". You respond with an animalistic moan and nod against his crotch. There’s a fiery furnace between your [pc.thighs] and you physically ache with desire. You want this alpha bull sliding inside and filling you up, the sooner the better!");
	output("\n\nYou don’t have to wait long before Tee is grabbing your waist with his huge hands and turning you around to face his desk. You’re pushed forward until your [pc.chest] " + (pc.biggestTitSize() > 1 ? "are":"is") + " pressed flush with the flat surface. Those powerful hands of his");
	if(pc.armor.shortName != "") 
	{
		output(" frantically strip off your [pc.armor].");
		//Armor + lowerundergarment= <i>“ 
		if(pc.lowerUndergarment.shortName != "") output(" They then");
	}
	//lowerundergarment:
	if(pc.lowerUndergarment.shortName != "") 
	{
		output(" drift down your [pc.hips] and slide down your [pc.lowerUndergarment]. He doesn’t stop until your undies are ");
		//KneesYes: 
		if(pc.hasKnees()) output("down at your [pc.knees]");
		else output("at your [pc.feet]");
		output(".");
	}
	if(!pc.isCrotchGarbed()) output(" explore your wanton, exposed flesh.");

	output("\n\nYou flush with delight; you’re bent over the governor’s desk with your [pc.ass] in the air and your [pc.groin] totally exposed to him. You can’t see what’s going on anymore! He suddenly spanks one of your bare buttocks, filling it with a delicious, throbbing ache. The animalistic act heightens your excitement, and you wiggle your butt out at him, inviting him to do more. Your needy ass is lewdly spanked until it is throbbing and red, covered in his impressive handprints.");

	output("\n\nWhen he stops, you let out a dizzy moan, utterly high off the endorphins from your thorough spanking. There’s something <i>hard</i> and <i>thick</i> sliding between your [pc.skinTone] buttocks, and you’re fairly sure you know what it is. Your sensitive rump throbs against his stallion cock and thrums against his turgid length.");

	output("\n\n<i>“If you want it, darlin’, you’d best ask,”</i> Tee teases you. His hands are firm on your naked [pc.thighs]. You’re caught between the desk and his <i>very</i> hard place. You feel dominated like a mating mare, primed and put in position by a powerful alpha male. A deep, yearning urge to be bred sweeps over you and the last of your self-restraint crumbles. Needily grinding your [pc.ass] against his erection, you beg for him to fuck ");
	if(target >= 0) output("your pussy");
	else output("it long and hard");
	output(", desperate for his cock inside of you.");

	output("\n\nYour fondest desires are soon granted. The powerful bull positions himself at your ");
	if(target >= 0) output("[pc.vaginaNoun " + target + "]");
	else output("[pc.ass]");
	output(" and, after rubbing his flat tip against your ");
	if(target >= 0) output("[pc.pussyColor " + target + "], silky lips");
	else output("[pc.asshole]");
	output(", buries himself deep inside of you. You moan and press your [pc.hips] back to accept his firm flesh, eager for him to be inside of you. Inch by inch, Tee slowly sinks inside of you, filling you up. When his girthy base kisses your ");
	if(target >= 0) output("parted petals and his tip kisses your womb");
	else output("parted pucker");
	output(", you feel so utterly filled and complete. It all feels so <i>right</i>!");

	if(target >= 0) pc.cuntChange(x,400);
	else pc.buttChange(400);

	output("\n\nSlowly, you feel his mighty hips begin to pull back, and with it, his rigidity slides out of your ");
	if(target >= 0) output("[pc.pussyNoun " + target + "]");
	else output("[pc.ass]");
	output(". You moan with delight as it returns once more with gusto, thrusting hard into your hot depths. You cling to the desk");
	if(pc.lowerUndergarment.shortName != "") 
	{
		output(", [pc.lowerUndergarment] down at your [pc.feet],");
	}
	output(" as you are heartily fucked from behind by your lusty bull lover. Every flare of his flat head teases your clenching inner walls and sends explosions of hot pleasure through your loins. You’re on a rollercoaster of pleasure and you hold on for dear life as you’re taken for a ride!");
	output("\n\nFrom behind you, you can hear his bellowing moans and feel the slapping of his hips against your [pc.ass]. Your [pc.nipples] rub and caress the desk below");
	if(pc.isLactating()) output(" and you excitedly smear it with your dribbling [pc.milkNoun]");
	else output(", sending rivulets of pleasure coursing through your [pc.breasts]");
	output(". Tee’s turgid length slides in and out of your ");
	if(target >= 0) output("soft sex, utterly stirring you up and pressing deep into your warm, wet pussy.");
	else output("tight ass, utterly stirring you up and pounding deep inside of your clenching butt.");

	output("\n\nYou can feel his engorged flesh flaring inside of you and pressing hard against your ");
	if(target >= 0) output("cervix");
	else output("bowels");
	output(", messily dribbling his bullish seed in your deepest parts. Seized with feverish thoughts, you clench his hardness with your ");
	if(target >= 0) output("[pc.vagina " + target + "]");
	else output("[pc.ass]");
	output(", desperate for his release.");

	output("\n\n<i>“Cum inside of me-!”</i> you cry out, your ");
	if(target >= 0) output("moist");
	else output("tight");
	output(" inner walls rippling around his swollen stallion. Tee firmly seizes your hips");
	if(target >= 0) output(" and presses his flaring head hard against your precious entrance, sealing it up");
	output(". With a deep roar, the alpha bull unloads his thick, ");
	if(target >= 0) output("fertile seed inside of your [pc.vagina " + target + "], thick hot jets spurting out and flooding up into your eager womb.");
	else output("gooey seed inside of your butt.");
	output(" You cum long and hard,");
	if (target >= 0) output(" drenching his hardness with your [pc.girlCum],");
	output(" as your insides are simultaneously filled with Tee’s delectable warmth.");
	output("\n\nBoth of you moan together, his hard muscled chest pressed against your back, trembling and spasming together for what seems like an eternity. Your ");
	if(target >= 0) output("loins are");
	else output("ass is");
	output(" fiercely hot and sticky. You both stay like that for a while longer, your sweaty bodies pressed against each other, relishing in the afterglow.");

	output("\n\n<i>“Mmm, now that was amazing...”</i> Tee rumbles and kisses your shoulders. You shiver with delight - your whole body feels hypersensitive right now! When he finally sides out of you, you immediately feel empty, and his thick, creamy seed messily spills down your [pc.thighs]. You hear a rumbling of arousal behind you - no doubt the bull is looking at your gaping, claimed ");
	if(target >= 0) output("snatch");
	else output("ass");
	output(". You turn your head, and see his slickened rod hardening once more - what stamina!");
	output("\n\n<i>“Darlin’, you look damn sexy right now bent over my desk. I’m thinking of keeping you there a little longer, properly mounted...”</i> Tee lustily growls. His powerful hands press down on your buttocks and you swoon with delight. How can you say no to another round-?");
	processTime(19);
	var ppBigT:PregnancyPlaceholder = getBigTPregContainer();
	if(target >= 0)
	{
		pc.loadInCunt(ppBigT, target);
		pc.loadInCunt(ppBigT, target);
		pc.loadInCunt(ppBigT, target);
	}
	else
	{
		pc.loadInAss(ppBigT);
		pc.loadInAss(ppBigT);
		pc.loadInAss(ppBigT);
	}
	pc.orgasm();
	sexedBigT();
	clearMenu();
	addButton(0,"Next",bigTFucksYouEpilogue);
}

public function bigTFucksYouEpilogue():void
{
	clearOutput();
	showBigT(true);
	author("JimThermic");
	output("<b>-- Some Time Later --</b>");
	// An hour
	output("\n\nWhen you finally leave Big T’s office, you’re barely able to put one foot in front of the other without tripping. You hold your gear to your cum covered [pc.chestSimple]. You’re in a complete daze as you stumble giddily pass his receptionist,");
	if(!pc.isNude()) output(" half");
	output(" naked and too spaced out to care.");
	output("\n\nAs you leave, you barely register the governor buzzing Zephyr on the intercom, and the rough, breathless voice that follows. <i>“...Cancel my next few appointments, Zephyr. This bull’s all worn out!”</i>");
	// Might want to kick the player two squares south after this. 
	flags["FUCKED_BY_BIGT"] = 1;
	processTime(59);
	pc.orgasm();
	currentLocation = "526";
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
