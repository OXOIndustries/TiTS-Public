import classes.Items.Miscellaneous.MyrNectar;
//Asennia and the Honeypot Stall
//God Why Did I Volunteer for this Instead of Writing Water Queen Nursing


/*Project Notes
Honeypot Name: Asennia.
Standard gold myr build: four arms, two legs, feelers, and a bloated abdomen where her cunt is mounted.
Wears a lot of jewelry: big silver necklace, several earrings, chains around her shoulders and arms.
Wears a loose-fitting white sash: covers her legs and lower body, but completely reveals her huge breasts.
Treats female customers with a kind of maternal affection - <i>“the closest I’ll get to motherhood.”</i> Menfolk, mostly offworlders, however... well, she’s not likely to get a chance at a male myr, and so she’s got some fairly rampant cocklust. PCs with cocks could easily talk her into some less professional activity.
During the war, Asennia was in signals intelligence (she’s actually very intelligent and well educated). Gave her a lot of time to sit around and not do anything physical, which meant her tits got bigger... and bigger... as she lounged around. Eventually her co-workers started asking to drink from her more and more; got a reputation on base as being <i>“better than the mess hall.”</i>
When the cease fire went on and she left the military, Asennia decided to use her saved-up funds to start a stall in Gildenmere, hoping to cater to off-worlders. Made so much money she was quickly able to hire a bunch more girls like her.
Shop is in the south-west corner of the Mushroom Park. Caters to the Thollum students and offworlders a lot - she’s made a killing off of star-walkers, many of whom can’t resist the urge to try her services. Being right next to the elevator only helps.
Has several honeypots working for her. She’s the biggest producer by far, but her stalls have seven other girls working at them, plus a couple of non-honeypot assistants.
Shop opens at 6:00 AM, runs until 18:00.
When the shop opens, Asennia has ENORMOUS tits, so huge she has trouble moving. Probably has to have help getting from her apartment to the stall.
As the day goes on, her tits shrink and shrink - gets drained by dozens of people every hour.*/

//Other Customers
//One at random is always sucking Asennia’s boob when you are!
//Human female. Redhead, slender, skin-tight bodysuit. A spacer, flirty and competitive.
//Leithan male. Blonde, ponytail, business suit horseblanket. Works for RhenWorld.
//Kui-tan futa. Black hair, chocolate fur. Lots of piercings. Works for Amb. Juro.
//Gold myr soldier girl. Highest chance to proc.
//Shade, if she’s friendly and on-planet.

public function showAsennia():void
{
	showName("\nASENNIA");
	if(hours < 12) showBust("ASENNIA_3");
	else if(hours <= 15) showBust("ASENNIA_2");
	else showBust("ASENNIA_1");
}
public function getAsenniaPregContainer():PregnancyPlaceholder
{
	var ppAsennia:PregnancyPlaceholder = new PregnancyPlaceholder();
	ppAsennia.breastRows[0].breasts = 2;
	if(flags["MET_ASENNIA"] == undefined) ppAsennia.breastRows[0].breastRatingRaw = 50;
	else if(hours <= 6) ppAsennia.breastRows[0].breastRatingRaw = 62;
	else if(hours <= 7) ppAsennia.breastRows[0].breastRatingRaw = 52;
	else if(hours <= 8) ppAsennia.breastRows[0].breastRatingRaw = 43;
	else if(hours <= 9) ppAsennia.breastRows[0].breastRatingRaw = 35;
	else if(hours <= 10) ppAsennia.breastRows[0].breastRatingRaw = 28;
	else if(hours <= 11) ppAsennia.breastRows[0].breastRatingRaw = 22;
	else if(hours <= 12) ppAsennia.breastRows[0].breastRatingRaw = 17;
	else if(hours <= 13) ppAsennia.breastRows[0].breastRatingRaw = 16;
	else if(hours <= 14) ppAsennia.breastRows[0].breastRatingRaw = 15;
	else if(hours <= 15) ppAsennia.breastRows[0].breastRatingRaw = 14;
	else if(hours <= 16) ppAsennia.breastRows[0].breastRatingRaw = 13;
	else if(hours <= 17) ppAsennia.breastRows[0].breastRatingRaw = 12;
	else ppAsennia.breastRows[0].breastRatingRaw = 11;
	ppAsennia.milkType = GLOBAL.FLUID_TYPE_NECTAR;
	ppAsennia.milkMultiplier = 100;
	ppAsennia.milkFullness = 100;
	return ppAsennia;
}
//Room Descripts & Intros
//Add to SW corner of Mushroom Park, near the Great Elevator:
public function honeyAntStallShit():Boolean
{
	author("Savin");
	if(hours >= 6 && hours <= 18)
	{
		//Hasn’t been to stall before, stall open:
		if(flags["MET_ASENNIA"] == undefined)
		{
			output("A large, semi-circular stone shelf has been constructed inside this not-so-small shop. A half-dozen gold myr women are sitting on the inside of the shelf, resting huge, bare breasts on the rock: these are clearly the famous honeypots of the gold myr, their chests swollen until they glow with amber nectar. A crowd of people are gathered around the shop, forming two loose lines in front of each of the women: there are some myr here, but the majority of the folk here are clearly off-worlders, humans and ausar and other galactic races eager to get a look at the hugely-busty ant-girls. The person at the front of each of the six lines is on his or her knees, face planted into a honey-filled breast.");
			output("\n\nA sign over the shelf reads <i>“Fresh nectar, straight from the tap! 50 Galactic Credits for a suckle, or take a vial to go!”</i> More prices are listed under that in various gemstones - the local currency.");

			//[Honey Stall]
			//Get in line for a taste of myr honey, straight from the tap.
			addButton(0,"Honey Stall",firstTimeAtHoneyTits,undefined,"Honey Stall","Get in line for a taste of myr honey, straight from the tap.");
		}
		//Has been to stall before, stall open:
		else if(hours <= 18)
		{
			output("The honeypot stall is open for business, and has attracted a large crowd of off-worlders fresh off the Great Elevator who’ve come to see what these hugely busty, bare-chested women are all about. A sign over the shop reads <i>“Fresh nectar, straight from the tap! 50 Galactic Credits for a suckle, or take a vial to go!”</i> More prices are listed under that in various gemstones - the local currency.");
			output("\n\nYou see Asennia sitting at the forefront, leaning over the stone shelf ");
			//Early morning: 
			if(hours < 10) output("and resting her huge, barrel-sized tits on the rock. Her nipples are big and puffy, so swollen with honey that every slight movement or pressure seems to make her squirt her amber nectar.");
			//Late morning:
			else if(hours < 12) output("and resting her honey-swollen jugs on the rock, leaning her head back with eyes closed as a pair of off-worlders kneel in front of her and suckle.");
			// Early afternoon:
			else if(hours <= 16) output("with a lazy, pleasured look on her face. Her melon-sized tits are resting heavily on the rocks while a gold myr girl and an ausar woman both suckle from her, pawing all over her bare chest.");
			// Late afternoon:
			else output("with a sleepy, contented look. Her breasts are as small as you’ve ever seen them: still large by human standards, easily E or F-cups. They’re nice and weighty and jiggle as her current customers paw and nurse from her, but she’d easily be able to stand up and move if she so chose.");
			output(" Seeing you in the crowd, Asennia gives you a friendly wave.");
			
			//[Asennia]
			//Get in line for a taste of the honeypot proprietor’s home-brew blend of nectar, straight from the tap.
			addButton(0,"Asennia",repeatApproachAsennia,undefined,"Asennia","Get in line for a taste of the honeypot proprietor’s home-brew blend of nectar, straight from the tap.");
		}
	}
	//Honeypot stall is closed
	else
	{
		output("The shop is closed at the moment, and a young gold myr woman is standing around with a mop, cleaning up what looks like a great deal of honey splattered all over the ground, the stone, and the mushrooms nearby.");
		addDisabledButton(0,"Honey Stall","Honey Stall","The honey stall is currently closed.");
	}
	return false;
}

public function firstTimeAtHoneyTits():void
{
	clearOutput();
	showAsennia();
	author("Savin");
	//First Time @ [Honey Stall]
	//Get in line for a taste of myr honey, straight from the tap.
	//Lose no Credits; small Thickness gain.
	//flags["MET_ASENNIA"] = 1;
	output("A chance to suckle honey from the tits of a smoking-hot ant girl? Sure, why not! You walk over to the shortest line out from the stalls and claim your place: maybe six people back in line for the inhumanly-busty myr’s left breast.");
	output("\n\nAt the front of the line, you see an attractive young woman in a skin-tight jumpsuit with long, leathery blue wings behind her is on her knees in front of the honeypot, a hand digging into either side of her balloon-like tit in her face. She’s squeezing while she suckles, gulping down a steady stream of myr nectar. The myr is moaning happily, a hand atop the head of both the off-worlders suckling from her; her second pair of hands is noticeably absent from view, wrapped behind her sitting body and her bloated abdomen. The way she’s moving, the way her chest is heaving, something tells you she’s thoroughly enjoying the act of nursing person after person.");
	output("\n\nOf course, with both customer and vendor enjoying themselves so much, the line doesn’t seem to be in much of a hurry. The dragon-woman ahead of you seems to take the better part of half an hour to finish her drink, finally popping off the tit and running a cream-pale hand over her lips to wipe away an excess of sticky amber. You see her swipe a credit chit through a hand-held device the myr hands her, then slip away in the crowd. The line steps forward all of three or four paces, and you start mumbling about your [pc.feet] aching.");
	output("\n\nYou’re starting to think that the line’s not worth waiting through - and pity the dozen or so people who’ve fallen in behind you - when you see the shop door open and a tall, extraordinarily busty gold myr steps out. She’s clad in nothing but a silky white sash around her waist, but leaving her chest completely bare. The myr is gorgeous, her statuesque beauty accented by silver jewelry and gemstones all around her brow, neck, and shoulders. All four arms are curled under her chest, trying to support her barrel-sized breasts.");
	output("\n\n<i>“I’m sorry for the long lines, my dears,”</i> the woman says, loud enough for everyone nearby to hear. <i>“There’s so many of you lately! Please, if some of you will come over here and form two more lines, I will provide for you myself.”</i>");
	output("\n\nMust be the owner, you figure. The bountiful honeypot scoots one of the women already working the stall aside, and sets up just beside the line you’re already in. Considering how slow it’s been, you decide you join the scrabble of people who are forming the new lines. With a little ");
	if(pc.characterClass == GLOBAL.CLASS_MERCENARY) output("brute force shoving");
	else output("finesse");
	output(", you manage to ensure that you’re at the very front of the new line, positioned at the honeypot’s right breast.");

	output("\n\nShe smiles warmly at you with black-painted lips, the same deep onyx as her featureless eyes. <i>“Hello!”</i> she says, almost nonchalantly as she sets her heavy, nectar-laden tits down on the polished stone shelf. <i>“Ah, I don’t think I’ve seen you here before. I’m Asennia, the owner.”</i>");
	output("\n\nThe myr extends one of her four hands to you in a clearly-practiced human gesture. You shake it, strong enough to make her tits jiggle under her, and give her your name in turn.");
	output("\n\nAsennia scoots a little bit on the stool behind the counter, leaning over her tits. <i>“A pleasure to meet you, [pc.name]. I understand you may not have services like mine on your homeworld, but please: drink as much as you’d like from my breast. My nectar, and that of my employees, is both filling and nutritious. You can take an entire meal from me, if you’d like.”</i> She pats the top of her boob and adds, <i>“I have as much as you can stomach, as you can see.”</i>");
	output("\n\nYou give her a ");
	if(pc.libido() >= 70 || pc.lust() >= 50) output("lusty ");
	output("grin and slip down ");
	if(pc.hasKnees()) output("onto your knees");
	else output("onto your lower body");
	output(", putting your face even with Asennia’s saucer-sized, dark tan nipple while she turns to her other client, a human woman, and gives her the same run-down.");
	//if low libido:
	if(pc.libido() <= 33) output(" A bit shyly, you reach up and plant your hands on either side of Asennia’s breast, marvelling at how your fingers sink into the liquid-filled flesh. Your hands all but disappear, and a thick bead of honey instantly appears on your hostess’s teat.");
	// moderate libido:
	else if(pc.libido() <= 66) output(" You lick your lips and slip your hands up Asennia’s boob, giving it an experimental squeeze. She sucks in a slight breath, and honey begins to bead up from the tip of her dark nipple.");
	else output(" You eagerly dig your fingers into Asennia’s boobflesh, squeezing her until she moans mid-sentence and honey squirts out of her teat, splattering the ground beside you. Honey bubbles up from her breast, and Asennia flashes you a smile. <i>“Eager, aren’t you...”</i>");
	processTime(6);
	pc.changeLust(10);
	clearMenu();
	addButton(0,"Next",asenniaPartTwoIntro);
}

public function asenniaPartTwoIntro():void
{
	clearOutput();
	showAsennia();
	author("Savin");
	output("You take a deep whiff of the nectar in front of you, getting just a hint of the overwhelming sweetness of it. Her nectar looks almost more like syrup than honey, drooling amber liquid that quickly leaves a trail rolling down her pale flesh. You lower yourself down towards the descending bulb of amber nectar and flick at it with your [pc.tongue]; you let out a happy little sigh as you taste the delectable golden fluid, and trace your tongue back up along its trail until your [pc.lips] are brushing the stiffening peak of Asennia’s breast.");
	output("\n\nAt the same time you wrap your lips around the honeypot’s nipple, her other customer is already starting to enjoy her drink, puckering her lips just around the very promontory of Asennia’s tit and using her hands to squeeze and knead the honey out. Your hostess moans, flicking her insectile antennae back and forth between the two of you. <i>“Ah, you must have been starving, darling,”</i> she murmurs, running a hand through the other woman’s long, auburn hair.");
	output("\n\nA creeping knot of jealousy forms in your throat, and you find yourself glowering at the human woman feasting beside you despite yourself. She notices, and flashes you half a smile between long sucks from Asennia’s tap. Hearing the ant-girl moan sensually, wiggling her body in a way that makes her breasts quake like liquid under your arms, drives you over the edge. You open wide, burying as much as Asennia’s huge teat in your mouth as you can, and start to suck.");
	output("\n\nYou expected resistance: a slow trickle of honey that would slowly grow as you nursed from the golden ant. Instead, you’re treated to an almost overwhelming flood the moment you give her the slightest bit of suction, like you’d just smashed a floodgate open with a wrecking ball. Your cheeks bulge, trying desperately to keep up with the deluge of syrupy nectar. No amount of swallowing seems to be able to catch up with the blast of honey coating your throat, and your face feels like its burning with all the sugar you’re gulping down. Asennia’s nectar is so sweet that your eyes start to water, but so unbearably delicious that you just can’t stop yourself.");
	output("\n\n<i>“Eager to make a good first impression, I see,”</i> Asennia laughs, reaching down to caress your [pc.hair] with one of her four hands. Between quiet moans, she adds <i>“Ah, you’re both... mmm... so thirsty...”</i>");
	output("\n\nYou grin to yourself, less thirsty than you are aroused... and eager to outshine the redheaded spacer beside you. Good first impressions <i>are</i> so important, after all.");
	output("\n\nThe human girl either has the same thing on her mind, or else is sporting a competitive streak a mile wide. When she sees Asennia’s attentions flittering over to you, she immediately redoubles her groping and sucking on the massive tit in front of her. With a loud, smacking sound the woman pulls back on the ant’s teat, pinching it between her teeth before letting it snap back in an explosion of nectar that she greedily licks up. Asennia barely stifles a squeal of pleasure when her nipple is treated like that, and the impact sends a particularly violent squirt of nectar to splatter against the back of your throat.");
	output("\n\nMeanwhile, the human woman’s hands crawl all over the myr’s breast, squeezing and kneading the amber-tinted flesh with expert motions. This chick’s clearly got a lot of experience handling big tits, not unlike a trained masseuse. The insectile proprietor responds with a growing cascade of moans and groans, and you watch as her upper set of arms rest on the tops of her breasts, squeezing them between palms and cold stone.");
	processTime(6);
	pc.changeLust(33);
	clearMenu();
	addButton(0,"Next",introToAsseniaPartThree);
}

public function introToAsseniaPartThree():void
{
	clearOutput();
	showAsennia();
	author("Savin");
	output("You won’t let yourself be outdone that easily. Figuring Asennia might prefer a gentler touch, you latch your lips to the very rim of her dark areola and start to work your [pc.tongue] around the edge, circling closer and closer in towards the stiff peak. Your tongue wraps around her pebbly point, lapping up sweet nectar as you lavish the honeypot’s teat with tender yet unrelenting strokes.");
	output("\n\nIt turns out your instincts were right: it’s a softer touch this massively buxom myr really needs. Asennia groans, abandoning any pretense of concealing her pleasure; her fingers clutch at your [pc.hair] and pull you into her breast, burying you in a pillow of titflesh that completely envelops your face. You’re blinded by Asennia’s boob, forced to work on nothing but taste and touch. Your fingers wander across the expanse of flesh around you, squeezing at her honey-laden body as your [pc.tongue] urges out a stronger and stronger flow of her sweet nectar.");
	output("\n\nYou can actually <i>feel</i> Asennia’s bust shrinking as you and your fellow customer drain her of what feels like gallons of honey. She’s jiggling and moaning and pulling harder against you, reaching a crescendo. It takes you a moment to realize what’s going on: long enough to leave you defenseless when a thunderous boobgasm rocks the ant-girl. Asennia screams in pleasure, echoing through the caverns, and squirts honey like a geyser into your mouth. Your cheeks bulge, struggling to keep down an ungodly amount of syrup-like nectar blasting into your mouth.");
	output("\n\n<i>“Oh... oh!”</i> Asennia gasps, trying and failing to form words. Her chest does the talking for her, quaking and spurting and jiggling against the stone in ways that wouldn’t be possible for anything less than a golden myr. You suckle more fiercely, drinking deep of the honeypot’s bounty as her orgasm blows a massive load out of her tits.");
	output("\n\nAs suddenly as her climax hit, the honeypot proprietor gives you a gentle but firm push back, separating you from her breast. You blink and moan, wiping at honey drooling down your chin; beside you, the red-headed spacer chick is doing much the same, licking her lips with a lusty grin aimed up at your hostess.");
	output("\n\nThe golden myr looming over you is panting heavily, using a pair of hands to rub at her well-sucked teats; the other set reach out to stroke both of your cheeks with unprofessional affection. <i>“I’ve never... never had customers treat me like that,”</i> Asennia moans. <i>“You offworlders are so different.”</i>");
	output("\n\n<i>“Not in a bad way, I hope?”</i> you ask, cutting the red-head off before she can steal your thunder.");
	output("\n\n<i>“In the best way possible,”</i> the honeypot assures you both. <i>“Nobody has ever brought me so much pleasure while they suckled before. Certainly not in tandem.”</i>");
	output("\n\nYou cast a glance to the redhead, and to your surprise she gives you a grin and a thumbs up. Your eyes, meanwhile, fall down to her perky breasts, pressing against the front of her jumpsuit and covered in spilt honey. One of her hands slides down her body, over all of those inviting curves.");
	output("\n\n<i>“Mmm, any time either of you visit us again, I insist you come see me personally. I’d very much like a repeat performance.”</i>");
	output("\n\nSo would you.");
	output("\n\nYou and the other customer both go for your credit chits, but Asennia waves her hand. <i>“Not this time. I think after that treatment, the first sample should be free...”</i>");
	output("\n\nYou smile at the well-sucked honeypot and stand up, wiping away an excess of honey on your cheeks. The other woman, the redhead, hops to her feet and starts to leave - but not before reaching back and slapping your [pc.butt] first. You flinch and turn to face her, just in time to see her flashing you a wink before she saunters off into the crowd.");
	output("\n\n<i>“See you next time,”</i> Asennia murmurs to you as you step out of line, letting her next set of customers come over to get their long-awaited drink.");
	processTime(13);
	pc.milkInMouth(getAsenniaPregContainer());
	output(pc.modThickness(1));
	flags["MET_ASENNIA"] = 1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function asseniaMenu():void
{
	clearMenu();
	showAsennia();
	if(pc.credits >= 50)
	{
		if(hours < 12) addButton(0,"TapDrink",repeatDrinkStraightFromAsenniasTap,undefined,"Drink From The Tap","Get a drink straight from the tap!\n\n<b>50 Credits</b>");
		else 
		{
			if(pc.hasCock() && flags["ASENNIA_COCK_OFFERED"] != undefined) addButton(0,"TapDrink",afterNoonMyrSnackRouter,undefined,"TapDrink","Get a drink straight from the tap! Given the way you and Asennia have gotten along, you might get a little more than that, too...\n\n<b>50 Credits</b>");
			else addButton(0,"TapDrink",afterNoonMyrSnackRouter,undefined,"TapDrink","Get a drink straight from the tap!\n\n<b>50 Credits</b>");
		}
		addButton(1,"To Go",milkToGoCup,undefined,"Get a To Go Cup","Ask Asennia for a to-go cup of her delicious nectar. Guaranteed to fill you with energy, and a key ingredient to all manner of Myrellion delicacies.\n\nCost: <b>50 Credits</b>");
	}
	else
	{
		addDisabledButton(0,"TapDrink","TapDrink","You can't afford that.");
		addDisabledButton(1,"To Go","To Go","You can't afford that.");
	}
	addButton(2,"HoneyWine",honeyWineIntro,undefined,"Ask about honey wine.\n\nCost: <b>1000 credits</b>");
	addButton(3,"Her Business",herBusinessAsennia,undefined,"Talk: Her Business","Ask Asennia about her operation here. It’s definitely unique!");
	addButton(14,"Leave",mainGameMenu);
}

//Repeat Greeting
//Replace stall with [Asennia]
public function repeatApproachAsennia():void
{
	clearOutput();
	showAsennia();
	author("Savin");
	//Morning Greeting (Huge Tits)
	if(hours < 12)
	{
		output("Seeing Asennia leaning on her huge, honey-laden tits is enough to draw you over to the suckling stall. She smiles and gives you a wave, beckoning you around the line.");
		output("\n\n<i>“And here’s one of my favorite customers!”</i> she beams, between muted moans as a pair of off-worlders busily suckle from her. <i>“Welcome back, [pc.name]. Come for a morning drink?”</i>");
	}
	//Afternoon Greeting (Smaller Tits)
	else
	{
		output("It’s kind of amazing, the way Asennia’s breasts have shrunk and shrunk over the course of a day’s business. She’s almost down to a normal human’s sizes, though still heavy and full of honey. She sees you staring, and waves you over through the line.");
		output("\n\n<i>“Good afternoon, [pc.name],”</i> she says with a smile, leaning back in her seat. The myr girl who’s suckling from her comes with her, hips wiggling happily as she’s all but yanked over the counter with her ass in the air. <i>“Feeling thirsty? I’ve still got some nectar left today, if you’d like. Or maybe you’d just like to play with them a bit?”</i>");
		output("\n\nAt the second offer, Asennia cups the boob not currently being used, just hard enough to elicit a drooling drop of honey out of her dark teat. A tempting offer indeed...");
	}
	asseniaMenu();
}

//Talk: Her Business
//Ask Asennia about her operation here. It’s definitely unique!
public function herBusinessAsennia():void
{
	clearOutput();
	showAsennia();
	author("Savin");
	output("<i>“Mind talking for a minute?”</i> you ask the honeypot, trying to ignore the burn of arousal watching her nurse her customers gives you - never mind the other half-dozen moaning, squirting ants around her.");
	output("\n\n<i>“I’d be delighted,”</i> Asennia answers, steepling her upper set of fingers. <i>“Anything specific on your mind, [pc.name]?”</i>");
	output("\n\nHelping yourself to a seat ");
	if(pc.isTaur()) output("next to the counter");
	else output("on the counter beside her slowly-draining bosoms");
	output(", you churn through a few lingering questions in your mind. First and foremost of which is how she got into the business of selling her nectar like this.");

	output("\n\nAsennia chuckles at the question, a throaty sound that makes her tits quake in the most delightful way. <i>“Ah, yes. I suppose this must be a very strange profession to you star-walkers, though in truth the role of honeypot dates back to antiquity. There have always been gold myr men and women like us,”</i> she gestures around to her employees, <i>“whose bodies are exceptionally gifted at turning bland food into delicious honey. In ancient times, girls like me would be the treasure of a village, since food can be so scarce down here in the caves, and what you do find is just more and more of the same old fungus, day in and day out.”</i>");
	output("\n\n<i>“But we honeypots can turn any food we eat, no matter how dull and bland, into honey. Whatever we don’t need ourselves, we store in our breasts and abdomen, where it’s easy for our friends to get. We’re living larders, or better yet, living candy factories. As long as we eat well, we’ll always have a supply of sweet honey for anyone who’s hungry. You have to admit, nuzzling up to a big-breasted girl and suckling a meal from her is soooo much better than just eating mushrooms, don’t you think?”</i>");
	output("\n\nWhen she puts it like that, it certainly seems the more appealing option. The dozens of customers lined up to suck her tits, and those of her employees, only reaffirm her point.");
	output("\n\n<i>“Are there many shops like this, then?”</i> you ask.");
	output("\n\nAsennia shrugs. <i>“There were more, before the war. It took a great deal of money and work to secure the food required to keep myself and my employees nice and plump. I can assure you-”</i> she starts to say, cut off when the girl currently suckling on her starts to get overly amorous, sucking and groping until Asennia moans.");
	output("\n\nAfter a few moments, Asennia manages to urge her customer down, chiding her behavior while she’s talking. With a sigh, the proprietor turns her attention back to you and says, <i>“As I said, there are few honeypot shops like mine nowadays. I’ve already bought out the remaining ones in Gildenmere, so we’re certainly the only one you’re likely to see during your visit.”</i>");
	output("\n\n<i>“You bought them all?”</i>");
	output("\n\nShe nods. <i>“But you asked how I got into the business, did you not?”</i>");

	output("\n\nSomething tells you she doesn’t want to get too deep into her business practices, so you merely answer in the affirmative. <i>“My entrance into the honeypot business wasn’t entirely intentional. During the war, you see, I was lucky enough to be assigned to signals intelligence. Less exciting than it sounds, I assure you: I was nothing more than a codebreaker. Which meant that I was sitting well behind the front lines, doing very little more than sitting at my desk day in and day out.”</i>");
	output("\n\n<i>“As you can imagine, over the course of six years of sedentary service I began to put on more and more weight. While all gold myr tend to gain breast, buttocks, and abdominal size as they gain weight, only a small percentage of the population become true honeypots like me. Rather than chastise me for over-eating, my commanding officer insisted that I ‘share’ with her and my comrades.”</i>");
	output("\n\nSmiling, Asennia reaches down to stroke the hair of one of her current customers who’s busily sucking from her tit. <i>“I quickly became more popular than the base’s mess hall. At all hours of the day, my fellow soldiers were suckling from me: girls would always be attached to my breasts while I worked, would find me in the showers... come calling at my bunk at night. You can imagine, I found this arrangement quite agreeable.”</i>");
	output("\n\nYou can indeed. After all, the entire time you’ve been talking, she’s punctuated her words with sensual moans, and you can see her bloated abdomen wiggling behind her in a puddle of leaking arousal. The big cunt positioned on the back of her abdomen winks its pink lips at you, and its owner clearly sees where you’re looking.");
	output("\n\nHer ever-present smile only grows in response to your blatant lechery. <i>“Shortly before the ceasefire, I was discharged from service and returned home to Gildenmere. With six years of saved up pay, I was able to open up a shop and do what I love. Not long after that, the first star-walkers showed up, and as you can see,”</i> she says, sweeping an arm over the lines of customers, many of whom are from all over the known galaxy, <i>“we honeypots have been extraordinarily popular with alien races. It seems we’re a very... titillating... attraction.”</i>");
	output("\n\nShe certainly seems to have done well for herself. Returning her smile, you ask her if she’d be willing to share the secret to her success.");
	output("\n\n<i>“That’s an easy question,”</i> Asennia chuckles, just as her current customer pops off her breast with a thoroughly sated grin. The two exchange payment, and the honeypot gets a quick kiss on the cheek for her trouble. She winks and reaches under the counter to pull out a tissue, which she uses to clean off her honey-plastered teat. <i>“I was lucky enough to be the closest honeypot to the great elevator,”</i> she finally says, vigorously rubbing her nipple. <i>“That more or less cemented my position as the top honeypot in the city. All of you off-worlders who come down the elevator see me right away, and so very many of you are intrigued enough to come over. Since First Contact, I’ve become quite wealthy, I have to admit. Enough so that I was able to buy out my competition: now they work for me, and my shop can serve even more off-worlders per day.”</i>");
	output("\n\n<i>“Sounds like you’ve got quite the operation going here,”</i> you admit. Given your history, it’s hard not to admire a good mind for business. Jokingly, you tell her she might make a good employee for Steele Tech some day. She laughs, saying <i>“Now </i>that<i> I would like to see: one of these mega-corporations I’ve heard so much about with a girl like me at the board meeting. Maybe I could suckle some of your stockholders while you work, hmm?”</i>");
	output("\n\nConsidering the people your dad surrounded himself with...");
	output("\n\nAsennia shakes her head with a laugh. <i>“No, no. I’m quite happy to have my business to manage, but thank you for the offer. Speaking of offers,”</i> she adds, tossing the honey-soaked rag aside. <i>“Would you like a drink, [pc.name]?”</i>");
	processTime(18);
	asseniaMenu();
	addDisabledButton(3,"Her Business","Her Business","You just finished that discussion.");
}


public function honeyWineIntro():void
{
	clearOutput();
	showAsennia();
	author("Fenoxo");
	output("You glance between the lovely hostess and a small crate of glass bottles. Following your gaze, Asennia flashes you a broad smile and picks one out for you, a dark container full of honey-colored liquid.");
	output("\n\n<i>“1000 credits if you want a taste of royalty. This is honey-wine, distilled from a Queen’s personal nectar. Irellia’s one of the few women I’d comfortably say has tastier tata’s than my own. A few sips of her brew and you’ll feel more energetic than ever.”</i> She smiles knowingly at you. <i>“Drink the whole thing, like I bet you will, and you’ll be tapping into an expanded well of energy for a whole day.”</i> Rolling the bottle between her fingers, Asennia licks her lips and sighs. <i>“If you can afford it, buy it. I promise it’ll be worth it.”</i>");
	processTime(1);
	clearMenu();
	if(pc.credits >= 1000) addItemButton(0, new HoneyWine(), buyDatHunhunWine);
	else addDisabledButton(0,"Buy","Buy","You don't have enough credits for that. It costs <b>1000 credits</b>.");
	addButton(14,"Back",repeatApproachAsennia);
}

public function buyDatHunhunWine():void
{
	clearOutput();
	showAsennia();
	pc.credits -= 1000;
	// Stuff for getting a Honey Wine bottle here.
	itemScreen = repeatApproachAsennia;
	lootScreen = repeatApproachAsennia;
	useItemFunction = repeatApproachAsennia;
	
	itemCollect([new HoneyWine()]);
}
//Milk To-Go Cup
//Ask Asennia for a to-go cup of her delicious nectar. Guaranteed to fill you with energy, and a key ingredient to all manner of Myrellion delicacies.
//-50 Credits
public function milkToGoCup():void
{
	clearOutput();
	showAsennia();
	author("Savin");
	output("You glance between your lovely hostess and the stack of thermos-like containers behind the counter. Following your gaze, Asennia flashes you a broad smile and picks one out for you, a bright pink, partially-transparent container, and pops the top.");
	output("\n\n<i>“Fifty credits, and you can fill this with as much as you’d like. Knowing you, I think that would be right up to the brim.”</i>");
	output("\n\nShe knows you so well already...");
	output("\n\nYou swipe your Codex over the pay station, authorize the transaction, and slip down onto your ");
	if(!pc.hasKnees()) output("lower body");
	else output("knees");
	output(" in front of Asennia’s left tit. She gives a quiet little moan as your hands reach out to caress the ");
	if(hours < 12) output("huge");
	else output("hefty");
	output(", amber-filled swells of her breast. A dollop of golden nectar bubbles up from the wide, dark saucer of Asennia’s nipple, which you quickly reach out and lick off.");

	output("\n\nThe stuff really is delicious, a sweet nectar that clings thickly to your tongue. It’s not <i>quite</i> honey, more like honey-flavored syrup that’s delightfully sticky. You’d love to have this flavoring a nice, hot cup of tea, or maybe even some pancakes... so many things you could do with your purchase. Assuming you can keep yourself from just drinking it all raw.");
	output("\n\nAs you’re settling down in front of her, running a hand across her teat and pulling the long nub towards your container, another customer approaches your hostess’s other meaty boob. Asennia smiles, exchanges a few words, and accepts a payment. You look over, just in time to see ");

	var helper:Number = -1;
	//If Shade, higher rolls
	if(shadeAtTheBar()) helper = rand(5);
	else helper = rand(4);
	if(helper == 0) output("a familiar red-haired human slip down onto her knees, making her skin-tight jumpsuit creak. Her eyes go a little wide as she recognizes you, but she recovers with a lecherous smile. <i>“Hey again, stranger,”</i> she purrs, reaching up to Asennia’s boob and running her tongue along a tanned teat. Your hostess moans, hand reaching down to run through red locks and pull the woman against her breast.");
	else if(helper == 1) output("a great big, bulkily-plated centaur settle down on his knees, running a hand through a blonde ponytail behind plated bunny ears before he roughly hefts up Asennia’s right boob to his mouth and starts to suckle.");
	else if(helper == 2) output("a fur-clad woman shimmying down, undoing the top buttons on her business-style blouse tucked under a blazer jacket and skirt. Your recognize her as a kui-tan, possibly from Ambassador Juro’s diplomatic unit -and you also instantly recognize the growing bulge announcing itself between her legs while she starts licking and kissing at Asennia’s boob.");
	else if(helper == 3) output("a gold myr trooper, probably an off-duty guard, casually sitting down beside you. She’s got a uniform unbuttoned from over a white shirt, barely containing a nice, plump pair of tits of her own. The soldier gives you a smile and a two-handed wave before she cups Asennia’s breast and wraps her lips around the hostess’s teat.");
	//if Shade friendly & on-planet: 
	else
	{
		output("a familiar white-haired cat-girl slipping down onto her knees beside you. Your eyes widen as Shade turns to flash you a grin, tail wagging behind her. <i>“Hey, junior,”</i> she murmurs, reaching over to slap your [pc.butt]. <i>“Come here often?”</i>");
		output("\n\nYou blush and mumble something about this not being your first time. Shade just laughs and grabs Asennia’s right tit, squeezing hard enough to make a little honey squirt out. <i>“I’d prefer milk, personally,”</i> she says, <i>“though it’s hard to pass up a chance to play with tits like these.”</i>");
	}
	output("\n\nYou give your fellow-drinker a nod and turn your attention back to the drooling teat in front of you. ");
	if(hours < 12) output("You run a hand along the huge, honey-laden globe and press your to-go container against her saucer-sized nipple, encasing the stiff promontory in the thermos.");
	else output("Hefting up Asennia’s heavy, big breast, you plant it at the rim of your to-go cup and give it a little squeeze.");
	output(" The honeypot ant moans as you start to milk her breasts; it’s hard to resist getting your mouth in on the fun, the way honey just geysers from her nipple and splatters onto the side of the plastic container.");

	output("\n\nWith one hand holding the cup, you’re left milking the myr’s honey-laden udder one-handed: you squeeze and knead the amber-tinted flesh, urging Asennia’s nectar out from within the depths of her bosom. Honey pours out ");
	if(hours < 12) output("easily. You barely have to work to keep up a nice, steady stream from the honeypot.");
	else output("at a slow but steady pace. So many people have already had their fill of Asennia’s nectar today that you have to work for your future meal, squeezing her roughly until she moans and chews her lip. Taking pity on the over-taxed ant, you lean in and run your [pc.tongue] along the side of her breast, avoiding the nipple but lavishing the rest of her breast with oral affection. Occasionally you stop to nip at her skin, playfully biting before leaving her with a kiss or a long lick that goes almost all the way up to her neck.");
	output(" Your hostess’s whole body quivers with pleasure as you milk her into the cup, and you’re treated to a small symphony of moans, groans, and pleasured cries.");

	output("\n\nBeside you, ");
	if(helper == 0) output("the red-headed spacer is greedily sucking down Asennia’s honey, all but face-fucking the ant’s big, puffy nipple.");
	else if(helper == 1) output("the leithan man is working as hard as you are to pleasure Asennia’s boobs, licking and kissing all around them between gulps.");
	else if(helper == 2) output("the kui-tan woman moans happily as she drinks deep from Asennia’s boob, spilling honey down her furry chin.");
	else if(helper == 3) output("the gold myr trooper is enjoying a leisurely drink, happily suckling as she massages Asennia’s boob, using all four arms to squeeze and caress the honeypot’s swollen flesh.");
	else output("Shade’s cunt-tail swishes eagerly behind her, and the busty kitty-MILF bobs her head to the same rhythm of her gulping down Asennia’s honey.");
	output(" Your companion certainly seems to be enjoying ");
	if(helper == 0 || helper == 2 || helper == 3 || helper == 4) output("herself");
	else output("himself");
	output("! You exchange a glance, but quickly find your attention drawn back to Asennia as your to-go cup starts to get awfully full. With deft fingers, you drain the honeypot until you’ve earned yourself a full serving of her nectar. The cup makes an audible pop as you detach it from the ant’s boob, and is followed by a little squirt of honey that splatters your wrist and the front of Asennia’s curvy chest.");

	output("\n\n<i>“Ah! Have your fill, love?”</i> your hostess purrs, patting her well-milked chest. <i>“Well, I hope you enjoy my nectar soon, [pc.name]. That way you’ll be back for more.”</i>");

	output("\n\nYou grin at the busty honeypot and tell her you’ll definitely be back before long.\n\n");

	//[Next]
	processTime(22);
	pc.credits -= 50;
	pc.changeLust(10);
	clearMenu();
	quickLoot(new MyrNectar());
}

//Get a drink straight from the tap!
//-50 Credits; small Thickness gain.
public function repeatDrinkStraightFromAsenniasTap():void
{
	clearOutput();
	showAsennia();
	author("Savin");
	output("Looking at the huge, honey-swollen breasts Asennia’s resting on the stone counter fills you with hunger. You can’t help but lick your lips at the sight of them, eyes taking in the full curves and the dark ring of her nipple, surrounded by a pebbly ring around a prominent peak. She’s so... so <i>full</i>, intoxicatingly beautiful in her swollen state. The primal part of your brain switches on, and you slip down onto the paved ground in front of the honeypot stall - in front of Asennia’s fully laden breasts.");
	output("\n\n<i>“Thirsty, darling?”</i> she purrs, her dark lips smiling broadly. <i>“You know you’re welcome to as much as you’d like.”</i>");
	output("\n\nOne of her arms reaches down and runs her black-plated fingers around her nipple, pinching herself just hard enough to draw out a tiny trickle of her golden nectar. Your eyes widen as the smell of sweet honey hits you, and you find yourself leaning closer and closer into the swollen tit until your lips brush against the dark plane of Asennia’s tit, smearing the pre-trickle of honey across your [pc.lips].");
	output("\n\nThe taste lights your mind on fire, compelling you to greedily lock your mouth around Asennia’s boob and start to suckle for more. The busty honeypot moans, drawing a sharp breath as you latch onto her, and your [pc.tongue] laps across the rough surface of her teat. With her breast so full, it doesn’t take much to start a flow of honey into your mouth. Your hands wander up, first on the front swell of her breast, then caressing their way up her curves; as you go, you roughly squeeze and dig your fingers into her titflesh. Your fingers practically disappear into her warm amber flesh, working to knead the honey out of her chest.");
	output("\n\nAs you’re starting to drink, Asennia’s attentions turn to another figure approaching her from behind you. You hear her exchange a few words with the new customer, and see ");

	var helper:int = 0;
	if(shadeAtTheBar()) helper = rand(5);
	else helper = rand(4);

	if(helper == 0) output("a familiar red-haired human slip down onto her knees, making her skin-tight jumpsuit creak. Her eyes go a little wide as she recognizes you, but she recovers with a lecherous smile. <i>“Hey again, stranger,”</i> she purrs, reaching up to Asennia’s boob and running her tongue along a tanned teat. Your hostess moans, hand reaching down to run through red locks and pull the woman against her breast.");
	else if(helper == 1) output("a great big, bulkily-plated centaur settle down on his knees, running a hand through a blonde ponytail behind plated bunny ears before he roughly hefts up Asennia’s right boob to his mouth and starts to suckle.");
	else if(helper == 2) output("a fur-clad woman shimmying down, undoing the top buttons on her business-style blouse tucked under a blazer jacket and skirt. Your recognize her as a kui-tan, possibly from Ambassador Juro’s diplomatic unit -and you also instantly recognize the growing bulge announcing itself between her legs while she starts licking and kissing at Asennia’s boob.");
	else if(helper == 3) output("a gold myr trooper, probably an off-duty guard, casually sitting down beside you. She’s got a uniform unbuttoned from over a white shirt, barely containing a nice, plump pair of tits of her own. The soldier gives you a smile and a two-handed wave before she cups Asennia’s breast and wraps her lips around the hostess’s teat.");
	else 
	{
		output("a familiar white-haired cat-girl slipping down onto her knees beside you. Your eyes widen as Shade turns to flash you a grin, tail wagging behind her. <i>“Hey, junior,”</i> she murmurs, reaching over to slap your [pc.butt]. <i>“Come here often?”</i>");
		output("\n\nYou blush and mumble something about this not being your first time. Shade just laughs and grabs Asennia’s right tit, squeezing hard enough to make a little honey squirt out. <i>“I’d prefer milk, personally,”</i> she says, <i>“though it’s hard to pass up a chance to play with tits like these.”</i>");
	}
	output("\n\nGiving your drinking companion a friendly nod, you leave ");
	if(helper == 1) output("him");
	else output("her");
	output(" to Asennia’s other boob and return your attentions to the one you’re latched on to. The more your hands and mouth work around her tit, the more sweet nectar she squirts into your mouth. She’s like a honey hose, seemingly limitless in what’s able to gush out of her breast. As minutes slip by, your eyes flutter closed, and your mind begins to drift into a miasma of arousal and contentment while you suckle.");

	//if PC has a cock:
	if(pc.hasCock())
	{
		output("\n\nThe exhibitionist arousal of breastfeeding from a girl in the middle of the public has you breathing heavily, shifting uncomfortably around an erection that grows with every gulp of honey. Somehow, Asennia manages to notice your growing ");
		if(pc.isCrotchGarbed()) output("bulge");
		else output("stiffy");
		output(" over her keg-sized tits, and you feel her plated fingers stroking your cheek as she moans excitedly.");

		output("\n\n<i>“Mmm, one of the few times I wish I was a little less full at the moment,”</i> she coos, cupping your chin and smiling down at you. <i>“If I wasn’t drowning in customers... and if my boobs weren’t so big I could hardly move... I’d love to let you crawl over the counter here and give me a chance to play with a real, live cock. You don’t know how rare an opportunity like that is...”</i>");

		output("\n\nNow that’s a tempting proposition, getting to sit in Asennia’s lap and suckle from her while she strokes you off... maybe you ought to come back when the honeypot’s business has left her a little less buxom.");
		pc.exhibitionism(1);
		pc.changeLust(10);
		flags["ASENNIA_COCK_OFFERED"] = 1;
	}
	output("\n\nYou let your fantasies take over, imagining crawling all over Asennia’s cask-like breasts, all but bathing in her vast reserves of nectar. Your arms wrap around her, hugging Asennia’s boob as close as a lover while you drink and drink until your stomach feels as full as after a Thanksgiving feast. The more you suckle down, the more Asennia moans and shivers - every movement makes her bust jiggle hypnotically, like a quaking waterbed. You note with a smirk that eventually one of the hostess’s hands disappears behind her, groping at her bloated abdomen and the drooling sex within. A moment later and her moans reach a new crescendo, and the honey starts coming out of her just a little easier.");
	output("\n\nEventually, though, you start to realize that you’re getting so full that you’re getting ready to pop. Sighing sadly, you detach yourself from Asennia’s dark, wet teat and lick your lips to clean them of a sticky glaze of her nectar. The honeypot makes a drawn-out sigh as you stand up, and extends a hand with a modern credit-swipe in it.");
	output("\n\n<i>“Visit me again soon, alright?”</i> she smiles as you transfer your payment over.");
	if(pc.hasCock()) output(" <i>“Maybe a little later today, when I’m less full? You and I could have some real fun then,”</i> she adds with a suggestive wink.");
	output("\n\nYou give her a grin and tell her you’ll definitely be back.");
	processTime(23);
	pc.milkInMouth(getAsenniaPregContainer());
	pc.changeLust(11);
	pc.changeEnergy(200);
	output(pc.modThickness(2));
	output(pc.modTone(-1));
	pc.credits -= 50;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Drink Honey (Afternoon / Smaller Boobs vers.) (PC has Cock)
//Get a drink straight from the tap! Given the way you and Asennia have gotten along, you might get a little more than that, too...
//-50 Credits; very small Thickness gain. +Major Exhibitionism
public function drinkHoneySmallerBoobsAfternoonWithADongle():void
{
	clearOutput();
	showAsennia();
	author("Savin");
	var x:int = pc.cockThatFits(500);
	if(x < 0) x = pc.smallestCockIndex();
	output("Asennia’s breasts aren’t what you could ever call small - she’s still rocking tits easily in the F or G-cup range, but they look much more natural on her plated, insectile frame. You can still see the faint glow of liquid nectar sloshing just under the skin, making her chest seem like the living larder that it is. Every breath makes her bare, ample chest quake enticingly. Your eyes fix on her jiggling titflesh, and you feel the hot tendrils of arousal start snaking through you. Your [pc.cock " + x + "] starts to stiffen just from watching her work, and you find yourself needing to feel those magnificent breasts in your hands - and her teat in your mouth.");

	output("\n\nThough her eyes may be black wells, you can <i>feel</i> Asennia’s gaze sizing up your manhood, ogling your crotch with unabashed lust. <i>“Come here, [pc.name],”</i> she purrs, outstretching a hand to you. As if entranced, you walk forward, taking her hand and slipping down to your [pc.knees] in front of the counter, putting your face on level with the honeypot’s chest. She leans over the counter, pressing her tits between the cold stone and her body, putting just enough pressure on them to make a bead of nectar bubble out from her dark nipples.");

	output("\n\n<i>“Let’s start out with a drink, and see where things go from there, hmm?”</i> she purrs, eyes still transfixed by your [pc.cock " + x + "]. You nod eagerly, reaching out to stroke the swollen titflesh on offer, lifting her breast up to your mouth. Asennia sighs, dark lips forming a tight grin as your hands dig into the honey-laden orbs. Your tongue reaches out, slowly caressing the dark, pebbly ring around Asennia’s nipple before tracing its way up to the little bead of honey waiting for you at her peak.");

	output("\n\nThe honeypot’s eyes flit closed, and her hands lace under her chin to support her head. Pleasured moans escape her painted lips as you start to suckle, drawing out a slow but steady trickle of her sweet nectar. Asennia’s breasts are well-trained for their job - even as drained as she is from a hard day’s work, her teat offers little resistance to your desire. It takes only the barest effort to get a nice flow started, and just the occassional squeeze or suckle to keep the honey coming.");

	output("\n\n<i>“Mmm, you have such a way with your mouth,”</i> Asennia moans. You can feel her chest rising and falling faster as you afflict the honeypot with pleasure, making her swollen mammaries quiver delightfully in your face. The honey ant is putty in your hands, all but melting into a lusty puddle of rut as you drink and grope and kiss your way around her tits. With no other customer currently on her, you quickly shift from one breast to the other, giving it an equal dose of pleasure as the first. From there, you make your way up her chest, letting your hands play across the tops of her breasts.");

	output("\n\nThat seems to snap your partner out of her lusty haze - just enough to compel her to reach down and take your hands in her upper pair, using the lower two to wrap around your shoulders. She pulls you up, putting that legendary myr strength to use in hauling you up and over the counter. Your eyes go wide when you’re pulled along with the ant-girl’s chest as she leans back in her seat, dragging you with her until your [pc.legs] are scrambling over the counter and ");
	if(!pc.isTaur()) output("into her lap.");
	else output("into a sitting position between her spread legs.");

	output("\n\n<i>“That’s better,”</i> Asennia purrs, two of her arms slipping down to hook around your [pc.butt]. A third arm starts to play with your [pc.gear], slowly pulling your equipment off and running her plated digits along the turgid length of your [pc.cock " + x + "]. A shiver runs through you as Asennia teases and toys with your prick: her plated fingers feel like a dominatrix’s lubed-up latex glove, gliding wetly across your shaft. It takes you a moment to realize she’s coated her fingers with her own honey, squeezed out from the other breast before being sloppily spread across your " + num2Text(Math.floor(pc.cocks[x].cLength())) + " inches of cockflesh.");

	output("\n\nThe more she gets to play with you, the more Asennia smiles and squirts into your hungry mouth. <i>“Of all the things you off-worlders have brought to our lonely little world,”</i> she purrs, <i>“A steady supply of these wonderful cocks is the most precious. So many shapes and sizes... and just so </i>many<i>. You don’t know how rare male myr are...”</i>");

	output("\n\nIf all the myr treat cock-wielding aliens like Asennia is handling you, it isn’t hard to imagine Myrellion becoming ");
	if(flags["LANDED_ON_TEXAS"] != undefined) output("as popular as New Texas some day");
	else output("the biggest sex tourism spot in the galaxy");
	output(". Hell, right off the elevator into town and you’re shown a shop full of topless women enticing you to suck the honey right out of them... and clearly preferring to stroke you off while you drink. You could definitely get used to this...");

	output("\n\nYour [pc.hips] start to move of their own accord, grinding against Asennia’s thighs as if searching for a wet hole to fuck. Your hands work to pull away the sheer silken garment around her waist, earning a moan from the lusty ant. Her hand works quicker over your shaft as you disrobe her, Asennia’s growing arousal clear to you in the hammering of her heart - the rapid rises and falls of her heavy chest. You thrust forward, seeking a cunt to fuck and finding none: her crotch is sexless, covered by a slender plate of chitin that mocks you like a chastity belt. Asennia gives you an apologetic smile, and one of her hands reaches back to her abdomen to run a few fingers through the lips of her sex.");

	output("\n\n<i>“Sorry, love. You can’t have both, I’m afraid.”</i>");

	output("\n\nYou’d curse, if your mouth wasn’t full of her sweet nectar. Instead, you buck your hips faster against the honeypot’s gripping fist, pounding your pecker into her latex-like grip as hard as you can. Asennia squeals delightedly, rocking back in her seat as you pound the closest thing to a pussy you can reach. You know you’re going to regret smearing your dick with her syrupy nectar later, but for now the warm, thick lubricant is absolutely heavenly.");

	output("\n\nYour honeypot lover takes your agressive need in stride, moaning and groping and even leaning in to kiss you between hip-deep thrusts. The harder you fuck her hand, the more she seems to enjoy herself: her honey seems sweeter as you suckle, and her voice is a constant symphony of sensual sounds that drive you on until you can feel the familiar feeling of rising climax.");

	output("\n\n<i>“Make a mess, love,”</i> Asennia murmurs into your [pc.ear], suddenly tightening her grip on your [pc.cock " + x + "]. Your eyes widen at the sudden mix of pleasure and pressure");
	if(pc.balls > 0) 
	{
		output(", and you feel your [pc.balls] lurch");
		if(pc.balls == 1) output("es");
		output(" and swell");
		if(pc.balls == 1) output("s");
		output(" with a thick load of [pc.cumNoun]");
	}
	output(". A few more thrusts and you feel the spunk rushing through [pc.eachCock] and spraying out across Asennia’s lap in an explosive rush of pleasure.");

	output("\n\nA feral grunt of pleasure escapes your [pc.lips] as your cock spurts ");
	if(pc.cumQ() < 10) output("a slender trail of semen across the honeypot’s thighs");
	else if(pc.cumQ() < 250) output("a thick load of steaming spunk across Asennia’s lap");
	else output("an overwhelming blast of spunk across Asennia’s lower body. The ant-girl makes a pleasured sound and rolls her head back, eyes closed contentedly. Her hand continues to work, though, ceaselessly pumping your shaft until you’ve spilled every last drop of seed.");

	output("\n\n<i>“I hope that was worth every credit,”</i> she chuckles as you stagger to your [pc.feet], realizing that you’re a mess of cum and nectar and sweat.");
	if(pc.exhibitionism() < 33) output(" The sudden realization that dozens of people just watched you bathe Asennia in cum makes your cheeks burn with embarrassment.");
	else
	{
		output(" You take a look over your shoulder at the crowd of people who watched you unload all over Asennia, and you can’t help but feel a hint of arousal creeping into you once again.");
	}
	output("\n\n<i>“There’s a shower in back,”</i> the honeypot offers, handing you your gear as soon as you’ve swiped your credits through her terminal. You give her a smile and slip into her shop to clean yourself off. A few minutes, and a hot shower, later, you head back onto the street with your gear back on - though you couldn’t quite get the smell of cum and nectar off you...");
	processTime(18);
	pc.milkInMouth(getAsenniaPregContainer());
	pc.orgasm();
	pc.shower();
	pc.changeEnergy(100);
	pc.exhibitionism(2);
	output(pc.modThickness(2));
	output(pc.modTone(-1));
	pc.credits -= 50;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function afterNoonMyrSnackRouter():void
{
	if(pc.hasCock()) drinkHoneySmallerBoobsAfternoonWithADongle();
	else drinkHoneyAfternoonWithNoBoner();
}

//Drink Honey (Afternoon / Smaller Boobs vers.) (PC has no Cock)
//Get a drink straight from the tap!
//-50 Credits; very small Thickness gain.
public function drinkHoneyAfternoonWithNoBoner():void
{
	clearOutput();
	showAsennia();
	author("Savin");
	output("Asennia’s breasts aren’t what you could ever call small - she’s still rocking tits easily in the F or G-cup range, but they look much more natural on her plated, insectile frame. You can still see the faint glow of liquid nectar sloshing just under the skin, making her chest seem like the living larder that it is. Every breath makes her bare, ample chest quake enticingly. Your eyes fix on her jiggling titflesh, and you feel the hot tendrils of arousal start snaking through you.");
	output("\n\nChewing on your [pc.lip], you start to sidle forward, feeling drawn into the gravity of Asennia’s full breasts. She smiles warmly as you approach, patting the tops of her breasts and leaning back from the stall. Her mein is inviting, urging you to come crawl into her lap and suck her dry. You do so eagerly, quickly swiping your Codex across her pay station and hopping onto the counter in Asennia’s wake.");
	output("\n\n<i>“I hope you came thirsty, love,”</i> she purrs, using two arms to heft up her breasts for you and the others to draw you in, wrapping around your [pc.hips].");
	output("\n\nYou lick your lips and run your hands across the smooth curves of Asennia’s sweet tits. The smell of honey hits you instantly, a sweet and intoxicating aroma billowing out from half a dozen pairs of leaking tits and the mouths greedily sucking from them. You can’t wait to get in on that action...");
	output("\n\nNeither can Asennia, by the way her arms pull you close and all but press your head into the front of her breast. Your mouth opens on instinct, lips latching onto the pebbly ring around her dark teat. Your hands rub along her taut flesh, gently applying pressure until you feel a trickle of honey start to tease your [pc.tongue]. After that, you start to suck until Asennia’s tits go from leaking to pouring out her bounty as quick as you can gulp it down.");
	output("\n\nWhile you greedily nurse from the hostess’s ample chest, her attention momentarily turns from you to a customer standing behind you. She giggles at something being said, and you feel a hand on your [pc.butt], gently pushing you aside. You scoot out of the way, making room at Asennia’s other breast for her new customer: ");
	var helper:int = 0;
	if(shadeAtTheBar()) helper = rand(5);
	else helper = rand(4);
	if(helper == 0) output("a familiar red-headed spacer babe, wearing a skin-tight suit that instantly draws your eyes to her own perky curves and the flares of her hips. She gives you a wink, and you feel her hand linger on your upraised ass for a moment before she reaches up to grope the honeypot and start to suckle.");
	else if(helper == 1) output("a leithan man clad in a business suit that extends across his centaur-like body. He gives you an apologetic smile before trotting up to Asennia and taking hold of an offered breast and bringing it to his mouth.");
	else if(helper == 2) output("a darkly-furred kui-tan woman, looking like she just got off a shift with Ambassador Juro’s group. Your eyes notice a distinct tent in her formal skirt as she climbs in beside you and starts to tease her tiny muzzle around Asennia’s tit.");
	else if(helper == 3) 
	{
		output("a gold myr trooper, the front of her uniform unbuttoned to reveal a tanktop underneath - and a lot of cleavage. She gives you a bright smile, squeezing your butt before slipping in beside you and taking Asennia’s boob in three hands. The fourth quickly finds its way to her abdomen, and the rosy slit tucked in its back. Absolutely shameless...");
		if(pc.isBro() || pc.isBimbo()) output(" You love it!");
	}
	//if Shade on planet & friendly:
	else 
	{
		output("Shade! You give your friend a grin and a thumb’s up as she takes a knee beside you, her hand still firmly planted on your ass. <i>“Hey, junior,”</i> she chuckles, rubbing her hand around as the other hefts up Asennia’s tit. <i>“Don’t tell me I’m going to have to find some milk mods to keep your attention...”</i>");
		output("\n\nYou share a chuckle as Shade slips in beside you and wraps her lips around Asennia’s teat, joining you in your feast.");
	}
	output("\n\nYour attentions wander back to the buxom honeypot in front of you, and the mouthfuls of sweet nectar you’re swallowing down. With two mouths and ");
	if(helper == 3) output("four");
	else output("five");
	output(" arms caressing her, Asennia is quickly moaning and squirming in your grasp. Those full breasts of hers quake like gelatin as their owner writhes in pleasure, bouncing gleefully behind a nipple held firm between your lips.");

	output("\n\n<i>“Just like that,”</i> the honeypot murmurs, running a plated hand ");
	if(pc.hasHair()) output("through your [pc.hair]");
	else output("over your [pc.hair]");
	output(". You grin up at her, enjoying the lewd look on her face. The honeypot looks so close to orgasm, her chest heaving in the most awe-inspiring ways... you feel compelled to keep drinking, working the honeypot’s tits even after you’ve had your fill. You’ve gotten Asennia to boobgasm before, and for a treat like she’s given you, you might as well return the favor...");

	output("\n\nYour [pc.tongue] goes to work on the dark, wet mountain of her teat. Like a nursing babe, you paw and hug at her tit while sucking deeply. Your lips make a thunderous smacking sound as you pop off her, running your tongue up along her chest and trailing kisses as you go. Your partner seems to see what you’re about, and soon both of her breasts are being lavished with affection until she’s crying out and honey is squirting like a geyser from her breasts. Her whole body quakes with pleasure, and you’re sure you and ");
	if(helper == 0) output("the spacer babe");
	else if(helper == 1) output("the leithan");
	else if(helper == 2) output("the kui-tan");
	else if(helper == 3) output("the gold trooper");
	else output("Shade");
	output(" are giving her a hell of a ride.");

	output("\n\nYou hear cheering behind you as Asennia’s orgasm passes, and a quick look over your shoulder shows you every eye in the garden seems to be on the three of you. ");
	if(pc.exhibitionism() < 33) output("You blush, suddenly realizing how many people have been watching you.");
	else output("You hold up a triumphant fist to the crowd, and are instantly hailed with applause and lusty cheers!");
	output(" Asennia slumps back in her stool, panting heavily as you hop back onto the street and get ready to go.");

	pc.changeEnergy(100);
	pc.changeLust(15);
	processTime(19);
	pc.milkInMouth(getAsenniaPregContainer());
	clearMenu();
	pc.credits -= 50;
	output(pc.modThickness(2));
	output(pc.modTone(-1));
	addButton(0,"Next",mainGameMenu);
}
