import classes.Items.Miscellaneous.BrandyLetter;
/* Brandy: add affection and new sex scenes https://docs.google.com/document/d/1i0enI2fgRohVaRKuJcPyRQr8qtZIgHrADalEd2qK2BQ/edit?usp=sharing */

/**
	 * ...
	 * @author DrunkZombie
	 */
/*

New Flags:
BRANDY_AFFECTION					Brandy's affection level
BRANDY_AFFECT_HUG					Flag for if Brandy was hugged this encounter (used in Brandy.as)
BRANDY_RELATIONSHIP					undefined or 0 none, 1 casual, 2 became Brandy's boy/girlfriend
BRANDY_VAGINAL						times fucked brandy's cunt with your cock
BRANDY_FINGERING					times fingerfucked brandy's cunt
MET_BRANDY_SALLY					flag for if you have talked to brandy and sally about them
BRANDY_SALLY_THREESOME_PEN			Times had threesome with brandy and sally using cock
BRANDY_SALLY_THREESOME_CUN			Times had threesome with brandy and sally using tongue

*/
public function showBrandySally(nude:Boolean = false):void
{
	showName("BRANDY &\nSALLY");
	var nudeS:String = "";
	if(nude) nudeS = "_NUDE";
	showBust("BRANDY" + nudeS,"SALLY");
}

//alters brandy's affection rating and returns current affection
public function brandyAffection(add:Number = 0):Number
{
	if (flags["BRANDY_AFFECTION"] == undefined) flags["BRANDY_AFFECTION"] = 0;	
	
	//affection is locked at 100 so no more adding or subtracting
	if (flags["BRANDY_AFFECTION"] >= 100)
	{
		flags["BRANDY_AFFECTION"] = 100;
	}
	else
	{
		if(add != 0) flags["BRANDY_AFFECTION"] += add;
		if(flags["BRANDY_AFFECTION"] > 100) flags["BRANDY_AFFECTION"] = 100;
		if(flags["BRANDY_AFFECTION"] < 0) flags["BRANDY_AFFECTION"] = 0;
	}	
		
	return flags["BRANDY_AFFECTION"];
}

//returns the number of times brandy has been sexed
public function brandySexed():Number
{
	var sex:int = 0;
	
	if(flags["BRANDY_VAGINAL"] != undefined) sex += flags["BRANDY_VAGINAL"];
	if(flags["BRANDY_FINGERING"] != undefined) sex += flags["BRANDY_FINGERING"];
	if(flags["SUCKLED_BRANDY"] != undefined) sex += flags["SUCKLED_BRANDY"];
	if(flags["BRANDY_MISSIONARY"] != undefined) sex += flags["BRANDY_MISSIONARY"];
	if(flags["BRANDY_MISCREANTED"] != undefined) sex += flags["BRANDY_MISCREANTED"];
	if(flags["BRANDY_STALLED"] != undefined) sex += flags["BRANDY_STALLED"];
	
	return sex;
}

//Vaginal sex
//[Vaginal]
public function brandyVaginal():void
{
	clearOutput();
	showBrandy(true);
	author("HugsAlright");
	if (silly) author("HugsItsNotAlright");	
	
	var x:int = pc.cockThatFits(brandyCapacity());
	if(x < 0) x = pc.smallestCockIndex();
	
	//firstTime:
	if(flags["BRANDY_VAGINAL"] == undefined)
	{
		output("It seems like Brandy is more likely to enjoy some good ol’ fashioned vaginal loving with you now than when you first met. ");
	}
	output("Gently urging your lover onto her back, you break the kiss you were in, letting the cowgirl’s lips part from yours to reveal her red, lust-ridden face, still letting out whimpering moos as your fingers trail up and down her still-covered pussy. Brandy doesn’t object to your soft push and lowers herself onto the mattress, spreading her legs to get you between them.");
	output("\n\nYou smile down at your prone lover and, unable to resist the urge to do so, bend yourself over her and press your [pc.lipsChaste] to hers, trapping her in a kiss, and her body under yours. Mooing quietly into your mouth, Brandy squirms and wiggles under you, her muscles clenching and loosening with each movement of your fingers. It’s clear this needy New Texan wants something between her legs, so you get ready to give her just that. You slide your hand up to the cowgirl’s waist before slipping your fingers under her shorts, making her gasp silently as your digits work their way over her smooth, freckle-laden skin until your digits find her engorged clitty. As you start toying with her pleasure buzzer, your single finger playing across her clit, Brandy starts to moo pleasurably between your lips. Her lusty tones lead you to grin and continue to sink your hand deeper between your lover’s legs until your can feel the hot moisture of her pink, stretchy slit against your fingers.");
	output("\n\nNot wasting any time, you sink a pair of devious members into the cowgirl’s pussy, making her back arch and her voice break into a moaning moo. You can’t really pull your fingers out too well with Brandy’s tight shorts in the way, but she seems eager to remedy that, reaching for her lower garments to push them off as you spread her lower lips with your inserted digits. Thanks to your lover’s diligent efforts, the New Texan’s pants are at her knees in no time, and your fingers are dragging in and out of her needy quim just as soon. It isn’t long before the cowgirl is gushing her natural lubricants onto your hand and all over her sheets, clearly ready for a big hard cock to fill her, and that’s just what she’s going to get.");
	output("\n\nYou empty Brandy’s needy slit with only a whimpering, pitiful moo as protest and pull back from your kiss, only to see Brandy with her tongue lolling with lust and her chest heaving with each breath she takes. Speaking of, maybe your buxom bovine here would be more comfortable without that tight shirt on. So, with a smirk, you reach down to the buttons on her restricting clothing and start to undo them, each one straining more than the last as they come undone to keep Brandy’s big, squishy breasts contained. Brandy only watches and bites her lip with growing anticipation as your undo her shirt, all the way until you reach the last button on her tit-constraining garment, finally coming apart to let the cowgirl’s F-cups spill free with a contented sigh. You grin lustfully as your lover’s big, pale, freckled-topped breasts are released from their linen prison and come jiggling to a halt. Licking your lips, you’re quick to grab at Brandy’s naked chest, causing her to suck in a silent, shocked breath before you start to gently knead and squeeze her sinfully-soft fun-pillows, nipples hardening with each tender caress. She whimpers and moos quietly at your touch, balling her hands into tightening fists in an attempt to quell her pleasure, pretty pussy still leaking her fem-lube and clenching now and then, gushing more of her fluids.");
	output("\n\nIt’s at that point you think Brandy’s had enough teasing and foreplay, and decide to give the cowgirl what she’s craving. Pulling your hands back from the cowslut’s tempting breasts,");
	if(pc.isCrotchExposed()) output(" you grab hold of her shorts and get them all the way off before reaching for her plush thighs, kneading them in your grip then spreading her legs, baring her sopping-wet femininity to you.");
	else output(" you start to take off all your own clothes, with your [pc.cockNoun " + x + "] already straining against them. Once you’re good and nude, you grab hold of Brandy’s shorts and get them all the way off before reaching for her plush thighs, kneading them in your grip then spreading her legs, baring her sopping-wet femininity to you.");
	output("\n\nIt seems your lover can barely contain herself, wiggling her hips back and forth to get her needy quim closer to your stiffening tool. Grinning at her eagerness, you take hold of your [pc.cock " + x + "] and angle it towards her womanhood then give your [pc.hips] a little thrust forward. That’s enough to get your cockhead pressed against the cowgirl’s nether lips, gently spreading them as she lets out a whimpering moo and gets your tip soaked in her feminine fluids. You can’t find a reason to stop there and continue to push forward, sliding your hips onward and forcing Brandy’s pussy to part around your shaft, labia spreading to accept your manhood.");
	output("\n\nThe bovine girl moos all the louder as you work more of your [pc.cock " + x + "] into her, stretching her pink pussy around your length. Brandy takes it all like a proper New Texan gal’: happily and easily. With a");
	if (silly) output(" squish-mitten");
	else output(" cunt");
	output(" as wet and stretchy as the cowgirl’s, it’s easy to work your tool into her, all the way to the hilt,");
	if (pc.cocks[x].cLength() >= 14) output(" leaving Brandy’s tummy bulging with a pleasing outline of your turgid cock.");
	else output(" your hips pressed to hers.");
	output("The buxom bovine under you moos with bliss and wiggles under you with your tool sheathed inside her, breath shuddering and labored.");
	output("\n\nYou smile down at Brandy while she turns beet-red behind her bangs and start to pull your [pc.hips] back, drawing your [pc.cock " + x + "] out of her slit and dragging your cockflesh along her sensitive inner walls. That only has your lover mooing louder as her love tunnel is caressed by your shaft. Then, just as your glans reaches her sopping folds again, you thrust right back into her, spreading her lower lips wide once more and leaving Brandy almost unable to cry out at the sudden, inexorable pleasure. Her back arches high when your [pc.hips] meet hers again, but you don’t stop there, and go to pull back again, then thrust in again, and again, and again.");
	output("\n\nEventually, your thrusting builds to a vigorous-but-steady rhythm that leaves both of you in pleasurable bliss with your [pc.cockNoun " + x + "] railing Brandy’s pussy and her warm, wet inner walls hugging at your cock. The cowgirl’s massive breasts jiggle and bounce pleasingly with each inward thrust, her tongue lolling with pleasure and strain as she’s fucked silly by your quickening movements. A constant chorus of happy, lust-filled moos constantly fills the air as your love making continues, urging you onward to pleasure Brandy.");
	output("\n\nIt all becomes too much for the cowgirl, all too soon. You can feel her legs tense in your grip, and you look down just in time to see her back arch as high as it will go, her whole body writhing with inescapable pleasure as she reaches her climax. Her inner muscles clench as spasm around your [pc.cock " + x + "], drawing a few groans from your lips. Crystal-clear girlcum spills out around your shaft like a river, dripping down onto Brandy’s covers, the cowgirl still mooing as loud as she can. ");
	output("\n\nWith the sudden tightness of your lover’s convulsing cunt clamping down around your [pc.cock " + x + "], you feel nothing but the urge to cum alongside her. So, you thrust deep inside Brandy,");
	if (pc.hasKnot(x)) output(" streching her wide as you force your [pc.knot] into her with one good push, tying you together at the waist, the sheer size of your breeder’s knob seeming to be almost enough to send the knotted cowgirl into a second orgasm while yours is just beginning.");
	else output(" tearing a loud, surprised <i>“MoooOOOOO!”</i> from her shapely lips, and let your willpower slip away, finally allowing your orgasm to begin.");
	
	//Else: You paint Brandy’s inner walls [pc.cumColor] as you fill her with your seed, making sure the good cowgirl gets all the [pc.cum] she deserves.
	
	output("Your [pc.hips] buck jerkily against Brandy’s own spacious sides, your dick spasming between her nether lips,");
	
	if(pc.balls > 0)
	{
		output(" [pc.balls] emptying");
		if (pc.balls == 1) output(" its");
		else output(" their");
	}
	else
	{
		output(" emptying its");
	}
	if (pc.virility() > 0) output(" virile");
	else output(" sterile");
	output(" load right into the bovine broad’s waiting womb.");
	if (pc.cumQ() >= 2000)
	{
		output(" Before too long pressure starts to build,");
		if (pc.hasKnot(x)) output(" and Brandy’s");
		else output(" and while some of it is able to spill from Brandy’s pussy, her");
		output(" stomach starts to distend and swell full of [pc.cum] until she’s looking pregnant.");
	}
	else
	{
		output("You paint Brandy’s inner walls [pc.cumColor] as you fill her with your seed, making sure the good cowgirl gets all the [pc.cum] she deserves.");
	}
	output("\n\nUnfortunately, it all comes to an end, leaving you barely able to hold yourself over Brandy. Your lover’s expansive chest is heaving with each labored breath she take, her orgasm clearly having taken its toll on her stamina. Through half-lidded and tired eyes, the done-in bovine manages to smile up at you, almost looking bewildered at what just transpired, and obviously pleased. Barely able to keep yourself upright, you grin right back down at your lover, then promptly collapse on top of her prone form. You hear a quite, happy moo from Brandy as your [pc.chest] press");
	if (!pc.hasBreasts()) output("es");
	output(" against her bare breasts and feel her svelte arms wrap around your back. Returning her embrace, you roll the two of you onto your sides, facing each other as you cuddle there on the covers, ready to sleep off your afterglow before you have to continue on your journey...");
	
	processTime(20);
	//increase affection +5
	brandyAffection(5);
	pc.orgasm();
	IncrementFlag("BRANDY_VAGINAL");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//mutual fingering
//[M. Fingering]
public function brandyMutualFingering():void
{
	clearOutput();
	showBrandy(true);
	author("HugsAlright");
	if (silly) author("HugsItsNotAlright");
	
	output("\n\nSmiling amidst your kiss, you rub your fingers along Brandy’s still-clothed cunt, causing her to release a few whimpering, needy moos into your mouth. Then, you start to trail your hand upward to the hem of her shorts, gently pulling her belt loops and running your digits across her pale, smooth skin. With a devious grin you slip your fingers under her pants, making the cowgirl’s breath shudder and stutter as your seeking members are greeted with the warm, wet heat of Brandy’s pussy. You trail your digits up and down along her pink slit until she starts mooing again, still pressing her lips to yours.");
	output("\n\nSoon, a pair of devious fingers are delving into her pussy, spreading her lower lips and tearing a moan of a moo from your lover’s lungs, her breath catching soon after. Though, it’s difficult to move your fingers much with the cowgirls pants in the way.");
	output("\n\nPlanning to remedy that, you withdraw your digits from Brandy’s quim, making the bovine beauty let out a whimpering moo as you break your kiss. You move her hand back to Brandy’s shorts, gazing into your lover’s hungry, bang-cloaked eyes for a moment, watching her blush and pant for a moment before grinning wide and starting to pull down on her shorts. The needy cowgirl is quick to realize what’s going on and wiggles her hips to get those pesky clothes off more easily. And, with your efforts combined, you have her lower garments off in no time, baring her dripping pink pussy to you.");
	if (pc.isNude()) output("\n\nAlready naked yourself");
	else output("\n\nSmiling at that sight, you lean back and start to strip yourself as well, Brandy enjoying the show with a shy smile and beet-red cheeks. Once you’re good and bare");
	output(", you grin at your bovine lover, and trap her in another kiss, leaning into her until she’s on her back, resting on the mattress. She happily accepts your oral embrace, laying there under you. You take one of her hands into yours, and start leading her down your [pc.stomach] and along your hips, right up to your [pc.vagina]. Sucking in a silent gasp as she feels the warmth of your slit, but trailing her dainty digits along it all the same. You grin between kisses when you realize Brandy’s getting the idea and release her hand, moving your own to her crotch.");
	output("\n\nWith the cowgirl already as wet as she is, it’s not difficult to slip a pair of fingers back into her, drawing a stuttering <i>“M-mooooo...”</i> from her between her lips. Brandy obviously doesn’t want you to feel left out, and sinks a finger into your [pc.vagina], spreading your labia and leaving you to moan quietly into your lover’s mouth.");
	output("\n\nThe two of you continue on like that for some time, beginning to thrust your delving digits in and out of Brandy’s lube-leaking pussy, while she does the same to you, building to a gentle fingering that has one of you groaning in bliss, and the other moaning. You keep your kiss going all the while, sliding your [pc.tongue] across your lover’s again and again, lips smacking and parting from time to time whenever Brandy can’t contain her pleasured moos, especially when you start flicking your thumb across the cowgirl’s lust-engorged clitty. Before too long you even start groping at the big-boobed bovine’s bodacious breasts, gently squeezing and kneading one at a time until the girl is writhing in pleasure.");
	output("\n\nIt goes on like that for quite some time, slowly building until you’re both burning with the need to cum, grinding your hips on each other’s hands and coating the covers with girly-lube until one of you can’t hold back anymore.");
	output("\n\nYour lover is the first to go, suddenly parting her lips from yours as a long, loud <i>“MoooOOOOO!”</i> forces its way out of her mouth, back arching. You can feel her pussy clamp down around your fingers and girlcum wetting your hand as her orgasm ensues. Brandy moos and moos all the way through her climax, shivering with bliss, still fingering you as best she can. And watching your lover cum like that, you feel compelled to reach your climax as well, and it finally hits you like a tidal wave. Your whole body tenses as orgasmic pleasure racks your body, [pc.vagina] spasming around Brandy’s fingers and your [pc.hips] grinding on her hand with jerky, instinctive movements. [pc.GirlCum] spills from your slit, adding to the veritable puddle already forming on the bed and coating your cow-friend’s hand.");
	output("\n\nYou both end up locked in the blissful prison of orgasm for quite some time, and finally come down feeling like you’re about to collapse, [pc.chest] heaving. Taking a moment to let your senses come back, you look down at Brandy to see her with a big, satisfied smile on her red-flushed face. You give her a grin and go to take your cum-slick digits out of the cowgirl, earning a quiet <i>“M-moooo...”</i> from her as she’s emptied. She does the same, withdrawing her fingers from your [pc.vagina], leaving you to whimper at the almost-painful sensation of emptiness for a moment.");
	output("\n\nAt that point, you can’t really muster any words, so you simply fall forward onto your lover, limbs splayed in every which direction. Brandy coos a little, happy moo in your ear as you collapse onto her, quick to wrap her girly arms around your shoulders to hold you warm and close against her breast. You smile amidst the embrace and do your best to return the gesture, already feeling the call of sleep as the afterglow of your climax pulls you to a comfortable nap.");
	output("\n\nIt won’t be too long before you have to get moving again, but you can enjoy this snuggle with Brandy while it lasts...");
	
	processTime(20);
	//increase affection +5
	brandyAffection(5);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//letter scene with brandy
//[Letter]
public function brandyLetterTalk():void
{
	clearOutput();
	showBrandy(false);
	author("HugsAlright");
	if (silly) author("HugsItsNotAlright");
	
	output("<i>“I got your letter, by the way,”</i> you say pulling out the already-opened crimson envelope and showing it to Brandy.");
	output("\n\nBehind her minty bangs, the cowgirl’s eyes widen and her cheeks blush as red as the letter she gave you. She almost shrinks as her posture catches up with her embarrassment and shyness, knees knocking as she hides an arm behind her back and rubs at the back of her neck with her free hand.");
	output("\n\nWith a nervous smile and a silent chuckle, Brandy stutters out a single, curious <i>“M-... m-moo?”</i>");
	output("\n\nIf you were to guess, she probably wants to know what you thought about that “couple” proposition. Well, you are the one who brought up the letter, so you better have an answer for her.");

	clearMenu();
	//[Couple] become a couple
	addButton(0,"Couple",brandyCoupleTalk,undefined,"Couple","Tell Brandy you’d love to be her " + pc.mf("boyfriend.","girlfriend."));
	//[Casual] Ask Brandy what she thinks of New Texas.
	addButton(1,"Casual",brandyCasualTalk,undefined,"Casual","Tell Brandy you’d prefer to keep your relationship a more casual one.");
}

//become couple scene with brandy
//[Couple]
public function brandyCoupleTalk():void
{
	clearOutput();
	showBrandy(false);
	author("HugsAlright");
	if (silly) author("HugsItsNotAlright");
	
	output("Smiling at the cowgirl, you take a few steps forward before quickly wrapping your arms around her back, causing her to jump before she realizes she’s been pulled into a hug. Brandy quickly settles down and returns your embrace. You hold her there in silence for a moment, able to feel Brandy tremble with excitement and nervousness.");
	output("\n\n<i>“Of course we can be together,”</i> you whisper as your hug continues.");
	output("\n\nAt that, you can hear and feel Brandy’s breath catch, as she pulls back from your embrace a bit to look into your eyes. The cowgirl sniffles slightly and her face flushes red, her bang-cloaked eyes getting all misty when she hears your answers. A quivering smile appears on her face as a joyous moo erupts from her lips, pulling herself back into your hug. You stay that way for a while, holding Brandy as she let out happy little cowgirl noises now an then, sniffling and doing her best to hold back tears of joy with her tits all mashed against your");
	if (pc.tallness > 60) output(" chest.");
	else output(" face.");
	output("\n\nWhen your embrace finally ends, your new girlfriend does so with some reluctance, letting her arms unwrap from your waist and going to grab your hands instead, lacing her dainty fingers between yours. She looks at you and blushes, biting her lip right before she decides to make a surprisingly bold move and bring you into a kiss, pressing herself into you for a short moment before pulling back, leaving both of you with smiles on your faces and your cow-friend wiping a tear from her cheek.");
	output("\n\nThere’s a silence in the air after that, which Brandy seems to enjoy, simply smiling and rocking back and forth on her heels as she looks into your [pc.eyes]. Eventually, though, you figure you better move things along. After all, you’ve got a pretty New Texan girlfriend who’d probably like to spend some time with you!");
	
	flags["BRANDY_RELATIONSHIP"] = 2;
	
	brandyMenu();
}

//stay casual with brandy
//[Casual]
public function brandyCasualTalk():void
{
	clearOutput();
	showBrandy(false);
	author("HugsAlright");
	if (silly) author("HugsItsNotAlright");
	
	if(pc.isAss()) output("Simply speaking your mind, you");
	else output("Doing your best to let the cowgirl down easy, you");
	output(" tell Brandy that you’d rather stay in a more casual relationship with her, like the friends-with-benefits you currently are.");
	output("\n\nThe New Texan nearly winces at that, her shoulder tensing like she’s in pain and an unsure smile cracking across her face. You almost think she might start to cry, but Brandy takes a deep breath, puffing out her chest before exhaling calmly. Then, she simply nods and gives you an understanding <i>“Moo”</i> with a gentle smile on her face.");
	output("\n\nSmiling back at the cowgirl, you thank the void that she took that bit of rejection so well, and figure it’d be best to move past this whole thing rather than linger on the topic much longer. Because even though you aren’t a couple now, you’re sure Brandy would still like to spend some time with you.");
	
	flags["BRANDY_RELATIONSHIP"] = 1;
	
	//set timer for Brandy to start relationship with Sally in 7 days
	setBrandySallyTimer(7);
	
	brandyMenu();
}

//get brandy's letter from ogram
public function getBrandysLetter():void
{
	clearOutput();
	author("HugsAlright");
	if (silly) author("HugsItsNotAlright");
	showBust("OGRAM");
	
	output("As you’re passing through custom, the familiar voice of a familiar bull stops you in your tracks, Ogram.");
	output("\n\n<i>“Oh, hey there, [pc.name]. Hold up a second,”</i> he says, quickly grabbing your attention, <i>“I got something I’m supposed to deliver to ya’.”</i>");
	output("\n\nWith that the bull reaches down behind the counter and fiddles around for a moment");
	if (pc.isBimbo()) output(" leading you to believe that Ogram might be trying to give you something a little more than your average delivery for a moment");
	output(" before he returns from his trip under the desk with a red envelope in hand.");
	output("\n\n<i>“Some girl came by and dropped this off: green pig tails, bell around her neck,”</i> he continues, waving the crimson letter around as you approach the counter, <i>“She didn’t say much... well she didn’t say </i>anything<i> come to think, but uh, she pointed out your name on the letter, so I figured it was for you.”</i>");
	output("\n\nSounds like Brandy.");
	output("\n\nWith that he holds out the letter for you to take, and you reach a hand out to take it, thanking the bull for the delivery");
	if (pc.isBimbo()) output(" with a kiss");
	output(" as the letter comes free of his grasp."); 
	output("\n\n<i>“No problem, " + pc.mf("sir","missy") + ",”</i> he says as you [pc.walk] away, red envelope in hand. <b>You’ve got a letter from Brandy! Maybe you should open it!</b>");
	//give pc brandy letter key item and an inventory item they can read
	output("\n\n");
	quickLoot(new BrandyLetter());
}
//set timer for Brandy to start a relationship with Sally
public function setBrandySallyTimer(iDays:int = 1):void
{
	if (hours < 3) iDays -= 1;
	if (iDays <= 0) return;
	var time:int = ((23 - hours) * 60) + (60 - minutes);
	time += (24 * 60) * (iDays - 1);
	
	pc.createStatusEffect("Brandy Sally Timer", 0, 0, 0, 0, true, "", "", false, time);
}

//is Brandy currently hanging with Sally (from 2 to 6)
public function isBrandyWithSally():Boolean
{
	if (hours >= 2 && hours <= 5 && flags["BRANDY_RELATIONSHIP"] == 1 && flags["MET_SALLY"] != undefined && !pc.hasStatusEffect("Brandy Sally Timer")) return true;
	return false;
}
//main menu for interacting with the couple Brandy and Sally
public function brandySallyMenu():void
{
	clearMenu();
	addButton(0,"Talk",brandySallyTalkMenu,undefined,"Talk","Have a chat with the couple over some drinks.");
	addButton(1,"Threesome",brandySallyThreesome,undefined,"Threesome","You don’t think either of these cowgirls would turn down an opportunity for a threesome!");

	addButton(14,"Back",mainGameMenu);
}
//talk option menu
public function brandySallyTalkMenu():void
{
	clearMenu();
	addButton(0,"Them",brandySallyTalkThem,undefined,"Them","Find out about how these two beauties got together.");

	addButton(14,"Back",brandySallyMenu);
}
public function approachBrandySally():void
{
	clearOutput();
	showBrandySally(true);
	author("HugsAlright");
	if (silly) author("HugsItsNotAlright");
	
	if (flags["MET_BRANDY_SALLY"] == undefined)
	{
		output("Seeing Brandy out naked in public like this piques your curiosity, and leads you to [pc.walk] over to the couple of cow gals. They seem pretty engrossed in each other’s company, with Sally leaning in close to her minty-haired friend and talking to her, leading to some giggling, happy moos from the cowgirl. The pair doesn’t seem to notice you until you’re close, with the darker of the two girls turning your way, a gentle smile appearing on her face when she sees who’s come to visit.");
		output("\n\n<i>“Well hey there, [pc.name],”</i> she coos with her usual, sultry voice.");
		output("\n\nBrandy jumps slightly when she hears Sally say your name, and slowly turns her barstool to face you as you take a seat next to her. When she sees that it is indeed you, she blushes hard and tries to cover herself by shifting her body around, giving you a nervous smile as she does. Her rum-titted friend notices her embarrassed reaction and smiles all the wider.");
		output("\n\nShe looks back to you for a moment and winks before turning to Brandy again. <i>“Sweety,”</i> she says, draping her arms around the nervous cowgirl’s shoulders, <i>“Do you know [pc.name] here?”</i>");
		output("\n\nBrandy turns her head back and forth between the two of you and then nods, with a wobbly smile and red-flushed cheeks.");
		output("\n\nSally grins at that, and looks up at you again, <i>“Oh... so you must’ve been that friend Brandy mentioned.”</i> The rum-cow releases her brandy-boobed counterpart and leans back again, patting a hand on her shoulder, <i>“It’s good to know she has friends out there.”</i>");
		output("\n\nHuh, looks like your mute lover has been making some girlfriends recently.");
		output("\n\nBrandy seems to be blushing a bit less now, settling back into her seat as Sally speaks up again, <i>“Well, now that you’re here, [pc.name], what do you think about spending some time with me and Brandy for a bit? We could use some company.”</i> She winks your way as a sly smile crosses her face before leaning into her green-haired friend again, <i>“Right, sweetie?”</i>");
		output("\n\nThe cowgirl seems almost surprised by the question, but nods hurriedly with a happy look on her face.");
		output("\n\n<i>“Seems like we’re in agreement here, sugar,”</i> Sally coos to you, pheromones wafting over past Brandy and right to your nose, <i>“So, [pc.name], care to have some drinks with us?”</i>");
		output("\n\nWell, with Sally’s scent clouding your mind, and two exhibionist lovers right here, it’s hard to say no. You could probably talk with the pair or have some fun together... or leave if you have the willpower to.");
	}
	else
	{
		output("You decide to make your way over to the couple of cowgirls, grabbing their attention as you near the bar. Both Brandy and her girlfriend turn to face you with happy smiles. Finally taking a seat at the bar, you swivel your stool to face the pair, already able to feel Sally’s pheromones taking their effect on your mind.");
		output("\n\n<i>“Nice of you to visit us, [pc.name],”</i> Sally coos, leaning forward and draping her arms over Brandy’s shoulders, <i>“What brought you over to visit lonely ol’ us today?”</i> Then, with a sly grin, she slides her hands down and gives her fellow cow-gal’s exposed tits a little, loving squeeze, making her jump and let out a surprised <i>“Moo!”</i> while Sally simply giggles.");
		output("\n\nShe quickly turns her attention back to you, patiently awaiting any word from you.");
	}
		
	pc.lust(5);
	brandySallyMenu();
}
//talk about them
//[Them]
public function brandySallyTalkThem():void
{
	clearOutput();
	showBrandySally(true);
	author("HugsAlright");
	if (silly) author("HugsItsNotAlright");
	
	output("<i>“Oh, us?”</i> she says, touching a hand to her collarbone as your drinks arrive, <i>“Well, me and Brandy used to be co-workers back at Bailey’s... we were both in the same department.”</i> The rum-cow pauses and takes a drink, before licking her lips and turning to her brandy-boobed friend, <i>“We were acquaintances at the most. I would say ‘goodbye’ and ‘hello’ as we came and went, but I never really got to know her, always ran off right after her shift ended... I didn’t even know she was mute!”</i>");
	output("\n\nSally smiles and wraps an arm around a blushing Brandy’s shoulders before continuing, <i>“But, I saw her here at the Bronco");
	if (flags["MET_BRANDY_SALLY"] == undefined) output(" about a week ago");
	else output(" one day");
	output(" and recognized her, but I didn’t know from where... so, I went up to her and I guess we just hit it off.”</i> She leans into her girlfriend, wrapping her other arm around Brandy in a quick hug, making the minty-haired cowgirl moo happily before Sally pulls back.");
	if (pc.isAss()) output("\n\nYou");
	else output("\n\nGlad that Brandy found herself a nice girlfriend, you");
	output(" turn your attention to the shy New Texan and ask her about her odd change of wardrobe.");
	output("\n\nBrandy only blushes harder at that question, prompting Sally to giggle before explaining the situation for her girlfriend. <i>“Oh, I just thought Brandy could use a little bit more... self confidence with that pretty body of hers, and being out in the sun at the brewery all day in those stuffy clothes, I couldn’t stand the thought!”</i> Then, with a smirk, the chocolate cow cups one of Brandy’s tits, making her suck in a silent gasp before Sally pulls back and chuckles.");
	output("\n\nSeems like your mute cow-pal has found herself a nice girlfriend.");

	//set met brandy sally flag		
	pc.lust(5);
	flags["MET_BRANDY_SALLY"] = 1;

}

public function brandySallyThreesome():void
{
	clearOutput();
	showBrandySally(true);
	author("HugsAlright");
	if (silly) author("HugsItsNotAlright");	
	
	output("All those pheromones in the air are getting to you, the two lovely ladies here doing nothing for the terrible, needy ache in your groin. So, with a lusty grin on your face, you ask the two girls how they’d feel about heading to");
	if (flags["SEXED_SALLY"] == undefined) output(" Brandy’s place");
	else output(" Sally’s room");
	output(" for some fun.");
	output("\n\nYour query has Brandy turning red and shrinking in her seat with a smile, and leaves Sally with a look as ador-filled as yours.");
	output("\n\n<i>“Hmmm,”</i> The rum-cow muses, leaning forward and wrapping her arms around her girlfriend’s waist, <i>“I dunno why we have to go <i>all the way</i> to ");
	if (flags["SEXED_SALLY"] == undefined) output(" Brandy’s house");
	else output(" my room");
	output(" when we can do the same thing right here?”</i> With that, Sally slides her hands down to Brandy’s thighs and gives her legs a gentle spreading, baring her juicy pink pussy to you (and the rest of the bar). That has the freckled - covered cowgirl squirming in her spot, letting out nervous little moos and turning as red as");
	if (silly) output(" some sick ass LEDs in a gaming rig");
	else output(" Epsilon Eridani’s second star");
	output(" while her much-less-shy lover leans in close to one of her bovine ears. <i>“C’mon, sweetie,”</i> she coos, running her hands up Brandy’s curves to the swell of her breasts, <i>“It’ll be fun... just like working at the brewery.”</i>");
	output("\n\nBrandy looks back at her lover for a moment, and then back to you with a shy, but lust-filled smile on her face, bang-cloaked eyes scanning you for a moment before she nods.");
	output("\n\nThat prompts a big grin from Sally who looks back up at you, <i>“Alright, [pc.name], why don’t you help me out with this cutie?”</i> She gives the shy cowslut’s tits a gentle squeeze, tearing a quiet, pleasured moo from her lips.");
	
	//pc is not taur and has a cock that fits
	if(!pc.isTaur() && pc.hasCock() && pc.cockThatFits(brandyCapacity()) >= 0) 
	{
		var x:int = pc.cockThatFits(brandyCapacity());
		if (x < 0) x = pc.smallestCockIndex();
		
		output("That’s all the invitation you’ll ever need.");
		if (pc.isNude()) output(" Already as naked as the pair of bovine broads, all there is to do is stand from your stool and position yourself between Brandy’s legs, Sally biting her lip with anticipation of the show to come.");
		else output(" Without saying another word, you stand from your stool and start to undress, pulling away your clothes until your pheromone-stiff erection is out in the open, leaving Sally biting her lip and Brandy’s breath ragged.");
		output(" You take hold of the cowgirl’s freckle-covered thighs and lift her legs all the way up, spreading them as you go until her ankles are inches from Sally’s face. ");
		output("\n\nSpeaking of, the rum-cow has her eyes glued on your crotch, eagerly awaiting your less-than-private moment of penetration. ");
		output("\n\nWell, you are in public, so there’s no reason for any ritual or ceremony, and even less reason to not give Sally a show. So, with a shift of your [pc.hips], you line your [pc.cockhead " + x + "] up with Brandy’s drooling, hungry slit and start to push forward. Almost immediately, the quiet cowgirl starts biting down hard on her lip, trying to supress pleasured moos as your glans starts to spread her lower lips. She blushes hard and closes her eyes and you thrust your hips forward just a little, finally penetrating her pussy, a shuddering moo forcing its way past her shapely lips.");
		output("\n\nYou don’t let up and slowly saw more and more of your shaft into her, stretching her nether lips until she can no longer suppress her pleasure and starts mooing up a blissful chorus.");
		output("\n\nSally grins all the wider when you finally bottom out inside the moaning cowgirl, managing to pry her eyes from your’s and Brandy’s hips to begin kissing at her girlfriend’s neck and fondle her tits. As you start rocking your hips, your rum-titted lover starts to squeeze at you new cocksleeve’s breasts, kneading them in her hands and moving her hands upward to play with her nipples. Soon, with your thrusting and Sally’s mammary ministrations, you both have Brandy mooing pleasurably and leaking brandy from her perky pink nipples in no time.");
		output("\n\nYour rocking hips start to pick up in speed before too long, caressing your lover’s sensitive inner walls as they in turn hug at your cockflesh, leaving you in warm, wet bliss as Brandy starts to spill fem-lube all over the floor, practically gushing the clear slippery stuff out with each inward thrust you make. Her whole body clenches now and then, sucking in silent gasps when she does, toes curling.");
		output("\n\nSally takes notice of her girlfriend’s attempts to quell her own pleasure, and leans in close to one of her bovine ears and whispers to her, <i>“C’mon, Brandy, cum for me and [pc.name], right here in the bar.”</i>");
		output("\n\nAnd that, along with the ceaseless pleasure she’s receiving and the pressure from this public setting, is enough to bring the minty-haired, lube-leaking New Texan to orgasm. Her legs tense in your grip, and her pussy clamps down around your [pc.cockNoun " + x + "] like a squishy vice. A single long, loud <i>“MmmmoOOOoooOOOOOO!”</i> erupts from from her lungs, signalling her climax to the rest of the Bucking Bronco. Girlcum gushes from her convulsing cunt, creaming your cock and coating her barstool, thights, and the floor with a fine coating of her feminine fluids.");
		output("\n\nWith her pussy clenching tightly at your [pc.cock " + x + "] (and Sally’s pheromones urging you onward), you too feel compelled to cum, and you do just that. You thrust deep inside the still-orgasming cowgirl,");
		if (pc.hasKnot(x)) output(" sparing her of your [pc.knot " + x + "] in this public situation");
		else output(" burying your swelling tool in her pussy");
		output(" and allow your willpower to slip away. Your hips buck forward against Brandy’s on their own with instinctive, jerky movements while your cock begins to spasm.");	
		
		if (pc.cumQ() >= 2000)
		{						
			if (pc.balls > 0)
			{
				output(" Your [pc.balls]");
				if (pc.balls == 1) output(" empties its");
				else output(" empty their");
			}
			else
			{
				output(" Emptying its");
			}
			output(" voluminous load into your lover’s waiting womb, filling her with all the [pc.cum] she can take, to the point where her normally svelte tummy starts to distend, full of your seed.");
		
		}
		else
		{
			output(" [pc.Cum] fills your lover’s waiting womb, painting her inner walls [pc.cumColor] and leaving the cowgirl to gasp at the sudden warmth of your seed.");
		}
		
		output("\n\nThrough it all, no one in the bar that isn’t involved even bats an eye, this obviously being a common sight on New Texas, and even more common in this saloon.");
		output("\n\nAfter a few more wonderful, fleeting moments of pleasure, you finally come down from your peak. Looking down at Brandy as a cloud of pheromones and lust clears from your vision, you see her panting, expansive chest heaving in Sally’s hands. Your own breathing is as labored and tired as hers, but you still manage to stand straight and look to your rum-cow friend, who has a rather pleased smirk on her face. You grin down at her and tighten your grip on Brandy’s thighs before you start pulling your hips back, withdrawing your softening tool from the poor, tired girl. She lets out a whimpering, pitiful moo as she’s emptied, leaving her leaking your still-warm [pc.cum] onto the bar floor.");
	
		processTime(20);
		pc.exhibitionism(2);
		pc.orgasm();
		IncrementFlag("BRANDY_SALLY_THREESOME_PEN");
	}
	else
	{
		output("That’s all the invitation you’ll ever need. Without saying another word you stand up from your stool and drop to ");
		
		if (pc.isNaga())
		{
			output(" the floor");
		}
		else
		{
			if (pc.tallness >= 84) output(" your haunches"); //7 ft
			else if (pc.tallness >= 49) output(" your knees"); // 4 ft 1 in
			else output(" the floor");
		}
		
		output(" between Brandy’s legs, throwing her shapely legs over your shoulders.");
		output("\n\nWhew, down here the scent of Sally’s pheromones is even more potent, and when it’s combined with the lust-inducing smell of your green-haired lover’s pussy, you feel compelled to dig in almost immediately. You bury yourself between Brandy’s thighs, pressing your [pc.lipsChaste] to her already-sopping labia, kissing at her lower lips before you let your tongue loll from your mouth.");
		output("\n\nThe cowgirl starts to let out whimpering little moos as your [pc.tongue] makes its way inside her, spreading her velvety folds. Her pussy and legs clench around your tongue and shoulders as your mouth-muscle penetrates her, spilling her feminine fluids onto your tastebuds. You manage to look up at the girl as you start to drag your tongue along her inner walls, seeing her blushing and biting her lip in an attempt to suppress needy moos. At the same time, Sally starts to squeeze at Brandy’s breasts, kneading them in her hands and moving her hands upward to play with her nipples. Soon, with your oral affections and Sally’s mammary ministrations, you both have Brandy mooing pleasurably and leaking brandy from her perky pink nipples in no time.");
		output("\n\nYour once gentle tongue-fucking starts to pick up in pace, vigorously eating your bovine lover out until Brandy starts to spill fem-lube all over the floor, practically gushing the clear slippery stuff out with each inward thrust your oral-organ makes. Her whole body clenches now and then, sucking in silent gasps when she does, toes curling.");
		output("\n\nSally takes notice of her girlfriend’s attempts to quell her own pleasure, and leans in close to one of her bovine ears and whispers to her, <i>“C’mon, Brandy, cum for me and [pc.name], right here in the bar.”</i>");
		output("\n\nAnd that, along with the ceaseless pleasure she’s receiving and the pressure from this public setting, is enough to bring the minty-haired, lube-leaking New Texan to orgasm. Her legs tense in your grip, and her pussy clamps down around your [pc.tongue] like a squishy vice. A single long, loud <i>“MmmmoOOOoooOOOOOO!”</i> erupts from from her lungs, signalling her climax to the rest of the Bucking Bronco. Girlcum gushes from her convulsing cunt, coating her barstool, thighs, the floor, and most of your face with a fine coating of her feminine fluids. You happily take all the crystal-clear girl-goo that Brandy will give you, enjoying the flavour of her arousal as she rides out her orgasm.");
		output("\n\nThrough it all, no one in the bar that isn’t involved even bats an eye, this obviously being a common sight on New Texas, and even more common in this saloon.");
		output("\n\nIt all comes to an end eventually, leaving you looking up at Brandy as a cloud of pheromones and lust clears from your vision. You see her panting, expansive chest heaving in Sally’s hands. Your own breathing is as labored with a need for release now burning in you loins, but you still manage to hold yourself upright and look to Sally, who has a rather pleased smirk on her face. You grin up at her before pulling yourself out from between Brandy’s thighs, withdrawing your [pc.tongue] from the poor, tired girl and going to stand up. She lets out a whimpering, pitiful moo as she’s emptied, leaving her leaking the remnants of her orgasm onto the bar floor. Rising back to your");
		
		if (pc.hasLegFlag(GLOBAL.FLAG_HOOVES)) output(" hooves");
		else if (pc.isNaga()) output(" full height");
		else output(" feet");
		
		output(", you’re greeted by your rum-titted friend’s voice.");
		
		processTime(20);		
		pc.lust(20);
		pc.exhibitionism(2);
		IncrementFlag("BRANDY_SALLY_THREESOME_CUN");
	}
	
	output("\n\nSally chuckles, <i>“Great job, sweetie, don’t think I’ve ever heard Brandy moo like that before!”</i> The sweet-smelling New Texan takes her hands off her girlfriend’s breasts, instead opting to hold her waist like some sort of post-coital snuggle in the middle of a bar. <i>“Well,”</i> the rum-cow starts to explain, <i>“Looks like you really tuckered poor Brandy out! Guess she’s just have to rest right here for a bit. Right, sweetie?”</i>");
	output("\n\nWith that, she looks to the cowgirl in question, who turns back to face Sally, giving her a nod and a quiet, tired <i>“Moo...”</i>");
	output("\n\nSmiling, the darker of the two gals gazes back up at you once more, <i>“Hey, once Brandy’s all rested up, I think you should stop by again... I’m sure she’d </i>love<i> to do this again.”</i>");
	output("\n\nThat sounds like a plan to you, already feeling Sally’s potent scent creeping into your mind again. You figure you better clear out and let the two girls rest, saying your goodbyes before heading back into the Bronco.");
	
	pc.lust(5);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}