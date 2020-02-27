import classes.Items.Transformatives.PupperPoppers;
//Gil
//By: Lashcharge

//A cuntboy doberman-morph that wants to get the worg traits from the promotional red snausages. Pays 1000 or gives a blowjob for each Pupper Popper you bring him, up to nine at which point you can fuck him.

//Background
//Gil was born from self impregnation to an absurdly rich maleherm rockstar/music company CEO(race undecided). He is the 2nd out of 3 children born this way and has lots of half siblings. When he was young he was frequently bullied by his peers for being a “clone” and a cuntboy, especially from one particular nasty bully who harassed him through his school years.

//He never had any advanced education apart from high school and his parent guaranteed all of his children a substantial allowance, so that money would not be a problem in their lives. Instead, he encouraged his children to pursue art with a fierce passion. Gil lacked skill in any artistic field, but still felt the familial pressure to conform with the family artistic endeavours. So, he chose to pursue gene modding, following an artistic genemod trend where everyone wanted to create their personal perfect idealized form. Currently he is a doberman-morph, but he sees it as a step necessary to reach his ideal form.

//He is a character that is trying to be stoic, but his low confidence often leaves him easily embarrassed. He is extremely experienced at giving blowjobs, but has so far managed to maintain his virginity, saving it for someone he feels is worthy of it. The reason he offers the player more than blowjobs is because they both share exceedingly rich parents and the PC is the infamous child of Steele. He intentionally hides his last name because he doesn’t want to be seen as the child of a rich parent.

public function showGil(nude:Boolean = false):void
{
	var nudeS:String = "";
	if(nude) nudeS = "_NUDE";
	var earS:String = (!gilCanineEars() ? "_WORGEARS":"");
	showBust("GIL" + earS + nudeS);
	showName("\nGIL");
}

//Triggers if the PC leaves Jade’s shop with a Pupper Popper in their inventory.
public function gilPupperProccer():Boolean
{
	if(pc.hasItemByClass(PupperPoppers) && flags["MET_GIL"] == undefined)
	{
		showGil();
		author("Lashcharge");
		output("\n\nAlmost immediately after you leave Jade’s shop, you notice a tall, male-looking figure following you. He is slowly getting closer to you, trying his best to stay unnoticed despite his height, his obvious inexperience, and his outfit: a face-hiding hoodie certainly not helping him look any less conspicuous.");
		output("\n\nIt seems like he wants something, but doesn’t have the guts to address you. Not wanting to let this farce get drawn out any longer, you suddenly turn around to confront your stalker.");

		//pc is ditz:
		if(pc.isBimbo()) output("\n\n<i>“Do you want your cock sucked, or something?”</i> you ask, expecting, and hoping, that his reasons for following you are purely lustful.");
		//pc is brute:
		else if(pc.isBro()) output("\n\n<i>“Are you looking to get pounded, bro? You get to chose between the ground and the sheets,”</i> you growl.");
		//pc is nice:
		else if(pc.isNice()) output("\n\n<i>“Excuse me, can I help you?”</i>");
		//pc is mischievous:
		else if(pc.isMischievous()) output("\n\n<i>“Is this how the hip kids nowadays hit on people they fancy? By creeping up on them?”</i> you ask with a tone of mock curiosity.");
		//pc is hard:
		else output("\n\n<i>“Why’re you following me?”</i> you ask, with the hint of threat in your voice.");

		output("\n\nHis head lifts for the first time, revealing an elongated canine muzzle. The top is covered in black fur, while the lower section is covered in light brown, similar to a Doberman. He looks straight into your [pc.eyeColor] eyes with his own minty green pair and blinks a few times, dazed by your sudden question.");
		if(pc.isBro() || pc.isBimbo()) output(" He hesitates for a moment, blushing at your suggestion, before shaking away the obvious lewd thoughts. <i>“No. ");
		else if(pc.isNice()) output(" <i>“Yes. ");
		else output(" <i>“I-");
		output("I couldn’t help but notice that y’bought some pupper poppers,”</i> he says with a hesitant tone in his voice.");

		output("\n\n<i>“Yes, I did.”</i> You show him a red snausage to confirm his suspicions, which calms him a bit.");
		output("\n\n<i>“Gil.”</i> He steels his nerves and extends his hand for a handshake.");
		output("\n\n<i>“[pc.name] Steele,”</i> ");
		if(pc.isNice()) output("you say and shake his hand.");
		else if(pc.isMischievous()) 
		{
			output("you say and extend your hand, only to quickly move it out of the way as soon as he tries to shake it.");
			if(silly) output(" Psyche!");
		}
		else if(pc.isBro() || pc.isAss()) output(" you say, ignoring his extended arm, until he puts both of his hands back in his pockets out of embarrassment.");
		output(" It takes some time for your new acquaintance to realize the implications of your name, but when he does his breath catches for a few moments.");
		output("\n\nEventually he regains his composure and tries his best to play it cool. <i>“The thing is, I’m rather desperate for a very specific set of transformations that can only be found in those,”</i> he says, pointing at the product in your hands, <i>“and buying them from other people is the cheapest way to get them.”</i>");
		output("\n\n<i>“Why don’t you just buy it yourself?”</i>");
		output("\n\n<i>“Transformations that should be part of the original product and instead are being sold separately at thrice the price? Fuck that! Besides, I’m not giving Jade any more of my money.”</i> He sounds more than a little bit exasperated, but he takes in a good breath and continues. <i>“I’ll pay 500 credits for each one until I get the transformations I want.”</i> Then he mumbles something you don’t quite get as his face turns away.");
		output("\n\n<i>“What was that?”</i>");
		output("\n\n<i>“I’ll also offer other forms of ‘payment’ if that’s what y’want.”</i> You can see that he is clearly embarrassed at the proposal and, if not for the black fur, you’re certain you would see his cheeks turning beet red.");
		output("\n\n<i>“What ‘forms’ of payment?”</i> you ask him, more firmly this time.");
		output("\n\nHe glances around, before getting close and whispering into your ear. <i>“I’ll suck your ");
		if(silly) output("sausage");
		else output("cock");
		output(" for a snausage. If y’have one.”</i> He pulls back and thinks for a moment, before leaning in again, <i>“And... if I get what I want, I’ll blow you and let you fuck me anytime.”</i>");

		processTime(5);
		flags["MET_GIL"] = 1;
		clearMenu();
		addButton(0,"Yes",giveDoggoADoggoTreat,undefined,"Yes","Sell him the promotional red snausage."); //goes directly to Trade.
		addButton(1,"No",keepYerSnausage,undefined,"No","You’d rather keep them.");
		return true;
	}
	return false;
}

public function keepYerSnausage():void
{
	clearOutput();
	showGil();
	author("Lashcharge");
	output("<i>“No, I’d rather keep these,”</i> you say holding on the transformative treat close to your chest.");
	output("\n\nHe lowers his head again. <i>“Your loss,”</i> he says with a hint of disappointment in his voice. <i>“If you ever change your mind, I’ll be around.”</i>");
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Southwest corner of the Merchant Deck
//Found leaning on southwest corner of the merchant deck.
public function repeatGilBonus():void
{
	if(flags["MET_GIL"] != undefined)
	{
		output("\n\nYou find Gil leaning against the corner of the main corridor, his head slumped low and his arms hidden in the front pockets of his hoodie. He tries his best to stay unnoticed, while subtly looking around with suspicion.");
		addButton(0,"Gil",repeatGilApproach,undefined,"Gil","Approach the dog-morph.");
	}
}

//Gil
public function repeatGilApproach():void
{
	clearOutput();
	showGil();
	author("Lashcharge");
	output("You approach the hooded dog-morph and lean on the wall next to him.");
	output("\n\nAfter a few moments of awkward silence, he says <i>“‘Sup.”</i>");

	//pc is nice:
	if(pc.isNice()) output("\n\n<i>“Hello, Gil.”</i>");
	else if(pc.isMischievous()) output("\n\n<i>“Wassup?”</i>");
	//pc is hard:
	else output("\n\nYou simply stand there silently, not bothering to give him any answer. He knows why you’re here.");

	output("\n\n");
	if(flags["GIL_DOSES"] != undefined && flags["GIL_DOSES"] >= 9) output("<i>“Are y’here to collect?”</i> he asks with a lascivious smirk.");
	else output("<i>“Do y’have any more pupper poppers I can buy?”</i>");

	processTime(2);
	gilMenu();
	//[Appearance] “Take a gander at the dog boy.”
	//[Trade] “Trade him some of those snausages.” // Greyed out if the player doesn’t have a Pupper Popper. Replaced with Sell after you give him 9 Pupper Poppers.
	//[Sell] “Sell him some Pupper Poppers.” // Only appears after Trade has been accessed 9 times.
	//[Talk] “Chat with him.” // “Gil might be more inclined to chat after his transformative problems are over.” // Greyed out before Trade has been accessed 9 times.
	//[Sex] “Tell him that you would like to collect his reward.” // “You’ll need to deal with his transformative problems before you can have sex with him for free.” // Greyed out before Trade has been accessed 9 times.
}

public function gilMenu():void
{
	clearMenu();
	addButton(0,"Appearance",gilAppearance,undefined,"Appearance","Take a gander at the dog boy.");
	if(flags["GIL_DOSES"] == undefined || flags["GIL_DOSES"] < 9) 
	{
		if(pc.hasItemByClass(PupperPoppers)) addButton(1,"Trade",giveDoggoADoggoTreat,undefined,"Trade","Give Gil one of the Pupper Poppers he wants.");
		else addDisabledButton(1,"Trade","Trade","You need a Pupper Popper to trade it to him.");
		addDisabledButton(2,"Talk","Talk","Gil might be more inclined to chat after his transformative problems are over.");
		addDisabledButton(3,"Sex","Sex","You’ll need to deal with his transformative problems before you can have sex with him for free.");
	}
	else
	{
		if(pc.hasItemByClass(PupperPoppers)) addButton(1,"Sell",getCashForDoggo,true,"Sell","Sell him some pupper poppers.");
		else addDisabledButton(1,"Sell","Sell","You don’t have any Pupper Poppers to sell.");
		addButton(2,"Talk",talkToGilDoggo,undefined,"Talk","Chat with him.");
		if(pc.lust() >= 33) addButton(3,"Sex",sexWithGilYaDumbshit,undefined,"Sex","Tell him that you would like to collect his reward.");
		else addDisabledButton(3,"Sex","Sex","You aren’t aroused enough for sex.");
	}
	addButton(14,"Leave",mainGameMenu);
}

//Appearance
//consider transformations worg face and eyes, floppy and pointy ears.
//he looks like a doberman-morph.
public function gilAppearance():void
{
	clearOutput();
	showGil();
	author("Lashcharge");
	output("Gil is a 6 feet and 3 inches tall dog-morph that’s currently trying his best to stay inconspicuous. He wears a dark blue hoodie, a pair of ragged jeans that clings to his body tightly, and no shoes, walking on a pair of canine paws. The hoodie has “Lance and the Inseminators” written on the front, with the “Lance” part resembling throbbing, veiny flesh, while the rest looks like it’s written in spunk. The pulled up hood hides his ");
	//Gil has canine ears:
	if(gilCanineEars()) output("perked-up");
	//Floppydog
	else output("floppy");
	output(" ears and ");
	//Gil doesn’t have worg eyes:
	if(gilWorgEyes()) output("casts a shadow over his minty green eyes, but fails to hide his");
	else output(", but can’t hide the glow of his minty green eyes or his");
	//Gil has worg face:
	if(gilWorgFace()) output(" powerful worg snout with teeth poking out from between his lips.");
	else output(" elongated Doberman snout.");
	//upper body revealed:
	if(flags["GIL_UPPER_BODY_REVEAL"] != undefined) output("\n\nHis frame is exceedingly thin, without an ounce of fat or muscle visible on his belly and chest. This is especially noticeable in his hips and waist, which are as thin as they can possibly be, making his shoulders look broad in comparison and giving him a distinctly masculine frame. Most of his body is covered in black fur, with the exception of a large patch of light brown that extends from his chin down to his inner thighs, with his forearms also covered in fur of the same shade of brown. His thin chest sports a pair of midnight black nipples, barely visible beneath the dark fur around them.");
	else output("\n\nHis frame is exceedingly thin, and even though his baggy clothes obscures his waist, it shows. Both his hips and his shoulders are just the right size to give him a distinctly masculine shape.");
	//lower body revealed:
	if(flags["GIL_LOWER_BODY_REVEAL"] != undefined) output(" You know that despite his masculine looks there isn’t any male genitalia on his crotch. Instead, he has the musky cunt of a bitch. It’s constantly dripping with his fluids, and it’s got thick, noticeable lips that swell when he’s aroused. A tight black asshole hides between his prodigious fuzzy asscheecks, and above them a black and brown furry tail wags lazily, much longer than what the tail of a Doberman should be.");
	else output(" Behind him you can see a black and brown furry tail wagging between his prodigious glutes, their size pronounced by the skin tight jeans.");
	clearMenu();
	addButton(0,"Next",backToGilMenu);
}

public function gilCanineEars():Boolean
{
	return (flags["GIL_DOSES"] == undefined || flags["GIL_DOSES"] == 2 || flags["GIL_DOSES"] == 5);
}
public function gilWorgFace():Boolean
{
	return (flags["GIL_DOSES"] == 4 || (flags["GIL_DOSES"] != undefined && flags["GIL_DOSES"] >= 8));
}
public function gilWorgEyes():Boolean
{
	return (flags["GIL_DOSES"] != undefined && flags["GIL_DOSES"] >= 9);
}

//Trade
public function giveDoggoADoggoTreat():void
{
	clearOutput();
	author("Lashcharge");
	pc.destroyItemByClass(PupperPoppers);
	//1st snausage tf:
	if(flags["GIL_DOSES"] == undefined)
	{
		//ears turn doggie
		output("<i>“Here, you can have it,”</i> you say handing Gil the Pupper Popper.");
		output("\n\nHe carefully removes the wrapping, saving it in his pocket, and eats the bite-sized snack, taking a few moments to chew on it. After swallowing it the dog boy licks his chops and comments: <i>“These things are damn delicious.”</i>");
		output("\n\n<i>“So, about that payment?”</i>");
		output("\n\n<i>“Hold up, I’ll pay in a bit, I just wanna see what transformation I get first..”</i>");
		output("\n\nYou patiently wait for ten minutes, leaning on the wall next to the dog-morph, but you don’t notice anything different about him.");
		output("\n\n<i>“Are you sure you haven’t changed yet?”</i> you ask, finally overcome with boredom.");
		output("\n\n<i>“I don’t feel different,”</i> Gil says, shrugging off your question. After a few more minutes he brings his hand to his chin in a pensive manner. <i>“Unless...”</i> He takes off his hood and reveals his moist nose and the rest of his elongated snout, sleek and with short black fur smudged in brown on his neck and jaw, similar to a Doberman. The dog-morph’s mint green eyes are canine, large irises with barely any sclera. Suddenly, he looks straight at you and asks, <i>“What are my ears like right now?”</i>");
		output("\n\nThey are perfectly dog-like and kind of floppy. You tell Gil as much.");
		output("\n\n<i>“Damn it. I should’ve known. My ears were pointy before I ate that popper,”</i> he says rubbing the back of his neck in embarrassment.");
		output("\n\n<i>“Next time, take off the damn hood,”</i> you tell him, frustrated by the time wasted.");
		output("\n\n<i>“Don’t worry. I will, if y’bring me another.”</i> For a few seconds there is an awkward silence between you two, then Gil asks, <i>“So what do y’want in exchange for it?”</i>");
	}
	//2nd snausage tf:
	//ears turn canine
	else if(flags["GIL_DOSES"] == 1)
	{
		output("As you hand Gil the Pupper Popper he quickly unwraps it, storing the plastic in his pocket. He pulls down his hood and puts the snack in his muzzle, taking his time to carefully chew it. From the look on the dog-morph’s face it looks like he’s definitely enjoying it.");
		output("\n\nAfter a few minutes you notice his ears rising up, becoming pointy again. You take out your Codex and show him new look.");
		output("\n\nGil grabs the tip of his ear and rubs it. <i>“This seem pointless... but, I always pay my dues. What do y’want in exchange for that?”</i>");
	}
	//3rd snausage tf:
	//ears turn doggie
	else if(flags["GIL_DOSES"] == 2)
	{
		output("You hand him the Pupper Popper and Gil grabs it, unwraps it and chews on it for a while before swallowing it. He pulls his hood down, and you show him his face with the help of your codex’s camera, as you both wait for something to happen.");
		output("\n\nThe dog boy’s ears fall down and become floppy again. A twitch of fury tints the corner of his face and he shouts. <i>“Oh, c’mon! Are these things fucking with me?”</i> He takes in a few breaths before sighing and asking, <i>“What do y’want in exchange for that?”</i>");
	}
	//4th snausage tf:
	//face turns worg
	else if(flags["GIL_DOSES"] == 3)
	{
		output("Gil snatches the Pupper Popper out of your hand, unwraps it and chucks it into his mouth, biting and chewing into it angrily. After a few seconds, he bites his tongue and an audible wince escapes his mouth as he covers it with his hand.");
		output("\n\n<i>“Damn it!”</i> he shouts through his hand, visibly enraged.");
		output("\n\nYou try to calm down the riled morph, but no matter what you do, his face twists with anger and his snout continues to snarl.");
		output("\n\n<i>“Fuck off!”</i> He growls as his teeth grow sharper and longer than before, already poking out from his lips. You can see sinew growing on the dog-morph’s neck and jaw as they become larger alongside his skull. You back off as he starts to biting at the air as if it were a foe, his jaw snapping shut with astounding strength.");
		if(silly) output(" Where is the roll of space paper when you need one?");
		output(" His nose also grows a little bit larger and more moist, the last of his canine features to become exaggerated, like a mythical wolf.");
		output("\n\n<i>“Fuck,”</i> he says half in pain, half in anger, <i>“show me what I look like.”</i>");
		output("\n\nYou take out your Codex and show it to him.");
		output("\n\nGil passes his hands through his new features before throwing a fist into the air triumphantly. <i>“This is exactly what I wanted!”</i>");
		output("\n\n<i>“So you don’t need any more snausages?”</i>");
		output("\n\n<i>“I still need the eyes to match, so I’ll definitely need more.”</i> He takes a few more moments to pass his hands over his new canine fangs, before pushing the Codex away and asking, <i>“What do y’want in exchange for that?”</i>");
	}
	//5 snausage tf:
	//ears turn canine
	else if(flags["GIL_DOSES"] == 4)
	{
		output("You hand Gil the Pupper Popper, and he unwraps the bite-sized snack and wolfs it down. He mutters a quiet <i>“delicious”</i> as he swallows the snausage and pulls down his hood, waiting for something to happen.");
		output("\n\nHe sighs as he notices his ears perking-up and becoming more wolfish. <i>“Y’win some, y’lose some.”</i> He shrugs. <i>“What do y’want in exchange for that?”</i>");
	}
	//6 snausage tf:
	//multitail tf - face turns canine
	else if(flags["GIL_DOSES"] == 5)
	{
		output("Gil quickly swipes the Pupper Popper from your hands and unwraps it. He takes his time eating it, before pulling down his hood and looking at his reflection in the Codex.");
		output("\n\nSurprisingly, the dog-morph’s face doesn’t seem to change, but his tail suddenly falls limp on his noticeable rear. He yowls, winces and bites his lips, doing his best to contain the pain as the tail splits into two. Both of the appendages are thin and gangly, with missing spots of fur, but soon enough fresh new flesh and hairs cover them until Gil is left with a more healthy-looking pair of tails.");
		output("\n\n<i>“Oh cool, I got two tails.”</i> He looks at it, pondering for a moment. <i>“But, I’d rather have one.”</i> The dog boy fetches a black snausage from his pockets, unwraps it, and shoves it down his muzzle, causing one of the tails to recede into his body effortlessly.");
		output("\n\nBut that’s not the only thing that changes. The features of his face become smaller. The fangs disappear behind his lips, turning his powerful canine snout into the lean one of a Doberman. <i>“Oh, fuck no!”</i> He grabs his face, as if in a futile attempt to hold it in place and stop the transformation, but the change finishes quickly.");
		output("\n\n<i>“I totally forgot these custom transformatives do this.”</i> He sighs, slightly punching his forehead. Gil takes a few deep breaths, trying to calm his anger at yet another setback, before asking, <i>“What do y’want in exchange for that?”</i>");
	}
	//7 snausage tf:
	//ears turn doggie
	else if(flags["GIL_DOSES"] == 6)
	{
		output("You drop the Pupper Popper in Gil’s outstretched hand, and he is quick at unwrapping it and shoving it down his gobbler. He takes a long while to chew it down to bits and swallow it. Impatient, you take off his hood and show him his visage in your Codex.");
		output("\n\nThe dog-morph sighs yet again as his ears flop down and become more roundish. You both stand in silence for a few minutes, before he finally speaks.");
		output("\n\n<i>“I would’ve given up a long time ago if these treats weren’t so delicious. Anyway, what do y’want in exchange for that?”</i>");
	}
	//8 snausage tf:
	//face turns worg
	else if(flags["GIL_DOSES"] == 7)
	{
		output("You throw the package at Gil’s chest and he tries his best to catch as it jumps between his hand until it slips and falls on the floor.");
		output("\n\n<i>“I’m getting pretty tired of this.”</i>");
		output("\n\n<i>“Me too,”</i> Gil says as he unwraps the package and swallows it down.");
		output("\n\nYou show the dog-morph his face on your Codex as it turns into a snarl and begins to change. His skull grows wider, his nose larger, and the muscles of his neck and jaw swell to become more powerful. His canines lengthen until they poke out from his lips, and the process is complete. Like the last time he underwent this transformation, he seems unreasonably angry, shouting swear words at a random passerby.");
		output("\n\nEventually, he calms down and regains his composure. <i>“Well at least I’ve bounced back from that stupid accident. What do y’want in exchange for that?”</i>");
	}
	//9 snausage tf:
	else
	{
		//eyes turn worg
		output("<i>“I hope this is the last one.”</i> You tell Gil as you hand him yet another Pupper Popper.");
		output("\n\n<i>“Unlikely. I’ll probably get a few more ear transformations,”</i> he says, the frustration clear in his voice as he unwraps the snausage.");
		output("\n\nYou groan in response as the dog-morph shoves the treats into his mouth.");
		output("\n\n<i>“Mah sentiphments exachtly,”</i> he mutters through a mouthful of snausage. He then swallows it down and waits for a change while staring at his reflection in your Codex.");
		output("\n\nHis face twists into an angry snarl as he closes his eyes and rubs them with his hand. When he opens them again they glow with a soft minty-green light, lacking any form of pupils or iris.");
		output("\n\n<i>“Is this it?”</i> You ask.");
		output("\n\nThe dog boy nods for a while, and then turns around and plants a sudden and energetic kiss on your [pc.lipsChaste]. Before you can react he’s already parted from your lips and, giddy with joy, says, <i>“Fuck yeah it is. I wanted these glowing eyes from this transformative.”</i>");
		//pc is brute:
		if(pc.isBro()) 
		{
			output("\n\n<i>“Awesome! Now I’m gonna pound your ass so hard, you won’t be able to walk for weeks,”</i> you grunt with a confident grin as you reach behind him and grab his prodigious glutes.");
			output("\n\n<i>“Who said you could fuck my ass?”</i> Gil asks as calmly as he can while shooing away your daring hand.");
			output("\n\n<i>“But...”</i> you grumble. He silences your complaint by putting his finger in front of your mouth with a quick <i>shh</i>.");
			output("\n\n<i>“If y’want to find out what I meant you’ll just have to fuck me. You can still take the money or a blowjob if y’want.”</i>");
		}
		//else:
		else
		{
			output("\n\n<i>“Does that mean I can fuck you now?”</i>");
			output("\n\n<i>“Yes, if that’s what y’want. So... what </i>do<i> you want?”</i>");
		}
	}
	processTime(4);
	IncrementFlag("GIL_DOSES");
	showGil();
	clearMenu();
	//[Credits] “Ask him to pay in cash.” //Leads to Sell section.
	addButton(0,"Credits",getCashForDoggo,undefined,"Credits","Ask him to pay in cash.");
	//[Sex] “Ask him to pay with sex.” //Leads to the Sex section.
	if(pc.lust() >= 33) addButton(1,"Sex",sexWithGilYaDumbshit,true,"Sex","Ask him to pay with sex.");
	else addDisabledButton(1,"Sex","Sex","You aren’t aroused enough for that...");
	//[Gift] “Tell him it’s a gift.”
	addButton(2,"Gift",gilGiftGift,undefined,"Gift","Tell him it’s a gift.");
}

//Gift
public function gilGiftGift():void
{
	clearOutput();
	showGil();
	author("Lashcharge");
	output("<i>“How about you just keep the money?”</i>");
	output("\n\n<i>“Wha...what?”</i>");
	output("\n\n<i>“It’s a gift!”</i>");
	output("\n\nHe averts his eyes and looks straight down. After a few seconds he answers with a flustered, <i>“Thanks.”</i>");
	//[Next] // Back to Gil menu.
	clearMenu();
	addButton(0,"Next",backToGilMenu);
}

//Sell
public function getCashForDoggo(direct:Boolean = false):void
{
	clearOutput();
	showGil();
	author("Lashcharge");
	//Since he’s no longer dosing, we gotta increment & item purge! manually~
	if(direct) 
	{
		IncrementFlag("GIL_DOSES");
		if(flags["GIL_BONUS_TALK"] != undefined) pc.destroyItemByClass(PupperPoppers);
	}
	//If first time selling it after getting worg eyes:
	if(flags["GIL_DOSES"] > 9 && flags["GIL_BONUS_TALK"] == undefined)
	{
		output("<i>“Are you still interested in buying these Pupper Poppers?”</i> You say, as you show him the promotional treat.");
		output("\n\nHe looks at it and ponders for a few moments before taking it off your hands. <i>“Sure! I should probably get a few extras and they have a pretty good resell value. Through I’ll only pay 500 credits for each of them.”</i>\n\n");
		flags["GIL_BONUS_TALK"] = 1;
		//[Sell] //Continue the next line
		//[Don’t Sell]
		clearMenu();
		//[Credits] “Ask him to pay in cash.” //Leads to Sell section.
		addButton(0,"Sell",getCashForDoggo,true,"Sell","Go ahead and sell.");
		//[Sex] “Ask him to pay with sex.” //Leads to the Sex section.
		if(pc.lust() >= 33) addButton(1,"Sex",sexWithGilYaDumbshit,true,"Sex","Ask him to pay with sex.");
		else addDisabledButton(1,"Sex","Sex","You aren’t aroused enough for that...");
		//[Gift] “Tell him it’s a gift.”
		addButton(2,"Gift",gilGiftGift,undefined,"Gift","Tell him it’s a gift.");
		return;
	}
	output("<i>“Here are the 500 credits, as promised.”</i> He says handing you a credit chit.");
	pc.credits += 500;
	processTime(1);
	clearMenu();
	addButton(0,"Next",backToGilMenu);
}

public function backToGilMenu():void
{
	clearOutput();
	showGil();
	output("Is there anything else you’d like from Gil?");
	gilMenu();
}

//Talk
//Only one chat option is really available, the rest gets a remark not to pry further.
public function talkToGilDoggo():void
{
	clearOutput();
	showGil();
	author("Lashcharge");
	output("<i>“We can talk, but y’won’t get much out of me. I have no reason to trust you, yet.”</i>");
	processTime(1);
	clearMenu();
	//[Snausages]
	addButton(0,"P.Poppers",talkToGilAboutSnausages);
	//[Himself]
	addButton(1,"Himself",talkToGilAboutHimself);
}

//Snausages
public function talkToGilAboutSnausages():void
{
	clearOutput();
	showGil();
	author("Lashcharge");
	output("<i>“Why did you want these Pupper Poppers so much? You could probably find a genemod that does the same thing or even order a custom-made one, with all the credits you’re willing to pay for them.”</i>");
	output("\n\n<i>“Do y’know about the Corponarrativists?”</i>");
	output("\n\n<i>“No.”</i>");
	output("\n\n<i>“So, there is this art movement that’s all about <i>perfecting</i> one’s body through genemods. Y’look for the products, sample them and find if it fits with what y’want your perfect body to be. But it’s not just about how you look, it’s also about building a story you can tell about each part of your body, y’know. So these things...”</i> he says, taking out one of the wrappers from his pockets, <i>“are vintage, with lots of history behind them. Originally, I was just going to buy them, but that panda fatso is the only one selling such mods around here, and I want nothing to do with her. So I tried haggling with random passersby that bought them.”</i>");
	output("\n\nGil pauses for a moment and winces, seemingly remembering something bad. <i>“That didn’t go well. That is until I met you. And, thanks to you...”</i> He points at his eyes and muzzle. <i>“I was successful. Now I can give my muzzle and my eyes a story about haggling and how I seduced Steele’s child.”</i>");
	output("\n\n<i>“That’s not how I remember it.”</i>");
	output("\n\n<i>“Every artist gives their stories a little bit of flourish.");
	if(silly) output(" Just look at any smut story, and how balls are filled with cum, when semen is mostly produced in the prostate.");
	output("”</i>");
	output("\n\n<i>“So are you done now?”</i>");
	output("\n\n<i>“Not by a long shot. There still a lot of stories to write in this body of mine. So I think I’ll stay here a while, getting my stuff in order, and then hit someplace else. I heard there’s this planet where everyone takes a controversial transformative. I think I’ll hit that place next.”</i>");
	processTime(6);
	clearMenu();
	addButton(0,"Next",backToGilMenu);
}

//Himself
public function talkToGilAboutHimself():void
{
	clearOutput();
	showGil();
	author("Lashcharge");
	output("<i>“So you don’t know who I am or who I am related to?”</i> He asks you, somewhat incredulous at your ignorance.");
	output("\n\nYou raise your eyebrow and answer with a simple, <i>“No.”</i>");
	output("\n\n<i>“That’s good.”</i> He smiles way more smugly than you would’ve liked.");
	output("\n\n<i>“Should I know?");
	if(silly) output(" Though it wouldn’t be a surprise, everyone I know seems to know each other.");
	output("”</i>");
	output("\n\nHe doesn’t answer. He just stands there, back against the wall, with that obnoxiously smug grin stamped on his face.");
	processTime(2);
	clearMenu();
	addButton(0,"Next",backToGilMenu);
}

//Sex
public function sexWithGilYaDumbshit(fromTrade:Boolean = false):void
{
	clearOutput();
	showGil();
	author("Lashcharge");
	//if hasn’t revealed upper body:
	if(flags["GIL_UPPER_BODY_REVEAL"] == undefined)
	{
		output("<i>“How about you give me that blowjob you promised?”</i> you ask.");
		output("\n\n<i>“Sure,”</i> Gil says, his face looking down as it turns into a sensual grin, <i>“Do y’have someplace where we can do it in private? I’m not about to give a blowjob in public and throw more bad rep at my dad.”</i>");
		output("\n\nYou raise an eyebrow at his mentioning of his father, but for now you decide not to pry any further. <i>“We can go to my ship. Follow me and we’ll do it there.”</i>");
	}
	//if has revealed upper body:
	else output("<i>“Follow me to my ship.”</i> You tell Gil, the implications obvious as he tries to hide a sensual grin.");

	output("\n\nYou both head for your ship. He shadows you, trying his best to stay inconspicuous.");

	moveTo("SHIP INTERIOR");

	output("\n\nOnce you are both inside your bedroom, he begins to undress, pulling up his dark blue hoodie and white undershirt showing off his thin chest covered in brown fur.");
	flags["GIL_UPPER_BODY_REVEAL"] = 1;

	//if has revealed lower body and gave 9 snausages/has worg eyes:
	if(flags["GIL_DOSES"] != undefined && flags["GIL_DOSES"] >= 9 && flags["GIL_LOWER_BODY_REVEAL"] != undefined) output("\n\nHe unfastens his belt and lets his pants fall to his feet, revealing his soppy cunt. Kicking his clothes away, he puts his hands on his waist and asks, <i>“So, are y’going to fuck me, or do you just want a blowjob?”</i>");
	//if hasn’t revealed lower body and gave 9 snausages/has worg eyes:
	else if(flags["GIL_DOSES"] != undefined && flags["GIL_DOSES"] >= 9 && flags["GIL_LOWER_BODY_REVEAL"] == undefined) 
	{
		output("\n\nHe starts to unfasten his belt, but stops midway. <i>“So, this might come as a surprise, but...”</i> It seems like he has something to say, but he is obviously hesitant about what he is about to reveal.");
		//pc is brute or bimbo:
		if(pc.isBro() || pc.isBimbo()) output("\n\n<i>“Why do you still have your pants on?”</i> you ask, exasperated at the delay.");
		//pc is nice:
		else if(pc.isNice()) output("\n\n<i>“Yes?”</i> you ask, trying to sound as comforting as possible.");
		//else:
		else output("\n\n<i>“What is it?”</i> you ask, your tone making your impatience clear.");

		output("\n\n<i>“I know most people expect...”</i> Gil’s voice trails off, turning to little more than a mumble. He looks down, unfastens his belt, and drops his pants and boxers. Instead of the knotty canine dick and pair of balls you expected to find, he has a just as canine pussy with swollen lips and dripping with fluids. At first he seems stiff embarrassed, with his legs semi-closed, but a moment passes and his whole stance changes, becoming more confident and proud, with his legs wide open.");
		output("\n\n<i>“I wasn’t expecting this,”</i> you say.");
		output("\n\n<i>“Well, not my problem,”</i> he says with no hint of his former hesitation in his voice, <i>“If you still want it you can fuck me or get a blowjob, if not you can just");
		flags["GIL_LOWER_BODY_REVEAL"] = 1;
		//if coming from trade:
		if(fromTrade) output(" take your money and");
		output(" tell me to go.”</i>");
	}
	//if hasn’t revealed lower body and doesn’t have worg eyes:
	else output("<i>“So, how about that blowjob?”</i> asks the dog-morph.");
	processTime(1);
	//[Blowjob] “Get a sloppy blowjob from him.” // Requires cock or hardlight.
	//[Doggystyle] “Fuck him doggystyle.” // Requires cock or hardlight. Greyed out if haven’t given him nine snausages yet.
	//[Get Off] “Tell him to {give you what he owes you and }get off your ship.”
	clearMenu();
	if(pc.hasCock() || pc.hasHardLightStrapOn()) addButton(0,"Blowjob",getASloppyGrillBLowjorb,fromTrade,"Blowjob","Get a sloppy blowjob from him.");
	else addDisabledButton(0,"Blowjob","Blowjob","You need a penis or hardlight dildo-equipped panties.");

	if(flags["GIL_DOSES"] >= 9 && flags["GIL_DOSES"] != undefined)
	{
		if((pc.hasCock() && pc.cockThatFits(1000) >= 0) || pc.hasHardLightStrapOn()) addButton(1,"Doggystyle",doggyStyleWithGil,undefined,"Doggystyle","Fuck him doggystyle.");
		else addDisabledButton(1,"Doggystyle","Doggystyle","You need a penis that will fit inside of him or hardlight equipped underwear in order to do this.");
	}
	else addDisabledButton(1,"Doggystyle","Doggystyle","Gil won’t do this until he’s satisfied with his transformation.");

	addButton(2,"Get Off",beATotalCuntToGil,fromTrade,"Get Off","Tell him to get off your ship.");
}

//Get off
public function beATotalCuntToGil(fromTrade:Boolean):void
{
	clearOutput();
	showGil();
	author("Lashcharge");

	//pc is hard:
	if(pc.isAss()) output("<i>“Get off.”</i>");
	//pc is mischievous:
	else if(pc.isMischievous()) output("<i>“Well then, scram, doggie.”</i>");
	//pc is nice:
	else output("<i>“I need you to leave.”</i>");

	output("\n\n<i>“What?”</i> Says the ");
	//lower body hasn’t been revealed yet:
	if(flags["GIL_LOWER_BODY_REVEAL"] == undefined) output("half-");
	output("nude dog-morph.");

	//pc is hard:
	if(pc.isAss()) output("\n\n<i>“Get off my ship!”</i> You raise your voice and point your finger towards the door.");
	//pc is mischievous:
	else if(pc.isMischievous()) 
	{
		//lower body has been revealed:
		if(flags["GIL_LOWER_BODY_REVEAL"] != undefined) output("\n\n<i>“You are a bad boy for pulling a fast one on me like that. So get out, or I’m getting the paper.”</i>");
		else output("\n\n<i>“Get out, or I’m getting the paper.”</i>");
	}
	//pc is nice:
	else output("\n\n<i>“I’m not feeling this anymore. Please leave.”</i> You plead and point your finger towards the door.");

	output("\n\nHe grabs his clothes and begins dressing as you kick him out of your room, managing to get his ");
	//if lower body has been revealed:
	if(flags["GIL_LOWER_BODY_REVEAL"] != undefined) output("tight ragged jeans");
	else output("dark blue hoodie");
	output(" back on before you show him the door.");

	output("\n\n");
	//if coming from Trade:
	if(fromTrade) 
	{
		output("<i>“Here’s the money,”</i> he says passing you a credit chit. ");
		pc.credits += 500;
	}
	output("<i>“If you need anything else y’know where to find me.”</i> He turns around and leaves your ship with a sad hum on his lips.");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Blowjob
//Get a sloppy blowjob.
public function getASloppyGrillBLowjorb(fromTrade:Boolean):void
{
	clearOutput();
	showGil();
	author("Lashcharge");

	var x:int = pc.biggestCockIndex();
	var dLength:Number = 8;
	if(pc.hasCock()) dLength = pc.cocks[x].cLength();
	var hardlighted:Boolean = (pc.hasHardLightStrapOn() && !pc.hasCock());
	var pheromones:Boolean = pc.hasPheromones();

	output("You ");
	if(!pc.isCrotchExposed()) output("take off your [pc.crotchCover] and ");
	output("pull him close to you, your nose buried in Gil’s furry ");
	if(pc.tallness >= 7*12) output("scalp");
	else if(pc.tallness >= 5*12) output("neck");
	else output("chest");
	output(", breathing in his manly canine musk. Wrapping your arms around his back, you rub your hands all over its fuzziness, enjoying the moment for a while, before leaning in close.");

	output("\n\n<i>“Blow me,”</i> you whisper into his ");
	//Gil has Canine ears:
	if(gilCanineEars()) output("pointy");
	else output("floppy");
	output(" canine ears");
	//pc is wearing lower garment and not hardlight:
	if(!pc.isCrotchExposed() && !hardlighted) output(" and then drop down your [pc.lowerGarment] to your ankles and kick it away.");
	else output(".");

	output("\n\nThe dog-morph immediately kneels before you");
	if(pc.isTaur()) output(" and then crawls under your tauric lower body");
	output(", wetting his lips in preparation for what he’s about to do to you.");

	//pc has hardlight cock:
	if(hardlighted)
	{
		output("\n\nGil takes a peek inside your [pc.lowerGarment] and finding no cock there he ");
		//First time hardlight:
		if(flags["GIL_HL"] == undefined)
		{
			output("shouts, <i>“How do you expect me to blow you if you don’t have a dick?”</i>");
			output("\n\nYou turn on the hardlight and he exclaims, <i>“Oh! Of course, these are things that exist.”</i>");
			flags["GIL_HL"] = 1;
		}
		else output("sighs, <i>“Still nothing nice in here.”</i>");

		output("\n\n<i>“When are y’going to grow a dick to fuck me?”</i> he asks as you turn on your hardlight.");
		
		output("\n\nHe starts by nudging his moist nose against your glowing shaft, taking the opportunity to get a few goods sniffs and enjoying the smell of your");
		if(pc.hasVagina()) output(" moist");
		output(" underwear. The dog boy wastes no time, opening his maw wide and gliding his tongue across your luminous surface, starting from the base and going all the way to the tip. When it’s completely glazed in doggie slobber, he gives one last lap across the bottom, before pulling back completely.");
	}
	//pc has genital slit:
	else if(pc.hasStatusEffect("Genital Slit"))
	{
		output("\n\nGil starts by nudging his moist nose against your [pc.base " + x + "], taking the opportunity to get a few good sniffs and enjoy ");
		//pc has pheromone cloud perk or pheromone sweat and is sweaty or mimbranes:
		if(pheromones) output("the smell of your potent pheromones");
		else if(pc.hasStatusEffect("Sweaty")) output("the smell of your sweat-covered body");
		else output(pc.mf("the smell of your masculine musk","your scent"));
		output(". He lets loose on your slit and slobbers all around it, using his doggy tongue to thoroughly polish its [pc.skinFurScalesColor] surface. Your erection");
		if(pc.totalCocks() == 1) output(" begins");
		else output("s begin");
		output(" to grow, ");
		if(pc.cockTotal() == 1) output("the tip poking out of its protective slit");
		else output("their tips poking out of their protective slits");
		output(". Only when he thinks your crotch is glazed enough with his slobber does he slip his tongue inside, working to coax the rest of your [pc.cock " + x + "] out. The more he licks, the larger your erection grows, and the more your [pc.cockColor " + x + "] dick is exposed to the open air. When your cock is as big as it’s gonna get, the dog-morph gives your sheath one final lick and begins to pull away. He drags his large, floppy tongue along the underside of your dick as he moves back, trailing from base to tip.");
	}
	//pc has sheath:
	else if(pc.hasSheath(x))
	{
		output("\n\nGil starts by nudging his moist nose against your crotch, taking the opportunity to get a few good sniffs and enjoy ");
		//pc has pheromone cloud perk or pheromone sweat and is sweaty or mimbranes:
		if(pheromones) output("the smell of your potent pheromones");
		else if(pc.hasStatusEffect("Sweaty")) output("the smell of your sweat-covered body");
		else output(pc.mf("the smell of your masculine musk","your scent"));
		output(". Then, he lets his tongue loose on the [pc.sheath " + x + "], slobbering all over its [pc.skinFurScalesColor] surface. Your erection begins to grow, expanding the sheath with the increasing volume of your cock, but the tip has yet to poke out of it. Only when it’s entirely covered in a warm, glistening glaze does Gil prod its insides, using his tongue to masterfully unwrap your [pc.cock " + x + "] from its now tight container. The more he licks, the larger your erection grows, and the more of your [pc.cockColor " + x + "] dick is exposed to the open air. When your cock is as big as it’s gonna get, the dog-morph gives your sheath one final lick and begins to pull away. He drags his large, floppy tongue along the underside of your dick as he moves back, trailing from base to tip.");
	}
	//else:
	else
	{
		output("\n\nGil starts by nudging his moist nose against your flaccid cock, taking the opportunity to get a few goods sniffs and enjoy ");
		//pc has pheromone cloud perk or pheromone sweat and is sweaty or mimbranes:
		if(pheromones) output("the smell of your potent pheromones");
		else if(pc.hasStatusEffect("Sweaty")) output("the smell of your sweat-covered body");
		else output(pc.mf("the smell of your masculine musk","your scent"));
		output(". Then, he wastes no time in letting his tongue loose on your floppy, but quickly hardening, [pc.cock " + x + "], slobbering all over its [pc.cockColor " + x + "] surface, from the bottom all the way to the tip. When it’s as erect as it’s going to be and fully glazed in doggie slobber, he gives one last lap across your urethra, before pulling back completely.");
	}
	if(pc.balls == 0)
	{
		//pc has hardlight cock:
		if(pc.hasHardLightStrapOn() && !pc.hasCock())
		{
			output("\n\n<i>“There’s literally nothing I can do here,”</i> Gil says, as he traces the line of your underwear beneath the sex toy with a clawed finger. <i>“Which is a real shame, since I’m pretty good at sucking balls. Can’t even lick it properly, since y’don’t have a cock.”</i> He prods that region further, trying to pull a reaction out of you, <i>“Even guys and gals without balls come back for seconds.”</i>");
			output("\n\n<i>“Could you stop being such a tease and just give me what you promised?”</i> you say, arms crossed in frustration.");
		}
		//pc lacks balls:
		else
		{
			output("\n\n<i>“Shame you have no balls to suck on. You’ll miss what I’m really good at.”</i> Gil grins, licking his lips with a crooked smile. <i>“Still, I can do something here.”</i> He puts the tip of his tongue on the underside of your cock, right where your sack would be, and gives it tiny teasing licks that become increasingly more drawn out. He’s pretty good at it, and you can’t even imagine what he could be doing if you had balls.");
			output("\n\n<i>“Could you stop teasing and just give me what you promised?”</i> You say in a half-exasperated, half-flustered gasp.");
		}
	}
	//pc has balls:
	else
	{
		output("\n\n<i>“Here comes the best part.”</i> Gil’s hands grab your [pc.balls], making a cup for ");
		if(pc.balls == 1) output("it");
		else output("them");
		output(" with his hands, ");
		if(pc.ballDiameter() >= 6) 
		{
			output("barely able to contain all of the squishy goodness");
		}
		else
		{
			output("having ");
			if(pc.balls == 1) output("it");
			else output("them");
			output(" rest there snuggly");
			output(".");
		}
		//if taur
		if(pc.isTaur())
		{
			output("\n\nHe opens his gaping maw and wraps it around ");
			if(pc.balls == 1) output("your single ball");
			else output("one of your balls");
			output(". On second thought, maybe you should’ve stopped him considering that he has a fairly dangerous and <i>sharp</i> set of carnivorous chompers.");
		}
		//if not taur:
		else
		{
			output("\n\nAs he opens his gaping maw and gets it increasingly closer to your crotch, you get to clearly see his set of dangerously sharp carnivorous teeth. Momentarily losing your nerve, you push his head away. <i>“Careful with those teeth there, buddy.”</i>");
			output("\n\n<i>“Trust me, you’ll love what I’m about to do,”</i> the dog-morph says as he shoos off your hands before grabbing ");
			if(pc.balls == 1) output("your single testicle");
			else output("the select testicle");
			output(" again and closing his muzzle around it.");
		}
		//pc has larger than 12 inch balls:
		if(pc.ballDiameter() >= 12)
		{
			output("\n\nHe sure does try, but even one of your testicles is far too large for his snout. Still, he tries harder, using his doggie lips to cover his sharp teeth, but the sheer size alone pushes them out of place, and you wince as his fangs scrape the surface of your [pc.sack].");
			output("\n\nThe dog boy notices your discomfort and stops. <i>“Damn, you have ");
			if(pc.balls == 1) output("a really big ball");
			else output("really big balls");
			output("! Can’t give you my special treatment, but I can certainly give ");
			if(pc.balls == 1) output("it");
			else output("them");
			output(" my best slobberjob,”</i> he says, opening his snout yet again and showing off his loose doggy tongue. He grabs your [pc.sack] and starts at its base, slowly raising the tongue all the way to the bottom of your [pc.cock " + x + "] and leaving the [pc.skinFurScalesColor] surface covered in copious amounts of saliva. Then he goes back to the bottom and, starting from a different angle, slides his tongue up again. He continues until he’s sure your sack is completely glazed in his slobber.");
		}
		//pc has larger than 6 inch balls:
		else if(pc.ballDiameter() >= 6)
		{
			output("\n\n");
			if(!pc.isTaur()) 
			{
				output("Gil closes his mouth around ");
				if(pc.balls > 1) output("one of your testicles");
				else output("your testicle");
				output(", ");
				if(pc.balls == 1) output("it");
				else output("them");
				output(" being large enough that he can only take one in his mouth.");
			}
			output(" Thankfully, he seems to use his doggie lips to cover the sharp corners of his teeth, providing a wet and firm massage on your [pc.sack]. Then, he really gets to work; the powerful suction mixed with the swirling of his tongue around your ball feels like heaven to you. Your [pc.tongue] lolls out of you mouth as the dog-morph begins to gently tug at your ball, enough for you to feel the pressure as pleasure, but not enough to feel any pain. He tugs it a little more forcefully, and your ball pops out of his mouth making a loud, lewd sound. It drips with his slobber");
			if(pc.balls == 1) output(", your entire [pc.sack] completely covered in it");
			else
			{
				output(" and he moves on to the next");
				if(pc.balls > 2) output(" and the next after that, until they are all positively drenched");
				output(".");
			}
		}
		//else
		else
		{
			output("\n\nGil closes his mouth around your entire nutsack, taking ");
			if(pc.balls == 1) output("your single testicle");
			else if(pc.balls == 2) output("your pair of testicles");
			else output("all of your testicles");
			output(" into his doggie snout. You were half-expecting to feel his sharp teeth, but instead you feel the wet massage of his lips all around your [pc.sack]. He gently tugs on it for a while, just enough for you to feel the pressure translated into pleasure, but not enough to feel any pain. Then, he really gets to work; the powerful suction mixed with the expert swirling of his tongue around your balls feels like heaven to you. When he thinks he has sufficiently glazed ");
			if(pc.balls == 1) output("it");
			else output("them");
			output(" in his slobber he tugs a little more, forcing your ball");
			if(pc.balls > 1) output("s");
			output(" out of his mouth with an audible pop. He then sinks his face beneath your [pc.sack], the copious slobber running down his teabagged snout.");
		}
		output("\n\n<i>“Damn, ");
		if(pc.ballDiameter() >= 12) output("that’s a nice sack there. Would lick again.”</i>");
		else if(pc.balls == 1) output("that’s a nice ball there. Would suck again.”</i>");
		else output("those are some nice balls there. Would suck again.”</i>");

		output("\n\n<i>“How about you finally give me what you promised?”</i> You say in a half-exasperated, half-flustered gasp.");
	}
	output("\n\n<i>“Sure thing, boss!”</i> Gil says, the word <i>“boss”</i> having a distinct tinge of sarcasm to it, <i>“One blowjob coming up!”</i> His hand wraps around your ");
	if(hardlighted) output("luminous dick");
	else output("[pc.cock " + x + "]");
	output(" and begins to stroke it. For a while he just jerks your ");
	if(hardlighted) output("toy");
	else output("meat");
	output(" with one hand while the other explores the rest of your body. Just as you’re about to complain, he ");
	//pc dick has foreskin flag:
	if(!hardlighted && pc.cocks[x].hasFlag(GLOBAL.FLAG_FORESKINNED)) output("shoves his canine tongue down your foreskin and teasingly licks its insides. As he does this, he’s also slowly pulling your foreskin down, exposing your saliva-coated [pc.cockHead " + x + "] to his warm breath");
	else
	{
		output("wraps his canine tongue around ");
		if(hardlighted) output("the tip, carefully watching your reactions to the neural feedback");
		else output("your [pc.cockHead " + x + "], lapping up the strands of precum that ooze from it");
	}
	output(". He kisses your tip and suckles on it, slowly draining your precum, before ");
	//pc dick has double head flag:
	if(!hardlighted && pc.cocks[x].hasFlag(GLOBAL.FLAG_DOUBLE_HEADED)) output("sinking in, enveloping your topmost cockhead, and then doing it all over again for the second.");
	else output("shoving the rest of it into his mouth.");
	if(pc.cockTotal() > 2) output(" His free hand jumps between your other cocks, keeping them hard with idle handjobs, but he’s obviously more passionate about using his mouth.");
	else if(pc.cockTotal() > 1) output(" His free hand gives your [pc.cockSmallest] a slow, mechanical handjob, and he’s obviously more passionate about using his mouth.");

	output("\n\nHis snout continues to slide across your shaft, while his tongue ");
	if(pc.balls > 1) output("reaches forward and licks your balls when he bottoms out, giving your [pc.sack] another spit-coating.");
	else 
	{
		output("licks around your ");
		if(hardlighted) output("faux-cock");
		else output("[pc.cockNounSimple " + x + "]");
		output(", ");
		//pc dick has ribbed or nubby flag:
		if(!hardlighted && (pc.cocks[x].hasFlag(GLOBAL.FLAG_RIBBED) || pc.cocks[x].hasFlag(GLOBAL.FLAG_NUBBY)))
		{
			output("paying special attention to the ");
			if(pc.cocks[x].hasFlag(GLOBAL.FLAG_RIBBED)) output("ribs");
			if(pc.cocks[x].hasFlag(GLOBAL.FLAG_RIBBED) && pc.cocks[x].hasFlag(GLOBAL.FLAG_NUBBY)) output(" and ");
			if(pc.cocks[x].hasFlag(GLOBAL.FLAG_NUBBY)) output("nubs");
			output(" you have.");
		}
		else output("clearly enjoying its smooth surface.");
	}
	//pc dick is less than 10 inches or hardlight:
	if(dLength < 10 || hardlighted)
	{
		output("\n\nIt doesn’t take long for him to reach the ");
		if(hardlighted) output("garment-clad base of your faux-penis.");
		else output("base of your [pc.cock " + x + "]");
		output(", its entirety resting in his snout without reaching the throat. Before he truly begins to blow you, he takes his time to play with it, swirling his large tongue around your length.");
	}
	//pc dick is less than 20 inches:
	else if(dLength < 20)
	{
		output("\n\nThere’s still a lot to go when your [pc.cockHead " + x + "] hits the back of his mouth. Even though your [pc.cock " + x + "] occupies most his snout, he doesn’t hesitate, and he just keeps sinking his lips further into your length. His throat contracts and expands, every second taking your length just a little bit more, until his lips kiss your [pc.knot " + x + "].");
		if(!pc.isTaur()) output(" You touch his neck, and can’t help but feel impressed with both the bulge your cock is making in his throat and his ability to take it.");
	}
	//else:
	else 
	{
		output("\n\nEven though your [pc.cock " + x + "] occupies most his snout and your [pc.cockHead " + x + "] just hit the back of his throat, he doesn’t hesitate, and he just keeps sinking his lips further and further down your length. You can feel his body tremble as he pushes himself to the limit, but eventually he has to admit defeat and stops, with a ");
		//pc dick less than 25 inches:
		if(dLength < 25) output("bit");
		else output("lot");
		output(" of cock left to swallow. You’re pretty sure that if he went any further it would go straight into his stomach. ");
		if(!pc.isTaur()) output("You feel for his neck and become somewhat awed at both the obscene bulge in his throat and that he is skilled enough to take this much without choking on it.");
	}
	output("\n\nHe begins to pull out, dragging his lips across your ");
	if(hardlighted) output("glow stick");
	else output("[pc.cock " + x + "]");
	output(" with a pleasurably tight grip on it, ");
	//pc dick is less than 10 inches or hardlight:
	if(dLength < 10 || hardlighted) output("until he’s back to kissing your tip");
	else 
	{
		output("never fully removing your [pc.cockHead " + x + "] from his ");
		//pc dick is less than 20 inches or hardlight:
		if(dLength < 20 || hardlighted) output("snout");
		else output("throat");
	}
	output(". Not a moment later and he’s sinking back in one quick motion, ");
	//pc dick is more than 20 inches:
	if(dLength < 20) output("trying his best to take even more in, but ultimately failing");
	else 
	{
		output("reaching the ");
		if(hardlighted) output("base");
		else output("[pc.knot " + x + "]");
		output(" in no time");
		//pc dick has knotted flag:
		if(!hardlighted && pc.cocks[x].hasFlag(GLOBAL.FLAG_KNOTTED)) output(" and then eagerly taking it in");
	}
	output(".");

	output("\n\nThis teasing goes on for ten minutes, as he seems to know exactly when to stop to keep you on edge. It looks like he wouldn’t mind doing this forever, just staying here on your ship, enjoying the intricacies of your ");
	if(hardlighted) output("glowing phallic simulacrum");
	else output("[pc.cockNounComplex " + x + "]");
	output(". Sweat flows down from your brow and your body trembles in pleasure from being kept on edge for way too long, and eventually you have to plead. <i>“Please... just... finish me off!”</i>");

	//pc has hardlight:
	if(hardlighted)
	{
		output("\n\nGil simply nods and slowly increases his pace. He is so good at this that he keeps that pleasurable vice-like grip on your shaft regardless of how much faster he gets. Just as you’re about to orgasm, you ");
		if(pc.isTaur()) output("shift forward to press your tauric hindquarters against his head");
		else output("grab his head");
		output(" and force your luminous rod as deep into his mouth as you can. And he lets you! You feel his tongue licking all around the holographic surface as you ");
		if(pc.hasVagina())
		{
			output("soak your [pc.crotchCovers] in [pc.girlCum]");
		}
		else output("shiver in your dry orgasm");
		output(". He pulls himself off of your faux-dick as your orgasm begins to dwindle");
		if(pc.isTaur()) output(", crawls from underneath your tauric body");
		output(" and rises up.");
		output("\n\n<i>“That’s about the best I can do without a cock. Maybe you should consider growing one with a hefty pair of balls next. Y’know, for next time,”</i> Gil says, giving you a seductive wink.");
		output("\n\n");
		if(pc.isNice()) output("<i>“I’ll consider it,”</i> you say, going out of your way not to put him down.");
		else if(pc.isMischievous()) output("<i>“Maybe I will, maybe I won’t,”</i> you say coyly.");
		else output("<i>“I’ll grow one if I want to,”</i> you say, slightly frustrated at his suggestion.");
	}
	//else:
	else
	{
		output("\n\nGil simply nods and slowly increases his pace. He is so good at this that he keeps that pleasurable vice-like grip on your dick regardless of how much faster he gets. Just as you’re about to cum, you ");
		if(pc.isTaur()) output("shift forward to press your tauric hindquarters against his head");
		else output("grab his head");
		output(" and force your cock as deep into his mouth as you can. And he lets you! You feel his tongue licking your cumvein as your spunk flows through it, before exploding ");
		//pc dick less than 10:
		if(dLength < 10) output("into his maw");
		else if(dLength < 20) output("down his throat");
		else output("directly into his stomach");
		output(". ");
		//pc dick less than 10:
		if(dLength < 10) 
		{
			output("His mouth fills with your [pc.cum] and he ");
			if(pc.cumQ() < 50) output("swallows it effortlessly.");
			else output("gags a bit, the excess oozing from his lips before he can swallow it.");
		}
		//pc dick less than 20:
		else if(dLength < 20) output("You pump [pc.cumNoun] down his throat as he tries to pull out, just enough for you to drop the rest of your [pc.cumFlavor] load directly onto his tongue.");
		else output("Your cock pumps [pc.cum] directly into his stomach, not pulling out until most of your load rests comfortably inside his belly.");
		if(pc.cockTotal() > 1)
		{
			output(" Your other cock");
			if(pc.cockTotal() > 1) output("s shoot");
			else output(" shoots");
			if(pc.cockTotal() == 1) output("its");
			else output("their");
			output(" own load");
			if(pc.cockTotal() > 1) output("s");
			output(" all over his chest.");
		}

		output("\n\nThe pleased looking dog-morph pulls himself off of your [pc.cock " + x + "] as your orgasm begins to dwindle, and you release one last burst of jizz onto his smiling face.");
		if(pc.isTaur()) output(" Crawling from underneath your tauric body");
		else output("Still on his knees and between your legs");
		output(", he shows off his spunk-filled muzzle, [pc.cumVisc] strands of [pc.cumColor] dripping from the top, while the rest lies in a pool of [pc.cumNoun] and doggie slobber on his tongue. After making sure you took a good look at his work, he rises up, swallows it all down and tries his best to lick off the rest you laid on his face.");
		if(pc.cumQ() >= 5000) 
		{
			output(" As he rises, he shows off his belly. It’s ");
			if(pc.cumQ() >= 10000) output("obscenely ");
			output("bulged out with the results of your orgasm, sloshing and groaning at the amount of cum it’s trying to contain within.");
		}
	}
	output("\n\n<i>“Sorry, boss, but I’m gonna need to use your shower.”</i> Without waiting for your answer, he pushes you into the bed, grabs his clothes and goes to the bathroom, closing the door behind him. You hear the sounds of him showering as you regain your breath. After a while Gil exits, already fully dressed and ready to go. He leaves the ship with a simple, <i>“Bye!”</i>");

	processTime(30);
	pc.orgasm();
	//chars["GIL"].loadInMouth(pc);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Doggystyle
//He should prefer cocks that are less than 10 inches long.
public function doggyStyleWithGil():void
{
	clearOutput();
	showGil(true);
	author("Lashcharge");

	var x:int = pc.biggestCockIndex();
	var dLength:Number = 8;
	if(pc.hasCock()) dLength = pc.cocks[x].cLength();
	var hardlighted:Boolean = (pc.hasHardLightStrapOn() && !pc.hasCock());
	var pheromones:Boolean = pc.hasPheromones();

	if(!pc.isCrotchExposed() && !pc.isChestExposed())
	{
		output("He helps you undress");
		if(!pc.isChestExposed()) 
		{
			output(", taking off your [pc.upperGarments], before");
		}
		else output(" by");
		output(" pulling your [pc.lowerUndergarment] down");
		if(pc.legCount == 1) output(" your [pc.leg]");
		else output(" to your [pc.feet]");
		output(".");

		if(hardlighted)
		{
			//pc has big clit and Gil never saw it before:
			if(flags["GIL_SEEN_BIGCLIT"] == undefined && pc.clitLength >= 10)
			{
				flags["GIL_SEEN_BIGCLIT"] = 1;
				output("\n\n<i>“You are not fucking me with that thing!”</i>, Gil says completely horrified at the sight of your [pc.clit].");
				output("\n\nYou quickly pull your underwear back up, and his face goes from horror to relief, as you pack the oversized clit inside. Then that relief turns into happiness as you turn on your hardlight penis.");
			}
			//else:
			else
			{
				output("\n\nGil looks down at your crotch and he stops suddenly as he realizes you don’t have a cock to fuck him with.");
				output("\n\n<i>“How are y’going to fuck me without a cock?”</i>, he says ");
				if(pc.clitLength >= 10) output("eyeing your [pc.clit] nervously");
				else output("as if taking this for a jape");
				output(".");
			}
			output("\n\nYou just reach down and pull your underwear back up. At first he seems a little sad, taking your action as a sign of quitting, but then you turn on your hardlight penis and his ears perk up in surprise.");
			output("\n\n");
			//First time showing him hardlight:
			if(flags["GIL_HL"] == undefined)
			{
				output("<i>“Oh! Of course you have one of those;”</i> he says, almost as if admitting in defeat.”</i>");
				flags["GIL_HL"] = 1;
			}
			else output("You see his smile grow crooked as he playfully nags you, <i>“When are you growing a proper dick so y’can really fuck me? Lightphonies can only get me so far.”</i>");
		}
	}
	//else:
	else
	{
		output("Gil looks down at your [pc.cocks] and licks his choppers, before reaching in closer until his chest is touching your");
		if(pc.tallness < 5*12) output("head");
		else if(pc.tallness >= 10*12) output("[pc.belly]");
		else output("[pc.chest]");
		output(". His hand slips between both of your thighs and gropes your [pc.cocks]");
		if(pc.balls > 0) output(" and [pc.balls]");
	}
	//if more than 10 feet:
	if(pc.tallness >= 10*12)
	{
		output("\n\nYou grab his ass with both hands and easily pull him up to your [pc.chest], while he wraps his legs around your waist and holds himself up by your shoulder. You’re so huge that, despite the aid, he is still staring straight at your chest, and he can’t help but bury his face into your");
		//pc is flat:
		if(pc.hasFur() || pc.hasScales() || pc.hasFeathers() || pc.hasChitin()) output(" [pc.skinFurScales]-covered");
		else if(pc.femininity <= 10 && pc.biggestTitSize() < 1) output(" hairy");
		else output(" hairless");
		if(pc.biggestTitSize() >= 1) output(" bosoms");
		else if(pc.tone >= 70) output(" pecs");
		else output(" chest");
		output(". He looks up and tries to pull himself closer, failing until you help him by pushing his soft furry buttocks upwards, followed by planting a passionate kiss onto his lips. Both of you spend a while there, just enjoying each other’s embrace, before you throw him onto your bed and settle down on top of him.");
	}
	//if more than 7 feet:
	else if(pc.tallness >= 7*12)
	{
		output("\n\nYou wrap your arms around his waist and pull him up to your [pc.chest]. He stands on the tips of his toes as he leans in for a kiss, and he can’t help but grab your ");
		if(pc.hasFur() || pc.hasScales() || pc.hasFeathers() || pc.hasChitin()) output("[pc.skinFurScales]-covered");
		else if(pc.femininity <= 10 && pc.biggestTitSize() < 1) output("hairy");
		else output("hairless");
		if(pc.biggestTitSize() >= 1) output(" bosoms");
		else if(pc.tone >= 70) output(" pecs");
		else output(" chest");
		output(". You plant a passionate kiss on his lips and spend a while just enjoying each other’s embrace. Then you break your kiss, throw him onto the bed, and " + (pc.isTaur() ? "and lay beside" : "fall on top of") + " him.");
	}
	//else:
	else
	{
		output("\n\nYou swipe him off his feet and let him fall backwards into your open arms. He manages to hang his arms sideways around your neck, as you hold him with an arm on his back and the other behind his knees. You’re ");

		//less than 5 feet:
		if(pc.tallness < 5*12) output("really short, so the best you can do is bring him down to your level");
		else output("about the same height as him, so you bring him down");
		output(" and plant a romantic kiss on his lips. Both of you spend a while there, just enjoying each other’s embrace, before you break your kiss, throw him onto the bed, and " + (pc.isTaur() ? "and lay beside" : "fall on top of") + " him.");
	}

	output("\n\nYou put your hands on your lover’s chest and pinch his nipples. He moans and pulls you closer in response, caressing your back as he does. When you tire of teasing his nipples, you let one hand descend to his groin, while the other grabs one of his asscheeks. ");
	if(pc.isTaur()) 
	{
		output("You reorient yourself, pulling your upper half away and moving your lower half forward. You keep going until you feel your ");
		//pc has hardlight:
		if(hardlighted) output("hardlight");
		else output("[pc.cock " + x + "]");
		output(" resting between the lips of his obscenely moist pussy, giving a few experimental nudges to ensure you’re properly lined up.");
	}
	else 
	{
		output("You adjust your [pc.hips] and feel your ");
		if(hardlighted) output("faux-cock");
		else output("prick");
		output(" getting wet as it comes in contact with his obscenely moist pussy.");
	}
	output("\n\nAs you grind your ");
	if(hardlighted) output("toy");
	else output("cock");
	output(" against his puffy lips, you hear him asking amidst a few gasps, <i>“Are y’going to fuck me, or are you just going to be a huge tease?”</i>");

	output("\n\nYou smile and ");
	if(!pc.isTaur()) output("silence him with another kiss");
	else output("press your tauric body against him");
	output(". Then, in a sudden movement, you turn him around and tell him, <i>“Let’s do this doggystyle.”</i>");

	output("\n\n<i>“Oh... fuck yo- me,”</i> Gil says, obviously not enjoying the joke you just made. Despite that, he moves his body onto all fours, accidentally hotdogging your shaft on his ass, before answering your demand with a <i>“Fine.”</i> You can clearly see that it’s more than ‘fine’, with how happily his tail wags.");

	//pc cock less than 10 inches or Hardlight:
	if(dLength < 10 || hardlighted)
	{
		output("\n\nYou aim ");
		if(hardlighted) output("the tip of your hardlight");
		else output("your [pc.cockHead " + x + "]");
		output(" at his pussy and promptly shove it inside. His nether lips are so swollen that, no matter how much you try, you can’t bottom in one go, just from how tight he is. Instead, you have to slowly pump yourself in, bit by bit, forcing his pussy to expand and relax around your ");
		if(hardlighted) output("luminous dick");
		else output("shaft");
		output(". It takes a while to bottom out, but eventually you manage to get his lips to envelop ");
		if(hardlighted) output("the garment-clad base of your faux-penis.");
		else output("your [pc.knot " + x + "].");
	}
	//pc cock less than 20 inches:
	else if(dLength < 20)
	{
		output("\n\nYou aim your [pc.cockHead " + x + "] at his pussy and, with some effort, you manage to penetrate it. He’s really tight and, despite putting all of your strength behind your thrusts, you can’t hilt yourself in one go. Instead, you have to slowly pump yourself in, bit by bit, forcing his pussy to expand and relax around your shaft. At first, you think you will hit his cervix before you bottom out, but then you feel his wet pussylips resting against your [pc.knot " + x + "], and he sighs in relief.");
	}
	//else:
	else
	{
		output("\n\nYou aim your dick at his pussy and thrust, but your [pc.cockHead " + x + "] just mushes against his swollen nether lips, failing to get even a bit of itself in. Your [pc.cock " + x + "] is far too gigantic to get inside his tight cunt. You tell him to relax, and you try your best to push your shaft inside him. Slowly, his lips give in, your tip taking its sweet time to sink into his pussy. Still, the sheer girth of your dick stretches him to the limit and leaves him with ragged breath. The sound of his breath turns into winces of pain as you feel your cockhead hitting against his cervix, with a lot of cock yet to go before you completely hilt yourself on him. Guess this will have to do.");
	}
	//first time:
	if(flags["GIL_PUSS_FUCKED"] == undefined)
	{
		output("\n\nThe dog boy winces beneath you as you feel a warm trickle down your [pc.thigh].");
		output("\n\n<i>“Was I your first?”</i> You ask, surprised at this revelation.");
		output("\n\nHe glances over his shoulder, making sure to avoid your gaze, and gives you a timid nod. You can’t help but notice that he blushes, his embarrassment so strong that the color is noticeable even beneath his black fur.");

		//pc is cock virgin and not wearing hardlight:
		if(pc.cockVirgin && !hardlighted)
		{
			output("\n\n<i>“Guess that’s one thing we have in common.”</i> You tell him, almost sighing in relief. His body stops moving for a moment, and then he looks straight into your eyes. They almost seem to sparkle with a romantic tingle.");
			if(!pc.isTaur()) output(" Then he takes the initiative, grabs your head, brings it closer and plants an intense kiss on your [pc.lipsChaste]. You kiss back, swirling your tongue in unison with his, taking your time to enjoy the shared inexperience.");
		}
		if(hardlighted) flags["GIL_HL_DEVIRGINED"] = 1;
	}
	if(!hardlighted) pc.cockChange();

	//pc is taur:
	if(pc.isTaur())
	{
		output("\n\nYou put your front [pc.legs] over his shoulders and pound ");
		//pc dick has less than 20 inches:
		if(dLength < 20) output("harder");
		else output("further");
		output(" into his cunt. With every thrust his pussylips swell, squeezing even tighter around your ");
		if(hardlighted) output("hardlight rod");
		else output("cock");
		output(". If it wasn’t for how wet he is you would have a lot of trouble just getting your ");
		if(hardlighted) output("fun-stick");
		else output("[pc.cockNounSimple " + x + "]");
		output(" to move at all in this state. His big bubbly butt wobbles every time your pelvis hits his rear. You grab onto the frame of the bed, using it as extra leverage to pound even faster into his animalistic vagina.");
	}
	//else:
	else
	{
		output("\n\nYou grab his waist with both hands and use them as leverage to pound ");
		//pc dick has less than 20 inches or hardlight:
		if(dLength < 20) output("harder");
		else output("further");
		output(" into his cunt. With every thrust, his pussylips swell, making it all the tighter to sink your ");
		if(hardlighted) output("hardlight rod");
		else output("cock");
		output(" in. If it wasn’t for how wet he is you would have a lot of trouble just getting your ");
		if(hardlighted) output("toy-dick");
		else output("[pc.cockNounSimple " + x + "]");
		output(" to move at all in this state. His big bubbly butt wobbles every time you drill it in, and you can’t help but give one of his black furry cheeks a good squeeze. He gasps at your groping and moans as you bottom right back in him. You trace your other hand over his back, not finding a hint of excess muscle or fat, your other hand quickly following behind, before you grab his shoulders to make it easier to pound into his animalistic pussy.");
	}
	output("\n\nAs the sex continues, you start to notice a strange smell in the air, a mix of manly musk, sweat and pheromones, and it’s all coming from the dog-morph. The smell of his sweat-drenched body is overpowering, each drop enticing you to thrust your ");
	if(hardlighted) output("holographic prick");
	else output("[pc.cock " + x + "]");
	output(" faster and harder into his cunny. The pheromones sink their chemical claws into your mind, dispelling all concerns as you pump into his moaning body and soon enough they take full control over the motions of your [pc.hips].");
	output("\n\n<i>“Hnng, that feels great. Fuck me with that ");
	if(hardlighted) output("hardlight phallic simulacrum");
	else output("[pc.cockNounComplex " + x + "]");
	output(" of yours!”</i> Gil says, exaggerating his own speech to try to hide how affected he is by your ministrations.");
	output("\n\n<i>“If you really wanted ");
	if(hardlighted) output("for me to fuck you");
	else output("my cock");
	output(", why did you make it such a hassle for me just to get in here?”</i> You ask, punctuating the <i>“here”</i> by pulling out to the tip and then thrusting as much of your shaft as you can in a single movement.");
	output("\n\n<i>“Fuck!”</i> He moans really loud, before answering, ");
	if(hardlighted) output("<i>“Don’t stretch it. You only got my virginity because of the poppers.”</i>");
	else output("<i>“I care more for those snausages than your sausage. That’s why you got my virginity.”</i>");

	//pc has knot and less than 20 inches:
	if(pc.hasKnot(x) && dLength < 20 && !hardlighted)
	{
		output("\n\n<i>“Beg for it.”</i>");
		output("\n\n<i>“What?”</i>");
		output("\n\n<i>“Beg for the knot like the bitch you are.”</i>");
		output("\n\nGil pauses for a moment as the pun digs into his mind and your knot presses on his canine cunt. <i>“Motherfucker. Y’did not just made a dog pun at me. Again!”</i>");
		output("\n\n<i>“Beg for it.”</i> You say simply and concisely as you push the knot against his lips and wrap your hands around his thin waist.");
		output("\n\nHe becomes increasingly flustered as you continue to tease him, forcing his pussy to stretch just a little around the knot, but never letting it slip inside. He waits for a few more minutes, his face twisting, gradually shifting from indignant rage to biting his lips in barely restrained lust, before answering with an enthusiastic, <i>“Fucking knot me already!”</i>");
		output("\n\n<i>“Is that the best you can do.”</i> You say putting a bit more knot into him, stretching his pussy just a little wider.");
		output("\n\nHe rolls his eyes and pleads in a tone that barely manages to not come across as sarcastic. <i>“Please, my alpha, stretch my pussy wide open with that big ol’ knot of yours and get stuck inside me for half an hour.”</i>");
		output("\n\nYou begin to pull out and, before he can make another snide remark, you slam it back in with the full strength of your hips, ");
		//pc has very thick knot:
		if(pc.knotThickness(x) >= 6) output("obscenely ");
		output("stretching his pussy ");
		//pc has very thick knot:
		if(pc.knotThickness(x) >= 6) output("obscenely wide");
		else output("open");
		output(" in order to hilt your knot in one go. He moans out loud as more and more of that meaty knot enters him, biting his lips in both pain and pleasure. Your knot manages to get halfway through his pussy before letting the rest slip inside with a thunderous thump of your ");
		if(pc.isTaur()) output("hindquarters");
		else output("hips");
		output(" hitting his buttocks.");
	}
	//else:
	else
	{
		output("\n\nYou decide to silence his snide remarks by almost pulling out");
		if(!pc.isTaur()) output(", taking a moment to admire your ");
		if(hardlighted) output("luminous faux-penis");
		else output("glistening, [pc.cock " + x + "]");
		output(" before hammering it into his swollen, canine pussy. Wrapping your hands around his thin waist, you hammer your hips against his buttocks with a loud thump, each time forcing a loud moan out of his lips.");
	}
	if(pc.isTaur())
	{
		output("\n\nGil does his best to stay upright on his hands and knees, trying to resist the weight of your lower body pressing him into the mattress.");
	}
	else if(pc.isNaga()) output("\n\nGil rests his belly on a coil of your [pc.leg], while your hand presses his thin chest into the mattress.");
	else output("\n\nGil lets your hand in his back press him against the mattress.");
	output(" As you hump against his bum,");
	if(pc.hasKnot(x)) output(" your knot still firmly locked inside his puffy pussy,");
	output(" you feel the arrival of your own orgasm");
	if(pc.balls > 0) output(", as a load churns in your [pc.balls]");
	output(".");
	output("\n\n<i>“Fuck! I’m pretty close!”</i> He blurts out, announcing his coming orgasm.");
	output("\n\n<i>“Me too.”</i>");
	output("\n\n<i>“Don’t tell me we’re going to cum together.”</i>");
	output("\n\n<i>“Seems like it.”</i> You say, at the brink of your orgasm.");
	output("\n\n<i>“So. Fucking. Cheesy.”</i> He manages to gasp out, trying his best to contain himself.");

	output("\n\nNot a moment later, you both reach an orgasm");
	if(pc.isTaur()) output(", your grunts being completely drowned out by his loud moans.");
	else output(" and you fall on him and nip into his shoulder, forcing a small yip out of him.");
	//pc has hardlight:
	if(hardlighted) output(" Gil’s cunt explodes, bursting with girlcum around your sex-toy until your crotch is completely coated in his musky fluids.");
	else 
	{
		output(" Gil’s cunt drools with clear musky fluids, as your [pc.cock " + x + "] cums into him");
		if(pc.hasKnot(x)) 
		{
			if(pc.cumQ() >= 5000) output(". You feel the pushback against your knot as you pump more and more [pc.cumNoun] into his womb, making it swell as the sheer quantity of fluids stretches him way past his limits.");
			else output(", your knot firmly sealing it and keeping your [pc.cumNoun] inside his womb.");
		}
		else
		{
			//pc cum is small:
			if(pc.cumQ() < 10) output(", small enough to disappear inside of him without much trouble.");
			else if(pc.cumQ() < 500) output(", a mixture of your fluids drooling around your cock");
			else if(pc.cumQ() < 3000) output(", big enough to wash out most of his fluids, replaced with a pure stream of [pc.cumNoun]");
			else output(". You feel your cock exploding inside of him, filling his womb and then some. Even his extremely tight nether lips fail to contain your bountiful jizz, as more and more blasts of [pc.cumNoun] cover your [pc.legs] and [pc.belly].");
		}
		if(pc.cumQ() >= 3000 && !pc.isTaur()) output(" You reach down to rub his engorged belly and feel it swell even larger as your hose continues to unload more of your cum into his overfilled womb.");
	}
	if(pc.hasVagina())
	{
		output(" You feel your own vaginal orgasm ");
		if(hardlighted) output("drench your [pc.lowerUndergarment] with [pc.girlCum]");
		else if(pc.isSquirter()) output("burst forth from your cunt and drench Gil’s thighs in [pc.girlCum]");
		else 
		{
			output("drip down your ");
			if(pc.balls > 0) output("[pc.balls]");
			else output("thighs");
		}
		output(".");
	}
	output("\n\nWhen it’s all done, his legs collapse under him and you both slump on the bed.");
	if(!pc.isTaur()) 
	{
		output(" He caresses his nipped shoulder");
		if(pc.isAss() || pc.isBro()) output(" and you give him a dismissive grunt");
		else if(pc.isNice()) output(", as you apologize for biting him");
		output(".");
	}
	//pc has knot:
	if(pc.hasKnot(x))
	{
		output("\n\nYour knot is still firmly locked inside him, not letting a single drop of your ejaculate escape. You try to tug your [pc.cock " + x + "] out, but find it completely stuck within his swollen pussy.");
		output("\n\n<i>“Figures.”</i> Gil comments, sighing at this predicament. <i>“Well, I’m gonna take a shower. So, you’re coming, like it or not.”</i> He says before dragging you into your bathroom by the knot. You both take a quick shower, teasingly helping each other clean up and occasionally sharing a kiss. Eventually, your knot pops out, letting ");
		if(pc.cumQ() >= 3000) output("the obscene quantities of your [pc.cum]");
		else output("your mixed fluids");
		output(" flow out his cunt and into the drain below.");
	}
	//else:
	else
	{
		output("\n\nSlowly, you ");
		if(hardlighted) output("push the hidden off-switch on your [pc.lowerUndergarment] and feel your glowing cock flicker out of existance");
		else output("let your [pc.cock " + x + "] flop out of his vagina");
		output(" as ");
		if(hardlighted) output("his clear fluids");
		else if(pc.cumQ() >= 3000) output("the obscene quantities of your [pc.cum]");
		else output("your mixed fluids");
		output(" drool out of him");
		if(pc.cumQ() >= 500) output(", staining the sheets [pc.cumColor]");
		output(".");
	
		output("\n\nAfter resting for a while, reveling in the shared afterglow, he grabs you by the wrist and drags you to the bathroom to take a shower. Under the stream of water, you teasingly help each other clean up, and occasionally share a kiss.");
	}
	output("\n\nWhen he is done with the shower, you both get dressed and he leaves you with a simple, <i>“Bye!”</i>");
	processTime(35);
	pc.orgasm();
	//orgasm
	//[Next] // Ship menu
	IncrementFlag("GIL_PUSS_FUCKED");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}