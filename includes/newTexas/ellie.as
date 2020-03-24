import classes.Characters.PregnancyPlaceholder;
//Notes to the Coder
//Nephelee has the following stat:
//NephAffect: Ranges from 0-100. Translates 2:1 as a bonus to her store discount -- at 100%, she grants the PC a 50% discount. 
//flag ELLIE_OPERATION tracks pregnancy content proccing:	1 = had the operation
//															2 = announced her pregnancy
//															3 = laid the eggs
//															4 = eggs hatched

public function nephAffection(arg:Number = 0):Number
{
	//Initialize the flag.
	if(flags["NEPH_AFFECTION"] == undefined) flags["NEPH_AFFECTION"] = 0;
	//Is it changed?
	if(arg != 0)
	{
		flags["NEPH_AFFECTION"] += arg;
		if(flags["NEPH_AFFECTION"] > 100) flags["NEPH_AFFECTION"] = 100;
		else if(flags["NEPH_AFFECTION"] < 0) flags["NEPH_AFFECTION"] = 0;
	}
	//adjust her shop markups here.
	chars["ELLIE"].sellMarkup = (200 - flags["NEPH_AFFECTION"])/100;
	return flags["NEPH_AFFECTION"];
}

public function publicUseCount(addVal:int = 0):int
{
	if (flags["PUBLIC_USE_COUNT"] == undefined) flags["PUBLIC_USE_COUNT"] = 0;

	flags["PUBLIC_USE_COUNT"] += addVal;

	if (flags["PUBLIC_USE_COUNT"] < 0) flags["PUBLIC_USE_COUNT"] = 0;

	return flags["PUBLIC_USE_COUNT"];
}

public function ellieApproachButtonSetup():void
{	
	if(flags["MET_ELLIE"] != undefined) addButton(0,"Ellie",ellieMenu,undefined,"Ellie","Approach Ellie, the leithan running the gift shop.");
	else addButton(0,"Shopkeep",meetingEllie,undefined,"Shopkeep","Approach the shopkeeper and see what she’s selling.");
	vendingMachineButton(1, "J'ejune");
}

//Meeting Ellie ([Shopkeeper])
public function meetingEllie():void
{
	clearOutput();
	author("Savin");
	showBust("ELLIE");
	showName("\nELLIE");
	output("You step up to the tauric woman behind the counter, blinking through the ever-thickening cloud of lust hanging in the air like a sickly sexual twist on air freshener. Your [pc.skin] flushes as you stagger up to the shopkeeper, a creature who looks like some mix between a lizard, a centaur, and a cow-girl. Her humanoid half sits looming over the counter, watching the other customers in the shop - who all seem about as awkwardly aroused as you - carry out their transactions with the automated terminals. As you approach, the tauric woman looks up from the line of auto-registers and gives you a great big toothy smile, the whites of her teeth blending in with her pale, ashen-colored skin. She takes a step forward, and you suddenly realize just how overpowering the musky odor’s become, just since you walked through the door. Your ");
	if(pc.hasCock())
	{
		output("[pc.cocks] ");
		if(pc.totalCocks() == 1) output("is");
		else output("are");
		output(" straining at full mast, shameless of ");
		if(pc.isCrotchGarbed()) output("their nakedness.");
		else output("the bulge forming in your [pc.lowerGarment].");
	}
	else if(pc.hasVagina())
	{
		output("[pc.vaginas] drool");
		if(pc.vaginaTotal() == 1) output("s");
		if(pc.legCount == 1) output(" obscenely down your [pc.leg], unable to hide its sudden and irresistible arousal.");
		else output(" obscenely between your [pc.legs], unable to hide its sudden and irresistible arousal.");
	}
	else 
	{
		output("body is wracked with a bout of lust so strong that you desperately wish that you had... something, some genital between your");
		if(pc.legCount > 1) output(" [pc.legs]");
		else output(" cheeks");
		output(" to give yourself some relief, no matter who’s staring.");
	}
	output(" A couple of bull-men standing in a corner of the shop looking at porno mags look up and chuckle at you.");

	output("\n\nYour attention snaps back to the aromatic taur when she speaks, her voice a throaty, sultry take on the classic Southern Belle. <i>“Hey there! Welcome to the Gift Shop. I’m Nephelee, the proprietor.”</i> She subtly thrusts her chest forward, breasts straining against their sheer restraints. A pointing finger draws your eyes to a little name tag pinned to her bra that reiterates her introduction. Her smile continues as she flips a lock of black-and-pink hair back over one of the large, bunny-like ears on her brow. <i>“Most folk call me Ellie, though! So, what do I call ya, stranger?”</i>");

	output("\n\n<i>“");
	if(silly) output("Steele. [pc.name] Steele");
	else output("[pc.name]");
	output(",”</i> you answer, not quite able to draw your eyes back up from Ellie’s bra-straining cleavage.");

	output("\n\nSeeing where your eyes are staying, the tauric girl squeezes her shoulders together and gives her bosom a hypnotic little shake. A big, wet smear forms right over her nipples as finishes, as though her obviously lactating tits had become so full she just couldn’t hold it in anymore. She giggles girlishly as your cheeks redden, watching her big, saucer-like nipples poke through the sheer bra that’s utterly failing to maintain her modesty. And the smell... the milky aroma of her bounty penetrates through her skimpy outfit, right to your nose, making the thick musky aura around her all the more difficult to bear. You’re only just holding back the urge to masturbate - or to grab the big-tittied taur and ");
	if(pc.hasCock()) output("shove your [pc.cock] between those huge melons");
	else output("see what that big, thick, curling tail of hers can do");
	output(".");

	output("\n\n<i>“Hehe. Like what you see?”</i> she teases, finally putting a stop to her blatant show and crossing her arms under her cow-like bosom. <i>“Don’t be shy - most of the bulls around here sure aren’t!”</i>");
	applyDamage(new TypeCollection( { tease: 10 } ), chars["ELLIE"], pc, "minimal");
	processTime(4);
	clearMenu();
	//[Yes] [Meh] [Don’t Like Girls]
	addButton(0,"Yes",yesEllieLetsHaveSexAsSoonAsWeMeet,undefined,"Yes","Tell her that you appreciate her rack in all its magnificence.");
	addButton(1,"Meh",mehYourTiTSDontScareMeOffworlder,undefined,"Meh","Play it cool for now. There’s no reason she needs to see what an effect she’s having on you.");
	addButton(2,"Don’tLike",iDontLikeGirlsYaBitch,undefined,"Don’t Like Girls","Inform Ellie that you don’t really care for her girls or girls in general.");
}

//Yes
public function yesEllieLetsHaveSexAsSoonAsWeMeet():void
{
	clearOutput();
	author("Savin");
	showBust("ELLIE");
	showName("\nELLIE");
	output("You eagerly give your answer in the affirmative, still unable to draw your gaze up from the alien girl’s rack - even her arms cradling it does the most wonderful things to those milk-swollen melons.");
	output("\n\nEllie grins. <i>“Thanks! I like to think they’re my best asset...”</i>");
	output("\n\nHer arms drop from under her bosom and onto the countertop, finally snapping you out of your boob-induced delirium. Oh, what you wouldn’t do to have a chance to play with those melons. <i>“Now then, anything I can help you with, sweetheart, or would you rather slip out back and get a closer look at my... inventory?”</i> ");
	processTime(1);
	//Ellie menu
	ellieMenu();
}


//Meh
public function mehYourTiTSDontScareMeOffworlder():void {
	clearOutput();
	author("Savin");
	showBust("ELLIE");
	showName("\nELLIE");
	output("You try and play it cool, doing your best to ignore the intense need boiling through your loins. You fight with your eyes until they finally draw back from Ellie’s huge rack and up to her face.");
	output("\n\nShe gives you a playful tsk of her tongue. <i>“Aww. Most bulls would have me spread open on the counter by now. Maybe you need a little dose of the Treatment to get some confidence, huh?”</i> she teases, though her long, reptilian tail brushes meaningfully across the rack of medipens behind the counter. <i>“After all, it’s the most amazing feeling in the world - for free! So what do you say, hun? Want a medi-pen full of a lifetime of ecstasy, or do I need to do a little more convincing?”</i>");
	processTime(1);
	//Ellie menu
	ellieMenu();
}

//Don’t Like Girls
public function iDontLikeGirlsYaBitch():void
{
	clearOutput();
	author("Savin");
	showBust("ELLIE");
	showName("\nELLIE");
	output("You blink away the lust-aura doing tricks on your mind and inform the shopkeeper that you’re not into women, no matter what her pheromones might say.");
	output("\n\n<i>“Aww,”</i> she coos, her full lips twisting in a playful pout. <i>“Fair enough, I guess. I’ll try and keep the flirting down to a minimum - but no promises! Anyway, if you’re here on New Texas, you’re gonna have a hard time picking up boys unless you’ve got your dose of the Treatment - trust me, you can pick ‘em up easy as breathing when you’ve got all the confidence and sexuality in the world.”</i>");
	output("\n\nHer long, reptilian tail brushes meaningfully across the rack of medipens behind the counter. <i>“Besides, it’s the most amazing feeling in the world - for free! So what do you say, hun? Want a medi-pen full of a lifetime of ecstasy, or do I need to do a little more convincing?”</i>");
	processTime(1);
	//Ellie menu
	ellieMenu();
}

//From all:
public function ellieMenu(display:Boolean = true):void
{
	author("Savin");
	showBust("ELLIE");
	showName("\nELLIE");
	if(display) 
	{
		//Codex locked:
		if(!CodexManager.entryUnlocked("Leithans")) 
		{
			output("\n\nAs you contemplate what to say, your Codex beeps that it’s identified Ellie’s species - Leithans. <b>(New Codex entry unlocked: Leithans.)</b>");
			CodexManager.unlockEntry("Leithans");
		}
		if(flags["MET_ELLIE"] == undefined) flags["MET_ELLIE"] = 1;
		//Repeat Greetings
		else if(flags["ELLIE_OPERATION"] == 4)
		{
			clearOutput();
			output("<i>“Heya, lover!”</i> Ellie says, smiling wide as you approach. <i>“You here to shop, or...”</i> she trails off as a tiny movement of her shoulder sends half of her bra slipping down, exposing a luscious areola. <i>“Want to sample the goods?”</i>");
		}
		else
		{
			clearOutput();
			if(nephAffection() < 33) output("<i>“Heyya, hun, welcome back!”</i> the tauric cow says languidly, crossing her arms under her ample udders as you approach. <i>“Need something? Anything at all...”</i>");
			else if(nephAffection() < 66) output("<i>“Hey, [pc.name],”</i> Ellie says with a toothy grin, leaning over the counter to give you the best possible view of her huge, bra-straining rack. <i>“Anything I can do for... or to... you?”</i>");
			else output("<i>“Hiyya, babe!”</i> Ellie says, smiling wide as you approach. She’s all but sliding out of her skimpy clothes by the time you reach the counter, barely containing her excitement - or her huge, milky rack. <i>“I hope you’re not here just to shop...”</i>");
		}
	}
	//Ellie’s Menu: [Buy] [Sell] [Talk] [Sex]
	clearMenu();
	elliesShopSetup();

	addButton(0,"Buy",ellieBuyWrapper);
	addButton(1,"Sell",sellToEllie);
	addButton(2,"Talk",talkToEllieYaFuckingSkank);
	addButton(3,"Suckle",suckleDatCowtaurTeat,undefined,"Suckle","Why not? You are thirsty.");
	if(pc.lust() >= 33) addButton(4,"Sex",ellieSexScene);
	else addDisabledButton(4,"Sex","Sex","Somehow, you’re still not turned on enough for sex.");
	addButton(14,"Back",mainGameMenu);
}

public function ellieBuyWrapper():void
{
	CodexManager.unlockEntry("ClearYu");
	CodexManager.unlockEntry("Rubber-Made");
	buyItem();
}

public function sellToEllie():void
{
	clearOutput();
	author("Savin");
	showBust("ELLIE");
	showName("\nELLIE");
	output("<i>“Sorry, hun, I can’t take anything off you,”</i> Ellie says apologetically, waving you off when you try to reach into your pack. <i>“This ain’t the frontier, ya know. I can’t do barter, or all sorts of useless crap would just pile up in the back room!”</i>");
	clearMenu();
	addButton(14,"Back",ellieMenu);
}

public function elliesShopSetup():void
{
	shopkeep = chars["ELLIE"];
	//Reset purchase prices
	nephAffection();
	//Ellie’s Menu: Buy
	chars["ELLIE"].keeperBuy = "<i>“Want something from the shop... other than me, anyway! Step on over to the auto-terminal and I’ll make sure you’re treated right";
	if(nephAffection() > 30) chars["ELLIE"].keeperBuy += ", especially since you’ve been so sweet on me";
	chars["ELLIE"].keeperBuy += ". Pardon the pun.”</i>\n";
	itemScreen = mainGameMenu;
	lootScreen = mainGameMenu;
	useItemFunction = mainGameMenu;
}

/*
output("\n\nThe Treatment");
output("\n\n//Tooltip: This white medipen is simply labeled, in bolded all-caps: <i>“THE TREATMENT.”</i> In tiny, well-concealed font a warning indicates that effects are seemingly random, and are <i>permanent</i>. ");

output("\n\nBig T. Bobblehead ");
output("\n\n//Tooltip: This limited-edition bobblehead bears the likeness of New Texas’s governor, Benjamin Tiberius Tee. Here he’s depicted as a comically exaggerated bull-horned human with a huge barrel chest and a great big black stetson. The blue suit he’s wearing is barely managing to strain over his huge frame. The bobblehead is giving you a big thumbs up, and a message at its base says, <i>“Live free on New Texas!”</i>");
output("\n\n//Key Item. Doesn’t really DO anything. ");


output("\n\nGrade T. Milk");
output("\n\n//Tooltip: These bottles of internally-cooled milk stay fresh for ages, and provide a serious energy boost! Nothing better to drink after a hard workout -- or a balls-to-the-walls fight. Every bottle comes with Big T.’s personal stamp of approval for taste. ");


output("\n\nEllie’s Milk");
output("\n\n//Unlocked after suckling at least once, and at Affection 50.");
output("\n\n//Cost: 0. Can <i>“buy”</i> one per six hours.");
output("\n\n//Tooltip: A tightly sealed bottle of the leithan Ellie’s milk, modified thanks to her Treatment. Guaranteed to make whoever drinks it go all but mad with lust!");


output("\n\nLacta Rush");
output("\n\n//Something Throbb-like, but for milk!");


output("\n\nStory: The Treatment");
output("\n\n//Tooltip: This download code will allow you to access the story <i>The Treatment</i>, a highly erotic tale told from the perspective of a happy recipient of the planet’s pride-and-joy drug, and her coming to terms with the changes to her mind and body.");


output("\n\nStory: Talon Rogue");
output("\n\n//Tooltip: This download code will allow you to access the story <i>Talon Rogue</i>, a pulp-fiction story with an erotic bend about an independent freighter captain’s unexpected run in with a famed pirate and swashbuckler. ");


output("\n\nStory: Gene Stealer");
output("\n\n//Tooltip: This download code will allow you to access the story <i>The Gene Stealer</i>, a follow-up to <i>Talon Rogue</i>. In this story, Captain Entara’s adventures head to Tarkus and into the ruins of a starship inhabited by a terrible enemy. ");


output("\n\nRepeat Items");
output("\n\nFrom other Vendors: Chocolac, Magic Milker. Incubi/Succubi Pills (When written)");
output("\n\nItem Uses/Functions");



output("\n\nItem: Grade T. Milk");
output("\n\n//Use, restores 75 Energy. 1/hour");

output("\n\nYou pop the cork on the little vial of ice-cold milk and knock it back in one quick gulp. Mmm, thick, creamy, and delicious! You feel seriously reinvigorated by the time you’ve finished, and toss the bottle aside. ");

output("\n\n//Try to use, on cooldown");
output("\n\nYou’re too full of milk already to drink more! You’ll give yourself the trots if you use that so soon... gotta wait a while!");

output("\n\nItem: Story DL Code");
output("\n\n//Use, access Codex entry for it");

output("\n\nYou pull out the little strip with your story download code on it and punch it into your Codex. A little download bar pops up, lasting barely a second before your codex chimes, <b>New story unlocked!</b>");

output("\n\nItem: Ellie’s Milk");
output("\n\n//Buy, hasn’t bought in last 6 hours");
output("\n\nYou ask Ellie if she happens to have any of her milk bottled up that she wouldn’t mind parting with.");

output("\n\nShe gives you a little grin, and her tail disappears under the counter. <i>“As it so happens, I just came back from the milk barn not long ago. Big T. won’t let me sell my milk thanks to it being kind of alcoholic, but he never said anything about giving it away!”</i> ");

output("\n\nHer tail reappears, curled around a glass bottle, which she sets on the counter between the two of you. <i>“Here ya go, hun! Hope you think of me when you drink it... and while you’re having fun right after!”</i> ");

output("\n\nYou reach across the counter to pick the bottle up, but before you can, the leithan girl leans over the counter and presents her cheek to you. You roll your eyes and give the taur what she wants: a quick kiss before you snatch the vial and stow it in your bag. She beams at you, and rubs at the spot on her cheek, now flushed a darker gray. ");

output("\n\n//Buy, has bought in last few hours");
output("\n\nYou ask Ellie if she happens to have any of her milk bottled up that she wouldn’t mind parting with.");

output("\n\n<i>“Sorry, hun,”</i> she says with a little shrug. <i>“Haven’t been to the milk barn all that recently, and I only bottle so much. There’s usually a bull or three eager to get at the rest!”</i>");

output("\n\nSeeing your disappointment, though, Ellie adds, <i>“If you want, I’d be more than happy to give you a taste straight from the tap!”</i>");
[Back to main menu]

output("\n\n//Use");
output("\n\nYou take out the bottled dose of leithan milk Ellie gave you and drink it down. Even though there’s not much in the bottle, the effects are still all but instantaneous: your [pc.skin] tingles and burns ever so slightly as the lusty, aphrodisiac-laden milk worms its way through you, the cold of the milk playing against the rising heat of your [pc.skin]... and your loins. {Your [pc.cock] is hard before you’ve had the chance to put the bottle away, throbbing with desperate need. What you wouldn’t give for a big, wet tauric pussy to pound it into...}");
*/

//Ellie’s Menu: Talk
//All Ellie talk scenes grant a one-time +5 to Affection.
public function talkToEllieYaFuckingSkank():void
{
	clearOutput();
	author("Savin");
	showBust("ELLIE");
	showName("\nELLIE");
	output("You ask Ellie if she has a few minutes to just talk.");
	if(flags["ELLIE_OPERATION"] == 4)
	{
		output("\n\nShe smiles at you. <i>“I’ve always got a few minutes for you, [pc.name].”</i> Looking you up and down, she adds, <i>“It doesn’t </i>just<i> have to be talking, though.”</i>");
		output("\n\nYou battle the urge to clamber over the counter right now, and after a hard-fought few seconds reason wins out. She sits on her reptilian hind end and eyes you with curiosity - and a bit of naked lust. <i>“I’m not doing anything important right now anyway. What’s up?”</i>");
		pc.changeLust(20);
	}
	else
	{
		output("\n\nShe purses her lips. <i>“Do I have time? Sure, I guess... but wouldn’t you rather do something more fun?”</i> Looking you up and down, she adds, <i>“I could think of a few things.”</i>");
		output("\n\n");
		if(pc.libido() < 70 || pc.lust() < 70) output("You’re sorely tempted to take the eager taur up on that offer, but for the moment, no. She pouts, but nods. <i>“Fine, I guess I’m not doing anything too important... but I’m warning you, the first bull to walk through with a hard-on might sweep me away, if you aren’t careful!”</i> With that, Ellie sits herself down on her reptilian hind end and looks at you expectantly.");
		else
		{
			output("<i>“Yeah, so can I,”</i> you say, eyeing those beautiful breasts of hers, undressing her with your mind even as the sexy taur gets ready to do it for real.");
			// {to sex menu}
			clearMenu();
			addButton(0,"Next",ellieSexScene);
			return;
		}
	}
	buildEllieTalkMenu();
}

public function buildEllieTalkMenu():void
{
	clearMenu();
	author("Savin");
	showBust("ELLIE");
	showName("\nELLIE");
	addButton(0,"Her Race",talkToEllieAboutHerRace,undefined,"Her Race","See if she wouldn’t mind talking about her race a little bit.");
	if(flags["ELLIE_OPERATION"] == 4) addButton(1, "Pheromones", ellieDoesntHavePheromonesAnymore, undefined, "Pheromones", "Ask her about her missing cloud of pheromones.");
	else if(flags["ELLIE_PHEROMONE_TALK_UNLOCKED"] != undefined) addButton(1,"Pheromones",talkToEllieAboutPheromones,undefined,"Pheromones","Ask her about the cloud of pheromones following her around everywhere.");
	else addDisabledButton(1,"Locked","Locked","You might need to talk to her about her race before this unlocks.");
	addButton(2,"Treatment",talkToEllieAboutTreatment,undefined,"The Treatment","Ask her about the Treatment thing that everyone here is on about.");
	addButton(3,"New Texas",talkToEllieAboutNewTexas,undefined,"New Texas","Ask her what she thinks about the planet.");
	
	//Lots of shit for this button for preg stuff
	if(flags["ELLIE_OPERATION"] == 1) addDisabledButton(4, "Operation", "Operation", "Ellie’s already had the fertility operation.");
	else if(flags["ELLIE_OPERATION"] == 2) addButton(4, "Pregnancy", talkToEllieAboutPregnancyButShesActuallyPregnantThisTime, undefined, "Pregnancy", "See how Ellie is fairing with her pregnancy.");
	else if(flags["ELLIE_OPERATION"] == 3) {
		if(shipLocation != "TAVROS HANGAR" && (disableExploreEvents())) addDisabledButton(4, "VisitNursery", "Visit Nursery", "You are unable to leave with your ship at the moment.");
		else addButton(4, "VisitNursery", ellieTakeOnTripToNursery, undefined, "Visit Nursery", "See if Ellie wants to go visit the eggs.");
	}
	else if(flags["ELLIE_OPERATION"] == 4) addButton(4, "Kids", askEllieAboutTheKiddos, undefined, "Kids", "Ask Ellie how she and the kids are fairing.");
	else if(flags["ELLIE_OPERATION_TALK_UNLOCKED"] != undefined) addButton(4, "Operation", talkToEllieAboutOperation, undefined, "Operation", "Discuss the fertility operation with Ellie.");
	else if(flags["ELLIE_PREG_TALK_UNLOCKED"] != undefined && nephAffection() > 66) addButton(4, "Pregnancy", talkToEllieAboutPregnancy, undefined, "Pregnancy", "Discuss pregnancy with Ellie.");
	else addDisabledButton(4, "Locked", "Locked", "You need to be really close with Ellie to discuss this.");

	if (pc.hasStatusEffect("Haley Bet In Progress") && flags["HALEY_WEAKSPOT_KNOWN"] == undefined) addButton(5, "Haley", ellieSnitchesOnHaley, undefined, "Haley", "Ask Ellie about Haley to see if you can get an advantage over the competition for your bet."); //function in ./haley.as
	 
	addButton(14,"Back",ellieMenu);
}


//Her Race
public function talkToEllieAboutHerRace():void
{
	clearOutput();
	author("Savin");
	showBust("ELLIE");
	showName("\nELLIE");
	if(flags["ELLIE_OPERATION"] == 4)
	{
		output("Well, you’re intimately familiar with her leithan biology by now, but a little reminder about regular leithans wouldn’t hurt.");
		output("\n\n<i>“Heh,”</i> Ellie grins, winking. <i>“You can reach back here and remind yourself of what makes me tick any time you like, sugar. But you wanna know stuff about the leithan race, right? Sometimes folk call us Centaurins, both on account of us being from Alpha Centauri and lookin’ a little like centaurs from earth mythology.”</i>");
		output("\n\nShe looks behind herself at her six-legged reptilian body, plated with scales and shields of naturally grown armor. <i>“I don’t really see the resemblance, but I don’t guess I mind much. Just so long as nobody calls me a pony, anyway. You can ride me like one if you want, though!”</i> Ellie giggles, her huge bust bouncing giddily. She brings one of her plated hands up to her lip, chewing on a knuckle as her laughter subsides.");
		
	}
	else
	{
		output("Your codex might have figured out what she is, but you’d like to hear a little about Ellie’s race from her.");
		output("\n\n<i>“I guess that’s reasonable,”</i> Ellie grins, adding proudly, <i>“I’m a leithan. Sometimes folk call us Centaurins, both on account of us being from Alpha Centauri and lookin’ a little like centaurs from earth mythology.”</i>");
		output("\n\nShe looks behind herself at her six-legged reptilian body, plated with scales and shields of naturally grown armor. <i>“I don’t really see the resemblance, but I don’t guess I mind much. Just so long as nobody calls me a pony, anyway. Though I wouldn’t mind so much if they wanted a ride after,”</i> Ellie giggles, her huge bust bouncing giddily. She brings one of her plated hands up to her lip, chewing on a knuckle as her laughter subsides.");
	}
	output("\n\n<i>“Anyway, you wanted to know about us leithans, not my equine proc.. procli- uh, fantasies! We come from one of the smaller worlds off of Alpha Centauri, the second planet from the sun. I’ve never seen it - my grandparents hopped ship just as soon as they could - but the vids I’ve seen make it look like a hot, desert planet. Not much water, ‘cept in the atmosphere. That’s what my great-grandfolks did: harvesting water from moisture vaporators. Dangerous job, since you have to work outside the city walls.”</i>");
	output("\n\n<i>“Why’s that more dangerous?”</i> you ask.");
	output("\n\n<i>“Cuz of the monsters, silly!”</i> Ellie says, a little more serious than before. <i>“I guess you’d call them predators, really. Titans, giants, dragons, all sorts of nasty things come from Centauri II. Well, not REALLY dragons, but they’re close enough: huge flying reptiles, kinda like us leithans, but way bigger and scarier - not cute and cuddly like we are. They may not breathe fire, but a Centauri dragon’ll rip you to shreds all the same. Them and the other huge, flesh-eating monsters on the homeworld’s why we leithans ended up growing all this armor.”</i> She flexes one of her arms for emphasis, showing off the black plates and scales on it. The motion does remarkable things to the straining scales and plates under her bust, too... <i>“Having a little armor makes us something to chew on, at least. That and the glowy lights all over us keep us from getting eaten </i>too<i> often, especially these days when leithans pack laser cannons and rocket launchers.”</i>");
	output("\n\nShe chuckles slightly, leaning forward enough to rest her heavy bosom on the countertop. The milk-laden bra holding them back makes a wet sound as she puts some weight on it. While Ellie adjusts herself, you ask her about <i>“getting eaten.”</i>");
	output("\n\nShe grimaces. <i>“Well, leithans weren’t the big, top-dog species on our homeworld that humans and ausar were. We might look tough and strong to most other folk, but on our planet, we’re the runts of the litter! Plenty of critters on Centauri II can eat us up in one gulp, and even more don’t mind taking a few bites. It wasn’t till the U.G.C. poked their heads in that my people finally managed to defend themselves.”</i>");
	if(pc.isNice()) output("\n\n<i>“That sounds terrifying,”</i> you say, ");
	else if(pc.isMischievous()) output("\n\n<i>“Yeesh. I can see why you leithans have legs made for running,”</i> you chuckle, ");
	else output("\n\n<i>“That had to have sucked,”</i> you grunt, ");
	output("your mind flooding with images of alien dragons and titanic, flesh-eating monstrosities. You saw a couple holo-vids of Centauri monsters growing up, but actually hearing it from a leithan is a different story.");
	
	if(flags["ELLIE_OPERATION"] == 4) output("\n\n<i>“I guess,”</i> Ellie says with a shrug. <i>“Like I said, my grandparents left the homeworld. I’ve never seen it — and why would I want to? It sounds pretty awful, and I’ve got my own little paradise right here!”</i> Her cheerful demeanor returns as she returns to the present and her eyes alight upon your face. The heady scent of her pheromones is gone, but it’s plain to see her desires did not part with them.");
	else output("\n\n<i>“I guess,”</i> Ellie says with a shrug. <i>“Like I said, my grandparents left the homeworld. I’ve never seen it -- and why would I want to? It sounds pretty awful, and I’ve got my own little paradise right here!”</i> Her cheerful demeanor returns as she takes a look around the shop. Her eyes settle on a particularly broad-chested bull strutting in, and you’re immediately granted another whiff of the pheromone aura around her that just about makes your eyes water... and your flesh redden perceptibly. Maybe you could ask her about that heady scent sometime... that can’t be a racial trait, can it?");
	//[Unlock <i>“Pheromones”</i> Talk]
	if(flags["ELLIE_PHEROMONE_TALK_UNLOCKED"] == undefined) flags["ELLIE_PHEROMONE_TALK_UNLOCKED"] = 1;
	processTime(8);
	nephAffection(5);
	buildEllieTalkMenu();
	addDisabledButton(0,"Her Race","Her Race","You just finished talking about that.");
}

//Pheromones
public function talkToEllieAboutPheromones():void
{
	clearOutput();
	author("Savin");
	showBust("ELLIE");
	showName("\nELLIE");
	output("You find yourself unconsciously shifting a little closer to Ellie, breathing in deep through your nose to drink deep of that heady, potent admixture of pheromones that seem to be all but pouring off of her. You manage to ask her about them, though you’ve barely gotten a word out before you notice your mouth is watering... and that you have a serious hankering to eat a little ‘taur pussy.");
	output("\n\nEllie blushes at your question, her ashen skin taking on a darker hue beneath her black armor plates. <i>“Sorry about that, hun. We leithan girls have a pretty strong smell during mating season, they tell us. I just about drive the studs wild if they get downwind of me... they turn into big, randy piles of fuck ‘fore they knew what hit ‘em. Just the way I like it!”</i> she giggles, her thick tail curling up a bit, tenting the pink blanket covering her lower body and letting another wave of her strong sex-odor wash over you.");
	if(pc.hasCock()) 
	{
		output(" Your cock feels like it’s about to bust a nut");
		if(pc.isCrotchGarbed()) output(" right in your [pc.lowerGarment]");
		output(".");
	}
	else if(pc.hasVagina()) output(" Heat washes over your [pc.cunt], and you shift uncomfortably as it begins to drool excitement, totally ready to spread open for the first cock to take it... or a big, thick, reptilian tail...");
	output(" It takes a force of will not to throw yourself into the leithan girl’s arms. Not that you think she’d mind.");

	pc.changeLust(33);

	output("\n\n<i>“I guess I’m a little bit worse than average, though,”</i> Ellie admits, watching your reaction with keen interest, her twin-pupiled eyes wandering across your flushed body. <i>“The Treatment does funny things to non-humans. It makes ausars into big, angry puppies; turns rahn libido up so high they just can’t pry themselves off of any cock they can find, like they’re </i>hungry<i> for it... and me? I guess it decided every day was breeding season, and I’m always putting out these sweet little pheromones... which really just means I get to </i>put out<i> more for the bulls that get a whiff of them!”</i>");

	output("\n\nShe grins, clearly proud of her talent for chemical seduction. <i>“Of course, none of the bulls can get me pregnant no matter how much my body’s begging for it. Leithans don’t breed right with anybody not from our planet: no matter how fertile you are, if you aren’t leithan, you just can’t knock us up. Or get knocked up by us. Good thing there were a whole bunch of us that came to New Texas way back, or we’d be in trouble!”</i>");

	output("\n\n<i>“So, you can’t breed with other races? Not even after getting Treated?”</i>");

	output("\n\n<i>“Nope,”</i> Ellie says, her grin fading somewhat. <i>“Believe me, </i>plenty<i> of bulls have tried. They always think they’re gonna be the one, but... no. It takes some serious science to get a half-leithan born, and a lot of credits.");
	if(pc.originalRace == "half-leithan") output(" You’d know, after all. Your mom and dad must have spent a fortune making sure you got here.");
	output(" Around here, though, not being able to breed is... well, it could be better. A lotta bulls get tired of trying after a while. After all, what’s the point of fucking a mare full of cum till she looks pregnant if it ain’t gonna do anything? Not that I don’t have a lot of fun in the trying, but I guess the boys are always gonna go back to the soft lil’ cows and fill ‘em with babies.”</i>");

	output("\n\nEllie shrugs. <i>“At least there’s a nice, steady stream of bulls still wanting to try - at least the once! Lucky me, my pheromones pretty much guarantee I’ll always have someone to play with.”</i> She grins, chewing on her lower lip and squeezing her shoulder together to emphasize her impressive rack, all but jiggling it in your face now. <i>“Speaking of which... what do you say, [pc.name]?");
	if(pc.hasCock()) output(" <i>“Care to test your lil’ swimmer’s luck?”</i>");
	else output(" <i>“I’m feeling all down now. You wanna step out back and help a girl get her spirits up?”</i>");
	flags["ELLIE_PREG_TALK_UNLOCKED"] = 1;
	nephAffection(5);
	clearMenu();
	if(pc.lust() >= pc.lustMax())
	{
		addButton(0,"Yes",ellieSexScene,undefined,"Yes","You’re too horny to turn an offer like this down!");
		addDisabledButton(1,"No","No","You’re too horny to turn this down!");
	}
	else
	{
		if(pc.lust() >= 33) addButton(0,"Yes",ellieSexScene,undefined,"Yes","Take the taur-girl for a roll in the proverbial hay.");
		else addDisabledButton(0,"Yes","Yes","Somehow, despite the pervasive musk, you aren’t aroused enough for sex.");
		addButton(1,"No",ellieMenu,undefined,"Turn her down for now.");
	}
}

//The Treatment
public function talkToEllieAboutTreatment():void
{
	clearOutput();
	author("Savin");
	showBust("ELLIE");
	showName("\nELLIE");
	output("Casting a glance over Ellie’s shoulder to the racks of white medi-pens, you ask her to tell you a little more about the Treatment.");
	output("\n\nEllie gets a great big grin when you ask, her chest swelling a little larger as she assumes her best salesman’s pose - or maybe she’s trying to entice you into motorboating her, your pheromone-laced libido can’t really be sure.");
	output("\n\n<i>“The Treatment’s a New Texas tradition - everyone on the planet gets it, and a whole bunch of visitors even take it after they see how much fun we have here. The Treatment makes sure everyone on the planet is happy, content, fertile, and fuckable. When you’re treated, you’re never shy or lonely: everyone here’s outgoing, friendly, and there’s not a girl on the planet won’t spread her legs if you ask nice. It’s made our beautiful little planet here a veria- varit- uh, basically a paradise!”</i>");
	output("\n\nEllie beams proudly at the statement. Still, you can’t help but ask for a more... in-depth answer.");
	//if PC is treated
	if(pc.isTreated()) 
	{
		output("\n\n<i>“I think you already know what it does, silly!”</i> she says, crossing her arms under her milky bosom. <i>“Still, I guess it doesn’t hurt to give you a reminder. Just stop me if you get bored");
		if(pc.hasCock()) output(" and wanna ram that [pc.cock] of yours into me instead");
		output("!”</i>");
	}
	output("\n\n<i>“The Treatment’s a little one-use medi-pen full of a lifetime of bliss. It’s a potent cocktail chock full of hormones, nanomachines, and other secret goodies that rewrite your brain and body to be a happy, sexy little cow-girl or bull-boy - or as close as you can get, depending on species,”</i> she chuckles, reaching back to pat her reptilian flank.");

	output("\n\nLooking you up and down, Ellie adds <i>“The Treatment’s effects are hard to predict - some people say they’re random altogether - but the biggest differences are along gender and sex lines, not racial.");
	//if PC is male:
	if(pc.hasCock() && !pc.hasVagina())
	{
		output(" Since you’re a ");
		if(pc.tallness >= 70) output("big, strong ");
		else if(pc.tallness < 60) output("cute little ");
		output(pc.mf("boy","breeder") + ", the Treatment would probably make you bigger, stronger, and tougher. Most bulls grow horns - that’s why we call ‘em bulls! - and their muscles get so big, some can even lift </i>me<i> up: and I weigh just about a ton! Mmm, there’s nothing I like better than a big, strong boy with a huge, meaty cock to treat me right. And that goes for just about every girl on the planet. Take the Treatment, and they’ll all be spreading their legs to get a taste of you, cutie! Speaking of which, most boys find that their dicks mutate because of the Treatment: it’s gonna get bigger, thicker, and usually take on some kind of animal shape. Dog, bovine, and equine cocks are the most common, though just about anything’s possible, I guess. You might even get a big, thick leithan cock - oh, that’d be a sight to see!”</i>");
	}
	else if(pc.hasVagina() && !pc.hasCock())
	{
		output(" Since you’re ");
		if(pc.mf("","chick") == "chick")
		{
			output("a ");
			if(pc.tallness < 60) output("cute little girl");
			else output("smoking hot babe");
		}
		else output("packing a vagina down there under all the unlady-like bits");
		output(", the Treatment’s going to focus on mental changes for you. Between you and me, we girls get the better deal: the boys might get big and strong, but </i>we<i> get the good stuff. A Treated girl’s tits swell up, getting nice and big and jiggly, and usually you start lactating right then and there! If you don’t, don’t fret: I’ve got just the thing for you here in the shop. And nothing in the ‘verse feels better than a good, hard milking once you’re Treated: it’s as good as sex! Well, almost. But that’s the really great thing about being a Treated girl: everything feels so much better. It’s all you’ll ever want to think about once you try it... trust me, you’ll be begging every big, swinging dick that passes by to fuck you once you realize just how </i>amazing<i> sex feels. And sex while you’re getting milked? Oh, if I didn’t have to work, I’d just spend the rest of my life hooked up in the milk barn with my legs spread for any passing bull. No doubt!”</i>");
		output("\n\nEllie hugs her arms around herself and shivers just thinking about it. <i>“Some folks like to think we Treated girls get dumber, but they’re full of shit. There’s concrete proof that we’re just as smart as before we get Treated... we just don’t wanna think about silly things like tests when there’s a whole galaxy of dicks out there! Sure, we get a little cow-like: docile, sexy, sometimes grow horns or get fur on our legs. Tails? Definitely! Dumber? No way!”</i>");
	}
	//if PC is intersex, a hermaphrodite, or genderless:
	else
	{
		output(" Hard to say what the Treatment would do to you, hun. Anyone who’s not bi- bina... uh, who isn’t just a straight up girl or boy tends to get kind of zany effects from the Treatment. You might get the boy-effects, or the girl effects, or some of both, or something totally different. Can’t tell until you try it. But I know one thing for sure, no matter what you do: once you’re Treated, sex feels AMAZING. Like, ten times as good, easy. Just a little touch or a rub on your tender bits can make you nearly cum, and a good hard fucking... oh, you’ll never want to think about anything else again!");
		if(pc.longestCockLength() > 12) output(" And your dick’s going to get HUGE. Like, waaaay bigger than before.”</i> Her eyes flutter. <i>“Nothing better than a huge, Treated dick pounding my pussy... promise me you’ll let me be your first test run when you get treated, okay? I love being first in line to sample all the brand new, massive beast-cocks. Perks of being the shop-keep!");
		output("”</i>");
	}
	if(flags["ELLIE_OPERATION"] == 4) output("\n\nAfter a moment, Ellie adds, <i>“I guess I ought to mention that the Treatment’s permanent. Like, totally permanent. I think the Treatment’s the second best thing that ever happened to me - the first being you, of course! But, y’know, you better be absolutely sure about it before you take it. I don’t want my lover having regrets.");
	else output("\n\nAfter a moment, Ellie adds, <i>“I guess I ought to mention that the Treatment’s permanent. Like, totally permanent. I think the Treatment’s the best thing that ever happened to me - and so does just about everyone who takes it. But, you know, you better be absolutely sure about it before you take it.");
	if(silly) output(" Or you could save scum I guess. Whatever!");
	output("”</i>");
	pc.changeLust(3);
	processTime(11);
	nephAffection(5);
	buildEllieTalkMenu();
	addDisabledButton(2,"Treatment","The Treatment","You just finished talking about that.");
}

//New Texas
public function talkToEllieAboutNewTexas():void
{
	clearOutput();
	author("Savin");
	showBust("ELLIE");
	showName("\nELLIE");
	if(flags["ELLIE_OPERATION"] == 4)
	{
		output("You ask Ellie how she’s doing on New Texas now that she’s back again.");
		output("\n\n<i>“It’s still the paradise I know and love!”</i> she says with a grin, giving you a playful wink. Her whole body shifts as she chuckles, her breasts bouncing gaily under their inadequate restraints. <i>“It really is, though. Back on Centauri II, there was a whole religion that said that somewhere out there was a world of green fields and plentiful water - and milk. Turns out they were actually right, and here we are!”</i>");
	}
	else
	{
		output("You ask Ellie to tell you a little bit about New Texas.");
		output("\n\n<i>“Other than that it’s a paradise?”</i> she teases, giving you a playful wink. Her whole body shifts as she chuckles, her breasts bouncing gaily under their inadequate restraints. <i>“It really is, though. Back on Centauri II, there was a whole religion that said that somewhere out there was a world of green fields and plentiful water - and milk. Turns out they were actually right, and here we are!”</i>");
	}
	output("\n\nShe smiles dreamily, leaning down over the counter. <i>“New Texas is... I couldn’t imagine living anywhere else. It’s as peaceful as you want it to be, and the planet’s clean and full of trees and crops and life! Not like the real core worlds, just big cities that stretch over whole worlds until you can’t breathe for all the people and smog. Speaking of people: we have the friendliest, most beautiful people in the whole galaxy: where else are you gonna find a whole planet where every girl’s got a huge rack swollen with milk, big child-bearing hips, and a smile that makes you wanna just pick her up and kiss her?”</i> Ellie turns her own smile to you, and you can’t deny the urge is there... until you realize you’re stewing in a much thicker cloud of pheromones than was there before. She blushes, and continues. <i>“And the men? Every one of them is big and strong as an ox - or a bull, as the case may be. They might be gruff sometimes, but there’s barely a bull on the world that won’t drop trou and give you a good long fucking if you ask for it! Isn’t that right, boys?”</i>");
	output("\n\nSeveral bulls in the shop murmur their agreement. Most are already sporting bulges in their work clothes.");
	output("\n\nShe gives them a winning smile and a wiggle of her hips, full of promise. <i>“See? Friendliest planet in the whole galaxy! Especially if you’re Treated: there’s a reason most New Texans never want to leave, after all: why would they, when there’s everything we need right here? Good, honest work for all who need it, and good, hard fuckings when you’re done. That’s the New Texan way!”</i>");
	output("\n\nYou tell Ellie that’s all very tempting. But maybe she could tell you a little about the planet itself. Who runs the place, and where does it sit in the galactic scene.");
	output("\n\n<i>“Not quite ready to buy your cabin yet?”</i> she tsks her tongue at you, clearly teasing. <i>“Well, how’s this for convincing: NT’s run by the biggest bull you’ve ever seen, Benjamin Tiberius Tee. Or Big T. to most of us. He’s the nicest governor a planet could have: there hasn’t been a tax hike, a riot, or a shortage of... anything... while he’s been in office. Our little planet might be a natural paradise, but Big T. turned it into a utopia. There’s a good reason so many people move to New Texas... other than us cute lil’ Treated girls, anyway!”</i>");
	output("\n\nEllie wiggles happily, her tail threatening to knock racks of medi-pens down behind her. <i>“Oh, and you asked about how we fit in the galaxy... aside from the prettiest girls and burliest boys, you mean? Well, we’re one of the galaxy’s biggest suppliers of milk: both from our local girls and the REAL cows. The four-legged kind.”</i> Ellie looks back, pretending to count her own legs before nodding and turning back to you with a grin. <i>“Cow-girl milk is a delicacy on a lot of planets nowadays, you know. The Treatment gives human milk that rich, full, creamy taste that actual cows have.”</i>");
	output("\n\n<i>“Leithan milk, on the other hand...”</i> Ellie says, cupping her huge tits. The sheer volume of the oversized orbs leaves them spilling out around her fingers, completely hiding her hands under her bust. With the added bit of pressure on her teats, your eyes are treated to the sight of a little trickle of milk escaping her saucer-like nipples, staining through her sheer bra. <i>“...is very, very sweet. Almost like candy, especially now that I’m Treated. Or maybe that’s </i>because<i> I’m Treated? Never had leithan milk outside of New Texas. Either way, you should definitely try some! It might be sweet, but my milk packs a punch: to most non-leithan creatures, it has a mildly alcoholic effect, and it’s <i>loaded</i> with my special Treated blend of hormones, guaranteed to make you so horny you can’t think straight. It’s perfectly healthy for LEITHAN kids... but if someone else drinks it, well... enjoy your day-long " + pc.mf("","girl-") + "boner! That is, unless you want me to take care of it for you afterwards? Nothing puts me in the mood to give a nice, gentle ");
	if(pc.hasCock()) output("hand-job");
	else if(pc.hasVagina()) output("pussy-fingering");
	else output("ass-teasing");
	output(" like a " + pc.mf("handsome stud","cute girl") + " suckling on one of my tits!”</i>");
	if(flags["ELLIE_OPERATION"] == 4) output("\n\nYour mouth waters after her sexy speech. And you can’t help but notice you have an incredible urge for ");
	else output("\n\nAnd you thought you were swimming in leithan-musk before... your mouth is absolutely <i>watering</i> now. And you have an incredible urge for ");
	//if Treated or Bimbo’d:
	if(pc.isTreated() || pc.isBimbo()) output("a mouthful of tit to suckle from");
	else output("a tall glass of milk");
	output(".");
	processTime(11);
	pc.changeLust(3);
	nephAffection(5);
	//Suckle or back option?
	clearMenu();
	addButton(0,"Suckle Her",suckleDatCowtaurTeat,undefined,"Suckle Her","She’s offering - you might as well make use of it.");
	addButton(14,"Back",ellieMenu);
}

//Ellie’s Menu: Suckle
public function suckleDatCowtaurTeat():void
{
	clearOutput();
	author("Savin");
	showBust("ELLIE_NUDE");
	showName("\nELLIE");
	//Insta-maxes Lust. Raises Minimum Lust to 33 for 24 hours.
	if(pc.hasStatusEffect("Ellie's Milk")) pc.setStatusMinutes("Ellie's Milk",1440);
	else pc.createStatusEffect("Ellie's Milk",0,0,0,0, false, "LustUp", "Ellie’s milk is keeping your body more aroused than normal. You’ll have to wait for it to wear off before your body goes back to normal.", false, 1440);
	output("You ask Ellie if she wouldn’t mind sharing some of her milk with you. By the looks of things, she’s got plenty to spare.");
	output("\n\n<i>“I certainly do!”</i> Ellie says proudly, cupping one of her hefty tits. ");
	if(flags["SUCKED_ELLIES_TITS"] == undefined) 
	{
		output("<i>“I gotta warn you, though, leithan milk might be super-duper sweet, but it’s also a little alcoholic. Or has that effect on most people, anyway. More importantly, though, it’s laced with my own special blend of hormones that’ll make you so horny you can’t think straight!”</i>");
		output("\n\nYou nod your understanding. ");
		flags["SUCKED_ELLIES_TITS"] = 1;
	}
	if(pc.isTaur()) output("<i>“Just take a seat, hun, and lean over the counter here...”</i> Ellie says, gently guiding your shoulders until you’re nearly touching her over the thin counter - or more accurately, your face is nearly buried in her milky cleavage.");
	else output("<i>“Let’s just get you to take a seat. Trust me, you want to be sitting down for this!”</i> she adds, pulling you up onto the counter, facing her - or more accurately, her ample rack.");
	output(" <i>“Perfect!”</i>");

	output("\n\nYou can’t help but notice the rather... public setting as Ellie steps back and admires you. Several bulls loom in a bit closer as the busty centaurin pulls a little strap in her sheer, latexy bra-front. The cups peel away, letting a little trickle of excess milk drool down onto the floor and into a drain behind the counter. Ellie blushes as her lactic bounty dribbles down her front, but quickly turns back to you and chews her lip, her forelegs carrying her a step closer until one of her saucer-sized teats is brushing against your cheek. Your eyes catch sight of more than a few boners popping in the little crowd in the store behind you as Ellie’s bosom is bared for you.");
	output("\n\n<i>“Open wide,”</i> Ellie coos, her milk-laden breast gently rubbing on your cheek. Her motion seems to awaken some primal, ancient instinct within you, and you soon find your arms reaching up to caress the bountiful breast in front of you, fingers latching onto the gray skin and holding her steady as you do as she commands, opening your mouth wide around her big, stiff teat. She leans in ever so slightly, pushing her breast against your face, the very peak of her nipple angled between your [pc.lips]. You latch on, and are immediately rewarded by a little shiver of pleasure from Ellie.");
	output("\n\n<i>“Mmmm, I never get tired of this feeling,”</i> the leithan girl shivers, a hand gently brushing across your [pc.hair] and locking behind your head, cradling you against her. Your [pc.tongue] caresses the wide, flat disk of Ellie’s nipple, circling the pebbly ridge of its perimeter before gliding in towards the pert ridge at the center. You’ve barely teased your way there when you’re rewarded with the first droplets of sweet, sweet cream. Just a dollop at first, a tiny bead of moisture that you barely recognize until the tip of your tongue grazes over it, and your senses light ablaze!");
	output("\n\nEllie wasn’t kidding when she said her milk was sweet! It’s like candy on your tongue, a saccharine rivulet that runs eagerly across your [pc.tongue] and down your throat. Ellie lets out a little moan as it leaves her, biting into her lip to contain her sounds of pleasure. But she can’t contain the sudden burst of pheromones wafting off her body, a cloud of fuck and rut that assails your already dazzled senses, sending your body in an almost painful arousal -- and this all before the milk’s lusty content can touch you. You awkwardly shift your [pc.legOrLegs], trying to take a little pressure off your ");
	if(!pc.hasCock()) output("boiling loins");
	else 
	{
		output("hardening cock");
		if(pc.cockTotal() > 1) output("s");
	}
	output(".");
	output("\n\nThe leithan grins as you squirm, though you can’t help but notice her own skin flushing in turn. <i>“Do you like it?”</i> she asks, almost shyly. You answer comes in the form of a nod and an unintelligible grunt as another trickle of alien lactation trickles into your mouth, so sweet you nearly wince when it teases across the tip of your tongue. Instead, though, you find yourself digging your fingers into the great swells of Ellie’s breast and starting to suck, just a gentle pressure at first, but enough to draw forth a steady stream from your tauric lover’s teat. She moans in response, breath catching in her throat as you start to really milk her. Her hands press your head deeper into her bosom, holding you close as you drink deep from her. Ellie’s bounty seems nigh-endless, too: you gulp and gulp down mouthfuls of her sugary milk, and yet there’s always more where that came from! Her flow of sweet nectar only seems to increase as you suckle, until you feel like you’re trying to drink down a river! You can almost feel her breast shrinking as its heavy burden is drained away, going from milk-swollen and taut to simply huge and jiggly. Ellie’s little moans of pleasure carry a touch of relief in them as you eagerly drain her bosom dry.");
	output("\n\nYou only later notice that you’re moaning, too: needy, desperate little moans as her milk begins to affect you. Even before you started drinking, Ellie’s pheromones had made you blatantly aroused, barely able to hide your chemical excitement around the musky centaurin. Now, your desperate need is almost painful, your lusts boiling until you can’t think of anything but your raging excitement and how beautiful, soft, and warm the teat in your face is. You concentrate on that, trying to stay grounded from your lust. All of your attention focuses on Ellie’s breast, your fingers starting to knead and squeeze it, playing with the little patches of straining scales and plates that would all but cover a normally-endowed leithan’s rack. On Ellie, her plates look like tiny freckles of black compared to the immensity of her bosom, doing absolutely nothing to hide or support it. Your body, at least, is doing the latter: you completely lose yourself in the leithan’s cleavage, with no small help from her hand’s guidance, nuzzling against the hot, sheer curve of one tit as you suckle from the other.");
	output("\n\n<i>“You’re starting to feel it, huh?”</i> Ellie teases, her free hand gently playing across your ever-more relaxed body. Every brush of her fingers feels like a starburst on your tender flesh - God you’re sensitive now! When her hand moves down your thigh, you nearly feel yourself cumming on the spot - just from the briefest touch. Oh, fuck. <i>“Like I said, my milk will just drive you wild.... Don’t worry about a thing, sweetie, just let me take care of you. I’ll be gentle.”</i>");
	output("\n\nAs she speaks, her hand slips further up your thigh, fingertips brushing across your [pc.crotch] and sending an electric fire of pleasure up your spine. You almost choke on your current mouthful of milk. Do you let Ellie have her way with you?");
	pc.exhibitionism(1);
	pc.changeLust(90+rand(20));
	processTime(8);
	pc.changeEnergy(200);
	pc.milkInMouth(chars["ELLIE"]);
	//yes/no
	clearMenu();
	if(pc.genitalLocation() >= 2 && pc.tallness >= ((2 * chars["ELLIE"].tallness) / 3))
	{
		if(pc.hasCock() && pc.cocks[0].cLength() >= (pc.tallness / 2)) addButton(0,"Yes-HJ",getAHandyFromEllie,undefined,"Yes-HJ","Get a handjob while you drink.");
		else if(pc.hasCock()) addDisabledButton(0,"Yes-HJ","Yes-HJ","Ellie can’t seem to reach your [pc.cock] in this position.");
		else addDisabledButton(0,"Yes-HJ","Yes-HJ","You need a penis to get a handjob.");
		addDisabledButton(1,"Yes-Finger","Yes-Finger","Ellie can’t seem to reach around you in this position.");
	}
	else
	{
		if(pc.hasCock()) addButton(0,"Yes-HJ",getAHandyFromEllie,undefined,"Yes-HJ","Get a handjob while you drink.");
		else addDisabledButton(0,"Yes-HJ","Yes-HJ","You need a penis to get a handjob.");
		addButton(1,"Yes-Finger",getFingerByEllieDuringMilkDrinking,undefined,"Yes-Finger","Get fingered while you drink.");
	}
	if(pc.isTaur()) addButton(2,"PublicUse",publicUseForBullsByCentaurians,undefined,"PublicUse","Put yourself up for public use while you’re drinking. You’re horny enough to fuck just about anyone anyway.");
	else addDisabledButton(2,"PublicUse","PublicUse","You need to be a taur to offer up your hindquarters for public use.");
	addButton(3,"No",turnDownDatLustReliefFroMElliebuns);
}

//No
//PC gets no Lust relief.
public function turnDownDatLustReliefFroMElliebuns():void
{
	clearOutput();
	author("Savin");
	showBust("ELLIE_NUDE");
	showName("\nELLIE");
	output("You wordlessly brush Ellie’s hand away from your [pc.crotch], though it’s an almost physical pain to do so. Your lusts are your own - for now.");
	output("\n\n<i>“Suit yourself,”</i> Ellie moans, her hand settling on your [pc.knee]. <i>“At least let me switch you to the other teat, huh? Ol’ lefty’s getting a little sore...”</i>");
	output("\n\nThat you can allow. You relax your grip on the leithan’s breast, and soon find your head being craned ever so slightly toward her other breast. A fresh, stiff nipple brushes against your [pc.face], and you open wide to receive it. Your tauric nurse can’t stifle a low, sexual moan as you start to suckle from her other teat, instantly rewarding you with a thick stream of her lactic bounty. <i>“Guess this one was getting a little pent up,”</i> Ellie admits, though she just about chokes on the last word as your tongue grazes the very point of her nipple, sending a shiver of pleasure down her spine. Her tail curls about one of her rear legs, and her fingers dig into you for support, trying to steady herself as you dig into her over-full right breast.");
	output("\n\n<i>“Easy, hun... keep that up and I’ll... I’ll... ahhhh!”</i> her voice trails off into a high cry of bliss as you set your [pc.tongue] to work on her big, sensitive nipple. One of your hands snakes back across the gulf of the centaurin’s bosom, back to the still-slick peak of her other tit, and begins to gently massage it. Ellie’s front claws flick across the floor, and the longest moan you’ve ever heard tears from her lips at your unexpected - but clearly appreciated - touch. The hand not supporting your head reaches up and locks over yours, her fingers interlacing with your own as you gently caress and squeeze Ellie’s boob.");
	output("\n\n<i>“You know just the right spots, don’t ya?”</i> Ellie pants, tossing her head back as both your hand and tongue flick at her leaking nipples. <i>“Ah! I bet you’re gonna be just the star of the milk barn, aren’t you... oh, just like that... juuuust like that...”</i>");
	output("\n\nYou don’t think Ellie’s got much stamina left... or much milk, for that matter. Your belly is bulging with the sheer weight of what you’ve consumed so far, and in turn, your tauric nurse’s breasts look considerably smaller. Drained. Behind you, several bulls (and even a couple of cows!) are furiously beating their meat to the show you two are putting on, as utterly shameless in public as Treated folk are. You barely resisted Ellie’s touch, thanks to the lacing of her potent, delicious, amazing... pheromones in the air. With a dozen bulls filling the little shop with the reek of cum and male desire, you’re not sure what your lust-addled mind might do... better finish your drink, and fast!");
	output("\n\nStill, it wouldn’t hurt to finish Ellie off while you’re at it, would it? She’s so close, you can practically smell it. You redouble your efforts toward your partner’s pleasure, squeezing, kneading, and caressing her tender teats until she’s crying out for more. She pulls you deeper into her ample cleavage, burying your head into the slick mounds of her gray titflesh until you can see nothing but the hazy outline of the shop’s lights and the all-encompassing darkness of her diamond-hard nipple in your face. She’s holding you just like a little baby");
	if(pc.isTaur()) output(", bestial body and all");
	output("!");
	output("\n\nEllie comes not long after that, your only hint at her climax a sudden rush of milk from both nipples and a burst of pheromones that makes your eyes water with overwhelming desire. God, why didn’t you let her ");
	if(pc.hasCock()) output("jerk your off");
	else output("finger you");
	output("!? You can barely think of anything but your crippling lust, now - that, and the beautiful pair of tits in your face. You continue to play with them even as the heady musk around you grows overpowering, your vision swimming until suddenly you feel like you’re flying... right onto the counter.");

	output("\n\nYou drunkenly look up at Ellie as she lays you down on your back, her own tauric body slumping down to the floor. Milk is drooling from both her tits, a tiny rivulet of creamy white that trickles down onto the floor. Slowly, she pulls up the cups of her bra, locking the much-reduced twin mounds away.");

	output("\n\n<i>“That was... well, you sure know how to treat a girl right, [pc.name],”</i> Ellie chuckles, rubbing at her chest through her bra. <i>“So much gentler than those rough ol’ milkers in the barn, too...”</i>");

	output("\n\nShe leans over and strokes your [pc.hair] affectionately. <i>“You rest now, hun. Sleep the worst of that lustiness off. I’ve got some bulls to take care of now, don’t I?”</i>");
	output("\n\nYou drift obediently off to sleep, though your dreams are punctuated by howls of pleasure and the wet sounds of sex...");
	processTime(55);
	pc.milkInMouth(chars["ELLIE"]);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Get Handy
//PC has a dick
//Multiple orgasms? Multiple orgasms!
public function getAHandyFromEllie():void
{
	clearOutput();
	author("Savin");
	showBust("ELLIE_NUDE");
	showName("\nELLIE");
	output("You answer Ellie with a little nod, " + (pc.legCount == 1 ? "shifting" : "spreading") + " your [pc.legOrLegs] a bit to give her access to your rock-hard [pc.cock]. <i>“Good " + pc.mf("boy","girl") + ",”</i> Ellie coos, starting to strip your [pc.gear] off. <i>“Nothing gets me in the mood to tug on a [pc.cock] like a gentle mouth on my tits, suckling like a babe... speaking of which, what do you say to switching tits, huh? Poor righty’s feeling awfully left out.”</i>");
	output("\n\nYou don’t have much say in the matter, as by the time she asks, Ellie’s half way to pulling you from her teat. You let go only with a little whine, milk dribbling from the corners of your [pc.lips]. Thankfully, your nurse quickly shifts you to her other, fuller breast, and you happily return to suckling. She moans, a low, sensual sound as you draw forth the first beads of milk from her right breast, which quickly turns into a stream that you’re all too happy to try and keep up with.");
	output("\n\n<i>“Good " + pc.mf("boy","girl") + ",”</i> Ellie coos again, finally setting the last of your bothersome gear aside. You shiver in anticipation as her cool, gray fingers wrap around your [pc.cock], easily encircling the turgid shaft of your needy cock. It’s a struggle not to cum the moment Ellie’s hand has you in its strong grip - a struggle she can’t fail to notice. <i>“Aww, don’t worry about holding back, sweetheart. I know what my milk does to you, so go ahead and smear my hand with cum. I won’t mind at all...”</i>");
	output("\n\nAs if to enforce her words, Ellie’s hand starts to stroke your [pc.cock]. Just little motions, moving her wrist alone, but that’s more than enough to push your lust-ridden body over the edge. You groan and moan into the muting weight of Ellie’s titflesh as you blow your load, a gush of [pc.cumNoun] erupting around her grip and across your belly. She moves faster as you cum, eagerly working with your body to milk out every last drop.");
	pc.orgasm();
	output("\n\n<i>“There we go,”</i> your lover coos, releasing your cock. You whine at the sudden loss of sensation, but your eyes nevertheless are drawn to her black-plated hand, now glossed with [pc.cumColor] as she draws it up to her mouth and gives it a long, hungry lick. <i>“Delicious!”</i>");
	//if PC is feminine:
	if(pc.mf("","chick") == "chick")
	{
		output("\n\n<i>“Want to share?”</i> Ellie adds with a lusty wink, offering her cum-slathered hand to you. Your mind refuses to think on the matter, and simply acts: your [pc.tongue] slips from Ellie’s teat to her plated hand and drags across it from palm to the tip of her thumb, savoring the taste of your own hot seed. Your mouth locks around Ellie’s thumb, sucking gently on it, cleaning up every last drop of spunk from it.");
		output("\n\n<i>“Good, isn’t it?”</i> she teases, slowly drawing her hand back to lap up the last few drops herself, clearly relishing your taste.");
	}
	output("\n\nEven as Ellie cleans her hand off, though, you’re left with a suddenly sinking sensation as you realize that your [pc.cock] isn’t getting any softer. Her twin-pupiled eyes wander back down to it as she licks the very last of your first load from her hand, and she gives you a knowing wink. <i>“I said a whole day, didn’t I? Don’t worry, hun, I’ll take such good care of you...”</i>");
	output("\n\nYou moan as Ellie’s freshly-cleaned hand slips back down and wraps around your [pc.cock] again, and that same almost-overwhelming pleasure rocks your body instantly. She starts to slowly, tenderly move her slick hand across your turgid length, languidly taking her time in getting you off a second time. Thanks to that, you manage to last a whole minute before busting your nut again, soaking Ellie’s hand in your orgasmic fluids a second time. She giggles and repeats the same tactic, happily lick up every drop");
	if(pc.mf("","chick") == "chick") output(" that she doesn’t share with you, at least. And you’re more than happy to take it");
	output(".");

	output("\n\nBehind you, several bulls (and even a couple of cows!) are furiously beating their meat to the show you two are putting on, as utterly shameless in public as Treated folk are. Thanks to Ellie’s tender touch and the lacing of her potent, delicious, amazing... pheromones in the air, and now with a dozen bulls filling the little shop with the reek of cum and male desire, your own horniness simply cannot abate. Your third orgasm passes with the same intensity of the first, and the sixth, when it comes. Your [pc.balls] seem");
	if(pc.balls <= 1) output("s");
	output(" to have an endless supply while you’re attached to Ellie, and your cock never falters from rock-hard attention. Your lover simply strokes you off again and again and again. Eventually she stops bothering to clean her hand off, instead using your copious seed as lube to continue jacking you.");

	output("\n\nYou barely notice when Ellie’s milk runs out, or when she removes her breasts from your face. You’re vaguely aware of an empty, cold sensation in the long moment when she moves you ninety degrees on the counter and tosses your [pc.legOrLegs] around her shoulders, but that’s all forgotten when her big, warm lips wrap around your cock and start to suck. Something about returning the favor... you’re not sure anymore. Your vision swims as you boil in a cocktail of lust, pheromones, and intoxication... and you love every minute of it. Addled as you are, you can’t help but drift off to sleep in Ellie’s affectionate grip, your heart racing to the beat of what feels like your millionth orgasm to splatter her cheeks and fill the back of her throat...");
	processTime(55);
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.milkInMouth(chars["ELLIE"]);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Get Fingered
//PC ain’t got a dick
public function getFingerByEllieDuringMilkDrinking():void
{
	clearOutput();
	author("Savin");
	showBust("ELLIE_NUDE");
	showName("\nELLIE");
	//Sav’s note: Ellie fingers while suckling. Option to let other bulls pound you while you drink? Delicious public use!
	output("You answer Ellie with a little nod, " + (pc.legCount == 1 ? "shifting" : "spreading") + " your [pc.legOrLegs] a bit to give her access to your [pc.crotch]. <i>“Good " + pc.mf("boy","girl") + ",”</i> Ellie coos, starting to strip your [pc.gear] off. <i>“Nothing makes me want to slip a few fingers into a tight little hole than a gentle mouth on my tits, suckling like a babe... speaking of which, what do you say to switching tits, huh? Poor righty’s feeling awfully left out.”</i>");
	output("\n\nYou don’t have much say in the matter, as by the time she asks, Ellie’s half way to pulling you from her teat. You let go only with a little whine, milk dribbling from the corners of your [pc.lips]. Thankfully, your nurse quickly shifts you to her other, fuller breast, and you happily return to suckling. She moans, a low, sensual sound as you draw forth the first beads of milk from her right breast, which quickly turns into a stream that you’re all too happy to try and keep up with.");
	output("\n\n<i>“Good " + pc.mf("boy","girl") + ",”</i> Ellie coos again, finally setting the last of your bothersome gear aside. You shiver in anticipation as her cool, gray fingers play up your thigh, taking their sweet time to finally graze the very edge of your [pc.vagOrAss]. The sudden stimulation is almost overwhelming, sending electric shocks of pleasure that cause your body to all but convulse in her grasp. You try desperately to hold on, but Ellie’s fingers are insistent, teasing at your desperately needy hole.");
	output("\n\n<i>“Aww, don’t worry about holding back, sweetheart,”</i> Ellie murmurs, moving her plated fingers with practiced precision, never penetrating, but always threatening. Teasing your most sensitive outer parts with gusto. <i>“I know what my milk does to you, so go ahead and let yourself go. I won’t mind at all.”</i>");
	output("\n\nThat’s an invitation that you - quite literally - can’t refuse. A moment later, and Ellie’s expert fingers bring you over the edge. You scream in pleasure as you cum, though the sound is muted to nothingness in a mouthful of milky titty. ");
	if(pc.hasVagina()) output("[pc.EachVagina] flushes with your climax, drooling its excitement across Ellie’s fingers as she slowly starts to move them toward your slit");
	else output("Your [pc.asshole] clenches hard as Ellie teases it to orgasm, muscles spasming in response to her tender touch. Slowly, her plated fingers move toward your squirming black hole, the very tips brushing across your rim.");
	output(" <i>“That’s it... good " + pc.mf("boy","girl") + ",”</i> Ellie coos, her own back arching as you draw a steady trickle of milk from her breast. <i>“Just relax and let me in...”</i>");

	output("\n\nYou do your best to comply, taking a deep breath to steady yourself in the face of Ellie’s large, black-armored digits encroaching on your [pc.vagOrAss]. She gives you a scant moment to relax yourself before starting to push in. Your body reacts on instinct, clenching and squeezing around her, but she’s insistent and oh so strong. She parts your ");
	if(!pc.hasVagina()) output("tight ring");
	else output("folds");
	output(" with relative ease, and slowly inches a pair of her thick digits into your hole. Your body’s reaction is as intense as the first orgasm: shockwaves of pleasure take hold of you, making you scream into Ellie’s boob as she fingers you. Orgasm follows hot on the heels of that cry of pleasure, your body so sensitive thanks to your nurse’s milk and her heady pheromone cloud that you couldn’t hold back if you wanted to.");

	output("\n\nIn the throes of your orgasm, Ellie’s fingers hilt inside of you, buried three knuckles deep. You’re given only a moment to recover before she starts to move them - not out, but apart. You groan as your lover spreads you apart, just wide enough for her to wedge a third finger into. Only when she’s got her third finger slipped inside you does she start to move in earnest, pumping out of your [pc.vagOrAss] and back into it again... and again... and again. She fucks you fast and hard, putting her whole powerful body behind every thrust until you’re cumming again, crying out with milk dribbling down your chin as you hang desperately onto Ellie’s humanoid half. She just coos at you, cradling your head further into her bosom, pushing even more of her huge, soft breast into your eager mouth. All you can do is accept it, swallowing down more and more milk and cumming again and again until your senses fade to nothing. If you needed to think, you’re not sure you could do it anymore... but why think, when you’re more than happy to be treated like a suckling babe, drinking deep of Ellie’s milk and letting her bring your to orgasm until sleep overtakes you.");

	output("\n\nIndeed, even as you cum for what seems like the dozenth time, you feel your eyelids growing heavy, your vision swimming as the intoxicating milk starts to take root in you. You give a sated sigh as another orgasm is wrung from you, and you swallow another mouthful of the leithan girl’s sweet, candy-like milk... and soon you’re drifting off, consciousness slipping from you.");

	processTime(45);
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.milkInMouth(chars["ELLIE"]);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Public Use 4 Bulls
//Only option for taurs that don’t have a big dick! Only available for taurs, too.
public function publicUseForBullsByCentaurians():void
{
	clearOutput();
	author("Savin");
	showBust("ELLIE_NUDE");
	showName("\nELLIE");
	clearMenu();
	
	if (flags["NT_BAD_END"] == 1 && pc.hasVagina())
	{
		author("Wsan");
		output("<i>“Ooh, again? Did you want me to get Big T down here?”</i>");
		addButton(0, "No", publicUseOopsNo, undefined, "No", "You’re not ready for that just yet.");
		addButton(1, "Yes", publicUseEnding, undefined, "Yes", "Become a permanent fixture of New Texas. Your adventuring days are over!");
	}
	else
	{
		output("You desperately want to get off, but the positioning just isn’t working in your favor. Ellie’s hands brush your thighs, caressing your bestial body, but there’s no way she can get a proper reach on your back-mounted genitalia. Frankly, you’re desperate enough now that it doesn’t much matter who sates your lusts.");
		output("\n\nEllie sees this, and coos appreciatively. <i>“Don’t you worry, sweet thing, I’m sure all these bulls wouldn’t mind giving you a little relief, would they?”</i>");
		output("\n\nYour attention is drawn behind you, where several bulls (and even a couple of cows!) are furiously beating their meat to the show you two are putting on, as utterly shameless in public as Treated folk are. You barely resisted Ellie’s touch, thanks to the lacing of her potent, delicious, amazing... pheromones in the air. With a dozen bulls filling the little shop with the reek of cum and male desire, you can’t help but give into your slutty nature. With a little whine, you shift your weight up onto the counter and spread your [pc.legOrLegs], giving your [pc.hips] a slutty, and very inviting little wiggle.");
		output("\n\n<i>“That’s a ‘come and get it,’ boys!”</i> Ellie grins, reaching over to pat the backside of your humanoid half.");
		output("\n\n<i>“Yes ma’am,”</i> one of the bigger bulls says, leading her herd toward your exposed backside. They make short work of your gear, tossing it aside to leave your bestial half nice and bare and totally ready for them.");
		if(pc.hasVagina()) output(" Your pussy is dripping with excitement, feminine need drooling to the floor as the bulls gather behind you.");
		if(pc.hasCock()) output(" Your [pc.cock] is so hard that it’s leaking, pre drooling onto the floor between your rear legs.");
		output(" The biggest bull butts a few of the others away and plants his hooves behind your ass. You hear a loud <i>ZIIIIIIP</i>, and then a sudden, hard heat on your [pc.butt]. You try to look over your shoulder and see what’s going on, but Ellie catches you, returns you to her teat.");

		output("\n\n<i>“It’s best you don’t watch, sugar. Just relax... and give the boys a sexy little moan when they pump you full of spunk, alright?”</i>");

		output("\n\nYou can’t help but whimper in anticipation as the alpha bull drags his meat across your bestial backside. Before he lines up with you properly, though, you’re suddenly met with a cold wetness on your [pc.vagOrAss], and a pair of fingers that thrust deep into you. You yelp as the bull lubes you up");
		if(!pc.hasVagina()) output(".");
		else output(", not that you really needed it - but a courtesy’s a courtesy, right?");
		output(" <i>“Alright, " + pc.mf("bro","babe") + ", here we go,”</i> the bull growls, and you feel the fingers withdraw, replaced with a massive pressure against your slick hole. The pressure gives way to bliss a bare second later as the bull-boy thrusts deep into your [pc.vagOrAss], pounding his way into your tauric body until ");
		if(pc.hasVagina() && pc.smallestVaginalCapacity() < 300) output("your muscles cry out for mercy, barely able to stretch wide enough around his massive equine dong!");
		else if(!pc.hasVagina() && pc.analCapacity() < 300) output("your muscles cry out for mercy, barely able to stretch wide enough around his massive equine dong!");
		else 
		{
			output("he’s buried to the hilt inside you, his balls nestling against ");
			if(pc.balls > 0) output("your own");
			else output("your crotch");
			output(". <i>“Nice and loose, just the way I like ‘em,”</i> he grunts, giving your flank an approving slap.");
			if(pc.horseScore() > 2) output(" You whinny in response, only partially muted by your mouthful of boob.");
		}
		if(pc.hasVagina()) pc.cuntChange(pc.smallestVaginaIndex(),300,true,true,false);
		else pc.buttChange(300,true,true,false);

		output("\n\nThe bull’s fingers dig into your flanks, gripping you tightly as he starts to buck his hips. He doesn’t go easy on you - not for a second - and thank God for that! With your brain so pumped full of leithan lust-milk and the bulls’ own heady musks, you’re in exactly no mood for gentleness. Your arms wrap around Ellie for support as the bull starts to pound you, putting enough power into every thrust that your whole body rocks forward every time he hilts you. Ellie giggles as your face mashes into her cleavage, and more of her milk surges out in response to every impact, even from the tit you’re not suckling from. Its bounty drools down the ‘taur’s chest, staining her gray skin white before dripping down into a little drain on the floor. More follows, especially when she guides your hand up to the saucer-sized teat, urging you to milk both her breasts at once.");

		output("\n\nThanks to your unnatural arousal, it doesn’t take long for the thrusting horsecock to make you cum. You last for barely a minute before the rising pleasure in your loins catches up to you, and you let out a shrill cry of ecstasy. Your [pc.vagOrAss] clamps down around him, muscles going wild as your orgasm hits. ");
		if(pc.hasVagina() && pc.isSquirter()) output("Your cunt squirts at the apex of a final thrust from the bull, spraying your feminine satisfaction across the bull-boy’s broad chest.");
		if(pc.hasCock()) 
		{
			output("[pc.EachCock] discharges a few moments later, driven over the edge by the intense pounding of your ");
			if(pc.hasVagina()) output("cunt");
			else output("prostate");
			output(". Your [pc.cock]’s nut busts across the front of the counter, smearing onto the hardwood in a musky pool.");
		}

		output("\n\nThe bull laughs and slaps your ass, fucking you harder until he cums, too, a flood of thick, hot spooge erupting from his horsecock and into ");
		if(pc.hasVagina()) output("your waiting womb");
		else output("the depths of your ass");
		output(", smearing your inner walls white with his seed. A few final thrusts help him work out the rest of his orgasm before the bull unceremoniously pulls out of you, leaving you with a pat on the flank and a ");
		if(pc.hasVagina()) output("cunt");
		else output("ass");
		output(" stretched wide and drooling his spunk back onto the floor. Which only serves as lube for the next bull to take you, thrusting into your still-tingling passage without a moment’s hesitation. You squeal as you’re penetrated again, but thanks to Ellie’s milk and your own rampant lusts, it’s a cry of pleasure, not pain or even the slightest discomfort. You eagerly thrust your [pc.hips] back against the bull’s tapered bovine cock, shuddering as you feel every inch of animalistic cockflesh slide into your well-fucked hole.");
		output("\n\n<i>“You take it like a champ, don’t you?”</i> Ellie teases, stroking your [pc.hair], her own voice tinged with little moans of pleasure. <i>“That’s the beauty of being a ‘taur though, isn’t it? We’re built to take big, thick bullcocks all day long, aren’t we, sweet thing?”</i>");
		output("\n\nYou don’t have the opportunity to answer Ellie through your face full of boob, but your body does the talking for you as you milk another thick, hot wad from a bull. When the third slides into your now sloppily lubed-up hole, your cum again, a wave of pleasure erupting from your bestial back-side and wracking the rest of our body. The lucky bull chuckles as your muscles writhe around his plunging cock, though that just means that it isn’t long before he’s cumming too, flooding your ");
		if(pc.hasVagina()) output("womb");
		else output("bowels");
		output(" with a third load of bullspunk. Another bull instantly takes his place when the third staggers back, letting loose a miniature flood of cum from your abused hole.");

		output("\n\nThe bulls keep coming. Some even go to get their friends once they’re done. You don’t mind, though: every other bull is another mind-melting orgasm for you, completely without effort on your part. All you can focus on is the immense, beautiful rack in your face, utterly transfixing you, demanding every iota of your withering attention. You’re starting to feel the effects of the quasi-alcohol in Ellie’s milk, too: your mind is turning in a haze, making it hard to think... or is that just the sea of bullspunk flooding your [pc.vagOrAss] and the seemingly endless orgasms the gang of males behind you wrings from your body? You’re not sure you care anymore, as long as they continue... don’t stop! Keep fucking you! Fill you with their seed until you can’t hold a single drop more!");
		output("\n\nAnother orgasm - yours and his - and a flood of warm, sweet milk into your mouth, and your ability to think completely erodes, leaving you doing nothing but moaning and crying out in pure, animalistic pleasure until consciousness slips from you, leaving your body utterly at the mercy of the eager bulls - all forty in line, or maybe more.");
		processTime(76);
		//Used for holding the current target pussy
		var x:int = 0;
		var y:int = 0;
		
		var pp:PregnancyPlaceholder = new PregnancyPlaceholder();
		// Some of the stuff I might do for Brynn will add a generic cow-dude pregnancy for NT
		// Uncomment this line when/if it gets in
		//pp.impregnationType = "NewTexasGenericPregnancy";
		
		if(pc.hasVagina())
		{
			for(y = 0; y < 46; y++)
			{
				//Smallest cunt always takes the load and gets a stretchin!
				x = pc.smallestVaginaIndex();
				pc.cuntChange(x, 100, false, true, false);

				pc.loadInCunt(pp,x);
				pc.orgasm();
			}
		}
		else
		{
			for(y = 0; y < 46; y++)
			{
				pc.buttChange(100,false);
				pc.loadInAss(pp);
				pc.orgasm();
			}
		}
		if (pc.isTreated())
		{
			publicUseCount(1);
		}
		
		//If the PC is a treated male, give him a prompt to go female.
		if (pc.isTreated() && (pc.mf("m", "f") == "m") && (publicUseCount() == 2 || publicUseCount() % 4 == 0))
		{
			author("Wsan");
			output("\n\nYou come back to your senses dazed but utterly satisfied, a moan escaping your [pc.lips] when you feel the wet warmth radiating from your hindquarters. Ellie’s still holding you tightly, having supported you throughout your cumdump act and no doubt getting some action herself during. You nuzzle her massive rack, eliciting a girly moan.");
			output("\n\n<i>“Y’know, [pc.name]... you ever thought about doing this more often? ‘Cuz you’re pretty hot as a bull, but I think you might enjoy it more if you went cowgirl. More holes to be fucked that way.”</i>");
			output("\n\nShe giggles at her infallible logic. Looks like the Treated girls <i>can</i> still do math.");
			
			processTime(1);
		}
		//If the PC is a treated female that has been fucked by Big T, give her a prompt for a bad end every 4 rides.
		if (pc.isTreated() && (pc.mf("m", "f") == "f") && (publicUseCount() > 3) && (publicUseCount() % 4 == 0) && (flags["FUCKED_BY_BIGT"] != undefined)) //Need to add Big T flag.
		{
			author("Wsan");
			output("\n\nYou come back to your senses dazed but utterly satisfied, a moan escaping your [pc.lips] when you feel the wet warmth radiating from your hindquarters. Ellie’s still holding you tightly, having supported you throughout your cumdump act and no doubt getting some action herself during. You nuzzle her massive rack, eliciting a girly giggle.");
			output("\n\n<i>“Y’know, [pc.name]... you ever thought about doing this more often? You always look so insat-.. unsat.. happy when the boys are running a train on you! Big T told me to tell you, uh...”</i> She strains, trying to remember what it was she had to tell you.");
			output("\n\n<i>“Oh yeah! He said that you could get your own stall next to the shop after he checks out the situation down here. Something about you becoming a permanent resident of New Texas.”</i> She leans down and whispers faux-conspiratorially. <i>“I think he just wants to fuck you again.”</i>");
			
			processTime(1);
			
			addButton(0, "Nah", ellieTaurBadEndNo, undefined, "Nah", "You don’t wanna stay on New Texas.");
			addButton(1, "Sure", ellieTaurBadEndYes, undefined, "Sure", "You’d looove to become an NT citizen. So much fucking!");
			return;
		}
		
		pc.exhibitionism(2);
		addButton(0,"Next",mainGameMenu);
	}
}
	


//Bad end additions
public function ellieTaurBadEndNo():void
{
	clearOutput();
	author("Wsan");
	showBust("ELLIE_NUDE");
	showName("\nELLIE");
	
	output("You tell her you love NT and its bulls, but you’re not ready to settle down yet. There’s like, a whole galaxy to fuck out there and you’ve gotta get the probe things too.");
	output("\n\n<i>“Suit yourself.”</i> She shrugs, before lightly squishing her breasts together with you still between them.");
	output("\n\n<i>“You won’t forget about me out there, right [pc.name]?”</i>");
	output("\n\nLike you could. You tell her as much as you rouse yourself from your fuck-stupor, setting her smiling before you go.");
	
	processTime(1);
	pc.exhibitionism(2);
	
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function ellieTaurBadEndYes():void
{
	clearOutput();
	author("Wsan");
	showBust("ELLIE_NUDE");
	showName("\nELLIE");
	
	output("You try to give it some measure of thought, but all that really comes to mind is veiny, throbbing bullcocks ready to fuck you full of cum whenever you want – which is, like, all the time. You purse your lips together and nod, knowing Ellie will understand perfectly why you’d want to be fucked all day by New Texan boys. She grins knowingly and raises you up, rousing you from your fuck-stupor.");
	output("\n\n<i>“This is gonna be so much fun! I’ll ask T to be here next time, you just come back whenever you wanna get fucked by everyone within earshot.”</i>");
	output("\n\nGiven a wink and a slap to your [pc.butt], you happily trot back around the counter still dripping. If Big T wants to come fuck you again, he’s more than welcome to it. The more the merrier! Just the idea of being taken again and again, bringing happiness to the studs around you is making you hornier.");
	
	processTime(1);
	pc.exhibitionism(2);
	
	flags["NT_BAD_END"] = 1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Have to duplicate the entire scene because buttons are dumb. Used to escape the if statement for a 'No' and resets bad ending flag.

public function publicUseOopsNo():void
{
	clearOutput();
	author("Wsan");
	showBust("ELLIE_NUDE");
	showName("\nELLIE");
	clearMenu();
		
	flags["NT_BAD_END"] = 0;
	
	output("You desperately want to get off, but the positioning just isn’t working in your favor. Ellie’s hands brush your thighs, caressing your bestial body, but there’s no way she can get a proper reach on your back-mounted genitalia. Frankly, you’re desperate enough now that it doesn’t much matter who sates your lusts.");
	output("\n\nEllie sees this, and coos appreciatively. <i>“Don’t you worry, sweet thing, I’m sure all these bulls wouldn’t mind giving you a little relief, would they?”</i>");
	output("\n\nYour attention is drawn behind you, where several bulls (and even a couple of cows!) are furiously beating their meat to the show you two are putting on, as utterly shameless in public as Treated folk are. You barely resisted Ellie’s touch, thanks to the lacing of her potent, delicious, amazing... pheromones in the air. With a dozen bulls filling the little shop with the reek of cum and male desire, you can’t help but give into your slutty nature. With a little whine, you shift your weight up onto the counter and spread your [pc.legOrLegs], giving your [pc.hips] a slutty, and very inviting little wiggle.");
	output("\n\n<i>“That’s a ‘come and get it,’ boys!”</i> Ellie grins, reaching over to pat the backside of your humanoid half.");
	output("\n\n<i>“Yes ma’am,”</i> one of the bigger bulls says, leading her herd toward your exposed backside. They make short work of your gear, tossing it aside to leave your bestial half nice and bare and totally ready for them.");
	if(pc.hasVagina()) output(" Your pussy is dripping with excitement, feminine need drooling to the floor as the bulls gather behind you.");
	if(pc.hasCock()) output(" Your [pc.cock] is so hard that it’s leaking, pre drooling onto the floor between your rear legs.");
	output(" The biggest bull butts a few of the others away and plants his hooves behind your ass. You hear a loud <i>ZIIIIIIP</i>, and then a sudden, hard heat on your [pc.butt]. You try to look over your shoulder and see what’s going on, but Ellie catches you, returns you to her teat.");

	output("\n\n<i>“It’s best you don’t watch, sugar. Just relax... and give the boys a sexy little moan when they pump you full of spunk, alright?”</i>");

	output("\n\nYou can’t help but whimper in anticipation as the alpha bull drags his meat across your bestial backside. Before he lines up with you properly, though, you’re suddenly met with a cold wetness on your [pc.vagOrAss], and a pair of fingers that thrust deep into you. You yelp as the bull lubes you up");
	if(!pc.hasVagina()) output(".");
	else output(", not that you really needed it - but a courtesy’s a courtesy, right?");
	output(" <i>“Alright, " + pc.mf("bro","babe") + ", here we go,”</i> the bull growls, and you feel the fingers withdraw, replaced with a massive pressure against your slick hole. The pressure gives way to bliss a bare second later as the bull-boy thrusts deep into your [pc.vagOrAss], pounding his way into your tauric body until ");
	if(pc.hasVagina() && pc.smallestVaginalCapacity() < 300) output("your muscles cry out for mercy, barely able to stretch wide enough around his massive equine dong!");
	else if(!pc.hasVagina() && pc.analCapacity() < 300) output("your muscles cry out for mercy, barely able to stretch wide enough around his massive equine dong!");
	else 
	{
		output("he’s buried to the hilt inside you, his balls nestling against ");
		if(pc.balls > 0) output("your own");
		else output("your crotch");
		output(". <i>“Nice and loose, just the way I like ‘em,”</i> he grunts, giving your flank an approving slap.");
		if(pc.horseScore() > 2) output(" You whinny in response, only partially muted by your mouthful of boob.");
	}
	if(pc.hasVagina()) pc.cuntChange(pc.smallestVaginaIndex(),300,true,true,false);
	else pc.buttChange(300,true,true,false);

	output("\n\nThe bull’s fingers dig into your flanks, gripping you tightly as he starts to buck his hips. He doesn’t go easy on you - not for a second - and thank God for that! With your brain so pumped full of leithan lust-milk and the bulls’ own heady musks, you’re in exactly no mood for gentleness. Your arms wrap around Ellie for support as the bull starts to pound you, putting enough power into every thrust that your whole body rocks forward every time he hilts you. Ellie giggles as your face mashes into her cleavage, and more of her milk surges out in response to every impact, even from the tit you’re not suckling from. Its bounty drools down the ‘taur’s chest, staining her gray skin white before dripping down into a little drain on the floor. More follows, especially when she guides your hand up to the saucer-sized teat, urging you to milk both her breasts at once.");

	output("\n\nThanks to your unnatural arousal, it doesn’t take long for the thrusting horsecock to make you cum. You last for barely a minute before the rising pleasure in your loins catches up to you, and you let out a shrill cry of ecstasy. Your [pc.vagOrAss] clamps down around him, muscles going wild as your orgasm hits. ");
	if(pc.hasVagina() && pc.isSquirter()) output("Your cunt squirts at the apex of a final thrust from the bull, spraying your feminine satisfaction across the bull-boy’s broad chest.");
	if(pc.hasCock()) 
	{
		output("[pc.EachCock] discharges a few moments later, driven over the edge by the intense pounding of your ");
		if(pc.hasVagina()) output("cunt");
		else output("prostate");
		output(". Your [pc.cock]’s nut busts across the front of the counter, smearing onto the hardwood in a musky pool.");
	}

	output("\n\nThe bull laughs and slaps your ass, fucking you harder until he cums, too, a flood of thick, hot spooge erupting from his horsecock and into ");
	if(pc.hasVagina()) output("your waiting womb");
	else output("the depths of your ass");
	output(", smearing your inner walls white with his seed. A few final thrusts help him work out the rest of his orgasm before the bull unceremoniously pulls out of you, leaving you with a pat on the flank and a ");
	if(pc.hasVagina()) output("cunt");
	else output("ass");
	output(" stretched wide and drooling his spunk back onto the floor. Which only serves as lube for the next bull to take you, thrusting into your still-tingling passage without a moment’s hesitation. You squeal as you’re penetrated again, but thanks to Ellie’s milk and your own rampant lusts, it’s a cry of pleasure, not pain or even the slightest discomfort. You eagerly thrust your [pc.hips] back against the bull’s tapered bovine cock, shuddering as you feel every inch of animalistic cockflesh slide into your well-fucked hole.");
	output("\n\n<i>“You take it like a champ, don’t you?”</i> Ellie teases, stroking your [pc.hair], her own voice tinged with little moans of pleasure. <i>“That’s the beauty of being a ‘taur though, isn’t it? We’re built to take big, thick bullcocks all day long, aren’t we, sweet thing?”</i>");
	output("\n\nYou don’t have the opportunity to answer Ellie through your face full of boob, but your body does the talking for you as you milk another thick, hot wad from a bull. When the third slides into your now sloppily lubed-up hole, your cum again, a wave of pleasure erupting from your bestial back-side and wracking the rest of our body. The lucky bull chuckles as your muscles writhe around his plunging cock, though that just means that it isn’t long before he’s cumming too, flooding your ");
	if(pc.hasVagina()) output("womb");
	else output("bowels");
	output(" with a third load of bullspunk. Another bull instantly takes his place when the third staggers back, letting loose a miniature flood of cum from your abused hole.");

	output("\n\nThe bulls keep coming. Some even go to get their friends once they’re done. You don’t mind, though: every other bull is another mind-melting orgasm for you, completely without effort on your part. All you can focus on is the immense, beautiful rack in your face, utterly transfixing you, demanding every iota of your withering attention. You’re starting to feel the effects of the quasi-alcohol in Ellie’s milk, too: your mind is turning in a haze, making it hard to think... or is that just the sea of bullspunk flooding your [pc.vagOrAss] and the seemingly endless orgasms the gang of males behind you wrings from your body? You’re not sure you care anymore, as long as they continue... don’t stop! Keep fucking you! Fill you with their seed until you can’t hold a single drop more!");
	output("\n\nAnother orgasm - yours and his - and a flood of warm, sweet milk into your mouth, and your ability to think completely erodes, leaving you doing nothing but moaning and crying out in pure, animalistic pleasure until consciousness slips from you, leaving your body utterly at the mercy of the eager bulls - all forty in line, or maybe more.");
	processTime(76);
	//Used for holding the current target pussy
	var x:int = 0;
	var y:int = 0;
	
	var pp:PregnancyPlaceholder = new PregnancyPlaceholder();
	// Some of the stuff I might do for Brynn will add a generic cow-dude pregnancy for NT
	// Uncomment this line when/if it gets in
	//pp.impregnationType = "NewTexasGenericPregnancy";
	
	if(pc.hasVagina())
	{
		for(y = 0; y < 46; y++)
		{
			//Smallest cunt always takes the load and gets a stretchin!
			x = pc.smallestVaginaIndex();
			pc.cuntChange(x, 100, false, true, false);

			pc.loadInCunt(pp,x);
			pc.orgasm();
		}
	}
	else
	{
		for(y = 0; y < 46; y++)
		{
			pc.buttChange(100,false);
			pc.loadInAss(pp);
			pc.orgasm();
		}
	}
	if (pc.isTreated())
	{
		publicUseCount(1);
	}
	
	//If the PC is a treated male, give him a prompt to go female.
	if (pc.isTreated() && (pc.mf("m", "f") == "m") && (publicUseCount() == 2 || publicUseCount() % 4 == 0))
	{
		output("\n\nYou come back to your senses dazed but utterly satisfied, a moan escaping your [pc.lips] when you feel the wet warmth radiating from your hindquarters. Ellie’s still holding you tightly, having supported you throughout your cumdump act and no doubt getting some action herself during. You nuzzle her massive rack, eliciting a girly moan.");
		output("\n\n<i>“Y’know, [pc.name]... you ever thought about doing this more often? ‘Cuz you’re pretty hot as a bull, but I think you might enjoy it more if you went cowgirl. More holes to be fucked that way.”</i>");
		output("\n\nShe giggles at her infallible logic. Looks like the Treated girls <i>can</i> still do math.");
	}
	//If the PC is a treated female that has been fucked by Big T, give her a prompt for a bad end every 4 rides.
	if (pc.isTreated() && (pc.mf("m", "f") == "f") && (publicUseCount() > 3) && (publicUseCount() % 4 == 0) && (flags["FUCKED_BY_BIGT"] != undefined))
	{
		output("\n\nYou come back to your senses dazed but utterly satisfied, a moan escaping your [pc.lips] when you feel the wet warmth radiating from your hindquarters. Ellie’s still holding you tightly, having supported you throughout your cumdump act and no doubt getting some action herself during. You nuzzle her massive rack, eliciting a girly giggle.");
		output("\n\n<i>“Y’know, [pc.name]... you ever thought about doing this more often? You always look so insat-.. unsat.. happy when the boys are running a train on you! Big T told me to tell you, uh...”</i> She strains, trying to remember what it was she had to tell you.");
		output("\n\n<i>“Oh yeah! He said that you could get your own stall next to the shop after he checks out the situation down here. Something about you becoming a permanent resident of New Texas.”</i> She leans down and whispers faux-conspiratorially. <i>“I think he just wants to fuck you again.”</i>");
		
		addButton(0, "Nah", ellieTaurBadEndNo, undefined, "Nah", "You don’t wanna stay on New Texas.");
		addButton(1, "Sure", ellieTaurBadEndYes, undefined, "Sure", "You’d looove to become an NT citizen. So much fucking!");
		return;
	}
	
	pc.exhibitionism(2);
	addButton(0,"Next",mainGameMenu);
}

public function publicUseEnding():void
{
	clearOutput();
	clearMenu();
	showBust("BIGT");
	showName("OUT ON\nBREAK");
	author("Wsan");
	
	pc.removeAll();
	
	output("You dreamily nod into Ellie’s bountiful bosom, desperately suckling the last of the milk you can get before she pulls away with a smile,");
	if (pc.hasHair()) output(" running a hand through your [pc.hair].");
	else output(" stroking your head.");
	pc.milkInMouth(chars["ELLIE"]);
	var x:int = pc.smallestVaginaIndex();
	output("\n\n<i>“You stay right there, sweetie. I’m sure you can find something to keep you busy until he’s here!”</i> She says with a wink, putting a tiny ‘Out on Break’ sign on the counter where you won’t knock it off. The first bull approaches you from behind, unzipping his jeans and slapping his giant shaft off your [pc.butt] before shoving it straight into your [pc.pussy " + x + "].");
	pc.cuntChange(x, 100, false, true, false);
	output("\n\nYou cum on the spot, your shrill cry of pleasure like the starting gun to signal the bull to start pistoning in and out of you, each penetration bringing him deeper inside until his balls are nudging your butt. The sensations rippling through your cunt are your reward for servicing the bull, driving you higher towards the peak of ecstasy until you’re cumming with every thrust, scarcely capable of voicing your pleasure in anything but moos.");
	pc.orgasm();
	output("\n\nWhen Tee arrives with Zephyr and Ellie in tow, you’re still being ridden by the third or fourth bull lucky enough to be in the gift shop when you put yourself up on offer. He seizes your haunches and hilts himself when he cums, squeezing your flanks as your abused fuckhole constricts and tightens around his cock, massaging his length to ensure all of his bullspunk is poured directly into your waiting womb. He slides smoothly out of your pussy, his flared head catching at the entrance for a second before popping free, a cascade of jizz and your lusty moan following it.");
	var pp:PregnancyPlaceholder = new PregnancyPlaceholder();
	if (!pp.hasCock()) pp.createCock();
	pp.createPerk("Fixed CumQ", 5000, 0, 0, 0);
	pc.loadInCunt(pp, x);
	output("\n\n<i>“Heya, Steele. Ha! Hell, you got the party started without me. Looks like you love New Texas every bit as much as I do!”</i>");
	output("\n\nYou look back at the towering hunk of a man as he approaches, just cognizant enough to notice he’s already pulling his pants down. Your already-flushed [pc.skin] turns a shade darker, the musk of an alpha bull heavy in your nostrils as you start to pant, your eagerness to be fucked by this studly specimen written all over your face.");
	output("\n\n<i>“Gotta say, Steele, you’ve taken to the Treatment like a duck to water. It’s a thing of beauty, men and women realizing what life is really about. That’s the thing about New Texas, it’s -”</i>");
	output("\n\n<i>“T, you’re boring her.”</i> Zephyr sighs, rolling her eyes as she strides around the desk to stand in front of you with a sheaf of paper. T coughs, then continues.");
	output("\n\n<i>“Well, I’m here to officially offer you citizenship on New Texas, Steele. But...”</i>");
	output("\n\nHe eyes your tauric hindquarters, prompting you to wiggle it as seductively as you can. You feel him place a heavy, powerful palm on your [pc.butt] and squeeze you, sending little tingles of pleasure up your spine. Zephyr’s fat doggycock is already tenting her skirt seductively, leading you to lean forward and brush your [pc.lips] against it, only a thin layer of soft fabric separating you and pure bliss... You barely hear Tee from behind you.");
	output("\n\n<i>“I think it can wait.”</i>");
	output("\n\nThe two of them descend upon you like pack animals, Zephyr immediately grasping you by the chin, prompting you to obediently open your mouth and let your [pc.tongue] loll out seductively. She wastes no time thrusting her knotty rod right between your lips, the Treatment so generously providing you with sympathetic pleasure while she violates your mouth. You think you could cum from this alone, hollowing your cheeks to better serve the amazon, before the heat of Tee’s maleness at your rear reminds you of his presence. His flare pushes into your [pc.asshole], exquisitely stretching it out until your ring has no choice but to accept him, his prodigious dick hitting what feels like every cluster of nerves and sensitive spot in your ass while it slides in. Your eyes roll back and you cum around T’s massive dick rearranging your insides, stretching you out like a warm condom every time he thrusts into you. Moaning into Zephyr’s cock, you shiver in pleasure while it plumbs the depths of your throat and gives you a liberal dripfeed of glazing across your tongue.");
	pc.buttChange(400,false);
	output("\n\n<i>“This must be like heaven for a cow like you, huh? </i>God<i>, I love you girls.”</i> Zephyr comments from above, smirking down at your face burning scarlet with lust, desperately bobbing up and down on her canine rod. <i>“You bitches were never much for talking, but fuck if you don’t know what your mouth is good for.”</i>");
	output("\n\nYou greedily gulp down her precum and wrap your tongue around her length like the sex toy you are, coaxing splurts of it into your gullet even as T fills you from the other end. You feel every bit the perfect cow, taking two girthy cocks at once in your holes, just like you were meant to. The eroticism of being sandwiched between Tee and Zephyr is like a blissful high, the rhythm of being pumped at both ends as mentally fulfilling as it is physically pleasurable. Tee roughly slaps your ass while he’s fucking you, making you moo in a subdued manner around Zephyr’s canine cock and then once more, louder this time when he slips a couple of his fingers into your [pc.pussy].");
	output("\n\n<i>“There ya go, Steele. A proper cow ain’t happy unless she’s completely full.”</i> Tee chuckles to himself.");
	output("\n\n<i>“She’s a proper cow alright.”</i> Zephyr snorts,");
	if (pc.hasHair()) output(" running a hand through your [pc.hair] before tightly gripping it, jerking your head up and down her cock.");
	else output (" wrapping a hand around the back of your head before jerking you up and down her cock.");
	output(" You do your best to look upwards and meet her gaze as you’re dragged along her meaty dick, juices and saliva splattering your visage. She gives you an affectionate smile when you whine in slutty pleasure. <i>“She knows her place.”</i>");
	output("\n\nTee says nothing, electing instead to pull you further over the counter and grab just in front of your rear legs so he can get a proper grip. He starts fucking you even harder, each forceful impact jiggling your butt until your body is sliding back and forth on the counter, your head held in check only by Zephyr’s tight grip. You can feel more and more warm pre spraying into your ass and down your throat and you do your best to tighten up as much as possible, desperate to coax out their orgasms.");
	if (pc.hasTail()) output(" You feel your wildly waving tail get grabbed from behind, Tee holding it firmly and rubbing the base. Ooh... that feels pretty good. Bulls really <i>do</i> know how to take care of their cows.");
	output("\n\nZephyr moans from above you, and you feel the base of her cock begin to swell in your mouth as her knot makes its appearance. She shows no sign of wanting to pull it out, and you wouldn’t have it any other way. You clamp your lips around her rapidly-thickening base and suck, pulling her closer and squeezing her buttocks in anticipation. She doesn’t keep you waiting long, her grip tightening almost painfully on your head when you feel her legs begin to flex, her cock tensing in your throat and spraying ropes of doggy spunk into your stomach with every low exhalation.");
	output("\n\n<i>“</i>Fuck<i>, that’s good. Swallow my cum like a good girl, Steele.”</i> Zephyr grunts.");
	pp = getZephyrPregContainer();
	pc.loadInMouth(pp);
	output("\n\nNot that she’s given you a choice in the matter, but you’re only too happy to oblige. The Treatment-provided nerve clusters in your lips and tongue light up in ecstasy every time she cums, and each spray of jizz that pumps into you only adds to your fulfillment. Tee’s orgasm isn’t far behind, impaling you from behind on his gigantic pillar of a cock, his heavy balls coming to nestle snugly against your butt as he groans in satisfaction, his warm cum flowing into you from behind. You revel in the feeling of his balls pumping against your ass, each throb accompanied by another massive spurt of cum into your intestines");
	if (pc.hasToes()) output (" and your [pc.toes] curling up in bliss");
	output(". By the time Tee pulls out you’re not sure you could even pack any more cum in there, although Zephyr is doing a good job of giving him a run for his money. Tee sighs in satisfaction as he pops free of your ring with a lewd noise, cum running down your shaking [pc.thighs].");
	pp = getBigTPregContainer();
	pc.loadInAss(pp);
	pc.loadInAss(pp);
	pc.loadInAss(pp);
	output("\n\n<i>“Nothing like a cow to take the edge off after a hard day’s work. Zephyr, can you grab the papers?”</i>");
	output("\n\n<i>“Sure. Though I don’t think she’s fully... Fuck it, I doubt she’s any smarter when she’s not being fucked. </i>Cows<i>.”</i>");
	output("\n\nZephyr shakes her head, her knot still sporadically pulsing in your mouth. It’s gonna be a while before she deflates enough to get you off it... not that you’re complaining. You roll your tongue over her swollen canid dick while she grabs a leaf of paper and pulls one of your hands off her butt long enough to put a pen in it.");
	pp = getZephyrPregContainer();
	pc.loadInMouth(pp);
	output("\n\n<i>“Sign here. We need it in paper for archival purposes.”</i>");
	output("\n\nYou weakly scribble an approximation of your signature across the line, interrupted every so often by a throbbing between your lips together with a fresh rope of hot jizz glazing your well-fucked throat. Zephyr reaches down and tweaks your [pc.nipples], the stimulation making your eyes cross with a subdued moo of pleasure around her knot.");
	output("\n\n<i>“Consider this your inauguration party, Steele. Welcome to New Texas! I personally guarantee your satisfaction. Well,”</i> Tee chuckles, <i>“after Zephyr is done with you, anyway.”</i>");
	output("\n\nTee produces a couple of bottles of whiskey to share with the gift shop visitors and Zephyr, celebratory cheer all around. With Zephyr finally deflated enough to let you go and go have some drinks, you lie across the counter panting heavily trying to get your breath back. A bull surprises you from behind by inviting himself to the inviting warmth of your cunt, and with nothing having prepared you for the penetration you can’t help but utter a small gasp and cum. The feeling of being full once more is perfection – it feels like completeness in the form of a brain-wracking orgasm that washes over your body, making you feel light as a feather. You moo loudly in both pleasure and happiness when the wonderful stud bestows his bountiful load upon your womb, drowning your fallopian tubes in hot bull spunk. It feels like everything you’ve ever wanted out of life.");
	pc.loadInMouth(pp);
	output("\n\nBefore accompanying Tee back upstairs, Zephyr stops by to talk to you. You gaze up at her with your [pc.eyes] wide, your cheeks burning red with lust and dripping sweat, and your mouth hanging open emitting passionate moos. You’ve been fucked anally and vaginally by about fifteen bulls and a few girls, too, although you’ve long since lost count. She shakes her head and grins.");
	output("\n\n<i>“Now that you’re gonna be just downstairs from me Steele, I expect you to swing by at least once a day. You could do with some breaking in.”</i>");
	output("\n\nYou do what comes naturally for a cow being told good news and lick her face in between the pants and gasps being fucked out of you. She grimaces for a second but the smile returns to her face before she pulls back.");
	output("\n\n<i>“Have a good night, Steele. I’ll see you soon. Oh, and welcome to New Texas.”</i>");
	output("\n\nShe sashays away to her business, leaving you to be fucked by the remainder of partygoers. It’s like your wildest dreams are coming true; another bull walks over and occupies your mouth, seeing as it’s already hanging open, moaning and just waiting to be fucked as full of cream as your pussy. Eagerly accepting the stud’s desires, your roll your tongue along the thick vein running down his cock, earning you a pleased grunt. All things considered, looks like you’re gonna be a smash hit on New Texas!");
	
	processTime(65);
	pc.changeLust(200);
	pc.exhibitionism(2);
	pc.applyCumSoaked();
	
	addButton(0, "Next", publicUseEndingPartTwo);
}

public function publicUseEndingPartTwo():void
{
	clearOutput();
	clearMenu();
	showBust("ELLIE_NUDE");
	showName("\nELLIE");
	author("Wsan");
	
	output("When the party finally disperses you’re still lying on the counter, moaning softly and still leaking cum out of every hole. It’s hard work being a cumdump, but it’s rewarding in its own way. Everyone had a great time, including you! If this is what it’s gonna be like every day, you’ve obviously made the right choice. You hear heavy footsteps and rouse yourself, turning your head to find Ellie smiling at you.");
	output("\n\n<i>“Hi [pc.name]! You looked like you were having a lot of fun being setup for those yummy bullcocks, but even you’ve gotta be tired by now, right? D’you need somewhere to stay for the night? I can at least give you a spot out the back if you’d like.”</i>");
	output("\n\nAccepting gratefully, you let Ellie take your hand and, smiling sweetly, lead you past the milker machines and to a corner with a varied array of pillows and some pink horse blankets. Curiosity strikes you all of a sudden, and you think to ask Ellie where she was during your epic fuckathon.");
	output("\n\n<i>“Oh, milling around. All of the bulls were here for your inauguration, after all.”</i>");
	output("\n\nShe sounds a little put out by the lack of attention, and you’re not one to be ungrateful. New Texan generosity, after all. You grin and pull on her hand, bringing her to a halt. She turns with a quizzical expression.");
	output("\n\n<i>“Wanna take me for a ride?”</i> You ask, rubbing your hands sensually over your [pc.breasts]. <i>“I know I’m not a bull, but I promise I’ll be fun for you.”</i>");
	output("\n\n<i>“Y’know, there </i>is<i> something I’ve been wanting to try...”</i> She says with a grin.");
	output("\n\nA scant few minutes later and you’re braced against the wall, still tired but happily rejuvenated by the prospect of the dicking you’re about to get. Ellie stands behind you, a gigantic hardlight strapon fully erect and swaying from side to side underneath her belly.");
	output("\n\n<i>“Oooh, you smell so good back here sugar,”</i> she moans, <i>“I don’t even have to ask if you’re ready for me, huh?”</i>");
	output("\n\nWithout further ado, she lunges forward and mounts you, her front legs contracting tightly around your tauric body. She’s <i>heavy!</i> You put more of your weight against the wall for support, gasping a little when you feel the tip of her hardlight cock brush against your labia, as inflamed with lust as they are. A moment later and her cock is slowly splitting your lips apart, finding her mark as she clambers further up your body. Somehow it feels incredibly right for Ellie to be on top of you, mounting you like you’re a bitch in heat looking to be bred, assuaging your slutty desires. If the noises she’s making are any indication, she feels much the same way. You both moan, Ellie being the louder, when her cock slips fully into your [pc.pussy] without resistance.");
	output("\n\n<i>“Oh, [pc.name]... No wonder the bulls love you so much.”</i>");
	output("\n\nNothing more needs to be said between the two of you, and she continues to sink herself deeper in your rear-mounted pussy until the warmth of her voluptuous, milky breasts are pressed firmly against your back. Fuck, she’s deep in you... Deep enough you can feel her knocking against your womb, just like the bulls who shared you around earlier. You’re filled with a strange euphoria at the realization, reaching out behind you to pull her tighter against your back with a loving moan. She giggles and slyly slips her arms around you, gently stroking your [pc.nipples] with her thumbs. Oh, she knows <i>exactly</i> what you want. Your groan lapses into a drawn-out moo of pleasure, unable to help yourself as she tweaks, squeezes, and softly flicks your nipples all while pounding at your womb.");
	output("\n\nYou’ve been riding an orgasmic high ever since she started fucking you, but her gentle and loving treatment makes it impossible to resist cumming properly. Your moans rapidly increase in intensity until you’re screaming against the wall every time she rocks you with another blunt impact against your cervix. Legs shaking underneath you, you scrabble and then suddenly collapse under her, your front half landing in the pillows while your back half manages to stay upright in a desperate effort to keep getting fucked.");
	output("\n\n<i>“Oops! Sorry babe, you must be pretty tired after today. Lets finish up and get you to bed, okay?”</i>");
	output("\n\nAll you can do is moan in assent, writhing amongst the pillows as she speeds up in search of her own orgasm in your wet and welcoming insides. It doesn’t take long for her to cum when she’s being selfish about it, and you can’t resist cumming another couple of times just at the behest of her treatment of your pussy. By the time she dismounts you’re both panting and covered in a sheen of sweat, your faces flushed after such vigorous sex.");
	output("\n\n<i>“So that’s what it’s like,”</i> Ellie moans in between pants, catching her breath, <i>“It’s hard work being a bull.”</i>");
	output("\n\nYou turn over and smile up at her. <i>“But I <i>was</i> fun, right?”</i>");
	output("\n\nEllie giggles in reply. <i>“You sure were, sugar. Gotta say I prefer being a cow, though. Now lets get you to bed, sweetie. You must be exhausted.”</i>");
	output("\n\nTired, still trickling cum, and well-used, you fall asleep almost immediately after Ellie sets you up a comfy bed of pillows. Covering you in a blanket and tucking you in with a goodnight kiss, Ellie departs to go get some rest. When you awaken it’ll be the first real day of your new life as public property, the thought of the sex you’ll be having keeping your subconscious horny and your dreams wet.");
	
	processTime(32);
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	
	addButton(0, "Next", publicUseEndingFinale, undefined, "Next", "Your new life as public property awaits.");
}

public function publicUseEndingFinale():void
{
	clearOutput();
	clearBust();
	showName("FOR\nPUBLIC USE");
	author("Wsan");
	
	output("At first you’re set up outside Ellie’s store in a set of stocks (that you can easily escape from – but don’t) and a sign advertising your <i>“services”</i>. It’s not uncommon for a New Texan girl to be easy, but the allure of a non-native heir to a galactic megacorp is hard to resist. You find yourself being fucked in your restraints day in and day out, catching Z’s in between servicing studs, sometimes waking up with a cock spouting warm seed between your lips.");
	output("\n\nSoon enough you’re the talk of the town, and with your affinity for gene modding coupled with being the perfect Treated slut, you can not only accommodate any cock but give it the loving worship it deserves until it dumps its hot load into your womb, between your puffy lips, or deep in your bowels. With Ellie being so close and given your very explicit consent (why would you object to being sexier?), anyone is free to modify you however they want to live out their fantasy of fucking an Amazonian holstaurus or dominating a gazelle-like waif. No matter how many bulls conquer your sweltering marepussy or make you shake like a leaf on the wind, you can’t get enough. You’re just happy to be relentlessly fucked, one New Texan bull filling you up right after another. After a while you find you don’t even need to leave for food breaks – you suck down and swallow so many nutrients that you might as well stay here and have like, way more fun. Why spend time not fucking?");
	output("\n\nAfter a while you start noticing all types of new and exciting cocks plowing your miraculously tight holes, and Ellie cheerfully informs you that Big T has been advertising New Texas’ acquisition of [pc.fullname] on the Extranet! Wow! Seems like you’re becoming a tourist attraction around here instead of just a local star! You’d grin if you weren’t occupied lustily gulping down the cum from of a throbbing dick pumping between your lips. You might not get to run a boring company, but you’re going to make the Steele name way more famous than your lame cousin ever could.");
	output("\n\nNo one ever brings the circumstances of your <i>“acquisition”</i> up to your face, but you hear it in passing, usually between a few individuals as they use you. By the time they’re done, though, nobody cares <i>how</i> you got there, only that you’re always available. The relatively low immigration rate and restricted visiting privileges ensure that you never really have to worry about being mistreated – not that anyone would act up on a planet inhabited by towering bulls, but it’s reassuring nonetheless.");
	output("\n\nPlus, you can still adventure if you want to! You’re young, virile and oh-so-fuckable, all traits valued in space exploration, based on your experiences. It never occurs to you how odd it is that you never end up pregnant – maths isn’t really your forte any more – but you’re glad you don’t have too much responsibility. You still have the freedom to leave, it’s just... well, this cock you’re suckling tastes <i>really</i> good, and the one in your asshole feels absolutely amazing. No sense in letting a good thing go to waste.");
	output("\n\nYou can afford to think about it later, you surmise as a particularly well-endowed tourist’s large balls quake and shudder against your chin. Right now, you’re focused on sucking down as much creamy spunk as will slide down your well-practiced throat – which, as it turns out, is all of it.");
	output("\n\nRight... you can think about it tomorrow.");
	
	sleepHeal();
	days += 256;
	hours = rand(24);
	processTime(rand(60));
	pc.credits = 0;
	pc.changeLust(200);
	
	badEnd("GAME OVER!");
}

//Ellie’s Menu: Sex
//Any sex scene gives +10 Affection. 
//Kind of like with Sera, when you hit the <i>“sex”</i> button, Ellie will choose the scene appropriate for the PC: If the PC has a big dick, she’ll let them pound her pussy. If they’re a TAUR with a dick, they get to mount her. If they have a little dick, she’ll let them fuck her ass. Finally, if the PC doesn’t have a dick of any kind, she’ll mount THEM and pound their [vagOrAss] in with her tail. There’s a special scene for the first time the PC qualifies as having a <i>“little dick”</i> (less than 12 inches).
public function ellieSexScene():void
{
	clearOutput();
	author("Savin");
	showBust("ELLIE_NUDE");
	showName("\nELLIE");
	nephAffection(10);

	output("Leaning over the counter a bit, you ask the ");
	if(silly) output("busty bimbo-taur");
	else output("shapely shopkeeper");
	output(" if she’d be up for a roll in the proverbial hay.");

	output("\n\nEllie gives you a toothy smile as you voice your request, her bunny-like upper ears twitching. ");
	if(flags["ELLIE_OPERATION"] == 4) output("<i>“I knew you hadn’t had enough of me,”</i> Ellie grins, and even without her pheromones on overdrive you can smell her arousal. <i>“C’mon then, let’s get out of here!”</i>");
	else if(flags["ELLIE_SEXED"] == undefined) output("<i>“I thought you’d never ask, sugar!”</i> she says with a giggle that does the most amazing things to her jiggly rack.");
	else if(flags["ELLIE_SEXED"] < 4) output("<i>“You wanna go again, sugar?”</i> Ellie says, barely hiding the surprise - or the delight - in her voice. <i>“I’d be delighted to.”</i>");
	else output("<i>“You just can’t get enough of me, can you sugar?”</i> Ellie teases, though you can already smell the tell-tale increase of her arousal. <i>“C’mon then, let’s get out of here!”</i>");

	output("\n\nEllie reaches under the counter and sets a tiny <i>“Out on Break”</i> sign atop it. That done, she gives you a giddy little grin and takes you by the hand, leading you out the shop’s back door. There’s not much of a back room, per se, so much as a loading dock cleverly concealed from the front of the rustic ranch house and stuffed with crates full of milking machines, Treatment medi-pens, and girly cow-pattern clothes. Ellie leads you a little ways into the dock to a far corner stacked with brightly-colored pastel pillows. Several bottles of lube and spare pink horse blankets are scattered haphazardly across the cushioned corner.");

	output("\n\nOnce you’ve arrived, Ellie releases your hand and canters ahead, clambering over a few of the thicker bunches of pillows until she’s reached the far wall. The leithan slut plants a hand on a heavy-duty support bar bolted onto the wall and casts a come-hither glance over her shoulder, patting her tauric flank invitingly. <i>“");
	if(!pc.isNude()) output("Toss those clothes off and c");
	else output("C");
	output("ome on over, lover. Don’t be shy.”</i>");

	output("\n\nYou eagerly pull your [pc.gear] off and hurry towards your leithan lover, sidling up behind her and planting a hand on the hot, soft material of her blanket. Seeing where your attentions are directed, Ellie’s all too happy to unbuckle the straps around her humanoid waist, making it easy for you to yank it over one of her flanks... and be " + (flags["ELLIE_OPERATION"] == 4 ? "treated to the sight of her slavering pussy, shining with wetness and exuding a musk that speaks volumes of how she wants to be taken." : "immediately assaulted by an overwhelming wave of her pheromones, so concentrated that you nearly orgasm from the mind-melting, mouth-watering scent alone."));
	if(flags["ELLIE_OPERATION"] == 4) output("\n\nEllie giggles. <i>“You like? Why don’t you get a bit closer?”</i>");
	else output("\n\nEllie giggles, chewing on a finger. <i>“Sorry, babe. Guess I got a little pent up under there... but you don’t look like you mind much!”</i>");
	output("\n\nCompletely on auto-pilot, your body moves in toward the source of that wonderful musk, nestled between her powerful back legs and hidden beneath the base of her curling reptilian tail. She takes a little step forward, several of her clawed feet scraping at the floor in anticipation as you eagerly brush her tail aside and reveal the soaking slit of her pussy. It’s huge, sodden, and smells so sweet you want to just eat it up. Which is exactly what you do, when Ellie’s tail curls around your shoulders and mashes your face right into her aromatic honeypot.");
	output("\n\n<i>“Why don’t we start with you getting me off a couple times, sweet thing?”</i> she grins, her lower body shivering a little as you press into her back-facing crotch. You don’t find yourself struggling one bit against either her command or her soft, strong tail. Instead, you open your mouth wide, your tongue slipping out to caress the lips of her intoxicating sex. Her folds don’t need to part for you: you doubt they could actually pull together if she tried. Indeed, you doubt it would be too much of a feat to stick your whole head into that wide channel. For now, though, you content yourself to munch on her lips, giving them little bites and nibbles, letting your tongue savor their sweet, slightly bitter taste. Her juices come a moment after you start, smearing across your cheeks, chin, even drooling down to splatter across your [pc.chest].");
	output("\n\nYou move faster the more excited Ellie gets, your tongue darting in to tease at her inner walls, fingers even getting in on the action to caress her outer folds. Your tauric lover coos with delight when your wandering mouth finds a particularly tough, almost bulging nub just inside her pussy, just at the end of your tongue’s reach. <i>“Oooh, that’s the spot,”</i> she purrs, cupping one of her huge tits. Her saucer-sized teat responds to the stimulation immediately, squirting a thick trickle of milk into her bra. She flashes you a grin, twisting on her hips so that you can see her lactating tits soak straight through the sheer material of her bra, never spilling a drop but still making sure that her tits are plainly visible through it.");
	output("\n\nYou only glance up for those few precious moments to see your lover’s bountiful bust on full and blatant display before returning your focus back towards the delicious gash between her hind legs. Ellie shivers happily as your tongue probes in toward that wonderfully sensitive spot inside her, and her thick, leathery tail squeezes affectionately around your shoulders. <i>“Mmm, keep that up, " + pc.mf("big boy","pretty girl") + " and I’m liable to... liable to...”</i>");
	output("\n\nHer body finishes the thought for her: her gaping cunt contracts around you, the slick walls rubbing against your tongue and her muscles go wild with sexual gratification, worked over the edge by your eager mouth. You’re treated to a faceful of wet, sticky tauric juices as Ellie cums, her hips grinding her pussy back against your face. Your vision swims as you’re laced with her aromatic, sweet-tasting girl-spunk, left in a heady cloud of leithan-musk and Ellie’s sexual release.");
	output("\n\nShe shudders, leaning heavily against the wall, and her leathery tail releases its grip on you. You stagger back, wiping at the sticky webs of taur-cum splattered on your cheeks");
	if(pc.hasHair()) output(" and through your hair");
	output(". Ellie gives you an apologetic smile, saying <i>“Sorry babe. If you couldn’t tell, I needed that...”</i>");
	output("\n\nThe tip of her tail flicks across your cheek, wiping away a bit of her girl-spunk... only to turn around and drive itself into her twat. Ellie gives a little gasp as her tail sinks into her cum-soaked snatch, spreading her black lips wide open around its thick girth. <i>“Mmm, now what am I going to do with you, sweet thing?”</i> Ellie coos, cupping her tits and wiggling her animalistic hips as she spears herself. Her twin-pupiled eyes regard with you a look of lust and unrestrained desire...");
	pc.changeLust(300);
	processTime(14);
	IncrementFlag("ELLIE_SEXED");
	clearMenu();
	//Scene routing here!
	var scenes:Array = [];
	
	if(pc.hasCock())
	{
		//Mount Her (Centaurs, any dick size)
		if (pc.isTaur()) scenes.push((flags["ELLIE_OPERATION"] == 4 ? specialNewMountSceneIfYouGaveEllieKiddos : centaursOnCentaursOnCentaursOnCentaursThisShitIsLikeInception));
		else if(pc.biggestCockLength() < 12 && pc.biggestCockThickness() < 2)
		{
			//Little Dick, First Time
			if (flags["ELLIE_EMBARASSED_LIL_DICK_FUCK"] == undefined) scenes.push(littleDicksGetToPlayForTheFirstTime);
			//Anal (Little Dick Repeat)
			else scenes.push((flags["ELLIE_OPERATION"] == 4 ? specialNewLittleDickSceneIfYouGaveEllieKiddos : littleDicksGetToGoRoundTwo));
		}
		//Vaginal (Big Dick)
		else scenes.push((flags["ELLIE_OPERATION"] == 4 ? specialNewBigDickSceneIfYouGaveEllieKiddos : ellieBigDickVaginalScenesForBigDickBoysWithBigDicksAndNowImJustTypingBigDicksAsManyTimesAsPossibleInThisBigDickFunctionName));
	}
	
	//Get Tailpegged (F/ForN)
	if (pc.hasVagina() || !pc.hasCock()) scenes.push(getTailPeggedByTaurBitches);
	
	//Pick a scene and add it to a button - really no random yet but more could be added.
	//I just wanted to be as robust as Ellie's snatch.
	if(scenes.length > 0) addButton(0,"Next",scenes[rand(scenes.length)]);
	else addButton(0,"Next",mainGameMenu);
}

//Vaginal (Big Dick)
public function ellieBigDickVaginalScenesForBigDickBoysWithBigDicksAndNowImJustTypingBigDicksAsManyTimesAsPossibleInThisBigDickFunctionName():void
{
	clearOutput();
	author("Savin");
	showBust("ELLIE_NUDE");
	showName("\nELLIE");
	output("<i>“Come and get it, big " + pc.mf("boy","girl") + ",”</i> Ellie purrs, withdrawing her arm-thick tail from her pussy, leaving her lips wide agape and drooling a web of excitement and anticipation. You all but leap at the opportunity, ");
	if(pc.tallness < 76) output("grabbing a smallish box to stand on and ");
	output("aligning yourself behind the leithan slut’s spread hind legs. She flashes you a sultry grin and wiggles her hips, smearing a little of her fem-spunk across your [pc.crotch] and thighs, and especially over the diamond-stiff length of your [pc.cockBiggest]. Ellie’s pheromones had you hot and ready to fuck the moment you walked into her shop; finally you can act on your primal urges to breed that leithan cunt until it’s dripping with your seed.");
	output("\n\nYou grab your hefty cock and bring the full weight of it down on Ellie’s butt, slowly dragging your monstrous shaft down her bestial thigh. She makes a throaty, whinnying sound of delight as you start to line yourself up with her sex. <i>“Mmmm, I can </i>feel<i> that, lover...”</i> Ellie coos, cupping one of her oversized udders and pinching the nipple until it squirts. <i>“");
	if(pc.biggestCockLength() < 24) output("That’s a nice, thick cock... you’re hung just like the bulls here. I hope you’ve got their stamina, cuz you’re gonna be pounding me till I scream!”</i>");
	else output("That delicious hunk of meat belongs on a leithan, or maybe a real centaur... not that I’m complaining! Easier on my back this way, you know. Either way, my poor little pussy’s just drooling in anticipation... come on, lover, go ahead and slide it in!”</i>");

	output("\n\nTaking a breath to steady yourself, you angle your rod towards Ellie’s gaping cunt and start to push forward. Ellie’s pussylips part like a veil of silks for you, making way for your [pc.cockBiggest] to plunge into her sultry depths. She’s hotter than a human, boiling hot no matter how cold her blood may run! Her muscles move gingerly around you as you penetrate her, the slick slabs of flesh in her pussy almost kissing you, sucking your rod further and further in until you’re totally buried inside your leithan lover. Even as hugely endowed as you are, she takes you without resistance, though her legs claw at the ground and her whole body shifts with the forward motion of your dick, moving with you until Ellie’s chest is mashed against the wall, breasts squishing on cold concrete. She shivers at the sensation -- both of the cold on her huge nipples and the gargantuan cock spreading her pussy wide.");
	pc.cockChange();

	output("\n\n<i>“Ooooh, that’s the stuff,”</i> Ellie coos, looking over her shoulder and patting her flank, just hard enough to let you feel it all the way inside her. Her voice trembles with every word, as if on the brink of crying out. <i>“There’s no feeling in the ‘verse like a big, thick cock buried in me... oh, I looove it, [pc.name]!”</i>");

	output("\n\nYou give Ellie an appreciative swat on the haunch, and even though your palm landed on one of her armored plates, you still feel her drooling gash squirm around you, muscles working along the many, many inches of cockflesh rammed into her. Her long, leathery tail coils around your [pc.hips], gently guiding you as you withdraw, helping to steady you as you lean out and out before hammering home. She lets out a high, ecstatic scream when you slam your [pc.cockBiggest] back in, squirting trickles of fem-cum out around your pussy-stretching girth, smearing your crotch and [pc.legOrLegs] in musky leithan girl-spunk... which only drives you even madder with lust.");

	output("\n\nYou grip Ellie’s haunches, letting your fingers dig into the supple skin between her armored plates. Thanks to those plates, it’s easy to find a good grip on the tauric slut. She gives a strange, throaty nickering sound as you grasp her wide, bestial hips and start to really fuck her. With her tail’s help, you’re able to leap into a thunderously fast pace. Your [pc.hips] hammer into her, pounding away at the gaping hole of Ellie’s pussy, reveling in the wetness of her passage, the way her pussylips kiss at your cock every time you push into her. Grinning to yourself with mindless lust, you rear back and give Ellie’s butt a hard swat, feeling her scaly plates shudder under the impact and her bestial cunt contract around your thrusting [pc.cockBiggest] in the perfect way to drive you wild. Your tauric lover gasps and moans as you spank her plated behind, leaning her humanoid half against the wall and groping at her breasts to draw even more pleasure from her lusty body.");

	output("\n\nEllie’s cries and screams of pleasure only get louder as you continue, until you’re sure everyone in the shop -- hell, probably everyone in the ranch house - can hear the two of you going at it. In the cloud of leithan sex pheromones you’re wallowing in, however, that knowledge only makes you hornier. Let ‘em hear! Let them all be jealous: this is your pussy to fuck, to fill with seed, to breed... <i>that</i> thought in particular drives you forward, your body going completely on automatic as you jackhammer your hips against Ellie’s haunches, fucking her as hard as you possibly can.");

	output("\n\n");
	if(pc.legCount > 1) output("Between");
	else output("Along");
	output(" your [pc.legOrLegs], Ellie’s tail starts to squirm and shiver, the muscles writhing around you. You try and ignore her wiggling tail, but its movements only become more and more urgent; you slowly realize it’s just the first sign of Ellie’s climax. The tauric beauty’s voice climbs a register higher over several low, lusty moans and cries of pleasure, her whole body shifting with your [pc.hip]’s impact against her, grinding and thrusting herself back against you. You can feel the lips of her gaping pussy contract hard, kissing at your cock and smearing you with an ever-increasing veneer of sticky tauric girl-cum, painting your groin in a web of leithan spunk until you’re drenched in it. She’s not a squirter, but she’s a leaker, that’s for sure!");
	output("\n\nEllie doesn’t let you lag far behind her: her muscles wring and squirm all along the length of your [pc.cockBiggest], so tight and so hot, massaging every inch of your desperate prick. Her velvety pussy milks you, hard and long as Ellie rides out her own explosive orgasm, her body working to make sure you come with her into bliss. As turned on as you are, it doesn’t take long.");
	output("\n\n<i>“Come on, [pc.name], give it to me! I wanna feel your cum inside me! Flood my womb with your seed until I look fucking pregnant,”</i> Ellie whinnies, her tail coiling tightly around your waist and pulling you tight against her, hugging you close as your own climax nears.");
	output("\n\nA few more deep thrusts, and you begin to feel the familiar rush of orgasmic need rising in your [pc.balls]. Your [pc.hips] can’t move much with Ellie holding you like that, but they hammer what few inches your lover’s death-grip permits you, her chemical cloud rending asunder any lingering ability to hold back. With a final grunt of pleasure, you slap your hips into hers, relishing the squelching feeling of her overly-wet crotch mashing against your own. Buried to the hilt inside your tauric lover, you find yourself cumming, unleashing a thick spray of [pc.cumNoun] into the hot, sultry passage of Ellie’s bestial pussy. Her muscles go into overdrive at the feeling of your cum flooding into her, working hard to milk out every drop from you, to draw you deeper into her as you bust your nut into her welcoming womb.");
	output("\n\nWhen you’re done, you give a sated sigh and lean against the leithan’s armored backside, trying to catch your breath. Ellie’s hips wiggle eagerly against your crotch, her cum-soaked vaginal muscles contentedly massaging your still-twitching [pc.cockBiggest]. Her tail holds you steady for a long, long time, making sure you squirt every drop deep into her hungry cunt, keeping you trapped against her until you go soft enough to fall out of her on your own. When you do, you’re treated to a little waterfall of backed-up leithan spunk, mixed with a healthy dose of your own, which drools down");
	if(pc.legCount > 1) output(" between");
	else output(" along");
	output(" your [pc.legOrLegs] to splatter between her hind claws.");
	output("\n\n<i>“Oh, I needed that,”</i> Ellie moans, still massaging her huge tits. <i>“Nothing beats a big, thick cock and a belly full of spunk...”</i> At that, her reptilian tail releases you. You almost fall without her support, your [pc.legOrLegs] all but giving out after your desperate orgasm. With a little yelp, you flop back down onto the mass of pillows behind her, watching with a smile as the leithan’s tail twitches, and a trickle of your spooge drools out of her thoroughly-fucked twat. Smiling at you over her shoulder, the taur adds, <i>“You sure know how to fuck a big ol’ ‘taur like me, huh? Hmm... I wonder if any of your little swimmers will be the one, huh? You think you might get to be the lucky winner to finally knock me up? Guess we’ll see...”</i>");
	output("\n\nYou weakly give the centaurin a thumbs up. She giggles and picks you up, easily slinging you onto her back");
	if(pc.isTaur() || pc.isNaga()) output(", bestial body and all");
	output(" - the impact of which has the delightful effect of making her spooge-packed hole squirt a little of your seed back onto the floor. <i>“C’mon, sweetheart, let’s get you back to the shop.”</i>");
	processTime(25);
	tryKnockUpEllie();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Little Dick, First Time
public function littleDicksGetToPlayForTheFirstTime():void
{
	clearOutput();
	author("Savin");
	showBust("ELLIE_NUDE");
	showName("\nELLIE");
	flags["ELLIE_EMBARASSED_LIL_DICK_FUCK"] = 1;
	output("<i>“Come and get it, big " + pc.mf("boy","girl") + ",”</i> Ellie purrs, withdrawing her arm-thick tail from her pussy, leaving her lips wide agape and drooling a web of excitement and anticipation. You all but leap at the opportunity, ");
	if(pc.tallness < 84) output("grabbing a smallish box to stand on and ");
	output("aligning yourself behind the leithan slut’s spread hind legs. She flashes you a sultry grin and wiggles her hips, smearing a little of her fem-spunk across your [pc.crotch] and thighs, and especially over the diamond-stiff length of your [pc.cockBiggest]. Ellie’s pheromones had you hot and ready to fuck the moment you walked into her shop; finally you can act on your primal urges to breed that leithan cunt until it’s dripping with your seed.");
	output("\n\nYou unceremoniously ram yourself in. Ellie’s pussylips part like a veil of silks for you, making way for your [pc.cockBiggest] to plunge into her sultry depths. She’s hotter than a human, boiling hot no matter how cold her blood may run! Her muscles move gingerly around you as you penetrate her, the slick slabs of flesh in her pussy almost kissing you, sucking your rod further and further in until you’re totally buried inside your leithan lover.");
	output("\n\nYou grip Ellie’s haunches, letting your fingers dig into the supple skin between her armored plates. Thanks to those plates, it’s easy to find a good grip on the tauric slut. She gives a strange, throaty nickering sound as you grasp her wide, bestial hips and start to really fuck her. Your [pc.hips] hammer into her, pounding away at the gaping hole of Ellie’s pussy, reveling in the wetness of her passage, the way her pussylips kiss at your cock every time you push into her. Grinning to yourself with mindless lust, you rear back and give Ellie’s butt a hard swat, feeling her scaly plates shudder under the impact and her bestial cunt contract around your thrusting [pc.cockBiggest] in the perfect way to drive you wild.");
	pc.cockChange();
	output("\n\nA few more thrusts, and you begin to feel the familiar rush of orgasmic need rising in your [pc.balls]. Your [pc.hips] can only move faster, Ellie’s chemical cloud rending asunder any lingering desire to hold back. With a final grunt of pleasure, you slap your hips into hers, relishing the squelching feeling of her overly-wet crotch mashing against your own. Buried to the hilt inside your tauric lover, you find yourself cumming, unleashing a thick spray of [pc.cumNoun] into the wide passage of Ellie’s pussy. You give a few final thrusts into her as you cum, using her squirming walls to help milk out every drop of your seed, pouring it deep into Ellie’s eager sex.");
	output("\n\nWhen you’re done, you give a contented sigh and lean against the leithan’s armored backside, trying to catch your breath. Ellie’s hips wiggle eagerly against your crotch, her cum-soaked vaginal muscles massaging your still-twitching [pc.cockBiggest]. After a moment though, you hear your lover ask, <i>“Hey babe, I can’t really see too well back there, but... you’ve been hanging onto me for a good little bit, you know? Aren’t you gonna go ahead and put it in me, yet? I’m starving for a good hard dicking, sweetheart...”</i>");
	output("\n\nYou feel a horrible, crushing sensation in your heart as the cheery leithan girl says the words no " + pc.mf("man","dick-wielder") + " wants to hear. You mumble under your breath that you just finished in her as you stumble back, looking at the huge, cum-soaked twat between Ellie’s haunches. No wonder she didn’t even notice, she’s built to take cocks bigger than your arm. When you step back, Ellie canters around and looks down at you, a sad glimmer in her normally bright eyes.");
	output("\n\n<i>“Aww, I’m sorry, sweetheart... I didn’t mean...”</i> she stops herself, chewing on her lower lip. <i>“Hey, look, it’s alright, [pc.name]. I don’t mind, honest. Come on, what do you say we go back to the shop and see about getting you the Treatment, huh? It’ll definitely give you a boost. Or maybe some gene mods? There’s plenty of things out there that’d give you a dick so big, even a leithan male would be jealous!”</i>");
	output("\n\nEllie gives you a reassuring pat on the shoulder as she leads you back to the storefront, drooling your cum back onto the concrete floor as she walks.");
	processTime(20);
	tryKnockUpEllie();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}



//Anal (Little Dick Repeat)
public function littleDicksGetToGoRoundTwo():void
{
	clearOutput();
	author("Savin");
	showBust("ELLIE_NUDE");
	showName("\nELLIE");
	output("<i>“Don’t worry about size this time, lover-" + pc.mf("boy","girl") + ",”</i> Ellie adds a moment later, still thrusting her thick tail into herself, punctuating her words with little gasps of pleasure. <i>“My big ol’ pussy may be a little too big for you, but I’ve got another little hole that’s as tight as a Terran virgin’s little slit.”</i>");
	output("\n\nAs she speaks, her tail pops out from her now-gaping sex and drags itself up her haunch, the tapered tip coming to rest against the dark little star of her asshole. She’s not kidding: her butt’s about as big as a pornstar’s cooch, but it’s a hell of a lot more... well, you-sized than her animalistic pussy. She gives a little gasp as her tail pushes in, just a few inches, but covered in her sweltering girl-cum as it is, the going’s not too rough for maybe six inches of her rapidly-widening thickness. <i>“What do you say, sweet thing? Wanna feel my hot, tight little pucker around that gorgeous little cock of yours?”</i>");
	output("\n\nYou all but leap at the opportunity, ");
	if(pc.tallness < 84) output("grabbing a smallish box to stand on and ");
	output("aligning yourself behind the leithan slut’s spread hind legs. She flashes you a sultry grin and wiggles her hips, smearing a little of her fem-spunk across your [pc.crotch] and thighs, and especially over the diamond-stiff length of your [pc.cockBiggest]. Ellie’s pheromones had you hot and ready to fuck the moment you walked into her shop; while you can’t act on your mind’s primal urges to breed that sultry leithan pussy, you can at least sate your chemically-aroused desires on a hole built for someone your size.");
	output("\n\n<i>“Not so fast, babe,”</i> Ellie grunts as your [pc.cockBiggest] brushes against the X-shaped hole of her butt. <i>“What do you say to a little lube first, huh? My pussy’s wet enough for just about anything, but my ass? Better safe than sorry...”</i>");
	output("\n\nYou grunt in frustration and pent-up horniness, but yield to your lover’s request. However, you won’t settle for something that came out of a bottle when there’s a hot, wet well of juicy lube rubbing up against you already. You redirect your [pc.cockBiggest] to the wide-open lips of Ellie’s black cunt, pushing yourself easily into its sultry depths. You move yourself in a circle around her wet, hot muscles, gathering up as much of Ellie’s natural lubricants onto your shaft as you possibly can. She looks over her shoulder, watching you with eager eyes while you prepare. Once you’ve got enough slippery taur-spunk slathered onto your rod to make sure that you’ll have an easy time with even the tightest of holes, you slide your hips back from the leithan’s bestial pussy and angle yourself back up toward your target. X marks the spot...");
	output("\n\nSeeing that you’re about the take the plunge, Ellie lifts her tail up and out of the way, curling the leathery appendage along her back to make herself nice and open for you. She flashes you a little smile as you grab her hips, and she starts to cup and squeeze her breasts again, milking herself ever so slightly in anticipation. The sight of her maternity bra filling up with lactic excess is enough to drive you onwards, and you start to press your [pc.hips] forward.");
	output("\n\nThe four folds of muscle that make up Ellie’s X-shaped asshole part easily, folding back against themselves as you enter her. The difference between her ass and pussy is like night and day: you can feel Ellie’s muscles worming and squirming around you, the beat of her powerful, head-sized heart thrumming through the tightly clenched passage. It feels like a hot, silken glove around your [pc.cockBiggest], a little warmer and drier than a normal girl’s pussy, but just as pleasant to sheathe your wang in.");
	output("\n\nYou easily sink in to the hilt, eliciting a long, low groan of pleasure for your enormous lover. <i>“Oh, now that’s the stuff...”</i> Ellie coos, her tail wiggling around your [pc.hips], pulling you in until your crotch squeezes tight against hers. You give a slight shiver as you feel your lover’s freely-flowing juices smear across your [pc.legOrLegs] and thighs, basting you in warm, sweet-smelling sex-musk that quickly makes it was up to your nose.");
	pc.cockChange();
	output("\n\nYou grip Ellie’s haunches, letting your fingers dig into the supple skin between her armored plates. Thanks to those plates, it’s easy to find a good grip on the tauric slut. She gives a strange, throaty nickering sound as you grasp her wide, bestial hips and start to really fuck her. Your [pc.hips] hammer into her, pounding away at the tight, wringing ring of Ellie’s asshole, reveling in the tightness of her passage. Her muscular folds kiss and suckle on your cock with every powerful thrust, as if trying to pull you deeper and deeper into her. Grinning to yourself with mindless lust, you rear back and give Ellie’s butt a hard swat, feeling her scaly plates shudder under the impact and her bestial asshole contract around your thrusting [pc.cockBiggest] in the perfect way to drive you wild. Ellie gasps and moans as you spank her plated behind, leaning her humanoid half against the wall and groping at her breasts to draw even more pleasure from her lusty body.");
	output("\n\nBetween your [pc.legs], Ellie’s tail starts to squirm and shiver, the muscles writhing around you. You try and ignore her wiggling tail, but its movements only become more and more urgent; you slowly realize it’s just the first sign of Ellie’s climax. The tauric beauty’s voice climbs a register higher over several low, lusty moans and cries of pleasure, her whole body shifting with your [pc.hip]’s impact against her, grinding and thrusting herself back against you. You can feel the lips of her gaping pussy contract hard, rubbing against your own crotch and smearing you with an ever-increasing veneer of sticky tauric girl-cum, painting your groin in a web of leithan spunk until you’re drenched in it. She’s not a squirter, but she’s a leaker, that’s for sure!");
	output("\n\nHer ass joins in the fun a moment later, squeezing down on your shaft hard enough to trap you, completely halting your thrusts into her save for tiny, shallow jerks of your [pc.hips], barely able to clear an inch from your lover’s powerful grip. Still, Ellie doesn’t let you lag far behind her: her muscles wring and squirm all along the breadth of your [pc.cockBiggest], so tight and so hot, massaging every inch of your desperate prick. Her ass milks you, hard and long as Ellie rides out her own anal orgasm, her body working to make sure you come with her into bliss. As turned on as you are, it doesn’t take long.");
	output("\n\n<i>“Come on, [pc.name], give it to me! I wanna feel your cum inside me!”</i> Ellie whinnies, her tail coiling around your waist and pulling you tight against her, hugging you close as your own climax nears.");
	output("\n\nA few more restrained thrusts, and you begin to feel the familiar rush of orgasmic need rising in your [pc.balls]. Your [pc.hips] can’t move much, but they hammer what few inches your lover’s death-grip permits you, Ellie’s chemical cloud rending asunder any lingering ability to hold back. With a final grunt of pleasure, you slap your hips into hers, relishing the squelching feeling of her overly-wet crotch mashing against your own. Buried to the hilt inside your tauric lover, you find yourself cumming, unleashing a thick spray of [pc.cumNoun] into the vice-tight passage of Ellie’s well-fucked asshole. Ellie’s muscles go into overdrive, working hard to milk out every drop, to draw you deeper into her as you bust your nut into her welcoming backside.");
	output("\n\nWhen you’re done, you give a sated sigh and lean against the leithan’s armored backside, trying to catch your breath. Ellie’s hips wiggle eagerly against your crotch, her cum-soaked anal muscles contentedly massaging your still-twitching [pc.cockBiggest].");
	output("\n\n<i>“Oooh, that was nice, [pc.name],”</i> Ellie coos, her tail releasing you. You almost fall without her support, your [pc.legs] all but giving out after your desperate orgasm. With a little yelp, you flop back down onto the mass of pillows behind her, watching with a smile as the leithan’s tail twitches, and a trickle of your spooge drools out of her thoroughly-fucked ass. Smiling at you over her shoulder, the taur adds, <i>“You sure know how to show a girl’s backdoor a good time, don’t ya? I might just have to let you do that again sometime...”</i>");
	output("\n\nYou weakly give the centaurin a thumbs up. She giggles and picks you up, easily slinging you onto her back");
	if(pc.isTaur() || pc.isNaga()) output(", bestial body and all");
	output(" - the impact of which has the delightful effect of making her spooge-packed hole squirt a little of your seed back onto the floor. <i>“C’mon, sweetheart, let’s get you back to the shop.”</i>");
	processTime(30);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Mount Her (Centaurs, any dick size)
public function centaursOnCentaursOnCentaursOnCentaursThisShitIsLikeInception():void
{
	clearOutput();
	author("Savin");
	showBust("ELLIE_NUDE");
	showName("\nELLIE");
	output("<i>“How about you give me what none of those big bulls out there can, sweet thing? Trot up here and give me a good, hard mounting!”</i> Ellie commands, her tail sliding out of her and coiling out of the way to reveal the gaping gasp of her cum-slick pussy. She wiggles her hips invitingly, hands wrapping around the bolted bar on the wall to steady herself in preparation. Her black-lipped cunt winks at you, still webbed with strands of sticky girl-spunk and beading anew with moisture, looking so inviting that you just can’t help yourself.");
	output("\n\n<i>“Oooh, come and get it, eager " + pc.mf("boy","girl") + ",”</i> she giggles as you stomp up behind her, already feeling the weight of your [pc.cockBiggest] growing to full mast under your own tauric body. As you approach, you find yourself walking right into the potent cloud of Ellie’s over-active sex pheromones,");
	if(pc.race() != "leithan" && pc.originalRace != "half-leithan") output(" which sends a shudder of lust through your body, making you stamp your forelegs and grunt with need. You’ve got to fuck that pussy - there’s no stopping you now!");
	else output(" which excites your own leithan instincts, driving your mind to the one conclusion it can reach: it’s time to breed!");
	output(" With a primal roar of desire, you lunge forward onto your waiting lover, thrusting the full weight of your animalistic body onto her, scrambling up her back until your humanoid waist is flush against her own. Ellie shrieks in effort and shock, her six legs buckling under the massive added weight of your inhuman form, but she follows that up with a low, feral moan as you reach down and grab her huge, milk-swollen tits. She gasps happily as you squeeze and knead her udders, working out a thick gout of milk that utterly soaks her bra - right up until she strips it off, letting the two fleshy gray orbs bounce free into your grip.");
	output("\n\nYou use Ellie’s humanoid torso, and especially her meaty rack, to steady yourself as your hind legs scoot up and align your wang with the sultry snatch between your lover’s haunches. She gasps and shudders as your [pc.cockHeadBiggest] brushes her twat’s lips. You don’t go gently, but let the full weight of your bestial nethers come down in one mighty thrust the moment you’re aligned. Ellie’s pussylips part like a veil of silks for you, making way for your [pc.cockBiggest] to plunge into her sultry depths. She’s hotter than a human, boiling hot no matter how cold her blood may run! Her muscles move hungrily out of your way as you penetrate her, the slick slabs of flesh in her pussy almost kissing you, sucking your rod further and further in until you’re totally buried inside your leithan lover. No matter how hard you slam your rod in, she takes you without resistance, though her legs claw at the ground and her whole body shifts with the forward motion of your dick, moving with you until Ellie’s chest is mashed against the wall, breasts squishing on cold concrete, spilling out around your groping fingers. She shivers at the sensation - both of the cold on her huge nipples and the [pc.cockBiggest] spreading her pussy wide.");
	pc.cockChange();
	output("\n\n<i>“Fuck!”</i> Ellie cries, shivering with delight as you finally settle atop her. <i>“Oh, I’d almost forgotten what it’s like... before you came. Nothing like it in the ‘verse.”</i>");
	output("\n\nYou give your lover an affectionate titty-squeeze, grinning as a trickle of her milk pours out down your fingers. In return, Ellie wiggles her hips back, carrying both of you a step away from the wall to give you some room to maneuver without cracking skulls against the concrete. Now that you have some space, you dig your forelegs into Ellie’s shoulders and start to move. She gives a strange, throaty nickering sound as you anchor yourself overtop her and start to really fuck her. Your [pc.hips] hammer into her, carrying monumental weight behind every thrust - enough to make her whole body shake and start every time you ram yourself home into that wonderfully wet, boiling-hot pussy. You revel in the wetness of her passage, the way her pussylips kiss at your cock every time you push into her. Grinning to yourself with mindless lust, you busy your humanoid half by savaging Ellie’s breasts, squeezing her big nipples and cupping the massive mounds, loving every moment that the too-huge swells of her rack spill out around your clutching fingers. She squeals in delight, milk squirting from her abundant stores, and her bestial cunt starts to contract around your thrusting [pc.cockBiggest] in the perfect way to drive you wild. Your tauric lover gasps and moans as you molest her ample chest, leaning her humanoid half back against you and joining you in groping at her breasts, desperate to draw even more pleasure from her lusty body.");
	output("\n\nEllie’s cries and screams of pleasure only get louder as you continue, until you’re sure everyone in the shop - hell, probably everyone in the ranch house - can hear the two of you going at it. In the cloud of leithan sex pheromones you’re wallowing in, however, that knowledge only makes you hornier. Let ‘em hear! Let them all be jealous: this is your pussy to fuck, to fill with seed, to breed... <i>that</i> thought in particular drives you forward, your body going completely on automatic as you jackhammer your hips against Ellie’s haunches, fucking her as hard as you possibly can.");
	output("\n\nBetween your [pc.legs], Ellie’s tail starts to squirm and shiver, the muscles making it writhe around your hind legs. You try and ignore her wiggling tail, but its movements only become more and more urgent; you slowly realize it’s just the first sign of Ellie’s climax. The tauric beauty’s voice climbs a register higher over several low, lusty moans and cries of pleasure, her whole body shifting with your [pc.hip]’s impact against her, grinding and thrusting herself back against you. You can feel the lips of her gaping pussy contract hard, kissing at your cock and smearing you with an ever-increasing veneer of sticky tauric girl-cum, painting your groin in a web of leithan spunk until you’re drenched in it. She’s not a squirter, but she’s a leaker, that’s for sure!");
	output("\n\nEllie doesn’t let you lag far behind her: her muscles wring and squirm all along the length of your [pc.cockBiggest], so tight and so hot, massaging every inch of your desperate prick. Her velvety pussy milks you, hard and long as Ellie rides out her own explosive orgasm, body working to make sure you come with her into bliss. As turned on as you are, it doesn’t take long.");
	output("\n\n<i>“Come on, [pc.name], give it to me! I wanna feel your cum inside me! Flood my womb with your seed until I look fucking pregnant");
	if(pc.race() == "leithan" || pc.originalRace == "half-leithan") output(" - until I AM fucking pregnant");
	output(",”</i> Ellie whinnies, her tail coiling tightly around your hindlegs and pulling you tight against her, urging you to fuck her harder and deeper as your own climax nears.");

	output("\n\nA few more deep thrusts, and you begin to feel the familiar rush of orgasmic need rising in your [pc.balls]. Your [pc.hips] pound into Ellie’s backside until you’re afraid she will collapse under the weight and force of you fucking her - but she holds on, screaming and crying and spraying milk and fem-cum all over her pillows as she does. Her pleasured sounds and leaking fluids only making you ever more desperate to cum, her mounting chemical cloud rending asunder any lingering ability to hold back. With a final grunt of pleasure, you slap your hips into hers, relishing the squelching feeling of her overly-wet crotch mashing against your own. Buried to the hilt inside your tauric lover, you find yourself cumming, unleashing a thick spray of [pc.cumNoun] into the hot, sultry passage of Ellie’s bestial pussy. Her muscles go into overdrive at the feeling of your cum flooding into her, working hard to drain out every drop from you, to draw you deeper into her as you bust your nut into her welcoming womb.");
	output("\n\nYou keep hammering, your bestial hips thrusting deep into Ellie, using her squirming, cum-soaked channel as a milker to work out every drop of seed. You won’t stop until you’ve fucked her ");
	if(pc.race() == "leithan" || pc.originalRace == "half-leithan") output("fertile ");
	output("womb as full of your spunk as you can. She’s more than happy to take it, making pleasured little moans and sighs as you fill her, still squeezing the milk out of her tits into a growing pool on the floor between her forelegs. Finally, after a few minutes of catching your breaths and enjoying the feeling of simply being inside your leithan lover, you scramble off of her back, forelegs clattering to the floor. The moment your [pc.cockBiggest] slides from Ellie’s gaping cunt, a little flood of leithan-cum mixed with just a tad of your own excess spooge drools out of her parted lips.");
	output("\n\n<i>“Mmm, that was awesome, big " + pc.mf("boy","girl") + ",”</i> Ellie murmurs, patting her flank. <i>“Not a lot of bulls... heck, none... can do that to me. After that... you better do it to me again and again, ya hear? Oh, I’m still shaking from it,”</i> she adds with a giggle, hugging her arms around herself. You give Ellie’s big, cum-splattered hind an affectionate pat and offer her your arm. She takes it with a toothy smile, her bunny-like ears rubbing up against you as she snuggles close. Together, the two of you make your way back to the storefront.");
	processTime(31);
	tryKnockUpEllie();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Get Tailpegged (F/ForN)
public function getTailPeggedByTaurBitches():void
{
	clearOutput();
	author("Savin");
	showBust("ELLIE_NUDE");
	showName("\nELLIE");
	if(!pc.hasCock())
	{
		output("<i>“Well, since you don’t have a big, throbbing bulldick to stick in me, I guess I’ll just have to return the favor the old-fashioned way, won’t I?”</i> Ellie says, licking her lips as she regards your nude form. <i>“Come on over, honey. I think I know just how to say thank you for that wonderful bit of pussy-eating...”</i>");
	}
	else if(pc.hasVagina()) output("<i>“Well, since you’ve got a nice, wet pussy over there, we can forget about your [pc.cocks] for a minute and work that needy gash, can’t we? I don’t </i>need<i> a cock for that either. I can make you feel better than one,”</i> Ellie says, licking her lips as she regards your nude form. <i>“Come on over, honey. I think I know just how to say thank you for that wonderful bit of pussy-eating...”</i>");
	else output("<i>“Well, since you don’t have any proper genitals, I guess I’ll have to pay your dirty little o-ring back for that wonderful bit of pussy-eating, won’t I?”</i> Ellie asks, licking her lips as she regards your nude form. <i>“Come on over, honey, and relax. This’ll only take a few minutes...”</i>");
	output("\n\nShe beckons you over with a come-hither crook of a finger, still happily pounding away at her gaping cunt with the thick, supple length of her tail. When you make your way over to your tauric lover, she gives you a lascivious smile and pats the bolted iron bar on the wall. <i>“Grab this, sweet thing, and spread ‘em wide!”</i>");
	output("\n\nIf you weren’t so desperately horny, you might have asked why. As it is, though, you eagerly do as Ellie commands, grasping the cold metal bar and shifting your weight onto it. You wiggle your [pc.legs] apart, and quickly feel Ellie’s hands playing down your back");
	if(pc.biggestTitSize() >= 1) output(", stopping only to reach around and give your [pc.chest] an affectionate squeeze, eliciting a little gasp of pleasure from you");
	output(". Her long, cool fingers eventually trace down to your [pc.butt], gripping your full cheeks and giving them a playful swat. <i>“Nice ass, [pc.name]. I’m gonna enjoy splitting it open... kinda like this,”</i> she giggles, slipping a finger up between your cheeks and straight into your [pc.vagOrAss].");
	output("\n\nYou give a shrill cry of surprise and pleasure as the slender digit probes into you, spreading your ");
	if(!pc.hasVagina()) output("rim");
	else output("lips");
	output(" around itself as she leans into it, pushing herself in to the knuckle. You squirm on her buried finger, your body shivering in response to the too-cold intrusion. She gives you a few tentative thrusts before withdrawing, giving your butt a reassuring pat before cantering back. <i>“Hold it just like that, " + pc.mf("handsome","beautiful") + "...”</i> Ellie coos, leaving you to stare at the wall, hands and [pc.legs] spread and braced for impact.");
	//if PC is a centaur:
	if(pc.isTaur()) output("\n\nSuddenly, you hear a bestial cry behind you as Ellie gallops forward and lunges onto your back! You buckle under the sudden weight of the busty leithan scrambling atop you, clawed legs digging into your flanks as she mounts you like a male! You give a cry of shock as her forelegs grip at your shoulders, body hammering into yours hard enough to make you shudder forward, barely keeping from slamming into the wall.");
	else output("\n\nSuddenly, you hear a bestial cry behind you as Ellie gallops forward and lunges over you! The metal bar bolted onto the wall makes a horrible shrieking sound as a thousand pounds of leithan suddenly slams down onto it. Ellie’s forelegs hook through the bar, shifting most of her hefty weight onto it; her second pair of legs claw at your shoulders, gripping you tightly. The force of her landing staggers you, making you nearly stumble into the wall, save for your deathgrip on the bar, now wedged between the leithan’s forelegs.");
	output("\n\nAs Ellie settles in overtop you, you begin to feel a hot, wet, supple... something crawling up your [pc.leg]. You cast a glance over your shoulder, but there’s nothing to see but the soft-scaled underside of Ellie’s bestial body over you, completely dominating your vision. It doesn’t take more than a moment to <i>feel</i> what it is, though: you cry out as a thin patch of warmth caresses your thigh, and your still-spread cheeks. It’s drooling wet, slick and sticky with a thick coating of leithan girl-cum: as good a lube as any.");
	output("\n\n<i>“Feel it?”</i> Ellie giggles, her legs squeezing your shoulders. <i>“Don’t worry, I got it nice and ready for you! Just relax, and let me pound you raw...”</i>");
	output("\n\nShe doesn’t wait for permission - not like you could deny her in your current state anyway. The leithan slut brings her hips forward, the motion carrying her tail between your cheeks and straight through the clenched hole of your [pc.vagOrAss]. With all that strength behind the thrust, there’s nothing your body can do but try and get out of the way, utterly yielding to the cock-like tail hanging between Ellie’s haunches. You try and scream, but it comes as a wordless, voiceless cry, barely audible over Ellie’s grunts of effort as she forces her leathery tail into you.");
	output("\n\nHer tail starts slim enough, but it grows wider quickly. Every inch she rams into you stretches your [pc.vagOrAss] wider, spreading your hole around the thickening leather of her squirming tail. And squirm it does, in a way a real cock never could! Ellie’s tail feels like a tentacle inside you, the tip squirming around, poking and probing and moving in all the right ways to drive you wild, even if you weren’t being stretched to the limit on top of it! Her supple, slithering appendage rubs and caresses your deepest depths, moving in unceasing strokes through your straining ");
	if(pc.hasVagina()) output("pussy");
	else output("ass");
	output(", making you scream in pleasure. Loud enough for everyone in the shop - hell, probably everyone in the ranch house - to hear. You couldn’t stop yourself even if you wanted to, though: the sensation is just too much.");
	var x:int = -1;
	if(pc.hasVagina()) x = rand(pc.totalVaginas());
	if(x == -1) pc.buttChange(200,true,true,false);
	else pc.cuntChange(x,200,true,true,false);

	output("\n\nEllie’s hips ram you again and again, her tauric body coming down on your up-raised ass like a hammer, pounding you forward with every thrust. You barely hang on, grasping at the bar and squirming under Ellie’s relentless fucking. Your screams of pleasure mount, climbing higher until they break into an orgasmic register, overwhelmed by the incredible, deep-thrusting stretching of your [pc.vagOrAss]. Your will breaks, mind going numb with pleasure; your body reacts with climax, muscles squirming and writhing around Ellie’s thick, plated tail, eliciting a lewd gasp from your bestial partner. A final thrust of Ellie’s hips sends her tail deep into you, your gut straining with the sheer size of it. Your whole body’s little more than a sheath for her now, gasping and crying and moaning in senseless pleasure, barely able to keep itself standing. She shudders over you, coming to a standstill as you ride your climax out, letting her tail work your stretched out hole through the ordeal.");
	output("\n\nWhen your orgasm passes, you’re left as a limp, wet, gasping mess beneath Ellie’s bestial body, supported mostly by the still-squirming tail buried to what feels like the hilt up your [pc.vagOrAss]. Slowly, Ellie’s massive appendage begins to slide out of you, letting you plant face-first into the mass of pillows beneath you - and right into a growing pool of ");
	if(pc.hasVagina()) output("your own [pc.girlCum] mixed with ");
	output("Ellie’s musky leithan spunk, pooled between her hindlegs during her mounting rut into you.");
	output("\n\nEllie clops down over you a moment later, her clawed feet scratching at the floor as she steadies herself. <i>“Whoo! That was fun, huh babe?”</i> Ellie giggles, looking down at your collapsed form. <i>“Aww, maybe I went a little rough... but that [pc.vagOrAss] of yours just drives me wild! I can’t help myself...”</i>");
	output("\n\nYou give a weak, shuddering groan. She giggles and picks you up, easily slinging you onto her back");
	if(pc.isTaur() || pc.isNaga()) output(", bestial body and all");
	output(" -- the impact of which has the delightful effect of making her pussy drool a little of her own sticky excess onto the floor. <i>“C’mon, sweetheart, let’s get you back to the shop.”</i>");
	processTime(25);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function talkToEllieAboutPregnancy():void
{
	clearOutput();
	clearMenu();
	author("Wsan");
	showBust("ELLIE");
	showName("\nELLIE");
	
	output("<i>“So you mentioned not being able to breed with other races, right?”</i> you ask Ellie.");
	output("\n\n<i>“Uh huh. It’s a bit of a bummer, but whatcha gonna do?”</i> she shrugs, then winks. <i>“Besides, it’s fun to try. Right, [pc.name]?”</i>");
	if(flags["MET_DR_LESSAU"] != undefined)
	{
		if(pc.isBimbo()) output("\n\n<i>“Weeeellll,”</i> you begin, wiggling with excitement. <i>“I can totally change that if you want! Just for us, I mean. I found a Steele doc that does biology things!”</i>");
		else output("\n\n<i>“You know, I met a doc on Uveto that could help,”</i> you say, winking at her. <i>“It’d only work for the two of us, but if you wanna be bred I’m your " + pc.mf("man", "gal") + ".”</i>");
		output("\n\n<i>“Gosh, really?”</i> Ellie says, wide-eyed with a hand on her bosom. <i>“You’d do that for me? I’d thought it was pretty expensive...”</i>");
		if(pc.isBimbo()) output("\n\n<i>“‘Course I would, silly girl! You’re the sweetest, sexiest girl I know!”</i> you exclaim. <i>“Plus you fuck like a champion. I’ll " + (pc.credits >= 100000 ? "handle" : "get") + " the money, don’t you worry.”</i>");
		else output("\n\n<i>“Guess I just can’t get enough of the nicest girl this side of the galaxy,”</i> you smile affectionately. <i>“Don’t worry about the money, " + (pc.credits >= 100000 ? "I’ve got it handled" : "I’ll get it together") + ".”</i>");
		output("\n\n<i>“Wow! You’ve really put some thought into breeding lil’ ol’ me, huh [pc.name]?”</i> Ellie says, flirtatiously fluttering her eyelashes. <i>“‘Course I’m not gonna turn </i>that<i> offer down, babe.”</i>");
		output("\n\n<i>“Didn’t think you would,”</i> you say with a grin.");
		output("\n\n<i>“So what happens to the kids?”</i> Ellie asks, looking uncharacteristically serious. <i>“Leithan mommies tend to be </i>very<i> protective, you know. I can raise them here on New Texas if you haven’t got a place for them.”</i>");
		output("\n\n<i>“I’ve got a place,”</i> you assure her. <i>“Steele Tech has a nursery on Tavros exactly for this - our children will be fed, clothed, cared for, schooled, and all the rest. You can come check it out with me if you’d like.”</i>");
		output("\n\n<i>“Hmmm,”</i> she hums, looking at you intensely. <i>“Would I be able to hang out there without you? Play with the kids and all that?”</i>");
		output("\n\n<i>“Yeah, of course,”</i> you nod. <i>“Just don’t knock all the stuff over with your jiggly ‘taur butt when you’re there.”</i>");
		output("\n\nShe giggles, fluttering her eyelashes a bit again. <i>“Well, you’ve gotta explain the operation stuff first before we really figure it out. Let me know when you wanna talk about it, ‘kay?”</i>");
		flags["ELLIE_OPERATION_TALK_UNLOCKED"] = 1;
	}
	else
	{
		if(pc.isBimbo()) output("\n\n<i>“Maybe I can find like, some kind of doctor at my company who could help,”</i> you think out loud. <i>“I’ll look for one, ‘kay?”</i>");
		else output("\n\n<i>“Wonder if there’s anyone at Steele Tech who could do something about that,”</i> you muse. <i>“I’ll look into it for you.”</i>");
		output("\n\n<i>“I’m tickled that you want to breed me that much, [pc.name],”</i> Ellie says with a wink. <i>“Won’t be holding my breath, but I’m looking forward to it.”</i>");
	}
	processTime(5+rand(3));
	nephAffection(5);
	buildEllieTalkMenu();
	if(flags["ELLIE_OPERATION_TALK_UNLOCKED"] == undefined) addDisabledButton(4,"Pregnancy", "Pregnancy", "You just finished talking about that.");
}

public function talkToEllieAboutOperation():void
{
	clearOutput();
	clearMenu();
	author("Wsan");
	showBust("ELLIE");
	showName("\nELLIE");
	
	if(flags["ELLIE_TALKED_OPERATION"] == undefined)
	{
		output("You ask if Ellie wants to talk about the operation you mentioned to enable her impregnation.");
		output("\n\n<i>“Uh huh. Is it scary?”</i> she asks, a gray finger tapping at a pouty lip.");
		if(pc.isBimbo()) output("\n\n<i>“Naw! I think it’s just like one injection thinger and then we can get to fucking you full of tiny ‘taurs,”</i> you reply, taking her hand.");
		else output("\n\n<i>“No, it’s literally one injection and then back to breeding from what I’m told,”</i> you explain, taking her hand.");
		output("\n\n<i>“You know me too well,”</i> Ellie teases, entwining her plated fingers with yours. <i>“I trust you, [pc.name]. I know you must be busy out there in space, but I’ll be the best mom I can be. I’ve always wanted kids of my own, my sister’s are so much fun,”</i> she says with a dreamy sigh.");
		output("\n\n<i>“I didn’t know you had a sister,”</i> you say. <i>“Does she not live around here?”</i>");
		output("\n\n<i>“Oh, most of us leithans don’t live out here,”</i> Ellie explains. <i>“This is the tourist-y part of the planet, after all! There’s a few, um, breeding enclaves set up. My sis and her family are at the closest one! I stay there sometimes when I’m not minding the shop... or fucking a bull,”</i> she winks. <i>“I got recruited for the gift shop job due to my feminine w- uhh... being a pretty face!”</i>");
		if(pc.isBimbo()) output("\n\n <i>“You </i>are<i> a total hottie, Ellie,”</i> you agree, squeezing her hand. <i>“I can see why T put your fine butt out here.”</i>");
		else output("\n\n <i>“Can’t say I disagree with </i>that<i> decision,”</i> you say, squeezing her hand. <i>“Universe’d be a nicer place if every shopkeep was like you.”</i>");
		output("\n\nShe giggles, pleased at your response. <i>“Plus, if I wasn’t put here, I’d never have met yooouu!”</i>");
		output("\n\nShe bends over the counter and gives you a kiss, pulling back with a smile. <i>“So. Were you gonna whisk me away on your spaceship to this doctor?”</i>");
		flags["ELLIE_TALKED_OPERATION"] = 1;
		processTime(8);
	}
	else
	{
		output("You ask if Ellie wants to talk about the operation you mentioned to enable her impregnation.");
		output("\n\nShe bends over the counter and gives you a kiss, pulling back with a smile. <i>“Sure. You gonna take me to that doctor you talked about?”</i>");
	}
	processTime(2);
	nephAffection(5);
	
	if(pc.credits < 100000) addDisabledButton(0, "Yes", "Yes", "You don’t have the 100,000 required credits for the operation.");
	else if(!pc.hasCock()) addDisabledButton(0, "Yes", "Yes", "You can’t ever get Ellie pregant if you don’t have a penis.");
	else addButton(0, "Yes", ellieDoOperation);
	addButton(1, "No", ellieDontDoOperation);
}

public function ellieDontDoOperation():void
{
	clearOutput();
	clearMenu();
	author("Wsan");
	showBust("ELLIE");
	showName("\nELLIE");
	
	output("<i>“Not right now, babe,”</i> you tell her.");
	output("\n\n<i>“Well, you just let me know when you wanna make the trip,”</i> she says with a wink and a wiggle. <i>“For you, I’m free any time.”</i>");
	output("\n\nThe way she pushes her arms together to emphasize her tantalizing cleavage leaves no doubt about the intention of her reply.");
	
	processTime(2);
	buildEllieTalkMenu();
	addDisabledButton(4, "Operation", "Operation", "You just finished talking about that.");
}

public function ellieDoOperation(part:int = 0):void
{
	clearOutput();
	clearMenu();
	author("Wsan");
	showBust("ELLIE");
	showName("\nELLIE");
	
	switch(part)
	{
		case 0:	output("<i>“Sure. You got your things?”</i>");
				output("\n\n<i>“Just my little ol’ self, sugar,”</i> Ellie says with a smile, producing her little placard and plopping it down on the counter before coming around to link her arm with yours.");
				processTime(2);
				break;
		
		case 1:	moveTo("TEXAS CUSTOMS");
				showBust("OGRAM", "AMMA");
				showName("CUSTOMS\nOFFICE");
				output("The two of you set off, walking across the idyllic landscape of New Texas back to your ship. Exiting through customs, you run into Ogram and Amma.");
				output("\n\n<i>“Heya, Steele,”</i> Ogram nods at you. <i>“Not stealing our favorite cowgirl away from us, I hope?”</i>");
				output("\n\n<i>“Just a quick jaunt into space and I’ll bring her right back,”</i> you say with a wink.");
				output("\n\n<i>“Oh, you two look so cute together!”</i> Amma titters, clapping her hands together. <i>“Have fun in space!”</i>");
				output("\n\n<i>“It’s what we’ll be doing </i>after<i> that’ll be fun,”</i> you reply, setting Ellie giggling.");
				output("\n\n<i>“Y’all have a good time out there,”</i> Ogram says as he waves you off. <i>“Bring her back in one piece!”</i>");
				processTime(4);
				break;
				
		case 2:	moveTo("SHIP INTERIOR");
				showLocationName();
				output("\n\nGetting Ellie on board takes a little bit of effort, the bubbly leithan being a bit too... well-proportioned for your ship to properly accommodate her, but she’s a good sport about it, not at all minding your hands on her jiggly butt to push her through doors. You opt to keep her in your room while you set a course for Uveto, because there’s no way the two of you are fitting in the cockpit together. Once you’ve plotted a route, you stand up and stretch with a sigh. Walking back to your room, you find your busty cargo experimentally putting her forelegs up on your bed.");	
				output("\n\n<i>“[pc.name], being on your ship has me all excited!”</i> Ellie exclaims, bouncing her feet off your bed. <i>“Being out here among the stars reminds me a little of when I was a kid...”</i>");
				output("\n\nShe trails off, peering out a window at the stars whizzing by. Her little gift shop temporarily forgotten, she gazes with wonderment at the universe around her. Putting a hand on her shapely flank, you let her silently enjoy the vastness of space as her tail unconsciously wraps around your arm. A few minutes pass.");
				output("\n\n<i>“How long is the trip gonna take?”</i> she asks suddenly, not taking her eyes from the viewport.");
				output("\n\n<i>“Probably a couple hours,”</i> you say, waving a hand vaguely. <i>“Ish.”</i>");
				output("\n\n<i>“Well,”</i> she says, turning and gently pushing you onto the bed. <i>“I can think of something to do for a couple hours.”</i>");
				pc.changeLust(33);
				processTime(30);
				break;
				
		case 3:	moveTo("UVS F15");
				showLocationName();
				output("The soft beep of your instrumentation alerts you to the fact you’re arriving on Uveto. Ellie pays it no mind, ears only for the quiet groans of her lover. Her soft, pouty lips slowly slide down your [pc.biggestCock], setting your legs trembling when you feel the head push her tongue flat and enter her pliant throat. She bobs her head, straightening her neck to provide easier penetration down her warm, wet gullet. ");
				if(pc.balls > 1) output("Gently cupping your [pc.balls], she lovingly strokes them between her fingers, taking care to pay attention to their entire surface before giving them an encouraging squeeze.");
				else output("Between the sight of the beautiful leithan’s face in your lap and the feeling of her tongue wrapping around you, you can feel the telltale signs of orgasm approaching.");
				output("\n\n<i>“Ellie, I’m gonna cum soon,”</i> you pant urgently, chest heaving even as your stomach tightens.");
				output("\n\nHer response is to moan happily around her faceful of throbbing cock, dragging her slickened passage up and down your bloated prick until you can resist no longer. You can see her eyes roll back in pleasure as the first spray of cum coats the insides of her cheeks, right before she takes your cock as deep as she can get it. Her throat squeezes at your length every time she swallows, milking you of your seed as she cums her brains out in Treatment-induced sympathy. When you’ve got nothing left to give, she slowly slides off your length, giving your [pc.cockHeadBiggest] one last sensitive lick before swallowing and looking up at you with a dazed, unfocused smile.");
				output("\n\n<i>“Your cock feels good in </i>all<i> my holes,”</i> she murmurs sultrily, basking in the afterglow.");
				output("\n\nYou run a hand through her messy hair, standing as she nuzzles at your fingers, idly taking one of them between her lips and suckling at it.");
				output("\n\n<i>“C’mon, Ellie,”</i> you chide her, <i>“we’ve got to get off the ship, at least.”</i>");
				output("\n\n<i>“Awww,”</i> she moans, releasing your fingers.");
				processTime(10*60 + rand(30));
				pc.orgasm();
				break;
				
		case 4: moveTo("UVI H38");
				showLocationName();
				output("You huff, pushing the docile, dopey leithan through the doors of your ship from behind. Her footfalls clink off the ramp, clawed feet rapping on the surface as you escort her to the ground. Once you’re actually on the planet, the entire process takes only a couple of hours. You stop off to buy Ellie some snugglier clothes so the poor girl doesn’t ice over, although trying to fit a sweatshirt over her giant breasts proves to be a struggle. The end result of pulling the sweater down her upraised arms looks like a couple of squished-together watermelons in a fluffy crop top, but you figure that’s as good as it’s going to get for the bubbly bimbo. If nothing else, she seems to be happy with the result.");
				output("\n\n<i>“It’s so toasty!”</i> she thrills, hopping about in the snow outside, tail waving to and fro. You pay the clerk and walk out to join her, only to be hit in the face with a soft <i>paff</i> of snow. Shaking yourself off, you look up to see Ellie bowed low to the ground with a playful grin, scooping up another handful.");
				output("\n\nA brief but intense snowball fight later, the two of you make your way through the crunchy snow underfoot to the medical facility. The meeting with the doctor is less than five minutes, and you’re out in even less.");
				output("\n\n<i>“Feel any different?”</i> you ask Ellie, walking alongside you with her arm in yours.");
				output("\n\n<i>“Naw... well, maybe,”</i> she admits. <i>“Just knowing I’ll be having kids of my own is nice, y’know.”</i> She turns to look at you with a genuine smile. <i>“Thanks so much, [pc.name].”</i>");
				output("\n\n<i>“You wanna talk about it?”</i> you ask.");
				output("\n\n<i>“Well, it’s always been something I’ve wanted,”</i> Ellie says, pulling you closer. <i>“I think I’ve told you before that the boys tend to give up trying after a while. It’s just nice to have lovers who care about me so much!”</i>");
				output("\n\n<i>“Everyone on New Texas is in love with you, Ellie,”</i> you remind her.");
				output("\n\n<i>“True,”</i> she giggles. <i>“It’s a friendly place. Not everyone’s gonna pay for gene stuff just to breed me, though! That’s a special kinda bond, I reckon!”</i>");
				output("\n\n<i>“Hell, if anyone could breed you I doubt you’d ever </i>not<i> be pregnant,”</i> you tell her.");
				output("\n\n<i>“Ooh, that’s sexy,”</i> she murmurs, lost in thought for a moment. <i>“Just being a big ol’ broodmare getting fucked full of babies.”</i> She turns to you, her cheeks darker than they were a moment ago, and grins cheekily. <i>“You know, Haley has been talking about breeding me lately. She might beat you to the punch if you’re not careful!”</i>");
				output("\n\n<i>“The hell with that, I’m gonna get a headstart the moment you get in there,”</i> you huff, slapping her jiggly butt as the two of you walk up the ramp.");
				output("\n\n<i>“Ooh! I can hardly wait,”</i> she says, wiggling her voluptuous ass in your face as she disappears into your ship, her tail swishing aside briefly to reveal her dripping-wet nethers.");
				pc.credits -= 100000;
				flags["ELLIE_OPERATION"] = 1;
				ellie.fertilityRaw += 1;
				processTime(50+rand(20));
				break;
				
		case 5: moveTo("TEXAS CUSTOMS");
				showLocationName();
				output("When you arrive back on New Texas suitably tired out, the two of you hop off the ship and proceed to customs. You spot Ogram at his desk looking distracted, and Amma’s nowhere to be seen. He gives you a short wave when he sees you.");
				output("\n\n<i>“Heya, Steele,”</i> he grunts. <i>“Y’all can just go on through, I have something to finish up here.”</i>");
				output("\n\n<i>“Uh huh,”</i> you nod, patting Ellie on the flank. <i>“You’d better get back to your shop, girl. I’ll swing by to see you soon.”</i>");
				output("\n\n<i>“You’d better! The space trip was fun, though,”</i> she admits. <i>“Wouldn’t mind doing that again.”</i> She leans in to tenderly kiss you on the mouth and gives you an excited, jiggly wave before setting off towards her shop. You stand at the entrance to New Texas and consider your options.");
				processTime(10*60 + rand(30));
				addButton(0, "Next", mainGameMenu);
				return;
	}

	addButton(0, "Next", ellieDoOperation, ++part);
}

public function tryKnockUpEllie():void
{
	if(!ellie.isPregnant())
	{
		//Can't have babies if either of you are sterile, also it's a 1-time pregnancy, NO REPEATS!
		if(pc.virility() == 0 || ellie.fertility() == 0 || flags["ELLIE_TOTAL_KIDS"] > 0) return;
		
		var score:Number = -1;
		//If pc is originally half-leithan and hasnt done fertility treatment, 0-5% chance to knockup based on virility
		if(pc.originalRace == "half-leithan" && flags["ELLIE_OPERATION"] == undefined)
		{
			score = pc.virility()*100;
			if(score > 500) score = 500;
		}
		//If pc has done fertility treatment they can knock her up, bonus to originally half-leithans
		else if(flags["ELLIE_OPERATION"] != undefined)
		{
			var x:Number = (pc.virility() + ellie.fertility())/2;
			if(pc.originalRace == "half-leithan") x+= 1.5;
			score = (1 - Math.exp(-0.38*x))*10000;
		}
		
		//roll for pregnancy
		var roll:int = rand(10000);
		trace("score: " + score + ", roll: " + roll);
		if(roll <= score)
		{
			flags["ELLIE_PREG_TIMER"] = 0;
			pc.clearRut();
			processTime(1);
		}
	}
}
	
public function talkToEllieAboutPregnancyButShesActuallyPregnantThisTime():void
{
	clearOutput();
	clearMenu();
	author("Wsan");
	showBust("ELLIE");
	showName("\nELLIE");
	
	output("<i>“How are you feeling?”</i> you ask, concerned. <i>“Anything that needs doing, or you want help with?”</i>");
	if(flags["ELLIE_PREG_TIMER"] < 20) 
	{
		output("\n\n<i>“I’m starting to feel a lot more hungry than I usually am,”</i> she says, unwrapping a nutrition bar and biting into it absentmindedly. You can see a few wrappers littered across the counter. Maybe you could bring her some food from your ship - she probably doesn’t get many opportunities to leave the counter.");
		addButton(0, "Get Food", elliePreggerGetFood);
	}
	else 
	{
		output("\n\n<i>“It’s getting a little harder to move around,”</i> she says, wincing as she stretches her hindlegs. <i>“I’m all stiff in the back!”</i>");
		output("\n\nMaybe you could give her a massage to take her mind off things for a little while. It must be difficult to get around with her tummy so swollen.");
		addButton(0, "Massage", elliePreggerMassage);
	}
	
	processTime(5+rand(5));
	addButton(1, "Back", buildEllieTalkMenu);
}

public function elliePreggerGetFood():void
{
	clearOutput();
	clearMenu();
	author("Wsan");
	showBust("ELLIE");
	showName("\nELLIE");
	
	output("You tell her you’ll be right back, Ellie nodding emphatically as you head back to your ship to get her some real food. " + (pc.race() == "half-leithan" || pc.race() == "leithan" || pc.originalRace == "half-leithan" ? "" : "What do leithans like to eat, anyway? Meat? ") + "You put together a warm meal with the help of extranet dining menus and place it in a container, bringing it back to the hungry bimbo. She claps her hands and bounces excitedly when she sees you.");
	output("\n\n<i>“Omigosh, thanks so much, [pc.name]!”</i> Ellie says, putting the container on her desk. <i>“I feel a little guilty leaving the counter empty whenever I’m hungry, so I usually just eat the thingies nearby,”</i> she continues, eyeing the food eagerly. <i>“You mind if I eat this right now?”</i>");
	output("\n\n<i>“Go for it,”</i> you tell her.");
	output("\n\nThe leithan woman scarfs down the food so fast you’d scarcely believe it existed at all had you not just brought it to her.");
	output("\n\n<i>“Ooh, that’s better,”</i> she moans, rubbing her tummy a bit. <i>“Thanks, [pc.name]!”</i>");
	output("\n\n<i>“Any time, Ellie. Tell me if you need anything else, okay?”</i>");
	processTime(20+rand(10));
	addButton(0, "Next", mainGameMenu, undefined, "", "");
}

public function elliePreggerMassage():void
{
	clearOutput();
	clearMenu();
	author("Wsan");
	showBust("ELLIE");
	showName("\nELLIE");
	
	output("<i>“I could give you a massage if you’d like,”</i> you offer, coming around the counter.");
	output("\n\n<i>“Oh, would you? That’d be soooo nice,”</i> Ellie sighs gratefully.");
	output("\n\nYou crouch behind Ellie, feeling her jump a little when you place a hand on her inner thigh. Squeezing her lightly, you softly rub the muscle there while she moans lightly");
	output("\n\n<i>“Oh, that’s really good,”</i> she says from above, almost puzzled. <i>“Don’t stop...”</i>");
	output("\n\nYou continue down her leg, working the stiffness out from the shivering limb when you notice a droplet hitting your hand. Ellie’s tail momentarily swishes aside, and you’re treated to the sight of rivulets of moisture trickling from between her thick, black pussylips. You continue massaging her, hand getting ever closer to her enticing nethers but never directly touching them, until it becomes too much for the busty bimbo to bear.");
	output("\n\n<i>“Oh-! [pc.name],”</i> Ellie croons, her legs shaking harder. Looking up, you can see her pussy flexing and contracting, practically winking at you, as clear girlcum runs down her thighs. You reach up to gently rub her clit, her knees knocking together while her legs squeeze your hand tight to keep it there. By the time she’s ridden out her orgasm, your fingers are absolutely drenched in her musk. Standing, you pet her affectionately on the flank and walk to the front of the panting leithan, popping your fingers between her lips. She eagerly sucks them clean, licking her juices off your hand with a second thought.");
	output("\n\n<i>“Good girl,”</i> you say, Ellie sighing happily in response. <i>“Feeling a little less taut now?”</i>");
	output("\n\n<i>“Uh huh,”</i> she nods, still lying across the counter. <i>“Thanks, babe...”</i>");
	output("\n\n<i>“Any time, Ellie. Tell me if you need anything else, okay?”</i>");
	pc.createStatusEffect("Mare Musk",0,0,0,0,false,"Icon_Smelly","You smell like a horny mare! The potent female scent is sure to drive others wild - though it gets you a little worked up as well.",false,0);
	processTime(10+rand(5));
	addButton(0, "Next", mainGameMenu, undefined, "", "");
}

public function processElliePregEvents(deltaT:uint, doOut:Boolean, totalDays:uint):void
{
	if(ellie.isPregnant())
	{
		flags["ELLIE_PREG_TIMER"] += totalDays;
		//PC has to see the pregnacy announcement and be there for the egg laying and hatching or timer pauses
		if((flags["ELLIE_OPERATION"] < 2 || flags["ELLIE_OPERATION"] == undefined) && flags["ELLIE_PREG_TIMER"] > 1) flags["ELLIE_PREG_TIMER"] = 1;
		else if(flags["ELLIE_OPERATION"] < 3 && flags["ELLIE_PREG_TIMER"] > 40) flags["ELLIE_PREG_TIMER"] = 40;
		else if(flags["ELLIE_OPERATION"] < 4 && flags["ELLIE_PREG_TIMER"] > 70) flags["ELLIE_PREG_TIMER"] = 70;
		
		//Time to lay eggs
		if(flags["ELLIE_PREG_TIMER"] >= 40 && flags["ELLIE_OPERATION"] < 3)
		{
			//These first 2 can hijack what the PC is doing
			if(currentLocation == "527") eventQueue.push(ellieLayAtGiftShop);
			else if(rooms[currentLocation].planet == "PLANET: NEW TEXAS") eventQueue.push(ellieLayOnNT);
			//This one can't so we'll set a flag so shit procs when the PC enters their ship
			else flags["ELLIE_LAYING_PC_MIA"] = 1;
		}
		
		//Set Ellie away or at the Gift Shop every 3 days after she's laid
		if(flags["ELLIE_OPERATION"] >= 3 && flags["ELLIE_PREG_TIMER"] % 3 == 0) toggleEllieLocation();
		
		//Give hatching notification
		if(flags["ELLIE_OPERATION"] == 3 && flags["ELLIE_PREG_TIMER"] == 70) AddLogEvent("Your codex bleeps softly, indicating you’ve received a message. You flip it open to see it’s addressed from Steele Tech, so it must be at least somewhat important. The message is short and succinct.\n\n<i>“The leithan eggs you fathered are ready to hatch. Please visit the Nursery at your soonest convenience.”</i>\n\nOh! You should probably do that sooner, rather than later...", "good");
	}
}

public function ellieLayAtGiftShop():void
{
	clearOutput();
	clearMenu();
	author("Wsan");
	showBust("ELLIE");
	showName("\nELLIE");
	
	output("<i>“Ooh,”</i> Ellie groans, wincing as she bends over the counter. <i>“Time for the Nursery, [pc.name]!”</i>");
	output("\n\n<i>“I’ll fly you there, c’mon,”</i> you say, beckoning her to you.");
	output("\n\nSupporting her on your shoulder, you get the taurgirl onto your ship and jet to Tavros. The lift seems to take forever when you have a heavily pregnant leithan with you, but you’re there soon enough. You get her into a birthing room and wait with her, holding her hand.");
	processTime(10*60+rand(30));
	addButton(0, "Next", ellieDelivery, undefined, "", "");
}

public function ellieLayOnNT(part:int = 0):void
{
	clearOutput();
	clearMenu();
	author("Wsan");
	
	switch(part)
	{
		case 0:	output("Your codex bleeps with the arrival of a message marked urgent. Tapping at the display, you read off the screen.");
				output("\n\n<i>“[pc.name], come pick me up at the store! We need to go to the nursery.");
				output("\n-Nephalee”</i>");
				output("\n\nYou puzzle over the name for a bit before realizing it’s Ellie, and what the message means. Time to get to the gift shop!");
				addButton(0, "Next", ellieLayOnNT, 1, "", "");
				return;
		
		case 1: moveTo("527");
				showLocationName();
				showBust("ELLIE");
				output("<i>“Heya, [pc.name],”</i> Ellie says with a wince, <i>“Reckon we should get to the Nursery pretty quick.”</i>");
				output("\n\n<i>“Got it. C’mon, I’ll take you there,”</i> you say, beckoning her to you.");
				output("\n\nSupporting her on your shoulder, you get the taurgirl onto your ship and jet to Tavros. The lift seems to take forever when you have a heavily pregnant leithan with you, but you’re there soon enough. You get her into a birthing room and wait with her, holding her hand.");
				processTime(10);
				addButton(0, "Next", ellieDelivery, undefined, "", "");
				return;
	}
}

public function ellieLayPlayerOffNT():void
{
	clearMenu();
	author("Wsan");
	
	output("\n\nYour codex bleeps with the arrival of a message marked urgent.");
	output("\n\n<i>“Hi [pc.name]! By the time you get this message I’ll probably be at the Nursery. Come see me!");
	output("\n-Nephalee”</i>");
	output("\n\nYou puzzle over the name for a bit before realizing it’s Ellie, and what the message means. Time to get to the Nursery!");
	if(rooms[currentLocation].planet == "TAVROS STATION") 
	{
		output("\n\nYou hustle back out of your ship and head to the lift.");
		processTime(5);
	}
	else 
	{
		output("\n\nYou hop into your captain’s seat and jet to Tavros.");
		processTime(10*60+rand(30));
	}
	
	addButton(0, "Next", ellieDelivery, undefined, "", "");
}

public function ellieDelivery():void
{
	moveTo("NURSERYG4");
	showLocationName();
	
	clearOutput();
	clearMenu();
	author("Wsan");
	showBust("ELLIE");
	//showName("\nELLIE");
	
	output("The process is long and arduous, but by the end of it, Ellie’s successfully delivered three giant eggs. The nursebots clean her up while she lies on a little bunch of pillows, sweaty and huffing, still clutching your hand. She watches her eggs be carried off to a temperature-regulated room to ensure their growth, then sighs and flops on her side.");
	output("\n\n<i>“Sleepy now,”</i> Ellie mumbles, pulling you close. You lie against the tired leithan as she cuddles you like an oversized teddy bear, enjoying your warmth and closeness. She’s asleep in seconds, her chest rising and falling with every breath. Settling in, you prepare to keep the tired mom company for the night. You stroke her back, pondering the fact you and Ellie now have three children together. It’s been a hell of a day, but at least nothing went wrong. As the ambient lighting in the room dims to simulate sunset, you find yourself thinking of names for the kids...");
	output("\n\nWhen “daylight” comes, it finds the two of you draped over each other in an intermingled mess of limbs. It’s Ellie who wakes first, slowly opening her eyelids to see your softly-snoring countenance. She smiles and gently pokes your cheek until you wake from your slumber.");
	output("\n\n<i>“Huh- oh,”</i> you say, stifling a yawn. <i>“Hey babe. How’re you feeling?”</i>");
	output("\n\n<i>“I feel great,”</i> Ellie says, planting an affectionate kiss on your lips. <i>“Mind if we go check on the kids?”</i>");
	output("\n\nYou nod and escort her to the incubation room, the door sliding open with a hiss after it identifies you. The eggs are safely contained behind a plexiglass window. Ellie stands in front of them and gazes longingly at the speckled eggs, as if expecting them to hatch right then and there. Standing next to her, you feel a bump at your side and find her holding her hand out. You grasp it and squeeze, feeling her intertwine her fingers with yours. You stand like that for a while, just basking in each other’s company, when you sneak a sideways glance at her and notice she’s.... crying?");
	output("\n\n<i>“Ellie?”</i>");
	output("\n\n<i>“Sorry, I just-”</i> she says tearfully, waving a hand around. <i>“My feelings, and- and the kids, and I’m just so happyyyy,”</i> she sobs, bawling into your shoulder.");
	output("\n\nYou wrap your arms around her as she cries in happiness, letting out all the bottled-up feelings about her family and children.");
	output("\n\n<i>“I just always wanted kids of my own,”</i> Ellie sniffles when she’s recovered. <i>“My own little family.”</i>");
	output("\n\n<i>“You got your wish,”</i> you say, putting an arm around her waist and pulling her closer. <i>“They’ll all be frolicking around the Nursery soon enough, bothering the nurses" + (ChildManager.numChildrenAtNursery() > 0 ? " and the other kids" : "") + ".”</i>");
	output("\n\n<i>“Yeah,”</i> Ellie giggles, wiping away her tears. <i>“It’s gonna be so much fun. Thanks, [pc.name].”</i>");
	output("\n\n<i>“Remember, you can come in here any time you like,”</i> you say. <i>“If you wanna play with any of the kids." + (ChildManager.numOfTypeInRange(GLOBAL.TYPE_MILODAN, 0, 16) > 0 ? " Especially the Milodan pups,”</i> you add. <i>“They could use another mom" : "") + ".”</i>");
	output("\n\n<i>“Uh huh,”</i> she nods, bouncing. <i>“Like I said, Tee said I was good to visit whenever I wanted, so I’ll probably be in here a lot.”</i>");
	if(ChildManager.numOfTypeInRange(GLOBAL.TYPE_MILODAN, 0, 16) > 0)
	{
		output("\n\nShe cocks her head. <i>“And what’s a Milodan?”</i>");
		output("\n\n<i>“The fluffy puppies... right, you wouldn’t have seen them. Here, I’ll show you.”</i>");
		output("\n\n<i>“Omigosh! They’re so cute!”</i> Ellie squeals, gently picking up one of the pups. It squeaks and promptly bats her on the nose with a padded paw. <i>“Don’t you hit your mommy,”</i> Ellie chides the pup, who looks suitably admonished before burping in her face and giggling.");
		output("\n\n<i>“Aww,”</i> Ellie coos, tickling the pup before laying it back on the ground. <i>“So fluffy...”</i>");
	}
	output("\n\nEllie decides to go back to sleep before she goes back to New Texas, having earned some much-needed rest. You accompany her back to bed and pull the blankets over her, deciding to keep her company during her repose. With how much family means to Ellie, you think she’ll appreciate waking up and seeing you’re still there for her.");
	
	processTime(3*60+rand(30));
	flags["ELLIE_OPERATION"] = 3;
	flags["ELLIE_LAYING_PC_MIA"] = undefined;
	
	addButton(0, "Next", ellieJustLayedMassiveEggsHowIsHerPussyEvenGunnaGripYou, undefined, "", "");
}

public function ellieJustLayedMassiveEggsHowIsHerPussyEvenGunnaGripYou():void
{
	clearOutput();
	clearMenu();
	author("Wsan");
	showBust("ELLIE" + (pc.hasCock() ? "_NUDE" : ""));
	showName("\nELLIE");
	
	processTime(90+rand(30));
		
	output("When she does awaken, you’re still in the room, idly tapping at your codex.");
	output("\n\n<i>“Morning, sleepyhead,”</i> you joke.");
	output("\n\n<i>“Goob mordig,”</i> Ellie yawns, stretching out in the bed and relaxing. <i>“I dun wanna get up yet.”</i>");
	output("\n\n<i>“Fair enough,”</i> you nod. You suddenly realize how clear-headed your interactions with Ellie have been recently, and wonder. <i>“Are your pheromones gone?”</i>");
	output("\n\n<i>“Yup,”</i> Ellie says. <i>“I think when I got pregnant, my body realized I didn’t need to be walking around in heat all the time. Guess that means I’m not getting pregnant again any time soon, either. Oh well!”</i>");
	if(pc.hasCock())
	{
		output("\n\n<i>“So that’s why there were less bulls around the shop,”</i> you muse. <i>“Is your sex drive still the same?”</i>");
		output("\n\n<i>“Wanna find out?”</i> Ellie grins, pushing the blankets off herself.");
		pc.changeLust(33);
	}
	
	addButton(0, "Next", ellieLoveFindsAWay, undefined, "", "");
}

public function ellieLoveFindsAWay():void
{
	clearOutput();
	clearMenu();
	author("Wsan");
	showBust("ELLIE" + (pc.hasCock() ? "_NUDE" : ""));
	showName("\nELLIE");
	
	if(pc.hasCock())
	{
		if(pc.isBimbo()) output("<i>“Tha’ssa yes, then,”</i> you pant,");
		else if(pc.isMale() && pc.isTreated()) output("<i>“So yes, then,”</i> you grunt,");
		else output("<i>“That’s a yes,”</i> you pant,");
		output(" pulling your [pc.cock] from Ellie’s dripping pussy hours later. She moans low in satisfaction when she feels you pop free, fresh spunk running down her hindlegs.");
		output("\n\n<i>“Ooh, that was good...”</i> Ellie sighs, looking back at you with eyes lidded in loving affection. <i>“You are </i>definitely<i> my favorite.”</i>");
		output("\n\n<i>“And don’t you forget it,”</i> you say with a wink.");
		output("\n\n");
		processTime(3*60+rand(30));
		pc.orgasm();
	}
	else processTime(5+rand(5));
	
	output("After cleaning up, you’re getting ready to take Ellie back to New Texas.");
	output("\n\n<i>“You sure you wanna go back right away? It’s only been a couple days since you gave birth,”</i> you ask her.");
	output("\n\n<i>“It’s okay, us Treated taurgirls are built tough,”</i> Ellie says, kissing you on the cheek. <i>“Thank you for worrying though, sugar.”</i>");
	output("\n\n<i>“Well, as long as you’re sure.”</i>");
	output("\n\n<i>“I’ll be back soon to check on the eggs pretty often anyway,”</i> she reminds you.");
	
	addButton(0, "Next", ellieReturnToNewTexas, undefined, "", "");
}

public function ellieReturnToNewTexas():void
{
	moveTo("527");
	showLocationName();
	shipLocation = "500";
	if(!pc.hasStatusEffect("Disarmed")) pc.createStatusEffect("Disarmed",4,0,0,0,false,"Blocked","You’ve checked all forms of weaponry at New Texas’ customs.",false,0,0xFF0000);

	
	clearOutput();
	clearMenu();
	author("Wsan");
	showBust("ELLIE");
	showName("\nELLIE");
	
	output("Ellie prances onto the fertile, grassy fields of New Texas with pure, unbridled joy. You watch with a fond smile, the busty leithan throwing her hands in the air.");
	output("\n\n<i>“No place like home, huh?”</i> you call out, walking over to join her.");
	output("\n\nEllie turns to you, ");
	if(pc.isTaur()) output("sweeping you up in a hug that sends both of you rearing onto your hindlegs, holding each other up in the air.");
	else if(pc.tallness >= 7*12) output("giving you a hug that almost takes you off your feet.");
	else output("giving you a hug that takes you right off your feet and into her arms.");
	output(" <i>“Easy, girl,”</i> you laugh, hugging her back.");
	output("\n\n<i>“Oh, it’s nice to be home,”</i> she sighs, putting her head on your shoulder. <i>“Travelling is fun, but there’s no place like New Texas.”</i>");
	output("\n\n<i>“Listen, Ellie...”</i> you say, pulling back from the hug. <i>“I know family means a lot to you. Are you sure you’re okay with the kids growing up in the Nursery instead of here?”</i>");
	output("\n\n<i>“I thought about it,”</i> she admits, looking down. <i>“But I don’t know how much of a... a mother I can be here on New Texas anyway. I know it doesn’t make me a great person,”</i> she says softly, <i>“but it’s probably for the best that they grow up elsewhere.”</i>");
	output("\n\n<i>“Ellie, no,”</i> you tell her firmly. <i>“Giving your kids the opportunity to do what they want and recognizing that you might not have the means to be able to do so yourself is exactly what a good parent does.”</i> You gently pull her head back up and give her a kiss. <i>“Don’t beat yourself up over this.”</i>");
	output("\n\n<i>“Uh huh,”</i> she nods, then sighs deeply, the doubt in her eyes clearing up. <i>“You’re right. Thanks, [pc.name].”</i>");
	output("\n\n<i>“You’re gonna be a great mom, Ellie,”</i> you say, ruffling her hair. <i>“Don’t sweat it.”</i>");
	output("\n\n<i>“Are you going back out into space, [pc.name]? Actually...”</i> Ellie cocks her head to the side. <i>“I don’t even know what it is you do out there. Do you have a job?”</i>");
	output("\n\nLaughing, you explain that yes, you do have a job of sorts, and detail the circumstances behind your space travels. Ellie listens intently, or at least as intently as the Treatment lets her, and exclaims when you’re done.");
	output("\n\n<i>“Wow! That’s so cool, you’re like some kind of space cowboy!”</i> Ellie says, adventure glittering in her eyes. <i>“Gosh, you’re pretty amazing, [pc.name]. That sounds really hard.”</i>");
	output("\n\n<i>“The job has its upsides,”</i> you note, looking at one of them. <i>“Pretty leithan girls, for one.”</i>");
	output("\n\n<i>“Aww!”</i> Ellie giggles. <i>“You’re so sweet. Walk me back to my store?" + (!pc.isTaur() ? " I’ll give you a ride." : "") + "”</i>");
	if(pc.isTaur()) output("\n\nYou escort Ellie arm-in-arm back to her store, the bubbly leithan resting her head on your shoulder as you chat.");
	else
	{
		output("\n\nYou jump onto Ellie’s back, making a quip about how you’re used to riding her in a different sense and setting her giggling again. She takes your weight easily, and you have to admit the view from up here is quite nice. For one, if you crane forward a bit you can see right down her bra. You note that much like last time, people pay quite a bit of attention to a leithan being ridden right into town.");
		output("\n\n<i>“You said there was some significance to being ridden, right Ellie?”</i> you ask, bending down to talk to her.");
		output("\n\n<i>“It’s sort of a leithan culture thing?”</i> she says with a shrug. <i>“Like, you can fuck a whole bunch of different people but only the ones you let on your back are your lovers. It’s kinda complicated, to do with symbols and stuff. Like I said, Haley could tell you better.”</i>");
		output("\n\nWell, clearly even if Ellie doesn’t really know the details, she thinks you’re something special. You suppose that’s all that really matters.");
		output("\n\n<i>“Thanks, Ellie,”</i> you say, kissing the top of her head. She hums happily and you continue on to her little shop, hopping off before you enter.");
	}
	output("\n\nWhen the two of you get into the store and she gets back behind the counter, everything seems relatively normal. Big bulls and doe-eyed cowgirls are milling around the store talking and flirting, pheromones are in the air, and Ellie is behind the counter checking you out. You give her a wink and put an arm down on the counter, relaxing.");
	output("\n\n<i>“So,”</i> Ellie says, twirling a finger through her hair. <i>“You gonna leave me all by my little lonesome, darling?”</i>");
	output("\n\n<i>“I’m sure you’ll find some way to entertain yourself,”</i> you say with a grin. <i>“Besides, you know I’m not gonna leave you alone.”</i>");
	output("\n\nEllie smiles, leaning forward slightly and accidentally showing off the edges of her areolae. <i>“Just don’t be too surprised if I’m not here all the time. I’m gonna be taking trips to the Nursery every so often just to check on things, ‘kay?" + (ChildManager.numOfTypeInRange(GLOBAL.TYPE_MILODAN, 0, 16) > 0 ? " And maybe play around with the puppies." : "") + "”</i>");
	output("\n\n<i>“Hey, fine by me,”</i> you say, spreading your arms. <i>“We can visit it together too if you like.”</i>");
	output("\n\n<i>“Sounds fun,”</i> she says, giggling. <i>“Like a little outer-space picnic.”</i>");
	output("\n\nWhen you finish chatting, Ellie leans over for you to give her a kiss and gives you a happy wave. You jokingly tip your imaginary space-cowboy hat to her as you exit, setting her giggling. Breathing in the fresh air of the New Texan outdoors, you ponder your options.");
	
	processTime(10*60+rand(30));
	
	addButton(0, "Next", mainGameMenu, undefined, "", "");
}

public function toggleEllieLocation():void
{
	if(flags["ELLIE_AT_NURSERY"] == undefined) flags["ELLIE_AT_NURSERY"] = 1;
	else flags["ELLIE_AT_NURSERY"] = undefined;
	
	//If the hatching notification has been sent but player hasn't witnessed it yet Ellie is at the nursery waiting
	if(flags["ELLIE_OPERATION"] == 3 && flags["ELLIE_PREG_TIMER"] == 70) flags["ELLIE_AT_NURSERY"] = 1;
}

public function ellieAtNurseryPreHatch():void
{
	clearOutput();
	clearMenu();
	author("Wsan");
	showBust("ELLIE");
	showName("\nELLIE");
	
	if(ChildManager.numChildrenAtNursery() > 0)
	{
		output("You find Ellie, happily playing with your other kids, singing to them in a lilting tone and waving her hands from side to side. She looks so adorable like that and you don’t want to disturb them, so you stay hidden for a while and watch. She’s the picture of motherhood, effortlessly entertaining the children and mesmerizing them with her song. Soon enough, the kids are asleep and she gently scoops them up, getting ready to put them back in their cribs. She starts when she sees you, then smiles genially.");
		output("\n\n<i>“Let me just put them to bed,”</i> she whispers. You nod, and she goes to deposit her tiny, snoring cargo in their cots before returning. <i>“Looks like you caught me, [pc.name],”</i> Ellie says with a smile. <i>“I was just going to check on the eggs before I found the kids, and then I got distracted.”</i>");
		output("\n\n<i>“You look good with the kids,”</i> you say, smiling. <i>“Like you were meant to be a mom.”</i>");
		output("\n\n<i>“Aw, thanks, [pc.name],”</i> she says, a rare hint of shyness showing itself in her manner. <i>“I hope our kids think so too.”</i>");
		output("\n\n<i>“They will. I know it,”</i> you assure her, reaching out to hold her hand. <i>“Did you wanna go check on the eggs?”</i>");
		output("\n\n<i>“Right!”</i>");
	}
	else
	{
		output("You find Ellie milling about in the reception area, clearly deep in thought as she mumbles to herself.");
		output("\n\n<i>“Hey babe,”</i> you call out, walking over. <i>“Everything okay?”</i>");
		output("\n\n<i>“Oh, [pc.name]!”</i> Ellie says, surprised. <i>“I was just wondering whether I should call you over!”</i>");
		output("\n\n<i>“You know it’s fine for you to be here without me,”</i> you remind her.");
		output("\n\n<i>“I know, but it feels nicer to have you around,”</i> she says.");
		output("\n\n<i>“C’mon then,”</i> you say, reaching out to hold her hand. <i>“Let’s go check on the eggs.”</i>");
	}
	output("\n\nThe two of you stand and watch the eggs for a while. To races that don’t lay eggs, standing around and watching them might seem odd, but you suspect that most parents would understand. After a while, you turn to Ellie.");
	output("\n\n<i>“Thought of any good names yet?”</i>");
	output("\n\n<i>“I’m still thinking,”</i> she says, sighing. <i>“I know I’ll know them when I know them! I mean... I’ll figure it out.”</i>");
	output("\n\n<i>“Fair enough,”</i> you say, nodding.");
	output("\n\nAfter a few minutes, you and Ellie exit the room still holding hands. You spend a few minutes just chatting, then give her a kiss goodbye as she departs to get back to New Texas. She leaves you with a fuzzy feeling in your stomach and a smile on your face.");
	
	processTime(20+rand(10));
	flags["ELLIE_AT_NURSERY"] = undefined;
	addButton(0, "Next", mainGameMenu, undefined, "", "");
}

public function ellieTakeOnTripToNursery(part:int = 0):void
{
	clearOutput();
	clearMenu();
	author("Wsan");
	showBust("ELLIE");
	showName("\nELLIE");
	
	switch(part)
	{
		case 0:	output("<i>“Wanna go check on the kids?”</i>");
				output("\n\n<i>“Sure! Gosh, I can’t wait until they’re born,”</i> Ellie says, coming around the counter. <i>“It’s gonna be so much fun.”</i>");
				addButton(0, "Next", ellieTakeOnTripToNursery, ++part, "", "");
				break;
		
		case 1:	moveTo("NURSERYE14");
				showLocationName();
				shipLocation = "TAVROS HANGAR";
				output("The two of you arrive at the Nursery shortly, walking into the reception area ");
				if(ChildManager.numChildrenAtNursery() > 0)
				{
					output("where you’re waylaid by some of your other kids. As small as they are, they don’t really get around much, but they’re adorable enough that you’re effectively their captives. You and Ellie sit to play with them, lifting the giggling children above your head and swaying them from side to side as Ellie sings. Before too long, they’ve fallen asleep in your hands, and you give them to the staff that carries them back to their cots.");
					output("\n\n<i>“Your kids are so cute,”</i> Ellie says, watching them go. <i>“They’re like little angels!”</i>");
					output("\n\n<i>“They are,”</i> you agree. <i>“Want to go see ours?”</i>");
					output("\n\n<i>“Uh huh!”</i> Ellie nods, and you walk her to the incubation room.");
				}
				else
				{
					output("where you say hi to Briget. You spend a few minutes chatting with Ellie and her, giving Ellie the rundown on how stuff works around the Nursery.");
					output("\n\n<i>“Your father must have really loved you to have left you all this,”</i> Ellie marvels, looking down one of the hallways.");
					output("\n\n<i>“Victor was a good man,”</i> says Briget, smiling. <i>“He would have liked you a lot, Ellie. He loved people with a fondness for life.”</i>");
				}
				output("\n\nThe two of you stand and watch the eggs for a while. To races that don’t lay eggs, standing around and watching them might seem odd, but you suspect that most parents would understand. After a while, you turn to Ellie.");
				output("\n\n<i>“Thought of any good names yet?”</i>");
				output("\n\n<i>“I’m still thinking,”</i> she says, sighing. <i>“I know I’ll know them when I know them! I mean... I’ll figure it out.”</i>");
				output("\n\n<i>“Fair enough,”</i> you say, nodding.");
				output("\n\nAfter a few minutes, you and Ellie exit the room still holding hands. You spend a few minutes just chatting, then give her a kiss goodbye as she departs to get back to New Texas. She leaves you with a fuzzy feeling in your stomach and a smile on your face.");
				pc.removeStatusEffect("Disarmed");
				processTime(10*60+rand(30));
				addButton(0, "Next", mainGameMenu, undefined, "", "");
				break;
	}
}

public function ellieEggsHatching():Boolean
{
	clearOutput();
	clearMenu();
	author("Wsan");
	showBust("ELLIE");
	showName("\nELLIE");
	
	output("You walk into the lobby to find Ellie, pacing about and looking anxious. She looks up when she hears the door slide open and bounds towards you, bouncing across the tiled floor.");
	output("\n\n<i>“[pc.name]! They’re gonna hatch!”</i>");
	output("\n\n<i>“I know, I got here as fast as I could,”</i> you say, giving her a hug. <i>“Let’s go see them, okay?”</i>");
	output("\n\nThe cover on the incubation chamber slides back and the tray protrudes outward, revealing the large eggs as they begin to shake. You find yourself holding your breath with Ellie as cracks begin to appear on their surface, little tapping noises and squeaks coming from within. You briefly consider helping them out of their eggs, but a look at Ellie’s expression stops you. Her eyes are hopeful, but her jaw is set; they should break out of them on their own.");
	output("\n\nThe first reveals itself by way of slipping its tail through a crack and backing out, falling over onto its haunches and squawking in distress. Ellie scoops it up and deposits the foal back on its shaky feet, giving the two of you a good look at it.");
	output("\n\nYour first child is a boy, ");
	if(pc.hasScales()) output("with a little layer of [pc.skinFurScales] - just like yours - in a tiny diamond underneath his left eye.");
	else if(pc.hasFur()) output("with a tiny tuft of [pc.skinFurScales] - just like yours - sprouting from his chest.");
	else if(pc.skinTone == "gray") output("with a small splotch of differently-colored skin across his stomach that’s identical to yours.");
	else output("the gray of his leithan skin fading in a gradient to the [pc.skinColor] of yours across his lower half.");
	output(" He has beautiful blue eyes, just like Ellie, and he uses them to look between you and her, his curiosity palpable.");
	output("\n\n<i>“Mommy,”</i> Ellie says, smiling and pointing at herself. <i>“Can you say mommy?”</i>");
	output("\n\n<i>“Mu-mu,”</i> the child chants, waving his arms up and down excitedly and setting Ellie giggling.");
	output("\n\nShe sits and pulls him forward in a gentle hug, your son’s head perched on her shoulder as he looks up at you inquisitively.");
	output("\n\n<i>“Mu-mu?”</i> he asks.");
	output("\n\n<i>“No,”</i> you laugh, shaking your head. <i>“I’m daddy" + (pc.isHerm() ? ", I guess" : "") + ". Can you say daddy?”</i>");
	output("\n\nThe boy casts his eyes downwards, thinking hard, before looking back up. <i>“Da-du?”</i>");
	output("\n\n<i>“Close enough, buddy,”</i> you grin. He grins back.");
	output("\n\nWith your new child in tow, the three of you watch the other two eggs. Two little heads pop out of the tops simultaneously, chirping and looking around their new surroundings. They box the rest of the eggs away and emerge into the world, already holding each other’s hands. It looks like you have two wonderful little girls, practically attached at the hip. The one on the left has eyes exactly like Ellie’s, while the one on the right has heterochromia - her right eye has a faint coloration reminiscent of yours. Both of them have ");
	if(pc.hasScales()) output("a little spot of [pc.skinFurScales] on their foreheads");
	else if(pc.hasFur()) output("a tuft of [pc.skinFurScales] on their chest");
	else output("skin closer to the color of yours instead of Ellie’s gray, too");
	output(".");
	output("\n\nThe girls make their way over to you and Ellie for hugs, and you sweep your kids into your arms. United with your little family, you can’t help but wonder if perhaps this was what your father should have been looking for all along. The girls giggle while the boy struggles out of your grip, already curious about the rest of the world around him.");
	output("\n\n<i>“So,”</i> you say to Ellie. <i>“Decided on names?”</i>");
	
	processTime(10);
	
	addButton(0, "Next", ellieNameYourKiddos, undefined, "", "");
	
	return true;
}

public function ellieBirth():void
{
	//Ellie's kids are much more pre-defined than others
	var traitChar:Creature = chars["PC_BABY"];
	var a:UniqueChild = new EllieUniqueChild();
	var b:UniqueChild = new EllieUniqueChild();
	var c:UniqueChild = new EllieUniqueChild();
	
	a.RaceType = b.RaceType = c.RaceType = GLOBAL.TYPE_LEITHAN;
	a.NumMale = 1;
	b.NumFemale = 1;
	c.NumFemale = 1;
	a.originalRace = b.originalRace = c.originalRace = c.hybridizeRace(c.originalRace, pc.originalRace, true);
	
	a.Name = flags["ELLIE_KID1"];
	b.Name = flags["ELLIE_KID2"];
	c.Name = flags["ELLIE_KID3"];
	
	// I'm too lazy to even make a for loop to do this shit
	if(rand(2) == 0) a.skinTone = b.skinTone = c.skinTone = traitChar.skinTone;
	if(rand(2) == 0) a.lipColor = b.lipColor = c.lipColor = traitChar.lipColor;
	if(rand(2) == 0) a.nippleColor = b.nippleColor = c.nippleColor = traitChar.nippleColor;
	if(rand(2) == 0) a.eyeColor = b.eyeColor = c.eyeColor = traitChar.eyeColor;
	if(traitChar.hairColor != "NOT SET" && rand(2) == 0) a.hairColor = b.hairColor = c.hairColor = traitChar.hairColor;
	if(traitChar.furColor != "NOT SET" && rand(2) == 0) a.furColor = b.furColor = c.furColor = traitChar.furColor;
	
	a.MaturationRate = b.MaturationRate = c.MaturationRate = 1.0;
	a.BornTimestamp = GetGameTimestamp();
	//the girls are born a little after idk
	b.BornTimestamp = c.BornTimestamp = GetGameTimestamp() + 2;
	ChildManager.addChild(a);
	ChildManager.addChild(b);
	ChildManager.addChild(c);

	flags["ELLIE_TOTAL_KIDS"] = 3;
	flags["ELLIE_OPERATION"] = 4;
	
	StatTracking.track("pregnancy/ellie sired", flags["ELLIE_TOTAL_KIDS"]);
	StatTracking.track("pregnancy/total sired", flags["ELLIE_TOTAL_KIDS"]);
	StatTracking.track("pregnancy/total day care", flags["ELLIE_TOTAL_KIDS"]);
}

public function ellieNameYourKiddos(kiddo:int = 0):void
{
	clearOutput();
	clearMenu();
	author("Wsan");
	showBust("ELLIE");
	showName("\nELLIE");
	
	switch(kiddo)
	{
		case 0:	output("What should your first kid with Ellie, the male one, be named?\n\n(No bracket or escape characters" + (!silly ? ", and max of 16 charcters" : "") + ")");
				displayInput();
				output("\n\n\n");
				addButton(0, "Next", ellieNameYourKiddos, ++kiddo, "", "");
				break;
				
		case 1:	if(hasIllegalInput(userInterface.textInput.text))
				{
					ellieNameYourKiddos(0);
					break;
				}
				if(!silly &&userInterface.textInput.text.length > 20)
				{
					ellieNameYourKiddos(0);
					break;
				}
				flags["ELLIE_KID1"] = userInterface.textInput.text;
				output("What should your second kid with Ellie, the female one with Ellie’s eyes, be named?\n\n(No bracket or escape characters" + (!silly ? ", and max of 16 charcters" : "") + ")");
				displayInput();
				output("\n\n\n");
				addButton(0, "Next", ellieNameYourKiddos, ++kiddo, "", "");
				break;
				
		case 2:	if(hasIllegalInput(userInterface.textInput.text))
				{
					ellieNameYourKiddos(1);
					break;
				}
				if(!silly && userInterface.textInput.length > 20) 
				{
					ellieNameYourKiddos(1); 
					break;
				}
				flags["ELLIE_KID2"] = userInterface.textInput.text;
				output("What should your third kid with Ellie, the female one with heterochromia, be named\n\n(No bracket or escape characters" + (!silly ? ", and max of 16 charcters" : "") + ")");
				displayInput();
				output("\n\n\n");
				addButton(0, "Next", ellieNameYourKiddos, ++kiddo, "", "");
				break;
				
		case 3:	if(hasIllegalInput(userInterface.textInput.text)) 
				{
					ellieNameYourKiddos(2); 
					break;
				}
				if(!silly && userInterface.textInput.length > 20) 
				{
					ellieNameYourKiddos(2); 
					break;
				}
				flags["ELLIE_KID3"] = userInterface.textInput.text;
				ellieTheseKidNamesSuckAss();
				break;
				
		default:output("<b>YOU SHOULD’NT BE HERE MORTAL.</b>");
	}
}

public function ellieTheseKidNamesSuckAss():void
{
	ellieBirth();
	
	removeInput();
	clearOutput();
	clearMenu();
	author("Wsan");
	showBust("ELLIE");
	showName("\nELLIE");
	
	output("<i>“Uh huh!”</i> she declares. <i>“The boy is " + flags["ELLIE_KID1"] + ", this one is " + flags["ELLIE_KID2"] + ",”</i> she says, indicating each child by rubbing their head, <i>“and she’s " + flags["ELLIE_KID3"] + "!”</i>");
	output("\n\nHaving partaken in the little formalities of being born like receiving a name, it looks like all your kids want to do for now is go back to sleep. You can understand the sentiment; sometimes exploring new worlds has to take a backseat. Curling up on their pillows, they lie together in a cute little mess of limbs and tails, all tangled together. You put a fluffy blanket over them and pull back, letting them rest. Being born is probably pretty exhausting, you imagine.");
	output("\n\n<i>“They’re cute, aren’t they?”</i> you murmur to Ellie, who’s watching them intently.");
	output("\n\n<i>“They are! I just wanna pick them up and pet them,”</i> she whispers back, squeezing your shoulder.");
	output("\n\n<i>“You’d better not,”</i> you warn jokingly, smiling down at your kids. <i>“They’ll never get back to sleep. Although you could probably fit at least two of them between these,”</i> you continue, looping an arm around her shoulders to softly lift one of her giant breasts.");
	output("\n\n<i>“Oooh,”</i> moans Ellie, leaning into your grip. <i>“What do you say we go celebrate..?”</i>");
	
	pc.changeLust(20);
	processTime(5);
	
	addButton(0, "Next", ellieReallyYoureAlreadyHorny, undefined, "", "");
}

public function ellieReallyYoureAlreadyHorny():void
{
	clearOutput();
	clearMenu();
	author("Wsan");
	showBust("ELLIE");
	showName("\nELLIE");
	
	output("You emerge flushed and still breathing hard from the private quarters a few hours later, having indulged Ellie’s celebration request thoroughly enough to leave her almost comatose in post-orgasmic bliss. She might be missing the pheromones, but she’s still the sexiest - and horniest - woman you know. And the mother of your kids, whom you note are still sleeping. You take some time to just watch their little chests rise and fall, soft breaths syncing up like they really are joined at the hip, and your mind drifts as your eyes glaze over.");
	output("\n\nThe reality of having intelligent children is... well, difficult. They’ll be well taken care of, no doubt of that. But how often can you be there for them? How many of their special moments are you going to miss, flying through space to lay claim to an inheritance? Well, at least they were born able to speak. You didn’t miss that. You can only hope your journey is a matter of weeks or months, rather than years or... decades.");
	output("\n\nYou shake your head. No point thinking about this - what’s done is done, and besides, your father wouldn’t do that to you. This was intended to be an adventure of self-discovery, courtesy of dad, not a mythical trial. He <i>knew</i> you could do it. And you will. Watching your kids, you silently clench a fist and vow to be there for them, the way your dad made time for you even as a CEO. It’s the right thing to do.");
	output("\n\nAssured that your children are sleeping well, you return to your room to rest beside Ellie. She’ll be a great help, too. You already know she’ll be an amazing mother, as ditzy as she is. Her heart is in the right place, that’s for sure. You curl an arm around her on the bed and relax, her sleepy mumble putting a smile on your face.");
	
	pc.orgasm();
	processTime(60+rand(20));
	
	addButton(0, "Next", ellieWhereDoWeGoFromHere, undefined, "", "");
}

public function ellieWhereDoWeGoFromHere():void
{
	clearOutput();
	clearMenu();
	author("Wsan");
	showBust("ELLIE");
	showName("\nELLIE");
	
	output("The next day, you’re making preparations to leave, having talked with Ellie. She’s decided to stay here just for a little while, to take care of the kids and make sure they’re doing okay. They’ll be taken care of by the staff, you know that for sure, but it makes you glad to see just how much she cares. Not a minute goes by that she isn’t using her boisterous energy to fuss over them, keeping them entertained. " + (ChildManager.numChildrenAtNursery() > 3 ? "Your other kids aren’t exempt from the Ellie experience, either, treated as just one of the pack." : "") + "");
	output("\n\nWhen it’s time to go, you call out to Ellie and she puts " + flags["ELLIE_KID3"] + " down, who watches the two of you with curiosity, her heterochromic eyes wide. You give her a reassuring smile before turning to Ellie.");
	output("\n\n<i>“I should get back out there.”</i>");
	output("\n\n<i>“I know,”</i> Ellie nods, looking at you with a smile. <i>“You’ll be back, right?”</i>");
	output("\n\n<i>“I will. I love you, okay? I’ll visit as often as I can.”</i>");
	output("\n\n<i>“Oh,”</i> she says, a hitch in her voice as she turns away. <i>“Sorry, hearing you say that just- there’s something in my eye...”</i>");
	output("\n\n<i>“Ellie,”</i> you say softly, and she turns back to look at you. Her beautiful blue eyes are welling with tears, and you give her a gentle smile. <i>“I won’t desert you. The kids are a lifelong commitment, and it’s a path we’ll walk together. The two of us. That’s what I mean when I say I love you, Ellie.”</i>");
	output("\n\nHer jaw quivers momentarily before she throws herself into your chest, weeping silently. You smile and embrace her, running your hands through her hair to comfort her. For all the love she gets on New Texas, it’s a bit different coming from the father of her children, and always will be. You look down to see the kids clustered around your feet, looking up at you accusingly.");
	output("\n\n<i>“I didn’t make her cry,”</i> you protest, trying to explain, drawing a giggle from Ellie.");
	output("\n\nShe unearths her head from your chest and smiles down at the kids through drying tears. <i>“I’m fine, your father just made me a very happy girl is all. Sometimes we cry when we’re happy too!”</i>");
	output("\n\nYou crouch down and swiftly scoop the kids into a hug, planting a kiss on each of their foreheads and smiling. <i>“Daddy has to leave now. Can you be good for mommy?”</i>");
	output("\n\nThey nod one by one, and you tighten your grip before letting them go. They scamper back to the play area, woes already forgotten, leaving you with Ellie.");
	output("\n\n<i>“Okay,”</i> you say, getting back up. <i>“I’m off.”</i>");
	output("\n\n<i>“Bye, [pc.name],”</i> Ellie murmurs, planting a soft kiss on your cheek. <i>“I’ll see you soon. Be safe out there.”</i>");
	output("\n\nYou muss her hair a bit and lean in as she pulls back, kissing her on the lips before you leave. She smiles at your back until you disappear from view, turning a corner towards the elevators.");
	output("\n\nAlone for the first time in a while, you sigh and turn your mind back to-");
	output("\n\n<i>“Oh, [pc.name]! Wait!”</i> you hear from behind you, and turn as the elevator dings, the doors opening.");
	output("\n\n<i>“Ellie?”</i> you ask, as she skitters to a stop at the other end of the corridor.");
	output("\n\n<i>“I forgot to tell you,”</i> she says, hand clenched beneath her bosom as she fixes you with a gentle smile you will never forget. <i>“I love you too.”</i>");
	output("\n\n<i>“I know,”</i> you call back with a smile. <i>“I’ll see you soon, Ellie.”</i>");
	output("\n\nEllie watches the elevator doors close and carry her love away, back to " + pc.mf("his","her") + " adventure and the smile that was on her face fades slightly, but remains in place. Yes, it will be lonely without [pc.name] around. But they’ll be back, she knows in her heart. [pc.name] never lies. She turns back to the nursery and walks into the play area, finding the kids littered about in various lazy positions.");
	output("\n\n<i>“Who wants to play?”</i> she coos.");
	output("\n\nA chorus of squees rings out, and her children surround her as she giggles.");
	
	processTime(12*60+rand(60));
	
	addButton(0, "Next", ellieTakeGoodCareOfTheKiddosWhenImGone, undefined, "", "");
}

public function ellieTakeGoodCareOfTheKiddosWhenImGone():void
{
	clearOutput();
	clearMenu();
	clearBust();
	author("Wsan");
	
	moveTo("LIFT: MERCHANT DECK");
	showLocationName();
	
	output("Back on the merchant floor, you glance back up at the building you came out of. Truth be told, you feel a little lonely already. But she’ll still be there when you return, and so will the kids. You made a vow for them, too. Turning away, you set your mind back on business.");
	
	processTime(15);
	
	addButton(0, "Next", mainGameMenu, undefined, "", "");
}

public function ellieKidVisits(button:int):int
{
	if(flags["ELLIE_OPERATION"] == 4)
	{
		addButton(button,"Ellie Kids",ellieTinytaurPlaytime, undefined, "Ellie Kids", "Spend some time with your tiny-taurs!");
		button++;
	}
	return button;
}

public function ellieTinytaurPlaytime():void
{
	clearOutput();
	clearMenu();
	author("Wsan");
	showName("\nELLIE’S KIDS");
	
	switch(rand(3))
	{
		case 0:	output("You walk through the nursery to look for the leithan children, approaching their room and stepping through the door. It quietly hisses open, and you’re somewhat surprised to be greeted with complete silence. The door closes behind you, leaving you to silently pad over to where the cots are set up. The first two you check are suspiciously devoid of any leithan children, but before alarm can take hold of you, you check the third cot.");
				output("\n\nThe two sisters are wrapped around their brother in a gangly little mess of limbs, snoozing lightly. He seems to be doing okay, even with the legs splayed across his face. You think about gently prying them apart, but decide to leave them be. You spend some idle time watching their tiny chests gently rise and fall.");
				output("\n\nAt one point, " + flags["ELLIE_KID1"] + " awakens, blearily looking up at you. You smile down at him, his eyes fluttering until they lightly fall closed once more, and he drifts back to sleep. You decide to let them get their rest, and step outside.");
				processTime(15+rand(7));
				addButton(0, "Next", mainGameMenu, undefined, "", "");
				break;
				
		case 1:	if(flags["ELLIE_AT_NURSERY"] != undefined)
				{
					showName("ELLIE\n& KIDS");
					showBust("ELLIE");
					output("You walk through the door to be greeted by raucous noise and a flying leithan baby. " + flags["ELLIE_KID2"] + " squeals happily as Ellie catches her, clinging to her mom’s hands with her tiny fingers.");
					output("\n\n<i>“Hello ladies,”</i> you call, the door hissing shut behind you. " + flags["ELLIE_KID1"] + " peeks at you from behind one of Ellie’s legs. <i>“And gentleman.”</i>");
					output("\n\n<i>“[pc.name]! Hey, babe!”</i> Ellie waves energetically. <i>“Sorry, I’d come over and give you a hug but " + flags["ELLIE_KID3"] + " is wrapped around my legs.”</i>");
					output("\n\nShe holds out her left mid and hindlegs, and you see that that is indeed the case. " + flags["ELLIE_KID3"] + " giggles as Ellie wiggles her legs around in midair, wobbling from side to side. <i>“Whatcha doin’, girl? Oof!”</i>");
					output("\n\nYou sweep Ellie into a loving hug along with " + flags["ELLIE_KID2"] + ", squeezing them tight. Ellie nuzzles against your neck, sighing in contentment and inhaling.");
					output("\n\n<i>“You smell nice,”</i> she murmurs dreamily.");
					output("\n\n<i>“Eau de Spaceship,”</i> you quip, kissing her cheek as she giggles. She sounds just like your kids. <i>“Having fun?”</i>");
					output("\n\n<i>“Uh huh,”</i> she nods, slowly pulling back with her hand still on your arm. <i>“They were just waking up when I got here, so now I’m tiring them out again.”</i>");
					output("\n\n<i>“Sounds like a plan!”</i>");
					output("\n\nThe two of you spend some time frolicking with your kids, rolling around and tickling them into fits of laughter. Eventually, all three of them are tired enough for a nap, so you put them back in their cots and kiss them good night. You and Ellie head to the break room for food and chitchat.");
					processTime(30+rand(10));
					addButton(0, "Next", ellieASeparateFunctionToCreateABarrierBetweenKidsAndLewds, undefined, "", "");
					break;
				}
				else
				{
					output("You walk through the door to be greeted by three little leithan heads turning to peer at you curiously, then a chorus of happy squeals. " + flags["ELLIE_KID1"] + ", " + flags["ELLIE_KID2"] + " and " + flags["ELLIE_KID3"] + " scamper across the floor to meet you with little leaps and bounds.");
					output("\n\n<i>“Haha, hello! What are you three up to, huh?”</i>");
					output("\n\nYou sweep the kids off the floor into a bear hug, rubbing their giggling forms with your face. Spotting their toys where they were congregated, you break into a grin. <i>“Looks like I got here just in time to play!”</i>");
					output("\n\nAt their insistence at going back ‘up’ when you put them down, you toss them into the air and catch them one after the other until their attention is redirected elsewhere. You spend some time playing with them and their toys until eventually, all three of them are tired enough for a nap. You softly deposit the sleepy leithans into their cots and pull the blankets up, giving them good night kisses and stepping outside for food. Playing with kids is hard work.");
					processTime(60+rand(25));
					addButton(0, "Next", mainGameMenu, undefined, "", "");
					break;
				}
				
		case 2:	if(flags["ELLIE_AT_NURSERY"] != undefined)
				{
					showName("ELLIE\n& KIDS");
					showBust("ELLIE");
					output("Stepping into the leithan nursery room, you immediately note the silence. Checking the cots just to make sure, you confirm your suspicions - the kids aren’t here. They’re probably with the staff. You step back outside and hear a small commotion down the hall. You turn your head to look and see " + flags["ELLIE_KID1"] + " scampering around the corner. You raise an eyebrow.");
					output("\n\n<i>“" + flags["ELLIE_KID1"] + " Steele, what are you running around for?”</i>");
					output("\n\nAt the sound of his full name he skids to a stop, but before anything else happens a familiar face peeks around the corner.");
					output("\n\n<i>“" + flags["ELLIE_KID1"] + "! Where are y- oh, [pc.name]! Hiya babe! Oh, you found him!”</i>");
					output("\n\n<i>“Ah, so you were making a getaway huh?”</i> you ask, scooping your son off the ground and into your arms. <i>“Nice try, kiddo. Hi babe.”</i>");
					output("\n\nYou give Ellie a kiss and hand her " + flags["ELLIE_KID1"] + ", whereupon " + flags["ELLIE_KID2"] + " and " + flags["ELLIE_KID3"] + " pop up on her shoulders.");
					output("\n\n<i>“Oh, hello! Hiding in mommy’s lovely hair, were we?”</i> you ask. <i>“Taking the kids exploring?”</i>");
					output("\n\n<i>“Wasn’t my idea so much as theirs,”</i> Ellie replies, giggling. <i>“They want to roam around, and " + flags["ELLIE_KID1"] + " seems to want to adventure on his own, even though he’s not allowed.”</i>");
					output("\n\n<i>“Oh well, the staff won’t mind, probably. Let’s go and take a look around, shall we?”</i>");
					output("\n\nYou and Ellie walk hand in hand through the nursery with your three kids hanging off your shoulders, checking out the rooms and waving at the inhabitants.");
					if(ChildManager.numChildrenAtNursery() > 3)
					{
						if(ChildManager.numOfTypeInRange(GLOBAL.TYPE_MILODAN, 0, 16) > 0) output("\n\nYou make a brief stop in what’s come to be known as the ‘Puproom’ around the nursery, and introduce your children. The milodan pupp" + (ChildManager.numOfTypeInRange(GLOBAL.TYPE_MILODAN, 0, 16) > 1 ? "ies are a source of great interest to the leithans, nuzzling at their" : "y is a source of great interest to the leithans, nuzzling at its") + " fluffy fur and receiving little bops on the nose for their efforts. You give " + (ChildManager.numOfTypeInRange(GLOBAL.TYPE_MILODAN, 0, 16) > 1 ? "them kisses" : "your furry child a kiss") + " before you tug the curious leithans away and head back to their room.");
						output("\n\n<i>“I’m glad you treat them the same way you treat ours, [pc.name],”</i> Ellie murmurs, rubbing against your shoulder. <i>“For some of them, you’re the only parent they’ll ever have.”</i>");
						output("\n\n<i>“Gotta share the love, right?”</i> you say with a smile. <i>“They’re all good kids.”</i>");
						output("\n\nEllie stops you in the middle of the hall and turns towards you, but before you can say anything she’s caught you in a deep, passionate kiss. She pulls back with a beautiful smile and shining eyes, and you find yourself smiling back at her. " + flags["ELLIE_KID1"] + " sticks his tongue out over your shoulder with a ‘blehhh’ and the two of you laugh.");
					}
					else
					{
						output("\n\nYou make some stops in various rooms as you show the kids around, getting them acquainted with the Nursery. The various staff are all very helpful and friendly, and handle the kids with practiced deftness. When the exploration comes to an end, you and Ellie are walking back to their rooms with sleepy kids in tow.");
						output("\n\n<i>“Do you think you’ll have other kids, [pc.name]?”</i> she asks, peering at your expression.");
						output("\n\n<i>“I don’t know myself, really,”</i> you shrug. <i>“Would you prefer it if I didn’t?”</i>");
						output("\n\n<i>“No!”</i> she gasps, squeezing your arm. <i>“[pc.name], you can’t just let love pass you by, even if it’s not only for me. Don’t feel like you gotta keep yourself cel- celebr- um, I’m okay with you having more kids. I think it would be fun to have more of them in the Nursery, and maybe I’ll even get to make friends with their mommies.”</i>");
						output("\n\nShe gives you a kiss on the cheek.");
						output("\n\n<i>“Or daddies,”</i> she adds after a pause, looking at you. <i>“I never know with you.”</i>");
					}
					processTime(30+rand(10));
					addButton(0, "Next", ellieASeparateFunctionToCreateABarrierBetweenKidsAndLewds2, undefined, "", "");
					break;
				}
				else
				{
					output("Stepping into the leithan nursery room, you immediately note the silence. Checking the cots just to make sure, you confirm your suspicions - the kids aren’t here. They’re probably with the staff. You step back outside and hear a small commotion down the hall. Following the noise around the corner, you happen upon a couple of staff members and your less-than-cooperative kids.");
					output("\n\n<i>“Hello! What’re you little monsters doing, hm?”</i>");
					output("\n\nAt the sound of your voice they turn and squeal in excitement, bounding over to you in eager joy. Upon chatting with the staff while picking them up, you find they were out exploring the Nursery just for fun. You decide to help them out, and soon enough you’re traveling from room to room with three leithan children draped over your shoulders and head, saying hi to staff and checking out the facilities.");
					if(ChildManager.numChildrenAtNursery() > 3)
					{
						if(ChildManager.numOfTypeInRange(GLOBAL.TYPE_MILODAN, 0, 16) > 0) output("\n\nYou make a brief stop in what’s come to be known as the ‘Puproom’ around the nursery, and introduce your children. The milodan pupp" + (ChildManager.numOfTypeInRange(GLOBAL.TYPE_MILODAN, 0, 16) > 1 ? "ies are a source of great interest to the leithans, nuzzling at their" : "y is a source of great interest to the leithans, nuzzling at its") + " fluffy fur and receiving little bops on the nose for their efforts. You give " + (ChildManager.numOfTypeInRange(GLOBAL.TYPE_MILODAN, 0, 16) > 1 ? "them kisses" : "your furry child a kiss") + " before you tug the curious leithans away and head back to their room.");
						output("\n\nYou stop in the hallway and reach back to pet them, just to make sure they’re still awake.");
						output("\n\n<i>“Make sure you treat the other kids well, you three,”</i> you tell them. <i>“Not all of them have the advantage of having both parents, but they still belong to our family, okay? Be nice.”</i>");
						output("\n\nYou’re not sure they’ll remember given their sleepy responses, or that they really understand what you’re telling them, but you’d like to think they’ll take the message to heart. A warm and accepting home is part of any proper childhood, as you yourself know well.");
						output("\n\nYou plop the snoozing leithans into their cots and pull their blankets up, tucking them in tight before kissing them good night.");
					}
					else
					{
						output("\n\nAfter the tour, you’re taking your sleepy kids back to their room to nap when you stop in the hallway and reach back to pet them, checking if they’re still awake.");
						output("\n\n<i>“If other kids show up in the Nursery, make sure to welcome them to the family, okay? They might not be lucky enough to have both parents around. Some of them might be from worlds where...”</i> you trail off as you realize your kids won’t be able to grasp the concept of being born into a hostile environment. <i>“Well, just be nice. You’ll be fine.”</i>");
						output("\n\nYou’re not sure they’ll remember given their sleepy responses, or that they really understand what you’re telling them, but you’d like to think they’ll take the message to heart. A warm and accepting home is part of any proper childhood, as you yourself know well.");
						output("\n\nYou plop the snoozing leithans into their cots and pull their blankets up, tucking them in tight before kissing them good night.");
					}
					processTime(60+rand(25));
					addButton(0, "Next", mainGameMenu, undefined, "", "");
					break;
				}
	}
}

public function ellieASeparateFunctionToCreateABarrierBetweenKidsAndLewds():void
{
	clearOutput();
	clearMenu();
	author("Wsan");
	showBust("ELLIE_NUDE");
	showName("\nELLIE");

	output("<i>“You know...”</i> Ellie begins, her eyes sweeping up your body in a decidedly unsubtle fashion, <i>“it makes me weak in the knees when I see you being so good with the kids, [pc.name].”</i> She draws closer, pressing her massive breasts up against your chest as she whispers. <i>“Why don’t mommy and daddy go have some fun of their own?”</i>");
	output("\n\n<i>“Sounds good,”</i> you murmur in agreement, giving the appreciative ‘taurgirl a squeeze, and head to a spare room.");
	output("\n\nWhen you’re finally finished giving Ellie the hard, sweaty fucking she’s looking for, she collapses onto the bed, sated. You give her a kiss and step out, leaving her to nap.");
	
	processTime(30+rand(15));
	pc.orgasm();
	addButton(0, "Next", mainGameMenu, undefined, "", "");
}

public function ellieASeparateFunctionToCreateABarrierBetweenKidsAndLewds2():void
{
	clearOutput();
	clearMenu();
	author("Wsan");
	showBust("ELLIE_NUDE");
	showName("\nELLIE");
	
	output("After you put the kids to bed, you’re hanging out with Ellie and chatting.");
	output("\n\n<i>“You know, speaking of having more kids...”</i> you begin, slipping an arm around her waist.");
	output("\n\n<i>“Oh?”</i> she says, giving you a smile.");
	if(pc.hasCock())
	{
		output("\n\n<i>“I think I know where to start.”</i>");
		output("\n\nWith a few well-placed squeezes and some giggling, you maneuver Ellie into one of the spare rooms and get her laid out on the bed.");
		output("\n\n<i>“Is this what you wanted?”</i> you ask her, slowly sliding your [pc.cock] between her wettened, shining pussylips.");
		output("\n\n<i>“Oh, fuck yes,”</i> she gasps, flexing her massive hindquarters to squeeze down on you. <i>“Give it to me, [pc.name]!”</i>");
		output("\n\nShe cries out when you thrust inside, gripping the headboard for her life as you pound her sopping wet pussy hard enough to make her cry out your name. Her walls grip at you with desperate need, and it’s not long before you’re both cumming as hard as you can. Her pussy clenches down on you over and over, milking you for all you’re worth. Thoroughly satisfied with the way she’s been dicked down, Ellie collapses onto the bed and sinks into the sheets.");
		output("\n\n<i>“Mmm. I’m going to take a nap, ‘kay [pc.name]?”</i>");
		output("\n\n<i>“Uh huh. You take it easy, I’ll see you soon, alright?”</i>");
		output("\n\nShe beckons you into a good night hug, and you give her a heartfelt kiss and sit on the edge of the bed. Her breathing slows, and she falls asleep holding your hand in hers. You carefully extricate your fingers and kiss her on the cheek, leaving her to rest.");
		processTime(30+rand(15));
		pc.orgasm();
	}
	else
	{
		output("\n\n<i>“We can take a pass on making more, but how about I show you a good time anyway?”</i>");
		output("\n\nWith a few well-placed squeezes and some giggling, you maneuver Ellie into one of the spare rooms and get her laid out on the bed. With her on her knees, you slide yourself under her ass and grip her cheeks, pulling them apart to expose her luscious sex. You commandingly pull her down onto you, licking her right down the centre of her pussy, making sure to lovingly stroke the pulsing nub contained within.");
		output("\n\n<i>“Ohhhhhh, goood!”</i> Ellie cries out, gripping the headboard for dear life. <i>“Don’t stop!”</i>");
		output("\n\nIn her unconscious desire she pushes down with her massive hips, driving your face into the warmth of her pussy as her femcum is running down your chest. She cums over and over, shaking and groaning in ecstasy until she can finally take no more and has to weakly lift her hips from your face.");
		output("\n\n<i>“Oh, my god,”</i> she pants, hand on her heaving breasts. <i>“I haven’t cum, that hard, for a while...”</i>");
		output("\n\n<i>“Always happy to help my favorite girl,”</i> you say, rubbing her flank as she rolls onto her side. <i>“You gonna take a nap?”</i>");
		output("\n\n<i>“Uh huh,”</i> Ellie says sleepily, beckoning you into a tight hug. You give her a kiss and tug the blankets over her, heading out to let her rest.");
		processTime(30+rand(15));
		pc.changeLust(25);
	}
	
	addButton(0, "Next", mainGameMenu, undefined, "", "");
}

public function ellieDoesntHavePheromonesAnymore():void
{
	clearOutput();
	author("Wsan");
	showBust("ELLIE");
	showName("\nELLIE");	
	
	output("<i>“So the pheromones are gone, huh?”</i> you ask, noting you’re considerably more sane in her presence, even on New Texas.");
	output("\n\n<i>“Uh huh!”</i> Ellie nods, her bountiful bust jiggling tantalizingly. <i>“I guess since I got preggers I don’t need them so bad right now. They come back, though. It’s usually a few months after the kids hatch, but probably sooner for me ‘cuz of all the bulls walking ‘round.”</i> She winks conspiratorially. <i>“So you can look forward to that.”</i>");
	output("\n\n<i>“The bulls can’t get you pregnant though, right?”</i> you ask.");
	output("\n\nShe shakes her head. <i>“Nope, the doctor was pretty clear that it’d only work for you, not everyone else. Not that that’ll stop ‘em from trying, y’know. Jeez, sometimes I wonder how we ever got off our planet with our pregnancies being so difficult!”</i>");
	output("\n\nYou laugh. <i>“Good thing this all worked out then, huh?”</i>");
	output("\n\n<i>“You know it!”</i> Ellie agrees, nodding vigorously. <i>“I kinda miss it, too - being pregnant. Sometimes thinking about it gets me kinda hot,”</i> she admits, tail flicking from side to side. <i>“Like I just can’t wait for you to take me out back and breed your mare with that stud cock until I’m full of spunk... ooh,”</i> she sighs, eyeing you needily and biting her lip. <i>“Whattya say, [pc.name]? Fancy helping your poor little girl in heat?”</i>");
	
	processTime(5+rand(4));
	pc.changeLust(33);
	
	clearMenu();
	if(pc.lust() >= 33) addButton(0,"Yes",ellieSexScene,undefined,"Yes","Take the taur-girl for a roll in the proverbial hay.");
	else addDisabledButton(0,"Yes","Yes","Somehow, despite the pervasive musk, you aren’t aroused enough for sex.");
	addButton(1,"No",ellieMenu,undefined,"Turn her down for now.");	
}

public function askEllieAboutTheKiddos():void
{
	clearOutput();
	author("Wsan");
	showBust("ELLIE");
	showName("\nELLIE");
	
	output("You ask about the kids.");
	output("\n\n<i>“The kids are great! Well, you already know that,”</i> Ellie giggles, smiling happily. <i>“I usually see them a couple times a week - T has been really, really good about maternity leave and all that stuff! After all, a place like New Texas wouldn’t even run properly if we didn’t have rules in place for that stuff. Though I’m bending them a little,”</i> she admits, <i>“by going off-planet for my visits. Still! The kids are happy to see me, and that’s what counts.”</i>");
	output("\n\n<i>“I wish I could see them more often,”</i> you muse, thinking about your son and daughters.");
	output("\n\nEllie reaches over the counter and grasps your hands in her giant plated mitts, her big blue eyes looking at you imploringly. <i>“Please don’t beat yourself up over it, [pc.name]. I knew going into this you wouldn’t be able to be around much, and that’s fine. I’m okay with it. The kids are strong too, you know? Just make sure you visit them whenever you can!”</i>");
	output("\n\n<i>“Yeah,”</i> you say, smiling back at her. <i>“Thanks, Ellie. I dunno what I’d do without you.”</i>");
	output("\n\n<i>“Oh, you,”</i> she giggles, squeezing your hands softly. <i>“They’re a lot of fun to play with. They can’t talk very well yet, but I think they understand you’re out there doing your best for their sake. Heck, " + flags["ELLIE_KID1"] + " will probably end up following in your footsteps. He’s quieter than the girls, but he’s really interested in your adventures. Won’t that be a treat?”</i> she asks, smiling wide. <i>“Another generation of Steeles out there travelling the stars. I’m getting a little misty-eyed just thinking about it.”</i>");
	output("\n\nShe pulls back a hand to wipe her eyes while you’re lost in thought. You hadn’t even thought about that yet. Will your kids follow in your footsteps? Will they put themselves in danger? Your instinctive need to keep them safe wars with the idea of letting them have control over their own lives. It would be great if you could just keep them safe forever. You sigh. No, that way lies madness. Whatever happens, it’s best to let them decide for themselves. Besides - you’ll still be around to guide them.");
	output("\n\n<i>“Thinking about their adventures?”</i> Ellie asks, interrupting your train of thought. <i>“They’ll be fine, [pc.name]. They were just born! Let’s focus on getting them to put their toys away neatly before we think about space travel.”</i>");
	output("\n\n<i>“You’re right,”</i> you laugh, dismissing the worries of the future. It’s hard to stay worried with Ellie in front of you. <i>“Gotta take it one step at a time.”</i>");
	output("\n\n<i>“Right,”</i> Ellie says with a smile, her breasts resting on the countertop. <i>“So, anything going on with you?”</i>");
	output("\n\nYou pass a bit of time just chatting comfortably to Ellie.");
	
	processTime(15+rand(10));
	buildEllieTalkMenu();
	addDisabledButton(4, "Kids");
}

public function specialNewMountSceneIfYouGaveEllieKiddos():void
{
	clearOutput();
	author("Wsan");
	showBust("ELLIE_NUDE");
	showName("\nELLIE");
	
	output("<i>“Let’s skip the small talk, [pc.name]. You know how I like it,”</i> Ellie moans, wiggling her hips invitingly while she steadies herself with the bolted bar on the wall. <i>“Fuck me like I’m your little breeding mare bitch. Fill my womb up with your spunk!”</i> Her black-lipped cunt winks at you, still webbed with strands of sticky girl-spunk and beading anew with moisture, looking so inviting that you just can’t help yourself.");
	output("\n\nHow could you resist such an eloquent invitation? Your [pc.cockBiggest] inflates to its full size immediately, rock hard under your tauric bulk. Instinct hammers at your brain, telling you to take your needy slut and fuck her until she can’t stand. With a primal roar of desire, you lunge forward onto your waiting lover, thrusting the full weight of your animalistic body onto her, scrambling up her back until your humanoid waist is flush against her own. Ellie shrieks in effort and shock, her six legs buckling under the massive added weight of your inhuman form, but she follows that up with a low, feral moan as you reach down and grab her huge, milk-swollen tits. She gasps happily as you squeeze and knead her udders, working out a thick gout of milk that utterly soaks her bra - right up until she strips it off, letting the two fleshy gray orbs bounce free into your grip.");
	output("\n\nYou use Ellie’s humanoid torso, and especially her meaty rack, to steady yourself as your hind legs scoot up and align your wang with the sultry snatch between your lover’s haunches. She gasps and shudders as your [pc.cockHeadBiggest] brushes her twat’s lips. You don’t go gently, but let the full weight of your bestial nethers come down in one mighty thrust the moment you’re aligned. Ellie’s pussylips part like a veil of silks for you, making way for your tool to plunge into her sultry depths. She’s hotter than a human, boiling hot no matter how cold her blood may run! Her muscles move hungrily out of your way as you penetrate her, the slick slabs of flesh in her pussy almost kissing you, sucking your rod further and further in until you’re totally buried inside your leithan lover. No matter how hard you slam your rod in, she takes you without resistance, though her legs claw at the ground and her whole body shifts with the forward motion of your dick, moving with you until Ellie’s chest is mashed against the wall, breasts squishing on cold concrete, spilling out around your groping fingers. She shivers at the sensation - both of the cold on her huge nipples and the bulbous dick spreading her pussy wide.");
	output("\n\n<i>“Fuck!”</i> Ellie cries, shivering with delight as you finally settle atop her. <i>“Oh, fuck </i>yes<i>. I can’t get you doing this to me out of my head. It feels </i>so good<i> to have your big, fat cock back inside me...”</i>");
	output("\n\nYou give your lover an affectionate titty-squeeze, grinning as a trickle of her milk pours out down your fingers. In return, Ellie wiggles her hips back, carrying both of you a step away from the wall to give you some room to maneuver without cracking skulls against the concrete. Now that you have some space, you dig your forelegs into Ellie’s shoulders and start to move. She gives a strange, throaty nickering sound as you anchor yourself overtop her and start to really fuck her. Your [pc.hips] hammer into her, carrying monumental weight behind every thrust - enough to make her whole body shake and start every time you ram yourself home into that wonderfully wet, boiling-hot pussy. You revel in the wetness of her passage, the way her pussylips kiss at your cock every time you push into her. Grinning to yourself with mindless lust, you busy your humanoid half by savaging Ellie’s breasts, squeezing her big nipples and cupping the massive mounds, loving every moment that the too-huge swells of her rack spill out around your clutching fingers. She squeals in delight, milk squirting from her abundant stores, and her bestial cunt starts to contract around your thrusting snake-phallus in the perfect way to drive you wild.");
	output("\n\nYour tauric lover gasps and moans as you molest her ample chest, leaning her humanoid half back against you and joining you in groping at her breasts, desperate to draw even more pleasure from her lusty body.");
	output("\n\nEllie’s cries and screams of pleasure only get louder as you continue, until you’re sure everyone in the shop - hell, probably everyone in the ranch house - can hear the two of you going at it. In the cloud of leithan sex-scent you’re wallowing in, however, that knowledge only makes you hornier. Let ‘em hear! Let them all be jealous: this is your pussy to fuck, to fill with seed, to breed. You’re more than happy to make her a mother twice over. The thought of getting Ellie pregnant again drives you forward, your body going completely on automatic as you jackhammer your hips against her haunches, fucking her as hard as you possibly can.");
	output("\n\nBetween your [pc.legs], Ellie’s tail starts to squirm and shiver, the muscles making it writhe around your hind legs. You try and ignore her wiggling tail, but its movements only become more and more urgent; familiar with her mannerisms by now, you can tell she’s right on the verge of cumming her brains out. The tauric beauty’s voice climbs a register higher over several low, lusty moans and cries of pleasure, her whole body shifting with your tiny hip’s impact against her, grinding and thrusting herself back against you. You can feel the lips of her gaping pussy contract hard, kissing at your cock and smearing you with an ever-increasing veneer of sticky tauric girl-cum, painting your groin in a web of leithan spunk until you’re drenched in it. She’s never been one to outright squirt, but hell if she doesn’t leak!");
	output("\n\nEllie doesn’t let you lag far behind her: her muscles wring and squirm all along the length of your [pc.cockBiggest], so tight and so hot, massaging every inch of your desperate prick. Her velvety pussy milks you, hard and long as Ellie rides out her own explosive orgasm, body working to make sure you come with her into bliss. As turned on as you are, it doesn’t take long.");
	output("\n\n<i>“Fuck me! Flood my cunt with your seed, [pc.name]! Make me fucking pregnant all over again!”</i> Ellie whinnies, her tail coiling tightly around your hindlegs and pulling you tight against her, urging you to fuck her harder and deeper as your own climax nears.");
	output("\n\nA few more deep thrusts, and you begin to feel the familiar rush of orgasmic need rising in your [pc.balls]. Your [pc.hips] pound into Ellie’s backside until you’re afraid she’ll collapse under the weight and force of you fucking her - but she holds on, screaming and crying and spraying milk and fem-cum all over her pillows as she does. Her pleasured sounds and leaking fluids only making you ever more desperate to cum, her mounting musk rending asunder any lingering ability to hold back. With a final grunt of pleasure, you slap your hips into hers, relishing the squelching feeling of her overly-wet crotch mashing against your own. Buried to the hilt inside your tauric lover, you find yourself cumming, unleashing a thick spray of cum into the hot, sultry passage of Ellie’s bestial pussy. Her muscles go into overdrive at the feeling of your cum flooding into her, working hard to drain out every drop from you, to draw you deeper into her as you bust your nut into her welcoming womb.");
	output("\n\nYou keep hammering, your bestial hips thrusting deep into Ellie, using her squirming, cum-soaked channel as a milker to work out every drop of seed. You won’t stop until you’ve fucked her fertile womb as full of your spunk as you can. She’s more than happy to take it, making pleasured little moans and sighs as you fill her, still squeezing the milk out of her tits into a growing pool on the floor between her forelegs. Finally, after a few minutes of catching your breaths and enjoying the feeling of simply being inside your leithan lover, you scramble off of her back, forelegs clattering to the floor. The moment your inhuman phallus slides from Ellie’s gaping cunt, a little flood of leithan-cum mixed with just a tad of your own excess spooge drools out of her parted lips.");
	output("\n\n<i>“Oh, [pc.name],”</i> Ellie sighs dreamily, hearts in her eyes. <i>“I love how you never hold back on me. You give it to me just how I want it every time. You’d better make sure we do this again and again, okay? I’m </i>always<i> up for you mounting me, you big stud,”</i> she adds with a giggle, hugging her voluptuous breasts. You give Ellie’s big, cum-splattered hind an affectionate pat and offer her your arm. She takes it with a toothy smile, her bunny-like ears rubbing up against you as she snuggles close. Together, the two of you make your way back to the storefront.");
	
	processTime(31);
	//tryKnockUpEllie();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function specialNewBigDickSceneIfYouGaveEllieKiddos():void
{
	clearOutput();
	author("Wsan");
	showBust("ELLIE_NUDE");
	showName("\nELLIE");
	
	output("<i>“Come and get it, lover " + pc.mf("boy","girl") + ",”</i> Ellie purrs, withdrawing her arm-thick tail from her pussy, leaving her lips wide agape and drooling a web of excitement and anticipation. You all but leap at the opportunity, aligning yourself behind the leithan slut’s spread hind legs. She flashes you a sultry grin and wiggles her hips, smearing a little of her fem-spunk across your member and balls and thighs, and especially over the diamond-stiff length of your seam-straining member. Ellie’s pheromones had you hot and ready to fuck the moment you walked into her shop; finally you can act on your primal urges to breed that leithan cunt until it’s dripping with your seed.");
	output("\n\nYou grab your hefty cock and bring the full weight of it down on Ellie’s butt, slowly dragging your monstrous shaft down her bestial thigh. She makes a throaty, whinnying sound of delight as you start to line yourself up with her sex. <i>“Mmmm, I can feel that, lover...”</i> Ellie coos, cupping one of her oversized udders and pinching the nipple until it squirts.");
	if(pc.biggestCockLength() < 24) output("\n\n<i>“That’s a nice, thick cock... why don’t you use it to make me your breeder bitch?”</i>");
	else output("\n\n<i>“Ooh, you’re bigger than the leithan boys! Not that I’m complaining. Easier on my back when you can just hammer me from behind. My poor little pussy’s just drooling in anticipation... go ahead and slide it in, lover!”</i>");
	output("\n\nTaking a breath to steady yourself, you angle your rod towards Ellie’s gaping cunt and start to push forward. Ellie’s pussylips part like a veil of silks for you, making way for your throbbing, pink cock to plunge into her sultry depths. She’s hotter than a human, boiling hot no matter how cold her blood may run! Her muscles move gingerly around you as you penetrate her, the slick slabs of flesh in her pussy almost kissing you, sucking your rod further and further in until you’re totally buried inside your leithan lover. Even as hugely endowed as you are, she takes you without resistance, though her legs claw at the ground and her whole body shifts with the forward motion of your dick, moving with you until Ellie’s chest is mashed against the wall, breasts squishing on cold concrete. She shivers at the sensation — both of the cold on her huge nipples and the gargantuan cock spreading her pussy wide.");
	output("\n\n<i>“Ooh, fuck,”</i> Ellie coos, looking over her shoulder and patting her flank, just hard enough to let you feel it all the way inside her. <i>“I can’t get you doing this to me out of my head. It feels </i>so good<i> to have your big, fat cock back inside me... I love it!”</i>");
	output("\n\nYou give Ellie an appreciative swat on the haunch, and even though your palm landed on one of her armored plates, you still feel her drooling gash squirm around you, muscles working along the many, many inches of cockflesh rammed into her. Her long, leathery tail coils around your boyish hips, gently guiding you as you withdraw, helping to steady you as you lean out and out before hammering home. She lets out a high, ecstatic scream when you slam your distended cock back in, squirting trickles of fem-cum out around your pussy-stretching girth, smearing your crotch and legs in musky leithan girl-spunk... which only drives you even madder with lust.");
	output("\n\nYou grip Ellie’s haunches, letting your fingers dig into the supple skin between her armored plates. Thanks to those plates, it’s easy to find a good grip on the tauric slut. She gives a strange, throaty nickering sound as you grasp her wide, bestial hips and start to really fuck her. With her tail’s help, you’re able to leap into a thunderously fast pace. Your [pc.hips] hammer into her, pounding away at the gaping hole of Ellie’s pussy, reveling in the wetness of her passage, the way her pussylips kiss at your cock every time you push into her. Grinning to yourself with mindless lust, you rear back and give Ellie’s butt a hard swat, feeling her scaly plates shudder under the impact and her bestial cunt contract around your thrusting massive, pre-gushing cock in the perfect way to drive you wild. Your tauric lover gasps and moans as you spank her plated behind, leaning her humanoid half against the wall and groping at her breasts to draw even more pleasure from her lusty body.");
	output("\n\nEllie’s cries and screams of pleasure only get louder as you continue, until you’re sure everyone in the shop — hell, probably everyone in the ranch house - can hear the two of you going at it. In the cloud of leithan sex pheromones you’re wallowing in, however, that knowledge only makes you hornier. Let ‘em hear! Let them all be jealous: this is your pussy to fuck, to fill with seed, to breed. You’re more than happy to make her a mother twice over. The thought of getting Ellie pregnant again drives you forward, your body going completely on automatic as you jackhammer your hips against her haunches, fucking her as hard as you possibly can.");
	output("\n\nBetween your legs, Ellie’s tail starts to squirm and shiver, the muscles writhing around you. You try and ignore her wiggling tail, but its movements only become more and more urgent; you slowly realize it’s just the first sign of Ellie’s climax. The tauric beauty’s voice climbs a register higher over several low, lusty moans and cries of pleasure, her whole body shifting with your [pc.hip]’s impact against her, grinding and thrusting herself back against you. You can feel the lips of her gaping pussy contract hard, kissing at your cock and smearing you with an ever-increasing veneer of sticky tauric girl-cum, painting your groin in a web of leithan spunk until you’re drenched in it. She’s never been one to outright squirt, but hell if she doesn’t leak!");
	output("\n\nEllie doesn’t let you lag far behind her: her muscles wring and squirm all along the length of your [pc.cockBiggest], so tight and so hot, massaging every inch of your desperate prick. Her velvety pussy milks you, hard and long as Ellie rides out her own explosive orgasm, her body working to make sure you come with her into bliss. As turned on as you are, it doesn’t take long.");
	output("\n\n<i>“Fuck me! Flood my cunt with your seed, [pc.name]! Make me fucking pregnant all over again!”</i> Ellie whinnies, her tail coiling tightly around your waist and pulling you tight against her, urging you to fuck her harder and deeper as your own climax nears.");
	output("\n\nA few more deep thrusts, and you begin to feel the familiar rush of orgasmic need rising in your [pc.balls]. Your [pc.hips] can’t move much with Ellie holding you like that, but they hammer what few inches your lover’s death-grip permits you, her chemical cloud rending asunder any lingering ability to hold back. With a final grunt of pleasure, you slap your hips into hers, relishing the squelching feeling of her overly-wet crotch mashing against your own. Buried to the hilt inside your tauric lover, you find yourself cumming, unleashing a thick spray of jizz into the hot, sultry passage of Ellie’s bestial pussy. Her muscles go into overdrive at the feeling of your cum flooding into her, working hard to milk out every drop from you, to draw you deeper into her as you bust your nut into her welcoming womb.");
	output("\n\nWhen you’re done, you give a sated sigh and lean against the leithan’s armored backside, trying to catch your breath. Ellie’s hips wiggle eagerly against your crotch, her cum-soaked vaginal muscles contentedly massaging your still-twitching fat, cum-dribbling member. Her tail holds you steady for a long, long time, making sure you squirt every drop deep into her hungry cunt, keeping you trapped against her until you go soft enough to fall out of her on your own. When you do, you’re treated to a little waterfall of backed-up leithan spunk, mixed with a healthy dose of your own, which drools down between your legs to splatter between her hind claws.");
	output("\n\n<i>“Oh, I needed that,”</i> Ellie moans, still massaging her huge tits. <i>“Nothing beats a big, thick cock and a belly full of your spunk...”</i> At that, her reptilian tail loosens its grip, driving you to realize you can barely stand. You carefully deposit yourself on the mass of pillows behind her, watching with a smile as the leithan’s tail twitches, and a trickle of your spooge drools out of her thoroughly-fucked twat. Smiling at you over her shoulder, Ellie adds, <i>“You sure know how to fuck a big ol’ taur like me, huh? Reminds me of when you got me pregnant. Ooh, I think of it every time I get fucked...”</i>");
	output("\n\nYou give Ellie a cocky, albeit tired, grin, prompting a giggle. She picks you up and puts you on her back - the impact of which has the delightful effect of making her spooge-packed hole squirt a little of your seed back onto the floor. <i>“C’mon, lover, let’s get you back to the shop.”</i>");
	
	processTime(25);
	//tryKnockUpEllie();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function specialNewLittleDickSceneIfYouGaveEllieKiddos():void
{
	clearOutput();
	author("Wsan");
	showBust("ELLIE_NUDE");
	showName("\nELLIE");
	
	output("<i>“Mmm, not quite as big as you used to be, huh?”</i> Ellie adds a moment later, still thrusting her thick tail into herself, punctuating her words with little gasps of pleasure. <i>“Those space adventures leaving you a bit deprived? That’s okay. I’ve got another little hole that I’m sure you’ll love, [pc.name].”</i>");
	output("\n\nAs she speaks, her tail pops out from her now-gaping sex and drags itself up her haunch, the tapered tip coming to rest against the dark little star of her asshole. She’s not kidding: her butt’s about as big as a pornstar’s cooch, but it’s a hell of a lot more... well, you-sized than her animalistic pussy. She gives a little gasp as her tail pushes in, just a few inches, but covered in her sweltering girl-cum as it is, the going’s not too rough for maybe six inches of her rapidly-widening thickness. <i>“What do you say, sweet thing? Wanna feel my hot, tight little pucker around that gorgeous little cock of yours?”</i>");
	output("\n\nYou all but leap at the opportunity, grabbing a smallish box to stand on and aligning yourself behind the leithan slut’s spread hind legs. She flashes you a sultry grin and wiggles her hips, smearing a little of her fem-spunk across your [pc.crotch], and especially over the diamond-stiff length of your [pc.cockBiggest]. Just being around Ellie now is enough to have you ready to fuck; while you can’t act on your mind’s primal urges to breed that sultry leithan pussy, you can at least sate your desires on a hole built for someone your size.");
	output("\n\n<i>“Grab the lube, baby,”</i> Ellie murmurs as your [pc.cockBiggest] brushes against the X-shaped hole of her butt. <i>“Better safe than sorry, right?”</i>");
	output("\n\nYou grunt in frustration and pent-up horniness, but yield to your lover’s request. However, you won’t settle for something that came out of a bottle when there’s a hot, wet well of juicy lube rubbing up against you already. You redirect your soft-barbed cock to the wide-open lips of Ellie’s black cunt, pushing yourself easily into its sultry depths. You move yourself in a circle around her wet, hot muscles, gathering up as much of Ellie’s natural lubricants onto your shaft as you possibly can. She looks over her shoulder, watching you with eager eyes while you prepare. Once you’ve got enough slippery taur-spunk slathered onto your rod to make sure that you’ll have an easy time with even the tightest of holes, you slide your hips back from the leithan’s bestial pussy and angle yourself back up toward your target. X marks the spot...");
	output("\n\nSeeing that you’re about the take the plunge, Ellie lifts her tail up and out of the way, curling the leathery appendage along her back to make herself nice and open for you. She flashes you a little smile as you grab her hips, and she starts to cup and squeeze her breasts again, milking herself ever so slightly in anticipation. The sight of her maternity bra filling up with lactic excess is enough to drive you onwards, and you start to press your [pc.hips] forward.");
	output("\n\nThe four folds of muscle that make up Ellie’s X-shaped asshole part easily, folding back against themselves as you enter her. The difference between her ass and pussy is like night and day: you can feel Ellie’s muscles worming and squirming around you, the beat of her powerful, head-sized heart thrumming through the tightly clenched passage. It feels like a hot, silken glove around your [pc.cockBiggest], a little warmer and drier than a normal girl’s pussy, but just as pleasant to sheathe your wang in.");
	output("\n\nYou easily sink in to the hilt, eliciting a long, low groan of pleasure for your enormous lover. <i>“Oh, now that’s the stuff...”</i> Ellie coos, her tail wiggling around your noticeable sides, pulling you in until your crotch squeezes tight against hers. You give a slight shiver as you feel your lover’s freely-flowing juices smear across your legs and thighs, basting you in warm, sweet-smelling sex-musk that quickly makes it was up to your nose.");
	output("\n\nYou grip Ellie’s haunches, letting your fingers dig into the supple skin between her armored plates. Thanks to those plates, it’s easy to find a good grip on the tauric slut. She gives a strange, throaty nickering sound as you grasp her wide, bestial hips and start to really fuck her. Your [pc.hips] hammer into her, pounding away at the tight, wringing ring of Ellie’s asshole, reveling in the tightness of her passage. Her muscular folds kiss and suckle on your cock with every powerful thrust, as if trying to pull you deeper and deeper into her. Grinning to yourself with mindless lust, you rear back and give Ellie’s butt a hard swat, feeling her scaly plates shudder under the impact and her bestial asshole contract around your thrusting pink, feline tool in the perfect way to drive you wild. Ellie gasps and moans as you spank her plated behind, leaning her humanoid half against the wall and groping at her breasts to draw even more pleasure from her lusty body.");
	output("\n\nBetween your legs, Ellie’s tail starts to squirm and shiver, the muscles writhing around you. You try and ignore her wiggling tail, but its movements only become more and more urgent; you slowly realize it’s just the first sign of Ellie’s climax. The tauric beauty’s voice climbs a register higher over several low, lusty moans and cries of pleasure, her whole body shifting with your noticeable hip’s impact against her, grinding and thrusting herself back against you. You can feel the lips of her gaping pussy contract hard, rubbing against your own crotch and smearing you with an ever-increasing veneer of sticky tauric girl-cum, painting your groin in a web of leithan spunk until you’re drenched in it. She’s never been one to outright squirt, but hell if she doesn’t leak!");
	output("\n\nHer ass joins in the fun a moment later, squeezing down on your shaft hard enough to trap you, completely halting your thrusts into her save for tiny, shallow jerks of your noticeable hips, barely able to clear an inch from your lover’s powerful grip. Still, Ellie doesn’t let you lag far behind her: her muscles wring and squirm all along the breadth of your [pc.cockBiggest], so tight and so hot, massaging every inch of your desperate prick. Her ass milks you, hard and long as Ellie rides out her own anal orgasm, her body working to make sure you come with her into bliss. As turned on as you are, it doesn’t take long.");
	output("\n\n<i>“Come on, [pc.name], give it to me! I wanna feel your cum inside me!”</i> Ellie whinnies, her tail coiling around your waist and pulling you tight against her, hugging you close as your own climax nears.");
	output("\n\nA few more restrained thrusts, and you begin to feel the familiar rush of orgasmic need rising in your testes. Your ample hips can’t move much, but they hammer what few inches your lover’s death-grip permits you, Ellie’s musk rending asunder any lingering ability to hold back. With a final grunt of pleasure, you slap your hips into hers, relishing the squelching feeling of her overly-wet crotch mashing against your own. Buried to the hilt inside your tauric lover, you find yourself cumming, unleashing a thick spray of cum into the vice-tight passage of Ellie’s well-fucked asshole. Ellie’s muscles go into overdrive, working hard to milk out every drop, to draw you deeper into her as you bust your nut into her welcoming backside.");
	output("\n\nWhen you’re done, you give a sated sigh and lean against the leithan’s armored backside, trying to catch your breath. Ellie’s hips wiggle eagerly against your crotch, her cum-soaked anal muscles contentedly massaging your still-twitching dick.");
	output("\n\n<i>“Ooh, that was a nice change of pace,”</i> Ellie sighs in satisfaction, lowering you to the pillows with her tail. You watch with a smile as the leithan’s tail twitches when it withdraws, and a trickle of your spooge drools out of her thoroughly-fucked ass. Smiling at you over her shoulder, the taur adds, <i>“You feel so good in my ass, [pc.name]. Almost good enough to make me forget how good it was to have you breeding my pussy!”</i>");
	output("\n\nYou give Ellie a cocky, albeit tired, grin, prompting a giggle. She picks you up and puts you on her back - the impact of which has the delightful effect of making her spooge-packed hole squirt a little of your seed back onto the floor. <i>“C’mon, lover, let’s get you back to the shop.”</i>");
	
	processTime(25);
	//tryKnockUpEllie();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}