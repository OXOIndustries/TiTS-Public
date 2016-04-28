//Author - Savinbuns
//Project Notes / Outline

/*Futa Half-Gryvain (Half-Kaithrit, though that doesn't show much). Has long green hair in a ponytail, green lips, red cat-eyes, dragon horns, small frilled ears. Slightly coarse, human-shaped tongue (kaithrit side). Human skin all over, aside from her tail and from the knees down. Lacks wings, but has a tail and gryvain sex-organs (including nubby-inside clitless vagina). Big G-cup breasts with broad green nipples. Cock about 10 inches long; has big, fat balls. More thick than thin, with big egg-bearing hips, thick thighs, big bouncy booty, soft belly.

Wears a dark red harness around her shoulders/chest. At the push of a button, the harness covers her entire body from the neck down with a paper-thin coating of dark purple latex. Suit has the same feeling and texture as a condom on the outside; inside, it interfaces with her neural system to quintuple pleasurable tactile sensations while turning negative ones (pain, soreness) into a numb throb. 

Harness is a discontinued prototype from KihaCorp acquired from her sire, who works for the company. She was injured in her youth (fell off something & broke her back?), rendering her without sensation in her body. The suit acts as a second skin for her, letting her feel again. Unfortunately it's tuned way too high, so she's constantly aroused and cums from the slightest touch... which makes turning tricks at Beth's a natural choice for her. Good thing gryvain are famous for having no refractory period! Still, takes cheapo drugs to keep her cum production & libido up for clients. Has four testes: two in her balls, two inside (gryvain-style, nestled on either side of her anal walls), so she's got ultra-high cum vol./production. 

Technically a virgin under her suit -- never had sex without it! That counts, right? :P

Hangs out at the tables near the stage, completely on display for customers. She's very popular, naturally, especially during dances when she's happy to just sit on a customer's lap and let them blow a quick load in her bodysuit's holes, or give them something nice and hard to sit on. When dances aren't on, has a table to herself where she relaxes and entices.

"Hey, space cowboy. Wanna buy me a drink... or would you rather just buy me?" she purrs, giving you a seductive smile and leaning forward, making her immense bust sway in your direction.

"Fair warning: this suit amplifies physical sensation by five. So if you fuck me, I'm going to orgasm pretty much instantly. The good news is, my gryvain half means I don't have a refractory period. I'm ready to go again while I'm still squirting the first load out. Treat me right, and I'll empty my balls for you by the time you finish."
*/

public function showTerensha():void
{
	showName("\nTERENSHA");
	showBust("TERENSHA");
}
//Room Descripts & Such

//Obv. all need to be below description of active dancer, if any. 

public function terenshaIsDancing():Boolean
{
	//Make her dance from 10-15 hours, I guess? Savin didn't give me much to go on.
	if(hours >= 2 && hours < 16) return true;
	return false;
}
public function terenshaAdditionalBonus():void
{
	if(flags["MET_TERENSHA"] == undefined)
	{
		//Dances are On; not met:
		if(terenshaIsDancing())
		{
			output("\n\nA green-haired woman in a skin-tight bodysuit is making rounds between the various tables near the dancer’s stage. She’s clearly not human: horns poke out from her brow, a swishing reptilian tail coils behind her, and a hefty cock is put proudly on display through her suit. Every so often, one of the spectators will grab her plump behind or flash her a credit chit, which invariably ends in her slinking into their lap. She rises a minute later, flushed and smiling. When you look closer, you can see tell-tale smears of white cream on her thighs that quickly disappear - maybe into the suit itself?");
			addDisabledButton(1,"Dragon-Girl","Dragon-Girl","She looks busy at the moment...");
		}
		//Dances off; not met:
		else
		{
			output("\n\nA green-haired woman is sitting at a table off to one side of the bar, near enough that she draws plenty of lustful gazes from the other patrons while they order. She’s clearly not human, with lustrous green hair and bestial horns poking up from a brow of cream-pale skin. The woman appears to be wearing a skin-tight bodysuit, showing off a pair of breasts so voluptuous that she’s got little choice but to rest them on the table in front of her - much to the delight of the customers.");
			output("\n\nEvery so often, someone slides into the booth across from her and you see credits being exchanged. It’s too dark to see what exactly transpires, but her customers always seem to leave with a flush on their cheeks and a smile.");
			addButton(1,"Dragon-Girl",meetingTerensha);
		}
	}
	else
	{
		//Dances on; met:
		if(terenshaIsDancing())
		{
			output("\n\nThe green-haired latex queen, Terensha, is working the crowded tables near the dancer’s stage. Her overly large breasts and bobbing reptilian dick are on full display, enticing more than a few of your fellow spacers to grab her ass or flash her a credit chit, enticing her over. Invariably, she ends up crawling into their lap or they into hers. A minute later and Terensha leaves flushed in the cheeks and smiling... and usually with a stain of white cream between her thighs that her bodysuit quickly absorbs.");
		}
		//Dances off; met:
		else 
		{
			output("\n\nTerensha, Beth’s resident green-haired latex queen, is relaxing at a table off to one side of the bar, near enough that she draws plenty of lustful gazes from the other patrons while they order. Her signature skin-tight bodysuit overtly emphasizes her breasts, so voluptuous that she’s got little choice but to rest them on the table in front of her - much to the delight of the customers.");
			output("\n\nEvery so often, someone slides into the booth across from her and you see credits being exchanged. It’s too dark to see what exactly transpires, but her customers always seem to leave with a flush on their cheeks and a smile.");
		}
		addButton(1,"Terensha",meetingTerensha);
	}
}

//Meeting Terensha
//First time meet. Set her status to <i>“met.”</i> Only when she’s not working the stage tables (ie, no dancers active).
public function meetingTerensha():void
{
	clearOutput();
	showTerensha();
	if(flags["MET_TERENSHA"] == undefined)
	{
		flags["MET_TERENSHA"] = 1;
		output("Deciding to see what’s on offer with the green-maned babe in the corner booth, you stride over and take a seat after her current customer leaves. The brawny thraggen man gives you a thumbs up as he passes back towards the bar with a spring in his step. Certainly seems satisfied with himself! You watch him go, your curiosity building as you take his place across from the horned woman.");
		output("\n\n<i>“Hey there, space cowboy,”</i> the woman says with a hint of a grin, getting the measure of you in one glance. She shifts forward, making her immense breasts glide ever so slightly closer across the polished surface of the table. Seeing where your gaze is firmly affixed, she lets her smirk grow wider and rests her chin on her palms. <i>“Haven’t seen you around here before. The name’s Terensha; Ren, if that’s a mouthful.”</i>");
		output("\n\n<i>“Steele. [pc.name] Steele,”</i> you answer, trying your damnedest to draw your gaze back up to the woman’s dark red eyes.");
		output("\n\nIt’s a hellishly hard task, though: the way the dark purple latex clings to her skin is mouthwatering! The material is so incredibly thin, and so <i>tight</i> to her supple skin that it leaves absolutely nothing to the imagination. You can see her broad nipples poking through the sinfully sheer material, stiffening to tiny peaks under your incessant gaze. Whatever she’s wearing clings to her like a second skin, emphasizing rather than hiding her curvaceous body’s reactions to your attention.");
		output("\n\n<i>“They’re G’s. All natural,”</i> the woman - Ren - says, snapping your attention back from your momentary reverie. <i>“Gryvain and kaithrit are both notorious for being stacked. I guess I inherited the best of both worlds.”</i>");
		if(!pc.isBro()) 
		{
			output("\n\nYou stammer out an apology for staring, which earns you a chuckle from the halfbreed temptress. <i>“If I didn’t want you to stare, I’d cover them up,”</i> she assures you. <i>“These big beauties are the easiest way to attract horny spacers like you, all pent up from who knows how long out there in the void.");
			if(pc.hasStatusEffect("Blue Balls")) output(" And you, love, look <b>soooo</b> pent up!");
			output(" I love putting these, and all my other assets, to use helping you guys out... for a price.”</i>");
		}
		else 
		{
			output("\n\nYou grin and compliment her on a bangin’ rack. Damn, you’d love to get your hands on those beauties!");
			output("\n\n<i>“Thanks, cow[pc.boyGirl],”</i> she smiles, cupping the pair of heavy, perfect orbs in either hand. <i>“You’ve clearly got good taste in tits. Bigger the better, right? Well, tell you what: I’d love to let you get all hands-on with my girls here... if you don’t mind parting with a few credits.”</i>");
		}
		output("\n\nAh, so that’s it. She’s turning tricks in the bar");
		if(flags["BETHS_TIMES_WHORED"] != undefined) output(", the same as you");
		output(". And seemingly doing good business, too.");
		output("\n\n<i>“Interested?”</i> Ren inquires sweetly, batting her long lashes at you. Shifting her tightly-held bust a bit, she adds, <i>“Trust me: this suit and I can make you feel things you wouldn’t believe. ");
		if(pc.hasCock()) output("For a few credits, I’d be happy to make you spill every drop of cum you’ve got all over my feet... or for a little more, we can take this bottle of lube back to my room, slick your business up, and let you put it anywhere you please. The feeling of a firm prick gliding through slick, tight latex is absolutely heavenly. Guaranteed.");
		else output("For a few credits, I’ll let you sit in my lap and play with the surprise I’ve got waiting under the table for you. A little more, and you and I can go back to my room... no promises you’ll be able to walk out, though!");
		output("”</i>");
		output("\n\nWhat");
		if(silly || pc.isBro()) output(", or more likely, <i>who</i>");
		output(" will you do?");
		processTime(3);
	}
	//Repeat Meeting: Dancer Hours
	else if(terenshaIsDancing())
	{
		output("Terensha’s apparently working at the moment. Why not go over and see if you can snag a dragon-girl quicky? You guess you’ll end up 100 credits in the hole for a little fun.");
		if(pc.exhibitionism() < 33 && !pc.isBimbo() && !pc.isBro()) 
		{
			output("... Nah. You're not <b>that</b> much of an exhibitionist.");
			clearMenu();
			addButton(14,"Leave",mainGameMenu);
		}
		else
		{
			clearMenu();
			if(pc.hasCock()) addButton(0,"Quick Fuck",meetingTerenshaDancing);
			else addDisabledButton(0,"Quick Fuck","Quick Fuck","You'll probably need a penis for that though...");
			addButton(14,"Back",mainGameMenu);
		}
		return;
	}
	//Repeat Meeting (Non-Dancer Hours)
	else
	{
		output("Seeing a gap in Terensha’s clientele, you take it upon yourself to slide into the booth across from the stacked halfbreed. She gives you a sultry smirk as you sit down, unsubtly adjusting the way her prodigious bust is resting on the tabletop.");
		output("\n\n<i>“Hey, space cow[pc.boyGirl]. Wanna buy me a drink... or would you rather just buy me?”</i> she purrs, running her tongue over her green lips.");
		processTime(1);
	}
	rensMainMenu();
}

//Ren’s Table Menu
public function rensMainMenu():void
{
	clearMenu();
	//[Table Service] [Room Service] [My Place?] [Her Suit]
	if(pc.exhibitionism() >= 33 || pc.isBimbo() || pc.isBro()) 
	{
		if(pc.credits >= 75) addButton(0,"Table Service",renTableServe,undefined,"Table Service","Purchase some quick and dirty service here at Ren’s table. Should run you about 75 Credits.");
		else addDisabledButton(0,"Table Service","Table Service","You can't afford that.");
	}
	else addDisabledButton(0,"Table Service","Table Service","This place is a little public for that sort of thing... You'd need to be a lot sluttier for something like that.");
	
	if(pc.credits >= 100) addButton(1,"Room Service",roomServiceFromRensa,undefined,"Room Service","Pay Terensha to take you down to her room and give you intimate attention.\n\nCosts 100 Credits.");
	else addDisabledButton(1,"Room Service","Room Service","You don't have enough credits for that.");

	if(flags["REQUEST_REN_HOME"] == undefined) addButton(2,"My Place?",tryToGoToHerPlace,undefined,"My Place?","Ask if the two of you could maybe get out of here and head back to your place... a much more intimate setting.");
	else addDisabledButton(2,"My Place?","My Place?","You tried that. It didn't work.");
	addButton(14,"Leave",mainGameMenu);
}

//[My Place?]
//Ask if the two of you could maybe get out of here and head back to your place... a much more intimate setting.
public function tryToGoToHerPlace():void
{
	clearOutput();
	showTerensha();
	//One-time only
	if(flags["REQUEST_REN_HOME"] == undefined)
	{
		output("You’ve barely got the question out before Ren tsks her tongue and waves a single, slender finger at you. <i>“Sorry, sweetie. House rules say we stay. If you want, though, the rooms downstairs are plenty private and comfier than you think. Especially once we start having fun...”</i>");
		output("\n\nLooks like even the Steele charm can’t move her on that point. Damn.");
		flags["REQUEST_REN_HOME"] = 1;
	}
	processTime(1);
	rensMainMenu();
}

//[Table Service]
//Purchase some quick and dirty service here at Ren’s table. Should run you about 75 Credits.
//PC needs at least a little exhibition. Gives +small Exhibitionism.
public function renTableServe():void
{
	clearOutput();
	showTerensha();
	output("Looking the curvaceous halfbreed over, you smile and say that you’d love to see what she can do here at the table.");
	output("\n\n<i>“Quick and dirty, hmm? Popular choice,”</i> Ren says, running a hand along her thigh. It returns with a handheld scanner that she rolls between her fingers. Taking the hint, you pull out your Codex and let her siphon off her fee. Once done, Ren gives you a green-lipped smile and you both stow your devices. Her prodigious breasts shift enticingly on the table as she drinks in your body, deciding how best to service you....");
	pc.credits -= 75;
	//{PCs with cocks can choose [Footjob] [Ride Her]; else, append:}
	if(pc.hasCock())
	{
		clearMenu();
		addButton(0,"Footjob",undertaleFootjob,undefined,"Footjob","Have her jack you off under the table. Put those feet to work!");
		//Ride Her
		addButton(1,"Ride Her",rideTerenshaBunbunbunbuuuuuuuuuuuuuuuuuuuuuuasdasdadajsdlajdklajdlajflfIjustHadAStrokeAtMyKeyboard,undefined,"Ride Her","Climb on her lap and take that cock.");
	}
	else rideTerenshaBunbunbunbuuuuuuuuuuuuuuuuuuuuuuasdasdadajsdlajdklajdlajflfIjustHadAStrokeAtMyKeyboard(true);
}

//PC Has a Cock: Undertable Footjob
public function undertaleFootjob():void
{
	clearOutput();
	showTerensha();
	output("Though she’s near motionless above the tabletop, save for the sway and jiggle of her fulsome bust with every breath, you quickly feel something soft and supple - and covered in a paper-thin veneer of latex - caressing your [pc.leg]. You stiffen on primal instinct as the half-gryvain’s toes brush ");
	if(pc.isCrotchExposed()) output("against your bare [pc.cockNounSimple], caressing its tender underside with her wrapped-up talons. You gasp with unexpected pleasure as her smooth, latex-wrapped talons caress you; yet before you can reach full hardness, her foot withdraws away!");
	else output("your [pc.cock] through your [pc.lowerGarment], rolling your hardening meat around beneath your clothes. You gasp with pleasure, but you’ve barely reached full mast before her foot withdraws. In its place comes something long and sinuous, coiling around your gear and pulling it away. Before you even have time to recognize it as her reptilian tail, the dexterous appendage has yanked your clothes away and coiled around your shaft, pulling it free before sliding away.");
	output("\n\n<i>“Just a moment,”</i> Ren purrs, reassuring you that there’s plenty more to come. Her hefty bosom jiggles alluringly against the smooth tabletop as she moves her arms under the table, like she’s spreading something around under there. Ren makes a soft little moaning noise, and giving you a self-satisfied smirk, leans back in her seat. You feel why a split second later: two slicked-up latex soles come at your [pc.cock] from either side, grasping your manhood with preternatural dexterity and starting to gently caress it. Her feet move out of sync with one another, one going high and the other low, balancing your shaft between each supple arch.");
	output("\n\nRen’s obviously lubed herself up for this, slathering her feet with something warm and slick to make her work even more pleasurable for you. A couple seconds of that kind of treatment leaves you grasping the table’s edge with white knuckles, ");
	if(pc.exhibitionism() < 33) output("grinding your teeth to keep from moaning. You give sidelong glances to the crowd at the bar, wondering if any of them can see what’s going on under the table, even with the lights so low...");
	else if(pc.exhibitionism() < 66) output("shamelessly gasping with pleasure as Ren massages your member. Your partner clearly doesn’t mind - if anything, her broad nipples stiffen beneath her latex suit as spacers start glancing your way, wondering just what’s going on...");
	else output("moaning openly in response to the wondrous grasp of her supple feet on your cock. Every spacer within earshot cranes his head your way, and more than a few pop tents in their trousers once they realize what’s going on. Well, this is a whorehouse after all. You flash a few of the cute ones smiles, rolling your head back and letting Ren do all the work. She smirks and moves a little faster, and you note with appreciation that her broad nipples are stiffening beneath her latex suit. You’re not the only one who likes showing off....");
	output("\n\nTerensha is clearly quite talented with her feet, rubbing your [pc.cockHead] with one sole");
	if(pc.balls > 0) output(" and cupping and squeezing your [pc.balls] with the other");
	else output(" while the other rubs up and down your length with mounting speed");
	output(". Even her talon-like nails, as dangerous as they are, are nothing but angel-kisses on your tender flesh; every part of this curvaceous call-girl’s body seems tailor-built to pleasure you. So much so that");
	if(pc.exhibitionism() < 33) output(" despite the exciting fear of people staring");
	output(" you can’t help but reach across the table and grab yourself two handfuls of the halfbreed’s ample breasts.");
	output("\n\nRen’s eyes flash wider, then lull low as your fingers start to squeeze and caress the hefty mounds. Her nipples tighten to rippled mountains at their peaks, easily pinched and teased until like you, Ren’s gasping with pleasure. The table beneath you shudders with an audible <i>thunk</i>, making your partner’s tits quake majestically. She flushes, biting her lip and visibly trying to control her erection.");
	output("\n\n<i>“Sorry,”</i> she murmurs, moving her feet a little faster. <i>“Not many customers care for <b>my</b> enjoyment that much.”</i>");
	output("\n\nConsidering how devoted she is to yours, that’s a damn shame. Her wet, rapid ministrations have already brought you near to your peak - you can feel pressure welling in the base of your cock");
	if(pc.hasKnot(0)) output(", which she’s keen to exploit by rubbing your swelling bitch-breaker.");
	// keratin:
	else if(9999) output(", especially around the keratin nubs along your shaft, which Ren lavishes with her lubricated affection.");
	else output(" and deep inside your [pc.balls].");
	output("\n\nShe must be able to feel your prick throbbing with need, as Ren’s green lips curl into a lustrous smile. <i>“Don’t worry about making a mess. Just go ahead and cover my feet in cum....”</i>");
	output("\n\nHer urging is like a magic word in your ear. The pressure in your [pc.balls] is suddenly overwhelming, and watery pre spurts all over Ren’s latex-wrapped toes. Your pre-orgasmic juices just add to the glaze of lube already on her, letting her move those dexterous digits just that much faster. Her toes circle and squeeze your crown, milking out every juicy drop until with a grunt of pleasure, you buck your hips and feel a rush of heat barreling through your throbbing manhood. A thick gout of [pc.cumNoun] splatters the bottom of her toes, earning a delighted gasp from your partner as her foot is slathered in a thick load of cum. Her other foot presses against your tender underside, massaging out more and more of your orgasm’s fruit to smear against her soles and toes.");
	output("\n\n<i>“Oooh, you </i>were<i> pent up!”</i> Ren teases, using your own cum as an extra helping of lube to keep stroking you right until your [pc.balls] ");
	if(pc.balls <= 1) output("is");
	else output("are");
	output(" emptied all over her. When you’re done, leaning back in your chair and moaning with the aftershocks, Ren smiles and puts her hands on yours, still atop her weighty breasts.");
	output("\n\n<i>“Enjoy yourself?”</i> she asks sweetly, moving her feet a little more slowly now. When you nod, she murmurs happily and withdraws them, leaving your cock a cummy wet mess softening against your thigh. <i>“Good! Mmm, I got a little messy there... I better go clean up for my next customer. Maybe next time I’ll get to feel that [pc.cock] of yours, hmm?”</i>");
	output("\n\nYou smile, hardly able to wait to see what she can do with her <i>whole</i> body. Ren gives you a wink and slips out of the booth, wiggling her plump behind for you before turning towards the washroom. As she does, you’re treated to a good look at the rock-hard reptilian member jutting out of the front of her latex suit... and the sloshing balloon that’s formed at its crown, bouncing heavily with every swaying step.");
	output("\n\nNo way she came just from you playing with her boobs... did she?");
	pc.exhibitionism(1);
	processTime(27);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Ride Her
public function rideTerenshaBunbunbunbuuuuuuuuuuuuuuuuuuuuuuasdasdadajsdlajdklajdlajflfIjustHadAStrokeAtMyKeyboard(appended:Boolean = false):void
{
	if(!appended) clearOutput();
	showTerensha();
	if(appended) output("\n\n");
	output("<i>“Why don’t you come over here,”</i> Ren purrs, leaning back in her seat and spreading her arms out the back of the booth. As she does so, you see a tapered crown wrapped in tight purple latex peeking up from under the lip of the table, almost big enough to nestle between Ren’s breasts. There’s just enough room between the table and the half-dragoness herself for you to crawl over and slip into her lap, wrapping your arms around Ren’s shoulders and pressing her jutting reptilian prick between your [pc.belly] and her soft, slickly wrapped body.");
	output("\n\nShe smiles playfully, using her tapered tail to reach around and caress your [pc.butt]. <i>“That’s better... why don’t you reach down to the belt on my thigh and get me warmed up. Hmm?”</i>");
	output("\n\nThat sounds like a plan! You run a sensual hand down one of Ren’s thick thighs, find a small bottle of lube clipped to her suit, and squirt a nice, thick helping of it into your hand. Ren gasps, then rolls her head back with a lusty moan as your lube-slicked fingers circle around her lengthy, bulbous shaft from its knot-like base and start to slowly work your way up. You don’t make it halfway to her crown before the working girl’s breath becomes ragged, and her cock starts throbbing in your grasp. Is she...?");
	output("\n\n<i>“F-fuck!”</i> she gasps, biting a green lip and rolling her head back. The tumescent member in your hand pulses needily, and you feel a streak of molten wetness bubbling around your fingers, trickling in the oh-so-tight confines between flesh and latex. By the time you realize what you’re feeling, Ren’s giving you a bashful look. <i>“Sorry. The suit... let’s just say I’ll probably enjoy this even more than you will.”</i>");
	output("\n\nGuess there’s no faking it for her! Grinning to yourself, you keep massaging the lube across the length of her prick, making sure you apply it nice and evenly across every veiny, throbbing inch of gryvain-cock until Ren’s gripping the booth tight and moaning like a whore, and her prick is tipped by a steadily-growing bubble of her boiling-hot spunk. If she’s gonna cum this much just from a handjob, how bloated are you going to end up by the time you’re done riding her?");
	output("\n\nYou can’t wait to find out.");
	if(pc.exhibitionism() < 33) output("\n\nYou glance warily around, wondering if anybody’s watching. Most of the customers are more interested in the bar, or heading downstairs to visit their favorite jane. A few look your way, but in the dark moodlight of the brothel, you’re sure they can’t see too much... right?");
	else if(pc.exhibitionism() < 66) 
	{
		output("\n\nLooking around the bar, you catch a few people staring. Maybe the dark isn’t doing that good a job of hiding what you’re doing? While envious eyes settle on you, you feel a rush of adrenaline that makes your heart hammer in your chest. Excitement? The way ");
		if(!pc.hasCock()) output("your [pc.vagOrAss] burns with need");
		else output("your [pc.cock] stiffens against Ren’s own erection");
		output(" certainly seems to think so! Maybe you could give all these wandering eyes a show.");
	}
	else
	{
		output("\n\nConsidering you’re about to spear yourself on a busty babe’s cock in the middle of the space-brothel, there aren’t nearly enough eyes on you and your hired lover. Your heart hammers excitedly in your chest as you grab Ren’s tits in both hands and moan loudly and lewdly, shamelessly drawing every eye in the bar your way. You rock your hips and show off the throbbing hard cock");
		if(pc.cockTotal() > 1) output("s");
		output(" trapped between your bodies. A few catcalls later and you’re pushing Red down ever so slightly, trapping the first inches of her prick between her breasts and starting to work them up and down her length. She grunts and spurts into the growing cum-bubble, but the way she flushes and stays hard as a rock, something tells you Ren here’s as much of a perverted exhibitionist as you are!");
	}
	output("\n\nNow that your partner’s lubed up and you’re both ");
	if(pc.hasCock()) output("rock hard");
	else output("as hot and ready as you’ll ever be");
	output(", you tell Ren to hang on - and try not to cum <i>too</i> much before you settle in on her.");

	output("\n\n<i>“Heh, no promises,”</i> she chuckles, swinging her arms around to grab your [pc.hips]. With her there to steady you, all you need do is rise on your [pc.knees] and guide Ren’s tapered crown to align with the eager opening of your [pc.vagOrAss]. The bubble of sloshing seed presses against your ");
	if(pc.hasVagina()) output("slit");
	else output("ring");
	output(", so bloated that you can’t quite get her prick inside on the first try. The bubble deforms and squeezes around your hole, but is so fat and full of cum that it takes Ren pulling you down on top of your own downward thrust to finally compact it enough that her lubed-up shaft can spread you open and push inside.");
	output("\n\nA moan forces its way out of your mouth as the girthy latex-wrapped shaft glides through your [pc.vagOrAss]. The cum-bubble only adds to your pleasure now, stretching you out like a knot before the slick shaft can glide in behind it. Ren’s talons dig fiercely into your [pc.butt], physically echoing the overwhelming pleasure she must be enduring. For your part, you can feel the latex sphere growing inside you, expanding as the over-sensitive - and clearly over-productive - halfbreed whore empties her balls to your ");
	if(pc.hasVagina()) output("pussy’s");
	else output("ass’s");
	output(" tender embrace. She’s got more cum in her than a kui-tan!");
	if(pc.hasVagina()) pc.cuntChange(0,400);
	else pc.buttChange(400);

	output("\n\nBy the time you’re back to resting your [pc.butt] in Ren’s lap, the bubble pressing against your ");
	if(!pc.hasVagina()) output("bowels");
	else output("womb");
	output(" feels like it’s fist-thick, and so hot that you’re forced to suck in a sharp breath as the straining latex caresses your sensitive inner flesh. The halfbreed’s chest heaves heavily as your muscles clench and squeeze her member, making those lustrous latexy breasts quiver and shake in ways so alluring that you can’t help but ");
	if(pc.hasCock()) output("grab the bottle of lube against, smear some into the voluminous valley of her cleavage, and thrust your [pc.cock] up between them.");
	else output("grab them both and squeeze until the dragoness squeals in delight, her broad nipples forming mountains that press into your palms.");
	output(" Ren laughs sweetly and brushes your cheek, encouraging you as much with her body as her alluring smile.");

	output("\n\nBetween the satiny touch of her chest and the throbbing heat of her erection inside you, Ren’s got you nice and worked up without even needing to move. No more of that! You lace your arms around her neck, giving yourself just enough leverage to start rising on her impaling girth. You both moan");
	if(pc.exhibitionism() < 33) output(", though you try to suppress your voice for fear of too much attention");
	output(", and her veiny cock sends shivers of bliss up your spiny as it grinds wetly against your inner walls.");

	var looseness:int = 0;
	if(pc.hasVagina()) looseness = pc.vaginas[0].looseness();
	else looseness = pc.ass.looseness();
	if(looseness <= 1) output("\n\n<i>“G-gah damn you’re tight!”</i> the halfbreed gasps, squeezing your ass in a vain attempt to keep you from moving so quick. <i>“Ah, I love it...”</i>");
	else if(looseness <= 3) output("\n\n<i>“Oh, I love your [pc.vagOrAss], cow[pc.boyGirl],”</i> Ren murmurs, squeezing your behind with loving firmness, guiding your motions. <i>“You’re the perfect size for me... just tight enough to make me cum and cum again.”</i>");
	else if(looseness <= 4) output("\n\n<i>“Don’t hold back,”</i> Ren gasps, rolling her head back with a lusty moan and submitting for the ride as you quicken your pace. <i>“I’m just sliding on through you, aren’t I? Hehe.”</i>");
	else output("\n\n<i>“Damn, cow[pc.boyGirl]!”</i> Ren laughs as you effortlessly rise and fall on her length, taking her and her swelling cum-knot in stride. <i>“Don’t think I’ve ever felt this small before... you sure I’m enough man for you?”</i>\n\nYou laugh and pinch her nipples, telling her that she’s absolutely <i>perfect</i>.");
	output(" Giving Ren a playful wink, you start to move a little faster, bouncing on her latexy pecker. You don’t dare take her too far out, for fear of never getting that cum-bubble back inside if it flops out! As it is, the thing is only getting bigger inside you, making your stomach bulge ever so slightly with the sheer size of her latex-bound ultra-creampie. The thought of all that seed flooding into your ");
	if(pc.hasVagina())
	{
		if(pc.isPregnant()) output("channel");
		else output("womb");
	}
	else output("bowels");
	output(" is so enticing, but the sheer mess that would make keeps you from trying anything cheeky with the integrity of Ren’s suit. Instead, you content yourself with the feeling of utter fullness she’s giving you.");
	output("\n\n<i>“Keep this up and you’re going to drain me dry,”</i> Ren laughs, though the way her cock’s spurting, you don’t think she’s joking.");
	output("\n\nYou grin and move just that much faster, very much so intent on making sure you milk every last drop from the hyper-active halfbreed before you join her in her constant orgasm. You’re already so close, driven to the edge by the veiny shaft buried so wonderfully deep inside you. Even through the veneer of latex, you can feel every bulge and curve in her alien cock, every throb and shiver of need that pulses through it. The way that bulbous, reptilian member grinds against your inner walls, ");
	if(!pc.hasVagina() && pc.hasCock()) output("hammering your prostate");
	else if(pc.hasVagina()) output("rubbing your g-spot");
	else output("teasing your tender behind");
	output(" with every thrust.");
	if(pc.hasCock()) output(" Not to mention that every buck of your hips slams your [pc.cock] into her lubed-up cleavage, making her big ol’ tits bounce in the most wonderful way!");
	output("\n\nFeeling you so close to the edge, Ren leans forward and presses her breasts to your [pc.chest]. <i>“Come on, don’t let me have all the fun. Let me feel you going wild on my cock");
	if(pc.hasCock()) output(" and blow that load you’re saving up right between my tits");
	output("!”</i>");
	output("\n\nShe wants it so bad! Then again, you can’t hold back much longer either.");
	output("\n\nWith a ");
	if(pc.exhibitionism() < 33) output("muted ");
	output("cry of pleasure, you let your restrain fade away in a rush of pleasure. Your [pc.vagOrAss] comes down hard around Ren’s deeply buried prick, milking the poor halfbreed even more");
	if(pc.hasCock()) output(", and your cock swells with a flood of [pc.cumNoun]. One more thrust and you erupt deep into her cleavage, smearing the purple latex [pc.cumColor]");
	output(". You both moan, letting your bodies join each other in primal ecstasy for that brief moment before all the tension slowly bleeds out, and you slump forward in Ren’s embrace.");
	output("\n\n<i>“Mmm, that was nice,”</i> the halfbreed murmurs, stroking your [pc.hair].");
	if(looseness <= 1) 
	{
		output(" <i>“I just hope you weren’t planning on leaving soon. Something tells me we’re not getting that cum-balloon out of your ");
		if(!pc.hasVagina()) output("bowels");
		else if(!pc.isPregnant()) output("womb");
		else output("channel");
		output(" until my suit’s absorbed a good bit of it.”</i>");
		output("\n\nYou gulp, realizing that with its sheer volume, Ren’s cum-filled suit is acting like a giant knot, tying you together from the inside. As if that bulbous shaft of hers wasn’t enough!");
		output("\n\n<i>“Easy, honey. You don’t pay by the hour,”</i> Ren purrs, urging you to rest against her. <i>“Just lay real still so I don’t cum any more, and let’s enjoy each other’s company, hmm? Unless you want me to bloat that belly of yours like a horny kui-tan on Throbb, that is.”</i>");
		output("\n\nYou smile, saying that sounds nice and all, but you’ve can’t exactly spend the rest of the day being Ren’s personal cum-dump.");
		output("\n\nShe sighs, pulling you close. <i>“Oh well. Maybe next time. Still, we’ve got a while to relax with each other...”</i>");
		output("\n\nThat’s true enough, you suppose. You don’t exactly have a choice, considering how full of spunk you are right now. You wrap your arms around Ren and nestle in, figuring you’ve earned the right to use those beautiful tits of hers as a pillow... right up until you feel her throb and spurt again.");
		output("\n\n<i>“S-sorry. Last one, I swear!”</i> she blushes, shivering with delight.");
		output("\n\nMaybe this is going to take longer than you thought...");
		processTime(35);
		pc.orgasm();
		clearMenu();
		addButton(0,"Next",suitKnottingPart2,true);
	}
	else
	{
		processTime(15);
		pc.orgasm();
		clearMenu();
		addButton(0,"Next",suitKnottingPart2);
	}
}

//[Next]
public function suitKnottingPart2(knotted:Boolean = false):void
{
	clearOutput();
	showTerensha();
	if(knotted) 
	{
		output("<b>Eventually....</b>\n\n");
		processTime(35);
	}
	output("<i>“Alright, hold tight. This cum-bubble’s gotta come out.”</i>");
	output("\n\nYou gulp and brace yourself as Ren works her girthy prick out, inch by inch. You gasp as the bloated bubble of boiling spunk she’s built up inside you starts to move, dragging inch by agonizing inch back through your spasming hole. When she finally wriggles it free, the balloon comes out with a wet squelch, popping out of your hole and immediately carrying Ren’s cock down between her legs with its sheer weight.");
	output("\n\n<i>“Woah, that’s a lot. You really did drain me to the last drop, didn’t you?”</i> she laughs, reaching down with both hands to cup her massive cum blob. <i>“Mmm, even with my suit absorbing it, I’m going to be hanging on to this mother-lode for a while. I’m practically wallowing in it already!”</i>");
	output("\n\nYou sigh heavily, finally free of the hole-straining cum-knot, and lean back against the table. Ren’s hands move over your body with affectionate tenderness, letting you take your time before you swing out of her lap and adjust your gear back into its proper place.");
	output("\n\n<i>“That was a heck of a ride, sweetheart,”</i> she murmurs, flopping her spunk-soaked shaft over one leg and letting it hang over the edge of her seat. <i>“I hope that earns me some repeat business... after I’ve popped a few pills to fill back up, at least.”</i>");
	output("\n\nYou chuckle and give one of her hefty breasts a squeeze through her suit, earning a substantial moan and a jump from her half-hard cock.");
	output("\n\n<i>“See you around, cow[pc.boyGirl],”</i> she moans, letting you go with a swat on the ass.");
	pc.exhibitionism(1);
	clearMenu();
	processTime(10);
	addButton(0,"Next",mainGameMenu);
}

//[Room Service]
//Pay Terensha to take you down to her room and give you intimate attention. Costs 100 Credits.
public function roomServiceFromRensa():void
{
	clearOutput();
	showTerensha();
	pc.credits -= 100;
	output("<i>“How about we head to your room?”</i> you suggest, eagerly eying her voluptuous form, and the ample chest resting on the table between you, quaking with every breath.");
	output("\n\n<i>“That... sounds like an excellent idea, cow[pc.boyGirl],”</i> Rem purrs, sliding out of the booth and giving you a full look at what you’re buying: a half-gryvain who’s so very curvy in all the right ways, with egg-bearing hips and lusciously thick thighs beneath the shadow of a thick reptilian member and a swinging set of plump balls - all wrapped up in a skin-tight layer of latex that leaves absolutely nothing to the imagination. And the way she’s standing, half-hard and smirking, you’re sure Ren wouldn’t have it any other way. Her pendulous breasts sway heavily as she leans over the booth, offering you a hand.");
	output("\n\nYou take it and follow her, trailing behind the swishing arcs of her tapered tail and swaying hips. A few other patrons gathered around Beth’s bar give you jealous looks, but you ");
	if(pc.isBimbo()) output("just give them a wink and a wiggle");
	else if(pc.exhibitionism() >= 66) output("just give them a victorious wink");
	else output("ignore them");
	output(" and let Ren guide you through a back door and down into the depths of Beth’s cathouse. A flight of steps takes you to a long, narrow hallway flanked by evenly-spaced rooms. One of them belongs to your reptilian partner, opening automatically as she approaches.");
	output("\n\n<i>“Just swipe your Codex on the panel there,”</i> she says, tapping a clawed finger on a digital readout next to the door, <i>“and we can get started.”</i>");
	output("\n\nYou do as she says, ");
	//first time in room:
	if(flags["RENSA_FUCKED"] == undefined) output("taking your Codex out and passing it over the reader. As you do, you note that it displays a small picture of Ren smiling shyly, taken long enough ago that her hair was less than shoulder length. Her name, Terensha de Sanna, is displayed in flickering blue holographics beside the title <i>“Free Contractor.”</i> The distraction passes when Ren’s meaty tail flicks across your thigh, drawing you in behind her.");
	else output("swiping your Codex and following her in.");
	output(" Your eyes are drawn inevitably to the plump, sashaying bottom in front of you, hugged tightly by glistening latex and jiggling alluringly with every long-legged step. Ren gives you a sultry smile over her shoulder, indicating the heart-shaped bed in the middle of the room with her tail. A night stand beside it is replete with bottles of colorful lube and several toys: alien-shaped dildoes, onaholes, and fat strings of vibrator beads. Everything a girl like her could need.");
	output("\n\n<i>“So, how do you want me?”</i> the halfbreed whore purrs, tracing a pair of fingers along the side of the bed. <i>“On top, or ");
	if(pc.hasCock()) output("are you gonna bend me over and pound me into this bed?”</i> she smirks, wiggling her inhumanly broad hips for you.");
	else output("would you rather take my big bad dragon for a ride?”</i> she smirks, shaking her hips in a way that makes her half-hard cock swing for you.");
	pc.lust(15);
	clearMenu();
	//[Missionary] [Pitch Anal] [Ride Cock] [Tail Fuck]
	if(pc.hasCock() || pc.hasHardLightEquipped()) addButton(0,"Missionary",missionaryWithRensa,undefined,"Missionary","Get Ren in bed for some nice slow pussy-fucking. Considering the size of her endowments, it wouldn’t be hard to get her to titfuck herself while you plow her.");
	//[Pitch Anal]
	if(pc.hasCock() || pc.hasHardLightEquipped()) addButton(1,"Pitch Anal",pitchAnalRensa,undefined,"Pitch Anal","Bend Ren over and pound her asshole. Considering her unique biology, there’s no doubt in your mind she’s going to empty those big, meaty balls of hers once you go to work.");
	//[Ride Cock]
	var bonusBlurb:String = "";
	if(pc.hasCock()) bonusBlurb = " while you fuck those big, jiggly tits of hers";
	//PC requires a pussy.
	if(pc.hasVagina()) addButton(2,"Ride Cock",rideRensasCock,undefined,"Ride Cock","Throw Ren on her back and ride her cock cowgirl style" + bonusBlurb + ".");
	//[Tail Fuck]
	if(pc.hasVagina()) bonusBlurb = " while she reams you out with her big, thick cock";
	addButton(3,"Tail Ride",tailPegStuffTimes,undefined,"Tail Ride","Bend on over and let Ren fuck you with that thick, prehensile tail of hers" + bonusBlurb + ".");
}

//[Missionary]
//Get Ren in bed for some nice slow pussy-fucking. Considering the size of her endowments, it wouldn’t be hard to get her to titfuck herself while you plow her.
//Cock or Strapon
public function missionaryWithRensa():void
{
	clearOutput();
	showTerensha();
	output("You don’t know about the bending over part, but Ren’s suggestion that you get her in bed and give her a good fucking sounds pretty damn apt about now. You stalk forward, drinking in her curvaceous, latex-clad body, tracing your gaze over the broad flares of her hips to the heavy G-cups sitting high on her chest, and down again to the drooping shaft of meat resting half-hard between her legs. Every slight jiggle or throb of her flesh is shown off in lustrous detail thanks to how tight her bodysuit hugs her form, so close to her skin that you can see the very veins on her cock and the individual rises in the rings of her nipples.");
	output("\n\nWith nary a conscious thought, you find yourself slipping close to her, wrapping your arms around her big hips and letting your hands settle on the soft latex of her ass. Ren smirks, letting your advance carry her backwards until she’s slipping onto the bed. Her legs spread around your [pc.hips], and her tail curls around your pack, starting to pull your gear off for you. You help it along, right up until the dexterous tip ");
	if(pc.hasCock()) output("finds its way to [pc.oneCock], wrapping around your hardening shaft");
	else output("pokes the activation button on the side of your panties, letting your hardlight shaft spring to light. You shudder as the sudden rush of new sensation washes over you, and again when Ren’s tail wraps itself around the glowing rod.");
	output(" Her gentle tail-grip draws you in, close enough that your [pc.knees] settle on the side of her bed, and she’s able to cross her ankles over your ass.");

	var x:int = -1;
	if(pc.hasCock())
	{
		x = pc.cockThatFits(600);
		if(x < 0) x = pc.smallestCockIndex();
	}
	output("\n\n<i>“All yours,”</i> she offers, using both hands to cup her fat ballsack, hefting the weighty orbs out of the way and showing off her pretty puss. You’re sure it must be her kaithrit side coming out, making the broad gulf of her twat seem so appealing, so easy to slide right into. There’s no evidence of a clit, just smooth, thick lips sitting in a puffy mound. Ren’s grip on you draws you in, even if your own mounting lusts didn’t demand you follow her; your hands grab the sheets on either side of her head, looming over her and letting the whore’s tail guide your [pc.cockOrStrapon " + x + "] towards her sex. The way her suit bends and stretches as your crown presses against it gives you just enough resistance to force you to use your [pc.legs], thrusting in hard.");
	output("\n\nRen’s breath catches, stifling a gasp of pleasure as your [pc.cockOrStrapon " + x + "] pushes in. The latex of her suit gives more easily after a moment, conforming like a condom both to your shape and that of Terensha’s pussy. And what a pussy it is: she makes up for lacking a clit on the outside with what feels like hundreds of small bumps ringing around every inch of her twat’s walls, grinding through the latex against your dick. Every one of them must be as sensitive as any clitoris could be, because you’ve barely sunk two inches of cockmeat into Ren’s quim before she cries out, arching her back and thrusting her sheathed prick into the air like a flagpole. The trip throbs, then bloats with a liquid bubble. You grin, watching her balls clench and contract, emptying into the crown of her suit. All that, and you’ve barely gotten started.");
	pc.cockChange();
	output("\n\n<i>“S-sorry,”</i> Ren laughs, rolling her head back and running her hands across her horns. <i>“Stupid suit. As if having a hundred clitties wasn’t enough on its own... what? Don’t stop on my account; I couldn’t get soft with you in me like this even if... even if I wanted to!”</i>");
	output("\n\nThe breathy gasps of pleasure that punctuate her words are enough of an invitation for you to keep thrusting, pushing nice and slow into the cavernous embrace of Ren’s sex. You’re almost sure she cums again before you’ve got ");
	if(x >= 0) output("every inch");
	else output("as much cock as you can");
	output(" inside her, and she <i>definitely</i> shudders and spurts when you saw your rigid prick back out again. Her twat clenches and grips at your [pc.cockOrStrapon " + x + "], desperately trying to draw you back in even as its owner cums her brains out from the overwhelming stimulation.");
	output("\n\nYou can’t even begin to imagine what a hundred too-tender clits all firing off at once must be like, but it’s clearly enough to leave Terensha a gasping, panting, leaking mess. The sheer weight of the cum-balloon forming at the peak of her prick grows so great that her cock ends up teetering like a half-cut tree before flopping heavily down on her belly. The balloon almost boops her on the nose, and the shaft finds itself nestling right into the valley of her hefty cleavage.");
	output("\n\nNow <b>that</b> gives you an idea...");
	output("\n\nReaching forward, you grab Ren’s nipples in either hand and give them a playful pinch and pulling them together. The halfbreed gasps and squirms, but considering how big and soft her tits are, it isn’t hard to pin the two stiff peaks together and trap her cock in a jiggling latex embrace. Grinning at the pleasured gasps and cries you’re eliciting from your lover, you shift your grip to sink your fingers into her breasts, squeezing them together and reciprocating your thrusts through them, jerking her turgid meat between the two mammoth mounds.");
	output("\n\n<i>“Toomuchtoomuch,”</i> Ren starts babbling, squirming desperately yet firmly trapped between your [pc.cockOrStrapon " + x + "] and your groping hands. All she can do is thrash her tail ");
	if(pc.legCount > 1) output("between your legs");
	else output("around your [pc.hips]");
	output(" and dig those claws of hers into the sheets, desperate for some purchase to steady herself.");

	output("\n\nShe finds none, and before long her spunk-bubble is swelling past the grip of her cleavage, making up the distance between her crown and the dragon-babe’s green lips. You laugh and thrust a little harder, each meaty connection between your thighs making the bubble balloon a little more, swelling like a melon with all of your partner’s wasted seed.");

	output("\n\nSometime between your steady, deep thrusts, Terensha finally realizes the mess she’s making inside her suit. Though she’s half insensate from the fucking already, she manages just enough willpower to lean in and wrap her lips around the latex bulb. For a second, you think she’s actually trying to deepthroat herself... right up until you hear a faint rip, and the bubble starts shrinking. Ren grins, spits out a tiny shred of purple latex, and grabs her rod in both hands. Her bloated suit acts like an impromptu straw, funneling all of her warm gryvain-cream right into her mouth so fast that her cheeks bulge between deep gulps, and she’s sure to punctuate every swallow with a contented sigh. Clearly, Ren likes her own flavor!");

	output("\n\nWatching Ren gargle her own spunk gives you all the stimulation you need to come crashing over the edge - nevermind the way her alien-textured twat so lovingly caresses your [pc.cockOrStrapon " + x + "], or the way her curvaceous body jiggles and quakes with every thrust, drawing you deeper into her with every quiver of those succulent, heavy breasts.");

	//if strapon:
	if(x < 0)
	{
		output("\n\nYour hardlight cock shoots back a cascading sense of ecstasy, flooding through your like lightning and leaving you breathless, panting. It’s all you can do not to just collapse as the glistening toy sends shockwaves through your crotch! Ren notices immediately and pulls you down, burying your head between her breasts and clenching down around your shaft, using her hips to ride you through the shuddering climax.");
	}
	//if low-med cum:
	else if(pc.cumQ() < 1500) output("\n\nYour cock throbs powerfully, clenching from [pc.cockHead] to base before a rush of heat glides through you. Completely on instinct, your grip on Ren’s breasts tightens, and your [pc.hips] slam themselves against her up-raised ass, driving your cock deep into her latex quim before unloading a wad of steaming hot seed into her womb.");
	//if hugecum:
	else output("\n\nYou’re already leaking some much pre into the slick latex channel that it feels more like a floodgate slowly opening than a normal mortal’s orgasm. You grip Ren as fiercely as you can, thrusting deep into her whorish depths before the full force of the geyser hits. The sheer force of your ejaculate is enough to distend her bodysuit, pushing it deeper into her womb and bloating it out even worse than her own balloon-tipped prick, filling her belly with hot seed. She grows the more you pump into her, her belly distending around your godly orgasm until she looks positively pregnant.");

	if(x >= 0)
	{
		//if knot:
		if(pc.hasKnot(x))
		{
			output("\n\nAs your cock fires off shot after shot of cum into Ren’s quim, you follow through with your [pc.knot " + x + "], determined to make sure the lusty halfbreed keeps every drop inside until you’re well and truly done with her. You hammer your [pc.hips] forward, finding her pussylips nice and stretchy, kissing your bulbous bitch-breaker until you can force it through and into the nubby clutches of her cunt’s walls. Ren shrieks with pleasure as you tie her, throwing her head back and shamelessly giving voice to her own explosive orgasm. With the hole in her suit already, she’s quickly plastered with cum, splattering her breasts and neck until she’s wearing a messy, glistening pearl necklace.");
		}
		else output("\n\nYou find yourself wearily leaning over Ren, supporting yourself on your elbows and gasping for breath as your orgasm slowly subsides, leaving you buried in her gripping quim and your face pressed against one of her quaking G-cups. Terensha moans and spralws out on the bed, amicably wrapping her arms around your shoulders and pulling you flush against herself. The sudden motion makes your [pc.cockOrStrapon " + x + "] glide out of her cum-lubed latex cunt, drooping between your [pc.legs].");
	}
	else output("\n\nYou find yourself wearily leaning over Ren, supporting yourself on your elbows and gasping for breath as your orgasm slowly subsides, leaving you buried in her gripping quim and your face pressed against one of her quaking G-cups. Terensha moans and spralws out on the bed, amicably wrapping her arms around your shoulders and pulling you flush against herself. The sudden motion makes your [pc.cockOrStrapon " + x + "] glide out of her cum-lubed latex cunt, drooping between your [pc.legs].");
	output("\n\nWith a little guidance from Ren, you find yourself crawling into the bed overtop her, nestling into the pillowy softness of her breasts. Her arms and tail wrap around you with surprising tenderness, hugging you as both your bodies tingle with the aftershocks.");
	output("\n\n<i>“Remind me to thank my mother for a pussy like that,”</i> Ren breathes");
	if( x>= 0) output(", slowly leaking [pc.cum] down her thigh while her bodysuit reforms itself");
	else output(", shivering while her bodysuit regains its normal shape in your strapon’s absence");
	output(". <i>“I just about blacked out, that felt so good...”</i>");

	output("\n\nConsidering how many times she came, you’re not sure she’s kidding.");

	output("\n\n<i>“Wouldn’t be the first time I got fucked unconscious. C’mere,”</i> she teases, scooting back on the bed so she rest her head on the pillows, and taking you with her. <i>“How about you stay a while while I get my breath back, hmm? Just to make sure I’m okay.”</i>");
	output("\n\nLeave it to you to find the one girl for hire that likes the cuddle afterwards. Still, you could use a moment yourself, after getting milked that hard. You shift a bit so that you’re resting on your side, head nesting into a lush boob and arm around a soft belly, feeling every one of her slowing breaths.");
	output("\n\nDoesn’t take long before your eyes grow heavy, and time slips away...");
	processTime(33);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",roomServiceOutroCrap);
}

//[Pitch Anal]
//Bend Ren over and pound her asshole. Considering her unique biology, there’s no doubt in your mind she’s going to empty those big, meaty balls of hers once you go to work.
//Cock or Strapon
public function pitchAnalRensa():void
{
	clearOutput();
	showTerensha();
	var x:int = -1;
	if(pc.hasCock())
	{
		x = pc.cockThatFits(600);
		if(x < 0) x = pc.smallestCockIndex();
	}
	output("You practically lick your lips when Ren suggests bending her over, but the shake of her broad, egg-bearing hips... that cements your desires in your mind. Slipping up to the latex-wrapped wanton, you wrap your hands around those hartman’s of hers and give a little push towards the bed. Your fingers dig into the skin-tight material, sinking into her plush behind until Ren’s breath catches in her throat, and her thick prick thumps meatily against your thigh.");
	output("\n\n<i>“Oh, your mind goes right to what you want,”</i> she purrs, letting her hands settle on your shoulders. Just a touch of pressure makes her step back, sashaying her hips in your arms and lowering herself back on the bed. Ren’s reptilian tail coils up at you like a come-hither crook of her finger. Her legs spread and she lifts up her package, pinning the stiff pillar of latex-sheathed meat to her belly with one hand and hefting up her fat balls with the other, giving you a perfect look at her sex. Her dark bodysuit is so sheer and tight to her skin that you can see the lips of her sex, separated by a wide gulf that seems to sink into her body. And, of course, her asshole winks at you, so tightly held by the suit that you’re sure you could slip a finger in with no trouble at all.");
	output("\n\n<i>“Found something you like?”</i> she purrs, coiling her sinuous tail around a leg and pressing the slender tip against her dark star. The suit stretches as easily as a condom, hugging her scaly tail as the slender tip probes into her ass. Ren moans, and her dick throbs immediately, jumping to attention the moment something gets anywhere near her back door’s hidden g-spot.");
	output("\n\nThe show turns you on even more than the suggestions she’d whispered, ");
	if(x >= 0) output("getting your [pc.cock " + x + "] so hard it hurts");
	else output("getting you desperate enough to start fumbling for your panties’ switch, letting your hardlight member spring to life");
	output(". You toss the rest of your gear and stalk towards her, rubbing your erection and eagerly eying the dragon babe’s lush behind.");

	output("\n\nBefore you can get it out of the way yourself, Ren’s tail pops out of her ass, letting the latex suit slowly tighten back up in its wake. <i>“You’re ");
	if(x < 0) output("a little");
	else if(pc.cocks[x].thickness() < 2) output(" a little");
	else if(pc.cocks[x].thickness() < 4) output(" a lot");
	else output(" a whole heck of a lot");
	output(" thicker than my tail, cow[pc.boyGirl],”</i> she smirks. Her tail flicks over to the sexy arrangement of bottles and toys on her nightstand, and she adds, <i>“Why don’t you pick out a lube and get me ready first?”</i>");

	output("\n\nWhile you turn your attention to the selection on hand, Ren twists around onto her hands and knees and crawls up the heart-shaped bed. Her arms come to rest on the curvy headboard, making sure to leave her breasts where they can sway for you later, and nestles her chin into her hands, watching you with a playful smile. You make your choice in a hurry");
	//hugedick + Kiro fucked: 
	if(pc.cocks[x].thickness >= 4 && flags["MET_KIRO"] != undefined) output(", happy to find some of the same elasticizing lube Kiro uses on hand,");
	output(" and mount the bed after her. Ren’s tail curls up her back, getting out of the way of your unrestricted access to the hermaphroditic whore’s backside. She gives you an enticing wiggle, making her full cheeks jiggle - and letting the hefty pillar of meat between her legs sway.");

	output("\n\nYou’re not interested in that for now, though. Your gaze is firmly fixes on the full, soft cheeks of Terensha’s ass. The way the latex hugs her skin makes her seem almost doll-like, too perfectly sculpted to be real. When you sink your fingers into it, though, her ass yields to your touch, soft and pliant, readily pulled open to reveal her twinned holes. You squirt a generous load of lube directly into the cleft between her cheeks, eliciting a gasp from the whorish halfbreed and making her ass wink at you as the lube splatters across it.");

	output("\n\nYou leave one hand to spread her ass open, using the other to massage the lube around. First a finger gently probes her hole, getting a kiss from Ren’s dark star before disappearing to the first knuckle. Your partner gasps, then moans, then shivers as her cock throbs. A small bubble forms in the latex near her crown, flooding with pre you’re milking out. The sight prompts you to start feeling around inside her - spreading lube all around her inner walls as you do - in search of a little bulb to tease. Instead, you soon feel out several places where her ass seems to buckle under something full and weighty. Every time you press one, Ren’s cock jumps and squirts inside her suit, making her arch her back and moan like the whore she is.");

	if(flags["RENSA_FUCKED"] == undefined) 
	{
		output("\n\n<i>“I’m still half gryvain, after all,”</i> she murmurs, reaching a hand between her legs to stroke herself. <i>“Balls on the outside, more sacks inside... just in case I ever need to cum a few gallons, I guess.”</i>");
	}
	output("\n\nRen giggles, squeezing back down around your probing digit until you’re buried to the hilt, pumping her ass with as much lube as she’ll take. Once you’re satisfied, you start using your other fingers to massage the rest of the slick lube around her crack and cheeks, giving Ren’s behind a glistening sheen before you’re done.");
	output("\n\n<i>“Mmm, talented fingers,”</i> she purrs, brushing her tail across your cheek. <i>“Keep teasing me and I’m gonna cum before you even get the crown in!”</i>");
	output("\n\nYou’d like to see that, and tell her as much with your hands, kneading her plump rump and brushing your fingertips across her pussy and ass. A few moments of that, and Ren’s tail curls around your shoulders, pulling you close. She moans and thrusts her hips back against you, pressing her broad behind against your [pc.cockOrStrapon " + x + "] and trapping it between her cheeks. Thanks to all the lube you slathered her ass with, she’s able to effortlessly grind up and down on your rigid shaft, giving almost as good as she’s getting - but with your prick gliding between her pussylips, hands still working her over... she still hits her peak first.");
	output("\n\nWith a gasp, Ren slams her hips back against you, almost enough to knock you back, and pulls you so tight against her with her tail that you can barely breathe. But that only lasts a moment, and she comes down off her climax with a heavy sigh and a fat bubble of seed bloating the crown of her wrapped cock. By the time she relaxes her grip on you, the head of her cock looks like it’s grown an apple on its tip, swaying heavily with every breath.");
	output("\n\nRen groans a breathy <i>“Fuck!”</i> and plants her brow in her hands, breathing hard. <i>“I can’t even go soft with this suit on. Urgh, it feels like I’m ready to cum again already!”</i>");
	output("\n\nYou just grin, using two fingers to push down the crown of your [pc.cockOrStrapon " + x + "] until its pressing into the tight ring of her ass. Ren’s cock jumps at the slightest bit of pressure, but her asshole is so stuffed with lube that it opens like a lover’s mouth, eagerly inviting your cockhead in and gripping it with all the sultry firmness her latex-clad body can muster.");
	output("\n\nA full body shudder rocks through you as your [pc.cockOrStrapon " + x + "] is wrapped inside Ren’s tight hole, gripped by slicked-up latex and pushing hard against the stretchy tip. Her suit is elastic, but not so much so that it doesn’t resist you stretching it deep into its wearer’s ass. So for now, you’re forced to take it slow, easing yourself inside inch by vice-tight inch. Terensha’s breath comes husky and ragged as you progress, her back and tail both arching for you.");
	output("\n\nBy the time you");
	if(pc.cockVolume(x) >= 600 && pc.hasCock()) output("’ve buried yourself to the hilt in Ren’s plush behind");
	else output(" have Ren so stuffed with cock that her belly bulges, completely incapable of taking any more of your mammoth member");
	output(", she’s a panting, gasping mess. The cum-bubble swaying under her is half as big as one of her hefty G-cups, bobbing the same way her tits are with every husky breath. Her ass twitches around your length, probably to the same beat of her ejaculation, since it doesn’t look like she’s stopping any time while your cock is spearing her ass open and putting all that pressure on her extra cum-sacks.");
	pc.cockChange();
	output("\n\nYou give her a moment to get adjusted, or at least stop squeezing around your dick so hard that you can barely move; just gently rock your [pc.hips] against her ass until she finally manages to relax a little bit. But just a little - where’s the fun otherwise?");
	output("\n\nAs soon as you can move again, you shift your hands forward, grabbing one of Ren’s huge boobs in each and using them as leverage to pull out to the tip. The latex squeaks, drooling lube back around your shaft and starting to tighten up again - right up until you thrust back in at full force, ");
	if(pc.cockVolume(x) < 600 || x < 0) output("hilting yourself back where you belong");
	else output("filling up Ren’s bowels with every inch of cock her whorish body can take");
	output(". She screams with pleasure, body bucking forward with the force of your hips ramming into her butt, but your handholds on her tits keeps her right where you want her.");

	output("\n\nRen’s ass is so plush and bouncy that you all but recoil off her, sliding back until her tail’s death-grip around your shoulders pulls you back in again. Between her bouncy butt, tight tail-grip, and your own growing lusts, you quickly work up to a fierce pace of pounding Ren’s asshole. You take her fast and hard - hard enough for your hips to shove her up against the wall over the headboard, and her breasts start bouncing the moment you let them go. With your hands freed up to pinch her nipples or slap her ass between thrusts, adding just that much more to her pleasure.");
	output("\n\nYou can only imagine how big the spunk-bubble between Ren’s legs is getting now that you’re absolutely hammering her ass. More and more urgently, though, your mind turns to thinking about how she’s going to look with a load of [pc.cumColor] seed pouring out of her well-fucked ass. You’re getting close to finding out");
	if(x >= 0 && pc.hasKnot(x)) output(", though you’re damn well going to pack that cum in there for a while, if your [pc.knot " + x + "] has anything to say about it!");
	else output(", which makes you hammer that ass even harder!");

	//if knot:
	if(x >= 0 && pc.hasKnot(x)) 
	{
		output("\n\n<i>“O-oh stars,”</i> Ren gasps as the meaty bulb at the base of your [pc.cock " + x + "] starts hammering against her straining ring. <i>“Come on, that’s just overkill!”</i>");
		output("\n\nGrinning, you sink both hands into her latex ass and ask if she doesn’t want it.");
		output("\n\nShe answers with a grunt of annoyance - and then bucks her hips back against your shaft, driving the first half of your [pc.knot " + x + "] into her ring. She screams with pleasure, stretched so wide open and forces to empty all those internal balls of hers to make room for your bitch-breaker. The rest of the work’s left to you, though, and you end up squirting more lube onto your pulsing tie until your [pc.hips] can finally push it through, sinking the bulky knot into Ren’s hole full force.");
		output("\n\nThe impacts sends both of you over the edge together, letting your voices create a chorus of sensual moans and cries that echo off the bulkheads. The cum-balloon underneath your hired lover grows and grows, making her look like she’s got a hugely pregnant belly the way it’s trapped under her body, spreading out around her arms and knees ");
		if(pc.cumQ() >= 5000) output("- and your own monstrous load just makes it worse, flooding her bowels with so much cum that her body has no choice but to distend. Your knot simply leaves it with nowhere else to go");
		output(". A shiver works through your as your body unloads, flooding Ren’s bass with [pc.cumNoun] until your [pc.balls] ache");
		if(pc.balls <= 1) output("s");
		output(", and she’s gasping with pleasure at being filled so completely.");
		output("\n\nWhen your orgasm finally winds down, you’re left gasping, clinging onto Ren’s hips and weakly grinding yours against her full behind. Between ragged breaths, you reach up and stroke Ren’s colorful hair, asking how she liked it. The only answer you get is an insensate murmur and a random spasm from her anal muscle as her spunk-bloated suit gets a little bit fuller. A gentle push gets her on her side, letting you wrap your arms around her husky frame and get comfortable. It’s going to be a while before you’re getting out of her, no matter how much lube you use...");
		processTime(125);
	}
	//No knot:
	else
	{
		output("\n\nYou keep thrusting, grabbing Ren’s hips to steady yourself as orgasm swells inside you. There’s no need to worry about your partner’s pleasure - she’s got to be wallowing in the sheer volume of her own orgasm, swinging a bowling ball of juices from the tip of her tapered dick - so you’re free to concentrate completely on your own enjoyment, using her backside like the slick onahole you’ve made of it. ");
		if(x >= 0) output("It isn’t long before your [pc.cock " + x + "] swells with seed, going as turgid as titanium for a brief second before spilling out a mighty load into Terensha’s ass");
		else output("A few more thrusts and your strapon starts positively buzzing, feedback so much tactile bliss into your body that an orgasm builds up and shudders through you");
		output(". You end up slamming yourself deep into her as your climax swells and passes, fucking her senseless before you’re well and truly done.");
		output("\n\nWhen your orgasm finally winds down, you’re left gasping, clinging onto Ren’s hips and weakly grinding yours against her full behind. Between ragged breaths, you reach up and stroke Ren’s colorful hair, asking how she liked it.");
		output("\n\n<i>“Liked it?”</i> she moans. Her ass shudders around your [pc.cockOrStrapon " + x + "], mirroring another release into her growing cum-balloon. <i>“I <b>loved</b> it, cow[pc.boyGirl]. I don’t think I’ve ever felt so drained... and that’s saying something.”</i>");

		output("\n\nYou laugh and ease yourself back, dragging your [pc.cockOrStrapon " + x + "] back through her abused channel before popping out. ");
		if(x < 0) output("You deactivate your strapon, more than satisfied with its performance.");
		else if(pc.cumQ() < 10) output("In the wake of your exit, a tiny trickle of [pc.cumColor] squirts out as Ren’s suit begins to tighten up again, extracting itself from her ass and leaving your orgasmic juices sliding thickly down her thigh.");
		else if(pc.cumQ() < 5000) output("A flood of [pc.cumNoun] follows you out, squirting around your [pc.cock " + x + "] and drooling in thick rivers down Ren’s thighs. She curses and shivers, reaching a hand back around and running two fingers between her cheeks to wipe some of your juicy load away... and right into her mouth. <i>“Delicious,”</i> she purrs, giving you a wink and shivering as her suit finally reforms, depositing the rest of your load on the bed.");
		else 
		{
			output("<i>“Oh... oh wow,”</i> Ren murmurs, wiggling her hips... which makes her bloated belly jiggle heavily, sloshing around with your monstrous load. Her tail moves in a flash, jamming itself right up her own ass before more than a few droplets can escape. She gasps and cums again herself, but the move buys her enough time to reach over to her nightstand and grab one of the toys off it: a fist-thick buttplug, which she hands to you.");
			output("\n\n<i>“Can’t have a bellyfull like this go to waste,”</i> she purrs, wiggling her hips again. <i>“Screw work, I’m gonna just lie here and enjoy this for a while.”</i>");
			output("\n\nYou take the hint and lube the plug up, replacing her tail with it to cap off your inhuman orgasm’s escape. The toy sinks into her slick suit down to the hilt, leaving nothing but an orange cap and a finger-ring peeking out.");
			output("\n\n<i>“Look at me,”</i> your lover groans, shifting up onto her knees. She looks almost nine months pregnant, her belly sloshing heavily from one side to the other as she moves. And, of course, her cockhead is capped with a watermelon-sized ball of her own spunk, weighing down her rock-hard member so it dangles between her legs and rests its own load on the bed. The proud owner of these two huge loads of cum can barely speak, she’s panting so hard from your rough ass-fucking, but she’s more than capable of showing off her inflated body for you, urging you to get your hands on her cum-swollen gut.");
			output("\n\nWhen you do, her tail circles around and pulls you close, trapping the latex bloat between your bodies. <i>“Wanna keep me company for a bit? My suit’ll recycle if eventually, but I’m... I’m going to enjoy every second while it lasts.”</i>");
			output("\n\nYou just can’t say no to that.");
		}
		//All non-huge cum/non knots combine:
		if(pc.cumQ() < 5000)
		{
			output("\n\nTerensha sighs heavily, rolling onto her back and resting her head in her hands. <i>“I’m looking forward to next time, cow[pc.boyGirl],”</i> she murmurs. <i>“C’mon, snuggle up for a while? It’s not like I can walk back onto the floor any time soon anyway, the way you just destroyed my ass. Time’s free, and for you: so are cuddles and boob-pillows.”</i>");
			output("\n\nWell, that’s one offer that’s hard to turn down, especially with how exhausted that rough ass-play’s left you. You give her a smile and crawl up beside her, taking full advantage of those huge, soft G-cups of hers and nestling your head into her cleavage.");
			output("\n\n<i>“There we go,”</i> she whispers, curling her tail around ");
			if(pc.tailCount > 0) output("yours");
			else output("your [pc.leg]");
			output(". You feel a kiss on the top of your head, then hands brushing your [pc.hair]. With that kind of tender attention, it isn’t hard to let your focus wander, and to sink into mindless enjoyment while it lasts...");
		}
		processTime(35);
	}
	var cumflated:Boolean = false;
	if(x >= 0 && pc.cumQ() >= 5000) cumflated = true;
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",roomServiceOutroCrap,cumflated);
}

//[Ride Cock]
//Throw Ren on her back and ride her cock cowgirl style {if Cock: while you fuck those big, jiggly tits of hers}.
//PC requires a pussy.
public function rideRensasCock():void
{
	clearOutput();
	showTerensha();
	var x:int = rand(pc.totalVaginas());
	output("Smiling lustily, you slip up behind Terensha and sink your fingers into her latex-covered behind, making her gasp with delight. <i>“Why don’t you get on the bed for me,”</i> you whisper in her ear, giving her a gentle push forward. Her darkly wrapped cock springs to attention at your touch, and her tail swishes quickly as you give your command. The dragon-girl saunters over to the bed and crawls onto it, lifting her tail and wiggling her meaty behind at you until you follow her in and roll her onto her back. She giggles and jiggles, letting you put her right where you want her with her legs splayed and prick bobbing in the air, swaying in front of her like a flagpole in the wind.");
	output("\n\n<i>“All yours, cow[pc.boyGirl],”</i> she murmurs, running a single finger along the fleshy underside of her shaft, an invitation to climb on and enjoy the fruits of your purchase.");
	output("\n\nGrinning, you toss your gear aside, letting it pile up on the bedside before crawling in after her. A moment later and your [pc.legs] are straddling Ren’s egg-bearing hips, spreading you nice and wide so close to her prick that the latex-wrapped shaft is spreading the lips of your [pc.cunt " + x + "], nestling its knot-like bulbs between your labia. She shivers with sensation, rolling her head back and moaning until her horns scrape the headboard while you position yourself overtop her. You reach down and run your hand along her length, nestling it into the gulf between your [pc.legs] and starting to grind your [pc.hips] around on it. Your sex burns with desire, hungry to feel the half-gryvain’s veiny shaft sliding inside it, stretching you apart on those meaty bands of curvaceous flesh.");
	output("\n\nWhile your hands play with the girl’s cock, you feel her tighten in your grasp, and her breath quickens. You don’t have time to react before Ren gasps, fingers digging into the bedsheets, and the flesh-hugging latex at the tip of her rod suddenly expands, growing out like a balloon the size of your thumbnail and jiggling weightily. You grin ear to ear as the halfbreed’s spunk quivers in the tight confines between her tapered crown and her latex bodysuit, ever so gently grinding against your [pc.clits] and sending an electric, buzzing pleasure through you.");
	output("\n\nRen gives you an apologetic look, but the way her fat sack and still-hard cock throb in your grasp tells you that her momentary lapse hasn’t stopped her enjoyment of your attentions. You give her churning sack an affectionate pat and rock your hips forward, aligning her crown with the needy lips of your [pc.cunt " + x + "]. Locking eyes with Terensha, you slowly drop down on her turgid rod.");
	output("\n\nAn explosion of searing pleasure erupts from your sex as the first inches of slick gryvain cock slide inside you. She’s so slick and smooth, still wrapped up in that suit of hers, that your feminine excitement lets her just glide right into your fuck-hungry quim. Ren moans openly, arching her back beneath you and cumming again, her rod throbbing and pulsing hotly inside you.");
	output("\n\n");
	//1st time fucked:
	if(flags["RENSA_FUCKED"] == undefined) output("<i>“S-sorry,”</i> Ren grins, biting her lip to keep from crying out as you slowly take her curvaceous length. <i>“The suit makes this... a whole lot better. Don’t worry though, being part gryvain means I’m not getting soft any time soon. Ride me till I’m dry if you want!”</i>");
	else output("<i>“Still as much of a quick shot as ever,”</i> Ren giggles. She gives a little gasp as your hole swallows another of her bulbous crests, almost taking her to the hilt - and making her cum again! <i>“You’re gonna drain me dry again, aren’t you? Not that I’m complaining...”</i>");
	output("\n\nYou grin as your [pc.cunt " + x + "] swallows her last inch of cockflesh, feeling her stretch you out so wonderfully deep inside. Oh yeah. You assure her you’re going to do just that.");
	pc.cuntChange(x,100);
	output("\n\nA moment passes in silent enjoyment for the both of you, feeling the sheer size and girth inside you, before you start to really get into it. Locking eyes with the lustful halfbreed whore, you reach up and grab her by the horns, using the curling protrusions like handlebars to steady yourself as your hips start to move again. Slowly, steadily, taking as long as you want to enjoy the sensations, you start to rise and fall on Ren’s thick pride. Smiling up at you, Ren puts her hands on yours and pumps her own hips up to meet yours, slapping them against your bouncing butt. You squeal with delight, feeling her alien prick spreading you wide and deep, over and over.");
	output("\n\nThe bubble of spunk crowning Ren’s cock starts to grow, rubbing wonderfully against your inner depths - and hotly, too. Hotter than any human’s cum could ever be, making you flush darkly both on your cheeks and sex. Feeling her swell inside you makes your body convulse in pleasure, drooling your excitement down her latex-wrapped shaft. Ren gasps, moans, and cums again, making that deliciously thick bubble inside you all the more massive. Though you can’t see it, just feeling it makes you think it’s got to be almost as thick as your fist about now... and getting that big, jiggly weight thrust into you with every motion makes your heart hammer in your chest.");
	output("\n\n<i>“Think you could move a little faster?”</i> Ren teases between upward thrusts. <i>“Unless you want to be knotted on my cum-bubble all day...”</i>");
	output("\n\nYou answer her prodding with a wink and a pinch of a latexed-up nipple. She gasps, spurting inside you again. <i>“I know for a fact I can cum just from you playing with ‘em,”</i> Ren laughs, biting her lip when you sink your fingers into those heavy G-cups of hers. The twin mounds quiver in your grasp, and their broad peaks stiffen pleasantly against your palms, rubbing the slick material they’re bound beneath against your [pc.skinFurScales].");
	output("\n\nShe wasn’t kidding about getting tied, though. The more you ride her cock and tease her tits, the more pressure you feel building up inside you, pressing feverishly against your womb. One of your hands traces down to your [pc.belly], feeling the [pc.skin] there tighten ever so slightly as your body stretches to accept Ren’s cummy girth. The halfbreed doesn’t show any sign of slowing down with the way her fat sack churns between your [pc.legs], but you’re more than content to take every sweet drop of cream she has to offer.");
	output("\n\n<i>“Keep this up and you’re going to end up looking ");
	if(pc.bellyRating() < 20) output("positively");
	else output("way more");
	output(" pregnant,”</i> Ren smirks, putting a hand on your [pc.belly] and another on your [pc.hips], guiding you to move faster. <i>“You’d probably like that, wouldn’t you?”</i>");

	output("\n\nIf that could make the stretching feeling in your womb any better... absolutely. Your mind floods with images of your body made gravid by the gryvain-girl’s ejaculate, sloshing around with a belly full of warm, musky seed. So you move faster and more urgently, bouncing on Ren’s turgid spear with feverish speed. She moans and writhes underneath you, consumed by pleasure until she can’t even form words - just formless moans of orgasmic ecstasy. The cummy knot in your elly only grows thicker, stimulating your inner walls in ever more exciting ways.");

	output("\n\nBetween the grinding movements of the spunk-bubble inside your [pc.cunt " + x + "] and the feeling of her veiny, throbbing shaft gliding through your slit, you too are locked in a cascade of sensation. Pressure builds like wildfire in your loins, a throbbing heat radiating from your pussy. Your juices glaze the latex wrapping around Ren’s sex, smearing lewdly across her thighs and groin, even onto the hefty orbs of her balls.");
	if(pc.hasCock())
	{
		output(" [pc.EachCock] bounces weightily on her curvy belly, at first smearing Ren’s suit with milky streams of [pc.cumColor] pre, and then erupting in a massive squirt that splatters the underside of Ren’s tits.");
	}
	output(" You gasp as climax shudders through you, focused on your clenching, vice-gripped twat and the immense pressure inside you.");

	output("\n\nRen’s hands grab you tight. steadying you atop her as you join her in orgasm. Your [pc.cunt " + x + "] milks her dick even harder now, making Ren arch her back and cry out - and draining so much roiling spunk out of her tapered crown that you’re sure you can feel your [pc.belly] growing around it. It’s all you can do to keep bucking your hips, riding that girthy rod of hers until the waves of passion finally settle in your stomach. Settle around a thick, sloshing bubble of liquid heat, that is.");
	output("\n\nYou moan and cup your hands under your strained belly, feeling the radiant warmth from inside. Oh, that’s nice.");
	output("\n\n<i>“Unf. I feel practically hollow after that, cow[pc.boyGirl],”</i> Ren sighs, flopping her head back on the pillow and planting her hands on your [pc.hips]. You can’t imagine why: it’s not like you’ve got a gallon of spunk stretching out your womb. You try and move off of Ren’s cock, but find yourself unable to move more than an inch or two - her thick bulb of spunk is too big to fit through your lips again!");
	output("\n\n<i>“Uh,”</i> you start to say, fidgeting awkwardly around the latex knot inside you.");
	output("\n\nRen laughs and pulls you down, nestling your face between those glorious tits of hers. <i>“Don’t worry, you’re not paying by the hour. Just get comfortable while my suit starts recycling all that yummy cum for you.”</i>");
	output("\n\nYou suppose you can’t argue with that, especially with your cheeks trapped between two soft, latex-wrapped mounds");
	if(pc.hasCock()) output(" - even if you’re getting a mighty whiff of your own [pc.cumNoun]");
	output(". You smirk and settle in for the long, pleasant deflation...");
	processTime(33);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",roomServiceOutroCrap);
}

//[Tail Fuck]
//Bend on over and let Ren fuck you with that thick, prehensile tail of hers {if Pussy: while she reams you out with her big, thick cock}.
//Note to self: Tail goes in [pc.vagOrAss]. If the PC has a pussy, she’ll tail fuck that and pound your ass with her cock; if only an asshole is present, she’ll tail-fuck you and hot-dog your butt.
public function tailPegStuffTimes():void
{
	clearOutput();
	showTerensha();
	output("You can’t take your eyes off Ren’s body: the lush, thick curves and rigid masculinity that combine into her delectable, hermaphroditic form. But something else catches your eye, too: the way her tail coils and twists behind her with serpentine grace. Prehensile, tapered to a fine point, and yet growing to a glorious thickness the further you go. An involuntary shudder runs through you until you ");
	if(!pc.isNude()) output("pull off your clothes");
	else output("chuck your gear aside");
	output(" and saunter over to the bed.");

	var x:int = rand(pc.totalVaginas());
	if(!pc.hasVagina()) x = -1;
	output("\n\nRen gives your [pc.butt] a firm slap, just hard enough to make your stumble and grab the edge of the bed, unintentionally presenting your [pc.asshole]. <i>“Guess that answers that,”</i> she murmurs, squeezing one of your cheeks. You crawl forward, nestling your head in the pillows and keeping your ass in the air, wiggling it enticingly for the well-endowed dragon-babe. One look over your shoulder shows her hard as a rock, idly stroking her thick prick and walking around to the cleft in her heart-shaped bed. She crawls in after you, planting herself on your knees behind you and grabbing your [pc.butt] in both hands.");
	output("\n\nShe thrusts her hips, letting the pendulous weight of her masculinity flip itself up and catch between your spread cheeks. You shudder at the feeling of latex-wrapped heat settling so close to your [pc.vagOrAss " + x + "] that you can practically feel Ren’s heartbeat.");
	output("\n\n<i>“You’ve got a nice ass, cow[pc.boyGirl],”</i> she purrs, squeezing hard enough to make you gasp. <i>“So, want it nice and gentle... or do you wanna go ahead and bite the pillow?”</i>");
	output("\n\nActually, you want her to use that tail of hers.");
	output("\n\nShe barely misses a beat, curling the thick, scaly appendage around and caressing your thigh. <i>“Kinky! Alright. Between you and me, the tip’s almost as sensitive as a clit... especially with this suit on. Don’t be surprised if you feel a cum-bubble between those cheeks");
	if(x >= 0) 
	{
		output("... if I can resist just shoving my cock in that [pc.asshole] of yours!”</i>");
		output("\n\nYour breath catches in your throat just at the thought, and all you can do is nod encouragingly, inviting her to take you in both holes.");
	}
	else output("”</i>");

	output("\n\nRen grins, and you can feel her latex-clad tail circling around your [pc.leg], pulling your bodies tightly together before angling its tapered tip into your [pc.vagOrAss " + x + "]. Instinctively, your fingers grip the sheets in a deathgrip, bracing for impact.");
	output("\n\nTo your surprise, before she spears your [pc.vagOrAss " + x + "], Ren reaches forward and grabs your chin. Her claws run meaningfully under your [pc.face], pulling you towards her until your back is pressed against her heavy breasts and your face turns aside. She plants a kiss on your lips, long and passionate, making you relax in her firm embrace until the first inch of slender tail slips inside you. You gasp, but that only allows her slender tongue to find its way inside your mouth, playing around your own. Your body squirms, clenching desperately around the thumb-thick tip, but her reptilian strength easily pushes past any resistance you can offer. The tip of her tail squirms around inside, flicking at the insides of your hole, teasing the walls to make you clench and shudder that much more.");

	//if pussy:
	if(x >= 0)
	{
		output("\n\nWhile her tail finds its way its way deeper and deeper into your [pc.cunt " + x + "], you feel one of her hands glide down to your hip. A moment’s work later, and something thick and smooth presses against the clenched ring of your ass. You shudder, trying to relax as much as you can, but Ren’s wriggling tail makes that almost impossible.");
		output("\n\nStill, you can already feel a little bubble of pre at the crown of Ren’s cock - the result of her excitement, or was she serious about how sensitive her tail is? With a grunt of effort, Ren pushes hard enough to force the bubble inside you, stretching your sphincter around a thin bulb of cum-swollen latex before her tapered crown follows it in. You grit your teeth, stifling a moan in the halfbreed whore’s lips as she pushes your asshole in.");
	}
	//else:
	else output("\n\nThough she’s got her tail buried inches in your asshole already, Ren’s not satisfied with just pushing your ass in. Oh, no. Using her entwined tongue to keep you right where you are, her hands wander down to your hips, letting you feel her latex claws tantalizing against your bare ass-flesh. Eventually, she hooks her thumbs around your cheeks, spreading them ever so slightly to let her thick, black-wrapped cock nestle into the gap between them.");

	output("\n\n<i>“There we go,”</i> Ren purrs, nipping at your [pc.ear] before pushing you down, back on all fours: ass in the air, face in the pillows to take your ass-ravaging. Her tail and cock move forward with paired precision, edging into your [pc.vagOrAss " + x + "] ");
	if(x >= 0) output("and asshole");
	else output("and crack");
	output(" and back again. Nice and slow for now, but the deeper her tail goes, the more agonizingly thick it becomes - and the more she’s able to move it, wiggling against your inner walls and circling around ");
	if(x >= 0) output("your g-spot");
	else if(pc.hasCock()) output("your prostate");
	else output("inside your bowels");
	output(".");

	if(x >= 0) pc.cuntChange(x,100);
	pc.buttChange(100);

	output("\n\nNo sooner has she started in on, though, than you start to hear the halfbreed’s breathing quicken. Her hands tighten around your [pc.hips], and her tail goes rigid. A moment later and you feel ");
	if(x >= 0) output("that bubble in your ass getting thicker. Your insides are forced to stretch out around the bloating latex wad, and you get to feel the glorious wet heat suffusing through it every step of the way.");
	else output("the bubble of pre grinding against your [pc.butt] start swelling.");
	output(" Her cock throbs, clenching rapidly as it shoots a thick load of gryvaini seed inside her suit.");

	//First Time Fucked:
	if(flags["RENSA_FUCKED"] == undefined) output("\n\n<i>“Whew!”</i> Ren grunts, chewing her lip. <i>“Don’t worry, that’s just... that’s just the suit talking. No chance of me getting soft on you yet, cow[pc.boyGirl].”</i>");
	//Repeat:
	else output("\n\n<i>“First of many,”</i> Ren promises with a firm slap of your ass, making you grip down on her even tighter.");

	output("\n\nYou mewl, feeling her hips thrust against your [pc.butt] with renewed vigor. Guess she’s never heard of a refractory period! Ren barely skips a beat, pounding you even as cum pours out out of her cockhead.");
	if(x >= 0) output(" You’re half convinced Ren’s going to end up forming a knot of spunk inside you before her first orgasm’s even passed!");

	output("\n\nBetween her dexterous tail, throbbing cock, and groping hands, you’re bathed in a mire of pleasure. The vigorous ass-fucked alone is enough to make you squeal and moan with every thrust, forcing yourself to bite the pillow rather than reward her with your loudest cries. Ren grins, thrusting her hips just that much faster. Your whole body shudders with the impacts");
	if(pc.biggestTitSize() >= 2) output(", making your breasts jiggle");
	if(pc.biggestTitSize() >= 2 && pc.hasCock()) output(" and ");
	else if(pc.hasCock()) output(", making ");
	if(pc.hasCock()) output("your [pc.cock] waggle half-hard under you, drooling across the bedsheets");
	output(".");

	output("\n\nBeing used as the halfbreed’s personal tail-holster leaves you breathless, barely able to keep up with the sheer, alien pleasure of her thick appendage moving sinuously through you");
	if(x >= 0) output(" - to say nothing of her cock reaming your ass");
	output(". It’s no surprise she drives you to orgasm not long after her own, but the buildup boils over with a crashing wave of ecstasy like nothing you’ve ever experienced, slamming through your body just as hard as Ren’s own hammer-like thrusts. Your breath catches and your body quakes uncontrollably, muscles going wild around Ren’s invading ");
	if(x < 0) output("tail");
	else output("lengths");
	output(". ");
	if(pc.hasCock()) 
	{
		output("Your [pc.cocks] jump");
		if(pc.cockTotal() == 1) output("s");
		output(" between your [pc.legs], getting rock hard for a moment before squirting ");
		if(pc.cockTotal() > 1) output("streams");
		else output("a stream");
		output(" of [pc.cum] across the sheets");
		if(pc.biggestTitSize() >= 1) output(" and all over your [pc.breasts]");
		output(". ");
	}
	//Pussy:
	if(pc.hasVagina())
	{
		output("The tail in your twat finds your g-spot with alacrity, grinding her tip against the tendermost spot until you’re screaming with pleasure. Your pussy squirts and clenches around the fist-thick tail spreading it open, completely unable to fulfill your body’s instinctual need to close itself around the invading appendage. Your ass, meanwhile, gets it just as bad: your squeezing muscle only serve to milk Ren’s prick even more than before. Before long the cum bubble inside you really is a knot, stretching you so wide around the sheer bulk of hot, sloshing seed that you can’t imagine ever getting it out. Every little shudder, throb, and heartbeat that races through Ren’s cock, you feel in turn through the latex suit. She shoots off again and again, bloating your bowels.");
		pc.cuntChange(x,300);
	}
	//else no pussy:
	else
	{
		output("Ren’s tail finds your most tender parts with alacrity, making sure your poor, battered ass doesn’t get any hint of respite until your orgasm has well and truly passed, leaving you breathless... and craving more. The way your body spasms and clenches around her tender tail’s tip drives Ren to another moaning orgasm, too: a rush of heat sears across your back, the latex knot between your crack bloating with her spilled seed until it’s the size of an apple, and sloshing luridly with every thrust.");
	}
	output("\n\n<i>“Ooof, you take it like a champion, sweetheart,”</i> Ren laughs. She lets out a tired breath and leans forward, pressing those huge breasts of hers into your back. Just the weight of them is enough to make your [pc.knees] buckle, and you end up pressed belly-first into the bed with Ren laying ontop of you, still leaking cum");
	if(x >= 0) output(" into your ass");
	output(" and flicking the tip of her tail around to tease your insides. The spunk-bubble on the crown of her cock’s only getting bigger, making sure you feel just how hot and full it is trapped ");
	if(x >= 0) output("inside you");
	else output("between your bodies");
	output(". <i>“That was good.”</i>");

	if(pc.isAss()) output("\n\nIt’s not like you’re paying for her to get off, but a happy whore’s a hard working one you guess.");
	else output("\n\nYou’re glad she had as much fun as you did.");
	output(" Ren giggles softly, nipping at your [pc.ear] while her tail slowly slithers out of you, leaving your [pc.vagOrAss " + x + "] gaping open in its absence. You breath a sigh of relief, nuzzling your cheek in the pillows as the empty sensation spreads through you, softly yearning for something to fill you right back up again.");

	output("\n\nRen’s arms fold over your shoulders, propping up her chin. <i>“Something tells me you’re not walking out of here for a while, cow[pc.boyGirl]. Luck you, you’re not paying by the hour. I’d say get comfortable, but I can’t think of anywhere cozier than cuddled up under my tits. Hm?”</i>");

	output("\n\nYou answer with a smile, letting your focus drift, just enjoying the tender closeness.");
	processTime(25);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",roomServiceOutroCrap);
}

//[Next]
//Room Service Combined Outtro
//All Room scenes combine here after [Next]ing
//Pass 1 hour.
public function roomServiceOutroCrap(cumflatedHer:Boolean = false):void
{
	clearOutput();
	showTerensha();
	output("You wake with a yawn, rolling onto your back and stretching languidly. A glance around the private brothel room doesn’t show Terensha anywhere, though your attention is quickly grabbed by the sound of a shower running. Part of the bulkhead across from the bed has slide aside, revealing a small stall just barely large enough for the big alien beauty to stand in. She’s still in her purple suit, using the nozzle to wash away the excess mess of lube and cum left on the latex - and giving it that extra little bit of sweet-smelling shine before she returns to selling herself on the floor.");
	output("\n\n<i>“Hey,”</i> Ren smiles, seeing you sit up. She turns in the stall to face you, having little choice but to press her breasts against the steam-stained glass");
	if(cumflatedHer) output(", and her cum-bloated belly jiggles incessantly, still sloshing with your pent-up seed");
	output(". <i>“Be out in a sec.”</i>");

	output("\n\nYou watch with no small amount of appreciation as the horny halfbreed washes her suit down one last time before replacing the nozzle and shutting off the water. A blast of hot air streams down from the ceiling, and she steps out looking spotless and alluring as ever - you’re half tempted to see if she accepts repeats right away!");

	output("\n\nShe gives you a little smirk and reaches down to the belt on her thigh, retrieving a small blue pill. She pops it and takes a long drink from a vial in the bandolier beside it - just enough to give you the faintest hint of an alcoholic smell.");

	output("\n\n");
	if(flags["RENSA_FUCKED"] == undefined) output("<i>“Quick refresh,”</i> she mentions off-hand, replacing her gear. <i>“Gotta take these after sessions with " + pc.mf("studs","beauties") + " like you, or I’ll be shooting blanks after my first customer. You really drained me dry, [pc.name]. Not that I didn’t love every second of it...”</i>");
	else output("<i>“Drained me dry, as usual,”</i> Ren smirks, replacing her gear. <i>“Gotta kick-start my body or I’ll be shooting blanks next time you want to come calling.”</i>");

	output("\n\nYou chuckle and accept an offered hand up... which immediately pulls you into a tight hug, pressing Ren’s body close to yours. <i>“");
	if(flags["RENSA_FUCKED"] == undefined) output("Here’s hoping I made a repeat customer today...");
	else output("For my favorite beau,");
	output("”</i> she murmurs before planting a kiss on your lips, curling her tail around your waist to tight against her until she breaks it with a shuddering sigh. <i>“Hoo, I love my job!”</i>");
	output("\n\nRen gives you a playful wink and spins on a heel, keeping her hand locked around yours. <i>“C’mon, I’ll walk you upstairs.”</i>");
	output("\n\nYou follow her back out, having a hard time drawing your ass off that swaying behind of hers until you’re back on the dark, smoky showroom of the bordello, and Ren’s slipping away, back to her usual table.");
	output("\n\n<i>“");
	if(silly) output("See you, space cowboy");
	else output("Till next time, cow[pc.boyGirl]");
	output(",”</i> she calls over her shoulder, waving her tail at you.");
	processTime(60);
	IncrementFlag("RENSA_FUCKED");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function meetingTerenshaDancing():void
{
	clearOutput();
	showTerensha();
	output("You’re certainly enjoying the performance of the ");
	var raceVar:String = "";
	if (hours == 10 || hours == 13 || hours == 16) raceVar = "doh’rahn";
	else if (hours == 11 || hours == 14 || hours == 17) raceVar = "human";
	else if(hours == 12 || hours == 15) raceVar = "vanae";
	else if(hours == 18 || hours == 19 || hours == 21 || hours == 22 || hours == 24 || hours == 1 || hours == 3 || hours == 4) raceVar = "ovir";
	//2000, 2300, 0200, 0500
	else if(hours == 2 || hours == 5 || hours == 20 || hours == 23) raceVar = "ausar";

	output(raceVar + " shaking her stuff on stage, but what’s really drawing your eye right now is the voluptuous halfbreed sashaying between tables, offering quick release for a few easy credits. Deciding to take advantage of her public service, you head on down towards the stage and snag one of the few empty tables. You end up a few rows back, but you’re facing the dancer full on as she performs. The stage is a ribald display of bared flesh and jiggling curves, bouncing and swinging to the cheers and applause of the crowd. Smiling at the girl on stage, you lean back and enjoy the show... and the way your [pc.cocks] ");
	if(pc.cockTotal() == 1) output("is ");
	else output("are ");
	if(!pc.isCrotchExposed()) output("tenting your [pc.lowerGarment].");
	else output("stiffening against your thigh.");

	output("\n\nIt doesn’t take long for Ren to notice you, finish off her current client, and saunter over with a smile and a seductive sway in her egg-bearing hips. <i>“Hey there, space cowboy,”</i> she says, hefting herself up onto your table and suppressing a soft moan as the half-hard reptilian rod dangling between her legs rubs her latex-clad thighs. <i>“Hot piece of ass on stage, huh? Even if I wasn’t working, I’d be so hard from watching her... mmm,”</i> she murmurs with a little shudder.");

	output("\n\nRen glances under the table, eyeing the shameless boner you’ve got under there with a glint in her eye. <i>“That looks like fun,”</i> the dragoness murmurs, reaching down with a foot to caress your [pc.cockHead]");
	if(!pc.isCrotchExposed()) output(" through your [pc.underGarment]");
	output(". <i>“Guess you’ve gotten a little pent up watching - or is this all for me? Either way, how about you trade me a few credits and I help you take care of that? Half goes to the tits on stage, so consider it your tip if you want.”</i>");

	output("\n\nYou nod eagerly, digging your Codex out of your pack. Ren smiles and plucks a tiny data-reader off a belt on her leg and swipes your Codex, docking your your credits. Satisfied, she returns the device and plucks a bottle of translucent lubrication beside it. <i>“Perfect, cow[pc.boyGirl]. Now just relax and enjoy the show!”</i>");

	output("\n\nThe horny halfbreed gives you a green-lipped smile as she crawls down from the table and into your lap, grabbing your [pc.cock] firmly as she settles in. ");
	if(!pc.isCrotchExposed()) output("With practiced ease, Ren fishes your cock out of your clothing and gives it an experimental tug - just enough to get you diamond hard. ");
	output("<i>“There we are!”</i> she purrs, rubbing your length up and down with her latex-wrapped digits. Her suit feels just like one big, slick condom around your girth, massaging you in all the right ways. <i>“Oooh, nice and hard for me already. Now, don’t feel compelled to hold back, lover,”</i> she adds, squirting a healthy helping of lube into her hand between strokes. <i>“I’ve cum so many times already today, you don’t have to worry about me. This is all about <b>you</b>!”</i>");

	output("\n\nWithout another word, Ren drops her hand down to the base of your [pc.cock] and angles it into the crack of her ass. She shudders, biting her lip as your [pc.cockHead] passes over where you imagine her backdoor must be, and finally ends up aligned perfectly in the gulf between her pussy and the fat sack hanging below her own member. For its part, Ren’s reptilian dick is half-hard and visibly throbbing, lying heavily on your [pc.belly] Smiling up at her, you give it a gentle stroke - and are immediately rewarded by a muffled cry. The working girl only barely gets her hands over her mouth in time to silence herself, and has little choice but to keep them there as you return the favor she’s been giving you.");

	output("\n\nIt takes all of five strokes to get her as stiff as you are. Five more, and the half-dragoness is rolling her head back with a lurid moan. Her cock pulses urgently in your hand, and you’re suddenly overwhelmed by a warm, running heat underneath the latex suit! She just came!");

	output("\n\n<i>“S-sorry,”</i> Ren murmurs, blushing furiously. <i>“This suit... it’s five times more sensitive than I ever was. If you wanna really see a gryvain-cock cum though, stop teasing me so I can slip you inside me. It’ll be a fountainhead before I’ve hilted you.”</i>");

	output("\n\nYou take that as a promise, and release Ren’s bulbous member. She sighs, G-cup tits heaving under her slick suit as she recovers. Once she’s caught her breath, the halfbreed vixen bites her lip again and shifts her crotch ever so slightly, angling your crown into the folds of her sex. The latex suit stretches out like a balloon, effortlessly deforming to accept your girth. Your hired-on lover moans despite herself, trembling fiercely as she sinks down on the first inch of cockmeat you give her.");

	output("\n\nThe first inch is an exquisite agony for the both of you, it turns out. The inside of Ren’s suit - or maybe the actual pussy inside it - is lined with concentric rings of fleshy bulbs, hundreds of small points of pressure that bear down ferociously around your length, especially with their owner clenching so hard. And true to her word, Ren’s draconic rod stiffens right back up mere moments after firing its first load, only to pulse feverishly against your [pc.belly]. You can feel rivers of wet heat through the paper-thin catsuit, bubbling up from the tapered crown and rolling viscously back down her shaft. The way she’s throbbing and moaning, you can’t help yourself from grabbing a handful of her turgid length and helping her out - not that she needs it, obviously!");
	pc.cockChange();

	output("\n\nStill, your efforts earn a wan smile from the call-girl as she finally ");
	if(pc.cocks[0].cLength() >= 15) output("takes your massive cock so deep that you can feel the gaping ring of her egg-bearing womb kissing your crown");
	else output("settles into your lap, your [pc.cock] completely consumed by her tight, nub-ringed cock-sheath");
	output(". Ren’s thick tail swishes heavily between your [pc.leg], mirroring the rhythm of its owner’s contract cunt around your shaft. She really does feel like a high-end onahole now, so latexy-smooth but full of bumps and ridges that grind wonderfully against your prick even at rest, moving only in response to the nearly overwhelming pleasure their owner is enduring.");

	output("\n\n<i>“Keep playing with my cock like that and I don’t think I’m going to be able to move,”</i> Ren breathes huskily, wrapping her gloved arms around your neck. <i>“Or... would that be alright? Want me to milk you dry just with my muscles?”</i>");

	output("\n\nYou shiver at the suggestion, feeling Ren’s pussy contract and relax faster and tighter around you already. It wouldn’t be that bad, letting her just massage you to orgasm. You’re already closer than you’d like to admit, excited beyond the pale by the unique sensation around your sex and sight of Ren’s shameless cock throbbing wetly on your [pc.belly]. Its crown is becoming more bulbous by the second, swelling with the halfbreed’s growing cum-balloon. Her suit can’t handle the sheer volume she’s pumping out for you, left with no choice but to distend luridly around the sloshing liter of boiling cream. Grinning at the horny green woman, you wrap your hand around the cum-bubble, working it around in your fingers and squeezing until the liquid gets forced back down her shaft and into her suit. She’s going to be swimming in her own cum before long!");

	output("\n\n<i>“I-I’ll take that as a yes,”</i> she murmurs, arching her back with a soft moan as one set of groping fingers finds her cockhead, and another scoops up her fat balls and starts to play with them as well. <i>“Keep this up and I won’t have any left for my next customer!”</i>");

	output("\n\nYou give her churning sack an encouraging squeeze, urging the dragon-girl to work those muscles. The sooner you cum, the sooner she can save herself from the constant climax you’ve trapped her in. Ren forces a weak smile in your direction and starts to rock her hips ever so slightly, just enough to make all those wonderful alien bumps inside her alien quim rub your [pc.cock] in ways that make you tremble and gasp with pleasure.");

	output("\n\nA few moments of that kind of treatment and you can feel the tell-tale pressure thrumming in your loins, threatening to overwhelm your failing restraint. Your breath quickens, chest rising and falling so that Ren’s sheathed shaft is constantly rubbing against your skin and the thick coating of cum it’s basting in. The halfbreed whore smirks, moving her hips just a little bit faster as she senses her client’s orgasm fast approaching. <i>“Gonna cum? Go on, cowboy: pump it all deep inside. Let me feel how much you’ve enjoyed this...”</i>");

	output("\n\nShe’s got no idea how much you have... then again, considering how many times you’ve almost effortlessly made her climax, maybe she does! It’s gotta take a lot of restraint to keep working after cumming over and over in the span of minutes. You grin to yourself and decide to join her in that body-numbing bliss, taking two handfuls of her throbbing sex and humping your hips against hers, driving your [pc.cock] as deep as it can go before your own erection erupts inside her.");

	processTime(22);
	clearMenu();
	addButton(0,"Next",terenshaDancingEpilog);
}

public function terenshaDancingEpilog():void
{
	clearOutput();
	showTerensha();
	//Hugecumvol:
	if(pc.cumQ() >= 5000)
	{
		output("Your churning [pc.balls] unload");
		if(pc.balls <= 1) output("s");
		output(" deep inside, pulsing and squirting so much in the blink of an eye that a veritable waterfall of wasted seed pours out around your cock, even as tightly gripped as it is by Ren’s pussy. Even better, though, you can feel the latex sheath she’s made of her twat distend and bulge, just like it is around her own cockhead, but angled into the egg-bearing channel of her womb. Her eyes go wide as she feels what’s going on, and her hands leap to her belly. While she was ever-so-slightly thick around the middle before, you can both see that’s rapidly changing - her belly is growing, expanding around the massive load you’re pumping into her.");
		output("\n\nThe halfbreed’s cock leaps to full attention, standing straight up in the air and blowing its own bubble bigger as the pleasure of expansion rocks her body. She’s panting and gasping for breath, barely able to keep from crying out as your ungodly load swells inside her body. By the time you’re finally squirting nothing but thin ribbons of [pc.cumNoun], she looks several months pregnant; Ren’s hands are planted firmly on her stretched-out belly, and her cock is completely pinned between your [pc.belly] and hers, looking like the balloon at its crown is ready to pop.");
		output("\n\n<i>“O-oh wow,”</i> she breathes, barely able to form the words thanks to the shudders of climactic pleasure still shaking her body. <i>“I know you space jockeys get pent up, but this... ");
		if(pc.race().indexOf("kui-tan") != -1) output("shoulda expected it from a kui-tan!");
		else output("are you sure you’re not a kui-tan in disguise?");
		output("”</i>");

		output("\n\nYou give her a smirk and pat her straining belly - just light enough that only a little cum squirts out of her quim. She shivers, taking a deep breath to calm herself. <i>“Okay. I’m going to have to clench down real hard around you now while I get up, or else this massive load of yours is going all over the floor. Gonna have to go flood the ladies’ room after this as it is.”</i>");
		output("\n\nNodding, you shift your hands over to her hips and gently guide her up and off your wilting rod. A short squirt of seed splatters down from inside her the moment you pop wetly out, but she’s able to clench her inner lips hard enough to pinch off the cum-balloon inside her womb well enough. She takes a deep breath, then leans over you and plants a quick kiss on your brow - and not incidentally presses your face into the jiggling valley between her huge breasts at the same time.");
		output("\n\n<i>“That was a blast, cow[pc.boyGirl],”</i> she whispers into your [pc.ear]. <i>“Even if I’m ninety-percent [pc.cumNoun] by volume right now. See if you can save up an even bigger load for me next time - I kind of want to see just how stretched out I can get!”</i>");
		output("\n\nSmiling and flushed red, Ren crawls off your lap and, both hands on her belly, waddles off towards the back rooms. You’re pleased to watch her leave a trail of [pc.cumColor] on the floor and her own thighs with every step. God only knows what she’d look like if you saved up even more....");
	}
	//{Medcumvol:
	else if(pc.cumQ() > 750)
	{
		output("You grunt with desire, rolling your head back in your seat and letting your body take control. Your [pc.balls] soon send");
		if(pc.balls <= 1) output("s");
		output("s");
		output(" the first thick globs of spunk through your shaft and splattering against the latex sheath her suit’s formed around you. Ren gasps, putting a hand on her belly as your first potent shots make a little balloon that presses against the entrance to her womb before discharging back in a waterfall of steaming spunk.");
		output("\n\n<i>“Whew!”</i> your lover moans, gently squeezing her pussy muscles until your still-steaming orgasm washes down your thighs and splatters onto the floor in a musky, sticky puddle. <i>“The galotian they have cleaning this place is just going to <b>love</b> this!”</i>");
		output("\n\nYou and Ren share a laugh while your softening tool slowly slips out of her cum-slick slit, flopping wetly against your thigh. The last vestiges of your orgasm trickle out of Ren’s gaping hole, smearing in sticky streaks all over her legs. <i>“Gonna take forever for the suit to absorb this much cum... you and me make so much more than most of these pervs. Mmm, you should catch me after the shows are done. Do this again somewhere where can really have some fun, huh?”</i>");
		output("\n\nOh, you’d like that. Ren takes a deep breath, then leans over you and plants a quick kiss on your brow - and not incidentally presses your face into the jiggling valley between her huge breasts at the same time. When she’s done, she crawls off your lap and jiggles herself for you, letting you see just what a wet mess you’ve made of her before she gives you a wink and saunters off to her next customer.");
	}
	//Lowcumvol:
	else
	{
		output("With a final gasp of pleasure, you feel your cock clench and release, shooting your load into the latex sheath her suit’s made inside her. The halfbreed whore makes no effort to hide her enjoyment, but moans luridly as you spill your seen across the bumpy rigdes of her alien twat. When you’re done, she leans in close, wrapping your face into the valley of her huge cleavage and planting a kiss on your forehead.");
		output("\n\n<i>“Thanks for that, cow[pc.boyGirl]. I hope that was even half as good for you as it was for me,”</i> she purrs, crawling out of your lap and wiggling her hips. <i>“If so, I’m sure I’ve earned a repeat visit or two!”</i>");
		output("\n\nYou smile, giving her jiggly behind an appreciative swat as she turns to leave.");
	}
	processTime(2);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}