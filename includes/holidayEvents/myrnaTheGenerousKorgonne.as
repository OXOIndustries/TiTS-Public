//Myrna: The Generous Korgonne
//A Christmas Submission by Lkynmbr24
//
//Summary
//Random encounter while exploring the snowy wastes of Uveto.
//Event only occurs during holiday season between Dec. 10th and Jan. 6th.
//On first encounter, she will be driving a mecha-reindeer powered sleigh to get around, loaded with a batch of pillaged goods.
//Lead reindeer has a glowing green nose, powered by savicite.
//Myrna is a treated snow-white Korgonne donning a Santa hat and coat. Notably smells like peppermint instead of mint like other Korgonnes.
//Short first encounter scene where she gives the PC a TF, and rushes off cheerfully.
//The free TF is a Peckermint Candy Cane.
//PC can afterwards find Myrna in one of the unoccupied Uveto caves.
//When there, Myrna will be surprised at the PC’s arrival, though she warms up to them afterwards, convinced they aren’t the <i>“aliens”</i> looking for their lost things.
//PC and Myrna can then discuss why she is doing what she is doing, giving out presents; generally acting outside of the norm for Korgonnes.
//Eventually, talk will lead to a repeatable sex scene where the Myrna orals the PC.
//(Time permitting) Will have a sex scene with the PC fucking Myrna.
//(Unsure about doing a variant for female PCs where she uses a savicite dildo on them. Depends on time constraints.)

public function showMyrna(nude:Boolean = false):void
{
	var nudeS:String = "";
	if(nude) nudeS = "_NUDE";
	showBust("MYRNA");
	showName("\nMYRNA");
	author("Lkynmbr24");
}

//First Encounter
////1% chance to encounter Myrna at any blue or white hostile square on the Uvetan moon surface.
public function myrnaMeeting():void
{
	showMyrna();
	output("\n\nYou hear a faint, but distinct ringing in the distance. You take a quick look at your surroundings for the source of the sound, only to turn up with nothing but white landscape. Shrugging your shoulders dismissively, you take a trudging step forward when another bell-like sound resonates from an unknown direction, followed by a rush of snow surging from outside your field of vision.");
	//If reflexes <50% of max: FEN NOTE - NOPE! Reflexes check!
	if(pc.reflexes()/2 + rand(20) + 1 < 24) output(" The wall of white slams into you before you can react, knocking you sideways and covering you from head to toe in the frigid precipitate.");
	else output(" You instinctively lurch to the side, narrowly dodging the brunt of the incoming wall of white, though some of it still manages to splatter onto you. A stray burst of snow flies upwards when you hit the ground, dusting you with the chilly precipitate.");
	output(" With a curse, you stand up to dust yourself off from the sudden avalanche, only to find yourself face-to-face with a truly unique sight.");

	output("\n\nBefore you stands a fairly large sleigh with nine mechanical reindeer harnessed to it. Each metallic cervine stands at about six feet high, adorned with red and green reins and saddles. At the lead of the herd is a smaller, slightly darker, brown-colored deer, though its most prominent feature is its nose. It glows a soft green, a feature that is absent from the rest of the metallic creatures.");
	//If the PC has not discovered savicite:
	output(" You have a sneaking suspicion that encased in the deer’s nose is a chunk of savicite, if the way your loins grow warmer when it tilts its head towards you is any indication.");

	output("\n\nThe sleigh itself looks highly advanced and is decorated to the brim with festive ornaments and baubles. It is also mottled in color, reminiscent of a cow pattern. From inside the seating compartment, a diminutive figure hops out onto the snow in front of you.");

	//If PC hasn’t met a Korgonne yet:
	if(!CodexManager.entryUnlocked("Korgonne")) 
	{
		output("\n\nYour codex chirps loudly, alerting you possible danger. Apparently this small creature is a female korgonne, an Uvetian native of this moon. They are known to be violent at times, and are wary at best of off-worlders. Stowing your codex away, you wonder why this one in particular doesn’t seem to mind boldly stepping up to you.");
		CodexManager.unlockEntry("Korgonne");
		output("\n\n<b>(New Codex entry unlocked: Korgonne.)</b>\n\n");
	}
	else output("\n\nYou assume that she is a korgonne by her stature. Usually the korgonne you’ve encountered have been largely hostile towards you, but this one in particular puzzles you to why they are boldly approaching you. ");
	output("Even more curious is her attire. She wears a bright red jacket with white fur trimming, with a matching pointy hat that has a puffy white ball at the tip. Her coat is wide open, revealing her fur-covered emerald green undergarments around her expansive breasts and hips. Despite the biting wind blowing in your face, a powerfully sweet scent emanates from her, growing stronger as she walks closer to you.");

	output("\n\n<i>“Alien!”</i> She barks, looking up to regard you with a wide smile. <i>“You in luck. Bring present for you.”</i> The roly-poly korgonne stretches out her arms, thrusting a phallic object into your hands. Before you can question it, the short-stacked canine turns around and climbs back into her sleigh.");

	output("\n\n<i>“Make many merriments! Enjoy gift! Myrna make all happy!”</i> With a sharp crack of her yappi strap, the reindeer rear up on their hind legs before galloping away, dragging the heavy sleigh behind them with korgonne in tow. When she disappears behind the nearby snow dune, to your surprise, the vehicle takes flight, mechanical cervines and all. With a hearty <i>“Ha ha haaa,”</i> she rides off into the distance until she is out of sight.");

	output("\n\nOk then...? Looking down at your hand, you examine the object that she gave you. At the head of the red and white dick-shaped candy cane, you notice a small tag. It reads: <i>“Looking to fill someone with the Yuletide spirit? Look no further! Take one Peckermint for hot, sticky, peppermint candy flavored cum. Take two for a candy cane colored cock!”</i>");
	//If PC has met Busky:
	if(flags["MET_BUSKY"] == undefined) output(" What in the moon is a korgonne doing with peckermint all the way out here? Doesn’t Busky usually sell the stuff during this time of the solar year? Questions for later.");
	else output(" Huh, this doesn’t look like an item that would be produced around here. In fact a <i>lot</i> of things about that weird korgonne didn’t seem natural at all! Many questions pop up in your head, wondering what that strange korgonne’s issue was, though it doesn’t do you any good to stand around and ponder on it.");
	output(" All you can do for now is stow the candy and move on from your odd encounter.\n\n");

	//PC gains 1x Peckermint Candy Cane.
	flags["MET_MYRNA"] = 1;
	flags["MYRNA_YEAR"] = new Date().fullYear;
	processTime(10);
	quickLoot(new Peckermint());
}

/* FEN NOTE: Cut the outside text due to laziness.
//Myrta can be found in a hidden cave after this scene. Preferably a new one that Ula isn’t findable in? (Preferably in a white area, otherwise up to devs)
//Map Text
//Tile hidden before the PC meets Myrna.

//Text for tile before cave (First Time): There is a cave not too far away towards the (cave direction here). Funny... you don’t remember seeing one here before. A faint, but familiarly sweet smell emanates from the cave, but more importantly, a warm shelter from the bitter cold is there if you need to stop off and have a break.

//[Enter] ~ //Tooltip: See what’s inside!

//Text for tile before cave (Repeat Times): Myrna the korgonne should still be occupying the nearby cave. You could drop by if you want. Maybe she’ll have another gift for you, and more, if you are so inclined.

//[Myrna]
//Inactive text: Myrna doesn’t look to be at her usual spot this time. You suspect that she’s moved on to find a new clan, since she hinted at doing so once she ran out of supplies. Hopefully you get to see the infectiously generous korgonne again some day.
//(Button greyed out to enter cave.)*/

public function myrnaEncounterBonus():Boolean
{
	if(TundraEncounterBonus()) return true;
	else
	{
		varkCaveBonus();
		if(flags["MET_MYRNA"] != undefined && isChristmas())
		{
			if(flags["MET_MYRNA"] == 1)
			{
				output("\n\nThere is a cave not too far away towards the east. Funny... you don’t remember seeing one here before. A faint, but familiarly sweet smell emanates from the cave, but more importantly, a warm shelter from the bitter cold is there if you need to stop off and have a break.");
				addButton(0,"Enter",repeatMyrnaEncounter,undefined,"Enter","See what’s inside!");
			}
			else 
			{
				output("\n\nMyrna the korgonne should still be occupying the nearby cave. You could drop by if you want. Maybe she’ll have another gift for you, and more, if you are so inclined.");
				addButton(0,"Enter",repeatMyrnaEncounter,undefined,"Enter","Myrna the korgonne should still be occupying the nearby cave. You could drop by if you want. Maybe she’ll have another gift for you, and more, if you are so inclined.");
			}
		}
		else if(flags["MET_MYRNA"] != undefined)
		{
			output("\n\nMyrna doesn’t look to be at her usual spot this time. You suspect that she’s moved on to find a new clan, since she hinted at doing so once she ran out of supplies. Hopefully you get to see the infectiously generous korgonne again some day. The cave she once took refuge in is snowed over. You doubt you could find the entrance without a significant amount of work.");
			addDisabledButton(0,"Enter","Enter","Myrna is gone, and the cave entrance snowed-over.");
		}
	}
	return false;
}

//Second Encounter
public function repeatMyrnaEncounter():void
{
	moveTo("MYRNAS CAVE");
	clearOutput();
	showMyrna();
	//Same year? Proceed as normal~
	if(flags["MYRNA_YEAR"] == new Date().fullYear && flags["MET_MYRNA"] == 1)
	{
		output("As soon as you enter the warm interior of the cave, your nose is assaulted by the sweet and familiar smell of peppermint. The walls of the grotto are lined with brightly lit electric candles that give off a pleasant heat. One thing you can surmise from your observations is that this cave is definitely being occupied by someone. Judging by the powerful bittersweet scent, you can only entertain one guess at who that may be. Curiosity takes you further into the cavern until you spot a familiar shapely figure kneeling by a crackling campfire. At the opposite side of the chamber rests a herd of mechanical deer, which look to be set to a standby mode. The sleigh is not far away from them, festive decorations glistening in the dancing lights of the fire.");
		output("\n\nWhen you take another step towards the korgonne, she immediately stands up and looks towards you in alarm. Her expression softens once she recognizes it’s you and tramps towards you, setting her bountiful assets in full motion.");
		output("\n\n<i>“Alien! It just you! You scare me. Thought you other aliens getting things back...”</i> She wraps her arms around you with a surprisingly crushing tightness for someone as small as her. You squirm in her grasp, not only because of the rapidly declining circulation of your blood, but the overwhelmingly powerful smell of peppermint wafting from her is starting to water your eyes. Before letting go, Myrna motorboats her wet nose into your ");
		if(pc.tallness <= 5*12) output("neck");
		else if (pc.tallness <= 7*12) output("[pc.chest]");
		else if (pc.tallness <= 8*12) output("navel");
		else output("groin");
		output(" before stepping back with a wide smile on her face, her long tail wagging a mile-a-minute the entire time.");

		output("\n\n<i>“No, not quite. I was");
		if(silly) output(" only dragged here because somebody pressed the ‘Enter’ button to make me come in here");
		else output(" just looking for some shelter from the cold and was curious about this cave");
		output(",”</i> you admit. The chubby korgonne quickly retreats towards the campfire and pats the space next to her.");
		output("\n\n<i>“Come, come. Share heat.”</i> Myrna beckons to you. Not seeing any reason to refuse, you walk over and take a seat next to her, your body immediately warming up thanks to the inviting fires. No sooner after you settle in, the coy korgonne lays her head on your lap, playfully gazing into your eyes.");
		output("\n\n<i>“Alien comfy. Want you be comfy too.”</i> You would think the sight adorably cute if it weren’t for a damp patch rapidly forming on the pup’s nethers, which is in plain sight due to her face-up position. Her natural pheromones grow more intense too, almost overpowering your urges to not just shove her head further into your crotch.");
		output("\n\n<i>“So, what alien want?”</i> she asks innocently.");
		flags["MET_MYRNA"] = 2;
	}
	//Repeat Encounters
	else 
	{
		output("When you enter the warm cave again, you are greeted once again with the familiar scent of peppermint. You follow the smell inside until you spot Myrna tending to her mechanical reindeer. As soon as you are within earshot, she immediately drops what she is doing and bounds over to you. With a tight hug, she squeals, <i>“Alien!”</i> You gently give her an affectionate pat on the head while she buries her face into your body. Once the two of you separate, the roly-poly korgonne sighs dreamily.");

		//If repeated visit:
		if(flags["MYRNA_YEAR"] == new Date().fullYear)
		{
			output("\n\n<i>“Haah... Alien smell good. Come for more heat shares?”</i> Myrna asks excitedly, practically bouncing on her padded toes. Once you nod in confirmation, the diminutive pup jumps into the air in jubilation before trotting towards the campfire and taking a seat.");
		}
		//If first visit after subsequent year:
		else 
		{
			output("\n\n<i>“Myrna miss you lots! Come to cave thinking old times. Good old times. Hope make good new times! Lots of catchings up!”</i> Myrna literally bounces on her pawed feet, very evidently excited to see you again. <i>“Alien smell good like always... miss smell. Miss heat-shares. Want more heat-shares?”</i> she asks eagerly. You wouldn’t have come back here if you weren’t intending on doing that! You tell the diminutive korgonne as much, prompting her to yipp with joy and trot over to the campfire to take a seat.");
			flags["MYRNA_GIFT_COUNT"] = undefined;
		}
		output("\n\n<i>“Sit, sit!”</i> Myrna calls over to you. You oblige, walking over to take your place next to the jolly korgonne. The very moment you sit down, she already places her head onto your lap, happily looking into your eyes with a laser-like focus.");

		output("\n\n<i>“Happy to see alien again!");
		if(flags["SEXED_MYRNA"] != undefined) output(" Looking forward to more heat share than just fire.");
		else output(" What want this time?");
		output("”</i>");
		//Update year!
		flags["MYRNA_YEAR"] = new Date().fullYear;
	}
	removeUvetoCold();
	processTime(20);
	pc.lust(10);
	myrnaMenu();
}

public function backToMyrnaMenu():void
{
	clearOutput();
	showMyrna();
	output("Is there something else you’d like to ask the roly-poly korgonne?");
	myrnaMenu();
}

public function myrnaMenu():void
{
	clearMenu();
	addButton(14,"Leave",myrnaLeave);
	addButton(0,"Appearance",myrnaAppearance);
	addButton(1,"Talk",myrnaTalk,undefined,"Talk","Talk to the little Santa impersonator.");
	if((flags["MYRNA_GIFT_CD"] == undefined || (flags["MYRNA_GIFT_CD"] != undefined && flags["MYRNA_GIFT_CD"] + 60*24 < GetGameTimestamp()))
		&& (flags["MYRNA_GIFT_COUNT"] == undefined || (flags["MYRNA_GIFT_COUNT"] != undefined && flags["MYRNA_GIFT_COUNT"] < 12))) addButton(2,"Gift",getGiftFromMyrna,undefined,"Gift","Receive a present from the generous korgonne!");
	else if(flags["MYRNA_GIFT_COUNT"] < 12) addDisabledButton(2,"Gift","Gift","Try coming back later for another present!");
	else addDisabledButton(2,"Gift","Gift","You’ve already received all your season’s greetings.");
	if(pc.lust() >= 33) addButton(3,"Sex",myrnaSexMenu);
	else addDisabledButton(3,"Sex","Sex","You aren’t aroused enough for this.");
}
public function myrnaLeave():void
{
	addUvetoCold();
	move("UVIP T44");
}

//[Appearance]
public function myrnaAppearance():void
{
	clearOutput();
	showMyrna();
	output("<i>“Like sight of me?”</i> Myrna croons while you stare her down perceptively. She fluffs her coat and squeezes her breasts enticingly towards you for added effect.");
	output("\n\nMyrna is a lightly modded korgonne, standing at about 4\' 8\" tall by your guess. She is a textbook definition of a short stack; well rounded F-cup jugs proportionate to her size, wide shapely hips, and plump bottom, ");
	if (CodexManager.entryViewed("The Treatment") && flags["MYRNA_MYRNA_TALK"] != undefined) output("all further enhanced by the treatment pen that she consumed.");
	else output("even more exaggeratedly so than any normal korgonne.");
	output(" She has a small bit of pudginess to her, which compliments her nicely.");

	output("\n\nThe small korgonne has rich, snow-white fur that blends in with the outside world almost perfectly so. A thick, long coat of matching hair extends from the top of her head down to about her chest. The main thing that distinguishes her from other members of her species is that her flesh color is a vibrant red, likely an effect of one of the transformatives she took. She smells strongly of peppermint, so much so that being directly next to her waters your eyes a little.");
	//If PC read treatment entry in codex:
	if (CodexManager.entryViewed("The Treatment") && flags["MYRNA_MYRNA_TALK"] != undefined) output(" You surmise that this is her natural scent complicating with some of the Treatment’s effects.");
	else output(" Normally korgonne have a bitter, regular minty scent to them, though it’s peculiar to you that she smells very sweet comparatively.");

	output("\n\nHer bright green eyes bore into yours, looking at you with hungry and lustful curiosity. While she just-as-intently stares you down, she adjusts her fur-trimmed red coat on her shoulders. Atop her head, she wears a matching pointed cap that is also trimmed with the same white fluff as her jacket. Her open cloth leaves her emerald-clad goods on display. In front of her fur-covered undergarments she wears numerous jeweled necklaces made from natural minerals that can be found on Uveto, weaved together with mineral fibers. Other than her green panties, she is completely pants-less, fully showing off her somewhat thick, but powerful digitigrade legs.");
	if(flags["SEXED_MYRNA"] != undefined) 
	{
		output(" Underneath of her bra and panties, she has adorable bright red nipples that are tuned to an extreme sensitivity. When tweaked enough, they produce a sweet, creamy milk that tastes delectable, especially with ");
		if(silly) output("a plate of cookies!");
		else output("desert.");
		output(" Her cooch shares the same trait, dribbling copious amounts of peppermint flavored pheromonal girl juices.");
	}
	myrnaMenu();
	addDisabledButton(0,"Appearance","Appearance","You’re looking at her right now, knucklehead!");
}

//[Talk]
public function myrnaTalk():void
{
	clearOutput();
	showMyrna();
	output("<i>“Oh, you only want talk? Okay. What talk?”</i> Myrna asks, a hint of disappointment in her voice. Nevertheless, this doesn’t stop her from nuzzling into your crotch further.");
	processTime(1);
	//[Belongings] [Myrna]
	clearMenu();
	addButton(1,"Myrna",myrnaMyrnaTalk,undefined,"Myrna","Ask her about herself. She seems different than a korgonne should be...");
	addButton(0,"Belongings",myrnaBelongings,undefined,"Belongings","Talk to Myrna about all the stuff she has. Where’d she get it?");
	addButton(14,"Back",backToMyrnaMenu);
}

//[Belongings]
public function myrnaBelongings():void
{
	clearOutput();
	showMyrna();
	output("<i>“So... about all those things?”</i> You motion towards the parked sleigh and reindeer. Myrna smiles widely.");
	output("\n\n<i>“Oh! Myrna find from empty star ship. Crash in snow, I think. Went to explore and found. Many new things never see before! Lucky find! Waste if leave there, so take what I can. Bring back to cave.”</i> She explains, growing more and more excitable as she tells her story. Her tail thwaps against your [pc.leg] loudly with each beat.");
	output("\n\n<i>“When find metal creatures inside, they no moving at first. Stay like stone. Think broken when hit with yappi strap, but creature nose open. Small hole inside so think to put favorite dildo inside. Suddenly they alive! So glowy and pretty, they follow me, so couldn’t leave there. I tie them to strange sleigh, finding warm fur inside too!”</i> Myrna fluffs up the coat wrapping around her sides, snuggling them close to her frame. <i>“Better than old wrappings! Think luck couldn’t get better! Went sit down in big chair and accidentally sit on pointy thing inside wrapping... All of sudden, Myrna feel really really good!”</i> The snow-white korgonne giggles.");
	output("\n\n<i>“Strange metal creatures very useful. Help me carry many things. Was surprise when find out they fly! Make things easy! Travel everywhere with them since. Great companions!”</i> Well, that explains quite a few things, but you still can’t help but wonder about a few other details as well...");
	processTime(5);
	flags["MYRNA_BELONGINGS"] = 1;
	addDisabledButton(0,"Belongings","Belongings","You just spoke with her about that!");
}

//[Myrna]
//available after [Belongings] talk.
public function myrnaMyrnaTalk():void
{
	clearOutput();
	showMyrna();
	output("<i>“What about you? You’re different from most other korgonne ");
	//If PC encountered a korgonne in battle:
	if(flags["MET_FEMKORGONNE"] != undefined || flags["MET_KORG_MALE"] != undefined) output("I’ve encountered here");
	else output("I’ve heard about");
	output(",”</i> you question. Myrna looks past you towards the ceiling in thought.");

	output("\n\n<i>“Mmm... Myrna really like alien sweets! Like, really really like!”</i> She yips, bouncing her head giddily on your lap while she nods vigorously. It takes a while before she winds herself down enough to talk again.");

	output("\n\n<i>“Well... anything else you can tell me?”</i> you ask once she fully settles down.");

	output("\n\n<i>“Myrna loves to give! Making happy is more fun than taking for own happiness. Use to be selfish. Very selfish. Was banished from old clan was in for this. Steal something from elders... It was own fault.”</i> Myrna confesses, sadness briefly staining her usual jolly demeanor. She smiles brightly once more after a quick recovery, already shaking off the errant thought. <i>“No problem for me no more. Plan finding new clan soon when things run out, since I am giving lots! Since magic feel-good prick, Myrna only want to give! Make smell like favorite sweet too!”</i>");

	output("\n\nYou inquire to Myrna on what she meant by a ‘magic feel-good prick’. ");
	//If PC has read treatment entry in codex:
	if(CodexManager.entryUnlocked("The Treatment")) output("Given the nature of the items that she scavenged, you are starting to have a sneaking suspicion of what that might be already. Your deductions are confirmed when she points to an empty syringe lying on a shelf a short distance away. Sure enough, it is an empty medipen of New Texas’s Treatment.");
	else 
	{
		output("She points a finger toward an empty syringe on a shelf nearby. The medipen looks innocuous enough from what you can tell, though you have a feeling your codex can tell you more about this item.");
		CodexManager.unlockEntry("The Treatment");
		output(" <b>(New Codex entry unlocked: The Treatment.)</b>");

	}
	output(" The moment you bring your gaze back to Myrna, her nose nuzzles into your loins, and she idly licks at it with her vivid red tongue.");

	output("\n\n<i>“Magic prick also make super horny all time. Not bad feeling. Mmm...”</i> The libidinous korgonne licks at your crotch once more. The already strong scent of peppermint grows more intense by the second. If you don’t slake both of your wants anytime soon, you feel like you will go into a rutting stupor off of the potent pheromones alone.");

	//+10 lust.
	flags["MYRNA_MYRNA_TALK"] = 1;
	processTime(6);
	pc.lust(10);
	addDisabledButton(1,"Myrna","Myrna","You just spoke to her about that!");
}

//[Gift]
//Greys out until 24 hours from last present received.
//Can be repeated up to 12 times before no more presents are given. (Reflecting 12 days of Christmas)
//Gift count refreshed when event triggers next IRL year.
//Tooltip: Receive a present from the generous korgonne!
//Tooltip if greyed out: Try coming back later for another present!
//Tooltip for silly mode: On the {Number of presents Myrna gave currently}{st/nd/rd/th} day of Christmas, my Myrna gave to me...
//MYRNA_GIFT_CD - stores CD till next gift
//MYRNA_GIFT_COUNT - stores # of gifts gotten this year. Reset on new year bump!

//Gifts #1~11
public function getGiftFromMyrna():void
{
	clearOutput();
	showMyrna();
	if(flags["MYRNA_GIFT_COUNT"] == undefined || (flags["MYRNA_GIFT_COUNT"] != undefined && flags["MYRNA_GIFT_COUNT"] < 11))
	{
		processTime(2);
		output("<i>“Ah! Alien! Myrna has another present for you! Is time for givings!”</i> Myrna exclaims while pulling out a small wrapped gift out of her coat pocket. It’s not very neatly packed, but you suspect the contents are otherwise unharmed. You thank the generous korgonne with a gentle pat on the head. Her bright red tongue lolls out of her mouth while you pet her, overly pleased with your affections.");

		//Type of present randomized from pool for first 11 gifts.

		//Credit variation (70% chance)
		if(rand(10) <= 6)
		{
			var creds:Number = 500 + rand(1501);
			output("\n\nYou carefully open the small box, unwrapping it until a credit chit is revealed. Neat! Thank you Myrna! You swipe the chit to your codex, adding " + creds + " credits to your account.");
			output("\n\n<i>“Come again next day! May have more for you!”</i> Myrna yips happily.");
			pc.credits += creds;
			clearMenu();
			addButton(0,"Next",mainGameMenu);
		}
		//Peckermint variation (10% chance)
		else if(rand(3) == 0)
		{
			output("\n\nYou carefully open the small box, unwrapping it until a familiar red and white phallic candy is revealed.");
			output("\n\n<i>“It Myrna favorite candy. Share joy of good sweet with you!”</i> The playful korgonne beams at you. Great! Thank you, Myrna! You stow the Peckermint candy into your inventory for later use.");
			output("\n\n<i>“Come again next day! May have more for you!”</i> Myrna yips happily.");
			output("\n\n");
			quickLoot(new Peckermint());
		}
		//Nutnog variation (10% chance)
		else if(rand(2) == 0)
		{
			output("\n\nYou carefully open the small box, unwrapping it until a bottle of Nutnog is revealed.");
			output("\n\n<i>“Sweet cream also very good! Hope alien enjoys!”</i> The generous korgonne beams at you. Great! Thank you, Myrna! You stow the Nutnog bottle into your inventory for later use.");
			output("\n\n<i>“Come again next day! May have more for you!”</i> Myrna yips happily.");
			output("\n\n");
			quickLoot(new Nutnog());
		}
		//Raw savicite ore variation (2.5% chance)
		else if(rand(4) == 0)
		{
			output("\n\nYou carefully open the small box, unwrapping it until a lump of dark green ore falls out. You immediately recognize it as savicite when you unwittingly touch the gem. A warm, fuzzy feeling shoots straight into your arm, and into your groin.");
			if(pc.hasGenitals())
			{
				output(" Your ");
				if(pc.hasCock()) 
				{
					output("[pc.cocks] stand");
					if(pc.cockTotal() == 1) output("s");
					output(" up in attention");
					if(!pc.isCrotchExposed()) output(" underneath of your [pc.crotchCover]");
					if(pc.hasVagina())
					{
						output(" and your [pc.vaginas] fully lubricate");
						if(pc.totalVaginas() == 1) output("s");
						output(" from the sudden stimulation");
						output(".");
					}
				}
				else if(pc.hasVagina())
				{
					output("[pc.vaginas] fully lubricate");
					if(pc.totalVaginas() == 1) output("s");
					output(" from the sudden stimulation.");
				}
			}
			output("\n\nMyrna gives you a cheeky smile from your reaction to touching the savicite. <i>“Hehe, alien look like [pc.heShe] really enjoy that! Hope enjoy when want too!”</i> While fighting back a blush, you stow the chunk of savicite into your inventory for later use.");
			output("\n\n<i>“Come again next day! May have more for you!”</i> Myrna yips happily.");
			output("\n\n");
			quickLoot(new Savicite());
			pc.lust(5);
		}
		else
		{
			//Kirkite, Satyrite, Picardine variation (2.5% chance for each)
			var gem:Number = rand(3);
			output("\n\nYou carefully open the small box, unwrapping it until a small lump of ");
			if(gem == 0) output("kirkite");
			else if(gem == 1) output("satyrite");
			else output("picardine");
			output(" falls out. Your eyes light up wide when you realize the generous korgonne just gave you a rare and valuable gem!");

			output("\n\n<i>“Are you sure about this?”</i> you ask Myrna in disbelief. Her smile grows even wider while you sit flabbergasted.");

			output("\n\n<i>“Is sure! You keep! Smile on face I ask in return. Only selfish request.”</i> You scoop the hapless korgonne in your arms in a grip to rival her hugs. Myrna welcomes your embrace, nuzzling into your chest and squeezing back just as hard. By the time you let go, the both of you are completely out of breath. With a wide, weary smile, you stow the ");
			if(gem == 0) output("kirkite");
			else if(gem == 1) output("satyrite");
			else output("picardine");
			output(" crystal into your inventory for later use.");

			output("\n\n<i>“Come again next day! May have more for you!”</i> Myrna yips happily.");
			output("\n\n");

			if(gem == 0) quickLoot(new Kirkite());
			else if(gem == 1) quickLoot(new Satyrite());
			else quickLoot(new Picardine());
		}
	}
	//Gift #12
	else
	{
		output("<i>“Alien! Have one more present. Think best of all. Open!”</i> Myrna thrusts another small box into your hands. You notice that the present this time is much more neatly wrapped than all of the other ones were. She definitely looks like she put quite a bit of effort into this one, which piques your interest even more. It also feels much lighter than all of your previous gifts from her.");

		output("\n\nAfter giving another appreciative pat on the korgonne’s head, you peel open the wrapping on the package until the box inside is exposed. ");
		//If first time:
		output("You open the lid to peek inside, only to be assailed by an extremely bittersweet, but musky scent. Once the initial shock of the smell wears off, you slide the top box the rest of the way, revealing an emerald green cloth inside. Carefully, you reach inside and take out the bundle of fur and silk and unfurl it. Sure enough, it is one of Myrna’s pheromone soaked panties! You look past the undergarment towards the festively dressed korgonne to find her looking away and blushing. It’s not a usual occurance to see her look as bashful as she is now.");
		/*else - FEN NOTE - cut this as the other pieces add no real value but a fair amount of extra complexity and edge cases to account for.
		else
		{
			output("You open the lid to peek inside to be met with a familiar warmth that envelops you and especially your loins. When you slide the top of the box the rest of the way, you pull out an intricately designed ");
			var trinket:String = RandomInCollection(["necklace","bracelet","anklet"]);
			output(trinket + " adorned with several glowing jewels made of savicite. You look past the accessory towards the festively dressed korgonne to find her looking at you with an expectant expression on her face.");
		}*/
		output("\n\n<i>“Myrna know it not material gift, but alien give me great time in cave. ");
		/*If second time onwards: 
		if(flags["MET_LUMI"] == undefined && ) output("Took me a while, but have help from Lumi of Korg’ii Hold to make. ");*/
		output("Many good times. Want to give part of me, for when I move out. Not here much longer.”</i> She looks wistfully towards the parked reindeer nearby. <i>“I give you something to remember me. Hope alien like.”</i>");
		output("\n\nYou sweep the doleful korgonne into your arms, giving her a gentle hug. She returns the gesture in kind, giving your chest an all-too-familiar nuzzling. When the two of you separate, Myrna is all smiles again.");
		output("\n\n<i>“Myrna thankful. Thankful met such nice alien! No more presents unfortunately. Must save rest for new clan offering! Would give if have more.”</i> She gives you an apologetic look. You bring your hand to ruffle the hair of the diminutive canine, telling her there’s no need to be sorry, and that you wish her the best of luck with finding a new clan to be with.");
		output("\n\n<i>“Alien sweet, almost sweet as favorite candy. Wish you come with, but know you can’t. Myrna wish you luck too with travels!”</i>");
		output("\n\nWith an appreciative smile, you stow Myrna’s ");
		//If first time: 
		output("panties");
		/*else: 
		else output(trinket);*/
		output(" away in your inventory for safe keeping.");

		//Add Myrna’s Panties to pantie inventory.
		//Note for generic panty scenes: Her panties have a sweet scent instead of musky, like peppermint.
		//On subsequent visits yearly, gives a random accessory between Myrna’s necklace, bracelet, or anklet.
		//Accessory kept in key items tab.
		//[Gift] Greyed out after 12th gift.
		//Greyed out text: Myrna has given you all the presents that she can.

		pc.createKeyItem("Panties - Myrna's - Green with fur lining and a pepperminty scent.");
		output("\n\n(<b>Gained Key Item: Panties - Myrna’s</b>.)");

		processTime(8);
		pc.lust(10);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
	IncrementFlag("MYRNA_GIFT_COUNT");
	flags["MYRNA_GIFT_CD"] = GetGameTimestamp();
	currentLocation = "UVIP T44";
	addUvetoCold();
}


//[Sex]
public function myrnaSexMenu():void
{
	clearOutput();
	showMyrna();
	output("What would you like to do with Myrna?");
	clearMenu();
	if(pc.hasGenitals()) addButton(0,"Get Oral",myrnaOral,undefined,"Get Oral","Have her put her tongue to work.");
	else addDisabledButton(0,"Get Oral","Get Oral","You need genitals to get oral.");
	if(pc.cockThatFits(400) >= 0 || pc.hasHardLightEquipped()) addButton(1,"Fuck Her",penisRouter,[fuckMyrna,400,true,0],"Fuck Her","Take her in the usual way...");
	else addDisabledButton(1,"Fuck Her","Fuck Her","You need a penis that will fit inside of her or hardlight-equipped panties.");
	addButton(14,"Back",backToMyrnaMenu);
}

//[Oral]
//Prioritise penis wielders.
public function myrnaOral():void
{
	clearOutput();
	showMyrna();
	output("You notice the way that Myrna has been nuzzling into your crotch ever since you settled down with her by the fire. Every so often while the two of you relax together, she turns her head to sniff at your body. The growing intensity of her sweet pheromones clouding the air doesn’t do anything to hide her intentions either. Just as you are about to ask what the cuddly korgonne is up to, you feel a paw brush against your groin.");
	output("\n\n<i>“Myrna thinking this ever since you arrive, but want to give alien something. No present this time, but still special.”</i> She noses into your loins, ");
	//If PC is not nude: 
	if(!pc.isCrotchExposed()) output("pulling on the clothing with her teeth.");
	else output("drinking in your scent.");
	output(" With a ");
	if(!pc.isCrotchExposed()) output("frustrated");
	else output("longing");
	output(" sigh, Myrna shoots you the most seductive bedroom eyes. The emerald half-moons bore into your mind while her tongue flashes across her chops. <i>“Myrna been wanting to give licking, if alien allow?”</i> she asks pleadingly. The need in her expression tells you that she really wants this, and who are you to deny the magnanimous korgonne? You nod your head, giving her permission to continue.");

	//If PC’s cum/girlcum type is not peppermint:
	if((pc.hasCock() && pc.cumType != GLOBAL.FLUID_TYPE_PEPPERMINT) || (!pc.hasCock() && pc.girlCumType != GLOBAL.FLUID_TYPE_PEPPERMINT))
	{
		output("\n\n<i>“Um... before start, I have small... teeny selfish request.”</i> Curiously, your eyes follow Myrna’s paw as she reaches into her coat pocket. She pulls out a small vial, filled with a red and white viscous liquid. <i>“It own brew. Turn water-heat to sweet candy. Only last short time, but Myrna’s favorite flavor. Can I use?”</i> she asks, sheepishly twiddling the bottle in her paws. From the sound of it, that stuff will only temporarily turn your sexual fluids into Myrna’s favorite peppermint flavor. Will you allow her request for a sweeter treat from you?");
		processTime(10);
		clearMenu();
		addButton(0,"Sure",sureGetPupperminted);
		addButton(1,"No Way",noWayPepperminted);
	}
	//If PC’s cum/girlcum type is already peppermint, replace choices with [Next] button and start at merge.
	else
	{
		output("\n\nTo your surprise, Myrna doesn’t actually start ");
		if(!pc.isCrotchExposed()) output("unclothing you");
		else output("going to town on you");
		output(", but instead, lifts herself from your lap and stands up straight, giving you a nervous look.");
		processTime(10);
		clearMenu();
		addButton(0,"Next",skipPeppermintChoice);
	}
}

//[Sure]
public function sureGetPupperminted():void
{
	clearOutput();
	showMyrna();
	output("If the effects are only temporary as she said, then what’s the harm of giving her what she wants as well? You give Myrna the okay to use her concoction for her needs. With a loud yip, the roly-poly korgonne jumps for joy, setting her bodily curves aquake.");
	output("\n\n<i>“Yay! Alien is truly best! Many thanks!”</i> Myrna gushes. When she finally settles down, she pops the cork of the bottle open. Rather than offering the vial to you, she throws her head back and pours the thick liquid into her mouth. The korgonne licks her canine maw, slathering the mixture along the inner linings of her snout. Without speaking another word, she kneels ");
	if(pc.legCount >= 2) output("between your [pc.legs]");
	else output("at the base of your [pc.legs]");
	output(", smiling widely at you all the while.\n\n");
	myrnaBlowjob(true);
}

//[No Way]
public function noWayPepperminted():void
{
	clearOutput();
	showMyrna();
	output("You shake your head in dissent, not wanting anything to do with the mysterious liquid in the korgonne’s hands. Her tail quickly stops wagging and droops pitifully behind her in response.");
	output("\n\n<i>“O-okay... if that what alien want,”</i> she says dismissively, though you can hear the despondency in her tone of voice. Myrna quickly stuffs the vial back into her coat pocket and flashes you a giddy smile, already shrugging off the decision you made. <i>“Still bet alien taste good, by what Myrna smell already!”</i> Quickly afterwards, she kneels ");
	if(pc.legCount >= 2) output("between your [pc.legs]");
	else output("at the base of your [pc.legs]");
	output(", smiling widely at you all the while.\n\n");
	myrnaBlowjob(false);
}

public function skipPeppermintChoice():void
{
	clearOutput();
	myrnaBlowjob();
}

public function myrnaBlowjob(pepperminted:Boolean = false):void
{
	//For hyper penis havers:
	if(pc.hasCock() && pc.biggestCockLength() >= 20)
	{
		output("Her paws go to work immediately, ");
		if(!pc.isCrotchExposed()) output("shedding your gear in a flash and chucking them aside towards the idle reindeer.");
		else output("wandering the fine sculpture that is your body.");
		output(" They come to rest at your [pc.cockBiggest], slowly and gently rubbing the girthy length with the soft padding on her hand.");

		output("\n\n<i>“It so big...”</i> Myrna remarks, clearly mesmerized by the size of your gargantuan phallus. She lowers her head, giving your cock a few sniffs as she examines it further. Finally, her long tongue lolls out her mouth to take a slow, lascivious lick of your goods from the very bottom to the tip. Once she reaches the top, she opens her maw to lap at the sizeable bead of pre that forms on your [pc.cockHeadBiggest]. After she slurps it all up, she opens her maw incredibly wide, enveloping as much of your cock head with her lengthy snout as she can.");
		var tempHyperCum:Number = pc.cumType;
		if(pepperminted) 
		{
			output("\n\nThe moment her mouth closes around your [pc.cockHeadBiggest], you feel an odd tingling sensation flow throughout it. Myrna’s trails her tongue along your massive phallus, leaving no inch uncovered while her potion works its magic into your pores. Soon, the slight prickling on your [pc.cockBiggestNoun] turns into a warm titillation as it travels down your length.");
			if(pc.balls > 0)
			{
				output(" Once it reaches your base, the fuzzy feeling envelops your [pc.balls] cooling ");
				if(pc.balls == 1) output("it");
				else output("them");
				output(", yet at the same time, warming ");
				if(pc.balls == 1) output("it");
				else output("them");
				output(" pleasantly.");
			}
			output(" You’re fairly sure that by now, her brew is changing the contents within. Your codex chirps softly in the distance, telling you as much.");
			pc.cumType = GLOBAL.FLUID_TYPE_PEPPERMINT;
		}
		output("\n\nMyrna begins by extending her lengthy tongue and sweeping it across the entrance of your urethra. It feels velvety smooth to the touch, and is in no way abrasive against the sensitive inner lining. Another bead of pre-cum bubbles forth in response, rising up to meet her cherry red oral muscle. She takes another dip, scooping the [pc.cumFlavor] pre into her ravenous gullet, licking her chops clean afterwards. Myrna then spears her tongue inside of your monolithic rod, lapping up any remaining fluid from the source. To goad more into coming out, her paws busily work, gingerly rubbing your [pc.cockBiggest] in its most sensitive spots. Whatever she is doing, she must have had some practice on even your king-sized pole, and it shows!");
		output("\n\nWhen Myrna is done tapping your urethral well dry, she slips you out of her mouth with a wet plop. <i>“Muah... Lot of cock to play with. Hope mean lot of seed too!”</i> She sighs before she resumes her oral affections. Her flat tongue trails from your cock tip down to the base of the crown, where she stops to plant wet smooches. Each kiss sends a pleasant shockwave through your impressive pillar. Before long, you begin to leak pre again, but this time, the salacious korgonne doesn’t bother to plug the flow. Instead, she uses her wet appendage to gather any droplets the spill over and spread them all over your [pc.cockBiggestNoun]. She starts from the crown, carefully working her way down to the base, slathering your cock until it practically glistens in the dancing light of the campfire.");
		output("\n\nOnce she reaches the ");
		if(silly) output("groundwork to your pedestal");
		else output("the bottom of your [pc.cockBiggest]");
		output(", she begins to sensuously peck at the area between dickflesh");
		if(pc.balls > 0) output(" and ballsack");
		else if(pc.hasStatusEffect("Genital Slit")) output(" and genital slit");
		output(". You groan aloud as her tongue slips around the bottom, teasing at your most sensitized areas.");
		if(pc.balls > 0) output(" Her teeth lightly clamp down on the loose flesh between, gently sucking and pulling it into her mouth. When it reaches its maximum tautness, she releases you with a wet pop, only to plant her lips onto it again. She repeats this action several more times, finishing off with a playful nibble to the delicate spot.");
		//If PC has genital slit: 
		if(pc.hasStatusEffect("Genital Slit") || pc.hasSheath(pc.biggestCockIndex())) output(" Her slick, sinuous muscle manages to find its way into the delicate flesh that holds your cock when not in use. She dives into the the very foundation of your monolithic pole, reaching areas that are seldom played with. You shudder and gasp with every pass around your slit, relishing the feeling of her lubricative appendage brushing against spots you barely knew could feel so good!");
		output("\n\nBefore long, all of her hard work brings you to the precipice of orgasm. Once your [pc.cockBiggest] begins to throb dangerously, she abandons teasing the base to wrap both of her arms around it. She pumps her furry limbs up and down your length, determined to bring you to your grand finale. <i>“Free to give big seed! Give when want!”</i> She cries euphorically between thrusts. Her pelvis inadvertently brushes against the base of your giant cock as she hugs it to herself, worshiping it with all of her being.");
		output("\n\nWith a final moan, you release all restraints and erupt your [pc.cumFlavor] goodness straight into the air. The first jet sails clear over Myrna’s head, splattering loudly against the stone floor. The next one finds its mark, plastering the snow-white korgonne in [pc.cumColor]. From beneath of you, she continues to pump your pole vigorously, looking skyward with a wide open mouth. A generous amount of cum successfully manages to find its way into her cavernous maw and into her gullet, gulping loudly whenever it reaches maximum capacity. The raunchy scene repeats with each throb of jizm that escapes until you finally run dry.");
		if(pepperminted) output(" The cozy feeling that you felt in your [pc.balls] dissipates with the last drop of jizz spent.");
		output(" Myrna graciously slurps the remaining bits of cum to dribble out of your [pc.cockHeadBiggest] before patting her ");
		if(pc.cumQ() >= 2000) output("swollen");
		else output("full");
		output(" belly.");

		//If PC said [Sure] or if already has peppermint cum:
		if(pepperminted || pc.cumType == GLOBAL.FLUID_TYPE_PEPPERMINT)
		{
			output("\n\n<i>“Mmm! Yummy sweet treat! Alien somehow make favorite sweet taste better! Hope alien enjoy lickings! I enjoy seed shower!”</i>");
			if(pc.cumQ() < 2000) output(" Myrna smiles jovially.");
			else output(" Myrna smiles dopily, gently caressing her [pc.cumNoun]-filled tummy.");
		}
		//If PC said [No Way]:
		else
		{
			output("\n\n<i>“Mmm... Alien water-heat taste good! Not good as favorite sweet treat, but close second! Hope alien enjoy lickings! I enjoy seed shower!”</i> ");
			if(pc.cumQ() < 2000) output("Myrna smiles jovially.");
			else output("Myrna smiles dopily, gently caressing her [pc.cumNoun]-filled tummy.");
		}
		pc.cumType = tempHyperCum;
	}
	//For penis havers:
	else if(pc.hasCock())
	{
		output("Her paws go to work immediately, ");
		if(!pc.isCrotchExposed()) output("shedding your gear in a flash and chucking them aside towards the idle reindeer.");
		else output("wandering the fine sculpture that is your body.");
		output(" They come to rest at your [pc.cockBiggest], slowly and gently rubbing the base with the soft padding on her hand.");

		output("\n\n<i>“It feel smooth...”</i> Myrna remarks, clearly mesmerized by the craftsmanship of an off-world penis. She lowers her head, giving your cock a few sniffs as she examines it further. Finally, her long tongue lolls out her mouth to take a slow, lascivious lick of your goods from the very bottom to the tip. Once she reaches the top, her maw opens almost incredibly widely, engulfing the entirety of your [pc.cockBiggestNoun] in one smooth motion downwards.");
		var tempCum:Number = pc.cumType;
		if(pepperminted) 
		{
			output("\n\nThe moment her mouth closes around your shaft, you feel an odd tingling sensation flow throughout it. Myrna’s snout and throat leaves no inch uncovered while her potion works its magic into your pores. Soon, the slight prickling on your [pc.cockBiggestNoun] turns into a warm titillation as it travels down your length.");
			if(pc.balls > 0)
			{
				output(" Once it reaches, the fuzzy feeling envelops your [pc.balls] cooling ");
				if(pc.balls == 1) output("it");
				else output("them");
				output(", yet at the same time, warming ");
				if(pc.balls == 1) output("it");
				else output("them");
				output(" pleasantly.");
			}
			output(" You’re fairly sure that by now, her brew is changing the contents within. Your codex chirps softly in the distance, telling you as much.");
			pc.cumType = GLOBAL.FLUID_TYPE_PEPPERMINT;
		}
		output("\n\nMyrna begins by bobbing her head in shallow strokes, barely letting any of your length out of her maw. She is very careful not to let her teeth interfere with the blowjob, using the most her smooth, velvety tongue as a safety net. It seems to move in an entirely different rhythm to the rest of her mouth, but somehow, it still feels exceptionally wonderful. At times it simply rubs the underside of your penis, others her wet appendage wraps around it, almost coiling around it and jerking it from the inside of her maw. Whatever she is doing, she must have had tons of practice, and it shows!");
		output("\n\nUnconsciously, you reach forward and softly grab the small korgonne by the base of her ears, wrapping the rest of your hands around her head. Myrna looks upwards to you for a brief moment, regarding you with her strange, green square pupiled eyes. She smiles briefly before giving you a wink and ramming her snout into your crotch as hard as she can. <b>Damn</b> that feels too good. If she can take an oral dicking <i>that</i> deeply, you don’t think she would mind if you went a little ");
		if(silly) output("ruff.");
		else output("rough.");
		output("\n\nYou double your grip on the charitable korgonne’s ears and lift her head up slightly from your [pc.cockBiggest]. A soft murr resonates from her bountiful chest to her snout, likely in appreciation for you deciding to take charge. With a shove of your hips, you once again pull her in as deep as you can, relishing the feeling of her maw enveloping all of your cockmeat. Myrna flattens her tongue and wraps it around your phallus with as much surface area as it will allow, providing an almost secondary cocksheath inside of her mouth. Not without a groan of ecstasy escaping your lips, you lift once again before crashing her head back down, steadily building a rhythm of your own.");
		output("\n\nSoon, you work to a blistering pace, literally face-fucking her. Myrna never once balks or backs down, taking it all like a champ. Her emerald eyes barely leave your face and her smile never fades, delighting in the fact that she’s giving you this much pleasure. Looking past her pistoning head, you observe that her furred panties are pulled down to her knees. One of her hands works busily underneath of her, creating a small puddle of her sweet girl-juices. Not only does the sight alone of this spurns you on, but her natural pheromones are at the strongest that you’ve smelled yet. With newfound fervor, you quickly work yourself to orgasm before you realize it.");
		output("\n\nWith a final thrust, you force your [pc.hips] into the canine’s mouth, making her take you as deep as her awaiting gullet allows");
		if(pc.hasKnot(pc.biggestCockIndex())) output(", knot and all");
		output(" before the first jet of cum escapes your [pc.cockHeadBiggest]. The moment your jism hits the back of her throat, her eyes widen for a split second before narrowing in focus. A second throb, rapidly followed by a third joins in. Her throat, having little time to adjust, gulps down your ");
		output("[pc.cumFlavor] goodness, guzzling down the thick liquid as quickly as it can allow.");
		//Normal cum:
		if(pc.cumQ() < 2000) 
		{
			output(" In staccato pumps, you unload all that you are able to until you finally run dry. Myrna manages to swallow it all down, not wasting a single drop of your cum.");
			if(pepperminted) output(" The warm, yet refreshingly cool feeling that you felt in your [pc.balls] dissipates with the last drop of your seed spent.");
		}
		else
		{
			output(" In staccato pumps, you consistently blast everything you have in her with a seemingly endless amount of cum. Myrna seems to have some difficulty swallowing it all down, wincing every once in awhile between each throb of your phallus. The seal that is");
			if(pc.hasKnot(pc.biggestCockIndex())) output(" your knot");
			else output(" her snout");
			output(" locks most of your seed within her, causing her already pudgy belly to swell even further outwards. By the time your [pc.balls] finally empty, she looks almost as if she is carrying a baby in her belly.");
			if(pepperminted) output(" The cozy feeling that you felt in your [pc.balls] dissipates with the last drop of jizz spent.");
			output(" With a wet pop, she releases her hold on your [pc.cockBiggest] and licks her chops in an obviously satisfied manner.");
		}
		//If PC said [Sure] or if already has peppermint cum:
		if(pepperminted || pc.cumType == GLOBAL.FLUID_TYPE_PEPPERMINT)
		{
			output("\n\n<i>“Mmm! Yummy sweet treat! Alien somehow make favorite sweet taste better! Hope alien enjoy lickings!”</i>");
			//If normal cum: 
			if(pc.cumQ() < 2000) output(" Myrna smiles jovially.");
			else output(" Myrna smiles dopily, gently caressing her [pc.cumNoun] filled tummy.");
		}
		//If PC said [No Way]:
		else
		{
			output("\n\n<i>“Mmm... Alien water-heat taste good! Not good as favorite sweet treat, but close second! Hope alien enjoy lickings!”</i>");
			if(pc.cumQ() < 2000) output(" Myrna smiles jovially.");
			else output(" Myrna smiles dopily, gently caressing her [pc.cumNoun] filled tummy.");
		}
		pc.cumType = tempCum;
	}
	//For vagina havers:
	else if(pc.hasVagina())
	{
		output("Her paws go to work immediately, ");
		if(!pc.isCrotchExposed()) output("shedding your gear in a flash and chucking them aside towards the idle reindeer.");
		else output("wandering the fine sculpture that is your body.");
		output(" They come to rest at your [pc.vagina], slowly and gently rubbing the outer folds with the soft padding on her hand.");

		output("\n\n<i>“It feel soft...”</i> Myrna remarks, clearly mesmerized by the craftsmanship of an off-world vagina. She lowers her head, giving your cooch a few sniffs as she examines it further. Finally, her long tongue lolls out her mouth to take a slow, lascivious lick of your goods from bottom to clit. Once she reaches the top, her maw opens almost incredibly widely, shoving the entirety of her long tongue inside of you in one smooth motion.");
		var tempGirlCum:Number = pc.girlCumType;
		if(pepperminted) 
		{
			output("\n\nThe moment her slick, sinuous muscle penetrates you, an odd tingling sensation flows through your vaginal walls. Myrna’s tongue leaves no inch uncovered while her potion works its magic into your love tunnel. Soon, the slight prickling on your sensitive innards turns into a warm titillation as it travels deeper into your recesses. Once it reaches the furthest parts of you, your entire [pc.vagina] as if it is more sensitive to the cool air around you, yet at the same time, it is pleasantly warm. You’re fairly sure that by now, her brew is changing the contents within. Your codex chirps softly in the distance, telling you as much.");
			pc.girlCumType = GLOBAL.FLUID_TYPE_PEPPERMINT;
		}
		output("\n\nMyrna begins by withdrawing her flat tongue from within you. She treats your labial lips to a gentle licking, lapping up any juices that leak from you. Her oral muscle works incredibly rapidly, never letting you catch a break in between lurid slurps. The korgonne’s tongue structure is highly flexible, folding inwards ever so slightly into your slit, and brushing your [pc.clits] with just the right amount of friction. Her hot, wavering breath warms your loins nicely, never letting any of your sexual fluids grow cold. Whatever she is doing, she must have had tons of practice, and it shows!");
		output("\n\nUnconsciously, you reach forward and softly grab the small korgonne by the base of her ears, wrapping the rest of your hands around her head. Myrna looks upwards to you for a brief moment, regarding you with her strange, green square pupiled eyes. She smiles briefly before giving you a wink and ramming her snout and tongue into your crotch as hard as she can. <b>Damn</b> that feels too good. If she can dive into a muff that skillfully, you don’t think she would mind if you went a little ");
		if(silly) output("ruff.");
		else output("rough.");

		output("\n\nYou double your grip on the charitable korgonne’s ears and lift her head up slightly from your loins. A soft murr resonates from her bountiful chest to her snout, likely in appreciation for you deciding to take charge. With a shove of your hips, you once again pull her in as deep as you can, relishing the feeling of her maw enveloping your pussy. Myrna rolls her tongue and spears your folds, using her wet appendage almost like a pseudo-phallus, but there is still enough of her tongue that the base curls upwards, simultaneously stimulating your [pc.clits]. Not without a groan of ecstasy escaping your lips, you lift your [pc.legs] up and wrap them around Myrna, trapping her for good inside of your delicious prison.");
		output("\n\nSoon enough, Myrna bobs her head rhythmically, using her rolled-up oral muscle to literally tongue-fuck you. She never once stops to gasp for air, staying down on you for an extremely long period of time. Her emerald eyes barely leave your face and her smile never fades, delighting in the fact that she’s giving you this much pleasure. Looking past her pistoning head, you observe that her furred panties are pulled down to her knees. One of her hands works busily underneath of her, creating a small puddle of her sweet girl-juices. Not only does the sight alone of this turn you on even more, but her natural pheromones are at the strongest that you’ve smelled yet. Before you become aware of it, she quickly works you to your peak.");
		output("\n\nWith an especially hard thrust of her head, Myrna once again sinks her tongue in as deep as her snout will allow. This time however, she doesn’t withdraw, but instead continues to flick and unfurl her lengthy appendage, stimulating a lot more surface area than she was previously. The moment the tip of her tongue brushes against your cervix, you seize up, your inner walls clenching around the wet and flat muscle. ");
		//If PC has <4 vaginal wetness: 
		if(pc.vaginas[0].wetness() < 4) output("A small trickle of fresh [pc.girlCum] announces the arrival of your orgasm. Myrna lightly giggles into your muff, happily slurping up any girl juices that leak from your spasming slit.");
		else output("A tide of fresh [pc.girlCum] announces the arrival of your orgasm. Myrna gasps in surprise into your muff, clearly surprised at the productiveness of your gushing [pc.vagina]. Once she recovers from the initial shock, she sighs happily, slurping up any girl juices that leak from your spasming slit.");
		output(" When your climax finally winds down, you slump backwards, somewhat exhausted from riding that euphoric high. Myrna finally separates herself from between your legs, her muzzle positively painted in your fluids. She takes the next few moments to lick her chops clean, savoring as much of your flavor as she can.");

		//If PC said [Sure] or if already has peppermint girlcum:
		if(pepperminted || pc.girlCumType == GLOBAL.FLUID_TYPE_PEPPERMINT)
		{
			output("\n\n<i>“Mmm! Yummy sweet treat! Alien somehow make favorite sweet taste better! Hope alien enjoy lickings!”</i> Myrna smiles jovially.");
		}
		//If PC said [No Way]:
		else
		{
			output("\n\n<i>“Mmm... Alien water-heat taste good! Not good as favorite sweet treat, but close second. Hope alien enjoy lickings!”</i> Myrna smiles jovially.");
		}
		pc.girlCumType = tempGirlCum;
	}
	//merge
	output("\n\nYou give Myrna a grateful pat on the head for the wonderful <i>lickings,</i> pulling her close to snuggle together in the heat of the campfire. After a few moments of affectionate petting, you hear a telltale snore from the sweet-smelling korgonne, indicating that she has fallen asleep in your arms. Taking care not to disturb her in her sleep, you shift away from her and lay her in a comfortable position next to the campfire. Her leg twitches and jerks a few times as soon as you step away and she smiles in her sleep, her post-coital dreams already taking her to happy places. With a grin to mirror her own, you ");
	if(!pc.isCrotchExposed()) output("retrieve your [pc.crotchCovers] from the ground and ");
	output("head out of the cave into the snowy wasteland outside.");
	processTime(25);
	pc.orgasm();
	IncrementFlag("SEXED_MYRNA");
	clearMenu();
	addButton(0,"Next",myrnaLeave);
}

//[Fuck Her]
//not available if hyper sized.
//not taur compatible.
//must have a penis or hardlight strap-on.
public function fuckMyrna(x:int):void
{
	clearOutput();
	showMyrna(true);
	
	output("The longer the two of you sit together in the considerably warm cave, the more aware you are of Myrna’s pepperminty pheromones. At first it wasn’t bad, but the scent seems to grow stronger and stronger with each passing moment. In the lustful haze, you temporarily become unaware of anything else but the sweet-smelling korgonne laying on your lap. You give into your errant thoughts, wondering what to do with the shortstack and how to best take her for yourself, which you believe is exactly what she wants. Before you realize it, you find your previously idle hands wandering over the rotund globes that are her breasts.");

	output("\n\n<i>“Myrna don’t mind. Go ahead, use them,”</i> Myrna coos, smiling gleefully with her flat tongue wobbling slightly out of the side of her muzzle. She lifts herself from your lap, fumbling furiously with the fur-covered bra restricting her bountiful bosom. <i>“Rrgh. Still not use to alien garb. Hard to take off.”</i> She growls in frustration, desperately trying to shrug off the offending garment. You assist her in taking the cloth off of her, revealing two heavy F-cup breasts tipped with bright red nipples. With her bright, snow-white fur, her chest looks reminiscent of a twin-pair of whipped cream piles with cherries on top, and boy do they look delicious!");
	output("\n\nYou don’t delay for a moment on sampling a taste for yourself. With an almost savage grunt, you pull the korgonne onto you again, having her straddle your lap. Myrna leans backwards, totally on the same wavelength as you and your intentions. Her hefty breasts bobble, rosy nipples waiting for your lips to encircle them. You lean forward, plastering your face onto her supple boobflesh, wrapping your mouth around her pebbly areolae.");
	output("\n\nOnce you begin to flick the pert teat around in your mouth, Myrna moans aloud to the ceiling, throwing her long hair backwards in a white cascade. Satisfied with the reaction, you intensify your oral affections, waggling the smooth nipple around until you eventually pinch it with your teeth. To your great surprise and delight, a bead of sweet, milky liquid escapes, dribbling into your mouth. You smile, lightly grinding your teeth to coax a few more drops to come out. With enough stimulation, you find purchase, and are rewarded with a small, but steady stream of milk. Not letting any of it go to waste, you quickly close your mouth around her areola, successfully plugging the leak for now.");
	output("\n\nWanting to draw even more of her sweet bounty from her sizeable mammaries, you gently suckle Myrna’s cherry colored nipple. Her pawed hand wraps around the back of your head, pulling you into the korgonne even further. A soft murr resonates through her boobflesh as she runs her hands ");
	if(pc.hairLength < 2) output("over your scalp.");
	else output("through your [pc.hair]");
	output(". <i>“Mmmph... alien feel nice on chest. Give all sweet milk you want,”</i> she sighs, leaning into you. You cave under the weight of her bosom, letting gravity draw her saccharine nectar into your mouth.");

	output("\n\nFor the next few minutes you hungrily suckle Myrna’s soft mammaries, occassionally switching back and forth between the two whenever one runs low. When you take a moment to run your nose in the cleft between her sizeable jugs, she begins to roll her wide hips into your lap. She grinds hard, almost dry humping you after a certain point. You can feel her arousal seeping through her panties and onto your crotch. The bittersweet smell of peppermint joins the sugary scent of her breast milk, creating an aromatic haze the likes you’ve never experienced before. You can feel ");
	if(pc.hasCock()) output("[pc.eachCock] harden to rigidity");
	else if(pc.hasVagina()) output("your [pc.vagina] moisten");
	output(" in response to her rough riding. When her pace rises to a fevered pitch, she abruptly separates from you, panting hard from her efforts. Even though her face is covered in fur, you can tell that she looks absolutely flushed from exertion.");

	output("\n\n<i>“Want alien inside me... First, want favorite toy");
	if(!pc.isCrotchExposed()) output(", Undress while I fetch!");
	else output(",");
	output("”</i> Myrna puffs, scampering away towards the herd of reindeer.");
	if(!pc.isCrotchExposed()) 
	{
		output(" After shedding all of your gear");
		if(x < 0) output(" except for your hardlight-equipped [pc.lowerUndergarment]");
		output(", you");
	}
	else output(" You");
	output(" watch on with curiosity while she affectionately pets the previously idle lead cervine. She then reaches up to its nose, which prompts a hidden compartment to open up, exposing the green gem inside. Gingerly, she slides the object out of the deer’s snout, causing it to power down into an inactive mode. Myrna holds up the glowing item proudly in your direction, smiling in wild excitedness. It is phallic in shape and size; it’s base perfectly round and knotted, while the head is tapered to a smooth point. After showing off the dildo to you, she bounds back towards you, nearly landing atop of you again.");
	if(x < 0) output(" With a coy smile, you turn on the dial to your own glowing member equipped to your underwear. Myrna’s eyes light up with surprise when she witnesses the dildo materialize and take shape in front of her.");

	if(x < 0) output("\n\n<i>“Oooh, looks fancy! Glows like my toy. Wonder if it feel good too. Still, use mine in case?”</i>");
	else output("\n\n<i>“Okay, am ready! Usually use toy on self, but thinking, do alien want? Maybe fun for both?”</i> the korgonne asks breathlessly, waving the glowing phallus in front of you enticingly. The closer she holds it to you, the warmer and tinglier you feel, especially to your already aroused loins. It looks like she’s giving you the choice on who gets to use her special toy.");
	processTime(20);
	pc.milkInMouth();
	pc.lust(50);
	clearMenu();
	addButton(0,"Yourself",useMyrnasDildoOnYou,x);
	addButton(1,"Myrna",putDildoInMyrnasAss,x);
}

//[Yourself]
//Tooltip: Stick it up your vag/ass while you fuck her.
public function useMyrnasDildoOnYou(x:int):void
{
	clearOutput();
	showMyrna();
	output("Who are you to refuse a chance of having a superpowered dildo inside of you while you go to town on such a fine korgonne? You eagerly nod your head, growing more and more enthusiastic at the prospect of this idea. Myrna pumps her fist in the air in glee, equally sharing your eagerness.");
	output("\n\n<i>“Great! Alien gonna love this!”</i> She yips, barely able to hold herself back. <i>“I wet it first. Make easy for you.”</i> Myrna opens her maw and slips the dildo inside, down to the knot. She visibly shudders once she clamps her jaw down on it, drooling from both her upper and lower pair of lips. Once she masters herself, you see her long tongue swirl along the green rod, making sure she covers every facet of it with her oral lube. After she finishes, she pulls it from her mouth with a wet plop, panting slightly from the direct contact with the aphrodisiac qualities of the toy.");
	output("\n\n<i>“Ready!”</i> The snow-white korgonne announces. She kneels down next to your [pc.legs], holding the wet dildo at the ready. <i>“Want me to put in?”</i> Myrna asks, slightly shaking on the spot, though whether from the toy’s intense lust-making powers or from sheer excitement, you can’t immediately tell. With a nod, you give Myrna permission to proceed.");

	//Prioritize vagina over ass if PC has one.
	var y:int = -1;
	if(pc.hasVagina()) y = rand(pc.totalVaginas());

	output("\n\nMyrna ");
	//If PC is using HL undies: 
	if(pc.hasHardLightEquipped()) output("moves your [pc.lowerUndergarment] aside and ");
	output("slowly brings the crown of the phallus to your [pc.vagOrAss " + y + "]. You can merely feel the warmth emanating from it without it even touching you, leaving you only mere moments to wonder what it would feel like once inside of you.");
	//If PC had foursome with Anno, Marina, and Galina: 
	if(flags["UVETO_HUSKAR_FOURSOME_MOUNTUP"] != undefined) output(" If the time you spent in that ‘scientific presentation’ with Anno and the huskar twins was any indication, you believe it will be truly wild.");
	output(" In the middle of your thoughts, you feel the dildo head make first contact against the entrance of your [pc.vagOrAss " + y + "], cause it to clench tightly from the intense sensation. It takes every ounce of your being not to cum right then and there.");

	output("\n\n<i>“Alien, relax. Overwhelming at first, but clear mind. That trick I learn. Get use to it over time.”</i> Myrna suggests to you. Yeah... easier said than done. With a calm sigh to master yourself, you try to think of soothing things to get things moving forward again. Surprisingly, you find your grip loosening over time, which enables Myrna to slide the dildo further in. It takes a few baby steps for you to fully adjust, with her sliding it in little by little, but eventually you bottom out to the knot. Even with it fully lodged inside of you, you try your best not to concentrate on that feeling of being stuffed with the unusual toy, lest you blow too early.");

	if(y < 0) pc.buttChange(300);
	else pc.cuntChange(y,300);

	output("\n\n<i>“Good job! Can begin now!”</i> Myrna exclaims while turning around to shirk off her emerald panties. While she slides them off, you can’t help but be entranced by her shapely bottom. Her off-white buns jiggling freely once past their confines while her long tail swishes gailly, further enhancing the effect. Her plump pussy lips shine in the dancing lights of the nearby fire. A soft blush of pink covers them, and a thin string of femlube connects her vulva to her undergarment. Her mons themselves are a bright red, much like her nose and mouth. When she finally slips her panties to her ankles, she carelessly kicks them aside and pushes her posterior onto your lap.");

	pc.lust(100);
	clearMenu();
	addButton(0,"Next",fuckMyrnaContinuation,[x,y]);
}

//[Myrna]
//Tooltip: Stick it up her ass while you fuck her vaginally.
//y -2!
public function putDildoInMyrnasAss(x:int):void
{
	clearOutput();
	showMyrna(true);
	output("You figure it would be as good an opportunity to give back to the unselfish korgonne and ");
	if(pc.isNice()) output("politely ");
	output("turn down the offer to use the dildo on yourself. Myrna’s smile fades a small amount when she hears this, and opens her mouth to question your decision. Reactively, you place a finger on her snout, silencing the diminutive canine before she can say anything.");

	output("\n\n<i>“I thought it would be nice to show my gratitude for once and let you have some fun yourself. After all, seeing how much you would enjoy it would be a great gift in and of itself,”</i> you slyly persuade her. It takes a moment, but afterwards, Myrna’s smile widens once more, and her snow-white tail swishes in a blur behind her.");

	output("\n\n<i>“Okay, if that make alien happy, then Myrna happy too!”</i> she gushes. Myrna then stretches out her arm, offering you the dildo. As soon as your hand makes contact with it, you gasp aloud as a hot jolt of pleasure shoots up your arm, into your body, and straight to your crotch. ");
	if(pc.hasCock()) output("[pc.EachCock] throbs madly from the sensation, drooling a copious amount of pre onto the stone floor. ");
	output("Out of the corner of your eye, you can see Myrna watching your bobbing ");
	if(pc.hasCock()) 
	{
		output("dick");
		if(pc.totalCocks() > 1) output("s");
	}
	else output("[pc.hardlightCockNoun]");
	output(" almost as if hypnotised. After you get over the initial shock, her look of wonder turns into a smile once again.");

	output("\n\n<i>“Strong feeling, huh? That why it my favorite toy! Put in me now?”</i> she pleads, turning around to shirk off her emerald panties. While she slides them off, you can’t help but be entranced by her shapely bottom; her off-white buns jiggling freely once past their confines, her long tail swishing gailly, further enhancing the effect. Her plump pussy lips shine in the dancing lights of the nearby fire. A soft blush of pink covers them, and a thin string of femlube connects her vulva to her undergarment. Her mons themselves are a bright red, much like her nose and mouth. When she finally slips her panties to her ankles, she carelessly kicks them aside and pushes her posterior closer to you.");

	output("\n\n<i>“Please, give toy...”</i> Myrna pants, voice and pussy dripping full of need. Not wanting to keep her waiting too long, you gather a small amount of saliva in your mouth and spit on the dildo head, mostly in worry that any internal contact with the phallus will send you immediately to your orgasm. Vigorously, you spread as much of the spittle as you can around the toy, making sure your makeshift lube will make the insertion as comfortable as possible for her. Once satisfied, you align the dildo with her awaiting asshole, which relaxes before you are even able to touch it. Gingerly, you feed it into her, which proves a surprisingly easy task. Even more surprising is that on contact with the dildo, she never reacts or fidgets from the intense aphrodisiac qualities of it, though her vagina does secrete more of her girl juices than it did previously.");

	output("\n\nOnce you slide it all the way to the base, knot and all, a soft sigh of relief escapes Myrna’s lips. She turns her head, giving you a wide smile in appreciation before planting her bottom onto your lap. A weird mix of a grunt and moan escapes out of your mouth on impact; the base of her dildo sending another jolt of pleasure through you when it brushes against your pelvis.");

	//merge scene. Variations depending on which scene is being branched from.
	pc.lust(10);
	processTime(20);
	clearMenu();
	addButton(0,"Next",fuckMyrnaContinuation,[x,-2]);
}

public function fuckMyrnaContinuation(args:Array):void
{
	clearOutput();
	showMyrna();
	var x:int = args[0];
	var y:int = args[1];
	output("<i>“Waiting long time. Hope alien like...”</i> Myrna coos, lifting her hips once more to align your glans with her spread lower lips. The heat coming from them is amazing, to say the least. The pussy juices that drip onto your member don’t feel any less hot as it dribbles down your ");
	//If PC has testicles:
	if(pc.balls > 0) output("[pc.balls]");
	else output("perineum");
	output(". She lowers her sides further, spearing her folds with your ");
	if(x >= 0) output("[pc.cock " + x + "]");
	else output("[pc.hardlightCock]");
	output(". Her inner walls feel velvety to the touch. They hug you with a loving tightness, yet there is just enough give to keep movement smooth. Given how wet she is already, it doesn’t take long before she bottoms out, her plump buttcheeks resting firmly on top of your waist.");
	pc.cockChange();

	output("\n\nBefore she begins to move, she turns her head, regarding you with her odd, but seductive bedroom eyes. A devious smile creeps across the corners of her snout before she lifts her hips once more. Once she is only halfway up your shaft, she abruptly sinks you back into her. You can’t help but grunt from the sudden weight shift being applied to your hips, but it feels great regardless. She repeats this motion a second time, and then a third, coming down hard on your ");
	if(x >= 0) output("[pc.cockNoun " + x + "]");
	else output("[pc.hardlightCockNoun]");
	output(" each plunge. Soon enough, she increases her pace, leaning back to place her hands on your [pc.breasts] for support.");

	output("\n\n<i>“Haah... alien cock is good... Warm like spire of old clan...”</i> Myrna sighs dreamily, tongue lolling out from the lust-drunk state that she is in. You raise your arms and set them to her hips, supporting her undulating motions. Upon feeling this, the chubby korgonne bounces atop of you with even more vigor. With each wet slap of her bottom against your hips, she pants loudly, matching her breathing in tune to the rhythm of each thrust. You inhale deeply every opportunity that you can to help brace yourself for each time she rams herself into you, though that prospect isn’t proving very fruitful. With each deep breath you take, you catch her overly powerful scent, mixed with your own sexual fluids. Each intake of the pheromone polluted air leaves you temporarily dizzy from how strong it is. You can feel the effects on your loins for sure; your ");
	if(pc.hasCock()) output("[pc.cockBiggest] throbbing so madly it starts to hurt a little.");
	else if(pc.hasVagina()) output("[pc.vagina] dribbling so much of your own juices that it soaks through your [pc.lowerUndergarment].");
	else output("body aching for more.");
	//If branching from [Yourself]:
	if(y != -2) output(" With the savicite dildo that’s lodged in you on top of this, it’s a wonder that you are still holding on.");

	output("\n\nWithout any prior warning, Myrna ceases her relentless pounding, lifting her hands from your chest. She takes a brief moment to readjust her fur coat and hat before bending forward, leaving only her furred butt, tail and legs in view. You take the moment to soak in the sight of her round, snow-white ass, perfectly curved, and sitting snugly atop of your ");
	if(x >= 0) output("[pc.cockNoun " + x + "]");
	else output("[pc.hardlightCockNoun]");
	output(". Her tail swishes hypnotically back and forth just over your head.");
	if(y == -2) output(" In between her plump cheeks, the base of her savicite dildo is in plain view, an alluring green target among the blank canvas that is her derriere.");
	output(" You can’t help but to reach up with both hands, giving her bottom a rough squeeze. Her buns feel delectably soft to the touch, almost melting between your fingers. Myrna murrs softly at your touch, wiggling her tush enticingly from side to side in response.");

	output("\n\n<i>“More...”</i> She huffs, grinding your dick hard against her walls. ");
	if(x >= 0 && pc.hasKnot(x)) output("Due to how sopping wet she is down under, your swelling [pc.knot " + x + "] manages to slip inside of her before reaching full volume, locking the two of you together. Well, you may as well stick around for the long haul of it then since it can only grow bigger. ");
	output("Giving the korgonne what you believe she wants, you knead her glorious butt once more before lifting a hand to give it a hard smack. The impact sends a rather obscene amount of jiggle rippling through her bottom for a moment; the sight of which would make any ass-man proud. Myrna gasps and moans in response, gyrating her hips vigorously into you. Her walls close tightly all the way to the base of your ");
	if(x >= 0) output("[pc.cockNoun " + x + "]");
	else output("[pc.hardlightCockNoun]");
	output(", wrapping it in a surreal warmth while she attempts to angle it to hit just the right spots.");

	//If branching from [Myrna]:
	if(y == -2)
	{
		output("\n\nYou decide to be a bit more proactive in helping her get more pleasure out of this. Carefully, you plant your hands on Myrna’s bottom again, keeping up with her erratic gyrations. You slide a hand towards that green target that’s been enticing you ever since she bent over. The moment your hand makes contact with it, another wave of pleasure shoots up your arm and into your body. You manage to steel yourself from the sensation this time, though only just barely. Your korgonne lover stops her movements as well, looking over her shoulder through her matted hair in wonderment of what you are up to behind her. She doesn’t have to wait long to find out, however, once you cup the base of the dildo in your hand and slowly pull it out. Myrna’s back arches sharply as she lets out a literal howl of pleasure towards the cave ceiling. Just before it’s tapered head can escape, you shove the toy back inside, eliciting another body shaking moan from her. You repeat these motions slowly at first, building up to a blistering pace. Before long, her hips begin to move up and down your lap in rhythm to the dildo ramming her. Consequently, she works the base of your ");
		if(x >= 0) output("[pc.cockNoun " + x + "]");
		else output("[pc.hardlightCockNoun]");
		output(", still squeezing you tightly and barely letting any of your length out of her.");

		output("\n\nFor the next few minutes, you keep this pace up, pumping the savicite toy in and out of her while enduring the wild ride that Myrna is giving you. Suddenly, the tightness on your cock intensifies exponentially as a tide of peppermint scented girl juice flows over your waist. You can feel Myrna strumming her clit as she climaxes, which simultaneously stimulates you as well. Despite her mid-orgasm state, she lifts her bottom and slaps it against you a few times, murmuring, <i>“Alien... share water heat at same time! No holdings back!”</i>");
		if(x >= 0) output(" She doesn’t have to tell you twice since you are already dangerously close to blowing your load inside of the generous korgonne’s spasming twat.");

		if(x >= 0) 
		{
			output("\n\nIt only takes a few more strokes before you are tipped over the edge. Your hips lurch upward violently, prompting a small <i>“Oh!”</i> from the korgonne. With a tenuous groan, you release, an eruption of your virile seed blasting into Myrna’s fertile womb. You can feel her shudder when the first jet of cum forcibly enters her. Her grinding slows to a crawl as if she suddenly fell victim to a trance. Her inner walls never slow however, still spasming wildly, doing their best to milk you dry during your orgasm.");
			//If lots of cum: 
			if(pc.cumQ() >= 3000) 
			{
				output(" You continue to pump an obscenely large amount of your [pc.cumNoun] into Myrna, so much so that her already modestly chubby belly swells out even further.");
				if(pc.hasKnot(x)) output(" Thankfully, you have just the right anatomy to be able to plug her up with all the ‘water-heat` that she wants.");
				else output(" It only swells out to a certain point before the rest gushes back out of her quim, making a huge mess of your lap.");
			}
			else output(" You continue you pump spurt after spurt of your [pc.cumNoun] into her, thrusting upwards weakly with each throb until you are tapped.");
			output(" Myrna sits upright once more, turning her head to look back at you with lazily drooping eyes; a look that silently tells you how satisfied she is. <i>“Ah... alien water-heat... warm like Great Forge in belly too... Thank you for gift,”</i> she coos, idly rubbing her belly full of your seed.");
		}
		//If PC using hardlight:
		else
		{
			output("\n\nIt only takes a few more strokes before you are tipped over the edge. Your hips lurch upward violently, prompting a small <i>“Oh!”</i> from the korgonne. With a tenuous groan, you release, utterly soaking your [pc.lowerUndergarment]. You jerk uncomfortably under her while her walls continue to milk your [pc.hardlightCockNoun] for an unobtainable purchase. Just as your orgasm begins to taper, Myrna lifts herself upright once more, turning her head to look back at you with concern in her eyes. <i>“Alien giving no water-heat? You okay? Still feel good?”</i> she asks, still grinding her bottom slowly into you. Despite the over-stimulation, you manage to nod your head vigorously. Her worried frown melts away to give you a soft smile. <i>“Good. Long as alien feel good, Myrna feel good!”</i>");
		}
	}
	//If branching from [Yourself]:
	else
	{
		output("\n\nJust as you feel you are taking control of yourself again, you start to feel a pawed hand sliding down");
		if(pc.balls > 0) output(" past your [pc.balls] and to");
		else if(pc.hasCock()) output(" your perineum to");
		output(" your stuffed [pc.vagOrAss " + y + "]. At the very next moment, what feels like an electrical shock reverberates through your spine and back to your loins as she makes contact her savicite dildo. Your back hitches upwards, though Myrna barely moves an inch on top of you. She is still intent on swirling her hips atop of you and stirring her insides like you are a living spoon. You take deep, hurried breaths as she slowly slides the dildo out of you a few inches. It takes everything and more not to climax immediately, and Myrna continues to make things harder for you not to do so. With a sudden push, she rams the toy back inside of you, sending another intense jolt of pleasure through your vertebrae. After a few more thrusts like this, Myrna sits upright, looking back towards you with a coy smile on her lips.");
		//If PC using penis:
		if(x >= 0)
		{
			output("\n\n<i>“No holdings back. Give water-heat when want, how much alien want.”</i> Myrna coos, jamming her dildo inside of you with an especially hard push.");
			if(pc.WQ() >= 50) output(" Even with your considerable amount of willpower, you find the grip on yourself rapidly slipping away from you.");
			output("\n\nWith a final shake of her sizable butt, you moan as loudly as you think you have ever heard yourself moan and explode into the korgonne’s fertile womb. A soft <i>“Oh!”</i> escapes her lips when the first jet of cum forcibly hits her cervix. This sets off Myrna’s own orgasm, her walls spasming and quaking around your length. Her grinding slows to a crawl as if she suddenly fell victim to a trance. Myrna’s tongue lolls out of her mouth, a huge, wide smile crawling across her face.");
			if(pc.cumQ() >= 3000)
			{
				output(" You continue to pump an obscenely large amount of your [pc.cumNoun] into Myrna, so much so that her already modestly chubby belly swells out even further.");
				if(pc.hasKnot(x)) output(" Thankfully, you have just the right anatomy to be able to plug her up with all the ‘water-heat` that she wants.");
				else output(" It only swells out to a certain point before the rest gushes back out of her quim, making a huge mess of your lap.");
			}
			else output(" You continue you pump spurt after spurt of your [pc.cumNoun] into her, thrusting upwards weakly with each throb until you are tapped.");
			output(" Myrna sits upright once more, turning her head to look back at you with lazily drooping eyes; a look that silently tells you how sated she is. <i>“Ah... alien water-heat... warm like Great Forge in belly too... Thank you for gift. Hope alien like too,”</i> she coos, idly rubbing her belly full of your seed.");
		}
		//If PC is using hardlight:
		else
		{
			output("\n\n<i>“No holdings back. Give water-heat when want, how much alien want.”</i> Myrna coos, jamming her dildo inside of you with an especially hard push.");
			if(pc.WQ() >= 50) output(" Even with your considerable amount of willpower, you find the grip on yourself rapidly slipping away from you.");
			output(" As much as you want to tell her that your hardlight dildo can’t give her exactly what she wants, all that spills out of your mouth are unintelligible grunts and squeals.");
			output("\n\nWith a final shake of her sizable butt, you moan as loudly as you think you have ever heard yourself and explode into your [pc.lowerUndergarment]. Your hips lurch upward violently, prompting a small <i>“Oh!”</i> from the korgonne. The moment your phallus head brushes against her cervix, her own orgasm is set off, triggering off a wild spasming around your [pc.cockOrHardlightFull]. You jerk uncomfortably under her while her walls milk your [pc.hardlightCockNoun] for an unobtainable purchase. Just as your orgasm begins to taper, Myrna lifts herself upright once more, turning her head to look back at you with concern in her eyes. <i>“Alien giving no water-heat? You okay? Still feel good?”</i> she asks, still grinding her bottom slowly into you. Despite the overstimulation, you manage to nod your head vigorously. Her worried frown melts away to give you a soft smile. <i>“Good. Long as alien feel good, Myrna feel good!”</i>");
		}
	}
	output("\n\n<i>“Mind if take nap together?”</i> Myrna asks, stifling a yawn. You find yourself mirroring her’s, exhaustion setting in from your supercharged orgasm. Savicite is some powerful stuff! With a lazy nod of your head, she leans backwards into you, settling against your [pc.breasts]. Despite Myrna being a somewhat plump gal, she is still comfortably light, mostly thanks to her diminutive height. With another yawn, you use the last of your remaining strength to roll the both of you over to your sides. You wrap your arms around the korgonne, gently rubbing her ");
	if(x >= 0 && pc.cumQ() >= 3000) output("cum-stuffed ");
	output("belly before your eyes become too heavy to keep open any longer.");

	output("\n\nWhen you open your eyes once again, you find that Myrna is no longer resting with you. You also notice that any evidence of your tryst is already cleaned up ");
	if(y > -2) output(", including the dildo that was previously inside of you");
	output(". A shuffling nearby leads you to spot Myrna, who is stoking the campfire nearby where you rest. Once she sees you stir, she smiles widely and hugs you, though much more softly than she usually does.");
	output("\n\n<i>“Oooh, alien awake! Myrna take good care while sleep. Have fun time! Hoping to do again! Happy to give body to alien when want again,”</i> she dotes happily, squeezing one of your arms. You thank the generous korgonne for the aftercare and the offer, hugging her back just as affectionately. When you fully recover your strength again, you rise up from the stone floor, bidding Myrna a merry farewell and walk out of the cave into the bitter Uvetan cold.");
	processTime(120);
	pc.orgasm();
	IncrementFlag("SEXED_MYRNA");
	clearMenu();
	addButton(0,"Next",myrnaLeave);
}