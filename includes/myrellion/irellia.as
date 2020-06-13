/*NAME EXPLANATION/NOTES
Lyralla smiles. <i>“She is Queen Irellia Ildris Nere vas Uldred.”</i>
Irellia - Queen name. Chosen.
Ildris - Assigned name.
Nere - Mother’s name.
vas Uldred - vas indicates a dwelling or location. Essentially that her headquarters is based in a place called Uldred.

Assorted Body Notes:
Four honey-dripping titties
Bigass abdomen with egg-gaped pussy at the back that frequently lays.
Frontcunt between her legs. Paid a fortune to get it modded in. Was risky due to inexperience with myr genetics.
Longish antennae
Chitin painted blue, skintone gold/orange.
Blue lipstick
11’3”</i> tall at her full height. Queens get big.
Eyesight is poor. Has glasses, but don’t they don’t help much.

Other notes:
Was low ranking, but is climbing in power rapidly. Outbirthing other queens in her age group now.
Spends a lot of time breeding (a necessity of her job).
Bullied as a child for her small stature. Becoming a Queen changed all that, of course.*/

public function irelliaMenu():void
{
	clearMenu();
	addButton(0,"Appearance",irelliaAppearanceYouSlutFuckGoddamnWhyYouGottaBeLeeringAtAQueenWhileSheTriesToRelaxDontBeSuchAFuckinPerv);
	addButton(1,"Discuss",discussSomethingWithAnAntQueen,irelliaMenu,"Discuss","Have a conversation with the ant queen about a variety of topics.");
	if(pc.lust() >= 33) addButton(2,"Sex",irelliaSexyTimesApproach)
	else addDisabledButton(2,"Sex","Sex","You aren’t turned on enough to be interested in seducing a queen!");

	if(!pc.hasStatusEffect("Royal Nectar")) addButton(4,"Snack",tittysnackWithIrellia,undefined,"Snack","Get a snack... directly from her nectar-filled teats.");
	else addDisabledButton(4,"Snack","Snack","Irellia does not want to share any more of her nectar with for now. Don’t be a glutton!");
	addButton(14,"Back",mainGameMenu);
}
public function irelliaSexMenu():void
{
	//Fuck Frontgina
	//Fuck da one between her legs. Back starts egging? Yiss.
	if(pc.hasCock() && pc.cockThatFits(300) >= 0) addButton(0,"FuckFrontgina",fuckIrelliasFrontGina,undefined,"Fuck Frontgina","Fuck the myr queen’s vagina - specifically the one between her legs.");
	else addDisabledButton(0,"FuckFrontgina","FuckFrontgina","You need a dick that will fit in her front vagina in order to make use of it in the bedroom.");
	//Tailfuck
	//For cocks any size smaller than gigantique (22 slot boners, yo)
	if(pc.hasCock() && pc.cockThatFits(2000) >= 0) addButton(1,"Tailfuck",tailFuck,undefined,"Tailfuck","Fuck the myr queen’s vagina - specifically the one mounted at the end of her egg-distended abdomen. It looks like it can handle quite a large dick.");
	else addDisabledButton(1,"Tailfuck","Tailfuck","You need a dick that will fit in the vagina at the end of her egg-bloated abdomen in order to have sex with it.");
	//Double-Team
	// Bacy JimT
	// Must be able to take a big ass myr cock. Probably 4 inches wide, 12-16 inches long?
	addButton(2,"DoubleTeam",doubleTeamingWithTheJimTOnSomeAntSlutQueenMayhapIDunno,undefined,"DoubleTeam","You, a drone (male) from her reserves, and the queen all have some fun. She’s probably got quite a lot of drones to choose from. <b>Note that a myr-cock will end up inside of you.</b>");
	//Quad Tittyfuck
	//Fuck four titties. That’s twice as many titties. TWO TIMES THE TITTIES!
	//Minimum 15”</i> dick
	if(pc.biggestCockLength() >= 15) addButton(3,"Tittyfuck",quadTittyFuckIrellia,undefined,"Tittyfuck","Have sex with all four of her breasts.");
	else addDisabledButton(3,"Tittyfuck","Tittyfuck","You need a dick big enough to reach through both rows of breasts in order to perform this act.");
	//Ladytime Sixtynines
	//Aww yiss
	if(pc.hasVagina()) addButton(4,"Sixtynine",ladyTimeSixtyNinesByFenbroxicoTheDestroyer,undefined,"Sixtynine","Sixtynine as only a pair of people sporting vaginas can!");
	else addDisabledButton(4,"Sixtynine","Sixtynine","You need a vagina in order to access this scene. There’s already three scenes (or more) for dick-wielders. This one is for the ladies!");
	addButton(14,"Back",irelliaMenu);
}

public function irelliaWantsSex():Boolean
{
	if(flags["IRELLIA_SEX_COOLDOWN"] == 0 || flags["IRELLIA_SEX_COOLDOWN"] == undefined) return true;
	return false;
}
public function irelliaSexBreak(arg:int = 8):void
{
	if(flags["IRELLIA_SEX_COOLDOWN"] == undefined) flags["IRELLIA_SEX_COOLDOWN"] = 0;
	flags["IRELLIA_SEX_COOLDOWN"] += arg;
	if(flags["IRELLIA_SEX_LEVEL"] == undefined) flags["IRELLIA_SEX_LEVEL"] = 1;
}

//Normal Appearance - Quest complete. Can be found in a different room (The east one, perchance?)
public function irelliasThroneroomBonus():Boolean
{
	output("\n\nQueen Irellia is lounging in a specially made recliner, her egg-swollen abdomen cradled by the woven fibers. A few handmaidens are her only company aside from yourself. Her face brightens at the sight of you.");
	addButton(0,"QueenIrellia",approachIrelliaInHerThrone);
	return false;
}

//Actually approach- first time
public function approachIrelliaInHerThrone():void
{
	clearOutput();
	showIrellia();
	if(flags["IRELLIA_TITTYSNACK_OFFER"] == undefined)
	{
		flags["IRELLIA_TITTYSNACK_OFFER"] = 1;
		output("Queen Irellia gives you a lazy wave as you approach. <i>“[pc.name]! I was beginning to think you’d never claim that private audience I offered you.”</i> Her lower arms heft a breast. <i>“May I offer you a snack?”</i>");
		if(pc.isBimbo() || pc.isBro()) output("\n\nYum!");
		else output("\n\nWell, that’s forward! Are you hungry?");
		processTime(1);
		clearMenu();
		addButton(0,"“Snack”",tittysnackWithIrellia,true);
		addButton(1,"Decline",irelliaMenu);
	}
	//Repeat Approach
	else
	{
		output("Queen Irellia is lying in her specially made recliner while a handmaiden carries away a recently-birthed egg, still slick with the queen’s juices. Her face brightens at the sight of you. <i>“[pc.name], my favorite star-walker! To what do I owe the pleasure?”</i>");
		irelliaMenu();
	}
}

//Tittysnack
public function tittysnackWithIrellia(queenOffered:Boolean = false):void
{
	clearOutput();
	showIrellia();
	output("<i>“I’m ");
	if(!pc.isBimbo()) output("famished");
	else output("fam...famish... uh... totally hungry");
	output(",”</i> you say while striding closer to the queen. Those four breasts are just so big and swollen with tit-honey. You can imagine the regent doesn’t allow many to sample their delights. You’re one of a select few, a thought that only serves to make your [pc.lips] feel more chapped and thirsty by the moment. ");
	if(!queenOffered) output("That pendulous breast is capped with a succulent, bronze nipple, already trailing amber nectar down its underswell, glittering in the muted light of the Irellia’s chamber.");
	else output("Irellia selects a pendulous breast and lifts it for you, allowing the amber nectar to trail from its bronzed nipple, setting it alight with reflections from her chamber’s muted illumination.");

	output("\n\nThe royal myr releases an eager groan as you close in, shifting her torso so that you can get at her nutrient-packed nipple");
	if(pc.tallness < 53) output(", considerate of your diminutive height");
	output(". <i>“These four breasts are so cumbersome, [pc.name]. You have no idea how wearying it can be to bear such weight at all hours of the day.”</i> She graces you with a wan smile. <i>“Though the draining can be quite fun. Go on, drink.”</i> She squeezes, spraying a solid stream of golden fluid in your direction. <i>“The girls who support Gildenmere by giving it out on the street are so lucky.”</i>");
	output("\n\nYou open your mouth and playfully catch some of the stream on your [pc.tongue], savoring the sinfully sweet taste of it. It’s an ambrosial mix of honey and maple, underlaid with another flavor like nothing you’ve ever savored before. Closing in, you brazenly lay your fingers around the oozing boob, wrapping them over the queen’s own, and seal your [pc.lips] to the nipple she’s presented you with. Sympathetic trickles graze your cheek, spilt from one of the other backed-up nipples.");
	output("\n\n<i>“Drink up, my star-borne champion, savor your bounty, your reward,”</i> Irellia coos encouragingly. She slips one of her arms around the back of your head and pushes you further into her bulging breast, physically demanding that you guzzle more of the sweet tit-treat. Swallowing greedily, you mentally chuckle; there are only a handful of scenarios you can imagine that would make you want to stop sucking, and none of them seem likely. Amber droplets bead at the corners of your mouth while you drink.");
	output("\n\nIrellia shifts you to her other bottom breast after a time. The drained nipple is puffy and stiff, shining with a layer of leftover spit and nectar. Nuzzling against her pillowy mound, you enjoy the quiet moment. The queen’s chitinous, blue-coated fingers stroke ");
	if(pc.hasHair()) output("through your [pc.hair]");
	else output("across your head");
	output(" fondly, relaxing you while you burrow deeper into her double-decker chest.");
	output("\n\nOver time, you lose yourself in the gentle rhythm of your own swallowing and the gentle thudding of the queen’s heart. The sublime taste coats your throat and fills your belly. You are aware of moving from breast to breast, shifting between the queen’s teats again and again, relishing in her freely-given honey.");
	output("\n\nWhen at last she pushes you away, it takes all four of her arms. Your [pc.belly] feels absolutely stuffed, yet you feel positively suffused with energy. You bet you could run laps around this section of the city without even breaking a sweat!");
	output("\n\nQueen Irellia slumps back, her jiggling breasts significantly reduced but still very large. <i>“Now, was there something else I could assist you with?”</i> The scent of honey is thick in the air, as well as a slightly muskier, more feminine scent. She must have enjoyed herself even more than you!");
	
	processTime(24);
	var ppIrellia:PregnancyPlaceholder = new PregnancyPlaceholder();
	ppIrellia.breastRows[0].breastRatingRaw = 15;
	ppIrellia.breastRows[0].breasts = 2;
	ppIrellia.breastRows[1] = new BreastRowClass();
	ppIrellia.breastRows[1].breastRatingRaw = 15;
	ppIrellia.breastRows[1].breasts = 2;
	ppIrellia.milkType = GLOBAL.FLUID_TYPE_NECTAR;
	ppIrellia.milkMultiplier = 100;
	ppIrellia.milkFullness = 100;
	pc.milkInMouth(ppIrellia);
	//Buff max energy by 40 for 2 days.
	pc.createStatusEffect("Royal Nectar",40,0,0,0,false,"Charmed","Irellia’s nectar has you feeling far peppier than normal.",false,2880)
	//Fill energy.
	pc.changeEnergy(pc.energyMax());
	//+20 lust.
	pc.changeLust(20);
	clearMenu();
	irelliaMenu();
}

//Discuss
public function discussSomethingWithAnAntQueen(cameFrom:Function):void
{
	clearOutput();
	showIrellia();
	output("<i>“I’d actually like to discuss something with you");
	if(pc.isNice()) output(", if you have the time");
	output(",”</i> you admit.");

	output("\n\nQueen Irellia shifts to more directly view you and gives an airy wave. <i>“Go on then, dear. It is not often I get the chance to converse with a star-walker myself. I delegated that duty to Lyralla. She has a knack for it, you know.”</i>");
	processTime(1);
	clearMenu();
	irelliaTalkMenu(cameFrom);
}

public function irelliaTalkMenu(cameFrom:Function):void
{
	clearMenu();
	if(cameFrom != talkToIrelliaAboutBirthing) addButton(0,"Birthing",talkToIrelliaAboutBirthing,undefined,"Birthing","Talk to Irellia about birthing. How do gold myr queens create so much life?");
	else addDisabledButton(0,"Birthing","Birthing","You just discussed that!");
	//Gildenmere?
	if(cameFrom != askIrelliaAboutGildenmere) addButton(1,"Gildenmere",askIrelliaAboutGildenmere,undefined,"Gildenmere","Ask about Gildenmere. What kind of city is it?");
	else addDisabledButton(1,"Gildenmere","Gildenmere","You just discussed that!");
	//What’s It Like?
	if(cameFrom != whatsItLikeIrellia) addButton(2,"BeingQueen?",whatsItLikeIrellia,undefined,"Being a queen?","What’s it like to be a queen?");
	else addDisabledButton(2,"BeingQueen?","BeingQueen?","You just discussed that!");
	if(cameFrom != askIrelliaAboutZeCeasefireYouDirtyFrenchie) addButton(3,"Ceasefire",askIrelliaAboutZeCeasefireYouDirtyFrenchie,undefined,"Ceasefire","Ask Queen Irellia what she thinks of the ceasefire.");
	else addDisabledButton(3,"Ceasefire","Ceasefire","You just discussed that!");
	addButton(14,"Back",irelliaMenu);
}

//Birthing
public function talkToIrelliaAboutBirthing():void
{
	clearOutput();
	showIrellia();
	output("<i>“How ");
	if(pc.isBimbo()) output("do you pop out so many kids?");
	else output("can you possibly birth so many young?");
	output(" Doesn’t it hurt?”</i> you ask.");
	output("\n\nIrellia stares at you for a long moment, then bursts into sudden laughter. <i>“You go through all that effort to get me in private... and you want to know how I manage to squeeze out a hundred kids in a day?”</i> She wipes a tear from her eye. <i>“You star-walkers are an odd bunch. Of course it doesn’t hurt! We aren’t degenerates, like those reds, who have forgotten the proper way to breed.”</i>");

	output("\n\n<i>“But that’s a LOT of birthing...”</i> You look her up and down, confused.");
	output("\n\nThe Queen chuckles and shakes her head, holding out a hand to forestall any further speech. <i>“Wait, wait. Do you mean to tell me that birthing hurts for your races? That it doesn’t leave you weak in the knees with pleasure? That your bodies don’t reward you for accomplishing your purpose in life?”</i>");
	output("\n\nYou blush and reply to the negative.");
	output("\n\n<i>“Well... that’s just terrible. I’m sorry to hear it, [pc.name]. Perhaps our peoples need each other more than I thought. You have so much technology to offer us, and we have such wondrous biological bounties to bring to the table.”</i> She taps her chin in thought. <i>“I will have to speak with Lyralla and the council on this in the future, but for now, let me educate you on why we golds are so libertine.”</i>");
	output("\n\nLeaning down over her abdomen, the queen gestures towards the slit at the end of it. <i>“That is a myr vagina, [pc.name]. Every female myr, queen and worker alike has one. Normally, they look a lot more compact and less... engorged than my own, but I assure you, they are quite elastic - one of the perks of having your reproductive organs stationed in their own chamber, away from your vitals.”</i>");
	output("\n\nShe sighs as a trickle of moisture begins to leak from the aforementioned feminine entrance. <i>“We lubricate quite readily since our bodies stockpile stores in the excess space in our abdomens.”</i> Seeing you blush");
	if(pc.isBimbo() || pc.libido() >= 70) output(" in arousal");
	output(", she smiles. <i>“There is no shame in it. Consider it a compliment.”</i>");

	output("\n\nYou ");
	if(pc.libido() < 33) output("stammer for words");
	else if(pc.libido() < 66) output("briefly consider flashing her to return the compliment, but think better of it");
	else output("grin brazenly back at her");
	output(".");

	output("\n\n<i>“Anyhow, we queens have significantly larger abdomens than our peers. They grow larger during our first pregnancy to support the weight of our eggs and larger still with successive births. Our vaginas enlarge proportionally.”</i> She stretches down, grunting and spreading her lower lips to show its size. Her passage shines like oiled gold. No wonder she can pass eggs without incident. She’s able to pull it until it’s gaped wide enough to display her cervix.");
	output("\n\nYou gasp in amazement.");
	output("\n\n<i>“It’s something else, isn’t it? Passing eggs feels amazing.”</i> Now it’s her turn to blush. <i>“I actually do my best to birth them in large batches nowadays. My abdomen might get a little swollen, but then I get to spend an hour feeling those beautiful orbs sliding through me, stroking and stretching me from the inside.”</i> Irellia shivers. <i>“It’s a very good hour.”</i>");
	output("\n\nYou stare at the brazen myr, a little surprised that she speaks so casually about sex.");
	output("\n\nIrellia waves casually in your direction. <i>“Temperatures below ground are fairly static. We’ve never had much need for clothing or concealing our sexuality from strangers or friends. And I want you to know that I do consider you a friend after what you did for my people - my girls... and my boys.”</i>");
	output("\n\nThanking her nervously, you point out the vagina between her legs. <i>“What about that?”</i>");
	output("\n\nThe Queen giggles at that. <i>“That, dear star-walker, is a vagina - loosely modelled after the terran design by your scientists. I paid a handsome bounty of gemstones and precious metals to convince them to design me a custom genetic modification in order to allow me to take in more sperm. This way, I can mate with twice as many drones at once, or have one fertilize my next batches of eggs while I’m birthing the other.”</i> She runs her fingers down either side of it. <i>“Of course, mine connects to my existing womb rather than to a uterus in the middle of my body.”</i>");
	output("\n\nYou’re at a loss for words by this point. Your eyes just widen.");

	output("\n\nShe smiles");
	if(pc.hasCock() && (!pc.isCrotchGarbed() || pc.biggestCockLength() >= 9)) output(" and takes in the sight of your suddenly erect crotch");
	else if(pc.hasVagina()) output(" and sniffs at the air, picking out the scent of third aroused vagina with ease");
	output(". <i>“Of course, it was an untested prototype. They warned me of all kinds of risks: heightened libido, undue vaginal secretions, persistent feminine arousal, clitoral swelling, and the like, but it was worth it.”</i> She dips a finger into her slit and pulls it out in order to lick the shining digit clean. <i>“Sure, I spend more time getting fertilized than most of my peers, and my clits are way more sensitive than the single one was, but I’m having more children than my rivals.”</i>");
	output("\n\nIrellia smooths her hair back and smiles happily. <i>“In a few years I could be one of the most powerful queens in the city. All I have to do is keep this up. Now, was there anything else you wanted to talk about?");
	if(irelliaWantsSex()) output(" Or did you want to do something </i>else<i>?");
	else output(" I’d love to have some fun with you again, but I should really breed with my drones some more before I take time for fun. Maybe come see me in a few hours?");
	output("”</i>");

	processTime(35);
	irelliaTalkMenu(talkToIrelliaAboutBirthing);
}

//Gildenmere?
//You ask about Gildenmere. What kind of city is it?
public function askIrelliaAboutGildenmere():void
{
	clearOutput();
	showIrellia();
	output("Irellia smiles broadly. <i>“Gildenmere? Gildenmere is the brightest jewel of hope left in this world. Our tunnels run deep. Our factories burn hot. Our people are provided with the best education and opportunities. Were it not for the war, this place would be a mecca of culture and civilization.”</i>");
	output("\n\n<i>“The war has changed the city?”</i>");
	output("\n\nThe Queen gives a sober nod. <i>“Indeed. With the loss of so many, we have lost access to crucial resources. Our best and brightest have had to turn their minds to methods of murder and destruction rather than the more noble arts and sciences. Tens of thousands of our daughters have marched into fire and death to buy us time to find a solution. Now whole city blocks are empty of inhabitants.”</i>");
	output("\n\nYou fumble for words, but Irellia shakes her head and continues talking.");
	output("\n\n<i>“It is all not all tragedy. Drones have been stepping up to fill gaps in society. Why, I even saw some working in a factory when I took a tour last week. Can you imagine that - a male doing dangerous work? They tell me the drones like it, that they want to be more than eye-candy and breeders.”</i> The queen scoffs but maintains a wry smile all the same. <i>“If we survive this conflict, we’re going to come out of it better for the struggle, mark my words. Maybe we’ll allow men to seek employment performing manual labor more intensive than a dance.”</i>");
	output("\n\nNodding, you add, <i>“");
	if(pc.isBimbo()) output("For sure!");
	else output("I bet. Hardship always seems to bring about the greatest societal changes and scientific developments.");
	output("”</i>");
	output("\n\nIrellia agrees, <i>“Indeed. Even weapons of grievous murder can be turned to serve society. I’m told that the scientists think they may be able to generate electricity from the technology behind our city-cracking bombs. If that’s true, we could scale back our coal mining. It would save countless lungs and lives.”</i> She pauses. <i>“All we need is for the U.G.C. to enforce a peace or scour the reds from the caverns.”</i>");
	output("\n\nThe blue-painted matron smirks. <i>“You’ll forgive me if I have my doubts. Now, were there other questions you’d like addressed?”</i>");
	irelliaTalkMenu(askIrelliaAboutGildenmere);
}

//What’s It Like?
public function whatsItLikeIrellia():void
{
	clearOutput();
	showIrellia();
	output("You ask, <i>“What’s it like?”</i>");
	output("\n\nIrellia tilts her head, unsure. <i>“What’s what like? I’m not a psychic, you know.”</i>");
	output("\n\n<i>“You know...”</i> you say while wildly gesticulating, <i>“...being a queen! Ruler of your people! Worshipped like a god and all that.”</i>");
	output("\n\nThe gold myr leans back, smiling. <i>“No one has ever asked me that before. Not even Lyralla when I was explaining her assignment to her. She’s quite the inquisitive woman, I’ll have you know.”</i> An attendant brings her water in an intricately gilded crystal goblet. Irellia sips it slowly, thinking on your question.");
	output("\n\nWhen she speaks, her voice is quiet, almost a whisper. <i>“It is an honor... that’s what I believed back in my thollum, anyway. All the girls wanted to be the one who would grow up and turn out to be a queen - to be a secret princess who would have their every need catered to, pampered by servants at all hours of the day.”</i> A dry laugh follows. <i>“I wonder if my sisters still believe that nonsense.”</i>");
	output("\n\nYou look at her curiously. <i>“Nonsense?”</i>");
	output("\n\n<i>“Yeah. When you’re young, all you see is the glitz and the glamor. You don’t see the responsibilities, the thousands of people counting on you, the expectation that you’ll pop out the army of kids you need to produce just to keep your species from dying out.”</i> She gestures at her swollen abdomen as an egg slides out into a waiting attendant’s arms. <i>“You don’t realize that you’ll have to make decisions that could ruin your daughters’ lives, and the only reason you’re even making them is because you happened to wind up with a quartet of working ovaries.”</i>");
	output("\n\nYou nod understandingly.");
	output("\n\nQueen Irellia sighs. <i>“Being a queen is like carrying around a three-hundred pound weight in between sessions of being fucked sore. It’s dealing with stress that you were never prepared or trained for. It’s knowing that you have to send hundreds of your own offspring to certain death against an implacable foe who wants to grind your entire way of life beneath her boot.”</i> She sighs. <i>“You want to know what being a queen is like? It’s like going to the spa for a massage every day after being tortured and choosing how your children will die.”</i>");
	output("\n\nAn awkward silence fills the chamber, broken only be the sounds of Irellia’s servants taking away her emptied goblet.");
	output("\n\nThe royal myr gives you a wan smile. <i>“I did not mean to bury you under my burdens. They are mine to bear - someone has to, after all. Was there something else you had interest in? Perhaps something lighter? Joy is in such short supply these days.”</i>");
	processTime(17);
	irelliaTalkMenu(whatsItLikeIrellia);
}

//The Ceasefire
//You ask Queen Irellia what she thinks of the ceasefire.
public function askIrelliaAboutZeCeasefireYouDirtyFrenchie():void
{
	clearOutput();
	showIrellia();
	output("Her antennae flick outward, stretched wide. <i>“The ceasefire? It’s a joke. The reds won’t let it bind them for long. They’ll find an excuse to violate it or sneak a commando raid past your U.G.C. surveillance to kill off the remaining queens. It bought us time to recover, but it is no solution.”</i>");
	output("\n\n<i>“Well, what would be a solution?”</i> you wonder aloud.");
	output("\n\n<i>“Well, you could wipe their cities out with an orbital bombardment and use your anti-missile systems to ground their nukes before they hit Gildenmere. Once they’ve been buried in fire and rock, we can rebuild.”</i> She favors you with a dark smile. <i>“When I was young, I thought such proposals were evil. Now? I just want to see them suffer as I have - as my daughters have.”</i>");
	output("\n\nYou scratch your chin. <i>“Is there no other way?”</i>");
	output("\n\nThe queen titters, a motion that sends her four breasts jiggling against each other. An attendant dabs at a stray trickle of honey with an amber cloth. <i>“There are other solutions, though I no longer believe they would provide a lasting peace. The reds could stop their war and return the citizens and queens they have stolen from us. A border could be established and agreements made to prevent this sort of tragedy from happening again.”</i> A warm smile graces her features. <i>“That is the future Lyralla seeks. It won’t happen though, not unless the leadership behind the Scarlet Federation changes.”</i>");
	output("\n\n<i>“You think they’ll just invade again?”</i>");
	output("\n\nNodding, Irellia explains, <i>“They’ll use the time to devise more effective counters to our poison gasses and mass their numbers, maybe even procure some off-world weapons to tip the odds even further in their favor. We don’t have the resources or the scientists to keep ahead of them technologically anymore. Once they became absolutely certain of their victory, they would put their troops on the border, send in infiltrators to bribe up an insurrection, and invade. It would be a slaughter.”</i>");
	output("\n\nYou toe at the ground. <i>“So there’s no good way out?”</i>");
	output("\n\n<i>“Not that I see. Maybe we could get a colony going somewhere quiet, but to do so would be to admit complete and total defeat. Many would rather die here than flee with their abdomen between their legs, myself among them.”</i> Irellia looks up, her onyx eyes wide and intense. <i>“We will not give up, not while we yet live.”</i>");
	output("\n\nYou nod.");
	output("\n\n<i>“I’m glad you understand. I had worried an off-worlder would not.”</i> The queen relaxes, smiling warmly. <i>“Is there something more pleasant we could do?”</i>");
	processTime(6);
	irelliaTalkMenu(askIrelliaAboutZeCeasefireYouDirtyFrenchie);
}

public function irelliaSexyTimesApproach():void
{
	clearOutput();
	showIrellia();
	//Sexytimes (First Attempt)
	if(flags["IRELLIA_SEX_LEVEL"] == undefined)
	{
		//Bimbo
		if(pc.isBimbo())
		{
			output("You ");
			if(pc.hasHair()) output("twirl your hair");
			else output("giggle");
			output(" and suggest that the two of you could have some fun in private.");
		}
		//Hard./Bro
		else if(pc.isAss() || pc.isBro()) output("<i>“We’re both busy people, so why don’t we just cut to the chase and send off your servants so we can fuck,”</i> you suggest.");
		//Nice
		else if(pc.isNice()) output("You suggest she dismiss her servants so that the two of you can spend some quality time together.");
		//Mischievous
		else if(pc.isMischievous()) output("<i>“Why don’t you send off your servants, and I can teach you how we make love out in the stars,”</i> you suggest.");
		//Merge
		output("\n\nIrellia smirks. <i>“You know, I spend near half of every day locked in coitus with some drone or another creating the next generation of gold myr, but I’ve never mated with a star-walker before.”</i> Her fingers tenderly graze the chitinous plates that dot the curves of her many breasts. <i>“I must admit, I am curious how you’d like to do this. There are so many options.”</i>");
		
	}
	//Sexytimes (Repeat)
	else
	{
		output("You suggest that you and the queen go for another roll in the hay.");
		//Too soon!
		if(!irelliaWantsSex())
		{
			output("\n\n<i>“So soon?”</i> Irellia asks while preening her hair. <i>“Give a girl some time to rest, off-worlder! Even a queen needs time to recuperate.”</i> She pauses meaningfully. <i>“Especially a queen. I cannot afford to spend days sore and recovering. Is there anything else you’d like to do?”</i>");
			processTime(1);
			irelliaMenu();
			return;
		}
		//Not too soon
		else
		{
			output("\n\n<i>“Oh really,”</i> the licentiously grinning queen asks, <i>“are you getting sweet on me, star-walker? I do so enjoy our time together. You are so different from my fellow myr. What act were you thinking of trying this time?”</i>");
		}
	}
	processTime(1);
	//[Sex Choices Here]
	irelliaSexMenu();
}

public function irelliaAppearanceYouSlutFuckGoddamnWhyYouGottaBeLeeringAtAQueenWhileSheTriesToRelaxDontBeSuchAFuckinPerv():void
{
	clearOutput();
	showIrellia();
	output("Queen Irellia, like most gold myr queens, is a being of immense size and stature. While standing, she’s over eleven feet tall. Official measurements peg her at three inches past, but looking at numbers doesn’t quite convey her sheer size. She’d be taller than most humans or myr, even if you stacked two of them on top of each other.");
	output("\n\nThe regal ant-woman’s imposing physique is enhanced by her choice of attire. She eschews traditional, body-obscuring garments to expose her own natural shape, her only coverings natural-grown chitin plates that dot her form in various places. They’ve all been painted blue along with her lips to provide a contrast with her honey-hued skin. Some of the plates even have designs drawn onto them.");
	output("\n\nBlack hair and long, expressive antennae frame a face that most myr would describe as striking. Her large, solid-black eyes are slanted slightly, giving her an even more exotic cast than her race usually carries. Silver-framed spectacles frame them, an obvious crutch for her race’s poor eyesight. Her lips are just slightly puffier than her handmaidens’, painted glossy blue with a black stripe down the bottom one.");
	output("\n\nIrellia has four arms like the rest of her race, but she’s also packing a quartet of breasts - two more than any non-queen. They’re large enough that you can practically see the nectar glowing within, but not so huge as to appear outlandish. Shining bronze nipples cap each of them, occasionally allowing a trickle of tit-honey to escape.");
	output("\n\nFor a mother of an entire species, her belly is remarkably flat, almost toned, an artifact of her species’ overall lack of fatty tissues. Just below it is the cleft of a vagina, positioned at the junction of her thighs. On any other race, it would be normal, but gold myrmedion vaginas are typically placed at the ends of their abdomens. Queen Irellia’s crotch-mounted pussy is the spitting image of a terran one, right down to the single clit positioned at the top. The only difference is the golden hue of its lips, slightly brighter than the skin surrounding them.");
	output("\n\nThe golden myr’s abdomen hangs from her waist almost to the ground, easily the widest part of her body. Three blue-painted bands of heavy chitin are the only ornamentation aside from a large, slick-looking entrance at its terminus - the correct place for a myr’s vagina. The outer lips are actually rather small and inconspicuous. It’s only thanks to its sheer size that you’re able to pick it with marked ease. However, as you watch, they flush with blood, expanding rapidly. Lubricant trickles out in a steady stream into a basket placed just below her, chased shortly after by an oblong egg.\n\nA queen’s job is never done.");
	clearMenu();
	addButton(0,"Next",irelliaMenu);
}

//Tailfuck
//For cocks any size smaller than gigantique (22 slot boners, yo)
//Tooltip: 
public function tailFuck():void
{
	clearOutput();
	showIrellia();
	var x:int = pc.cockThatFits(2000);
	if(x < 0) x = pc.smallestCockIndex();
	//Crotchgarbed
	if(pc.isCrotchGarbed()) 
	{
		output("By way of answering, you pull your [pc.lowerGarments] out of the way, allowing your [pc.cocks] to ");
		if(pc.lust() >= 76) output("pop free");
		else
		{
			output("surge out of ");
			if(pc.cockTotal() == 1) output("its");
			else output("their");
			output(" tiresome confinement, jutting proudly into the air");
		}
		output(".");
	}
	//Naked
	else
	{
		output("By way of answering, you gently run your palm along the underside of ");
		if(pc.cockTotal() > 1) output("one of ");
		output("your ");
		if(pc.lust() >= 76) output("rigid");
		else output("rapidly-engorging");
		output(" dick");
		if(pc.cockTotal() > 1) output("s");
		output(". You’ve been naked this whole time, but there’s no denying your state when you present your total tumescence.");
	}
	//Merge, no new PG.
	output(" A powerful, excited pulse runs through ");
	if(pc.cockTotal() == 1) output("it");
	else output("them");
	output(", causing ");
	if(pc.cockTotal() > 1) output("them");
	else output("it");
	output(" to visibly and eagerly bounce. Your royal lover gasps");
	if(pc.cockVolume(x,false) < 1500) output(", pleased.");
	else output(", her face creased by worry. <i>“I... I am not sure that will fit inside me. It is... so big.”</i>");

	//NewPG
	//Almost 2big4queen
	if(pc.cockVolume(x,false) < 1500) 
	{
		output("\n\nPatting her quivering thorax comfortingly, you assure her that ");
		if(pc.isNice()) output("you’ll be gentle");
		else output("it’ll fit");
		output(". All she has to do is relax in her recliner and let you do the work.");
	}
	//else
	else output("\n\nPatting her quivering thorax comfortingly, you assure her that you’ll do everything in your power to make this an enjoyable experience. All she has to do is lie back in her recliner and let you do the work.");
	//Merge
	output("\n\n<i>“You’re going to put it in my abdomen?”</i> the Queen asks with a look of confusion. <i>“I would have thought... would think you would favor this entrance?”</i> Her lower arms reach down to her crotch, pulling a pair of glistening amber lips open. Strands of amber lubricants hang between her outstretched love-curtains, beckoning for you. <i>“It is where most species place the mating organs. When I bribed your scientists into giving me this one, I expected an offworlder might favor it.”</i>");
	output("\n\nYou run a hand across the chitinous mass of her abdomen, feeling how the heavy organ quivers beneath your fingers, so rife and fecund. You could probably father a whole generation of glittering, nectar-producing children, assuming queens can cross-breed. Slippery wetness engulfs two of your roving digits when they finally strike gold, hitting the sopping-wet honeypot, probing it as a curious adventurer might a cave.");
	output("\n\nTo your surprise, her egg-laying slit is tight and muscular, gripping your fingers tightly enough to make you momentarily question your decision to send your dick in after them. She relaxes after a second, but the point is made. A queen myr’s cunt is well-trained in fucking and laying. Years of practice at both have given her a degree of control over her muscles unaugmented terrans would be incapable of.");
	output("\n\nQueen Irellia giggles, <i>“Surprised?”</i> She slides herself backwards in order to sit a little further upright, offering you a place at the bottom of her custom-made furniture. <i>“If I got all loose just from laying those eggs, I’d never be able to hold in my drones’ cum, and then what kind of queen would I be?”</i> Her passage somehow... <i>flexes</i>, pushing your fingers entirely out. <i>“Why not put something of substance inside?”</i> She licks a stray strand of nectar from one of her uppermost tits.");
	output("\n\nYou don’t want to keep the lady waiting. Climbing up behind her ");
	if(pc.hasKnees()) output("onto your [pc.knees]");
	else 
	{
		output("and awkwardly positioning yourself properly");
		if(pc.legCount > 3) output(", your extra [pc.legs] draping around her abdomen");
	}
	output(", you line your [pc.cock " + x + "] with the royal flower. Her slippery lips kiss the [pc.cockHead " + x + "] upon first contact, winking when you draw back in surprise.");

	//Hugedix
	if(pc.cockVolume(x,false) >= 1500) 
	{
		output("\n\n<i>“I thought you were worried about it not fitting?”</i> you smugly ask.\n\nThe queen shrugs, then flashes you a grin. <i>“I thought I could at least try. Besides, a I’m bigger than you. It’d be a shame if I couldn’t even handle a teensy star-walker.”</i> The mock condescension in her voice hides beneath a friendly smile. <i>“I’ll give it my all. Just be gentle at first, and I’ll make sure you love it.”</i>\n\nThis time, when you push forward, her nectar-slicked lips go slack, if only to allow themselves to be completely spread about your [pc.cockHead " + x + "]. You’re able to gently ease inward a few inches at a time thanks to her copious lubrication and supreme vaginal flexibility. Even with her abdomen’s chitin bulging from the extra insertion, she taking it like a trooper.\n\nQueen Irellia, smiling now, purrs in pleasure, her wholly-filled pussy idly flexing at squeezing at your [pc.cock " + x + "] to try and pull it the entire way inside her");
		if(pc.hasKnot(x)) output(", knot and all");
		output(".");
	}
	//Normal dix
	else
	{
		output("\n\n<i>“Come on, Steele. I won’t bite... too much.”</i>\n\nThis time when her nectar-slicked lips envelop your [pc.cockHead " + x + "], you continue to push forward, ignoring the heavenly warmth and pressure of her slick walls pressing down on you from all sides. Your [pc.legOrLegs] wobble");
		if(pc.legCount == 1) output("s");
		output(" a little, but you stay upright thanks to the grip your hands maintain on her abdomen’s shimmering plates.");

		output("\n\nQueen Irellia, smiling now, brings her other breast up to her lips, salaciously gathering the honey from her nipple just in time for it to release another drop. She purrs throatily in between swallowing, her cunt just kind of idly pulsating around you, tugging and squeezing at your [pc.cock " + x + "] to fully seat it inside her");
		if(pc.hasKnot(x)) output(", knot and all");
		output(".");
	}
	pc.cockChange();
	//Merge
	//PC has cum medium/lots
	if(StatTracking.getStat("sex/player/orgasms") > 50 && !pc.cockVirgin) 
	{
		output("\n\nThe sum total of your entire sexual experience is a drop in the bucket next to Queen Irellia. Sure, you’ve seen a lot more variety out there, but she’s clearly gotten this down to a science, breeding for hours upon hours day in and day out, learning to move her pussy in ways that would ");
		if(flags["LANDED_ON_TEXAS"] == 1) output("make a New Texan jealous.");
		else 
		{
			output("make any man ");
			if(pc.hasVagina()) output("or hermaphrodite ");
			output("squirt in short order.");
		}
		output(" You feel more like her pussy’s plaything than a partner in consensual sex, held captive by waves of heated pressure that roll up and down your length to a subconscious, orgasm-fueling rhythm.");
	}
	//PC is inexperienced
	else
	{
		output("\n\nNothing you have ever seen or experienced could have prepared you for this - intercourse with an alien who has devoted the bulk of her life to breeding and reproduction. Even the ultraporn you’ve watched seems tame compared to the rhythmic cycles of heated pressure rolling up and down your length, coaxing you toward an orgasm as powerful as it is unavoidable.");
	}
	//Merge
	output("\n\n<i>“D-damn, you’re good,”</i> you admit, trying not to groan too wantonly. You just slipped inside her, for fuck’s sake!");
	output("\n\nWrapping her feet around your [pc.hips], Irellia replies, <i>“Oh really? Just good?”</i> The pace of her internal caresses nearly doubles.");
	output("\n\nYou can’t help but moan out loud and buck against her, splattering a well-spring of sweet-scented lubricants across the floor. Then, the cock-massage goes even faster, vigorously pumping your dick. It takes everything you have not to let her milk out every drop of [pc.cumNoun] on the spot.");
	output("\n\nYour grinning lover holds you still with a surprisingly strong pair of legs, her armored toes digging almost painfully into your [pc.skin]. <i>“It looks like it’s better than good.”</i>");
	output("\n\nYou strain against her grip, bending over her abdomen and wrapping both arms around it for leverage. The best you can manage are short, little in-and-out twitches, but at least you’re contributing to the intercourse; you can feel her swollen button grind against your pelvis.");
	output("\n\nQueen Irellia’s idle tongue-polishing of her own nipple abruptly stops, interrupted by a quiet, feminine gasp. Her lower arms reflexively reach for her bottom row of boobs, squeezing down on the nectar-filled melons enthusiastically. Arcs of gold spray through the air, forced out by the pressure, but it only makes the royal myr vocalizations more unrestrained. Her moan could ");
	if(pc.hasVagina()) output("dampen panties");
	else output("bulge underwear");
	output(" from eighty meters out.");
	output("\n\nThe feverish stroking subsides into a more measured rhythm, carrying your [pc.cock " + x + "] along on waves of pleasure");
	if(pc.cockTotal() > 1) 
	{
		output(" while your ");
		if(pc.cockTotal() == 2) output("other penis is");
		else output("other penises are");
		output(" forced to subsist on the meager friction of ");
		if(pc.cockTotal() == 2) output("its underside");
		else output("their undersides");
		output(" against the queen’s insectile backside, lubricated on ");
		if(pc.cockTotal() == 2) output("its");
		else output("their");
		output(" own trail of dribbling, pre-orgasmic cockslime");
	}
	output(".");
	if(pc.hasVagina()) output(" Rivulets of [pc.girlCum] stream down your [pc.legOrLegs] in sympathetic arousal, and you wish for a brief moment that one of those drones she mentioned would fill the aching hole at your core.");
	output(" The muscles in your core twitch. Your [pc.cocks] flex");
	if(pc.cockTotal() == 1) output("es");
	output(". The feeling of warmth pressing at <i>something</i> overwhelms you, like lava lapping at a dam strained to bursting.");

	output("\n\nWith a cry of relief, you make a meager thrust, unable to put any real distance into it yet unable to prevent your instincts from driving you to plow forward all the same. The wet squish of genitals clapping together fills the air as you throw your head back and groan with relief, rutting against the Queen’s well-practiced breeding hole. She whimpers in pleasure, watching your face contort");
	var cumQ:Number = pc.cumQ();
	if(cumQ <= 5) output(" as you squirt your little dribs and drabs inside her. You might consider taking a break before your next tryst.");
	else if(cumQ <= 30) output(" as you squirt your [pc.cum] deep into her tunnel.");
	else if(cumQ <= 1000) 
	{
		output(" as you hose thick streams of [pc.cum] deep inside her tunnel");
		if(cumQ >= 600) output(", each longer than the last");
		output(".");
	}
	else
	{
		output(" as you pour immense amounts of [pc.cum] into her waiting tunnel, filling it to the brim.");
		if(pc.hasKnot(x)) output(" Your knot keeps any from escaping, causing the queen to grunt with discomfort by the time you’re done.");
		else output(" A few trickles of [pc.cumColor] spill out around your [pc.sheath " + x + "] to run off the chair and puddle on the floor.");
	}
	//Bonus Super high cum, no knot:
	if(!pc.hasKnot(x) && cumQ >= 5000) 
	{
		output(" At least, it starts as a puddle. The longer you spend cumming, the more flooded the room becomes.");
		if(cumQ >= 10000) 
		{
			output(" At some point, the queen’s chamber is filled with ");
			if(cumQ < 12000) output("an inch");
			else if(cumQ < 15000) output("two inches");
			else output("a few inches");
			output(" of backed-up [pc.cum], enough to impress even her.");
		}
	}
	output("\n\nIrellia is sighing in delight when you recover");
	if(cumQ > 1000) output(" and rubbing at her significantly expanded abdomen");
	output(". <i>“");
	if(cumQ < 10) output("That was fun, but I thought that you’d... you know, have more to give. No offense. It was still a wonderful distraction from the drudgery of my duties.");
	else if(cumQ <= 1000)
	{
		output("Mmmm, not too bad, star-walker. You came like a true myr. I wonder if any of my children will wind up having your ");
		if(pc.eyeColor == "black") output("look");
		else output("eyes");
		output(".");
	}
	else output("Mmm, you came so hard! I never expected that one person would make quite so much.... I still feel full!");
	output("”</i>");
	//nonknot or small knot
	if(!pc.hasKnot(x) || pc.knotThickness(x) < 11)
	{
		output("\n\nShe lets you slip free with a wanton-sounding sigh");
		if(pc.hasKnot(x)) output(", able to pass your knot without much effort");
		output(" and directs you to a nearby shower, indicating that her attendants will take care of her cleaning. It doesn’t take long to wash up, and as promised, she’s clean as a whistle by the time you come back");
		if(cumQ >= 500) output(", if still dribbling [pc.cumNoun]");
		output(".");
	}
	//knot is bigger than 11”</i>
	else
	{
		output("\n\nShe grunts, squeezing down on your [pc.cock " + x + "] while she attempts to expell it. <i>“Why... why can’t I push it out! It’s so... thick!”</i>");
		output("\n\nYou lean against her and smile, explaining that you have a knot, designed to seal your seed inside your partner while it took. It should deflate in a half hour or so and let you go your separate ways.");
		output("\n\nThe queen sighs, <i>“Well, I guess we’ll have to shower together.”</i> Then she stands without another word, dragging you off the chair and onto the floor. You stagger up onto your [pc.feet], lest she tug you the entire way by your dick, clinging to her cum-swollen abdomen for dear life.");
		output("\n\nAt least the shower is kind of pleasant, and she gives you appreciative squeezes in all the right places while you wash her back. It’s a shame you slip out just before it ends, but at least you’re free to go your separate ways.");
	}
	processTime(33);
	pc.exhibitionism(1);
	pc.clearRut();
	pc.orgasm();
	clearMenu();
	pc.shower();
	addButton(0,"Next",mainGameMenu);
}

//Fuck Frontgina
//Fuck da one between her legs. Back starts egging? Yiss.
public function fuckIrelliasFrontGina():void
{
	clearOutput();
	showIrellia();
	var x:int = pc.cockThatFits(300);
	if(x < 0) pc.smallestCockIndex();
	output("<i>“");
	if(pc.isBimbo() || pc.isNice()) output("Oooh, I can think of something fun I can snuggle into,");
	else if(pc.isMischievous()) output("You just lie there and I’ll take care of everything, my Queen,");
	else output("I wanna climb that mountain,");
	output("”</i> you say, gesturing above her abdomen to her crotch. A puffy, golden slit sits perfectly positioned there, shining with the slightest hint of moisture - probably honey-flavored. Your mouth waters just thinking about it.");
	output("\n\nThe corners of Irellia’s blue-painted lips quirk upward, pursing slightly in amusement. She briefly giggles, but her nipples tent upward in excitement. <i>“You think so? A little, off-world drone like yourself might not be enough for all this.”</i> She makes a lavish gesture that encompases her whole body from head to toe, all eleven feet of it. <i>“Or even enough for this little pussy.”</i> Chitinous fingertips spread her gilded petals wide enough to see hints of its dusky, amber interior.");
	output("\n\n");
	if(!pc.isNude()) output("Your [pc.gear] hits the floor before she finishes. ");
	output("You stand before her in your naked glory");
	if(pc.legCount > 1) output(", [pc.legs] akimbo");
	output(", [pc.cocks] dangling, and a determined look in your eye.");
	if(pc.hasTailCunt()) 
	{
		output(" Your [pc.cuntTail] reaches around for ");
		if(pc.cockTotal() == 1) output("your");
		else output("a");
		output(" naked, erect phallus, but you bat it back with a frown. You’ve no time to waste on");
		if(pc.hasParasiteTail()) output(" parasitic");
		else output(" hungry");
		output(" twats when a queen’s slit is right there waiting for you.");
	}
	output("\n\nQueen Irellia smiles at what she sees, gently fanning her face as her cheeks flush orange. A droplet of slick pussy-nectar hangs from the top of her surprisingly-engorged clitoris, and the lips are fuller and more prominent than before. She brushes off the stray droplet with the back of her thumb, then brings it to her lips to savor, her tongue lapping it away in a flash. Her eyes twinkle with mirth. <i>“What’s the matter, [pc.name]? You aren’t anxious about performing are you? I hear some drones have problems with that. A big girl like me can be intimidating, no?”</i>");
	output("\n\nYou step closer with a smile on your face and a hand on [pc.oneCock], the other on your hip. After everything you’ve seen and done, a private tryst with royalty hardly phases you, and you tell her as much while you climb up onto her throne. It’s a little awkward, being so high up from the floor");
	if(pc.tallness >= 84) output(", but you manage without much effort.");
	else if(pc.tallness >= 66) output(", but you manage it after a few seconds of struggling.");
	else output(". There’s just no way you can climb it unassisted - you’re too short. Instead, you’re forced to accept a boost from Irellia to get up beside her.");
	output(" Her sweet, natural scent mixes with the muskier, sensuous odor of aroused, feminine flesh, tickling at your nose and redirecting even more blood to the tumescent sausage");
	if(pc.cockTotal() > 1) output("s");
	output(".");
	output("\n\n<i>“I’ve got this");
	if(pc.isBimbo()) output(", cutie");
	output(".”</i> You grab hold of one of her bottommost breasts and gently knead it, rubbing your thumb across the leaking teat until the monarch mewls in enjoyment. <i>“I’ll treat you right.”</i>");
	if(pc.legCount == 2) output(" You throw a [pc.leg] over her and pull yourself up onto her flat tummy.");
	else if(pc.legCount > 2) output(" You throw a few of your [pc.legs] over her and pull yourself up onto her flat tummy.");
	else if(pc.isNaga()) output(" You slither up onto her flat tummy, your [pc.leg] dangling off one side.");
	else output("You wiggle up onto her flat tummy, your [pc.legOrLegs] spreading to either side of her.");
	output(" It’s nice and firm, though it lacks the definition you might expect on a terran or ausar.");
	output("\n\nThe Queen cocks her head to the side curiously. <i>“Is that so? But you aren’t even in the right place.”</i> She stretches, arching her back so that you slide down her middle to her hips");
	if(pc.balls > 0) output(", your [pc.balls] coming to rest upon the simmering furnace that is her slit");
	else output(", coming to rest just above the simmering furnace that is her slit");
	output(". Your [pc.cocks] sit");
	if(pc.cockTotal() == 1) output("s");
	output(" flat on her belly, twitching slightly with every beat of your rapidly pounding heart, so close to your goal and yet so far. <i>“Can you find the hole, or should I give you hand?”</i>");

	output("\n\nThe smooth chitin of Irellia’s fingers closes around [pc.oneCock], stroking it a moment later. She gently pumps you with a knowing grin, watching the [pc.cockHead " + x + "] swell from the attention. <i>“The poor thing");
	if(pc.cockTotal() == 1) output(" seems");
	else output("s seem");
	output(" lost, but hey... it likes me.”</i> She pets it with another hand.");
	output("\n\nYou cannot help but moan. A droplet of pre-cum oozes out from your increasingly excited member onto the ant-queen’s stomach, earning you a girlish giggle. Mastering yourself as best as you’re able, you grunt and pull back, sliding your twitching meat away from the encircling fingers no matter how good they feel.");
	output("\n\n<i>“It knows exactly where it belongs,”</i> you answer, just before lifting your hips and prodding your [pc.cockHead " + x + "] into her golden gates. They glisten now more than ever, coated in a silky sheen of liquid arousal. Her labia part with ease around your intruding member");
	if(pc.cockTotal() > 1)
	{
		output(" while the ");
		if(pc.cockTotal() == 2) output("other slips");
		else output("others slip");
		output(" over her lips and up her belly, sandwiched between your bodies");
	}
	output(". It feels like fucking liquid ambrosia, immersing yourself in the liquified heat and pleasure.");
	pc.cockChange();

	output("\n\nQueen Irellia sighs in enjoyment, draping her legs off either side of her “throne” to allow you better access to her juicing cunt. <i>“Ahhh, that hits the spot.”</i> Her upper arms idly toy with her leaking breasts. <i>“To be honest, [pc.name]... I love this.”</i> Slipping between you, one of her lower arms reaches down to press against her clitoris. <i>“I love laying down and letting a male" + pc.mf(""," or beautiful dick-girl") + " like yourself ravish me. If I didn’t have to take breaks to keep myself from getting damaged, I’d lie here and breed all day. The handmaidens could handle the other stuff.”</i>");
	output("\n\nHalfway through her admission, ");
	if(pc.cocks[x].cLength() < 11) output("you finish testing her depths, entering her as fully as possible");
	else output("you hit your maximum depth. You’re too big to go any further in without hurting one of you");
	output(". Her knuckles keep bumping your pubic region while she self-stimulates, spreading her sticky slickness between your interlocked forms. You brace against her hips and yank back, exposing " + num2Text(Math.round(pc.cocks[x].cLength())) + " inches of pussy-oiled cock. Irellia moans in disappointment and anticipation. She knows as well as you that your absence will be brief.");
	output("\n\nThere’s no way she could know just how brief. You thrust back in, your passage made easy by your previous delving, oiled by yet more of her cunny nectar. She cries out in ecstasy, her gaze fixed on your slippery crotches, watching you undulate atop her. Her hips join yours a second later, a split second behind. She matches the rhythm soon enough, her breasts swaying and bouncing hypnotically.");
	output("\n\nYou doubt you could look away if you had to. Your mouth waters at the way they bounce and drip, so supple and full of nectar. Grunting, you shift tempo, grinding your pubic bone against her clit in small semi-circles. Her wetness trickles down your [pc.legOrLegs] in thin streams. You briefly wonder if her button is secretly the key to some hidden valve inside her the way she bathes you in her fuck-honey.");
	output("\n\n<i>“Ohhh, you know what you’re doing, space-[pc.man]! I’m close! Just a little more...”</i> Irellia announces, grabbing your [pc.butt] with her lower hands now that there’s nothing they can get to at her own crotch. <i>“Harder!”</i> The myr’s voice carries all the force of a royal edict.");
	output("\n\nWell, who are you to disappoint the lady? You switch back to thrusting inside her, this time with every ounce of force you can muster. The few handmaidens still in the room not already blushing start, casting their gazes away. There’s no way they can ignore the staccato slaps of a foreigner fucking their queen raw. Amber juices splatter the throne beneath you as well as your [pc.legOrLegs] as the royal passage constricts around you, flexing powerful muscles to maximize the stimulation.");
	output("\n\nYou aren’t even close to cumming yet");
	if(pc.hasVagina()) 
	{
		output(", no matter how wet your own [pc.vaginas] feel");
		if(pc.totalVaginas() == 1) output("s");
		if(pc.balls > 0) output(" against the back of your [pc.sack]");
	}
	output("! You drive your [pc.cock " + x + "] home like a railgun’s projectile, slamming into her so forcefully that you can see tiny ripples of force move across her fluid-filled tits. The boobie-sprinklers rain small droplets of nectar over her chest and your back.");
	if(pc.tailCount > 0) output(" One even lands on [pc.oneTail].");

	output("\n\nScreaming blissfully, the giant-sized myrmedion continues creaming herself around your [pc.cock " + x + "]. Her inky eyes are closed, hidden behind trembling lids, while her hands dig into her own full breasts, squeezing out thicker and thicker streams of honey. The very air seems saturated. You can’t breathe without tasting residual sweetness. Her passage flutters wildly, uncoordinated and yet still trying to coax you into giving her alien womb a hot, sticky load.");
	output("\n\nYou hammer home a few particularly forceful thrusts, pausing at the end of each to ensure that her clit gets some friction before you line up the next one. The ant queen might as well be transforming into a puddle of jello below for all the self-control she displays. Her legs quiver. Her arms maul at her own erupting tits. She doesn’t even try to stifle her lurid moans. They can probably be heard across the estate.");
	output("\n\nYou wind down along with her cries until you’re gently fucking the blissed-out royalty, enjoying the chance to revel in her sweet slit. You might even be the first off-worlder to achieve such a feat - you doubt most queens would spread their legs for just anyone, let alone someone who isn’t even of the same species.");
	output("\n\nTaking advantage of the more relaxed pace, you palm one of her tits and ask the slowly rousing queen, <i>“How was that?");
	if(pc.isBimbo()) output(" It looked like you had such a good cum!");
	output("”</i>");

	output("\n\nThe Queen is barely capable of speech, so she answers with a contented hum at first. Her breath is still coming hot and fast, and you swear she’s smiling with her eyes closed. When she finally speaks, it’s part breathy whisper, part exhausted panting. <i>“Gooood... Keep going...”</i> She grabs your [pc.butt] and squeezes, teasing your [pc.asshole] with one slippery digit. <i>“I want you to cum inside.”</i>");
	output("\n\nYou languidly thrust while considering. It’d feel way better to cum inside, but she’d look damned sexy painted [pc.cumColor] with [pc.cumNoun]. Either way, you’ve got a lot of fucking to give this queen before you’re ready to blow.");
	pc.changeLust(100);
	processTime(11);
	clearMenu();
	addButton(0,"Inside",cumInsideIrellia,x);
	addButton(1,"Outside",cumOntopOfIrellia,x);
}

//Cum Inside
public function cumInsideIrellia(x:int):void
{
	clearOutput();
	showIrellia();
	output("You slap Queen Irellia’s hip and plunge back in. <i>“");
	if(pc.isBimbo() || pc.isBro()) output("Fuck yeah, I’ll cream your cunt!");
	else if(pc.isNice()) output("Your wish is my command, mi’lady.");
	else output("Works for me.");
	output("”</i>");
	output("\n\nThe ecstatic monarch groans throatily in response, her insectile abdomen twitching wildly behind her. Her finger pushes more firmly against your");
	if(pc.elasticity >= 3) output(" elastic");
	else if(pc.ass.looseness() > 3) output(" loose");
	output(" ring. With all the pussy-juice coating it, it could slip inside more easily than a galotian’s pinkie. She shifts it just when your asshole is about to give, circling the very edge of your pucker with gentle, prodding strokes that seem designed to guide the tempo of your thrusts.");
	output("\n\nIf that’s her plan, it’s working. You pick up the pace while the Queen giggles and coos encouragement. <i>“More! Fuck me harder! Faster!”</i> One hand traces ");
	if(pc.biggestTitSize() < 1) output("down the middle of your chest");
	else output("between your bouncing [pc.breastsNoun]");
	output(". Her face is pleased, her inky eyes hooded by an ocean of sexual pleasure. <i>“Come on drone, give me your seed!”</i>");
	output("\n\nThe finger at your backdoor storms in without even so much as a polite knock.");
	output("\n\nYou lurch forward as if you’d been stung, but the forward momentum does little to extricate her wayward digit. In fact, she wriggles it around inside you when you bottom out, filling you with paradoxical excitement. Your [pc.cocks] feel");
	if(pc.cockTotal() == 1) output("s");
	output(" harder than ever");
	if(pc.cockTotal() > 1) 
	{
		output(", even the one");
		if(pc.cockTotal() > 2) output("s");
		output(" grinding against the queen’s hip");
	}
	output(". It’s like she’s pushing a button keyed to transmute your genitals to ");
	if(pc.cockTotal() == 1) output("an ");
	output("iron bar");
	if(pc.cockTotal() > 1) output("s");
	output(". For a few seconds, you consider protesting, but then she finds just the right spot to press. You nearly cum on the spot.");
	output("\n\n<i>“Give it to me,”</i> she husks throatily, somehow making her bedroom voice as demanding as it is sensuous. She wiggles her finger. <i>“Cum for me.”</i>");
	output("\n\nYou don’t have much of a choice. Either you give her the fucking she wants, or she’s going to take your DNA with prostate-centered force. You lurch back into motion, figuring you might as well give a proper representation of your species no matter how the anal pressure makes you tremble.");
	output("\n\nIrellia’s attentions falter once your efforts bring your crotch in contact with her clit once more, in turn making it easier for you to maintain your rhythm atop her. Her finger is far less distracting when it lies still, forgotten.");
	output("\n\nWhimpering, the matriarch’s eyes flutter the whole way closed. She wraps her other three arms around you in a kind of half-embrace, half-stroke, petting you with the kind of nervous, half-conscious motions that indicate a complete lack of guidance by conscious thought. Her slick tunnel clamps down, and her finger jerks, punching into your prostate once more, wringing more pleasure from it than the tiny organ has any business giving.");
	output("\n\nBetween her vaginal massage, the fiery bliss racing up your spine, and the sight of the sexpot of a queen squirming below, you have no hope of holding out. Your muscles lock, and your back arches from the mounting excitement. [pc.EachCock] swells mightily at the behest of involuntary muscle contractions. Just as you’re about to finally let loose, you hear a liquid splattering behind you.");
	output("\n\nYou aren’t in any state of mind to turn around and examine the lurid squelches, nor is it easy to hear them over Queen Irellia’s vocalizations of pleasure. You aren’t in any state of mind at all. Your mind is awash in ecstasy, your body driving on autopilot, following genetic commands so simple that you couldn’t screw it up if you tried.");
	var cumQ:Number = pc.cumQ();
	if(cumQ <= 5) output(" Unfortunately, there’s almost nothing left for you to spurt. You manage to deposit a few drips inside the monarch and little else.");
	else if(cumQ < 100) output(" Not that the queen is doing much better. Her rippling cunt devours every ounce of [pc.cum] you can offer, the perfect receptacle for your load.");
	else if(cumQ < 1000) output(" Not that the queen is doing much better. Her rippling cunt devours the first tremendous spurts of [pc.cum] with ease, the perfect receptacle for a load. It keeps up with you through most of your climax, leaving only a thin layer of [pc.cumColor] on the queen’s golden lips as evidence of your virility.");
	else output(" Not that the queen is doing much better. Her rippling cunt does its best to devour the gigantic spurts of [pc.cum] shooting from your [pc.cock " + x+ "], but even a queen is no match for your seemingly endless ejaculations. Her abdomen swells from the volume of liquid being shunted into it. Sperm-filled squirts sometimes shoot out around your crotch from the back pressure. It’s impossible not to revel in it, not to enjoy flooding a genetically gifted matriarch with so much DNA that even she can’t handle it. It’s cascading out of her packed slit now, and you just keep on spraying until it feels like you’re fucking a cum-fountain.");
	output("\n\nWhen you slump down, you discover Irellia’s slackened form. She’s barely moving and probably unconscious. Hand-maidens pull you from her");
	if(pc.hasKnot(x)) output(" after waiting for your troublesome knot to deflate. Boy, if looks could kill!");
	else output(".");
	output(" It’s at this point that you identify the source of that squelching you heard just before you orgasmed - Irellia was laying eggs.");
	if(cumQ < 100) output(" It must have been very stimulating.");
	else 
	{
		output(" A lot of eggs.");
		if(cumQ >= 4000) output(" Almost every developed egg inside her must have pushed out into the padded basket below. No wonder she came so hard!");
		if(cumQ >= 8000) output(" And they’re all covered in a sheen of your [pc.cum]. Strings of it are still dripping from her other end.");
	}
	output("\n\nThe servile ants force you into the shower. They won’t take no for an answer, and you don’t really have the energy to protest after that. So what other choice do you have? You lather up and enjoy these primitives’ luxuries, coming out feeling at least a little rested.");
	output("\n\nIrellia is awake once more, and her egg basket has been replaced with a fresh one. She’s beaming and gently rubbing her abdomen with one of her hands. The others give you a tired but friendly wave, the kind of wave you might have gotten from a girl in the hallways of your school after fucking her bareback in her parent’s house the night before. You grin and wave back.");
	pc.clearRut();
	processTime(9);
	pc.exhibitionism(1);
	irelliaSexBreak(3);
	pc.orgasm();
	pc.shower();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Cum Outside
public function cumOntopOfIrellia(x:int):void
{
	clearOutput();
	showIrellia();
	output("There’s no way you’re going to father a brood of gold-hued illegitimates, let alone going to let her stuff her finger up your ass to squeeze out every drop! You grab her wrist and shift, dragging your honey-slicked shaft free of her squeezing tunnel and replacing it with her rogue digit. It squelches home noisily, accompanied by a moan from your super-sized hostess.");
	output("\n\nThumbing her bud, you answer, <i>“No, I don’t think so");
	if(pc.isBimbo()) output(", cutie! I’m gonna paint your gorg-... g... great titties! Boobs like that need some frosting!");
	else output(". This’ll be way hotter. Trust me.");
	output("”</i> You flash her your winningest smile and fondle her swollen clittie a few seconds for good measure.");

	output("\n\nThe monarch actually simpers at that! <i>“Oh-okay.”</i> She’s still weak from her previous sexual satiation and deliriously happy from the thrumming of her nerves. She would probably agree to anything right now, so long as you continued to feed the bonfire between her legs from time to time. You bet she’d consent to boarding your ship at this very moment, if you suggested it. Her fingers stay busy plundering her worked-over box, and when you pull your ladyspunk-slicked hand away, her thumb takes over the tending of her blooming bud.");
	output("\n\nYou grant her a curt nod and shimmey up her stomach to its flawless, flat middle. There, you wrap ");
	if(pc.cocks[x].cLength() >= 9) output("both your hands");
	else output("one hand");
	output(" around your [pc.cock " + x + "] and smear the extra royal cunt-honey across your length, making you slicker than ever. Your rod shines in the muted light of the royal chambers");
	if(pc.cockTotal() > 1) 
	{
		output(", and once you polish your extra rod");
		if(pc.cockTotal() > 2) output("s, they");
		else output(", it");
		output(" might as well be ");
		if(pc.cockTotal() == 2) output("a ");
		output("royal scepter");
		if(pc.cockTotal() > 2) output("s");
		output(" for how ");
		if(pc.cockTotal() == 2) output("it");
		else output("they");
		output(" gleam");
	}
	output(". A few stray drops of your pre-cum mixed with Irellia’s lube fall across her sweat-oiled skin.");
	output("\n\nHer fingers pump that much faster behind you. You can hear the frenzied squelches and the splattering squirts her violent self-pleasure wring out. She chews her lower lip hard enough to scrape a bit of blue paint off it, revealing a puffy gold lip beneath. If anything, the failings of her makeup only serve to make her appear more wanton, more overtly sexual, than before. Her hair is mussed. Her cheeks are blushed. She’s whimpering and whining, on the edge once more.");
	output("\n\nThe Queen’s increasingly whorish visage is better than any pornstar’s, her nectar-leaking tits more appealing than any holo you’ve ever seen. Her skin is hot ");
	if(pc.hasFur() || pc.hasScales()) output("beneath your [pc.skinFurScales]");
	else output("under your [pc.skin]");
	output(", like you’re riding atop a humanoid over with the controls snapped off. Her breasts jiggle and sway whenever she squirms - something she’s doing nigh continually.");
	output("\n\nThrough it all, you watch and pump, stroking [pc.eachCock]");
	if(pc.cockTotal() > 1) output(" in turn");
	output(", masturbating to the sight of a monarch debased by her own need to breed. Irellia onyx eyes usually give nothing away, but now... they burn with hunger. She licks at her lips in between moans, sometimes slipping her inhuman tongue out as if to beg for a treat. Watching your [pc.cocks], she practically begs for it.");

	output("\n\nYou reach climax before the lust-addled queen. Her every action seems calculated to feed your ardor, to stoke it until you can no longer resist, and you’re all too happy to fall for it. Your [pc.cocks] jerk");
	if(pc.cockTotal() == 1) output("s");
	output(" wildly in your grip when it hits, but you keep pumping, keep stroking, feeding your need to maximize your pleasure - to shoot out every single [pc.cumVisc] drop inside you.");

	var cumQ:Number = pc.cumQ();
	//No cum!
	if(cumQ <= 5)
	{
		output("\n\nA few, feeble droplets spill from your [pc.cocks] onto the myr matriarch’s buxom chest, the last few dregs of an exhausted reproductive system. Perhaps you should rest a little between encounters... or seek out some kind of treatment to enhance your virility.\n\nIrellia actually looks disappointed - disappointed enough that she stops pleasuring herself and asks, <i>“Really? That’s it? After all this, I expected more from you, [pc.name].”</i> She scoffs and sets you on the ground beside her. <i>“If you were one of my drones, I’d have to release you from my service for a performance like that. Not only did you disobey an order, but you didn’t even manage to bring me off!”</i> She sighs and waves to the door. <i>“Come back when you’ve a little more to offer!”</i>");
		output("\n\nYou skulk away");
		if(pc.tailCount > 0)
		{
			output(" with your [pc.tails]");
			if(pc.hasTailFlag(GLOBAL.FLAG_LONG) && pc.legCount > 1) output(" between your [pc.legs]");
			else output(" drooping");
		}
		output(". Surely you can do better than that? You’re [pc.name] Steele, for heaven’s sake!");
		processTime(9);
		irelliaSexBreak(24);
		pc.orgasm();
		clearMenu();
		addButton(0,"Next",mainGameMenu);
		return;
	}
	//Normal cum
	else if(cumQ < 400)
	{
		output("\n\nA few good-sized ropes of [pc.cum] spray across the myr matriarch’s buxom chest, splattering off one breast after another, mixing your [pc.cumColor] seed in with her amber lactation. The sight of it staining her golden boobs keeps you shooting for longer than you might have otherwise, certainly long enough for you to feel drained and utterly satiated by the time it’s all over. The last few shots are comparatively feeble, but enough to leave her tits as spotted some ausar’s fur.");
	}
	//Big cum (Glass full!)
	else if(cumQ < 1000)
	{
		output("\n\nA few ropes thick enough to put reinforced ship cable to shame spray across the myr matriarch’s buxom chest, drenching one breast after another, striking with enough force to make them wobble and squirt nectar from the impact alone. Still jacking, you aim your [pc.cocks] to try and evenly coat her entire bosom, but in your overeagerness, you wind up catching her in the mouth and chin as well. [pc.Cum] dribbles down her chin while the royal ant-girl swallows with a pleased smile.");
		output("\n\nWhen she opens back up, you can’t help but feed the last dregs of your liquid pleasure into her mouth. Who are you to deny the lady?");
	}
	//2 liter+ cum
	else
	{
		output("\n\nThe first geyser of [pc.cum] fires out like plasma from a U.G.C. capital ship’s cannon. When it hits the myr matriarch’s buxom chest, it splatters violently enough to cover most of her plus-sized breasts, drenching them in a thick coat of [pc.cumColor] that utterly dwarfs the nectar she had been leaking. She gasps in surprise, catching a few drops in your mouth, just in time for you to aim the next voluminous ejaculation at her face.");
		output("\n\nYour [pc.cum] washes over her like a tidal wave, flooding her mouth, plastering back her hair, and nearly gluing her glasses in place. She closes her mouth and swallows, gasping for air after while strings of the stuff hang from her face. Chitinous fingers reach between her breasts and begin to massage your [pc.cumNoun] into them while you launch wave after wave of the stuff onto her.");
		output("\n\nMore than once Irellia gathers some into one of her lower hands and surreptitiously sneaks it into her dripping slit. Every time, you punish her for it by blasting the next geyser-like eruption into her face and mouth. She doesn’t seem to mind, and for that matter, you’re hard pressed to actually care when you’re spraying DNA like a firehouse.");
		//Append to 2+ liter if lots more
		if(cumQ >= 4000) 
		{
			output("\n\nBy the time your violently virile orgasm begins to ebb, you’ve drenched the matriarch’s entire upper body in your [pc.cum]. Waterfalls of it are cascading down her sides at this very moment into a puddle");
			if(cumQ >= 20000) output(" deep enough to take a bath in");
			output(". Irellia’s attendants are scrambling for cleaning supplies in the background, but you merely guide your [pc.cock " + x + "] between the Queen’s lips so that she can sample the last few pearls of condensed love.");
		}
		//Append if not lots more
		else output("\n\nLike all good things, your orgasm must eventually end, but as it’s ebbing you wring a little enjoyment from it by offering your drooling tip to Irellia. She swallows it with applomb, her cheeks hollowing, her throat noisily gurgling with each swallow. Once you’ve gone dry, she lets it free with an audible ‘pop’ and a wink.");
	}
	//All cum quantity variations that don’t result in the PC being a cum-less tard.
	output("\n\nBeneath you, the libinous royal quietly trembles, smearing your [pc.cum] across her form while one set of fingers furiously fuck her honeyed quim. Her eyes close, and rumbling purr escapes her throat, culminating in a sudden eruption of honey from her teats. All four of which spray like sprinklers, producing a rain of amber sweetness over both your bodies.");
	output("\n\nPanting, you flop down into her cleavage.");
	output("\n\nShe idly strokes your [pc.hair], remarking, <i>“Normally I’d have to punish your disobedience, star-walker, but I think you’ve earned yourself a pardon... this time.”</i> She grins. <i>“Now get off me. I’ve got duties to attend to and drones to summon for a proper insemination - the council would have my head if they thought I was trying to create half-breeds.”</i>");
	output("\n\nA handmaiden offers you a towel and a shower once you climb down. You take both. By the time you leave, no one would guess you had fucked a myr queen... unless they smelled the faint, lingering scent of sweetness on you.");
	//IT’S OVER!
	processTime(9);
	pc.exhibitionism(1);
	irelliaSexBreak(8);
	pc.orgasm();
	pc.shower();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Ladytime Sixtynines
//Aww yiss
public function ladyTimeSixtyNinesByFenbroxicoTheDestroyer():void
{
	clearOutput();
	showIrellia();
	var x:int = rand(pc.totalVaginas());
	output("You ");
	if(!pc.isNude()) output("strip out of your [pc.gear]");
	else output("remove the few bits of gear you carry");
	output(" as sensually as possible, setting down your Codex with an exaggerated back-and-forth shake from your [pc.hips] and your pack with a sinuous wiggle. By the time you’re standing bare and exposed before the queen, she’s licking her lips and idly stroking a finger just north of the slit between her legs.");
	output("\n\nYou comment that you hope she’s willing to put that mouth to work. There are few things in this universe that can compare to a set of soft lips and a talented tongue.");
	output("\n\nQueen Irellia titters, her four breasts shaking and dripping. <i>“Ninety percent of our population are girls, dear. I doubt you could find a woman on this planet who doesn’t know her way around a dripping slit, and from what I can see of yours, ");
	if(pc.totalVaginas() > 1) output("they’re not that different from mine - there’s just more of them.");
	else 
	{
		output("it’s not that different from my own");
		if(pc.totalClits() / pc.totalVaginas() > 1) output(", just with more clits");
		else if(pc.hasClit() && pc.clitLength > 4) output(", just with a bigger clit");
		output(".");
	}
	output(" I just hope you taste half as good as you look, little star-walker.”</i>");

	//PC is mcstronkhugelady
	if(pc.tallness >= 84 && pc.PQ() > 60)
	{
		output("\n\n<i>“Little? I don’t think so.”</i>");
		output("\n\n<i>“When I stand upright, I’m over eleven feet tall. To me, you do seem little, no offense intended. Climb on. You can be on top, looming over me.”</i> Irellia slouches back. <i>“I’d be helpless against your tongue...”</i>");
	}
	//PC isn’t mcstronkhuge
	else
	{
		output("\n\n<i>“");
		if(pc.isMischievous() || pc.girlCumType == GLOBAL.FLUID_TYPE_HONEY) output("Better, I’m sure,");
		else output("I will,");
		output("”</i> you promise.");
		output("\n\n<i>“Then climb on. You can be on top, the little alien pinning down the poor, defenseless myrmedion queen.”</i> Irellia slouches back. <i>“I’d be so helpless against your tongue, and then I’d give into your alien venom and just have to lick you.”</i>");
	}
	//Merge
	output("\n\nMounting the royal myr is no easy task. She may be lying back on a chair, but she’s still twice the size of your average galactic citizen and sporting an abdomen thick enough to hold a dozen huge eggs. Those four nectar-filled canteloupes on her chest don’t help either, even if they are a cushy place for your [pc.belly] to rest. ");
	if(pc.legCount >= 4) output("All");
	else output(StringUtil.upperCase(num2Text(pc.legCount)));
	output(" of her hands grab hold of your [pc.legOrLegs] to help you into position. The ease with which she’s able to drag you into place is a little alarming, but then her breath is brushing against your netherlips, a whispered promise of the contact to come.");
	output("\n\nYour viewpoint fills with amber flesh as you’re moved into place, at last settling just above the ant queen’s glittering delta.");
	if(pc.tallness < 70 || pc.isTaur()) output(" You don’t even want to imagine how she’s contorted herself to make the various parts line up. That chair must support some pretty varied positions.");
	output(" A scent somewhere between maple, honey, and raw sex filters up to your nose, released by the queen’s fore cleft. A hand strokes your back affectionately, causing you to sigh from the contact of her warm chitin on your [pc.skinFurScales].");

	output("\n\nIt’s the only warning you get before the queen’s tongue makes contact with [pc.oneVagina], whirling slowly over the exterior lips");
	if(pc.hasClit() && pc.clitLength > 1) output(" and dodging around your sensitive [pc.clits]");
	output(". You gasp in surprise and pleasure, quivering slightly the attention to your most delicate of areas. You wrap your arms around her waist in a hug, holding her tight while she warms you up.");

	output("\n\nNectar slicks your [pc.belly] in gold, expelled by the Queen in her own excitement. You rock forward, before you know what you’re doing, planting a kiss square on her syrupy slit, wanting to spread the physical ecstasy she’s forced upon you. The press of your [pc.lips] causes Irellia’s movements to falter, but not for long. She presses her tongue between your lips in response, tasting your passage’s [pc.girlCumFlavor] taste.");
	if(pc.totalVaginas() > 1)
	{
		output(" Excess moisture from your other entrance");
		if(pc.totalVaginas() > 2) output("s");
		output(" plasters her cheeks while she works. You can feel it against your [pc.legOrLegs].");
	}
	//Titties!
	if(pc.biggestTitSize() > 1)
	{
		output("\n\nYour [pc.fullChest] soon feel the fruits of the queen’s leaky bosom lubricating the space between your [pc.nipples] and her uncovered flesh. Every slight shift brings delicious friction to your chest. Your [pc.nipples] are like red-hot buzzers, jabbing your lover’s taut belly");
		if(pc.canMilkSquirt()) output(" while dripping their own [pc.milk] into the lactic deluge");
		output(".");
	}
	output("\n\nQueen Irellia stops her vaginal ravishings long enough to cheerily announce, <i>“");
	if(pc.girlCumType == GLOBAL.FLUID_TYPE_NECTAR || pc.girlCumType == GLOBAL.FLUID_TYPE_HONEY) output("You taste just like one of us! Are you sure you don’t have a little myrmedion in you?");
	else if(pc.girlCumType == GLOBAL.FLUID_TYPE_CUM) output("You have a very unique taste - not lady-like at all, but still delicious.");
	else output("You’re pretty tasty for an alien.... I might just have to eat you up!");
	output("”</i> She buries her lips back into ");
	if(pc.totalVaginas() > 1) output("a different pussy");
	else output("your pussy");
	output(" without another word. You can feel the corners of her mouth quirking upward against you while she dives deep");
	if(pc.hasClit()) output(", only occasionally allowing her oral organ to curl back to poke at [pc.oneClit]’s hood");
	output(".");

	output("\n\nYou wiggle excitedly, feeling altogether <i>juicy</i>, inside and out from her words. She likes how you taste! And her tongue is marvelous, slipping and sliding around as if it was inside a second home");
	if(pc.hasClit()) output(", providing just enough stimulation to your clit without overdoing it");
	output(". You don’t have to ask her for anything - by the time you think of it, she’s already doing it!");
	output("\n\nPulling back and subbing in your fingertips to give your tired tongue a rest, you call back while strands of honey dangle from your [pc.lips], <i>“");
	if(pc.isBimbo()) output("You’re like, super sweet! I could eat you out all day! Do the boys taste like this too? I’d totally eat you out after they go in you... and then they could have a go at me while I do it!");
	else output("You’re not so bad either! I might have to come back for seconds!");
	output("”</i>");
	output("\n\nYou hear a muffled giggle while you get back to work, licking your fingers on their way past your mouth. In no time at all, you’re noisily licking away, suckling the queen’s remarkably terran-like clit, driving her to arch her back and squirm in her chair - not that you’re doing much better. It’s hard enough just to keep your face planted in her sugary flower, let alone keep your tongue and [pc.lips] properly coordinated to please her pussy.");
	output("\n\nThe scent of her nectar is all you can smell, and her tongue and mouth on your [pc.vagina " + x + "] are all you can feel. You’re only tangentially aware of the sweetness pouring from her four tits or the fact that she’s coated your entire front with it. You feel like a tongue trying to surf across a tidal-wave of pleasure - little more than a few loosely associated organs begging for input from a brain taxed beyond its means by desire.");

	//Hugeclit
	if(pc.hasClit() && pc.clitLength >= 4)
	{
		//Hugeclit
		if(pc.clitLength >= 11)
		{
			output("\n\nWhen Queen Irellia withdraws from your [pc.vagina " + x + "], you nearly cry from unfulfilled need. When she instead opens wide to try and handle ");
			if(pc.totalClits() == 1) output("your");
			else output("an");
			output(" immense clitoris, you nearly black out from pleasure. It’s too much! There’s too much flesh containing too many nerves. By the time she’s engulfed a few inches, you’re thrashing wildly, creaming yourself");
			if(pc.isSquirter()) output(" and splattering your [pc.girlCum] across her neck and chest. Streams of it run down her shoulders to puddle on the floor as she makes you cum over and over, each time more violently draining than the last.");
		}
		//Cocksuck-sized clit
		else
		{
			output("\n\nWhen Queen Irellia withdraws from your [pc.vagina " + x + "], you nearly cry from unfulfilled need. When she instead opens wide and dives onto your over-sized clitoris, you nearly black out from pleasure. Those blue-painted lips slide down the entire length in short order, kissing your vulva while her tongue dances figure eights across the bottom of your nerve-packed pleasure-pole.");
			output("\n\nYou thrash wildly, your eyes rolled back and yet somehow seeing white starbursts. If she didn’t have four hands to wrangle you with, you’d probably slip off and onto the floor. Instead, you twitch like Queen Irellia’s hapless meat-puppet, dancing on strings of overwhelming bliss.");
			if(pc.isSquirter()) output(" [pc.girlCum] is fountaining from your [pc.vaginas] almost nonstop. Waterfalls of it run down the gold myr’s shoulders to the floor. There, a puddle grows deeper with each twat-draining climax.");
		}
		//Either of the above and at least one dick?
		if(pc.hasCock())
		{
			output("\n\nYou’re vaguely aware of fluid erupting from your [pc.cocks] at the same time, a different yet sympathetic pleasure brought on by the Queen’s masterful stimulation of your " + num2Text(Math.round(pc.clitLength)) + "-inch button. Fingers have wrapped around [pc.eachCock] to stroke you through it. Your body can barely handle it; two different sets of abdominal muscles convulsing against one another, and neither shows any signs of stopping.");
		}
		//All hugeclit end
		output("\n\nYou black out to the feeling of honey splattering your face, a lazy smile on your [pc.face] from the knowledge that you got her off once.");
		processTime(22);
		//Cum like, five times.
		pc.orgasm();
		pc.orgasm();
		pc.orgasm();
		pc.orgasm();
		pc.orgasm();
	}
	//Okay, you didn’t have a huge clit. Let’s do something else.
	//But you did have dicks. Herms superior.
	else if(pc.hasCock())
	{
		output("\n\nWhen the busy queen’s hands find your [pc.cocks], you lose all control. It was easy to forget the turgid rod");
		if(pc.cockTotal() > 1) output("s");
		output(" while you were focused on the feeling of her tongue plying your folds, but once she touches ");
		if(pc.cockTotal() > 1) output("them, they leap");
		else output("it leaps");
		output(" to the forefront of your mind, so hard and eager, filled full to bursting by sympathetic ardor. One fingertip rubs just beneath [pc.oneCockHead], hitting a sensitive bundle of nerves. Her palms, made slick by [pc.girlCum] easily glide across the rest of the flesh.");
		var cumQ:Number = pc.cumQ();
		output("\n\nYou go off like a ");
		if(pc.cockTotal() > 1) output("line of ");
		output("cannon");
		if(pc.cockTotal() > 1) output("s");
		output(", a simultaneous barrage of bliss sprays over Irellia’s tits while your [pc.vagina " + x + "] melts on her tongue.");
		if(cumQ >= 50) output(" [pc.Cum] trickles down between your bodies, flowing all the way down until you can taste it alongside the ant queen’s flavorful slit.");
		if(cumQ >= 200) output(" Small streams roll off either side of her supine form. You can hear them splattering into a puddle below.");
		output(" It’s too much, cumming from both sets of organs at once. Your mind was never meant to endure such pleasure, and you black out on the cusp of your second orgasm.");
		//Only 2 cums! AH AH AH! /thecount
		processTime(22);
		pc.orgasm();
		pc.orgasm();
	}
	//Okay, didn’t have any dicks
	else
	{
		output("\n\nIrellia’s flavor grows richer the longer you lick, and you even see a few eggs start to slide out of the second cunt at the end of her swollen, insectile hindquarters. Her legs twitch, and she moans into your slit just barely before you do the same to hers. It’s difficult to judge which one of you goes off first, particularly with flares of pleasure blasting through your thoughts like ");
		if(pc.characterClass == GLOBAL.CLASS_SMUGGLER) output("high explosives through a bank’s walls");
		else if(pc.characterClass == GLOBAL.CLASS_ENGINEER) output("a virus through default firewalls");
		else output("high explosives through cheap bunkers");
		output(", and such a rich flavor on your tongue.");
		output("\n\nWhatever the case, you lash your [pc.tongue] around her inside her while in the throws of your climax. Honeyed ladyspunk splatters your face and cheeks");
		if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output(", but your extensible tongue catches most of it, curling around inside her to block most of it from coming out");
		output(". Writhing in sapphic ecstasy, you and your insectile lover gradually drift away from your carnal rapture and back towards an island of rational thought.");
		output("\n\n<i>“You’re pretty good at this,”</i> Irellia admits between pleased-sounding pants.");
		output("\n\nYou answer her with a kiss on her lower lips that sends shivers up her spine. <i>“You’re not too bad yourself.”</i>");
		output("\n\nAfter snuggling for a while in companionable silence, you slide off of her. She directs you to a nearby shower of immense size, promising that her attendants will see to her cleanliness.");
		output("\n\nIt takes a few minutes to get the sticky stuff cleaned off you, and when you emerge, she’s just as clean as she promised. You gather your things, exchanging knowing grins with the queen before setting out.");
		processTime(22);
		pc.orgasm();
		pc.shower();
		irelliaSexBreak(6);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
		pc.exhibitionism(1);
		return;
	}
	//Passed out - hugeclit or has at least 1 dix
	clearMenu();
	addButton(0,"Next",lady69Epilogue4PassedOutFolks);
}

public function lady69Epilogue4PassedOutFolks():void
{
	clearOutput();
	showIrellia();
	output("You come to just as one of Irellia’s attendants is finishing sponging you off. Your whole body gleams from the wash, and the blushing attendant hands you your things with a knowing smile. Irellia lies a short distance away, giggling while you dress.\n\n<i>“Good job, Captain Steele. Don’t be a stranger!”</i>");
	processTime(33);
	var ppIrellia:PregnancyPlaceholder = new PregnancyPlaceholder();
	pc.girlCumInMouth(ppIrellia);
	irelliaSexBreak(8);
	pc.exhibitionism(1);
	pc.shower();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Quad Tittyfuck
//Fuck four titties. That’s twice as many titties. TWO TIMES THE TITTIES!
//Minimum 15”</i> dick
public function quadTittyFuckIrellia():void
{
	clearOutput();
	showIrellia();
	output("<i>“I’ve got an idea,”</i> you announce");
	if(pc.isCrotchGarbed()) output(", proudly relieving your [pc.biggestCock] from its irksome confinement. There isn’t a garment in the known universe made to cage a beast like this.");
	else output(" by shaking your hips, sending your [pc.biggestCock] waving back and forth in as tantalizing a fashion as you can manage. You doubt anything short of ultralastic could handle this trouser snake, yet even that, would prove sorely uncomfortable.");
	output("\n\nIrellia’s eyes widen at the sight. She’s certainly no stranger to the male anatomy, what with her being a queen, but there’s no denying the hunger shining in her eyes at the sight of such a impressive specimen. A bead of sweat trickles down the nape of her neck and into her expansive, honey-supplemented cleavage, never to be seen again. Batting her eyes coquettishly, she crosses two of her arms beneath the bottommost row of her double bosom, pressing all four boobs together so that they’ve no choice but to jut forward enticingly, nipples erect.");
	output("\n\nYour head feels light at the prospect of enjoying a quadruple titfuck. The blood is pooling elsewhere, causing your freely dangling length to rise up like a snake-charmer’s cobra while you struggle not to jump the supine queen (or pass out). Your own burgeoning tumescence has given you tunnel vision, but you keep it locked on your prize, slowly advancing while you wait for your blood pressure to stabilize.");
	output("\n\n<i>“What’s the matter, star-walker? Don’t the women have breasts where you come from?”</i> Irellia’s voice pitches down oddly, but the translators floating through your bloodstream feed your consciousness her lighthearted demeanor all the same. At least they won’t have to translate the smile on her face. Anyone could read that.");
	//Bimbo - with tits
	if(pc.biggestTitSize() >= 3 && pc.isBimbo()) output("\n\nYou smush your own together, bouncing them in your palms to buy you time until you can come up with a witty retort. It’s so easy to focus on finding the perfect thing to say that your tingling teats barely distract you at all. <i>“None that make me like, this hard.”</i> You pump yourself enthusiastically, your [pc.hips] rocking back and forth wildly. <i>“And none that make my cock this desperate to fuck you.”</i>");
	//Bimbo - notits/Bro
	else if(pc.isBimbo() || pc.isBro()) output("\n\nYou run your hand up and down the top of your [pc.cockBiggest], stroking it like a favorite pet. The motion is automatic; you’re too busy figuring out what to say to devote any conscious thought to just how perfect and... rigid it has become. Sensuality just comes naturally to you. <i>“None like yours. I get lightheaded just looking at them.”</i> You prowl closer, " + pc.mf("growling. <i>“I’m gonna fuck ‘em till they squirt.”</i>","licking your lips. <i>“None that are so super fuckable!”</i>"));
	//Nice
	else if(pc.isNice()) 
	{
		output("\n\nYou chuckle, your vision clearing. <i>“They do, but none quite so nice as yours.”</i> You step a little closer, smiling. <i>“I don’t think I’ve ever seen a girl with such a bountiful, shapely bosom");
		if(pc.biggestTitSize() >= 6) output(", present company excluded, of course. But I think yours are going to feel way nicer than mine");
		output(".”</i>");
	}
	//Mischievous
	else if(pc.isMischievous()) 
	{
		output("\n\n<i>“Nope,”</i> you confirm. <i>“I come from a race where breasts are little more than stories of far-away worlds. But I assure you, I’ll make quite an accounting for my people.”</i> You drop to a knee theatrically, rock-hard prick");
		if(pc.cockTotal() > 1) output("s");
		output(" bobbing");
		if(pc.balls > 0 && pc.ballDiameter() >= 20) output(", your [pc.balls] compressing beneath you");
		output(". <i>“Allow me to make first contact, my Queen.”</i>");
	}
	//Hard
	else
	{
		output("\n\n<i>“Hardly,”</i> you say while advancing, your vision clearing now that you’ve reached full mast. <i>“There’s just a limited amount of blood, and you happened to make most of mine pump south.”</i> Grinning now, you admit, <i>“Your breasts are owed some credit, of course. I don’t think I could walk away from a quartet like that in this condition.”</i>");
	}
	//Merge
	output("\n\nQueen Irellia squeezes her chest between her lower arms harder, causing honey to cascade from her nipples down to her flat, almost flawless stomach. She uses an unoccupied hand to gather a dollop of it to drink, suckling her finger for a brief second. <i>“I quite like the sound of that, [pc.name]. Go on then, have your way with them.”</i> A droplet of moisture loudly drips to the floor beneath her chair. She smears the dripping nectar across the space between her breasts, then pulls them apart invitingly. <i>“Come on, show me what kind of drone you are.”</i>");
	output("\n\nCultural meanings of the word drone aside, you take the invitation for what it is and close in on the waiting queen, climbing onto her super-sized chair with a small grunt of effort");
	if(pc.legCount == 2) output(" and throwing your [pc.leg] across her middle");
	output(". She smiles down at you, one unstained hand switching to stroking your [pc.hair], the thumb toying with an [pc.ear].");

	output("\n\nThe sound of your [pc.cockBiggest] thwacking into place between her numerically superior breasts carries through her private chambers like the ring of an announcement bell. Irellia’s servants, who had been studiously avoiding the tryst in the center of the room, cannot help but look, watching their monarch’s busts bounce and jiggle around the gigantic rod resting inbetween. They quickly cast their eyes back down, blushing. The scent of damp pussy in the air strengthens, though it seems too omnipresent to be the queen alone.");
	processTime(9);
	pc.changeLust(100);
	clearMenu();
	addButton(0,"Next",quadTitfuckPartDues);
}

public function quadTitfuckPartDues():void
{
	clearOutput();
	showIrellia();
	//Libido forkz
	if(pc.libido() < 33) output("You blush just as hard and briefly consider fleeing. Then the feeling of her boobs compressing around you dispels any such notion. You’ve come too far and feel too good to be scared off by embarrassment.");
	else if(pc.libido() < 66) output("You blush self consciously but the boobs compressing around your [pc.cockBiggest] dispel any notions of flight. In fact, your heart flutters a little more excitedly knowing that there are a few eyes on your form.");
	else output("You grin excitedly at the knowledge that the handmaidens are watching you ravish their queen, their cunnies juicing at the sight.");
	output(" Irellia doesn’t protest when you roughly grab the closest pair of tits squeeze them together");
	if(pc.cocks[pc.biggestCockIndex()].thickness() > 8) output(", almost hiding the unearthly thick log you’ve placed in the middle");
	output(".");
	output("\n\nThe smooth flesh in the valley of her chest quivers when she releases them to your control. Her lower limbs snake past your [pc.hips], her hands disappearing behind you, the only hint as to their destination a lurid-sounding squelch. She moans happily, eyelids fluttering, and arches her back to press herself more firmly against your rod.");
	output("\n\n<i>“Fuck my tits, drone,”</i> she encourages, her voice laden with the kind of assumed authority that can only come from years of having your whims catered to.");

	output("\n\nHer voice lashes at you like a whip, not that you needed it. You were already lurching into motion when she started speaking, sliding inch after inch through the honey-glazed boobs, reveling in the press of not one but two pair upon you. When your [pc.cockHeadBiggest] crests through the top");
	if(pc.biggestCockLength() < 30) output(", Irellia plants a kiss on it, slipping a little tongue along the bottom edge to encourage it.");
	else output(", Irellia tries to kiss it, but you thrust right on past, forcing her to brush her blue-painted lips against the underside. A sticky vein throbs against her nose, and you hear her exhale a pleased sigh.");

	output("\n\nYou slide back after a second to savor the all-consuming sensation of immersing yourself in what feels like an ocean of warm, wet breasts. The air is redolent with the scent of aroused female myr and honey-like nectar. Frequent, evenly-paced liquid squelches echo from behind you, sometimes chased by vocalizations of pleasure from the queen. She’s right in the middle of one when you draw back and begin to fuck her breasts.");
	output("\n\nQueen Irellia can do little but moan and dig deeper into her honeypot. Sometimes she manages to slobber across your [pc.cockBiggest] when you ram it in to the hilt, but mostly she’s content to get off the feeling of being so roughly, crudely used, her bountiful chest made little more than an off-worlder’s sex-toy. Nectar squirts from her nipples as a result of your rough usage. It falls in a glittering, golden rain across the expanse of quivering ant-flesh.");
	output("\n\nYou can’t stop yourself from going faster and harder with each successive thrust, nor can the gold queen resist wrapping her upper arms around the top pair and crushing them vice-tight around you, her fingers placed firmly against her juicing nipples. She purrs throatily, her head lolling back. Irellia sounds more sex-kitten than royalty, by this point, and she obviously revels in it. Specks of pussy-nectar are splattering your [pc.butt], after all.");
	output("\n\nThe soft thump-thump of two eggs landing in the padded cradle at the base of her <i>“throne”</i> registers briefly. The mother myr’s legs quiver in ecstasy behind you. Her hands go slack, letting her breasts bounce wildly in response to your thrusts.");
	output("\n\nIt would be difficult to maintain your position atop her orgasmically writhing form were you not so intimately entwined with the royal bosoms, your fingers squeezing deep into her nectar-oozing skin. The edges of her naturally-forming chitin provide all the grip you need to continue enthusiastically mating with her tits, particularly as you feel the warm upwelling of your own impending orgasm.");
	output("\n\nSquirts of sinfully sweet nectar spray upward as you piston through Queen Irellia’s tits. Each boob-jiggling pump brings you more pleasure, pressing on an internal dam like molten lava until you feel the cracks forming. Bliss batters your reserve until you’re " + pc.mf("groaning","moaning") + " wildly. Your [pc.cockBiggest] surges");
	if(pc.balls > 0)
	{
		output(", and your [pc.balls] clench");
		if(pc.balls == 1) output("es");
		output(" tight");
	}
	output(".");
	
	var cumQ:Number = pc.cumQ();
	//Few drops
	if(cumQ <= 5) output("\n\nTrembling wildly, you erupt... or at least it feels like you do. A single droplet of [pc.cum] rolls into the expanse of cleavage to vanish amongst a sea of honeyed liquid.");
	//Normal
	else if(cumQ < 20) output("\n\nTrembling wildly, you erupt, flinging ropes of [pc.cum] across the expanse of cleavage again and again, then pressing your dribbling [pc.cockHeadBiggest] against her wide-open lips. She greedily laps at your sweetened, pulsating rod.");
	//Big load (doublish size?)
	else if(cumQ < 150) output("\n\nTrembling wildly, you erupt, flinging thick ropes of [pc.cum] across the expanse of cleavage again and again, each one easily long enough to lay a line from the bottom of the lower row to the top. The second hits her from neck to forehead, and by the time the third launches out, you’re pressing your [pc.cockHeadBiggest] against against her lips. The queen swallows with relish.");
	//Really big load (think a big cupfull)
	else if(cumQ < 1000) 
	{
		output("\n\nTrembling wildly, you feel you the [pc.cum] snaking through your urethra, distending it with its volume alone. It launches out in globules big enough to coat the entirety of a queenly breast individually, only you’re pumping half onto her face in hair, covering her blue-painted lips in [pc.cumColor]");
		if(pc.cumColor() == "blue") output(", which doesn’t look all that different, really");
		output(". Once the flow ebbs, you press it the [pc.cockHeadBiggest] against her lips. For her part, she simply licks and swallows, humming in pleasure all the while, seemingly unbothered by the unexpected facial.");
	}
	//Huge Load (2 liter)
	else if(cumQ < 3000)
	{
		output("\n\nWildly clenching, you unload a rope of [pc.cum] heavy enough to send a ripple across the royal breasts and drench her cleavage in [pc.cumColor].");
		if(pc.cumType == GLOBAL.FLUID_TYPE_HONEY || pc.cumType == GLOBAL.FLUID_TYPE_NECTAR) output(" Of course it all just blends into a thickened, sweet morass.");
		output(" The next squirt takes her square in the face, plastering back her hair, drenching her neck, and masking her glasses under a layer of your seed. By the time your flow ebbs to a trickle, waterfalls of [pc.cumNoun] are pouring down her to the floor.\n\nIt feels like it might be too much, but you press your [pc.cockHeadBiggest] against her open lips. There’s a slight gurgle of surprise followed by gulping and a pleased humming. It’s tough to read the expression of a woman whose face is coated in [pc.cumNoun], but she seems pleased.");
	}
	//Gigantoload
	else
	{
		output("\n\nWith your own body utterly focused on expelling the prodigeous load of [pc.cumNoun] within you, you close your eyes and let it go, blasting her chest with more than enough of your distilled ardor to coat it in its entirety. Its owner doesn’t seem shocked or even bothered. In fact, you’re pretty sure she’s smiling through her moans, and she doesn’t even lose her grin when your firehose hits her face.");
		output("\n\nIrellia sputters enough to resume breathing, circling her tongue around her blue-painted lips until their original color shines through drizzling seed. There’s no stopping you either. You’ve far too much [pc.cumNoun] to stop, despite already drenching her entire upper body. Waterfalls of your liquid DNA cascade down either side of her breasts and down her shoulders in a perverse cape. It puddles on the floor below her, deepening moment by moment. It’s only once you’ve nearly gone dry that you press the [pc.cockHeadBiggest] against her lips to let her savor the flavor.");
		output("\n\nShe purrs in delight while lapping at it, long since recovered from her own pleasure. With four hands wrapping around it, the queen coaxes every last drop from you.");
	}
	//Merge
	//Came lots
	if(cumQ >= 20) 
	{
		output("\n\nLifting you with surprising ease, Queen Irellia places you alongside her, back on your feet. She licks her fingers clean, one after another, winking at you while her handmaidens scowl");
		if(cumQ >= 1000) output(" and gather their cleaning supplies");
		output(". One of them gathers the eggs she expelled while another offers you a towel.");
	}
	output("\n\n<i>“Not bad, [pc.name].");
	if(!pc.canTitFuck(true)) output(" I guess you know what to do with these after all.");
	else output(" I guess having your own to practice on paid off.");
	output(" Do me a favor and come back sometime soon. It’s nice to have such a... suitably endowed substitute drone on call.”</i> The giant of a myr licks a droplet from her lip.");
	processTime(23);
	irelliaSexBreak();
	pc.orgasm();
	pc.exhibitionism(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Double-Team
// By JimT
// Must be able to take a big ass myr cock. Probably 4 inches wide, 12-16 inches long?
public function doubleTeamingWithTheJimTOnSomeAntSlutQueenMayhapIDunno():void
{
	clearOutput();
	showIrellia();
	author("JimT");
	//First time:
	if(flags["IRELLIA_DOUBLE_TEAM_EVER_DONE"] == undefined)
	{
		output("It’s rather hard to find a myr male who hasn’t been taken, and you’re sure the Queen gets the cream of the crop. You suggest that perhaps she shouldn’t dismiss all the drones, also asking her if she has a favorite male servant.");
		output("\n\nQueen Irellia touches her chin and shoots you a salacious smile. <i>“I don’t have a favorite, rather, I have <i>favorites</i>. It’s too hard to pick just one.”</i> Realizing this doesn’t help you narrow it down, she airily waves her hand. <i>“I can recommend one if you’ve got a preference. Are you a fan of muscles, feminine men, something in between-?”</i>");
		output("\n\nShe almost sounds like she’s describing a buffet. Perhaps for a Myr queen, men really <i>are</i> a buffet item. You get the impression she might pick them entirely by her mood.");
		output("\n\nA tingling sensation spreads through your lower abdomen. From the sound of things, you’ve got a queen’s harem at your beck and call right now. The thought alone is thoroughly intoxicating ");
		if(pc.hasCock()) output("and your [pc.cocks] naturally stiffen");
		if(pc.cockTotal() == 1) output("s");
		if(!pc.hasCock() && pc.hasVagina()) 
		{
			output(" and your [pc.vaginas] moisten");
			if(pc.totalVaginas() == 1) output("s");
		}
		output(".");
	}
	//Repeat:
	else
	{
		output("You fondly reminisce about the time you were sandwiched between Iriella and one of her harem. Given it was so fun last time you’re eager to try it again, and you state as much to Irellia.");
		output("\n\n<i>“That <i>was</i> fun, wasn’t it?”</i> The gold queen flushes. Her arms cross underneath her titanic tits and she deliciously hefts them. <i>“...What’s your preference this time?”</i>");
	}
	//[Muscular] [Moderate] [Feminine]
	processTime(1);
	clearMenu();
	//Muscular.tooltip - You like big men with rippling muscles and chiseled jaws.
	addButton(0,"Muscular",muscleMyrDoubleTeamGO,undefined,"Muscular","You like big men with rippling muscles and chiseled jaws.");
	//Moderate.tooltip - You like tall, lean men, not muscle-bound wrestlers or feminine boys.
	addButton(1,"Moderate",fuckAGenericMyrWithQueenIrellia,undefined,"Moderate","You like tall, lean men, not muscle-bound wrestlers or feminine boys.");
	//Feminine.tooltip - There’s something about a feminine-looking man that revs your starship propulsors.
	addButton(2,"Feminine",tellIrelliaYouLikeEmGirly,undefined,"Feminine","There’s something about a feminine-looking man that revs your starship propulsors.");
	// Depending on selection, a muscular, moderate, or feminine male joins them for sexytimes. I've put these different versions in brackets.
}

//Muscular:
public function muscleMyrDoubleTeamGO():void
{
	clearOutput();
	showIrellia();
	author("JimT");
	//First time with Iloden/Muscular Myr:
	if(flags["MET_ILODEN"] == undefined)
	{
		output("You’re feeling like a piece of beefcake, but do the myr even have men like that? According to the codex, they’re all rather slight of build. It might be too much of an ask.\n\n<i>“Of course we do,”</i> Irellia assures you, before turning to one of her handmaidens. <i>“Go fetch Iloden!”</i>");
		output("\n\nNeither of you have to wait long before what can only be described as an alien adonis strides into the room. With striking black hair, perfect pectorals, and purposeful gait, you touch your mouth to check that you’re not drooling. Yow!");
		output("\n\nFurther down, things just keep getting better. Between those powerfully thick thighs is a golden cock truly made for a queen. Even with all that muscle, his dick is disproportionate to his body size, dangling down near his amber knees. It takes you a moment to spot his equally mammoth balls tucked behind his incredible girth.");
		output("\n\nHas he taken mods? He looks like he’s taken mods. That <i>can’t</i> be the product of nature. He’s just-he’s just way too perfect.");
		output("\n\n<i>“...I want your job,”</i> you huskily admit to Irellia, and the gold queen chuckles.");
		output("\n\nThe muscular myr kneels before you both, bowing solemly. <i>“My queen and company - how may I be of assistance?”</i> His voice is quite gravelly, matching his rugged exterior.");
		output("\n\n<i>“[pc.fullname], meet Iloden. As you can see, he’s very unusual compared to most other males, though I understand his type isn’t uncommon for you off-worlders,”</i> Irellia remarks. She then gestures in your direction. <i>“...Iloden, you will be pleasuring us both. I hope you are up to the task?”</i>");

		output("\n\n<i>“Always, my lady.”</i> You swear you spot a slight smile tugging at the side of his lips, though it is hastily suppressed.");
		flags["MET_ILODEN"] = 1;
	}
	//Not first time with Iloden/Muscular myr:
	else
	{
		output("When it comes to myr males, you can’t think of anyone better than Iloden. Just thinking about his pectorals and glorious black hair - not to mention his titanic tool - sends a delicious shiver down your spine. You tell Irellia as much.");
		output("\n\n<i>“I’m sure he’ll be glad to hear it,”</i> she musically laughs, and then calls for him. It’s not long at all before he’s purposefully pacing into the room and kneeling before you both.");
		output("\n\n<i>“My queen, [pc.master] Steele - how may I be of assistance to you both?”</i> He asks in that wonderfully gravelly voice. You swear you see a glimmer of delight in those black eyes of his. It’s so hard to tell with these myr!");
		output("\n\n<i>“...Iloden, you will be pleasuring us both once again. It seems [pc.fullname] has taken a liking to you.”</i>");
		output("\n\n<i>“...Oh?”</i> There’s a definite lilt of pleasure in his voice, just barely suppressed. You can’t help but grin - it seems you weren’t the only one who enjoyed yourself last time!");
	}
	processTime(3);
	clearMenu();
	addButton(0,"Next",partTwoOfAntSlootBoogalooDoubleteam,"Iloden");
}

//Moderate:
public function fuckAGenericMyrWithQueenIrellia():void
{
	clearOutput();
	showIrellia();
	author("JimT");
	//First time with Aurin/Moderate Myr:
	if(flags["MET_AURIN"] == undefined)
	{
		flags["MET_AURIN"] = 1;
		output("You’re not in the mood for bulging muscles or effeminate men. You ask instead if she can recommend anyone who is a bit balanced.");
		output("\n\n<i>“Of course, though our concept of balanced may be a bit different than yours,”</i> Irellia admits, before turning to one of her handmaidens. <i>“Go fetch Aurin!”</i>");
		output("\n\nNot long after, the handmaiden comes back, followed by a devilishly handsome myr male. From his striking strawberry blonde hair to his modellishly lean figure, this man really is a feast for the eyes. He <i>knows</i> he’s sexy too, if that strut is any indication.");
		output("\n\nLike most myr, he’s buck naked and his bits are dangling between those tightly toned thighs. His golden phallus is built for breeding, dangling down near his knees. His gilded balls are equally sizable and well hidden behind his glorious cock.");
		output("\n\n<i>“Hot damn,”</i> you exclaim. It’s a good thing it’s okay to stare, because if you saw him on the street, you’re not sure you could help yourself. Talk about eye candy!");
		output("\n\nThe totally hunky myr kneels before you both, bowing solemnly. <i>“My exquisite queen and company - how may I be of assistance today?”</i> His voice is a powerful, robust baritone. For some reason, it reminds you of melting chocolate; it’s just that deliciously rich.");
		output("\n\n<i>“[pc.fullname], meet Aurin. He’s one of my regular attendants, and quite skilled at his job.”</i> Irellia informs you. She then gestures in your direction. <i>“...Aurin, I trust you’ll have no trouble pleasuring us both? I know you love a challenge.”</i>");
		output("\n\n<i>“Do I ever.”</i> Aurin replies, a charming smile flashing across those perfect lips. Apparently among the queen’s attendants, this particular drone is allowed a little more informality. He must really be one of her favorites!");
	}
	//Not first time with Aurin/Moderate myr:
	else
	{
		output("Aurin springs to mind; what with his gorgeously thick sandy blonde hair, lean, sexy body, and gorgeous grin. You tell Irellia you’d like a bit of <i>that</i> action.");
		output("\n\n<i>“Really? I’m feeling Aurin too,”</i> she also admits, and then calls for him. It’s not long at all before he’s striding confidently into the room and kneeling before you both.");
		output("\n\n<i>“My lovely royal ladies - how may I be of assistance to you both?”</i> The myr male asks with a roguish smile. It never fails to impress exactly how bold he is in front of his queen and company. She really would let him get away with murder, but with that smile and those kissable lips, who wouldn’t?");
		output("\n\n<i>“...Aurin, you will be pleasuring us both once more. I trust you have no complaints-?”</i> Irellia playfully asks. The question is of course rhetorical.");
		output("\n\n<i>“Nothing would please me more,”</i> he genuinely responds in that sexy, baritone voice. A delightful little shiver runs down your spine and travels right down to your [pc.feet].");
	}
	processTime(3);
	clearMenu();
	addButton(0,"Next",partTwoOfAntSlootBoogalooDoubleteam,"Aurin");
}

//Feminine:
public function tellIrelliaYouLikeEmGirly():void
{
	clearOutput();
	showIrellia();
	author("JimT");
	//If first time Etheln/Feminine myr:
	if(flags["MET_ETHELN"] == undefined)
	{
		flags["MET_ETHELN"] = 1;
		output("You’re curious - and more than a little titillated - by the thought of a feminine male myr. You tell Irellia as much.");
		output("\n\n<i>“I know <i>just</i> who to call then,”</i> she tells you before turning to one of her handmaidens. <i>“Go fetch Etheln!”</i>");
		output("\n\nThere’s a little wait before two handmaidens return. It’s not until they get closer that you realize one of them has a golden cock between her legs, and not a small one either. It’s dangling halfway down her legs, barely hiding an equally low and large set of balls.");
		output("\n\nIt’s only when she kneels before you that you realize <i>this</i> must be Etheln, but... he has breasts! Modest ones, to be sure, but he definitely has a pair of well-rounded B-cups.");
		output("\n\n<i>“You’re a boy!”</i> you accidentally shout out. Etheln furiously blushes. His bright orange hair is silky and shoulder length, just like a woman. In fact, the only things that aren’t incredibly feminine about him are his slender hips and extremely large phallus.");
		output("\n\n<i>“Y-yes I am, " + pc.mf("s-sir!","m-ma’am!") + "”</i> The girly-boy stammers back, clearly flustered by your blurted words. The queen laughs, but then composes herself with a quick cough.");
		output("\n\n<i>“My apologies, dear Etheln. I didn’t mean to laugh,”</i> she flushes. <i>“Etheln is a rare occurrence among we gold myr. Just like me, he is a ‘honeypot myr’. A male honeypot myr is exceedingly rare.”</i>");
		output("\n\nYou look down at his golden bosom and notice his puffy nipples are indeed lactating an amber-hued nectar, just like Irellia. His breasts look so swollen and cute!");
		output("\n\n<i>“...Etheln, you will be pleasuring us both today. That’s not too much for you to handle, is it?”</i> Irellia playfully asks.");
		output("\n\n<i>“N-no my queen!”</i> Etheln stammers back. You notice his girthy member twitches at the news - he seems barely able to contain his delight. It’s not just his looks, but his personality is rather adorable as well. He is definitely more ‘boy’ than ‘man’, despite that considerable package between his legs.");
	}
	//Else
	else
	{
		output("Etheln immediately springs to mind; you’d definitely like to play around with him again. You tell Irellia as much.");
		output("\n\n<i>“He is rather cute, isn’t he?”</i> Irellia admits, before turning to one of her handmaidens. <i>“Go fetch Etheln!”</i> It’s not long before the effeminate looking myr is dashing into the room.");
		output("\n\nThe moment he reaches you both, he falls to one knee. As he bows to you both, you get a nice view of his well rounded breasts and pert nipples. Delicious!");
		output("\n\n<i>“...Etheln, you will be pleasuring us both once more. Are you sure you’re... fit for the task?”</i> The gold queen titters, all the while holding one of her hands in front of her mouth.");
		output("\n\n<i>“O-of course!”</i> The girly-boy nervously stammers, but his dark eyes are glimmering with delight. He tucks one of his scarlet bangs behind his ear and looks at you. The moment your eyes meet, his considerable manhood begins to twitch and stir.");
	}
	processTime(3);
	clearMenu();
	addButton(0,"Next",partTwoOfAntSlootBoogalooDoubleteam,"Etheln");
}

public function partTwoOfAntSlootBoogalooDoubleteam(partner:String = ""):void
{
	clearOutput();
	showIrellia();
	author("JimT");
	//Muscular:
	if(partner == "Iloden")
	{
		output("Iloden strides up to you until he’s standing only a few inches away. There’s a definite electricity in the air as he stares at you with his dark alien eyes. This man has a powerful presence to match his strong, hard body, and you feel yourself being slowly swept up in it despite yourself.");
		output("\n\nHe raises a gloriously muscled arm and, while still staring intensely into your eyes, ");
		if(!pc.isNude())
		{
			output("pointedly strips off your ");
			if(!(pc.armor is EmptySlot)) 
			{
				output("[pc.armor]");
				if(!(pc.lowerUndergarment is EmptySlot)) output(" and then your [pc.lowerUndergarment]");
			}
			else output("[pc.lowerUndergarment]");
			output(". You shiver as your protective layers are removed, leaving you naked before him. He then ");
		}
		output("strokes your cheek. You feel yourself leaning into it like a cat and pressing your cheek against those thick digits.");
		output("\n\nHe slides his hands downwards, teasing your naked [pc.skinFurScalesNoun], and plants his palms firmly upon your [pc.hips]. His hands aren’t the only ones wandering - you slide your own down that hard, hairless chest and tentatively touch his throbbing manhood. Feeling how hot and hard he is makes your stomach flip with delight; he’s clearly into it as much as you are.");
		output("\n\nUsing both your hands, you jerk him off, and your efforts quickly rewarded with an appreciative groan. His masculinity throbs and pulsates beneath your ministering fingers. Your mouth waters as you watch his massive tip dilate and flex; how long before his cum broils up from that tip and shoots all over your eager hands?");
	}
	//Moderate:
	else if(partner == "Aurin")
	{
		output("Aurin sultrily strides up to you until you’re standing intimately close. He stares at you with his dark, alien eyes and slides an arm around your waist. You let out a gasp as he pulls you close - you’re even more surprised when he seals his soft lips over yours. Void, he tastes so delicious; you unconsciously slide your arms around his neck.");
		output("\n\nReturning the kiss now with equal fervor, your tongues dance together. He slides his hands down to your waist, but you don’t even notice.");
		if(pc.hasCock()) output(" Both of your cocks - erect on both sides - press against each other, like they’re kissing as well.");
		output(" A hot flush begins to sweep through your body, your temperature rising and refusing to go down.");
		if(!pc.isNude()) 
		{
			output(" You’re wearing <i>way</i> too many clothes...");
			output("\n\nYour golden-haired lover seems to have the same thought. He helps you trip off your ");
			if(!(pc.armor is EmptySlot)) 
			{
				output("[pc.armor]");
			 	if(!(pc.lowerUndergarment is EmptySlot)) output(" and then your [pc.lowerUndergarment]");
			}
			else output("[pc.lowerUndergarment]");
			output(". Even though you’re so warm, you tremble as your protective layers are removed, leaving you bared before him.");
		}
		output("\n\nStill kissing him with feverish intensity, you slide your hands down his broad, hairless chest and down further-much further. You sensuously stroke his throbbing manhood, though you need both hands to do it. He’s already so <i>hot</i> and <i>hard</i> by the time your hands arrive - you’re delighted to know he’s just as worked up as you are, despite being a professional " + pc.mf("don juan","ladies man") + ".");
		output("\n\n<i>“Mmm, careful... if you keep touching me like that, I can’t be responsible for my behavior...”</i> Aurin breathily warns you. Leaning forward, he sucks upon your neck, causing an electric shiver to shoot down your spine. Oooh- you just found a new weak point of yours. That part of your neck is really sensitive!");
	}
	//Feminine:
	else
	{
		output("Etheln walks timidly up to you. Even his gait is very feminine. You wonder if the other males made fun of him for his breasts, or perhaps enjoyed themselves with them-? He has a timid air that makes him seem very... vulnerable.");
		output("\n\n<i>“How may I serve you, mistress?”</i> He asks in his all too high pitched voice. Like a cat eyeing a mouse, you feel a mischievous, predatory urge swell up inside your breast.");
		output("\n\n<i>“Look at me,”</i> you command, and he meekly obeys. ");
		if(!pc.isNude())
		{
			output("With deliberate slowness, you strip off your ");
			if(!(pc.armor is EmptySlot)) 
			{
				output("[pc.armor]");
			 	if(!(pc.lowerUndergarment is EmptySlot)) output(" and then your [pc.lowerUndergarment]");
			}
			else output("[pc.lowerUndergarment]");
			output(". You feel a salacious thrill as he looks upon your naked [pc.race] body, soaking in your [pc.chest], [pc.belly] and loins.");
			if(pc.race().indexOf("myr") != -1) output(" You get the feeling it is the first time he’s seen a naked [pc.raceShort], and you ");
			else output(" You ");
			output("can tell by the swelling of his ample sized cock that he’s definitely enjoying the sight.");
		}
		output("\n\nYou stride forward until you’re inches away from each other. With a single hand, you reach down and grab his twitching shaft. In his ear, you whisper <i>“...Are you enjoying the sight? No lying now.”</i> Your cheek is pressed against his and you can feel the warmth of his blush against your [pc.skinFurScales].");
		output("\n\nThe femboy shyly nods. With long, languid strokes, you tease his girthy cock with your fingers. He lets out a trembling moan and buries his face in your shoulders. All it takes is a few strokes before there’s the wet, sticky sensation of pre-cum dribbling over your fingers.");
		output("\n\nYou pointedly squeeze his cock and make a chastising noise. <i>“Tsk-don’t you have any control? You’re the one meant to be pleasuring <i>us</i>, not the other way around.”</i> With both hands you passionately work his shaft, increasing his obvious frustration. He lets out a long, heated whine from his soft, girly lips.");
		output("\n\n<i>“I-I-I can’t hold on any longer-!”</i> He pants and whimpers. With a violent little spasm, he trembles and shoots long, sticky arcs of his gooey myr spunk all over your [pc.belly]. It gushes down your hands - there’s so much of it! He may be a pushover, but he’s a potent one. Gushes of warm alien cum stream down his shaft and all over your fingers for what seems like an eternity as he moans with absolute delight.");
		output("\n\nWith a devilish little grin, you scoop up a thick dollop of his creamy spunk and press it against those feminine lips of his. With a dreamy expression on his face, he laps at your fingers. <i>“Now swallow,”</i> you order him. He immediately complies with a bright blush; a mixture of embarrassment and delight. Even after such an explosive orgasm, you can see his girthy, cum-slickened tool hardening once more.");
	}
	processTime(3);
	// MERGE
	clearMenu();
	addButton(0,"Next",partThreeOfAntOnPCOnAntAction, partner);
}

public function partThreeOfAntOnPCOnAntAction(partner:String = ""):void
{
	clearOutput();
	showIrellia();
	author("JimT");
	
	var x:int = -1;
	if(pc.hasVagina()) x = rand(pc.totalVaginas());
	
	output("<i>“As much as you’re both enjoying yourselves, I hope you haven’t forgotten about me?”</i> Irellia playfully interjects. You turn your head. Her large, thick legs are parted wide and her fingers are teasing her human-like front pussy. Despite her complaint, you notice her honey-colored lips are already glistening and wet, and her fingers are slowly stroking her erect clit. Your mouth wettens with anticipation - what a delicious sight!");
	//Muscular Myr:
	if(partner == "Iloden") output("\n\nIloden turns you around by your hips and marches you up to the expectant queen. His forceful hands bend you forward");
	else if(partner == "Aurin") output("\n\nAurin turns you around by your hips and escorts you up to the expectant queen. His masterful hands bend you forward");
	else output("\n\nEtheln coughs, and with a little blush, escorts you up to the expectant queen. He dutifully bends you forward");
	output(" until your nose presses against the giant regent’s glistening snatch. You greedily inhale her sweet and sensuous lady musk. It’s so intoxicating that you wrap your arms under and around her upper thighs, press your mouth and nose into her muff, and dreamily inhale her pussy scent.");

	output("\n\n<i>“You like my pussy, " + pc.mf("Mr.","Ms.") + " Steele?”</i> You lightly nod in response, with your face pressed shamelessly against her slick, sticky folds. <i>“How about you take a taste of a queen, and see if you like the flavor?”</i>");

	output("\n\nYou don’t need to be asked twice! You lap at the gap between her puffy lips and dip your [pc.tongue] hungrily inside her honeypot. ‘Honeypot’ really is the right word, because she tastes so damn sweet, you’re pretty sure you could put her girl juices on toast. You roll your tongue around inside of her and lap at her fleshy inner walls. As you lick you are rewarded with beads of sweet nectar that dribble onto your tongue and dance upon your taste buds.");

	output("\n\nFrom behind, " + partner + "’s erect");
	if(partner == "Etheln") output(", cum-slickened");
	output(" length rubs up against your bare buttocks and his ");
	if(partner == "Iloden") output("commanding");
	else if(partner == "Aurin") output("masterful");
	else output("ladylike");
	output(" hands are directing you by your [pc.hips]. He strokes his throbbing underside between your [pc.skinFurScalesColor] cheeks, and you shiver with delight.");
	if(pc.hasCock()) output(" [pc.EachCock] is blissfully hard and pressing against your [pc.belly].");
	else if(pc.hasVagina()) output(" [pc.EachPussy] is fiercely hot and wet. You’re aching for something, <i>anything</i> inside of you.");
	else output("Your [pc.asshole] is yearning for something, <i>anything</i> inside of it - hopefully he’ll do the honors?");

	output("\n\nHis pulsing tip teases your ");
	if(x >= 0) output("dripping wet snatch");
	else output("sensitive anus");
	output(". With a muffled whine, you push your hips back, unwilling to wait... but he pulls back.");
	if(partner == "Etheln") output(" What cheek!");
	else output(" So mean!");
	output(" Just when you think he’s going to tease you until you cum, he presses forward, and eases himself just barely inside of you. You let out a muffled curse - he’s so HUGE! Your poor ");
	if(x >= 0) output("pussy");
	else output("pucker");
	output(" stretches and gapes around his apple-sized cockhead. A few inches more and you’re quite literally over the hump.");

	output("\n\n<i>“How do you like his cock, dear?”</i> Irellia huskily inquires. She’s raising her hips insistently, and you realize the moment he thrust into your [pc.vagOrAss " + x + "] you rudely stopped licking. You bury yourself in her golden royal muff once more, making sure you give just as much as you receive. Wrapping your [pc.lips] around her sizable clit, you suckle and lick on it as he eases his hot flesh deep inside of your");
	if(x >= 0) output(" sopping wet cunny");
	else output(" [pc.asshole]");
	output(". His massive glans bottoms out inside of your ");
	if(x >= 0) output("well lubed passage and kisses your cervix");
	else output("velvety passage");
	output(".");

	if(x >= 0) pc.cuntChange(x,300,true,true,false);
	else pc.buttChange(300);

	output("\n\nSoon the air is filled with the sound of slapping flesh and moans, with you adding your fair share. You’re drowning in pleasure, letting out a sweet, muffled cry into the ant queen’s muff every time he withdraws and powerfully thrusts back in your ");
	if(x >= 0)
	{
		output("drooling snatch. Your trembling [pc.legOrLegs]");
		if(pc.legCount == 1) output(" is");
		else output(" are");
		output(" utterly soaked!");
	}
	else output("[pc.butt]. He’s really pounding your [pc.asshole]!");

	output("\n\nThe harder the ");
	if(partner == "Iloden") output("muscular");
	else if(partner == "Aurin") output("handsome");
	else output("girly-boy");
	output(" myr pounds you, the more you suck and lick on Irellia’s clit, desperately lapping at her love button to stop yourself from going over the edge. Your oral attentions push the giant golden queen over the edge. Grabbing your head in her hands, she presses her sopping wet snatch hard against your lapping mouth and lets out a positively shrill cry. Suddenly jets of splashing amber liquid are splattering against your [pc.face]. Her gigantic thighs spasm tremble against your ears as she absolutely creams herself all over your cheeks, showering you in her sweet-smelling girl juice.");

	output("\n\nWatching the queen quiver and unload all over your [pc.face] also sets off your ");
	if(partner == "Iloden") output("burly");
	else if(partner == "Aurin") output("hunky");
	else output("cute");
	output(" lover behind you, who groans and tightly grabs your [pc.hips].");
	if(x >= 0) 
	{
		output(" With a final, glorious thrust, he presses his prodigious length deep inside you until his tip is kissing your");
		if(pc.isPregnant(x)) output(" currently occupied");
		output(" womb. With a violent shudder, " + partner + " unloads inside your [pc.vagina " + x + "] and fills up your ");
		if(!pc.isPregnant(x)) output("uterus");
		else output("love canal");
	}
	else output(" With a final, glorious thrust, he presses his prodigious length deep inside you. " + partner + " unloads inside your clenching buttocks and fills up your rectum");
	output(" with his warm, roiling myr seed.");

	output("\n\nWith a " + pc.mf("trembling groan","sweet cry") + " and a face and ");
	if(x >= 0) output("snatch");
	else output("ass");
	output(" coated in myr cum, you ");
	if(pc.hasCock())
	{
		output("shoot ");
		var cumQ:Number = pc.cumQ();
		if(cumQ < 5) output("miniscule amounts");
		else if(cumQ < 200) output("arching loads");
		else if(cumQ < 2000) output("liberal loads");
		else output("gallons of");
		output(" [pc.cum] all over your [pc.belly] and all over the floor.");
	}
	else if(x >= 0)
	{
		output("clench and spasm around him, your [pc.girlCum] mixing with his potent alien spunk. A mixture of liquids liberally runs down your [pc.legOrLegs] - myr and [pc.girlCumNoun].");
	}
	else output("cream yourself around " + partner + "’s deeply buried cock.");
	output(" Wracking spasms of pleasure seize your body, and your legs go out from under you. Just in time, the ");
	if(partner == "Iloden") output("robust");
	else if(partner == "Aurin") output("slender");
	else output("girly");
	output(" myr wraps an arm under you and he keeps you propped up until your incredible orgasm subsides.");

	output("\n\nJust when you think it’s all over and things can’t get any better, " + partner + " picks you up and hoists you up off your feet. ");
	if(partner == "Etheln") output("The surprisingly strong myr");
	else output("He");
	output(" holds you, your back pressed against his ");
	if(partner == "Etheln") output("tiny breasts");
	else output("chest");
	output(" and his semi-hard cock still buried inside of your cum-splattered ");
	if(x >= 0) output("pussy");
	else output("butt");
	output(". With hands hooked under your [pc.knees], ");
	if(pc.legCount > 1) output("he spreads your ");
	else output("he adjusts your ");
	output("[pc.legOrLegs] for Irellia, who is licking her lips with salacious anticipation.");
	if(pc.hasCock()) 
	{
		output(" [pc.EachCock] ");
		if(pc.hasVagina()) output("and [pc.eachVagina] ");
		output("are sticky with your [pc.cum] and exposed to her like a lewd prize for the taking.");
	}
	else if(pc.hasVagina()) output(" [pc.EachPussy] is sticky with your [pc.girlCum] and exposed to her like a lewd prize for the taking.");
	else output(" The point in which you are joined, his dripping member and your clenching ring, are lewdly exposed to her.");

	processTime(16);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",irelliaDoubleTeamFinale,[partner, x]);
}

public function irelliaDoubleTeamFinale(arg:Array):void
{
	clearOutput();
	showIrellia();
	author("JimT");
	
	var partner:String = arg[0];
	var x:int = arg[1];
	
	if(pc.hasCock())
	{
		output("Dropping down to her knees, the buxom myr queen’s breasts jiggle under her, and she crawls up between your parted thighs. She wraps her blue painted lips around [pc.oneCock] and begins sucking it and your [pc.cum] off.");
		if(pc.balls > 0) output(" One of her hands slides up and cradles your [pc.balls], teasing them as she bobs up and down on your cream slickened spire.");
		output("\n\nYou tremble and moan while she masterfully sucks your hypersensitive glans and teases your dilated urethra with her tongue-tip. When your other lover begins pistoning your [pc.vagOrAss " + x + "] once more, your loins are seized with riveting waves of pleasure, and you feverishly wiggle your hips. You’re being stirred up by them both - a queen’s mouth on your [pc.cockNoun] and " + partner + "’s dick in your ");
		if(x >= 0) output("cunt");
		else output("butt");
		output(" -and you feel like your mind is about to break-! When the myr cums yet again, shooting ropes of his wonderfully warm cream inside of your inner walls, you’re pushed <i>way</i> over the edge...");

		output("\n\nA rumbling geyser rises up within you and shakes your whole body in shuddering, glorious waves. With a shrill cry, you clench his cock and utterly cream yourself; this time shooting your [pc.cum] directly into the myr queen’s mouth. You shamelessly unload every little dribble your [pc.balls] have left to give on her royal tongue, while at the same time " + partner + " unloads his balls inside of your [pc.vagOrAss " + x + "].");
	}
	//else if PcGotPussyTrue
	else if(x >= 0)
	{
		output("Dropping down to her knees, the buxom myr queen’s breasts jiggle under her, and she crawls up between your parted thighs. She brushes her blue painted lips against [pc.onePussy] and begins licking it and your [pc.girlCumNoun] off. You blush in the knowledge that a queen is lapping up <i>your</i> [pc.girlCumFlavor] nectar and you feel yourself getting hot and bothered all over again.");
		output("\n\nYou tremble and moan while she masterfully cleans your silky [pc.pussyColor " + x + "] lips. When your other lover begins pistoning your [pc.vagOrAss " + x + "] once more, your loins are seized with riveting waves of pleasure, and you feverishly wiggle your hips. You’re being stirred up by them both - a queen’s mouth on your [pc.vagina " + x + "] and " + partner + "’s dick in your cunt - and you feel like your mind is about to break! When the myr cums yet again, shooting ropes of his wonderfully warm cream inside of your inner walls, you’re pushed <i>way</i> over the edge...");
		output("\n\nA rumbling geyser rises up within you and shakes your whole body in shuddering, glorious waves. With a shrill cry, you clench his cock and utterly cream yourself; this time shooting your [pc.girlCum] all over the myr queen’s face. You shamelessly unload every last drop your box has to give, while at the same time " + partner + " unloads his balls inside of your soppy snatch.");
	}
	else
	{
		output("Dropping down to her knees, the buxom myr queen’s breasts jiggle under her, and she crawls up between your parted thighs. She wraps her blue painted lips against your well-spread pucker and begins licking at it. You blush in the knowledge that a queen is lapping <i>your</i> gaping butthole and you feel yourself getting hot and bothered all over again.");
		output("\n\nYou tremble and moan while she masterfully cleans your cum-splattered star. When your other lover begins pistoning your [pc.asshole] once more, your loins are seized with riveting waves of pleasure, and you feverishly wiggle your hips. You’re being stirred up by them both - a queen’s mouth on and " + partner + "’s dick in your butt -and you feel like your mind is about to break-! When the myr cums yet again, shooting ropes of his wonderfully warm cream inside of your inner walls, you’re pushed <i>way</i> over the edge...");
		output("\n\nA rumbling geyser rises up within you and shakes your whole body in shuddering, glorious waves. With a shrill cry, you clench his cock and utterly cream yourself. At the same time, " + partner + " utterly unloads his balls inside of your [pc.ass].");
	}
	output("\n\nBasking in the afterglow, you lie back, utterly spaced out and twitching upon his fleshy column. His amber spunk slowly drools out through the barest of cracks between your [pc.vagOrAss " + x + "] and his phallus, though much more stays packed within your ");
	if(x >= 0)
	{
		if(!pc.isPregnant(x)) output("well-filled womb");
		else output("well-filled channel");
	}
	else output("stretched rectum");
	output(". Irellia seizes the chance to slide up and softly press her lips against yours. You dreamily make out with her, though you’re so spent you can barely do anything else.");
	output("\n\n<i>“You’ll have to come back and do this again sometime. Mating with my drones is always better with company,”</i> Irellia purrs. You have no problems if the queen wants to share the pleasure around.");
	output("\n\nWhen your [pc.legOrLegs] can finally support your weight, you slide off of " + partner + ", and his cock slides out of your [pc.vagOrAss " + x + "] with a lewd ‘pop’. All at once, a thick, gooey stream of spunk floods out of your ");
	if(x >= 0) output("wet lips");
	else output("[pc.ass]");
	output(" and down your [pc.thighs]. Before you leave, ");
	if(partner == "Iloden") output("Iloden gives you a playful slap on your buttocks, and you flush with delight.");
	else if(partner == "Aurin") output("Aurin turns you around, and kisses you as well. You moan and melt into his body, making out for what seems like forever, before you finally part. It seems Irellia wasn’t the only one who wanted a taste of your lips before you left.");
	else output("Etheln shyly tugs at your arm. You turn around, and he cutely pecks you quickly on the lips, before hurrying off.");

	// Big spooges in VagOrAss for player. 
	// Scene End
	processTime(7);
	IncrementFlag("IRELLIA_DOUBLE_TEAM_EVER_DONE");
	var ppMyrMale:PregnancyPlaceholder = new PregnancyPlaceholder();
	ppMyrMale.cumType = GLOBAL.FLUID_TYPE_HONEY;
	ppMyrMale.createPerk("Fixed CumQ", 8000, 0, 0, 0);
	if(x >= 0) pc.loadInCunt(ppMyrMale, x);
	else pc.loadInAss(ppMyrMale);
	pc.orgasm();
	irelliaSexBreak(4);
	pc.exhibitionism(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
