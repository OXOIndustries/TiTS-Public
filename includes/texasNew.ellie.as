import classes.Characters.PregnancyPlaceholder;
//Notes to the Coder
//Nephelee has the following stat:
//NephAffect: Ranges from 0-100. Translates 2:1 as a bonus to her store discount -- at 100%, she grants the PC a 50% discount. 

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

public function ellieApproachButtonSetup():void
{
	if(flags["MET_ELLIE"] != undefined) addButton(0,"Ellie",ellieMenu,undefined,"Ellie","Approach Ellie, the leithan running the gift shop.");
	else addButton(0,"Shopkeep",meetingEllie,undefined,"Shopkeep","Approach the shopkeeper and see what she's selling.");
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
	pc.lustDamage(10);
	processTime(4);
	clearMenu();
	//[Yes] [Meh] [Don’t Like Girls]
	addButton(0,"Yes",yesEllieLetsHaveSexAsSoonAsWeMeet,undefined,"Yes","Tell her that you appreciate her rack in all its magnificence.");
	addButton(1,"Meh",mehYourTiTSDontScareMeOffworlder,undefined,"Meh","Play it cool for now. There's no reason she needs to see what an effect she's having on you.");
	addButton(2,"Don'tLike",iDontLikeGirlsYaBitch,undefined,"Don't Like Girls","Inform Ellie that you don't really care for her girls or girls in general.");
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
	output("She gives you a playful tsk of her tongue. <i>“Aww. Most bulls would have me spread open on the counter by now. Maybe you need a little dose of the Treatment to get some confidence, huh?”</i> she teases, though her long, reptilian tail brushes meaningfully across the rack of medipens behind the counter. <i>“After all, it’s the most amazing feeling in the world - for free! So what do you say, hun? Want a medi-pen full of a lifetime of ecstasy, or do I need to do a little more convincing?”</i>");
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
			output("\n\nAs you contemplate what to say, your Codex beeps that it’s identified Ellie’s species - Leithans. <b>New Codex entry unlocked.</b>");
			CodexManager.unlockEntry("Leithans");
		}
		if(flags["MET_ELLIE"] == undefined) flags["MET_ELLIE"] = 1;
		//Repeat Greetings
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

	addButton(0,"Buy",buyItem);
	addButton(1,"Sell",sellToEllie);
	addButton(2,"Talk",talkToEllieYaFuckingSkank);
	addButton(3,"Suckle",suckleDatCowtaurTeat,undefined,"Suckle","Why not? You are thirsty.");
	if(pc.lust() >= 33) addButton(4,"Sex",ellieSexScene);
	else addDisabledButton(4,"Sex","Sex","Somehow, you're still not turned on enough for sex.");
	addButton(14,"Back",mainGameMenu);
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
output("\n\n//Tooltip: This download code will allow you to access the story <i>The Gene Stealer</i>, a follow-up to <i>Talon Rogue</i>. In this story, Captain Entara’s adventures head to Tarkus and into the ruins of a starship inhabited by a terrible monster. ");


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
	output("\n\nShe purses her lips. <i>“Do I have time? Sure, I guess... but wouldn’t you rather do something more fun?”</i> Looking you up and down, she adds, <i>“I could think of a few things.”</i>");
	output("\n\n");
	if(pc.libido() < 70 || pc.lust() < 70) output("You’re sorely tempted to take the eager taur up on that offer, but for the moment, no. She pouts, but nods. <i>“Fine, I guess I’m not doing anything too important... but I’m warning you, the first bull to walk through with a hardon might sweep me away, if you aren’t careful!”</i> With that, Ellie sits herself down on her reptilian hind end and looks at you expectantly.");
	else
	{
		output("\n\n<i>“Yeah, so can I,”</i> you say, eyeing those beautiful breasts of hers, undressing her with your mind even as the sexy taur gets ready to do it for real.");
		// {to sex menu}
		clearMenu();
		addButton(0,"Next",ellieSexScene);
		return;
	}
	buildEllieTalkMenu();
}

public function buildEllieTalkMenu():void
{
	clearMenu();
	author("Savin");
	showBust("ELLIE");
	showName("\nELLIE");
	addButton(0,"Her Race",talkToEllieAboutHerRace,undefined,"Her Race","See if she wouldn't mind talking about her race a little bit.");
	if(flags["ELLIE_PHEROMONE_TALK_UNLOCKED"] != undefined) addButton(1,"Pheromones",talkToEllieAboutPheromones,undefined,"Pheromones","Ask her about the cloud of pheromones following her around everywhere.");
	else addDisabledButton(1,"Locked","Locked","You might need to talk to her about her race before this unlocks.");
	addButton(2,"Treatment",talkToEllieAboutTreatment,undefined,"The Treatment","Ask her about the Treatment thing that everyone here is on about.");
	addButton(3,"New Texas",talkToEllieAboutNewTexas,undefined,"New Texas","Ask her what she thinks about the planet.");
	addButton(14,"Back",ellieMenu);
}


//Her Race
public function talkToEllieAboutHerRace():void
{
	clearOutput();
	author("Savin");
	showBust("ELLIE");
	showName("\nELLIE");
	output("Your codex might have figured out what she is, but you’d like to hear a little about Ellie’s race from her.");
	output("\n\n<i>“I guess that’s reasonable,”</i> Ellie grins, adding proudly, <i>“I’m a leithan. Sometimes folk call us Centaurins, both on account of us being from Alpha Centauri and lookin’ a little like centaurs from earth mythology.”</i>");
	output("\n\nShe looks behind herself at her six-legged reptilian body, plated with scales and shields of naturally grown armor. <i>“I don’t really see the resemblance, but I don’t guess I mind much. Just so long as nobody calls me a pony, anyway. Though I wouldn’t mind so much if they wanted a ride after,”</i> Ellie giggles, her huge bust bouncing giddily. She brings one of her plated hands up to her lip, chewing on a knuckle as her laughter subsides.");
	output("\n\n<i>“Anyway, you wanted to know about us leithans, not my equine proc.. procli- uh, fantasies! We come from one of the smaller worlds off of Alpha Centauri, the second planet from the sun. I’ve never seen it - my grandparents hopped ship just as soon as they could - but the vids I’ve seen make it look like a hot, desert planet. Not much water, ‘cept in the atmosphere. That’s what my great-grandfolks did: harvesting water from moisture vaporators. Dangerous job, since you have to work outside the city walls.”</i>");
	output("\n\n<i>“Why’s that more dangerous?”</i> you ask.");
	output("\n\n<i>“Cuz of the monsters, silly!”</i> Ellie says, a little more serious than before. <i>“I guess you’d call them predators, really. Titans, giants, dragons, all sorts of nasty things come from Centauri II. Well, not REALLY dragons, but they’re close enough: huge flying reptiles, kinda like us leithans, but way bigger and scarier - not cute and cuddly like we are. They may not breathe fire, but a Centauri dragon’ll rip you to shreds all the same. Them and the other huge, flesh-eating monsters on the homeworld’s why we leithans ended up growing all this armor.”</i> She flexes one of her arms for emphasis, showing off the black plates and scales on it. The motion does remarkable things to the straining scales and plates under her bust, too... <i>“Having a little armor makes us something to chew on, at least. That and the glowy lights all over us keep us from getting eaten </i>too<i> often, especially these days when leithans pack laser cannons and rocket launchers.”</i>");
	output("\n\nShe chuckles slightly, leaning forward enough to rest her heavy bosom on the countertop. The milk-laden bra holding them back makes a wet sound as she puts some weight on it. While Ellie adjusts herself, you ask her about <i>“getting eaten.”</i>");
	output("\n\nShe grimaces. <i>“Well, leithans weren’t the big, top-dog species on our homeworld that humans and ausar were. We might look tough and strong to most other folk, but on our planet, we’re the runts of the litter! Plenty of critters on Centauri II can eat us up in one gulp, and even more don’t mind taking a few bites. It wasn’t ‘till the U.G.C. poked their heads in that my people finally managed to defend themselves.”</i>");
	if(pc.isNice()) output("\n\n<i>“That sounds terrifying,”</i> you say, ");
	else if(pc.isMischievous()) output("\n\n<i>“Yeesh. I can see why you leithans have legs made for running,”</i> you chuckle, ");
	else output("\n\n<i>“That had to have sucked,”</i> you grunt, ");
	output("your mind flooding with images of alien dragons and titanic, flesh-eating monstrosities. You saw a couple holo-vids of Centauri monsters growing up, but actually hearing it from a leithan is a different story.");

	output("\n\n<i>“I guess,”</i> Ellie says with a shrug. <i>“Like I said, my grandparents left the homeworld. I’ve never seen it -- and why would I want to? It sounds pretty awful, and I’ve got my own little paradise right here!”</i> Her cheerful demeanor returns as she takes a look around the shop. Her eyes settle on a particularly broad-chested bull strutting in, and you’re immediately granted another whiff of the pheromone aura around her that just about makes your eyes water... and your flesh redden perceptibly. Maybe you could ask her about that heady scent sometime... that can’t be a racial trait, can it?");
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
	output("You find yourself unconsciously shifting  a little closer to Ellie, breathing in deep through your nose to drink deep of that heady, potent admixture of pheromones that seem to be all but pouring off of her. You manage to ask her about them, though you’ve barely gotten a word out before you notice your mouth is watering... and that you have a serious hankering to eat a little ‘taur pussy.");
	output("\n\nEllie blushes at your question, her ashen skin taking on a darker hue beneath her black armor plates. <i>“Sorry about that, hun. We leithan girls have a pretty strong smell during mating season, they tell us. I just about drive the studs wild if they get downwind of me... they turn into big, randy piles of fuck ‘fore they knew what hit ‘em. Just the way I like it!”</i> she giggles, her thick tail curling up a bit, tenting the pink blanket covering her lower body and letting another wave of her strong sex-odor wash over you.");
	if(pc.hasCock()) 
	{
		output(" Your cock feels like it’s about to bust a nut");
		if(pc.isCrotchGarbed()) output(" right in your [pc.lowerGarment]");
		output(".");
	}
	else if(pc.hasVagina()) output(" Heat washes over your [pc.cunt], and you shift uncomfortably as it begins to drool excitement, totally ready to spread open for the first cock to take it... or a big, thick, reptilian tail...");
	output(" It takes a force of will not to throw yourself into the leithan girl’s arms. Not that you think she’d mind.");

	pc.lust(33);

	output("\n\n<i>“I guess I’m a little bit worse than average, though,”</i> Ellie admits, watching your reaction with keen interest, her twin-pupiled eyes wandering across your flushed body. <i>“The Treatment does funny things to non-humans. It makes ausars into big, angry puppies; turns rahn libido up so high they just can’t pry themselves off of any cock they can find, like they’re </i>hungry<i> for it... and me? I guess it decided every day was breeding season, and I’m always putting out these sweet little pheromones... which really just means I get to </i>put out<i> more for the bulls that get a whiff of them!”</i>");

	output("\n\nShe grins, clearly proud of her talent for chemical seduction. <i>“Of course, none of the bulls can get me pregnant no matter how much my body’s begging for it. Leithans don’t breed right with anybody not from our planet: no matter how fertile you are, if you aren’t leithan, you just can’t knock us up. Or get knocked up by us. Good thing there were a whole bunch of us that came to New Texas way back, or we’d be in trouble!”</i>");

	output("\n\n<i>“So, you can’t breed with other races? Not even after getting Treated?”</i>");

	output("\n\n<i>“Nope,”</i> Ellie says, her grin fading somewhat. <i>“Believe me, </i>plenty<i> of bulls have tried. They always think they’re gonna be the one, but... no. It takes some serious science to get a half-leithan born, and a lot of credits.");
	if(pc.originalRace == "half-leithan") output(" You’d know, after all. Your mom and dad must have spent a fortune making sure you got here.");
	output(" Around here, though, not being able to breed is... well, it could be better. A lotta bulls get tired of trying after a while. After all, what’s the point of fucking a mare full of cum ‘till she looks pregnant if it ain’t gonna do anything? Not that I don’t have a lot of fun in the trying, but I guess the boys are always gonna go back to the soft lil’ cows and fill ‘em with babies.”</i>");

	output("\n\nEllie shrugs. <i>“At least there’s a nice, steady stream of bulls still wanting to try - at least the once! Lucky me, my pheromones pretty much guarantee I’ll always have someone to play with.”</i> She grins, chewing on her lower lip and squeezing her shoulder together to emphasize her impressive rack, all but jiggling it in your face now. <i>“Speaking of which... what do you say, [pc.name]?");
	if(pc.hasCock()) output(" <i>“Care to test your lil’ swimmer’s luck?”</i>");
	else output(" <i>“I’m feeling all down now. You wanna step out back and help a girl get her spirits up?”</i>");
	nephAffection(5);
	clearMenu();
	if(pc.lust() >= pc.lustMax())
	{
		addButton(0,"Yes",ellieSexScene,undefined,"Yes","You're too horny to turn an offer like this down!");
		addDisabledButton(1,"No","No","You're too horny to turn this down!");
	}
	else
	{
		if(pc.lust() >= 33) addButton(0,"Yes",ellieSexScene,undefined,"Yes","Take the taur-girl for a roll in the proverbial hay.");
		else addDisabledButton(0,"Yes","Yes","Somehow, despite the pervasive musk, you aren't aroused enough for sex.");
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
		if(pc.longestCockLength() > 12) output(" And your dick’s going to get HUGE. Like, waaaay bigger than before.”</i> Her eyes flutter. <i>“Nothing better than a huge, Treated dick pounding my pussy... promise me you’ll let me be your first test run when you get treated, okay? I love being first in line to sample all the brand new, massive beast-cocks. Perks of being the sho-keep!");
		output("”</i>");
	}
	output("\n\nAfter a moment, Ellie adds, <i>“I guess I ought to mention that the Treatment’s permanent. Like, totally permanent. I think the Treatment’s the best thing that ever happened to me - and so does just about everyone who takes it. But, you know, you better be absolutely sure about it before you take it.");
	if(silly) output(" Or you could save scum I guess. Whatever!");
	output("”</i>");
	pc.lust(3);
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
	output("You ask Ellie to tell you a little bit about New Texas.");
	output("\n\n<i>“Other than that it’s a paradise?”</i> she teases, giving you a playful wink. Her whole body shifts as she chuckles, her breasts bouncing gaily under their inadequate restraints. <i>“It really is, though. Back on Centauri II, there was a whole religion that said that somewhere out there was a world of green fields and plentiful water - and milk. Turns out they were actually right, and here we are!”</i>");
	output("\n\nShe smiles dreamily, leaning down over the counter. <i>“New Texas is... I couldn’t imagine living anywhere else. It’s as peaceful as you want it to be, and the planet’s clean and full of trees and crops and life! Not like the real core worlds, just big cities that stretch over whole worlds until you can’t breathe for all the people and smog. Speaking of people: we have the friendliest, most beautiful people in the whole galaxy: where else are you gonna find a whole planet where every girl’s got a huge rack swollen with milk, big child-bearing hips, and a smile that makes you wanna just pick her up and kiss her?”</i> Ellie turns her own smile to you, and you can’t deny the urge is there... until you realize you’re stewing in a much thicker cloud of pheromones than was there before. She blushes, and continues. <i>“And the men? Every one of them is big and strong as an ox - or a bull, as the case may be. They might be gruff sometimes, but there’s barely a bull on the world that won’t drop trou and give you a good long fucking if you ask for it! Isn’t that right, boys?”</i>");
	output("\n\nSeveral bulls in the shop murmur their agreement. Most are already sporting bulges in their work clothes.");
	output("\n\nShe gives them a winning smile and a wiggle of her hips, full of promise. <i>“See? Friendliest planet in the whole galaxy! Especially if you’re Treated: there’s a reason most New Texans never want to leave, after all: why would they, when there’s everything we need right here? Good, honest work for all who need it, and good, hard fuckings when you’re done. That’s the New Texan way!”</i>");
	output("\n\nYou tell Ellie that’s all very tempting. But maybe she could tell you a little about the planet itself. Who runs the place, and where does it sit in the galactic scene.");
	output("\n\n<i>“Not quite ready to buy your cabin yet?”</i> she tsks her tongue at you, clearly teasing. <i>“Well, how’s this for convincing: NT’s run by the biggest bull you’ve ever seen, Benjamin Tiberius Tee. Or Big T. to most of us. He’s the nicest governor a planet could have: there hasn’t been a tax hike, a riot, or a shortage of... anything... while he’s been in office. Our little planet might be a natural paradise, but Big T. turned it into a utopia. There’s a good reason so many people move to New Texas... other than us cute lil’ Treated girls, anyway!”</i>");
	output("\n\nEllie wiggles happily, her tail threatening to knock racks of medi-pens down behind her. <i>“Oh, and you asked about how we fit in the galaxy... aside from the prettiest girls and burliest boys, you mean? Well, we’re one of the galaxy’s biggest suppliers of milk: both from our local girls and the REAL cows. The four-legged kind.”</i> Ellie looks back, pretending to count her own legs before nodding and turning back to you with a grin. <i>“Cow-girl milk is a delicacy on a lot of planets nowadays, you know. The Treatment gives human milk that rich, full, creamy taste that actual cows have.”</i>");
	output("\n\n<i>“Leithan milk, on the other hand...”</i> Ellie says, cupping her huge tits. The sheer volume of the oversized orbs leaves them spilling out around her fingers, completely hiding her hands under her bust. With the added bit of pressure on her teats, your eyes are treated to the sight of a little trickle of milk escaping her saucer-like nipples, staining through her sheer bra. <i>“... is very, very sweet. Almost like candy, especially now that I’m Treated. Or maybe that’s </i>because<i> I’m Treated? Never had leithan milk outside of New Texas. Either way, you should definitely try some! It might be sweet, but my milk packs a punch: to most non-leithan creatures, it has a mildly alcoholic effect, and it’s <i>loaded</i> with my special Treated blend of hormones, guaranteed to make you so horny you can’t think straight. It’s perfectly healthy for LEITHAN kids... but if someone else drinks it, well... enjoy your day-long " + pc.mf("","girl-") + "boner! That is, unless you want me to take care of it for you afterwards? Nothing puts me in the mood to give a nice, gentle ");
	if(pc.hasCock()) output("hand-job");
	else if(pc.hasVagina()) output("pussy-fingering");
	else output("ass-teasing");
	output(" like a " + pc.mf("handsome stud","cute girl") + " suckling on one of my tits!”</i>");
	output("\n\nAnd you thought you were swimming in leithan-musk before... your mouth is absolutely <i>watering</i> now. And you have an incredible urge for ");
	//if Treated or Bimbo’d:
	if(pc.isTreated() || pc.isBimbo()) output("a mouthful of tit to suckle from");
	else output("a tall glass of milk");
	output(".");
	processTime(11);
	pc.lust(3);
	nephAffection(5);
	//Suckle or back option?
	clearMenu();
	addButton(0,"Suckle Her",suckleDatCowtaurTeat,undefined,"Suckle Her","She's offering - you might as well make use of it.");
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
	else pc.createStatusEffect("Ellie's Milk",0,0,0,0, false, "LustUp", "Ellie's milk is keeping your body more aroused than normal. You'll have to wait for it to wear off before your body goes back to normal.", false, 1440);
	output("You ask Ellie if she wouldn’t mind sharing some of her milk with you. By the looks of things, she’s got plenty to spare.");
	output("\n\n<i>“I certainly do!”</i> Ellie says proudly, cupping one of her hefty tits. ");
	if(flags["SUCKED_ELLIES_TITS"] == undefined) 
	{
		output("<i>“I gotta warn you, though, leithan milk might be super-duper sweet, but it’s also a little alcoholic. Or has that effect on most people, anyway. More importantly, though, it’s laced with my own special blend of hormones that’ll make you so horny you can’t think straight!”</i>");
		output("\n\nYou nod your understanding. ");
		flags["SUCKED_ELLIES_TITS"] = 1;
	}
	if(pc.isTaur()) output("<i>“Just take a seat, hun, and lean over the counter here...”</i> Ellie says, gently guiding your shoulders until you’re nearly touching her over the thin counter - or more accurately, your face is nearly buried in her milky cleavage.");
	else output("<i>“Let’s just get you to take a seat. Trust me, you want to be sitting down for this!”</i> she adds, pulling you up onto counter, facing her - or more accurately, her ample rack.");
	output(" <i>“Perfect!”</i>");

	output("\n\nYou can’t help but notice the rather... public setting as Ellie steps back and  admires you. Several bulls loom in a bit closer as the busty centaurin pulls a little strap in her sheer, latexy bra-front. The cups peel away, letting a little trickle of excess milk drool down onto the floor and into a drain behind the counter. Ellie blushes as her lactic bounty dribbles down her front, but quickly turns back to you and chews her lip, her forelegs carrying her a step closer until one of her saucer-sized teats in brushing against your cheek. Your eyes catch sight of more than a few boners popping in the little crowd in the store behind you as Ellie’s bosom is bared for you.");
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
	output("\n\nThe leithan grins as you squirm, though you can’t help but notice her own skin flushing in turn. <i>“Do you like it?”</i> she asks, almost shyly. You answer comes in the form of a nod and an unintelligible grunt as another trickle of alien lactation trickles into your mouth, so sweet you nearly wince when it teases across the tip of your tongue. Instead, though, you find yourself digging your fingers into the great swells of Ellie’s breast and starting to suck, just a gentle pressure at first, but enough to draw forth a steady stream from your tauric lover’s teat. She moans in response, breath catching in her throat as you start to really milk her. Her hands press your head deeper into her bosom, holding you close as you drink deep from her. Ellie’s bounty seems nigh-endless, too: you gulp and gulp down mouthfuls of her sugary milk, and yet there’s always more where that came from! Her flow of sweet nectar only seems to increase as you suckle, until you feel like you’re trying to drink down a river! You can almost feel her breast shrinking as its heavy burden is drained away, going from milk-swollen simply huge and jiggly. Ellie’s little moans of pleasure carry a touch of relief in them as you eagerly drain her bosom dry.");
	output("\n\nYou only later notice that you’re moaning, too: needy, desperate little moans as her milk begins to affect you. Even before you started drinking, Ellie’s pheromones had made you blatantly aroused, barely able to hide your chemical excitement around the musky centaurin. Now, your desperate need is almost painful, your lusts boiling until you can’t think of anything but your raging excitement and how beautiful, soft, and warm the teat in your face is. You concentrate on that, trying to stay grounded from your lust. All of your attention focuses on Ellie’s breast, your fingers starting to knead and squeeze it, playing with the little patches of straining scales and plates that would all but cover a normally-endowed leithan’s rack. On Ellie, her plates look like tiny freckles of black compared to the immensity of her bosom, doing absolutely nothing to hide or support it. Your body, at least, is doing the latter: you completely lose yourself in the leithan’s cleavage, with no small help from her hand’s guidance, nuzzling against the hot, sheer curve of one tit as you suckle from the other.");
	output("\n\n<i>“You’re starting to feel it, huh?”</i> Ellie teases, her free hand gently playing across your ever-more relaxed body. Every brush of her fingers feels like a starburst on your tender flesh - God you’re sensitive now! When her hand moves down your thigh, you nearly feel yourself cumming on the spot - just from the briefest touch. Oh, fuck. <i>“Like I said, my milk will just drive you wild.... Don’t worry about a thing, sweetie, just let me take care of you. I’ll be gentle.”</i>");
	output("\n\nAs she speaks, her hand slips further up your thigh, fingertips brushing across your [pc.crotch] and sending an electric fire of pleasure up your spine. You almost choke on your current mouthful of milk. Do you let Ellie have her way with you?");
	pc.lust(90+rand(20));
	processTime(8);
	pc.energy(200);
	//yes/no
	clearMenu();
	if(pc.hasCock()) addButton(0,"Yes-HJ",getAHandyFromEllie,undefined,"Yes-HJ","Get a handjob while you drink.");
	else addDisabledButton(0,"Yes-HJ","Yes-HJ","You need a penis to get a handjob.");
	addButton(1,"Yes-Finger",getFingerByEllieDuringMilkDrinking,undefined,"Yes-Finger","Get fingered while you drink.");
	if(pc.isTaur()) addButton(2,"PublicUse",publicUseForBullsByCentaurians,undefined,"PublicUse","Put yourself up for public use while you're drinking. You're horny enough to fuck just about anyone anyway.");
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
	output("You answer Ellie with a little nod, spreading your [pc.legOrLegs] a bit to give her access to your rock-hard [pc.cock]. <i>“Good " + pc.mf("boy","girl") + ",”</i> Ellie coos, starting to strip your [pc.gear] off. <i>“Nothing gets me in the mood to tug on a [pc.cock] like a gentle mouth on my tits, suckling like a babe... speaking of which, what do you say to switching tits, huh? Poor righty’s feeling awfully left out.”</i>");
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
	output("\n\nEven as Ellie cleans her hand off, though, you’re left with a suddenly sinking sensation as you realize that you’re [pc.cock] isn’t getting any softer. Her twin-pupiled eyes wander back down to it as she licks the very last of your first load from her hand, and she gives you a knowing wink. <i>“I said a whole day, didn’t I? Don’t worry, hun, I’ll take such good care of you...”</i>");
	output("\n\nYou moan as Ellie’s freshly-cleaned hand slips back down and wraps around your [pc.cock] again, and that same almost-overwhelming pleasure rocks your body instantly. She starts to slowly, tenderly move her slick hand across your turgid length, languidly taking her time in getting you off a second time. Thanks to that, you manage to last a whole minute before busting your nut again, soaking Ellie’s hand in your orgasmic fluids a second time. She giggles and repeats the same tactic, happily lick up every drop");
	if(pc.mf("","chick") == "chick") output(" that she doesn’t share with you, at least. And you’re more than happy to take it");
	output(".");

	output("\n\nBehind you, several bulls (and even a couple of cows!) are furiously beating their meat to the show you two are putting on, as utterly shameless in public as Treated folk are. Thanks to Ellie’s tender touch and the lacing of her potent, delicious, amazing... pheromones in the air, and now with a dozen bulls filling the little shop with the reek cum and male desire, your own horniness simply cannot abate. Your third orgasm passes with the same intensity of the first, and the sixth, when it comes. Your [pc.balls] seem");
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
	output("You answer Ellie with a little nod, spreading your [pc.legOrLegs] a bit to give her access to your [pc.crotch]. <i>“Good " + pc.mf("boy","girl") + ",”</i> Ellie coos, starting to strip your [pc.gear] off. <i>“Nothing makes me want to slip a few fingers into a tight little hole than a gentle mouth on my tits, suckling like a babe... speaking of which, what do you say to switching tits, huh? Poor righty’s feeling awfully left out.”</i>");
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
	output("You desperately want to get off, but the positioning just isn’t working in your favor. Ellie’s hands brush your thighs, caressing your bestial body, but there’s no way she can get a proper reach on your back-mounted genitalia. Frankly, you’re desperate enough now that it doesn’t much matter who sates your lusts.");
	output("\n\nEllie sees this, and coos appreciatively. <i>“Don’t you worry, sweet thing, I’m sure all these bulls wouldn’t mind giving you a little relief, would they?”</i>");
	output("\n\nYour attention is drawn behind you, where several bulls (and even a couple of cows!) are furiously beating their meat to the show you two are putting on, as utterly shameless in public as Treated folk are. You barely resisted Ellie’s touch, thanks to the lacing of her potent, delicious, amazing... pheromones in the air. With a dozen bulls filling the little shop with the reek cum and male desire, you can’t help but give into your slutty nature. With a little whine, you shift your weight up onto the counter and spread your [pc.legOrLegs], giving your [pc.hips] a slutty, and very inviting little wiggle.");
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
	output("\n\nYou don’t have the opportunity to answer Ellie through your face full of boob, but your body does the talking for you as you milk another thick, hot wad from a bull. When the third slides into your now sloppily lubed-up hole, your cum again, a wave of pleasure erupting from your bestial back-side and wracking the rest of our body. The lucky bull chuckles as your muscles writhe around his plunging cock, though that just means that it isn’t long before he’s cumming to, flooding your ");
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
	clearMenu();
	addButton(0,"Next",mainGameMenu);
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
	if(flags["ELLIE_SEXED"] == undefined) output("<i>“I thought you’d never ask, sugar!”</i> she says with a giggle that does the most amazing things to her jiggly rack.");
	else if(flags["ELLIE_SEXED"] < 4) output("<i>“You wanna go again, sugar?”</i> Ellie says, barely hiding the surprise - or the delight - in her voice. <i>“I’d be delighted to.”</i>");
	else output("<i>“You just can’t get enough of me, can you sugar?”</i> Ellie teases, though you can already smell the tell-tale increase of her arousal. <i>“C’mon then, let’s get out of here!”</i>");

	output("\n\nEllie reaches under the counter and sets a tiny <i>“Out on Break”</i> sign atop it. That done, she gives you a giddy little grin and takes you by the hand, leading you out the shop’s back door. There’s not much of a back room, per se, so much as a loading dock cleverly concealed from the front of the rustic ranch house and stuffed with crates full of milking machines, Treatment medi-pens, and girly cow-pattern clothes. Ellie leads you a little ways into the dock to a far corner stacked with brightly-colored pastel pillows. Several bottles of lube and spare pink horse blankets are scattered haphazardly across the cushioned corner.");

	output("\n\nOnce you’ve arrived, Ellie releases your hand and canters ahead, clambering over a few of the thicker bunches of pillows until she’s reached the far wall. The leithan slut plants a hand on a heavy-duty support bar bolted onto the wall and casts a come-hither glance over her shoulder, patting her tauric flank invitingly. <i>“");
	if(!pc.isNude()) output("Toss those clothes off and c");
	else output("C");
	output("ome on over, lover. Don’t be shy.”</i>");

	output("\n\nYou eagerly pull your [pc.gear] off and hurry towards your leithan lover, sidling up behind her and planting a hand on the hot, soft material of her blanket. Seeing where your attentions are directed, Ellie’s all too happy to unbuckle the straps around her humanoid waist, making it easy for you to yank it over one of her flanks... and be immediately assaulted by an overwhelming wave of her pheromones, so concentrated that you nearly orgasm from the mind-melting, mouth-watering scent alone.");
	output("\n\nEllie giggles, chewing on a finger. <i>“Sorry, babe. Guess I got a little pent up under there... but you don’t look like you mind much!”</i>");
	output("\n\nCompletely on auto-pilot, your body moves in toward the source of that wonderful musk, nestled between her powerful back legs and hidden beneath the base of her curling reptilian tail. She takes a little step forward, several of her clawed feet scraping at the floor in anticipation as you eagerly brush her tail aside and reveal the soaking slit of her pussy. It’s huge, sodden, and smells so sweet you want to just eat it up. Which is exactly what you do, when Ellie’s tail curls around your shoulders and mashes your face right into her aromatic honeypot.");
	output("\n\n<i>“Why don’t we start with you getting me off a couple times, sweet thing?”</i> she grins, her lower body shivering a little as you press into her back-facing crotch. You don’t find yourself struggling one bit against either her command or her soft, strong tail. Instead, you open your mouth wide, your tongue slipping out to caress the lips of her intoxicating sex. Her folds don’t need to part for you: you doubt they could actually pull together if she tried. Indeed, you doubt it would be too much of a feat to stick your whole head into that wide channel. For now, though, you content yourself to munch on her lips, giving them little bites and nibbles, letting your tongue savor their sweet, slightly bitter taste. Her juices come a moment after you start, smearing across your cheeks, chin, even drooling down to splatter across your [pc.chest].");
	output("\n\nYou move faster the more excited Ellie gets, your tongue darting in to tease at her inner walls, fingers even getting in on the action to caress her outer folds. Your tauric lover coos with delight when your wandering mouth finds a particularly tough, almost bulging nub just inside her pussy, just at the end of your tongue’s reach. <i>“Oooh, that’s the spot,”</i> she purrs, cupping one of her huge tits. Her saucer-sized teat responds to the stimulation immediately, squirting a thick trickle of milk into her bra. She flashes you a grin, twisting on her hips so that you can see the her lactating tits soak straight through the sheer material of her bra, never spilling a drop but still making sure that her tits are plainly visible through it.");
	output("\n\nYou only glance up for those few precious moments to see your lover’s bountiful bust on full and blatant display before returning your focus back towards the delicious gash between her hind legs. Ellie shivers happily as your tongue probes in toward that wonderfully sensitive spot inside her, and her thick, leathery tail squeezes affectionately around your shoulders. <i>“Mmm, keep that up, " + pc.mf("big boy","pretty girl") + " and I’m liable to... liable to...”</i>");
	output("\n\nHer body finishes the thought for her: her gaping cunt contracts around you, the slick walls rubbing against your tongue and her muscles go wild with sexual gratification, worked over the edge by your eager mouth. You’re treated to a faceful of wet, sticky tauric juices as Ellie cums, her hips grinding her pussy back against your face. Your vision swims as you’re laced with her aromatic, sweet-tasting girl-spunk, left in a heady cloud of leithan-musk and Ellie’s sexual release.");
	output("\n\nShe shudders, leaning heavily against the wall, and her leathery tail releases its grip on you. You stagger back, wiping at the sticky webs of taur-cum splattered on your cheeks");
	if(pc.hasHair()) output(" and through your hair");
	output(". Ellie gives you an apologetic smile, saying <i>“Sorry babe. If you couldn’t tell, I needed that...”</i>");
	output("\n\nThe tip of her tail flicks across your cheek, wiping away a bit of her girl-spunk... only to turn around and drive itself into her twat. Ellie gives a little gasp as her tail sinks into her cum-soaked snatch, spreading her black lips wide open around its thick girth. <i>“Mmm, now what am I going to do with you, sweet thing?”</i> Ellie coos, cupping her tits and wiggling her animalistic hips as she spears herself. Her twin-pupiled eyes regard with you a look of lust and unrestrained desire...");
	pc.lust(300);
	processTime(14);
	flags["ELLIE_SEXED"] = 1;
	clearMenu();
	//Scene routing here!
	var scenes:Array = new Array();
	if(pc.hasCock())
	{
		//Mount Her (Centaurs, any dick size)
		if(pc.isTaur()) scenes[scenes.length] = centaursOnCentaursOnCentaursOnCentaursThisShitIsLikeInception;
		else if(pc.biggestCockLength() < 12)
		{
			//Little Dick, First Time
			if(flags["ELLIE_EMBARASSED_LIL_DICK_FUCK"] == undefined) scenes[scenes.length] = littleDicksGetToPlayForTheFirstTime;
			//Anal (Little Dick Repeat)
			else scenes[scenes.length] = littleDicksGetToGoRoundTwo;
		}
		//Vaginal (Big Dick)
		else scenes[scenes.length] = ellieBigDickVaginalScenesForBigDickBoysWithBigDicksAndNowImJustTypingBigDicksAsManyTimesAsPossibleInThisBigDickFunctionName;
	}
	//Get Tailpegged (F/ForN)
	if(pc.hasVagina() || !pc.hasCock()) scenes[scenes.length] = getTailPeggedByTaurBitches;
	//Pick a scene and add it to a button - really no random yet but more could be added.
	//I just wanted to be as robust as Ellie's snatch.
	addButton(0,"Next",scenes[rand(scenes.length)]);
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
	output("aligning yourself behind the leithan slut’s spread hind legs. She flashes you a sultry grin and wiggles her hips, smearing a little of her fem-spunk across your [pc.crotch] and thighs, and especially over the diamond-stiff shaft of your [pc.cockBiggest]. Ellie’s pheromones had you hot and ready to fuck the moment you walked into her shop; finally you can act on your primal urges to breed that leithan cunt until it’s dripping with your seed.");
	output("\n\nYou grab your hefty cock and bring the full weight of it down on Ellie’s butt, slowly dragging your monstrous shaft down her bestial thigh. She makes a throaty, whinnying sound of delight as you start to line yourself up with her sex. <i>“Mmmm, I can </i>feel<i> that, lover...”</i> Ellie coos, cupping one of her oversized udders and pinching the nipple until it squirts. <i>“");
	if(pc.biggestCockLength() <= 23) output("That’s a nice, thick cock... you’re hung just like the bulls here. I hope you’ve got their stamina, cuz you’re gonna be pounding me till I scream!”</i>");
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
	output("\n\nEllie doesn’t let you lag far behind her: her muscles wring and squirm all along the shaft of your [pc.cockBiggest], so tight and so hot, massaging every inch of your desperate prick. Her velvety pussy milks you, hard and long as Ellie rides out her own explosive orgasm, her body working to make sure you come with her into bliss. As turned on as you are, it doesn’t take long.");
	output("\n\n<i>“Come on, [pc.name], give it to me! I wanna feel your cum inside me! Flood my womb with your seed until I look fucking pregnant,”</i> Ellie whinnies, her tail coiling tightly around your waist and pulling you tight against her, hugging you close as your own climax nears.");
	output("\n\nA few more deep thrusts, and you begin to feel the familiar rush of orgasmic need rising in your [pc.balls]. Your [pc.hips] can’t move much with Ellie holding you like that, but they hammer what few inches your lover’s death-grip permits you, her chemical cloud rending asunder any lingering ability to hold back. With a final grunt of pleasure, you slap your hips into hers, relishing the squelching feeling of her overly-wet crotch mashing against your own. Buried to the hilt inside your tauric lover, you find yourself cumming, unleashing a thick spray of [pc.cumNoun] into the hot, sultry passage of Ellie’s bestial pussy. Her muscles go into overdrive at the feeling of your cum flooding into her, working hard to milk out every drop from you, to draw you deeper into her as you bust your nut into her welcoming womb.");
	output("\n\nWhen you’re done, you give a sated sigh and lean against the leithan’s armored backside, trying to catch your breath. Ellie’s hips wiggle eagerly against your crotch, her cum-soaked vaginal muscles contentedly massaging your still-twitching [pc.cockBiggest]. Her tail holds you steady for a long, long time, making sure you squirt every drop deep into her hungry cunt, keeping you trapped against her until you go soft enough to fall out of her on your own. When you do, you’re treated to a little waterfall of backed-up leithan spunk, mixed with a healthy dose of your own, which drools down");
	if(pc.legCount > 1) output(" between");
	else output(" along");
	output(" your [pc.legOrLegs] to splatter between her hind claws.");
	output("\n\n<i>“Oh, I needed that,”</i> Ellie moans, still massaging her huge tits. <i>“Nothing beats a big, thick cock and a belly full of spunk...”</i> At that, her reptilian tail releases you. You almost fall without her support, your [pc.legOrLegs] all but giving out after your desperate orgasm. With a little yelp, you flop back down onto the mass of pillows behind her, watching with a smile as the leithan’s tail twitches, and a trickle of your spooge drools out of her thoroughly-fucked twat. Smiling at you over her shoulder, the taur adds, <i>“You sure know how to fuck a big ol’ ‘taur like me, huh? Hmm... I wonder if any of you little swimmers will be the one, huh? You think you might get to be the lucky winner to finally knock me up? Guess we’ll see...”</i>");
	output("\n\nYou weakly give the centaurin a thumbs up. She giggles and picks you up, easily slinging you onto her back");
	if(pc.isTaur() || pc.isNaga()) output(", bestial body and all");
	output(" - the impact of which has the delightful effect of making her spooge-packed hole squirt a little of your seed back onto the floor. <i>“C’mon, sweetheart, let’s get you back to the shop.”</i>");
	processTime(25);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Little Dick, First Time
public function littleDicksGetToPlayForTheFirstTime():void
{
	clearMenu();
	author("Savin");
	showBust("ELLIE_NUDE");
	showName("\nELLIE");
	flags["ELLIE_EMBARASSED_LIL_DICK_FUCK"] = 1;
	output("<i>“Come and get it, big " + pc.mf("boy","girl") + ",”</i> Ellie purrs, withdrawing her arm-thick tail from her pussy, leaving her lips wide agape and drooling a web of excitement and anticipation. You all but leap at the opportunity, ");
	if(pc.tallness < 84) output("grabbing a smallish box to stand on and ");
	output("aligning yourself behind the leithan slut’s spread hind legs. She flashes you a sultry grin and wiggles her hips, smearing a little of her fem-spunk across your [pc.crotch] and thighs, and especially over the diamond-stiff shaft of your [pc.cockBiggest]. Ellie’s pheromones had you hot and ready to fuck the moment you walked into her shop; finally you can act on your primal urges to breed that leithan cunt until it’s dripping with your seed.");
	output("\n\nYou unceremoniously ram yourself in. Ellie’s pussylips part like a veil of silks for you, making way for your [pc.cockBiggest] to plunge into her sultry depths. She’s hotter than a human, boiling hot no matter how cold her blood may run! Her muscles move gingerly around you as you penetrate her, the slick slabs of flesh in her pussy almost kissing you, sucking your rod further and further in until you’re totally buried inside your leithan lover.");
	output("\n\nYou grip Ellie’s haunches, letting your fingers dig into the supple skin between her armored plates. Thanks to those plates, it’s easy to find a good grip on the tauric slut. She gives a strange, throaty nickering sound as you grasp her wide, bestial hips and start to really fuck her. Your [pc.hips] hammer into her, pounding away at the gaping hole of Ellie’s pussy, reveling in the wetness of her passage, the way her pussylips kiss at your cock every time you push into her. Grinning to yourself with mindless lust, you rear back and give Ellie’s butt a hard swat, feeling her scaly plates shudder under the impact and her bestial cunt contract around your thrusting [pc.cockBiggest] in the perfect way to drive you wild.");
	pc.cockChange();
	output("\n\nA few more thrusts, and you begin to feel the familiar rush of orgasmic need rising in your [pc.balls]. Your [pc.hips] can only move faster, Ellie’s chemical cloud rending asunder any lingering desire to hold back. With a final grunt of pleasure, you slap your hips into hers, relishing the squelching feeling of her overly-wet crotch mashing against your own. Buried to the hilt inside your tauric lover, you find yourself cumming, unleashing a thick spray of [pc.cumNoun] into the wide passage of Ellie’s pussy. You give a few final thrusts into her as you cum, using her squirming walls to help milk out every drop of your seed, pouring it deep into Ellie’s eager sex.");
	output("\n\nWhen you’re done, you give a contented sigh and lean against the leithan’s armored backside, trying to catch your breath. Ellie’s hips wiggle eagerly against your crotch, her cum-soaked vaginal muscles massaging your still-twitching [pc.cockBiggest]. After a moment though, you hear your lover ask, <i>“Hey babe, I can’t really see too well back there, but... you’ve been hanging onto me for a good little bit, you know? Aren’t you gonna go ahead and put it in me, yet? I’m starving for a good hard dicking, sweetheart...”</i>");
	output("\n\nYou feel a horrible, crushing sensation in your heart as the cheery leithan girl says the words no " + pc.mf("man","dick-wielder") + " wants to hear. You mumble under your breath that you just finished in her as you stumble back, looking at the huge, cum-soaked twat between Ellie’s haunches. No wonder she didn’t even notice, she’s built to take cocks bigger than your arm. When you step back, Ellie canters around and looks down at you, a sad glimmer in her normally bright eyes.");
	output("\n\n<i>“Aww, I’m sorry, sweetheart... I didn’t mean...”</i> she stops herself, chewing on her lower lip. <i>“Hey, look, it’s alright, [pc.name]. I don’t mind, honest. Come on, what do you say we go back to the shop and see about getting you the Treatment, huh? It’ll definitely give you a boost. Or maybe some gene mods? There’s plenty of things out there that’d give you a dick so big, even a leithan male would be jealous!”</i>");
	output("\n\nEllie gives you a reassuring pat on the shoulder as she leads you back to the storefront, drooling your cum back onto the concrete floor as she walks.");
	processTime(20);
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
	output("aligning yourself behind the leithan slut’s spread hind legs. She flashes you a sultry grin and wiggles her hips, smearing a little of her fem-spunk across your [pc.crotch] and thighs, and especially over the diamond-stiff shaft of your [pc.cockBiggest]. Ellie’s pheromones had you hot and ready to fuck the moment you walked into her shop; while you can’t act on your mind’s primal urges to breed that sultry leithan pussy, you can at least sate your chemically-aroused desires on a hole built for someone your size.");
	output("\n\n<i>“Not so fast, babe,”</i> Ellie grunts as you [pc.cockBiggest] brushes against the X-shaped hole of her butt. <i>“What do you say to a little lube first, huh? My pussy’s wet enough for just about anything, but my ass? Better safe than sorry...”</i>");
	output("\n\nYou grunt in frustration and pent-up horniness, but yield to your lover’s request. However, you won’t settle for something that came out of a bottle when there’s a hot, wet well of juicy lube rubbing up against you already. You redirect your [pc.cockBiggest] to the wide-open lips of Ellie’s black cunt, pushing yourself easily into its sultry depths. You move yourself in a circle around her wet, hot muscles, gathering up as much of Ellie’s natural lubricants onto your shaft as you possibly can. She looks over her shoulder, watching you with eager eyes while you prepare. Once you’ve got enough slippery taur-spunk slathered onto your rod to make sure that you’ll have an easy time with even the tightest of holes, you slide your hips back from the leithan’s bestial pussy and angle yourself back up toward your target. X marks the spot...");
	output("\n\nSeeing that you’re about the take the plunge, Ellie lifts her tail up and out of the way, curling the leathery appendage along her back to make herself nice and open for you. She flashes you a little smile as you grab her hips, and she starts to cup and squeeze her breasts again, milking herself ever so slightly in anticipation. The sight of her maternity bra filling up with lactic excess is enough to drive you onwards, and you start to press your [pc.hips] forward.");
	output("\n\nThe four folds of muscle that make up Ellie’s X-shaped asshole part easily, folding back against themselves as you enter her. The difference between her ass and pussy is like night and day: you can feel Ellie’s muscles worming and squirming around you, the beat of her powerful, head-sized heart thrumming through the tightly clenched passage. It feels like a hot, silken glove around your [pc.cockBiggest], a little warmer and drier than a normal girl’s pussy, but just as pleasant to sheathe your wang in.");
	output("\n\nYou easily sink in to the hilt, eliciting a long, low groan of pleasure for your enormous lover. <i>“Oh, now that’s the stuff...”</i> Ellie coos, her tail wiggling around your [pc.hips], pulling you in until your crotch squeezes tight against hers. You give a slight shiver as you feel your lover’s freely-flowing juices smear across your [pc.legOrLegs] and thighs, basting you in warm, sweet-smelling sex-musk that quickly makes it was up to your nose.");
	pc.cockChange();
	output("\n\nYou grip Ellie’s haunches, letting your fingers dig into the supple skin between her armored plates. Thanks to those plates, it’s easy to find a good grip on the tauric slut. She gives a strange, throaty nickering sound as you grasp her wide, bestial hips and start to really fuck her. Your [pc.hips] hammer into her, pounding away at the tight, wringing ring of Ellie’s asshole, reveling in the tightness of her passage. Her muscular folds kiss and suckle on your cock with every powerful thrust, as if trying to pull you deeper and deeper into her. Grinning to yourself with mindless lust, you rear back and give Ellie’s butt a hard swat, feeling her scaly plates shudder under the impact and her bestial asshole contract around your thrusting [pc.cockBiggest] in the perfect way to drive you wild. Ellie gasps and moans as you spank her plated behind, leaning her humanoid half against the wall and groping at her breasts to draw even more pleasure from her lusty body.");
	output("\n\nBetween your [pc.legs], Ellie’s tail starts to squirm and shiver, the muscles writhing around you. You try and ignore her wiggling tail, but its movements only become more and more urgent; you slowly realize it’s just the first sign of Ellie’s climax. The tauric beauty’s voice climbs a register higher over several low, lusty moans and cries of pleasure, her whole body shifting with your [pc.hip]’s impact against her, grinding and thrusting herself back against you. You can feel the lips of her gaping pussy contract hard, rubbing against your own crotch and smearing you with an ever-increasing veneer of sticky tauric girl-cum, painting your groin in a web of leithan spunk until you’re drenched in it. She’s not a squirter, but she’s a leaker, that’s for sure!");
	output("\n\nHer ass joins in the fun a moment later, squeezing down on your shaft hard enough to trap you, completely halting your thrusts into her save for tiny, shallow jerks of your [pc.hips], barely able to clear an inch from your lover’s powerful grip. Still, Ellie doesn’t let you lag far behind her: her muscles wring and squirm all along the shaft of your [pc.cockBiggest], so tight and so hot, massaging every inch of your desperate prick. Her ass milks you, hard and long as Ellie rides out her own anal orgasm, her body working to make sure you come with her into bliss. As turned on as you are, it doesn’t take long.");
	output("\n\n<i>“Come on, [pc.name], give it to me! I wanna feel your cum inside me!”</i> Ellie whinnies, her tail coiling around your waist and pulling you tight against her, hugging your close as your own climax  nears.");
	output("\n\nA few more restrained thrusts, and you begin to feel the familiar rush of orgasmic need rising in your [pc.balls]. Your [pc.hips] can’t move much, but they hammer what few inches your lover’s death-grip permits you, Ellie’s chemical cloud rending asunder any lingering ability to hold back. With a final grunt of pleasure, you slap your hips into hers, relishing the squelching feeling of her overly-wet crotch mashing against your own. Buried to the hilt inside your tauric lover, you find yourself cumming, unleashing a thick spray of [pc.cumNoun] into the vice-tight passage of Ellie’s well-fucked asshole. Ellie’s muscles go into overdrive, working hard to milk out every drop, to draw you deeper into her as you bust your nut into her welcoming backside.");
	output("\n\nWhen you’re done, you give a sated sigh and lean against the leithan’s armored backside, trying to catch your breath. Ellie’s hips wiggle eagerly against your crotch, her cum-soaked anal muscles contentedly massaging your still-twitching [pc.cockBiggest].");
	output("\n\n<i>“Oooh, that was nice, [pc.name],”</i> Ellie coos, her tail releasing you. You almost fall without her support, your [pc.legs] all but giving out after your desperate orgasm. With a little yelp, you flop back down onto the mass of pillows behind her, watching with a smile as the leithan’s tail twitches, and a trickle of your spooge drools out of her thoroughly-fucked ass. Smiling at you over her shoulder, the tuar adds, <i>“You sure know how to show a girl’s backdoor a good time, don’t ya? I might just have to let you do that again sometime...”</i>");
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
	output("\n\nEllie doesn’t let you lag far behind her: her muscles wring and squirm all along the shaft of your [pc.cockBiggest], so tight and so hot, massaging every inch of your desperate prick. Her velvety pussy milks you, hard and long as Ellie rides out her own explosive orgasm, body working to make sure you come with her into bliss. As turned on as you are, it doesn’t take long.");
	output("\n\n<i>“Come on, [pc.name], give it to me! I wanna feel your cum inside me! Flood my womb with your seed until I look fucking pregnant");
	if(pc.race() == "leithan" || pc.originalRace == "half-leithan") output(" - until I AM fucking pregnant");
	output(",”</i> Ellie whinnies, her tail coiling tightly around your hindlegs and pulling you tight against her, urging you to fuck her harder and deeper as your own climax nears.");

	output("\n\nA few more deep thrusts, and you begin to feel the familiar rush of orgasmic need rising in your [pc.balls]. Your [pc.hips] pound into her backside until you’re afraid Ellie will collapse under the weight and force of your fucking her - but she holds on, screaming and crying and spraying milk and fem-cum all over her pillows as she does. Her pleasured sounds and leaking fluids only making you ever more desperate to cum, her mounting chemical cloud rending asunder any lingering ability to hold back. With a final grunt of pleasure, you slap your hips into hers, relishing the squelching feeling of her overly-wet crotch mashing against your own. Buried to the hilt inside your tauric lover, you find yourself cumming, unleashing a thick spray of [pc.cumNoun] into the hot, sultry passage of Ellie’s bestial pussy. Her muscles go into overdrive at the feeling of your cum flooding into her, working hard to drain out every drop from you, to draw you deeper into her as you bust your nut into her welcoming womb.");
	output("\n\nYou keep hammering, your bestial hips thrusting deep into Ellie, using her squirming, cum-soaked channel as a milker to work out every drop of seed. You won’t stop until you’ve fucked her ");
	if(pc.race() == "leithan" || pc.originalRace == "half-leithan") output("fertile ");
	output("womb as full of your spunk as you can. She’s more than happy to take it, making pleasured little moans and sighs as you fill her, still squeezing the milk out of her tits into a growing pool on the floor between her forelegs. Finally, after a few minutes of catching your breaths and enjoying the feeling of simply being inside your leithan lover, you scramble off of her back, forelegs clattering to the floor. The moment your [pc.cockBiggest] slides from Ellie’s gaping cunt, a little flood of leithan-cum mixed with just a tad of your own excess spooge drools out of her parted lips.");
	output("\n\n<i>“Mmm, that was awesome, big " + pc.mf("boy","girl") + ",”</i> Ellie murmurs, patting her flank. <i>“Not a lot of bulls... heck, none... can do that to me. After that... you better do it to me again and again, ya hear? Oh, I’m still shaking from it,”</i> she adds with a giggle, hugging her arms around herself. You give Ellie’s big, cum-splattered hind an affectionate pat and offer her your arm. She takes it with a toothy smile, her bunny-like ears rubbing up against you as she snuggles close. Together, the two of you make your way back to the storefront.");
	processTime(31);
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
	output("<i>“Well, since you don’t have a big, throbbing bulldick to stick in me, I guess I’ll just have to return the favor the old-fashioned way, won’t I?”</i> Ellie says, licking her lips as she regards your nude form. <i>“Come on over, honey. I think I know just how to say thank you for that wonderful bit of pussy-eating...”</i>");
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
