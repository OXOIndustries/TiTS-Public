import classes.ShittyShips.Blade;

//Here B Fen's werkies. OwU

public function showPo(nude:Boolean = false):void
{
	showName("ILLUSTRIA\nPO");
	showBust(poBustString(nude));
}
public function poBustString(nude:Boolean = false):String
{
	return ("ILLUSTRIA_PO" + (nude ? "_NUDE":""));
}

//Meeting Po
public function encounterDatPoBitchBaybeee():Boolean
{
	showName("DOCTOR\nPO");
	author("Fenoxo");
	showBust(poBustString(),kiroBustDisplay());
	//Stop all TFs from proccing. Also, you either rescue her or bad-end here, so no need to worry much about it.
	flags["KQ_RESCUED"] = GetGameTimestamp();
	flags["KQ_STEP"] = undefined;
	//Not truly met
	if(flags["KQ_LAST_HOUR_TF"] == undefined || flags["KQ_LAST_HOUR_TF"] < 18)
	{
		output("You step through the door, and the mysterious <i>“Doctor Po”</i> responsible for your " + (flags["KIRO_BF_TALK"] == 1 ? "girl":"") + "friend’s suffering sits <i>right there</i>. The cyborg scientist’s chair may be reclined, but she sits bolt upright at the sight of you. Apparently your presence is cause for alertness.");
		output("\n\n<i>“You... you’re fast,”</i> Doctor Po observes. <i>“Too fast.”</i> Her eyes narrow, and she rises to her feet, circling slowly around the lab’s perimeter. <i>“Tell me then, have you cracked quantum foresight?”</i> She leans closer, one eye flashing as she intently regards your face. <i>“No... perhaps unforeseen levels of psychic pow-pfft.”</i> Stifling a giggle, the deranged researcher turns back to regard a very restrained, aroused Kiro. <i>“No, the sensors would have alerted me if you were capable of large scale reality alteration. You...”</i> Doctor Po rounds on you, <i>“...are determined, skillful, and most importantly... lucky.”</i>");
		//Bimbo
		if(pc.isBimbo()) output("\n\nAwww, she likes you! There’s no reason not to beam a giant, happy smile back in response. <i>“Thanks, I guess! Can I rescue my friend now?”</i>");
		//Bro
		else if(pc.isBro()) output("\n\nYou shrug graciously at the praise. <i>“Great. Now give me my friend.”</i>");
		//Nice
		else if(pc.isNice()) output("\n\n<i>“I wish I could say that any of that mattered, but you kidnapped my friend. I’m going to take her back, and I’d appreciate if you stayed out of my way.”</i>");
		//Misch
		else if(pc.isMischievous()) output("\n\nYou graciously shrug. <i>“I get that a lot, which I guess means you’ve got to ask yourself - do you really want to stand between Kiro and I? Do you feel lucky enough to get in the way of the [pc.guyGirl] that just breezed through your entire trap collection?”</i>");
		//Hard
		else output("\n\nYou narrow your eyebrows. <i>“You’re the reason I had to race through a baker’s dozen of half-ass traps and mind-fucked slut-puppets. Get out of my way. I’m taking back my friend.”</i>");
		//Merge
		output("\n\n<i>“Slow down now.”</i> Illustria Po takes a step back and puts her hands up. <i>“I’d rather not battle anyone in such a delicate locale, but...”</i> Her eyes flicker back to Kiro, who seems to have gained a measure of alertness during the discussion. <i>“...my time is valuable. 65’s acquisition and training materials represent a significant outlay of capital. A legal outlay of capital, I must say. I am fully licensed to apprehend and socially recondition pirates, debtors with over one million credits of delinquent credit, and home invaders thanks to the classification of this vessel as New Texan soil.”</i> She pauses to let that sink in. <i>“I recommend making a monetary offer if you’d like to resolve this peacefully. If not, I can always find a buyer for a 66th doll.”</i>");
	}
	//Kiro snaps out instant
	else if(flags["KQ_LAST_HOUR_TF"] < 30)
	{
		output("You step into the lab to find Kiro restrained, and Doctor Illustria Po slowly rising out of her chair. The fluffy pirate in the background immediately struggles against her bindings and shouts, <i>“Hell yeah! Kill this crazy bitch, Angel! Fucking ruin-”</i>");
		output("\n\nA mouthguard slams across the infuriated kui-tan’s muzzle, silencing her diatribe.");
		output("\n\n<i>“Hello, [pc.name].”</i> Illustria offers a formal wave. <i>“I must admit, I did not expect you to ever get this far. That was my mistake, but do not make one of your own. Battling me in my own lab would go badly for you, I assure you, and the services I provide are entirely legal and aboveboard.”</i> Her smile is so self-assured that it’s almost painful to look upon. <i>“I am licensed to capture and socially recondition pirates, debtors with suitably delinquent loans, and home invaders thanks to the classification of my vessel as New Texan territory. It would serve us well to resolve the matter financially rather than violently.”</i>");
		//Bimbo
		if(pc.isBimbo()) output("\n\nYou giggle, <i>“So you’re gonna pay me?”</i>");
		//Else
		output("\n\nYou narrow your gaze. <i>“How much are you offering?”</i>");
		//merge
		output("\n\nDoctor Po violently throws back her head and unleashes a screeching cackle of unrepentant delight. <i>“You... you thought... you thought I was offering to pay... pay you? Oh my, dear, you really are a special case aren’t you? Are you sure you don’t want to become one of my dolls? I could make you such a sweetheart.”</i> She giggles, <i>“No, no, of course not. The miscommunication was mine, I suppose. What I was suggesting was reimbursement for the capital I had to lay out for your friend’s treatments, conditioning, etcetera <b>and</b> the damages your presence has inflicted upon my lovely home. For the right price, we can all leave happy.”</i>");
		output("\n\nKiro grunts through the gag.");
		output("\n\n<i>“Oh, hush. If your dear Captain Steele comes through for you, you’ll get to go home with the benefits of my work </i>and<i> a fully intact mind. You have no idea the lottery you’re about to win, pet.”</i>");
	}
	//Kiro snaps out slow
	else if(flags["KQ_LAST_HOUR_TF"] < 36)
	{
		output("You step into the by now familiar lab. Kiro is strapped down to a table and drooling all over her [kiro.chest], but more pressing is the presence of Doctor Illustria Po, now rising out of her seat to confront you. Her body language conveys extreme confidence mixed with a bit of obvious concern about your presence. You ignore her to call out to the sexually-blissed tanuki, <i>“Kiro! Kiro, are you okay?”</i>");
		output("\n\nIllustria rolls her eyes and steps aside, quietly talking to herself. <i>“The durability of unfinished conditioning is a facet of my research that deserves further attention in the future.”</i>");
		output("\n\nFortunately, the fearless, fluffy pirate begins to blink, drifting back to awareness with your increasingly urgent calls. Blushing so thickly you can see it through her fur, Kiro turns to you and says, <i>“Angel! You came... a little late, but you came!”</i> She shudders and twists around, eyes widening at the sight of a very alive and undefeated Doctor Po. <i>“Kill her, [pc.name]! Kill that fucking bitch!”</i>");
		output("\n\nA strap flips up and neatly binds the kui-tan’s muzzle closed.");
		output("\n\n<i>“Yes, yes, you’re shaking off the incomplete programming quite effectively. Now the individuals not classified as property can have a conversation about the sexdoll in the room.”</i> Illustra saunters in a slow orbit. <i>“I would prefer to avoid open combat if possible. This lab represents a significant outlay of capital... and the work I did on your friend was anything but cheap. I am an artist, and my supplies are as refined as my palette.”</i>");
		output("\n\nYou growl, <i>“Give me a reason not to.”</i>");
		output("\n\n<i>“I’ll give you several,”</i> the cocky scientist promises. <i>“First, my work is 100% above board and legal. I am licensed to subdue and recondition pirates for reintegration into proper society. Debtors too, if they owe enough. More pressing is the classification of this vessel as New Texan soil and their incredibly liberal laws regarding home defense. I could walk you into the core with a leash around your neck and nobody would bat an eye, not even your poor Daddy’s surprisingly impressive legal team. I’m giving you an opportunity to find a solution that works for both of us. If you throw that away, your new station as a literal sex object won’t be my fault.”</i>");
		output("\n\nWell, it’s a good sign that she’s worried enough to seek a peaceful solution, but it sounds like she wants you to pay for it. What do you do?");
	}
	//Kiro snaps out barely
	else if(flags["KQ_LAST_HOUR_TF"] <= 42)
	{
		output("You charge into Doctor Po’s lab, and more or less as predicted, both Kiro and the cyborg scientist are present. The latter is closer, rising out of a chair with a look of raw disappointment, but your concern is squarely on the tanuki pirate and her expanded rack. Right now, her eyes are closed and her hips are resolutely pumping against a toy they’ve been mated to. She whimpers continually, nearly mad with the need to cum, while the heaving tits she’d been burdened with quake along with her every motion.");
		output("\n\nYou call out, <i>“Kiro! Are you still with me?”</i>");
		output("\n\nThe cyborg steps back while you advance on your friend, muttering about testing the limits of incomplete programming.");
		output("\n\n<i>“A-angel?”</i> Kiro moans, humping faster and harder. A fine sheen of sweat slicks her fur to her body, fully revealing the changes Illustria’s science has wrought. <i>“My angel... so hot. Yeah, you’d take my cum, [pc.name]! You always let me cum. Always so much easier to c-c-cum with you!”</i> Her flare acts as its name would imply, and a torrent a rich, creamy kui-tan spooge issues forth into the collection tube, flooding it to capacity. <i>“F-f-fuck I should’ve just been </i>your<i> doll instead of a pirate...”</i>");
		output("\n\n<i>“Kiro,”</i> you try again, touching her cheek, <i>“Come back to me baby.”</i>");
		output("\n\nThe tanuki, still leaking jism, blinks her eyes open. <i>“[pc.name]? You... I...”</i> She shudders, flare audibly slapping against the glass as she violently cums once more. <i>“F-f-fuck you came to rescue me, and I can’t stop cumming like some kind of broken slut!”</i> It’s then that she notices Po’s presence in the room, and Kiro’s eyes sharpen from glassy orbs to focused diamonds. <i>“The bitch is still here? Kill her, [pc.name]! Kill her before she gets you too!”</i> The tanuki thrashes against her bindings, still hard. <i>“Or cut me loose. I’ll do it for you... right after I fuck her slutty, stupid holes.”</i> A look of confusion flashes across her features before she decides. <i>“No, screw that. Kill her and fuck me. Do it!”</i>");
		output("\n\nDoctor Po gestures with one finger, and a band slaps out of the table around Kiro’s muzzle, binding it tight. <i>“This is a conversation for non-property individuals, 65, though you’ve revealed impressive tenacity in shaking off so much of my conditioning.”</i> She turns to you with a blood-curdling smile. <i>“Now as for you [pc.name], you have invaded my home, which owing to its classification as New Texan soil means I am authorized to end your life... or use my status as a pirate reconditioning expert to turn you into an object of servile pleasure.”</i> She pauses and stares at you unblinkingly. <i>“Yet you have fought hard and come far. Further conflict would be deleterious to either of our interests. Perhaps we can come to an arrangement.”</i>");
		output("\n\nAn arrangement? She’s been mutating and brainwashing your friend without a second thought, and she wants you to keep your hands to yourself? Then again, Illustria’s wealth has clearly come from holding up her bargains. Buying Kiro’s way out of her plight might not be heroic, but it’d be safe and reliable.");
		output("\n\nWhat’s a Rusher to do?");
	}
	//Kiro broke
	else
	{
		output("You charge into Doctor Po’s lab, and more or less as predicted, both Kiro and the cyborg scientist are present. The latter is closer, rising out of a chair with a look of smug success disappointment, but your concern is squarely on the tanuki pirate and her expanded rack. Right now, she kneels on the floor with her firmly erect prick buried inside an ultraporn-star’s worth of cleavage. The atmosphere of the lab is musky with the scent of her arousal, a small puddle of slick pussyjuice ever so gradually thickens beneath her knees. If she’s aware of your presence, she doesn’t make it known. Her eyes stay fixed firmly upon Illustria’s backdoor while she silently licks her lips.");
		output("\n\nYou call out, <i>“Kiro! Kiro! Are you okay?”</i>");
		output("\n\nThe cyborg steps to the side and kneels down next to Kiro. <i>“Go ahead. Tell [pc.himHer]. Tell [pc.himHer] if you’re upset, or worried, or whatever’s on your mind.”</i>");
		output("\n\nYour tanuki friend regretfully drags her gaze from the scientist’s fluid-filled form and meets your gaze with lidded eyes. <i>“Uhh, hey, [pc.name]. Sorry about the call. I was really, really confused, but Miss Po has made me so <b>obedient</b> and horny.”</i> She shudders and reaches into her mammoth mounds, producing an entire handful of slick pre. It takes her a single swallow to devour most of it. <i>“But she made my titties so big and good, and I cum so easy now. And like, no matter what I might think about a person, when I know that they own me, it makes me so hot for them, like... If you were my owner I could just live between your legs and be happy like that, ya know? It’s like that syrupy lovey goodness that you get when you first bed a girl, but it never goes away and it’s always sloshing around my slutty little dollbrain!”</i> She looks back over her shoulder at the cyborg scientist. <i>“You should totally help [pc.name] like you helped me! [pc.HeShe] would make the best doll!”</i>");
		output("\n\nNo...! She sounds completely, totally broken - the kind of psychological taint nobody comes back from. It’s clear from the fluffy fuckdoll’s expression and mannerism that she has wholeheartedly devoted herself to pleasure and service. Even with the galaxy’s best therapists and doctors on the case, you doubt you’d ever get the old Kiro back. Like or not, your inaction gave Doctor Po all the time she needed to turn your freewheeling friend into a simpering slut. Still, you’d rather not leave her in the mad doctor’s hands. <i>“She’s not yours to own or sell.”</i>");
		output("\n\nDoctor Po seems completely taken aback by the statement. <i>“The law differs, my simple-minded friend. I am legally licensed to capture and recondition pirates so that they’ll be of some use to society. Debtors and home invaders too, though the latter is only thanks to the classification of my vessel as New Texan soil. 65, or Kiro as you knew her, is legally my property to do whatever I want with. The galaxy wouldn’t bat an eye if I sold her organs for parts, and to be frank, the wealthy and powerful are quite taken with my wares. Legally, you are in the wrong.”</i>");
		output("\n\nShe can’t be serious, can she?");
		output("\n\n<i>“I am as serious as your friend’s crimes are, but I am not unreasonable. Combat within the confines of my lab is an outcome I would prefer to avoid, even if it does result in 65 getting a sister to sell with her. No, I would much rather we handle this like the businesspeople we’re both supposed to be. For your trouble, you can have the opportunity to buy sixty-err, Kiro, before anyone else. Of course, for the damage you’ve done while traipsing through my home, I’ll need to charge a little extra. It’s only fitting.”</i> She pats Kiro’s head fondly. <i>“It will be worth every cred, I promise. This is one of my finest works.”</i>");
		output("\n\nShe wants you to <i>buy</i> your broken friend back from her? The audacity of this woman! Still, it would bring a swift and safe end to this unfortunate saga. What do you do?");
	}
	processTime(8);
	clearMenu();
	addButton(0,"Barter",barterWithPo,undefined,"Barter","Try to buy your friend’s freedom.");
	addButton(1,"Fight",fightDatScientisto,undefined,"Fight","Put an end to this.");
	if(kiro.isBimbo()) addButton(2,"Leave Kiro",screwSavinKiro,undefined,"Leave Kiro","You’re too late. You might as well go home.");
	return true;
}

public function fightDatScientisto():void
{
	var tEnemy:Creature = new KQDoctorIllustriaPo();
	setEnemy(tEnemy);
	CombatManager.newGroundCombat();
	CombatManager.setHostileActors(tEnemy);	
	CombatManager.setFriendlyActors(pc);
	CombatManager.victoryScene(spankPosNastyAss);
	CombatManager.lossScene(badEndToDatPo);
	CombatManager.displayLocation("DOCTOR PO");
	
	CombatManager.beginCombat();
}

//Credits
//Fast: 10k
//Kinda fast: 20k
//Not so fast: 30k
//Slowish: 40k
//Bimbroke: 75k
public function kiroCost():Number 
{
	var adjustment:Number = 0;
	var kiroTimeClass:Number = 0;
	//figure out amount TFed
	if(flags["KQ_LAST_HOUR_TF"] == undefined || flags["KQ_LAST_HOUR_TF"] < 18) kiroTimeClass = 0;
	else if(flags["KQ_LAST_HOUR_TF"] < 30) kiroTimeClass = 1;
	else if(flags["KQ_LAST_HOUR_TF"] < 36) kiroTimeClass = 2;
	else if(flags["KQ_LAST_HOUR_TF"] <= 42) kiroTimeClass = 3;
	else kiroTimeClass = 4;

	if(flags["KQ_OFFER_FAIL"] != undefined) adjustment += flags["KQ_OFFER_FAIL"];
	if(adjustment + kiroTimeClass <= 1) return 10000;
	else if(adjustment + kiroTimeClass <= 2) return 20000;
	else if(adjustment + kiroTimeClass <= 3) return 30000;
	else if(adjustment + kiroTimeClass <= 4) return 40000;
	else return 75000;
}

public function makeKiroOffer(amount:Number):void
{
	flags["KQ_BUY_OFFER"] = amount;
	trace("KBUY OFFER: " + amount + " KBUY WANTED: " + kiroCost());
	if(amount >= kiroCost()) successfullyBuyKiro();
	else getRejectedBitch();
}

public function barterMenu():void
{
	clearMenu();
	var offered:Number = 0;
	if(flags["KQ_BUY_OFFER"] != undefined) offered = flags["KQ_BUY_OFFER"];
	if(flags["KQ_OFFER_FAIL"] != 2)
	{
		if(offered < 10000) addButton(0,"10,000",makeKiroOffer,10000,"10,000","Offer 10,000 credits.");
		else addDisabledButton(0,"10,000","10,000","You’ve already offered that much or more.");
		if(offered < 20000) addButton(1,"20,000",makeKiroOffer,20000,"20,000","Offer 20,000 credits.");
		else addDisabledButton(1,"20,000","20,000","You’ve already offered that much or more.");
		if(offered < 30000) addButton(2,"30,000",makeKiroOffer,30000,"30,000","Offer 30,000 credits.");
		else addDisabledButton(2,"30,000","30,000","You’ve already offered that much or more.");
		if(offered < 40000) addButton(3,"40,000",makeKiroOffer,40000,"40,000","Offer 40,000 credits.");
		else addDisabledButton(3,"40,000","40,000","You’ve already offered that much or more.");
		if(offered < 75000) addButton(4,"75,000",makeKiroOffer,75000,"75,000","Offer 75,000 credits.");
		else addDisabledButton(4,"75,000","75,000","You’ve already offered that much or more.");
		if(pc.hasKeyItem("Platinum 190")) addButton(5,"Plat 190",plat190OfferForIllustria,undefined,"Plat 190","Offer one of the rarest metals in the galaxy.");
		else addDisabledButton(5,"Plat 190","Plat 190","You don’t have any of this to offer.");
	}
	else
	{
		addDisabledButton(0,"10,000","10,000","You pissed her off. She wants all your money.");
		addDisabledButton(1,"20,000","20,000","You pissed her off. She wants all your money.");
		addDisabledButton(2,"30,000","30,000","You pissed her off. She wants all your money.");
		addDisabledButton(3,"40,000","40,000","You pissed her off. She wants all your money.");
		addDisabledButton(4,"75,000","75,000","You pissed her off. She wants all your money.");
		addDisabledButton(5,"Plat 190","Plat 190","You pissed her off. She wants all your money.");
	}
	if(pc.credits >= 1000) addButton(6,"Everything",buyKiroWithEverything,undefined,"Everything","Give her every credit you have.");
	else addDisabledButton(6,"Everything","Everything","There’s no way she’d accept such a paltry sum.");
	addButton(7,"Fuck This",fuckHaggling,undefined,"Fuck Haggling","Screw this. Fight the bitch!");
	if(flags["KQ_PLAT_OFFERED"] != undefined && pc.IQ() >= 80) addButton(9,"(INT) Plat190",highIQPlat190Addon,undefined,"(INT) Plat 190","She’s smart, but she must not realize the magnitude of this offer. She’ll respect intelligence, right?");
}

public function barterWithPo():void
{
	clearOutput();
	showPo();
	author("Fenoxo");
	output("<i>“Maybe... we can come to an arrangement,”</i> you suggest, lowering your [pc.weapon] ever so slightly.");
	if(!kiro.isBimbo()) output("\n\nKiro stares bullets at you over her gag, but her current state is proof enough that violence isn’t your best option.");
	output("\n\nIllustria Po inclines her head slightly, favoring you with a measure of respect. <i>“Good to hear. While I saddened that you didn’t fall prey to any of my traps, I’m willing to entertain a more... at cost exchange than I usually pursue with my wealthier clientele.”</i> Her eye’s backlights flicker. <i>“However, given the... rather unique circumstances in which we find ourselves, I think it’s only fitting that you make an offer. What is " + (!kiro.isBimbo() ? "Kiro":"65") + " worth to you? What price tag would you put on your friend’s continued presence in your life?”</i> She smiles cruelly. <i>“The psychological will prove invaluable, I’m sure.”</i> She looks your way expectantly.");
	output("\n\nWell, what will you offer for Kiro?");
	processTime(2);
	clearMenu();
	barterMenu();
}

//Plat 190:
public function plat190OfferForIllustria():void
{
	clearOutput();
	showPo();
	author("Fenoxo");
	output("Inspired, you produce the platinum 190 you discovered during your adventure to the core of Tarkus. It gleams as brightly as polished jewelry. <i>“How about this?”</i>");
	output("\n\nDoctor Po stares flatly at the metal and then at you. <i>“Are you joking? My dear, I am an artist, not some corporate mining conglomerate. I don’t distract myself with material exchanges when it comes to payment. I ask for cash for my creations, and I receive that gratification as powerfully and instantaneously as my pets’ desire.”</i> She strokes a digit along her inner thigh at the memory. <i>“No, this will not do, though I shall not hold this attempt against you. Make me a better offer. A [pc.manWoman] of your breeding and means surely has access to some assets, however minimal.”</i>");
	flags["KQ_PLAT_OFFERED"] = 1;
	processTime(2);
	//show haggle menu again, tack on "Intelligence"
	barterMenu();
}

//[IQ 80%+] INTELLIGENCE
public function highIQPlat190Addon():void
{
	clearOutput();
	showPo();
	author("Fenoxo");
	output("<i>“Really?”</i> you counter. <i>“This is platinum 190, one of the rarest forms of one of the rarest metals in the galaxy.”</i> You pause for effect, lifting the metal higher. <i>“While I don’t have the current figures on its value handy, I wager it would be more than enough to pay for the cost of one of your so-called dolls at full price - more than valuable enough to tolerate an hour spent tracking down a buyer.”</i> You place it on a nearby table. <i>“You struck me as the kind of woman who preferred to do things correctly, not fast. Was I wrong?”</i>");
	output("\n\nIllustria’s expression softens and adopts a look of surprise and a hint of... respect? <i>“You make a persuasive offer, [pc.name]. While you were prattling on, I did a quick scan to verify the metal’s composition and value, and your crude estimates were correct. In this instance, tolerating a bit of metallurgy is to our mutual benefit. Leave the metal, and you may depart with " + (kiro.isBimbo() ? "my greatest creation, unharmed":"your dear Kiro, unmolested") + ".");
	flags["KQ_BUY_OFFER"] = -1; //Fen note: OwO. Me smurt. Make number that can't actually be offered for tracking
	pc.removeKeyItem("Platinum 190");
	output("\n\n(<b>Key Item Sold:</b> Platinum 190)");
	processTime(2);
	//go to buy scene :3
	clearMenu();
	addButton(0,"Next",youBoughtASlutGoodJob);
}

public function getRejectedBitch():void
{
	clearOutput();
	showPo();
	author("Fenoxo");
	IncrementFlag("KQ_OFFER_FAIL");
	//Offer rejected, first time
	if(flags["KQ_OFFER_FAIL"] == 1)
	{
		output("You name a figure.");
		output("<i>“What?”</i> Illustria recoils harder than an artillery cannon. <i>“That’s what she’s worth to you? That pittance? Maybe you assumed I’m the scientific version of a cheap slattern you can buy off with a handful of thousand-credit chits? You’re wrong both ways. This wouldn’t even begin to compensate me for the time I dumped into that fluffy bimbo. Make me a better offer. A serious one. I do not appreciate having my time wasted, [pc.name].”</i>");
	}
	//Offer rejected second time
	else
	{
		output("You name another price... and instantly realize you’ve made a mistake.");
		output("\n\nIllustria’s face hardens into a razor-sharp sneer. She looks over her shoulder at Kiro, then back at you. <i>“You realize that she’s a living person, right? You’re clearly here because you think me some kind of monster for making improvements to the dolls that come through my doors, but you aren’t even willing to pony up the price of a service contract for a girl of her caliber?”</i> She snorts, a sound you assume requires conscious effort for a woman more robot than flesh. <i>“You’ve wasted enough of my time. Either present me with the entirety of your meager wealth, or kneel. I’ll have my payment or a second doll when we’re done here.”</i>");
		output("\n\nUh oh.");
	}
	processTime(3);
	barterMenu();
}

//Offer accepted
public function successfullyBuyKiro():void
{
	clearOutput();
	showPo();
	author("Fenoxo");
	//didnt massively overpay
	if(flags["KQ_BUY_OFFER"] < kiroCost() * 1.5)
	{
		output("You name a " + (flags["KQ_BUY_OFFER"] > 30000 ? "hefty ":"") + "price.");
		output("\n\nIllustria pauses, staring at you intently. Her eyes flicker a few times as she weighs the value of your offer against her personal time and expenditures. <i>“I... can accept this. It is not the end to this affair that I desired or predicted, but it will suffice. We can return to our respective activities without further interference, and you have my solemn oath as a reputable merchant that you’ll " + (!kiro.isBimbo() ? "both ":"") + "be allowed to return to your vessel" + (!kiro.isBimbo() ? "s":"") + " unharmed." + (kiro.isBimbo() ? " I’ll be keeping 65’s, of course. She’s in no shape to drive anything bigger than a cock these days.":"") + "”</i> She circles a finger in mid-air. <i>“Transfer the credits, and you may take your friend.”</i>");
		output("\n\nYou do it.");
	}
	//Overpaid
	else
	{
		output("You name a " + (flags["KQ_BUY_OFFER"] > 30000 ? "hefty ":"") + "price.");
		output("\n\nIllustria pauses for half a second before a pleased grin spreads across her face. <i>“I accept your generous offer. I had assumed the reports of your sire’s beneficent nature to be a greatly exaggerated PR move, but it would appear I rushed into judgement too quickly. I’d love to pick apart your genome for altruism-connected markers, but I imagine you left at least one sample for me" + (pc.hasCock() ? ", perhaps in one of my pets":"") + ".”</i> She shakes her head. <i>“Apologies for digressing. As soon as you transfer the credits, I will release your friend safely, and you can depart with your ship" + (!kiro.isBimbo() ? "s":"") + " unmolested." + (kiro.isBimbo() ? " Dear Kiro’s vessel will stay here, of course. She’s in no shape to need it, nor to drive it. I trust you’ll take good care of her. Do not disappoint me.":"") + "”</i>");
		output("\n\nYou wire the credits over.");
	}
	processTime(3);
	pc.credits -= flags["KQ_BUY_OFFER"];
	clearMenu();
	addButton(0,"Next",youBoughtASlutGoodJob);
}

//Everything
public function buyKiroWithEverything():void
{
	clearOutput();
	showPo();
	author("Fenoxo");
	output("You show Illustria your bank account. <i>“All of it.”</i>");
	flags["KQ_BUY_OFFER"] = pc.credits;
	//Not much
	if(pc.credits < kiroCost())
	{
		output("\n\nDoctor Po cringes at the sight. <i>“That’s it?" + (flags["KQ_OFFER_FAIL"] != undefined ? " No wonder you low-balled me.":" No wonder you didn’t bring any help!") + " You’re positively destitute, my dear.”</i> She smirks. <i>“Of course that’s your own fault. If you wanted wealth, you would have worked harder for it, and your bank account would display a far more... pleasing number. I shudder to think that I’m rewarding your foolish, indolent nature by accepting this paltry offering, but if you continue down this path, you’re going to be delivered to my office bound and ready for transformation eventually. Consider my discount an investment in a future doll.”</i> She waves dismissively. <i>“Transfer the credits. I’ll see you both safely escorted from my premises.”</i>");
		output("\n\nYou nod and transfer the credits.");
		if(!kiro.isBimbo()) output("\n\n<i>“Make sure she rides on your vessel. 65 is in no shape to pilot anything in the short term, and we both know she’ll have no use for it in the long term.”</i>");
	}
	//Not poor and fucked up twice.
	else if(flags["KQ_OFFER_FAIL"] >= 2 && flags["KQ_OFFER_FAIL"] == undefined)
	{
		output("\n\nDoctor Po shrugs. <i>“You’re a terrible negotiator. You know that, right?”</i> She waves dismissively. <i>“It’s a good thing your father didn’t place you in charge of SteeleTech or you would have run it into the ground faster than a freighter with a malfunctioning navigation system.”</i>");
		output("\n\nYou glare ");
		if(pc.tallness + 10 < 90) output("up");
		else if(pc.tallness - 10 < 90) output("over");
		else output("down");
		output(" at her.");
		output("\n\n<i>“Taking criticism gracefully is another mark of greatness that seems to have passed you by.”</i> Illustria’s eyes flicker. She recoils as if slapped by her own thoughts. <i>“Look at me, bantering like a muck-swilling Rusher instead of tending to the business at hand. I suggested civilized discourse and resorted to base insults instead of finishing this transaction as befitting of a woman of my station.”</i> She throws back her hair fancifully. <i>“I accept your offer. Transfer the credits, and I’ll see you and the kui-tan safely back to your ship" + (!kiro.isBimbo() ? "s":"") + ". No tricks, no traps." + (!kiro.isBimbo() ? " Of course 65 will have to go with you. She’s in no shape to pilot anything, nor do I suspect that she’ll want to for the foreseeable future.":"") + "”</i>");
		output("\n\nWell, that’s more like it." + (pc.isBimbo() ? " You swipe the credits away with a giggle. They’re just numbers anyway!":" You transfer the credits with a few swipes. It’s a hard choice, but Kiro’s worth it."));
	}
	//Tons
	else
	{
		output("\n\nDoctor Po’s eyes widen. <i>“This... is acceptable. With this sum, I will happily release your fluffy consort to your care. My pets and toys will leave you to your business, and the turrets guarding the hangar won’t so much as menace you.”</i> She pauses briefly, considering something, then shrugs. <i>“Should you find yourself in need of an insatiable, unerringly obedient companion" + (kiro.isBimbo() ? ", besides 65":"") + ", I’ll happily do business with you again.”</i> Her eyelights twinkle. <i>“I had no expectation of you becoming a professional contact, but here we are.”</i>");
		output("\n\nHere you are, indeed.");
		output("\n\n<i>“Apologies for waxing on like that. Simply transfer me the credits, and I’ll see your pet kui-tan delivered to you immediately and without further alteration" + (kiro.isBimbo() ? ", not that she needs it":"") + ". Our unpleasantness is at an end." + (kiro.isBimbo() ? " Oh, and be a dear and make sure she doesn’t attempt to fly her vessel. She’s in no state to, nor will she need to. The free market will see to her ship’s proper distribution.":"") + "”</i>");
		output("\n\nYou nod and transfer the credits.");
	}
	processTime(5);
	pc.credits = 0;
	//route this.
	clearMenu();
	addButton(0,"Next",youBoughtASlutGoodJob);
}

//Nevermind - cancel bargain
public function fuckHaggling():void
{
	clearOutput();
	showPo();
	flags["KQ_BUY_OFFER"] = undefined;
	author("Fenoxo");
	output("<i>“Nevermind,”</i> you growl. <i>“Negotiating with your like was a mistake.”</i>");
	output("\n\nIllustria sighs heavily, straightening as if doing so required her to lift an enormous weight. <i>“For once, I agree. An uncultured barbarian such as yourself could never be counted on to behave in a civilized manner.”</i> Her voice drops to a sultry whisper, <i>“But you’ll bring in more than enough funding to cover any damages...”</i>");
	output("\n\nOh no - it’s a fight!");
	//fiteybois!
	clearMenu();
	addButton(0,"Next",fightDatScientisto);
	return;
}

//Post-Paid, Kiro not Bimbo.
public function youBoughtASlutGoodJob():void
{
	clearOutput();
	showBust(poBustString(),kiroBustDisplay());
	showName("BOUGHT\nKIRO");
	author("Fenoxo");
	flags["KQ_RESCUED"] = GetGameTimestamp();
	if(!kiro.isBimbo())
	{
		output("<i>“Everything seems to be in order,”</i> Illustria reports, gesturing toward Kiro one-handedly. The tanuki’s bindings light up, briefly separating from the table before snapping together into a wrist-pinning blob. Her leg restraints pop off a moment later, but the gag remains. <i>“Your friend’s restraints will release her once you’ve reached the hangar. Partially programmed dolls can be notoriously willful, and I have no intention of allowing her to further damage my facilities.”</i>");
		output("\n\nKiro ");
		if(kiro.breastRows[0].breastRating() <= 11) output("hops lightly onto her feet");
		else output("nearly topples over when she hops onto her feet, surprised by her own chestiness");
		output(". She yells something into the gag, then spins around, slamming the weight of her poofy tail into a tray full of sensitive equipment. A dozen loud ‘crack’s and sparking, electric buzzes leave no room for doubt: Kiro broke every single item.");
		output("\n\n<i>“Hmmm,”</i> Illustria muses, momentarily perplexed. <i>“I’ll need to develop better tail restraints for future projects. Your assistance in identifying this flaw in a non-dangerous manner is appreciated, 65.”</i> She pushes Kiro’s back, hard, sending the captive pirate stumbling toward the door. <i>“Future training regimens will prioritize patient pacification more strongly early on. Now be on your way, before I change my mind.”</i>");
		output("\n\nScowls like Kiro’s could kill, but the semi-captive kui-tan knows when she’s beat - and when to make a retreat. She staggers out the door, stopping to meaningfully shake her head toward the hallway. You’re already following her, though.");
		output("\n\nIllustria silently watches you leave. Her hovering drone slowly circles around to sit itself on her shoulder.");
		output("\n\nThe door seals closed behind you. Locked.");
		//move north, seal exit.
		processTime(6);
		clearMenu();
		addButton(0,"Next",move,rooms[currentLocation].northExit);
	}
	//Post-Paid, Kiro Bimbo
	else
	{
		showName("NAME\nHER");
		output("<i>“Everything seems to be in order,”</i> Illustria reports, gesturing toward a chestier Kiro one-handedly.	<i>“Sixty-five, ownership transfer. Authorization: Doctor Illustria Po, your mistress. New owner: [pc.fullName]. Acknowledge.”</i>");
		output("\n\nKiro’s jaw goes slack. Her eyes empty of residual thought. Three seconds pass in silence, after which she wobbles, blinking in confusion. Bracing herself against the ground, she looks up at you with sudden, total love in her eyes. <i>“[pc.name]! You... oh wow. You own me.”</i> She strokes her cock in a way that somehow communicates abject wonder. <i>“I’m your property. Your doll number 65, your pet kui-tan pirate fucktoy.”</i> She shudders pinches both her nipples, firming up the dinner plate sized tit-toppers to rigid attention. <i>“You can name me, [pc.name]. You can call me anything, and I’ll love it. You could give me the most degrading, filthiest name in the galaxy, and I’d get hard to hear you say it...”</i>");
		output("\n\nYou open your mouth, about to tell her that her name is Kiro, but something stops you. This is an important choice, and Kiro is already broken. Maybe a new moniker would be in order?");
		output("\n\n<b>What do you name Kiro?</b>");
		//gotta do this shit.
		processTime(3);
		clearMenu();
		addButton(0,"Name Her",giveKiroANewName);
		displayInput();
		userInterface.textInput.text = "Kiro";
		output("\n\n\n");
	}
}

public function giveKiroANewName():void
{
	clearOutput();
	author("Fenoxo");

	if (userInterface.textInput.text.length == 0)
	{
		youBoughtASlutGoodJob();
		output("<b>You must enter a name.</b>");
		return;
	}
	// Illegal characters check. Just in case...
	if (hasIllegalInput(userInterface.textInput.text))
	{
		youBoughtASlutGoodJob();
		output("<b>To prevent complications, please avoid using code in the name.</b>");
		return;
	}
	if (userInterface.textInput.text.length > 14)
	{
		youBoughtASlutGoodJob();
		output("<b>You must enter a name no more than fourteen characters long.</b>");
		return;
	}
	
	kiro.short = userInterface.textInput.text;
	this.removeInput();
	//This way we get correct name!
	showKiro();
	//Choose Kiro
	if(kiro.short == "Kiro")
	{
		pc.addNice(20);
		output("<i>“Your name is Kiro,”</i> you state with absolute certainty. <i>“Just like it always was.”</i>");
		output("\n\nOnce more, the tanuki-girl’s eyes visibly empty of conscious thought, her rewired brain working triple-time to shape itself to her owner’s chosen reality. She whimpers in the back of her throat, her whole body tensing. Her tail slams down into the floor behind her with a muted ‘thump’, and she unleashes a deep, heartfelt sigh. <i>“You’re right, Angel. I </i>am<i> Kiro.”</i> A familiar, cocksure smile spreads across her blunted muzzle. <i>“And I’m so thrilled that you’re the one that gets to own me.”</i> She stands slowly, a web of glittering pussyjuice dangling between her furred thighs. <i>“I guess I’d have to be okay with </i>anyone<i> being my owner, but you’re, like... special.”</i> She steps closer, winding that big, poofy tail around your waist to hold you close. <i>“I’d love you even without Mistress Po’s work.”</i> Something that sounds like a happy purr escapes her lips. <i>“And now I get to love you even more than that!”</i>");
	}
	//Choose anything else
	else
	{
		output("<i>“Your name is [kiro.name],”</i> you say, a little hesitantly.");
		output("\n\n<i>“Oh.”</i> Kiro mouths as her eyes empty of conscious thought, her rewired brain working triple-time to shape itself for the reality you’ve chosen. She whimpers in the back of her throat, her whole body tensing. Her tail slams down into the floor behind her with a muted ‘thump’, then lifts and does it again, and again, and again. After a half-dozen such slams, partial awareness returns to her face, her expression still dopey. <i>“Hiiiiiiiii, [pc.name].”</i> The dollified tanuki smiles warmly, surging up onto her toes. A web of glittering pussyjuice hangs between her thighs, and the obscene girth of her flare wobbles eagerly in your direction. <i>“You’re such a naughty owner, [pc.name], getting rid of that old name and giving me a new one.”</i>");
		output("\n\nYou lean back a little surprised. <i>“Oh?”</i>");
		output("\n\n<i>“Yeaaaaah,”</i> the kui-tan purrs, prowling closer. <i>“You knew my real name, whatever that was, but you... you horny devil. You decided to take charge of me completely.”</i> [kiro.name]’s tail winds around your waist. <i>“Grab my titties if you want. I know you wannaaa! You <b>own</b> me, [pc.name]. I’m literally your personal toy. You can tell me to lay in your bed and wait for you, and I’ll love doing it. I’ll be there, hard if you want to cuddle.”</i> She strokes her cock. <i>“Soft if you want to rest.”</i> Her other hand lifts a breast and presses the soft expanse into your " + (pc.tallness+10 > kiro.tallness ? "side":"head") + ". <i>“And anything between. I’m yours.”</i>");
	}
	//merge
	output("\n\nDoctor Po claps her hands, jolting you and your fuzzy prize from your erotic reverie. <i>“Nobody fucks in my office, but me, or my dolls - the ones I still own.");
	output(" However, since you actually appreciate my work - perhaps I could interest you in some of the devices you saw along your trip? Training tools like my ‘Buttsluttinator’ have been in high demand, and I’ve devised an ‘Orgasmender’ far more pleasant than any V-Ko’s touch, no matter how modified.”</i>");
	//[Buttslutinator] [Healing] [Leave]
	processTime(10);
	clearMenu();
	addButton(0,"Buttslutinator",buyTheButtslutinator,undefined,"Buttslutinator","Buy the “Buttslutinator”. That’s a piece of mad scientist kit for sure.");
	addButton(1,"Orgasmender",healyTankBullshit,undefined,"Orgasmender","Buy the “Orgasmender”, though judging the brochure you spot on the wall, it looks more like a tentacle rape tank.");
	addButton(14,"Leave",moveOnPostBuying);
}

//Buy buttslutinator
public function buyTheButtslutinator():void
{
	clearOutput();
	showPo();
	author("Fenoxo");
	output("You express your interest in the buttslutinator.");
	//Used it
	if(flags["BUTTSLUTINATOR"] != undefined) output("\n\n<i>“Oh I knew you would. You so seemed to enjoy your time with it, you naughty anal adventurer, you.”</i> Doctor Po’s eyes trace the shape of your [pc.butt]. <i>“You’d be amazed how many CEOs buy these for their pets, only wind up addicted themselves. Tamani has been trying to buy the design off me for years, that two-cred hack.”</i> She taps her chin. <i>“10,000 credits, and you can have one. It’ll be waiting on your ship by the time you get back there.”</i>");
	//No usies
	else output("\n\n<i>“Oh really? You should’ve used mine while you had the chance to take a demo. I’m told it can be quite... addictive.”</i> Doctor Po’s eyes twinkle. <i>“You have no idea how many of my clients buy them for their pets, then get curious about how it feels and try it themselves.”</i> She smirks. <i>“Absolute anal addicts now, every one. I assure you, my devices are as effective as they are pleasant, as your new toy can attest.”</i> [kiro.name] nods like a bobblehead, excited about the idea of getting even sluttier. <i>“10,000 credits, and it’ll be delivered to your ship before you can walk that far.”</i>");
	//Merge
	output("\n\nSounds like a heck of a deal.");
	processTime(2);
	if(pc.credits >= 10000) addButton(0,"Buy Buttstuff",actuallyBuyButtslutinator,undefined,"Buy Buttstuff","Spend the 10,000 credits on it.");
	else addDisabledButton(0,"Buy Buttstuff","Buy Buttstuff","You’re too poor.");
}
public function actuallyBuyButtslutinator():void
{
	clearOutput();
	showPo();
	author("Fenoxo");
	output("You spend 10,000 credits on the Buttslutinator.");
	flags["BUTTSLUTINATOR_INSTALLED"] = 1;
	pc.credits -= 10000;
	addDisabledButton(0,"Buttslutinator","Buttslutinator","You already bought this.");
}

//Healy Tank
public function healyTankBullshit():void
{
	clearOutput();
	showPo();
	author("Fenoxo");
	output("You express your interest in the Orgasmender.");
	//Used it
	if(flags["ORGASMENDER"] != undefined) output("\n\n<i>“I guess the free demo you got sold you on the idea? Very well.”</i>");
	//Not used
	else output("\n\n<i>“Really? You should have taken the chance to get a free demo while you were prowling my halls.”</i>");
	output(" Doctor Po sighs. <i>“The market for such devices is regrettably low. My usual clientelle does not need healing from injuries, and militaries are largely to prudish to allow their wounded soldiers endless, repeated orgasms as they heal to perfection.”</i> She strokes her floating assistant’s tentacle and adds, <i>“5,000 credits, and you can take that prototype home with you. It’ll be delivered to your ship before you can get there yourself.”</i>");
	processTime(2);
	if(pc.credits >= 5000) addButton(1,"Buy heals",actuallyBuyOrgasmender,undefined,"Buy heals","Spend the 5,000 credits on it.");
	else addDisabledButton(1,"Buy Heals","Buy Heals","You’re too poor.");
}
public function actuallyBuyOrgasmender():void
{
	clearOutput();
	showPo();
	author("Fenoxo");
	output("You spend 5,000 credits on the Orgasmender.");
	flags["ORGASMENDER_INSTALLED"] = 1;
	pc.credits -= 5000;
	addDisabledButton(1,"Orgasmender","Orgasmender","You already bought this.");
}

//Move on post-buy:
public function moveOnPostBuying():void
{
	clearOutput();
	showPo();
	author("Fenoxo");
	//bimbo
	if(pc.isBimbo()) output("<i>“Okay, we’re gonna bounce out. Toodles!”</i> You wave, and depart.");
	//bro
	else if(pc.isBro()) output("<i>“I’m out.”</i> You state, turning to leave with your tanuki in hand and not a single look Doctor Po’s way.");
	//nice
	else if(pc.isNice()) output("<i>“We’ll be leaving I suppose.”</i> You pause, feeling the tug of a lifetime of good manners. <i>“I guess... bye? I don’t know what else to say.”</i>\n\nDoctor Po smirks.");
	//Mischievous
	else if(pc.isMischievous()) output("<i>“I’d say goodbye, but I don’t think it’s really been good, and you sure as fuck aren’t.”</i> You take your tanuki and make ready to depart. <i>“Don’t choke on a bimbocock or anything.”</i>");
	//Hard
	else output("<i>“Annnnd we’re done,”</i> you declare, leaving with your tanuki.\n\nDoctor Po doesn’t protest in the slightest. Smart woman.");
	// leave room, seal doorio.
	processTime(2);
	clearMenu();
	addButton(0,"Next",move,rooms[currentLocation].northExit);
}

//Leave Kiro (bimbKiro only)
public function screwSavinKiro():void
{
	clearOutput();
	showPo();
	author("Fenoxo");
	output("<i>“Fuck this, I’m out.”</i> You go for the door, but Doctor Po’s hovering robotic lackey interposes itself between you and the exit.");
	output("\n\n<i>“Excuse me?”</i> Illustria says in pure disbelief. <i>“You look at this piece of engineered art - the perfected, beautiful form of your own friend, and you turn away from her? You abandon her without a second thought?”</i> She balls her fingers into a fist. <i>“You don’t deserve to walk out here. No, you don’t even deserve to join 65, but you’re going to, and when you’re crawling on the floor after me, licking old cum off the floor, you’re going to thank me for fixing that broken shockbox you call a brain.”</i>");
	output("\n\n...It’s a fight?");
	//start fite?
	clearMenu();
	addButton(0,"Next",fightDatScientisto);
	return;
}

//Player Bad End
//Strapped in Kirochair
//Marvel at data storage capacities of microsurgeons, put them to work
public function badEndToDatPo():void
{
	userInterface.hideNPCStats();
	userInterface.leftBarDefaults();
	generateMap();
	
	showPo(true);
	author("Fenoxo");
	output("<i>“Welcome back, [pc.name],”</i> Illustria Po coos, leaning over the chair into which you’ve been strapped and gently caressing your exposed " + (pc.biggestTitSize() < 1 ? "chest":"breasts") + ". <i>“I hope you don’t mind feeling a little fuzzy-headed and sleepy. A little sedation was necessary for safe transport to the lab and my initial examination. Would you like to hear the results?”</i>");
	//Bro
	if(pc.isBro()) output("\n\nThe wrist restraints might keep you from striking her, but they do nothing to stop you from presenting her with an enthusiastically upraised middle finger.");
	//Bimbo
	else if(pc.isBimbo()) output("\n\n<i>“Results? Did I fail a test?”</i> You pout adorably, hoping that if you look sad enough she’ll let you go.");
	//Hard
	else if(pc.isAss()) output("\n\n<i>“Fuck off, cyber-twat.”</i> You spit in disgust. Unfortunately you lack the distance to strike your captor.");
	//Misch
	else if(pc.isMischievous()) output("\n\n<i>“I’m a little tied up at the moment. Perhaps we could wrap this up, and you could send them to my doctor’s office for review?”</i> You flash your best shit-eating grin.");
	//Nice
	else output("\n\n<i>“I suppose it would be better than sitting in silence,”</i> you admit.");
	//Merge
	output("\n\nRadiating amusement, the robotic villain circles your restrained form, stroking you as one might a pet ");
	if(pc.horseScore() >= 3) output("pony");
	else if(pc.felineScore() >= 3) output("cat");
	else output("dog");
	output(". <i>“Your body is more than adequate. No doubt your family’s doctors had something to do with that. All the hallmarks of quality gene selection are present, which will make my job so much easier. More interesting is the army of microsurgeons swimming inside you. Each one has a larger data buffer than a standard V-Ko nursedroid! Quantum storage drives at such a scale are unheard of, and self-replicating ones... will be a useful tool to add to my repertoire.”</i>");
	output("\n\nYou tilt your head uncomprehendingly. Your immune system was a top of the line prototype, but you didn’t know it was packing that kind of power. No wonder you’ve been healing faster ever since getting it!");
	output("\n\n<i>“And so many safeguards and sandboxes to burrow through! It took me a full ten minutes to gain administrator access. Such a maddeningly long time to spend on something so silly...”</i> She pauses. <i>“Of course I’ve purged most of their old programming and updated it with a package to better handle the types of diseases you’re likely to encounter in the wild as a fuckdoll. Can’t have a toy getting sick, now can we?”</i>");
	output("\n\n" + (pc.isBimbo() ? "You futilely wiggle. Being immune to STDs sounds great, and being a fuckdoll sounds hot, but you’ve got stuff to do first!":"You struggle in your bindings."));
	output("\n\nIllustria gently shushes you. <i>“Now, now. No need to struggle. I’m going to need a lot more of your special microsurgeons if I’m going to outfit all of my dolls with them... and that means making sure you produce plenty.”</i> Her eyes pulse with blindingly bright light. <i>“And... it’s done. Your immune boosters are going to reproduce like bunnies... and secrete themselves into your sexual fluids for easy collection. What’s more, all the instructions I’d ever need to make you a pliant, fuckable toy are loaded into your bloodstream.”</i> She leans back. <i>“This was almost too easy.”</i>");
	processTime(10);
	clearMenu();
	addButton(0,"Next",badEndToDatPo2);
}

public function badEndToDatPo2():void
{
	clearOutput();
	showPo(true);
	author("Fenoxo");
	output("<i>“Mental changes first, this time,”</i> Illustria Po muses as she looks down at you, silently activating the suction cups on your [pc.nipples].");
	if(pc.hasNippleCocks()) output(" They swiftly draw your [pc.nippleCocks] out of hiding, and you begin to leak and dribble immediately.");
	else if(pc.canLactate()) output(" They fill with [pc.milk] almost immediately, every mechanical suck matched by a sensuous pleasure.");
	else output(" They vainly suckle for a moment, and your tender nubs swell with fresh bloodflow.");
	output(" <i>“The harm reduction subroutines in your sweet little helpers should keep the swift rewiring of your thoughts from shattering your psyche, and if they don’t, you won’t be cogent enough to care. Not like I was planning on selling you anyway, my little bonus ‘bot factory.”</i>");
	output("\n\nUnwillingly growing aroused, you attempt to snarl at Doctor Po. It comes out sounding weak and kittenish, but it’s better than nothing - better than simply accepting whatever the sexy cyborg is doing to you. It doesn’t matter how many hacks she pumps into your augmented immune system, you’re not going to let her turn you into some kind of horny, stupid, fuck-toy.");
	output("\n\nEven if the idea does ");
	if(pc.isHerm()) output("make your [pc.cocks] throb and your [pc.vaginas] clench");
	else if(pc.hasCock()) output("make your [pc.cocks] throb");
	else if(pc.hasVagina()) output("make your [pc.vaginas] clench");
	else output("make your [pc.asshole] clench");
	output(".");
	output("\n\n<i>“That was fast,”</i> your tormentor remarks, leaning close to your exposed, flushed loins. <i>“I wonder which instruction your arousal is in response to. Obedience? No, too early for you to swallow that particular pill. I wonder, is it me? My appearance is quite fetching, I know.”</i> She brushes back a cascade of perfect, shimmering golden strands, leaving it to spill down the flawlessly simulated musculature of her back. <i>“Tell me, [pc.name]... what part of me is most attractive?”</i>");
	output("\n\nStaring defiantly at the perfectly fuckable scientist, you consider your reply. You should say something hurtful for sure, but you’re drawing a blank. Her appearance should be easy fodder for insults. Her hair? Far too perfect to critique. Not only does it glisten to an almost metallic degree, but every strand seems perfectly arranged and accounted for. Her face is somehow <i>even worse</i>. Not only does she have flawless skin and a perfect jawline, but she gets even prettier when she’s smiling like she is right now. Her lips large and fuckable while not falling into the realm of blowup doll ‘o’-rings like so many of her pets.");
	output("\n\nFuck! This isn’t working. You’re just getting more turned on, and you haven’t even given the sultry cyborg’s tits a proper gander! You turn away before it becomes too obvious. <i>“Hmmph.”</i>");
	output("\n\n<i>“Now now, come on. Tell me. Which part of me is the most attractive. I want to hear it from your lips,”</i> Illustria instructs, tipping you back toward her bosom with a single finger.");
	output("\n\nMaybe you should have resisted. You probably could have, if you weren’t thinking about how cute Miss Po’s completely unnecessary glasses look balanced on her button nose. Now you’ve got a faceful of robo-titty, bouncing and swaying with a bit more jiggle than the real thing. Hell, you can hear them slosh sometimes when she moves, and the domes of her nipples are actually made of something clear, a perfectly voyeuristic viewport into her milk reserves. Despite being fake - no, not fake. They’re very real, now that you’re looking at them up close; they’re just... master crafted. Like that, a potential critique evaporates in the face of Illustria’s perfectly shaped breasts. They heave and bounce with her tittering laugher, and for a moment, you imagine yourself nursing from one.");
	output("\n\nIt’s only a single moment of weakness, but it’s enough to make you lick your lips.");
	output("\n\n<i>“Oh ho! You’re definitely a fan of my tits, are you?”</i> The cybernetic woman strokes the back of your head, her fingers smoother than silk. <i>“Are they your favorite part of me? Are they what holds your attention?”</i>");
	output("\n\nBiting back a moan, you look down, passing over her taut middle and the <i>perfectly normal</i> viewports in her sides. She has a waistline like a fashion model and a tummy like an olympic athlete. Your eyes nearly glaze over when they get to her wide-flared hips, thick enough to sway alongside a New Texan cow-girl’s. She’s proportioned for pleasure, a thought so firm and true that it must be one of your own. When she rotates teasingly, you almost drool at the pert globes of her ass. All she has to do is bend-over, and that heart-shaped behind will have have you drooling.");
	output("\n\nOr it would, if the silvery cleft in the center hadn’t done it already. You wish you could wipe it off your face, but the bindings are too secure and her pussy to pleasant. You gaze longingly at her quim, unconsciously shifting in the chair to get a little bit closer. It shines like liquid mercury. The lips, plump with chromed pleasure, jiggle slightly when she moves, leaking strawberry scented lubricant. The mere act of looking at it proves just as fulfilling as going to an art gallery or a performance of humanity’s best classical music.");
	output("\n\nThe answer to Doctor Po’s question has been staring you in the face this entire time: <i>“Your pussy.”</i>");
	output("\n\nIllustria seems surprised to hear it. <i>“Really? But you seemed so starstruck by my breasts earlier. Why not look back up and make sure. I’d hate for you to make an error in your hurry to answer.”</i>");
	output("\n\nWrenching your eyes away from the mirror-finished cunt with some difficulty, you work your gaze back up, doubting that anything could ever look as good or as pleasant as her cunt. Just thinking about it brings a smile to your face, but as your vision meanders back up her enchanting abs, doubt creeps into your mind. Maybe her pussy doesn’t look any better than her breasts. Maybe that was her programming taking hold. Maybe she’s just a regular, super-hot bombshell, not some hypno-twatted goddess.");
	output("\n\nMaybe you just have a thing for well-framed genitalia?");
	output("\n\nYou don’t muse on the topic much longer because two much more important concepts float into view, wobbling and bobbling against one another, glossy and perfect. It’s impossible to think of anything else when a heaving tit is right there, waiting to bump it out of the way and into the shadows. They look so soft yet at the same time heavy, like if you sunk down into one, you’d never be able to climb out, but why would you? They’re gorgeous and doubtless filled with fluids that’ll make them feel even better to have in your mouth or your hand.");
	output("\n\nIf you weren’t strapped down, you’d have to grab one, just to see what it felt like.");
	output("\n\n<i>“[pc.name]?”</i> Illustria’s voice stirs you from your titty-stupor. <i>“Are you sure my pussy is your favorite?”</i> She leans closer, throwing your entire head into the shadow of those two flawless, fluid-bearing domes.");
	output("\n\nLicking [pc.lipsChaste] that feel dry and chapped, you try to steady yourself for an answer, but those tits won’t stop swaying! Just as you’re about to say whatever it was you were thinking, they’ll bounce and scatter your mind into blank appreciation. For a scant second, you’re deeply aware that such a reaction isn’t normal, but then Illustria’s hands are cupping her melonous mounds, bouncing and groping them, teasing her transparent nipples until they’re thick with lust and jutting invitingly toward your mouth.");
	output("\n\n<i>“I... I...”</i> you stutter until a thought occurs to you, as obvious as softness of Doctor Po’s bosom. <i>“I love your tits.”</i>");
	output("\n\nShe leans closer, so close that one brushes your cheek.");
	output("\n\nIt definitely shouldn’t make you orgasm, you’re fairly sure. You aren’t supposed to squeal in delight from a cyborg boob grazing your [pc.skinFurScalesNoun], and such an act definitely shouldn’t leave you squirming in captive pleasure");
	if(pc.hasCock()) output(", squirting into the tube on your crotch");
	else if(pc.canLactate()) output(", squirting [pc.milkNoun] all over yourself");
	else output(" like some kind of slut");
	output(". At the same time, how could you not? You’ve been caressed by a divine bosom, graced by its erotic energy with a debilitatingly pleasurable orgasm. Worshipping their holy curves seems the most natural thought in the world.");
	output("\n\n<i>“Not an unexpected result, [pc.name]. What about obedience? Obeying commands from your betters, listening with rapt attention to instructions?”</i>");
	output("\n\nGroggy from sedation and potent orgasm, you blink your bleary eyes and try to think about something other than groping Illustria’s gorgeous titties. <i>“Uh, I guess... I could... wait... betters?”</i> You stare longingly at those swaying cyber-udders. What in the universe could be better than those? <i>“Maybe... I guess... like, for your tits, sure.”</i>");
	output("\n\nYou miss Doctor Po’s cheshire grin, too busy with sweet pleasure of beholding two breasts that grow more attractive with each passing second. You could almost cum from watching them wobble...");
	processTime(20);
	pc.changeLust(pc.lustMax());
	pc.intelligence(-5);
	pc.willpower(-5);
	clearMenu();
	addButton(0,"Next",badEndToDatPo3);
}

public function badEndToDatPo3():void
{
	// TF Kiro
	var kiroTFHour:int = (flags["KQ_LAST_HOUR_TF"] == undefined ? 0 : flags["KQ_LAST_HOUR_TF"]);
	if(kiroTFHour < 18)
	{
		kiro.createPerk("MinCumQ",2000);
	}
	if(kiroTFHour < 24)
	{
		kiro.createPerk("Ever-Milk",5000);
	}
	if(kiroTFHour < 30)
	{
		kiro.breastRows[0].breastRatingRaw += 17;
	}
	if(kiroTFHour < 36)
	{
		kiro.vaginas[0].bonusCapacity += 100;
		kiro.ass.bonusCapacity += 100;
	}
	if(kiroTFHour < 42)
	{
		kiro.lipMod++;
		kiro.breastRows[0].breastRatingRaw += 16;
	}
	if(kiroTFHour < 48)
	{
		kiro.lipMod++;
		kiro.createPerk("Ditz Speech");
		kiro.vaginas[0].bonusCapacity += 150;
		kiro.ass.bonusCapacity += 150;
	}
	
	clearOutput();
	showBust(poBustString(),kiroBustDisplay(true))
	showName("DOCTOR\nPO");
	author("Fenoxo");
	output("You’ve definitely had your brain hacked. There’s no other reason for you to fall so madly in love with someone who clearly approached you and your " + (flags["KIRO_BF_TALK"] == 1 ? "girl":"") + "friend with such nefarious intent. The memories are still there as clear as they were a moment ago, but they seem so unimportant in the face of bare perfection. Every time you try to think of something mundane, your brain circles back on itself to fixate on some other aspect of Miss Po’s body.");
	output("\n\nNo wonder Illustria doesn’t wear clothes! Coverings would get in the way of displaying her beauty... and of her servants worshiping her. If you weren’t cuffed down to a comfy chair, you’d be kneeling in a heartbeat. Escape seems silly next to service. Why struggle to resist her when it feels this good just to stare and answer her questions? Of course you’ll obey her. You’ll obey her no matter what she does or how she does it. And sure, it would be smarter not to admit that, but that wouldn’t be very obedient of you.");
	output("\n\nBesides, you’re pretty sure you’re falling in love with Miss Po.");
	output("\n\nSo lost are you in your thoughts that you don’t notice the sound of door opening.");
	output("\n\n<i>“Mistress, can 65 help?”</i> A familiar voice asks.");
	output("\n\nIllustria straightens, freeing you from the hypnotic shadow of her breasts and while simultaneously leaving you vulnerable to a new sight: the fuckdolled form of your " + (flags["KIRO_BF_TALK"] == 1 ? "girl":"") + "friend, Kiro Tamahime.");
	output("\n\nYou might have described Kiro as ‘well-endowed’ in the past, but the woman looking down at you would call her old self ‘flat-chested’. Her breasts have more than doubled in size, inflated into the heavy-hanging milk-tanks you’d expect on a fertility idol. The growth isn’t entirely contained by her breasts either. Kiro’s python of a cock, already sized for a horse, now hangs to her knee with ease, and it’s not even hard yet. As it rises, so too does your pulse, quickening with ever-increasing might of Kiro’s perfected cock.");
	output("\n\nShe could break a leithan with that thing. Why does it make your mouth water?");
	output("\n\n<i>“Oh, you’re helping already, 65.”</i> Illustria pats Kiro’s head, wrapping her arm around the tanuki’s shoulders and casually slipping a digit into her freshly-minted fuckdoll’s mouth. Kiro suckles happily, her expanded lips squishing and shining with fresh saliva. <i>“I figure the best way for you to help [pc.name] along is to give [pc.himHer] a good, hard fucking, and who better to do it than my latest masterpiece, now with attributes big enough to let everyone know what a toy she truly is.”</i>");
	output("\n\nWith her eyes closed and her attention 100% occupied by dutifully sucking her mistress’s finger, Kiro doesn’t respond.");
	output("\n\nNeither do you, until you realize that Kiro’s centaur-breaker of a cock is going to go inside you. <i>“H-h-ey... uh...”</i>");
	output("\n\n<i>“Uhhh, what?”</i> Illustria coos, popping her finger out of Kiro’s mouth. <i>“You came here to rescue Kiro didn’t you?”</i>");
	output("\n\nShe’s not wrong. You nod.");
	output("\n\n<i>“And is she ugly? Can you find a single flaw in her appearance that would make her unsuitable for sex?”</i>");
	output("\n\nWhat a loaded question. You look at Kiro... beautiful, chesty Kiro. Was her fur always this glossy? Did her boobs ever dominate your gaze quite so wholly before? You don’t think so. They look like pure, inviting warmth, and when they sway, your head drags along behind them. Subconsciously, you wonder what it would feel like to disappear between them. True, they’re bigger now, but is there a reason to be upset by that? There’s so much more to love and <b>worship</b>. Granted, they aren’t the flawless orbs of Miss Po, but they weren’t meant to be. They’re slut tits for a slut girl.");
	output("\n\nYou glance down. ...Wow.");
	output("\n\nThat’s a stud dick if you’ve ever seen one. Kiro has the kind of cock that makes it hard to think. The kind of dick that makes you just want to come a little closer and put your hand on it, just to see what it feels like. You wonder if the veins feel as hot as they look when they pulsate. And... is that faintly spicy scent her musk? Flaring your nostrils, you lean a bit closer, wondering if she tastes like that too. Would you even be able to fit Kiro in your mouth now? She’s so big. Maybe you could ask Illustria to give you a mod to help...");
	output("\n\n<i>“Ummm...”</i>");
	output("\n\nIllustria guides Kiro forward, slapping the tanuki’s extra-plush bottom hard enough to make her squeak. <i>“Show her how good it feels to get truly fucked, 65. Fuck her hard and firm, and cum as much as you like, pet.”</i>");
	output("\n\n<i>“Oh thank you, Mistress!”</i> Kiro cheers, shifting down " + (pc.legCount == 1 ? "to your [pc.leg]":"between your [pc.legs]") + " in a hurry.");

	//No puss, no new PG
	if(!pc.hasVagina()) pc.createVagina();
	{
		output(" <i>“Umm, in the ass, Mistress?”</i> Kiro seems uncertain, like fucking your ass would be a presumptuous breach of command. It almost hurts to hear. Why isn’t your ass good enough for her to fuck?");
		output("\n\nDoctor Po smirks. <i>“No, pet - in the pussy. Here.”</i> Her eyes flicker for a moment, and the debilitating arousal inside you seems to crawl through your veins, pooling in a crotch that suddenly feels too hot and too sweaty. You can feel your loins being squeezed between your thighs, plump and increasingly sensitive, driving you to writhe against your restraints. A wave of warm, wet heat envelops them, making you groan in inexplicable delight. Those squirming motions feel better than ever around your nethers, and after a moment, you realize you can hear the sound of your new, soaked pussy squelching with your motions.");
	}
	//Merge
	output("\n\nThe head of Kiro’s cock, thick as a baseball bat and just as blunt, presses against your juicing cunt immediately. The tanuki-slut wedges it tight against your slit, bubbling waves of hot pre onto your [pc.clits] and lips. If she pressed in a little more firmly, it’d pump straight through your channel");
	if(!pc.isPregnant()) output(" and into your " + (!pc.hasVagina() ? "new-grown ":"") + "womb");
	output(". She’s so fucking virile that your slit is well beyond sopping, slick and lubricated enough than your fuck-dolled friend’s beast-cock comes closer and closer to splitting you open the longer she grinds against you.");
	if(pc.vaginalVirgin) output("\n\n<b>You are no longer a virgin!</b>");
	output("\n\n<i>“Oh Angel!”</i> Kiro cries, leaning over you, her pendulous tits " + (pc.biggestTitSize() >= 6 ? "weighing down your own voluminous bosom":"weighing heavily on your chest") + ", dribbling thin streams of delicious-smelling milk into your [pc.skinFurScales]. <i>“You’re going to love being a fuckdoll, I just know it!”</i> She rocks her hips back, huge tail flopping back and forth, and scissors herself back in, driving the gently flared tip of her equine prick deep into your dripping-wet cunt. The sheer, lubricious sound of penetration strikes you before your feelings can catch up. Just hearing it would’ve gotten you wet, if you weren’t already wetter than a kitchen sponge.");
	output("\n\nIt feels like you’re being split in half, but in a good way. With each inch Kiro powers into your " + (pc.fertility() <= 0 ? "in":"") + "fertile channel, you become increasingly aware of just how elastic you can be... and just how hot this gorgeous alien babe is. This isn’t just sex, it’s <b>fucking</b>. You can tell by the short, savage strokes she’s using to drill deeper inside your honeypot, pausing just long enough for her veiny monstrosity to produce a fresh dollop of lubrication in preparation. There’s no room for thoughts of resistance when you’re this <b>full</b> and <b>proper fucked</b>.");
	
	//Cunchange ½ kirovol.
	if(!pc.hasVagina())
	{
		pc.createVagina();
		pc.setNewVaginaValues(0);
	}
	pc.vaginas[0].wetnessRaw += 5;
	pc.boostGirlCum(15);
	pc.cuntChange(0, (kiro.cockVolume(0) * 0.5));
	
	output("\n\n<b>She stretches you out.</b>");
	output("\n\nKiro’s medial ring slips inside with an audible ‘pop,’ and you wonder if you’ll get to hear that on every stroke. There’s something hot about that idea - of being stretched to the absolute limit by someone you’ll never entirely adjust to, your pussy ruined by size and friction until you crave nothing but more of the same... Sparks of ecstasy flare behind your eyes, and you wonder what you were thinking about... until Kiro plows home again, and you’re nothing but flesh and misfiring nerves, stretched into taut ecstasy.");
	output("\n\n<i>“Angel, you’re so fucking tight!”</i> Kiro cries.");
	output("\n\nThe sudden appearance of Illustra’s pussy on your face ought to be cause for concern or resistance, but you’ve already weighed the merits of its beauty and fallen a little bit in love as a result. Her plush, silvery lips smush your face around until your [pc.lips] are wide open, and at that point, you might as well thrust your tongue inside. Mere hints of her flavor were enough to make you swoon, and the full force of her taste, when combined with Kiro’s mercilessly cunt-sawing cock, brings you to abrupt, clenching, sputtering orgasm.");
	output("\n\nIf your previous orgasms were like fire crackers, this is one is ground zero for a fusion bomb. The world fades into flashes of pink and white. Your heart hammers faster than a hummingbird’s, and the taste of pussy mixes with the pleasure in your crotch until you feel you’re nothing but pussy bathing in pussy, wrapped around the thickest, fattest, most fuckable cock in the galaxy. On autopilot, you manage a few dopey licks and affectionate squeezes");
	if(pc.isBimbo()) output(", your " + (pc.isBimbo() ? "bimbofied":"treated") + " body knowing just how to clutch at a cock mid-orgasm");
	else output(", your body growing better at clutching Kiro’s cock the longer your climax persists");
	output(".");
	output("\n\nThis orgasm doesn’t seem to come with a discrete ending either. So long as you’re being fucked and used, the pleasure courses through your willing body unceasingly. It might ebb a little after you finish squirting onto Kiro’s thighs" + (pc.hasCock() ? " and dumping a [pc.cumNoun]-load into her tits":"") + ", but that mind-blanking, heart-warming bliss never completely fades, not as long as you’re licking this godly pussy and getting banged to pieces by your fuckdoll " + (flags["KIRO_BF_TALK"] == 1 ? "girl":"") + "friend.");
	output("\n\nMaybe... maybe Illustria and Kiro were right?");
	output("\n\nCum splatters against your cervix as you consider the merits of letting yourself become a fuckdoll too. Right now, every single part of the process feels like a net positive.");
	output("\n\nYou smile into Illustria’s chromed pussy and lick.");
	output("\n\nAnd lick.");
	output("\n\nAnd lick, heedless of how your [pc.belly] balloons with Kiro’s successive load or just how tired your tongue is getting. That discomfort is nothing next to the pleasure of sex.");
	processTime(65);
	
	for(var i:int = 0; i < 15; i++)
	{
		pc.orgasm();
		pc.loadInCunt(kiro, 0);
		pc.loadInMouth(enemy);
	}
	pc.changeLust(pc.lustMax());
	pc.intelligence(-5);
	pc.willpower(-5);
	
	clearMenu();
	addButton(0,"Next",badEndToDatPo4);
}

public function badEndToDatPo4():void
{
	clearOutput();
	showPo(true);
	author("Fenoxo");
	//No tits
	if(pc.biggestTitSize() < 1) 
	{
		output("You wake up to the feeling of another orgasm rocking your fucked-out body. Parts of you are sore, but not as sore as they ought to be. You ought to feel like you got split in half, but instead you’re... ready for more pleasure. You’re ready to eat Illustria out again. You’re ready for Kiro to fuck you once more. After a second you wonder what it would take to get Kiro to fuck you again. How many times would you have to suck on Miss Po’s pussy?");
		output("\n\nYou realize the answer doesn’t matter. You’d do it anyway. It tastes too good not to.");
	}
	//Smol tits
	else if(pc.biggestTitSize() < 5)
	{
		output("Looking down, you discover a huge set of brea- no, tits sitting high on your chest, full to the brim with [pc.milkNoun]. Fortunately, your [pc.nipples] are strapped tightly into milkers. Their rhythmic tugs pull thin streams of your [pc.milkVisc] streams into their reservoirs and sucking pipes with relentless intensity, but it doesn’t hurt. <b>It feels good to be milked</b>. You whimper and wonder whether Miss Po’s lips or Kiro’s would feel better, dismissing the thought with the next tit-draining tug on your milkers.\n\nAnything kind of suction would leave you breathless and gasping.");
	}
	//Big tits
	else if(pc.biggestTitSize() < 13)
	{
		output("Looking down, you discover the source of your mysterious climax: the huge, slutty tits sitting high on your chest, full to the brim with [pc.milkNoun] and disgorging thick streamers of it into the attached milkers. While the machinery tugs on your [pc.nipples], you find yourself wondering: would Miss Po’s lips feel better than this? Would Kiro’s? What if both of them sucked on you at once? Would your it melt what’s left of your common sense out through your cunt, or is the machine doing a good enough job of that on its own?\n\nAny kind of suction seems like it would leave you breathless and gasping.");
	}
	//Huge tits.
	else
	{
		output("Looking down, you discover the source of your orgasm: your gigantic, slutty tits. They don’t really look that different");
		if(!pc.canLactate()) output(", even if they are full of [pc.milkNoun] now");
		else output(", still full of [pc.milkNoun]");
		output(", but looks can be deceiving. They feel so much different now - so much readier to be <b>suckled</b> and drained. Each tube-filling [pc.milkNoun]-torrent feels like nothing but pleasure and relief. Soreness is a thing of the past. There is only the sublime, calming enjoyment of getting your titties tugged on.\n\nWould it feel better of Miss Po was doing it? Or Kiro? What if they were both there, sucking on your big fat slut-tits? You realize midway through your next milking-gasm that it doesn’t really matter who does it as long as <i>somebody</i> or <i>something</i> is latched on.");
	}
	
	if(pc.biggestTitSize() >= 1)
	{
		pc.milkMultiplier += 100;
		// Perk "Eve-Milk"
		// v1: Minimum milkQ produced
		pc.createPerk("Ever-Milk", 5000, 0, 0, 0, "Fluid produced from lactation is always on tap and will never run dry. Ever.");
		if(pc.milkFullness < 100) pc.milkFullness = 100;
	}
	
	//Merge no new PG.
	output(" Was that Illustria’s plan all this time? To make milking feel so good that you don’t even try to get out of the chair? Because that’s exactly what’s happening.");
	output("\n\nYou aren’t strapped down.");
	output("\n\nYet you don’t get up, not when it feels this good. Not when there’s a similar milker between your legs, sucking on ");
	if(!pc.hasCock()) output("a cock that didn’t exist when you fell asleep but have already grown to appreciate");
	else if(!pc.hasCocks()) output("a [pc.cock] that seems quite happy to stay where it is");
	else output("[pc.cocks] that seem quite happy to stay exactly where they are");
	output(". Besides, you can get up when you’ve had enough milking. Right now, it’s more fun to grope your tits and pry them apart while you’re cumming, all so you can watch the jets of [pc.cumNoun] spurting from your cartoonishly engorged cock" + (pc.hasCocks() ? "s":"") + ".");
	
	if(!pc.hasCock())
	{
		pc.createCock();
		pc.setNewCockValues(0);
	}
	if(pc.ballFullness < 100) pc.ballFullness = 100;
	pc.ballEfficiency += 9;
	pc.refractoryRate += 15;
	pc.cumMultiplierRaw += 100;
	
	output("\n\nAnd as that orgasm fades into gentle contentment, you realize you’re still hard and drippy. Why not stay for another one? There’s no hurry now that Kiro’s already been turned into an agreeable walking fucktoy. You’re free now. Free to luxuriate in the enhanced sensations your body gives you. Free to think about how good Illustria’s pussy tastes and how badly you want to suck on her tits. Maybe if you called her Mistress like Kiro does. Maybe then she’d let you fuck her.");
	output("\n\nYou’ll have to get good at begging.");
	output("\n\nYou don’t even notice the visor strapped over your eyes or the white noise burbling in your ears, and you definitely don’t spot the flashes of subliminal commands worming their way into your brain.");
	output("\n\nYou cum. You cum, letting yourself grow increasingly comfortable with the idea of servitude after every orgasm, but that’s your kink, isn’t it? Nothing gets you worked up like being ordered around and used as property. Nothing makes your tits dribble and cock clench like obeying someone. It doesn’t matter if they’re your owner or another slave. Doing what you’re told gets you <b>hot</b>.");
	output("\n\nThe fact that you cum for nearly twice as long to that thought confirms it. <b>You’re a born slave. A toy. A fuckdoll.</b>");
	processTime(50);
	
	for(var i:int = 0; i < 30; i++)
	{
		pc.orgasm();
	}
	pc.changeLust(pc.lustMax());
	pc.intelligence(0, true);
	pc.willpower(0, true);
	
	clearMenu();
	addButton(0,"Next",badEndToDatPo5);
}

public function badEndToDatPo5():void
{
	moveTo("GAME OVER");
	clearOutput();
	showZodee();
	//days += 5;
	processTime((5*24*60) + rand(247));
	author("Fenoxo");
	output("When Illustria loses you and Kiro in a bet, you’re understandably crestfallen. You loved Mistress Po with all your heart. She was always so nice to you and Kiro, making sure you got to spend most of your day cumming with the other slutty herms in her collection.");
	output("\n\nAll that worry vanishes when your new Owner, Mistress Zo’dee, tells you to calm down and relax.");
	output("\n\nOh course she’s right. You stand there, a contented smile slowly spreading on you and your sister-slave’s mouths at the command. Everything is going to be fine, and you have nothing to worry about. After all, Kiro’s right there, a few feet away, and you’re sure your new Mistress is going to give you plenty of chances to polish her pole.");
	output("\n\nIllustria certainly loved it.");
	pc.changeLust(pc.lustMax());
	clearMenu();
	addButton(0,"Next",badEndToDatPo6);
}

public function badEndToDatPo6():void
{
	//days += 10;
	processTime((10*24*60) + rand(182));
	clearOutput();
	showZodee();
	author("Fenoxo");
	output("Life with Mistress Zo’dee is a lot different than life with Mistress Po. For one, Zo’dee doesn’t have nearly as many toys for you to play with, and she even lets her android boss you around too. Her ship is far smaller, and she insists on feeding you a diet composed almost entirely of Kiro’s cum, not that you mind. It’s certainly done wonders for your [pc.butt], plumping it out even more than Mistress Po’s treatments.");
	
	pc.buttRatingRaw += 5;
	
	output("\n\nIt’s not all bad though. You get to share a bunk with Kiro every night, and Mistress Zo’dee insists that you arrange yourselves so that your face is buried in the tanuki’s crotch every evening so that you can quietly suck each other off when you’re too horny to sleep, which is a lot of the time, now that you think about it. As a well-trained fuckdoll, you know that you’ll have plenty of time to rest while your Mistress is out getting rich. As long as you’re there with a wet cunt and a smiling mouth for her to fill with eggs and spunk, she’s happy to have you onboard.");
	output("\n\nAnd making Mistress happy makes you happy.");
	output("\n\nJust today, she told you she wanted you to spend the day sucking Kiro’s cock, ‘to really stretch out that slut jaw of yours,’ and it’s working fabulously.");
	output("\n\nYou blink away the mask of cum covering your [pc.eyes] and twist the corners of your mouth into a smile. Kiro looks so happy when your nose brushes against her musky sheath. If you weren’t absolutely stuffed with dick and cum, you might even confess your love for the dolled-up kui-tan.");
	output("\n\nYou can always communicate your love via sex anyhow. It’s almost as natural as breathing. Besides, <b>you and Kiro are crewmates now. Mission accomplished!</b>");
	pc.changeLust(pc.lustMax());
	//BAD END :3
	badEnd();
}

//Defeat Illustria Po
public function spankPosNastyAss():void
{
	//HP
	if(enemy.HP() <= 1) 
	{
		output("<i>“What?”</i> Illustria’s voice sounds small and confused. For all her intellect, she never foresaw this turn of events. Her body, for all its elegance and mechanical strength, wobbles once before dumping her to the ground, prone. Its pristine beauty is marred with battle damage and slightly off-color patches where self-repair functions replaced artisanal beauty with durable, functional material. <i>“How?”</i> She strains, her shoulders whirring and clicking as she tries to rise.");
		output("\n\nThe result is the same: the mad doctor falls flat on the ground, helpless.");
		output("\n\nYou note that Illustria’s nipples have stiffened precipitously, and the still functional slit between her legs has swollen to full, juicy ripeness. Is she getting off on this? Has turning the tables on her revealed a facet of her sexuality she had yet to explore? You aren’t sure, but the scent of pure, warm lubricant rises temptingly to your nostrils.");
	}
	//Lust
	else
	{
		output("<i>“W-what?”</i> Illustria breathily stutters, for once struggling with her overblown sexuality. Despite it’s artificial nature, it was built with very organic needs in mind, and you’ve played those needs like a fiddle. Doctor Po whimpers and squirms, dropping to her knees. She licks her lips, looks up at you, then licks her lips again. <i>“Uh... look you can have your friend or whatever. Just fucking fuck me already, you damned tease!”</i> She grabs her tits and squeezes her transparent nipples, moaning and sliding down onto her back.");
		output("\n\nA very wet, ripe looking cunt reveals itself from between Illustria’s spreading thighs. Fruity-smelling lubricant wicks into the air as she presents herself.");
		output("\n\nYou could leave her like this, you’re fairly sure. She’d be too busy jilling off to get in your way, but can you really afford to leave a buxom beauty like her unfucked? She looks so tempting.");
	}
	//Choices here: [Fuck Pussy] [Fuck Face] [Suck Tiddy - dumb boye option] [Sit on Face] [HugeDickings] [Leave]
	if(pc.hasCock())
	{
		var capacity:Number = enemy.vaginalCapacity(0);
		if(pc.cockThatFits(capacity) >= 0) addButton(0,"Fuck Pussy",penisRouter,[fuckPosCunt,capacity,false,0],"Fuck Pussy","Sticking your dick into a cybernetic mad doctor filled with mystery fluids might seem like a bad idea - but it’d be a good idea for getting off.");
		else addDisabledButton(0,"Fuck Pussy","Fuck Pussy","You’re too big for her cunt, elastic and machined as it may be.");
		if(pc.cockThatFits(capacity) >= 0) addButton(1,"Fuck Face",penisRouter,[faceFuckOlIllustriusPozilla,capacity*1.5,false,0],"Fuck Face","Shut her up in the best way possible.");
		else addDisabledButton(1,"Fuck Face","Fuck Face","You’d split her head in half if you tried to force the issue - or crush your cock. One of the two.");
		if(pc.biggestCockVolume() > capacity) addButton(4,"Huge Dicking",penisRouter,[hugelyDickIllustriaYaCuntsauce,1000000000,false,capacity+1],"Huge Dicking","Pin her onto a table and grind your girth upon her.");
		else addDisabledButton(4,"Huge Dicking","Huge Dicking","As the name would imply, you require a huge dick.");
	}
	else 
	{
		addDisabledButton(0,"Fuck Pussy","Fuck Pussy","You lack the genitalia for this. You need a penis.");
		addDisabledButton(1,"Fuck Face","Fuck Face","You lack the genitalia for this. You need a penis.");
		addDisabledButton(4,"Huge Dicking","Huge Dicking","You lack the requisite huge dick.");
	}
	addButton(2,"Suck Tiddy",sukkSumTidBooooooiFromDatMadDocOnKQ,undefined,"Suck Tiddy","Now that you’ve taken Illustria down a peg, surely it can’t hurt to sample a few of the chemicals swirling around inside her. Who knows when you’ll have your next chance to suck big cyborg titty?");
	//Sit on Face (standard girl PC getting a quick ‘gasm)
	if(pc.hasVagina())
	{
		addButton(3,"Sit On Face",vaginaRouter,[sitOnPosFaceYaSloot,14,0,0],"Sit On Face","Shut her up in the best way possible.");
	}
	else addDisabledButton(3,"Sit On Face","Sit On Face","You lack the vagina required for this scene.");
	addButton(5,"End Her",endPo,undefined,"End Po","This is final. If you do this, Po dies, and the galaxy is a safer place. Yet the act of finishing a fallen foe may indelibly stain your soul for life.\n\nDo you dare?");
	addButton(14,"Leave",skipTownOnPosAssAfterWinning,undefined,"Leave","You’ve won. Free your friend and go home.");
	//Queue real combat victory:
	eventQueue.push(victoryEndWrap);
}

//End Her
public function endPo():void
{
	clearOutput();
	showName("IT’S\nOVER");
	author("Fenoxo");
	output("Doctor Po’s body proves more durable than you thought, but you succeed in your task all the same. It leaves a queasy feeling in your gut.");
	flags["KQ_PO_DEAD"] = 1;
	clearMenu();
	addButton(0,"Next",postPoOptionsWinRouting);
}

//Fuck Pussy
//Sticking your dick into a cybernetic mad doctor filled with mystery fluids might seem like a bad idea - but it’d be a good idea for getting off.
//Make sure she can take 35" wangs.
public function fuckPosCunt(x:int):void
{
	clearOutput();
	showPo(true);
	author("Fenoxo");
	//Crotch revealed:
	if(pc.isCrotchExposed()) output("Glad you’ve left your [pc.cocks] swinging free, you advance on the fallen doctor " + (!pc.isErect() ? "with rapidly stiffening intent":"full of firm, desirous intent") + ".");
	//Covered:
	else output("\n\nShucking your [pc.crotchCovers], you whip out your [pc.multiCocks] in record time" + (!pc.isErect() ? " and advance with slow, stiffening strokes.":" and advance with the sort of throbbing tumescence that makes a minute of waiting last an eternity."));
	//Merge
	output("\n\n<i>“");
	if(flags["KQ_LAST_HOUR_TF"] == undefined || flags["KQ_LAST_HOUR_TF"] < 12) output("Oh, now you have time to screw around. I see,");
	else output("Oh... oh yes. If I had known that all I had to do was beg, we could’ve saved soooo much time,");
	output("”</i> Illustria snarks, spreading her legs wider. The chromed lips of her part slowly, revealing the glinting, heavenly interior of her feminine passage. <i>“Fine then. Fuck me. Use me like <b>I’m</b> your personal fuckdoll. That’s what you want, isn’t it?”</i> She licks her lips whorishly while a trickle of pinkish pussylube eases out onto her thighs. <i>“I bet you expect me to whimper and giggle, but I’m n-”</i>");
	output("\n\nThrusting into the fallen doctor’s snatch proves an effective method of silencing her diatribe (for the moment), but it also subjects you to the raw, animal enjoyment of burying your [pc.cockNoun " + x + "] hilt-deep in the overengineered confines of her robopussy. You both grunt with surprising pleasure, each joyful to discover just how good it can feel to fuck the other. Grinding your hips into science-obsessed cyborg’s wantonly presented crotch shouldn’t be this delightful, but it is. For a moment you’re mated together, held captive by carnal desire.");
	pc.cockChange();
	output("\n\nIllustria recovers her wits first, not surprising for a woman who spends as much time fucking her products as making them. <i>“You couldn’t wait, could you?”</i> She hooks her legs behind your [pc.butt] and scissors you into her sopping-wet delta hard enough for you to feel her lips squishing and bulging against your own raw, sensitive loins. <i>“I know that feeling all too well. Sometimes the universe gives you a new toy... and you just <b>have</b> to <b>fuck</b> them.”</i> Internally, she tightens up around your girth, displacing a small fountain of her unnatural, pinkish girljizz onto your ");
	if(pc.balls > 0) output("[pc.sack]");
	else if(pc.hasVagina()) output("[pc.vaginas]");
	else if(pc.cockTotal() == 2) output("other tool");
	else if(pc.cockTotal() > 2) output("other tools");
	else output("thighs");
	output(". <i>“Isn’t that right?”</i>");
	//Bimbo
	if(pc.isBimbo()) output("\n\n<i>“I dunno about toys, but...”</i> You wiggle your [pc.cock " + x + "] around inside her. <i>“...I like to fuck a lot.”</i> You lean forward" + (pc.biggestTitSize() >= 1 ? ", pressing your [pc.chest] into her face":", smiling warmly down at her") + ". <i>“And when I meet someone new... that’s the first thing I wanna do.”</i>");
	//Bro
	else if(pc.isBro()) output("\n\nYou forcefully flex your abdominals, squeezing a bit of extra blood into your [pc.cock " + x + "] to make it throb hard against the internal constriction. <i>“You talk too much, bitch. Less talking, more fucking.”</i>");
	//Hard
	else if(pc.isAss()) output("\n\nSlapping her across the tits, you snarl, <i>“You don’t know me, bitch.”</i> You grab a nipple and twist until it dribbles a bit of pinkish mutagen. <i>“Consider yourself lucky I deigned to fuck your sorry ass.”</i>");
	//Mischievous
	else if(pc.isMischievous()) output("\n\n<i>“Oh, that’s how you think this works?”</i> Chuckling to yourself, you reach down and give one of the hefty, well-presented boobs a grope. <i>“You think that you’re still in control? That you’re not on your back with your legs spread for the first lowly Rusher to stumble into your lab?”</i> A bit of raucous laughter escapes you. <i>“It might time to re-examine who’s the real dumb fuckslut.”</i>");
	//Nice
	else output("\n\n<i>“No,”</i> you answer, wiggling your [pc.cock " + x + "] around inside her. <i>“But it is the best way to calm down after a rough scrap, wouldn’t you agree?”</i> Reaching down, you press your thumb to her clit. <i>“Right?”</i>");
	//Merge
	output("\n\nDoctor Po arches her back in pleasure, her vise-like cunt rippling around you. Her mouth falls open, the only sound to emerge a wanton gasp of delight. <i>“Uh...”</i> Below, her pussy grows warmer. The fertile furnace bathes you in clutching heat as its spasms slowly fall into a rhythm, working back and forth across the entire length of your firmly embedded shaft. <i>“...Okay. Just don’t stop fucking me.”</i> Her legs come uncrossed. You’re free. Her cunt’s fruity scent wafts into the air the second your dick slips a quarter inch out. <i>“Use me, [pc.name]. Please.”</i>");
	output("\n\nYou need no further encouragement.");
	//Normie dikku
	if(pc.cocks[x].cLength() <= 8) output("\n\nYanking back, you accidentally pull your entire length free, baring it from [pc.knot " + x + "] to pink-bathed [pc.cockHeadNoun " + x + "]. Shoving it back in as rapidly as possible seems the only prudent move, one your body is all too happy to respond to with impudent gusto. The slap of crotch to sopping crotch sends coral cuntbutter spraying in a wide fan. Rebounding off her plush mons, you piston back, this time arresting yourself in time to keep your [pc.cockHead " + x + "] lodged in her velvety confines, and hump again.");
	//Biggu Dikku
	else if(pc.cocks[x].cLength() < 22) output("\n\nYanking back, you withdraw until nothing but your [pc.cockHead " + x + "] remains inside her. The glossy, pink-coated length of your [pc.cockNoun " + x + "] shines under the lab’s harsh lights as you reverse course, plowing in so hard that sputters and spatters of glowing coral cuntbutter dot your heaving, pleasured forms. A quick rebound off her plush mons lines you up for the next stroke inside, and thanks to your considerable length, it feels like one long note of pleasure punctuated by an ecstatic splatter.");
	//Biggust Dickust
	else output("\n\nYanking back, you get to watch the straining silver cuntlips cling on to your mighty girth, seemingly unwilling to let a single, pink-glazed inch escape. Nevertheless, you extract nearly your entire rod, leaving only the [pc.cockHead " + x + "] within to hold her wide and gaping. Thrusting back inside feels like heaven. Even with every ounce of effort devoted to plunging as deep as fast as possible, it still seems to take forever. Your long, veiny length takes ages to fully sink inside, and when you clap your [pc.knot " + x + "] into that metallic muff, a cascade of wasted coral cuntbutter drains out in a soggy river.");
	//Merge
	output("\n\n<i>“Yesssss...”</i> Illustria purs, running her fingers through her hair. <i>“Take me, [pc.name]! Claim me!”</i>");
	output("\n\nThat’s exactly what you’re doing, and what you continue to do. You plug the mad doctor like it’s your favorite thing to do in the entire galaxy, and you must admit, from the way her cunt feels, she’s rapidly climbing up your list of <i>“extremely fuckable villains.”</i> You close your eyes for a second, to savor the sensation.");
	output("\n\nIs she getting warmer?");
	output("\n\nYour [pc.cock " + x + "] throbs,");
	if(pc.hasCocks()) output(" along with its unused brother" + (pc.cockTotal() > 2 ? "s":"") + ", equally");
	output(" glazed in pussy juices, but you dare not stop humping, not when you’re this close, not when every stroke feels a little warmer, a little tighter, and a little longer. Panting with the heat of it, you look down and watch your veins pulse and distend in between pussy-clapping pumps. Maybe you’re just getting tired. Maybe you’re pulling back a little bit slower. Maybe that’s why it takes you longer to see the underside of your [pc.cockHead " + x + "].");
	output("\n\nBut that wouldn’t explain why she looks more wide-open than ever. That wouldn’t explain why when you accidentally pull out too far, she gapes wide. It certainly wouldn’t explain why you feel a little bit dizzy, like there’s not enough blood in your body to keep you fully engorged and conscious at the same time. Still, you press on with ever longer strokes" + (pc.cocks[x].cLength() >= 14 ? ", watching a prick-shaped distention bulge her middle further and further middle at the apexes of your cyborg-rattling fuck":", surprised to discover a prick-shaped distention slowly forming in her belly") + ". Something in her pussyjuices is <b>expanding your dong" + (pc.hasCocks() ? "s":"") + ",</b> but you’re too close to climax to stop now!");
	output("\n\nYou gasp, <i>“What? H-how?”</i>");
	output("\n\nNo answer is forthcoming. Illustria writhes beneath your burgeoning pillar’s sensations. Her eyes roll back, unseeing. Her mouth falls open, and the full length of her enhanced tongue coils against her artificially thickened lips to provide another layer of intense sensation. Her pussy flits between patterns of clenches and flutters and undulations until you can’t even track of what it’s doing to your [pc.cock " + x + "]. You just know you’re swelling, and that it feels good - so very good.");
	output("\n\nThe trigger for your climax is not the tempo, or the internal caresses, or the sight of your fallen foe completely lost to pleasure. It’s the sudden appearance of a full gallon’s worth of girlcum racing across your length from [pc.cockHead " + x + "] to [pc.knotOrSheath " + x + "], oozing out in creamier, more viscous rivers than ever before. It feels like being licked across every vein while a hand of pure liquid squeezes you firmly, only her muscles can’t squeeze you any tighter. The only possible source of this pure pleasure is your increasing size relative to the at-capacity cunt.");
	output("\n\nGrabbing two handfuls of tit, you bury yourself to the hilt and unload, discharging fat lances of " + (pc.virility() >= 1 ? "virile ":"") + "[pc.cumNoun] directly into whatever passes for Illustria’s womb, if she even has one. All you know is that it feels good, and that the little bits of backwashing spooge make her pussy even slicker and better. You clench as hard as humanly possible. Unloading every drop of backed-up spunk becomes the most important thing in the galaxy as you ");
	if(pc.cumQ() >= 3000) output("rapidly, easily inflate Illustria with jizz. It’s difficult to tell when you’re this productive, but is she filling even faster than normal?\n\nThe gravid dome rising on Doctor Po’s form seems to indicate that yes, you are cumming harder and faster than before.");
	else output("slowly, meticulously inflate Illustria with jizz you shouldn’t even be capable of producing in such volume.\n\nYet you do. The gravid dome of Doctor Po’s belly is proof enough.");
	//Knot
	if(pc.hasKnot(x)) 
	{
		output("\n\n<i>“Ohhhhhhhhh, yessssssssss,”</i> Illustria moans as you finish, your knot trapping the bulk of your climax inside. <i>“You fucked me so fucking cum-pregnant, [pc.name]! And that knot... it’s got you trapped, doesn’t it?”</i> She makes a half-hearted attempt to crawl away before the bulbous, imprisoned flesh yanks her back. <i>“And now that I’m all stretched out, you have so much more room to grow. Which do you think will happen first? Will you pull manage to pull out, or will your knot get so nasty thick that it pushes me right off?”</i>");
		//Str check
		if(pc.physique()/2 + rand(20) + 1 >= 40 || pc.knotThickness(x) < 4) output("\n\nLooking down in alarm, you brace against Illustria and push with all your might, barely yanking your " + (pc.hasStatusEffect("Priapism") ? "wilting":"still-hard") + " cock out. Bared to the open air, you can see it soaking up the mad doctor’s pink residue, twitching and growing a little bit more before the last of the mutagen is spent.");
		//No strongo
		else output("\n\nLooking down in alarm, you brace against Illustria and push with all your might, but it’s not enough. Your [pc.knot " + x + "] holds firm and grows firmer by the second, thickening as it soaks up more drugged cuntjuice like a sponge. While it may feel pleasant at first, soon the pressure becomes stifling, painful even. If you hadn’t blown up her stomach with cum, you’re sure you’d be watching your [pc.cockHead " + x + "] climbing up higher this very moment. Instead, you suffer within her constrictive, torrid cunt until, as promised, your knot balloons with enough girth to pry the whole woman off of your massively-expanded cock, <b>now ");
		if(pc.cocks[x].cLengthRaw < 8) output("pornstar-grade");
		else if(pc.cocks[x].cLengthRaw < 11) output("bigger than most terrans could take");
		else if(pc.cocks[x].cLengthRaw < 14) output("the size of a forearm");
		else if(pc.cocks[x].cLengthRaw < 24) output("closing in on the size of a baseball bat");
		else if(pc.cocks[x].cLengthRaw < 34) output("now baseball bat-sized");
		else output("large enough to satisfy the greediest leithan");
		output("</b>.");
	}
	var grows:Number = 0;
	if(pc.cocks[x].cLengthRaw < 8) grows = 8 - pc.cocks[x].cLengthRaw;
	else if(pc.cocks[x].cLengthRaw < 11) grows = 11 - pc.cocks[x].cLengthRaw;
	else if(pc.cocks[x].cLengthRaw < 14) grows = 14 - pc.cocks[x].cLengthRaw;
	else if(pc.cocks[x].cLengthRaw < 24) grows = 24 - pc.cocks[x].cLengthRaw;
	else if(pc.cocks[x].cLengthRaw < 34) grows = 34 - pc.cocks[x].cLengthRaw;
	else grows = 4+rand(4);
	if(pc.hasPerk("Mini")) grows--;
	else if(pc.hasPerk("Hung")) grows++;
	if(grows < 2) grows = 2;
	grows = Math.ceil(grows);
	//Merge STrcheck
	//Merge all
	output("\n\n");
	if(!pc.hasKnot(x)) output("Worried about just how large you’re going to wind up, you pull out in the nick of time. ");
	output("[pc.CumNoun] and feminine fluids wash out in a crotch-bathing wave.");
	if(!pc.hasKnot(x)) output(" <b>You’re at least " + num2Text(grows) + " inches longer</b>... and the leftover pussyjuice grants you a little bit more size on top of that.");
	processTime(45);
	enemy.loadInCunt(pc,0);
	pc.taint(2);
	IncrementFlag("KQ_FUCKED_PO");
	pc.cocks[x].cLengthRaw += grows;
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",pussyFuckPoEpilogue);
}

public function pussyFuckPoEpilogue():void
{
	clearOutput();
	showPo(true);
	author("Fenoxo");
	output("Despite absorbing such a monstrous climax, Illustria Po looks barely winded when you deign to climb off her.");
	output("\n\nFortunately, she has an ample supply of handcuffs to keep her out of your way while you rescue your friend.");
	clearMenu();
	addButton(0,"Next",postPoOptionsWinRouting);
}


//[EDITED] Kiroquest - Illustria Po facefuck
//by Skom
// Requires a cock that fits. Using 'x' as the index for the chosen cock. No idea what her mouth's capacity is, but probably quite substantial, though less than her pussy. Better check her other scenes for reference.
public function faceFuckOlIllustriusPozilla(x:int):void
{
	clearOutput();
	showPo(true);
	author("Skom");
	output("You approach the defeated cyborg and run a [pc.finger] over her lips, noting the engineered smoothness and silicone-like plumpness. In involuntary response, she gazes up at you with a mix of fear and anticipation, which you would normally dismiss as just another psychological trick, but even if it is, there’s a clear layer of truth running behind the well-manipulated facade.");
	output("\n\n<i>“W-what are you looking at?”</i> Illustria Po asks as you smile down at her.");
	output("\n\nIgnoring the question, you pick your Codex and show the cyborg her own image on the camera. Her mouth makes a silent ‘O’ before she speaks again. <i>“Is that really... me?”</i> She asks with reticent fascination. <i>“I don’t think I have ever made such a vulnerable face for anyone but my dolls. Maybe not even for them, at least not to this degree.”</i>");
	output("\n\n<i>“Don’t worry, there’s a first time for everything,”</i> you reply casually " + (!pc.isChestExposed() ? "as you remove your [pc.upperGarments] ":"") + "and put the Codex on a bench nearby, setting it to holo-mirror mode. After a couple of seconds, it starts projecting a lifelike 3-D image of you and Illustria a few feet in the distance. <i>“Now we’re set,”</i> you say with satisfaction. The cyborg watches with interest, curiosity overriding her initial apprehension.");
	output("\n\n<i>“Are we broadcasting?”</i> She asks with a note of worry. Illustria might have done her fair share of live streams, but she’s clearly concerned about damaging her particular fucked-up ‘brand.’");
	output("\n\nIf that’s what she wants to think, you decide to let her. Without replying, you get back to the doctor and slowly slide a thumb inside her unresisting mouth, silencing further inquiries. Reacting on pre-programmed instinct, she starts suckling on your finger and running her nub-lined tongue over it. As a reward, you caress her hair with your free hand. <i>“You really made every part of yourself as fuckable as possible, didn’t you?”</i>");
	output("\n\nIllustria’s lips quirk upward in delight at the implication, and as soon as you remove your finger, she starts spouting some prideful boast: <i>“Of course I did! What kind of sci-”</i> but is interrupted as your hand reaches behind her head and unceremoniously pulls her face against your crotch. The scientist is stupefied for a moment as her artificial skin meets " + (!pc.isCrotchExposedByLowerUndergarment() ? "the fabric of your [pc.crotchCoverUnder],":"your [pc.skin],") + " but soon enough her reservations start giving way.");
	output("\n\nThe cyborg scientist takes a tentative whiff of your personal scent, ");
	if(pc.isTreated()) output("no doubt filing the heady, augmented aroma into her database of exquisite scents");
	else output("no doubt filing it away on her database");
	output(", and begins to rub her cheeks against your hardening bulge - not unlike a cat caressing its owner. Her whirring optical orbs meet your [pc.eyes], and you nod encouragingly. Illustria explores the sensation, worshiping every part of your [pc.crotch] with her face as you grin down at her. After a minute of this teasing, you decide to help by holding her head with a hand from behind while rubbing your crotch all over her face, " + (!pc.isCrotchExposedByLowerUndergarment() ? "the fabric of your [pc.crotchCoverUnder] already wet with":"smearing it liberally with your") + " [pc.cumFlavor] precum.");
	output("\n\nWhen you decide to stop, Illustria looks at you with a half-confused, half-pleading look. <i>“Why haven’t I done this before? Why is this sensory data so intense... so strong?”</i>");
	output("\n\nYou chuckle. <i>“Isn’t that obvious? Because this is what you always wanted: to get into people’s pants and worship their crotch. Why else would you build your body like this, the perfect sex doll? Who are you trying to fool here?”</i>");
	output("\n\nThe scientist tries to come up with a counter-argument, but all she can manage are stammered <i>buts</i> and <i>whys</i>. You take the opportunity to " + (!pc.isCrotchExposedByLowerUndergarment() ? "whip out your [pc.cock " + x + "] and slap her face with it,":"slap her face with your [pc.cock " + x + "],") + " drawing her out of the failed justification loop. As the cyborg eyes your meat, her tongue snakes out lewdly to wet her plush lips.");
	output("\n\nAt this point, you’re not even sure if that’s a programmed procedure, or just her own repressed instincts shining through, but it hardly matters as you place the [pc.cockHead " + x + "] on her lips and apply the slightest pressure. You don’t even have to tell her to open up - she does that on her own. As expected, even her mouth is a perfect piece of sexual engineering: smooth, hot and oily-slick in a way real saliva could never be.");
	output("\n\nWithout warning, she grabs your [pc.butts], while her prehensile tongue wraps around your shaft like a snake, its nubs running over your [pc.cockHead " + x + "] one by one with constant, pre-programmed slowness and drawing a low moan of satisfaction from your throat. But you don’t want to let Illustria take control, no - you want to teach her to enjoy a new kind of experience. And so, holding her head with a hand, you slowly push your shaft deeper in, forcing the tongue to disengage. She looks up at you with something like disappointment, and you could swear her eyes are pouting, but you just give her a cocky grin as you continue to feed her inches of your cock.");
	output("\n\nWhen you part her throat, however, you face a new surprise, as your cockhead is assaulted by a faint electric tingling that causes you to suck in a sharp gasp! Tentatively, you withdraw and push back in, enjoying the ring of electric stimulation that marks the entrance of her throat. The sensation proves a bit too much for the cockhead, but it’s fantastic on the shaft, causing your [pc.cockNoun " + x + "] to tense and twitch! Pushing even deeper into her tunnel, you’re delighted to find that not only is her throat ribbed like a sex toy - it also conforms to your shape and girth, reconfiguring itself into a tight but comfortable passage, complete with its own lubrication.");
	output("\n\nMoving your [pc.hips], you start to hump her mouth with a constant rhythm while holding her by the back of the head with a hand. <i>“Hey, look,”</i> you gesture to the holographic display with your chin. The cyborg’s eyes widen once she follows your cue, taking in the sight of her own frame being facefucked slowly but surely. <i>“This look really suits you, you know?”</i>");
	output("\n\nYou expected some resistance after this, but instead she continues to gaze at the holographic display, transfixed. Judging by the sheer amount of artificial girl-lube dripping from her exposed cunt, it looks like she’s enjoying this treatment. Hell, considering what you already know about Illustria Po, she’s probably installed pleasure receptors all over her lips, mouth and throat too, you wouldn’t be surprised if she started having an orgasm any moment now.");
	output("\n\nSuddenly, you feel the cyborg’s hands squeezing your hindquarters harder than before, and her eyes turn to you with a scary, fevered look. She breaks your rhythm by swallowing your [pc.cockNoun " + x + "] all the way in, ");
	if(pc.hasKnot(x)) output("even the knot, ");
	output("until her plush lips kiss your crotch.");
	if(pc.cocks[x].thickness() >= 2.6 || pc.cocks[x].knotMultiplier >= 2) output(" Despite her engineered mouth’s ability to distend beyond what is humanly possible, Illustria still has a bit of trouble accommodating your mammoth girth.");
	else if(pc.hasKnot(x) || pc.cocks[x].thickness() >= 2) output(" Her engineered mouth distends with apparent ease to accommodate your impressive girth, though she looks close to capacity.");
	if(pc.cocks[x].cLength() >= 8) output(" Hung as you are, you can even see the contours of your cock along her throat.");

	output("\n\nThe doctor proceeds to bob on your cock with wild abandon, her ribbed throat giving your [pc.cockHead " + x + "] an intense massage, while the ring of electricity applies its pleasurable tingle all over your twitching shaft. And she’s not even looking at your face anymore, just your crotch. Illustria’s slick, nubby tongue snakes out to reach ");
	if(pc.balls > 0) output("for your [pc.sack],");
	else if(pc.hasVagina()) output("your [pc.biggestVagina],");
	else output("between your [pc.thighs] and over your [pc.asshole],");
	output(" teasing and caressing it with wiggling mechanical precision.");
	output("\n\n<i>“Fuuuuck,”</i> you let out involuntarily. This treatment continues for another minute, and by that point it’s impossible not to moan out loud. You’re worried you might cum too soon, but the sensation starts to wane for some reason, until it’s been toned down to more manageable levels. Apparently, her body’s automatic functions have added a desensitizing agent to her throat’s lubrication, so as to prolong the fuck. She must be really enjoying this.");
	output("\n\nYour hypothesis is confirmed when Illustria suddenly stops, trembling and letting out muffled whimpers. There’s no need to even glance down to understand what’s happening: the doctor’s snatch is shuddering from her first orgasm and squirting copious amounts of pinkish artificial pussylube. After she regains her composure, you decide to tease her a little, pulling out your [pc.cockNoun " + x + "] and letting it rest on her face for a moment. She gazes at you with a vacant but defiant expression. <i>“Having fun, are you?”</i> she asks.");
	output("\n\n<i>“Not as much as you, by the looks,”</i> you retort, pointing to the pool of pink fem-lube at her feet. <i>“Your throat seems to be even more sensitive than a pussy, you must have really wanted someone to fuck your face, huh?”</i> No reply seems to be forthcoming, and, for once, the scientist looks truly embarrassed - which is even cuter with your cock resting on her face.");
	output("\n\nWell, she might be satisfied, but you haven’t had your fill yet. <i>“Move back a little,”</i> you tell the cyborg, and she does as commanded, until her back presses against the wall. To make it more comfortable, she grabs a pillow from the chair nearby and puts it behind her head. <i>Perfect</i>, it’s almost as if she knows what’s coming next, except that she doesn’t - someone who’s always been so dominant has no way of knowing.");
	output("\n\nOnce again, you line your [pc.cock " + x + "] with her mouth and push inside without preamble, her lips automatically parting to take you. The cyborg is about to resume her ministrations, but you block her by forcing your shaft all the way in and pinning her head against the wall with your [pc.thighs].");

	// Merge:
	if(pc.isBimbo()) output("\n\n<i>“Don’t worry, this is, like, gonna be suuuper fun!”</i> You reassure with a giggle before withdrawing a few inches and ramming them back in. Illustria’s muffled yelp is just hilarious!");
	else if(pc.isBro() || pc.isAss()) output("\n\n<i>“Time for the real deal, bitch. Ready or not, here I go,”</i> you warn before withdrawing a few inches and ramming them back in. Illustria’s muffled yelp is music to your ears.");
	else if(pc.isMischievous()) output("\n\n<i>“Time to get real, I hope you’re ready,”</i> you tease with a cocky grin before withdrawing a few inches and ramming them back in. Illustria’s muffled yelp is just hilarious!");
	else output("\n\n<i>“Relax, I’m sure you’ll enjoy this,”</i> you reassure with a smile before withdrawing a few inches and ramming them back in. Illustria’s muffled yelp belies her own pleasure.");

	output("\n\nYou repeat the process a few times, fully enjoying her nub-lined tongue and the electric tingle that slowly runs through your twitching shaft as you withdraw, followed by the tight caress of her slick, ribbed throat on your [pc.cockHead " + x + "] when you push back it. At first, you try to settle for a steady rhythm, but it quickly gives way to careless enthusiasm, and soon enough you find yourself plowing her mouth like a throwaway sex toy - which you suppose she is.");
	output("\n\nGrabbing the cyborg’s head with both hands, you drop the last shred of restraint and go all out, your [pc.hips] undulating in a frantic pace as you rut her face for all it’s worth. Illustria’s vacant artificial eyes are glued to the holographic projection of herself getting facefucked, and she seems to fully approve of your actions, if her furious fingering is any indication. Never mind her muffled moans of pleasure mixing with your own ecstatic grunts. It doesn’t take long for the doctor to reach another mind-wrecking orgasm, which causes her toy-like throat to shudder around your [pc.cock " + x + "], but still you continue to thrust without breaking pace.");
	output("\n\nBefore her orgasm even ends, your own begins, the [pc.cumNoun] being quickly pumped out by your contracting ");
	if(pc.balls > 0) output("[pc.balls] and ");
	output("prostate. You barely have time for one last thrust, ramming your [pc.cock " + x + "] as deep as you can");
	if(pc.hasKnot(x)) output(", mashing the inflated knot against her silicone-plush lips");
	output(" before your [pc.cockHead " + x + "] swells up and your seed starts bursting out with splashing force, further potentialized by that faint electric tingle that makes your shaft twitch like crazy inside her ribbed passage.");
	output("\n\nA loud grunt is all the warning a still-spasming Illustria has before you start to slag her system with [pc.cum], ");
	var cumQ:Number = pc.cumQ();
	if(cumQ < 1000) output(" firing rope after rope until your cumshot eventually starts to wind down.");
	else 
	{
		// Merge all, they are cumulative:
		output(" feeding her rope after thick rope of wad for well over a minute.");
		if(cumQ >= 5000) output(" By the time your cumshot finally starts to wind down, her previously slender belly is swollen way past its initial size.");
		if(cumQ >= 10000) output(" Even her internal reservoirs are no match for your humongous production - soon enough, the cum overflows, spilling out of the cyborg’s mouth and all over your [pc.crotch].");
	}	
	if(pc.hasCocks())
	{
		output("\n\nYour other cock" + (pc.cockTotal() >= 3 ? "s twitch in sympathetic orgasm and fire":" twitches in sympathetic orgasm and fires") + " ropes of [pc.cumFlavor] virile cum all over her face, hair and breasts,");
	}
	else output("\n\nYou pull out just in time to jerk off the last thick ropes of [pc.cumFlavor] virile cum all over her face, hair and breasts,");
	output(" painting the used sex toy with your seed - which Illustria takes with a brain-dead expression, her own mind still processing the ecstatic overload.");

	output("\n\nUtterly satisfied, you sigh and start making ready to get on with your business. A quick search turns up enough analog handcuffs to keep her bound. With any hope, she’ll stay out of the way and learn to enjoy a new facet of her sexuality. Taking a page out of Kiro’s book, you briefly turn back to take a pic of the cum-splattered doctor before leaving." + (!kiro.isBimbo() ? " The tanuki will definitely like this.":"") + " It’s going to be such a fond memento.");
	processTime(35);
	enemy.loadInMouth(pc);
	pc.taint(1);
	pc.orgasm();
	IncrementFlag("KQ_FUCKED_PO");
	clearMenu();
	addButton(0,"Next",postPoOptionsWinRouting);
}

//Suck Tiddy - dumb boyes get mouthful of libido-maxing mutagenic futa goo
//Now that you’ve taken Illustria down a peg, surely it can’t hurt to sample a few of the chemicals swirling around inside her. Who knows when you’ll have your next chance to suck big cyborg titty.
public function sukkSumTidBooooooiFromDatMadDocOnKQ():void
{
	clearOutput();
	showPo(true);
	author("Fenoxo");
	output("You settle over the fallen scientist with an ear to ear grin. The entire time you’ve been in her lair, she’s been trying her damnedest to trick you into accepting more of her ‘gifts.’ No matter. You’ve resisted temptation well so far. Illustria’s science can’t corrupt your free will, even if it might be able to give you a rocking, ultra-fuckable body the likes of which high-class escorts would dream of. And now that you’ve emerged victorious, it’s entirely your choice to lean down over one of her transparent nipples, guide it into your mouth, and gently suckle at the perverse cocktail she keeps swimming within.");
	output("\n\n<i>“Oh,”</i> Illustria mouths, relaxing almost immediately. <i>“So you did want my gifts.”</i> She giggles as a menagerie of fruity flavors burst across your tongue. <i>“You’d just rather <b>take</b> than merely <b>accept</b>? Is that it?”</i> She sighs with satisfying pleasure. <i>“I must admit, this is a first for me. The experience is almost worth the loss of my masterwork... assuming you still wish to claim her when you’ve drank your fill.”</i>");
	output("\n\nKiro? Of course you’re still going to claim her. How could you forget the whole reason you’re here in the first place?! Still, there’s no point in replying, not when it would require you to let Illustria’s perfect titty slip out of your mouth. You settle for glaring daggers at her over the swell of her boob. That’ll show her. Well, that and suckling more firmly. Surely doing so will mix a bit of pain with her pleasure.");
	output("\n\nIt does not.");
	output("\n\n<i>“Ohhhh yes.... Drink up, [pc.name],”</i> Doctor Po coos, <i>“you’re a growing [pc.boyGirl].”</i>");
	output("\n\nYou do your best to ignore her taunts and focus on what you crave: more of her succulent ambrosia. It doesn’t leave you feeling full or bloated. You could hollow your cheeks, suck even harder, and drink for the rest of the day if you wanted to - not that you do. You just... could. You doubt you’d tire of the flavor. It’s sweet but with a hint of chemical tang that you can’t quite describe, but now that you’re thinking about it, it tastes sort of like the feeling of becoming aroused.");
	output("\n\nOr maybe you’re just getting so turned on that it’s getting hard to think objectively about the flavor of Illustria’s boob-juice. You pull back to gather your wits, letting her nipple slowly slide from your lips. It pops loudly, breaking the perfect seal.");
	if(pc.lipRating() < 5) 
	{
		output(" Your maw feels swollen - puffy. Like there’s more lip to wrap around nip.");
	}
	output(" The visible reservoir is almost empty! You’ll need to move to her other breast if you want to drink some more, and now that you’ve stopped, you can very clearly identify how much you’d like to keep drinking.");
	output("\n\n<i>“Go on.”</i> Illustria grabs her breast with both hands and presents it for easy suckling. <i>“Take as much as you want. I’ll fill up again when you leave... assuming you still want to leave.”</i>");
	output("\n\nIgnoring the ");
	if(pc.biggestTitSize() < 1) output("subtle shifting of your chest as you lean down, you");
	else if(pc.biggestTitSize() < 10) output("the almost excessive jiggle of your chest as you lean down, you");
	else if(pc.biggestTitSize() < 40) output("the shifting of your mountainous melons as they roll across the cyborg’s exposed tummy, you lean down and");
	else output("how your gargantuan mounds wobble even more than usual, you lean down and");
	output(" accept the proffered nipple. You can almost forget the violence that lead you to this point. With the warm, syrupy goo bathing your tongue, it’s so easy to forget Illustria’s nefarious intents. She’s just a beautiful girl with fluids so lovely that their very taste seems addictive. Hollow-cheeked, you guzzle at her second reservoir with endless thirst.");

	output("\n\n<i>“Good girl,”</i> Illustria praises, daring to pet your [pc.hair]. <i>“Very good girl.”</i>");
	output("\n\n" + (pc.mf("m","f") == "m" ? "You’re not a girl... ":"") + "Maybe that should bother you. You just defeated her, pinned her to the ground, and claimed her flawless boobs for yourself. Why does it feel like she’s in charge? Why do those words make you blush?" + (pc.mf("m","") == "m" ? " Especially being called a girl - does she think you’re pretty?":"") + " Maybe you’re not as in control as you thought you’d be. Maybe that’s okay though. You’re still on top. It’s you who’s choosing to lean down, to press your ");
	var softs:Boolean = false;
	if(pc.lipRating() < 5)
	{
		softs = true;
		output("softening ");
	}
	output("features into the ");
	if(softs) output("even softer");
	else output("soft");
	output(" expanse of Illustria’s mammary goodness. You can stop sucking whenever you want, and Illustria can call you a good girl as much as she wants. It’s probably fine.");

	//No tits yet
	if(pc.biggestTitSize() < 1)
	{
		output("\n\nJust like the extra weight on your chest is probably fine. Lots of people have breasts in this day and age. Most of the galaxy does. If growing a pair of cute, jiggly titties");
		if(pc.lipRating() < 5) output(" and getting big, soft lips");
		output(" is the price you have to pay for nursing Doctor Po, that’s a price you’re happy to pay. In fact... you reach up to explore the burgeoning flesh" + (!pc.isChestExposed() ? ", popping open your [pc.chestCover] for a better grip on the tender buds":", savoring the texture of your tender buds") + ". You can almost feel your breasts swelling bigger with every suck, yet you refuse to slow. If anything, you drink deeper, faster, more emphatically than ever before. The expanding curvature of your newfound boobs all but demands it.");
	}
	//Non huge tits
	else if(pc.biggestTitSize() < 24)
	{
		output("\n\nJust like the feeling of your chest getting heavier is probably fine. There’s nothing wrong with bigger breasts, right? Most of the galaxy has a decent pair of tits. You can’t be blamed for accepting a little growth in exchange for a chance to guzzle a bit longer. As a matter of fact, you’re pretty sure you can feel them giving little microjiggles each time you swallow, thickening and expanding against the fingers you don’t remember cupping them with." + (!pc.isChestExposed() ? " When did you pop open your [pc.chestCover]?":"") + " Your fingers feel so good against your bare chest that you whine into Illustria’s nipple in between increasingly emphatic suckles. Your expanding tits demand it.");
	}
	//Huegbois
	else
	{
		output("\n\nJust like the feeling of your mountainous chest wobbling is probably fine. You don’t need to do anything but drink to set it off. Every swallow is mated to a jiggling retort from your heavy hanging ladies that leaves them feeling warm, and large, and perfect for smothering a partner with - just like you’re doing now. As you increase the tempo of your swallows, suckling even more emphatically upon the cyborg’s tainted teat, you realize that your tits aren’t just bouncing with kinetic pleasure - they’re being propelled by the sudden, violent growth of additional tissue. Illustria’s “milk,” if you can call it that, is making you softer by the second, yet you can’t find a reason to stop. You’re so <i>curvy</i>." + (pc.lipRating() < 5 ? " It brings a smile to your swelling lips.":""));
	}
	//merge
	output("\n\n<i>“Such a good, pretty girl,”</i> Illustria purrs to you, her voice so warm and firm. She’s easy to listen to; her voice strokes your consciousness the same way that your fingers caress your ballooning bosom. <i>“Drink it all up. Every drop. You’re going to be so pretty when you’re done, sweet thing. You’ll be so chesty, and horny, and beautiful.”</i>");
	output("\n\nYou mumble something that sounds like assent, immediately regretting when a bit of pink juice escapes the corner of your suck-hungry lips. You lash out with your tongue to scoop it up before it can escape, earning a pleased titter for your semi-robotic partner in titty-sucking crime. Being a superhot bombshell sounds pretty good, especially with how weak " + (pc.legCount > 1 ? "between the knees ":"") + "her praise makes you feel" + (pc.legCount == 1 ? " below the waist":"") + ".");
	if(pc.hasVagina()) output(" You’re getting as slick and drippy as if she were ramming her fingers deep into your twat" + (pc.hasVaginas() ? "s":"") + ", all without a single touch.");
	else if(pc.hasCock()) output(" You’re getting as hard and drippy as if you were dick-deep inside her, all without a single touch.");
	output(" You can be such a good girl for her." + (pc.femininity < 100 ? " A pretty girl.":" The prettiest girl."));

	//Cummies
	output("\n\nPretty soon, you’re having to suckle twice as hard keep a basic dribble flowing. There’s an easy fix for that though: bouncing back to the original nipple, the one you didn’t quite finish with. Rich, full, titty-swelling flavor fills you. You swoon and gasp through your nose in between swallows. Both of Illustria’s hands twirl " + (!pc.hasHair() ? "across your head":"through your [pc.hairNoun]") + " fondly as you give up more and more control, your hips jerking, practically twerking your [pc.ass] to the tempo of your swallows.");
	output("\n\nYou’re warm, and pink, and pleasured, and all you have to do is think about how big and heavy your boobies are to make your crotch twinge in ecstasy. One big suck allows that twinge to clench down into a full-on");
	if(!pc.isCrotchExposedByLowerUndergarment()) output(", [pc.crotchCoverUnder]-flooding");
	else if(pc.hasVagina())
	{
		if(!pc.isSquirter()) output(", crotch-soaking");
		else output(", cyborg-bathing");
	}
	output(" orgasm. Riding that climactic high makes it easy to forget about how you got here, or why you’re sucking a rapidly emptying teat like your life depends on it, or why you’d want to do something besides swallow Illustria’s blissy boobmilk.");
	processTime(60);
	pc.milkInMouth(enemy);
	pc.orgasm();
	pc.taint(5);
	clearMenu();
	addButton(0,"Next",drinkSomeBoobMilkFromPoWhatCouldGoWrongPart2);
}

public function drinkSomeBoobMilkFromPoWhatCouldGoWrongPart2():void
{
	clearOutput();
	showPo(true);
	author("Fenoxo");
	output("Reality reasserts itself with a vengeance. No amount of mind-altering lactation will adjust your body’s reflexes for a chest that’s suddenly much larger, and the weighty mams topple you to the side in a moment of orgasmic weakness.");
	output("\n\nThe floor hits you hard. The kinetic impact is enough to get your adrenaline flowing and momentarily shake off the effects of Illustria Po’s nefarious titty-drugs. That was close. You almost lost yourself to her - almost decided to kneel down and lick at her spit-shined nipples until she’d let you have some more of that pink ambrosia... but you resist, even if resistance feels like the hardest thing in the world. Even if you can’t stop yourself from leaning down for one last suck while you wrangle the handcuffs you found in a bin into position.");
	output("\n\nIllustria doesn’t fight. She’s smiling too broadly and telling you what an impressive, talented <i>girl</i> you are for not losing yourself in her chest, and how smart you are for extracting your revenge like that <i>instead of doing something silly like turning her in</i>.");
	output("\n\nOf course! You won, and you got to decide how to punish Illustria, and now that you’ve had your fill of punishment milking, you’re done with her... unless you get a chance to give her another suck once she refills. That might be too tempting to refuse.");
	//Grow tids, feminize face, grow lips if can't fem face :3
	var tids:Number = pc.biggestTitSize();
	var tidGrow:Number = 0;
	if(tids == 0) tidGrow = 14;
	else if(tids <= 12) tidGrow = 12;
	else if(tids <= 20) tidGrow = 10;
	else if(tids <= 30) tidGrow = 8;
	else if(tids <= 40) tidGrow = 6;
	else tidGrow = 4;
	tidGrow += rand(4);
	for(var i:int = 0; i < pc.bRows(); i++)
	{
		pc.breastRows[i].breastRatingRaw += tidGrow;
	}
	output("\n\nNow all you have to do is get <b>your newly embiggened " + pc.breastCup(0) + "s</b> properly arranged");
	if(pc.lipRating() < 5)
	{
		if (pc.femininity < pc.femininityMax())
		{
			pc.modFem(50);
		}
		if(pc.lipRating() < 5) pc.lipMod++;
		output(", check out <b>your enhanced lips</b> in your Codex’s camera");
	}
	output(", figure out if you want to keep being a <b>good girl</b> forever, double-check Illustria’s bindings, and get out of here before you wind up as some kind of doll.");

	processTime(5);
	IncrementFlag("KQ_FUCKED_PO");
	clearMenu();
	addButton(0,"Next",postPoOptionsWinRouting);
}

//Sit on Face (standard girl PC getting a quick ‘gasm)
public function sitOnPosFaceYaSloot(x:int = 0):void
{
	clearOutput();
	showPo(true);
	author("Fenoxo");
	//Covered
	if(!pc.isCrotchExposed()) output("Kicking your way out of your [pc.crotchCovers], you climb onto");
	//Uncovered
	else output("Stalking forward with your hips swaying back and forth, you move above");
	//merge
	output(" the wanton sexbot of a woman and abruptly drop your [pc.vaginas] square onto her face. She and her gadgets are responsible for every bit of lust in your body. It’s only fitting that she feel the warm, oozing proof smearing across her cheeks and nose. You look down and smile. Illustria Po is there, between <i>your</i> thighs, pinned to the floor with your femininity, with nothing she can do but inhale your cunt and service your needs.");
	output("\n\nNow who’s the fuckdoll?");
	output("\n\nThe once self-possessed scientist’s cheeks color with arousal" + (enemy.HP() <= 1 ? " and shame":"") + ", but she does not resist for long. The closest she comes to fighting back is looking up at you in irritation, but then her tongue, all 12-plus inches of it, ventures out to taste your flavor directly, lashing up and down across your exterior netherlips with the kind of attentiveness you’d expect from a professional service girl. Her eyes drift closed around the same time as yours.");
	output("\n\nFate may have made you enemies, but circumstances have presented you both with a chance to enjoy the other as a lover, and for the moment, neither of you regret it.");
	output("\n\nHow could you? That tongue isn’t just a foot or more long - it’s covered with slick nubs. They’re the perfect size to make your nerves flash with pleasure and the positioned perfectly to drum on either side of your [pc.clits] when they slide by. You whimper girlishly, unable to stop yourself from throwing your head back, bracing a hand on one of her soft, supple tits, and grinding your [pc.hips] around like an ausar whore in heat. Doctor Po remains unfazed. Her magical muscle stays directly on target, working your slit no matter how you gyrate. More accurate than the best of laser-guided munitions, it strums your buzzer with determined, relentless lust.");
	output("\n\nIf all the cyberdoctor’s sexdolls lick pussy like she does, no wonder the galactic elite are buying them up in droves! You’re almost tempted to keep her, just so she can eat you out whenever you get this horny. Rocking back and forth");
	if(pc.vaginas[x].wetness() < 3) output(", you can feel yourself getting wetter and wetter. Trickles of your moisture slide down her cheeks.");
	else if(pc.vaginas[x].wetness() < 4) output(", you can feel yourself getting even more soaked than normal. Thick streamers of moisture soak Illustria’s cheeks and puddle into her hair behind. Her jaw works, inadvertently pleasuring you with her cunt-slicked lips. She’s not just licking: she’s swallowing.");
	else if(pc.vaginas[x].wetness() < 5) output(", you somehow get even wetter, which is saying something for you. Streams of moisture soak Illustria’s cheeks and drench her hair in the growing puddle below. She works her jaw like mad, swallowing what she can, but you’re simply too wet and wild for her to capture it all. You bathe her in girlmusk until her swallows slow and she smells decidedly like your cunt. And then you leak some more.");
	else output(", you reach whole new heights of wetness. Heavy streams of moisture bathe Illustria’s cheeks and slick back her hair. She tries to swallow some of it, but even for a cyborg body built with sex in mind, she doesn’t have a chance in hell of keeping up. You drench her with your wanton, free-flowing pussy-juice. From the shoulders up, Miss Po is bathed in pure, distilled girlmusk until her artificial skin shines brighter than a new-painted ship.");
	//FUCK YE THE GOOD SHIT :3
	output("\n\nSeated atop your latest conquest, you savor the pleasure of victory while you can... which doesn’t turn out to be very long. Illustria’s teasing tongue plunges upward with spear-like speed, embedding itself in all the way to your cervix. Her hands grab onto your cheeks, to keep you from pulling away, and the defeated cyborg’s pistoning organ absolutely ravages your [pc.vaginaNoun " + x + "]. It plows you as hard as any dick, its exotic texture strumming excited, unprepared muscles into paroxysms of ecstasy.");
	output("\n\nVictory forgotten, you writhe atop that spire of machine-perfected bliss until you’re bouncing to its tempo");
	if(pc.vaginalPuffiness(x) > 0) output(", bouncing your " + (pc.vaginalPuffiness(x) > 1 ? "obscenely ":"") + "fattened cunt-lips off her with noisy squelches");
	output(". The sensation brings a whole new meaning to the term ‘face-fucked,’ and you never want it to end. Grabbing hold of your [pc.chest], you give yourself over to the pleasure, creeping closer and closer to what’s sure to be monstrous orgasm.");

	//VARIANT CITY!
	//Lipples
	if(pc.hasLipples()) output("\n\nBarely controlled fingers drift within sucking range of your [pc.lipples], and the chest-mounted maws waste no time in pulling them inside. You nearly cum from that, from sucking on two sets of fingers while your [pc.vaginaNoun " + x + "] gets pounded into the shame of Illustria’s tongue, but for now, climax eludes you, leaving you twist in place and stuff a third digit inside each of your perverse nipples. The knowledge that you’d make a perfect fuck-doll lingers in the back of your mind while you suck yourself off, slowly feeding your foe more cunnilingal cream.");
	//Nipplecunts
	else if(pc.hasNippleCunts()) output("\n\nBarely controlled fingers slide into your [pc.nippleCunts] with ease. The response is automatic, your body doing what it can to match the pleasure you’re getting from Illustria with a bit of added self stimulation. It’s strange, riding a high of penetrative pleasure from three holes at once" + (pc.totalNipples() > 2 ? ", and it only gets stranger when your palms roam across your [pc.chest], pausing to plumb each chest-mounted honeypot two at a time":"") + ". The knowledge that you’d barely need modded to make a prime fuckdoll lingers in the back of your head, at least until your pointer fingers curl to stroke the most deliciously sensitive spots inside.");
	//Dicknipples
	else if(pc.hasDickNipples()) output("\n\nBarely controlled muscles twitch, and your [pc.dickNipples] boil out of your [pc.nipples] like hungry serpents. Wrapping your fingers around " + (pc.totalNipples() > 2 ? "two of ":"") + "them comes as the most natural, automatic thing in the world. Stroking them feels like pure magic, like fucking two pussies every bit as wet as your own. Fireworks of dick-dribbling pleasure threaten to push you over the edge as you feverishly stroke, knowing that no matter what happens, you’re going to jerk yourself to climax one way or another.");
	//Cunttail
	else if(pc.hasCuntTail()) output("\n\nA <b>second</b> penetration causes you to shudder so violently that you nearly topple clean off of your perch. Your [pc.cuntTail]! It must have wriggled around to see what had its host so hot and bothered, and Illustria, slut that she is, plugged it with her fingers without a single moment’s pause. She fingers it with idle strokes, not working it with the same sort of effort that she shows pussy-prime, but even her half-assed efforts are enough to shoot thigh-quivering bolts of pleasure through the parasite.");
	//Cocktail
	else if(pc.hasCockTail()) output("\n\nHot, wet warmth seems to surround you for a second, until it vanishes into cool air. Then it happens again, and you look back in time to see your [pc.cockTail] plunging in and out of Illustria’s sodden chrome cunt with rapacious energy. It fucks her even faster and harder than the tongue in your twat, and you’ll be damned if you’re going to stop it. After what she’s done, she deserves a bellyful of a parasite’s sperm, and you deserve to come from both ends until you’re fully, wholly satisfied.");
	//Multitwat
	else if(pc.hasVaginas()) output("\n\nJust as you’re getting used to the onslaught of sensations, Illustria rocks your world once more. All it takes is a slight bend in her tongue, and she’s slipping out of one clenching cunt and into a slippery, unexplored slit. She pistons back and forth between them for a minute, hitting her mark no matter how hard you grind into her face. Every inch of female reproductive anatomy is slathered in spit and fucked into spasmodic, clenching arousal.");
	//Suckable clitties
	else if(pc.clitLength > 3) output("\n\nThe cunt-drunk doctor nearly throws you when she shifts underneath you. You prepare to pin her back down and forcefeed her exactly what she deserves until she spreads her lips around your [pc.clit] and slides down the pulsing pole with hollowed cheeks, sucking it off like a cock... with ten times the nerve density. You can’t resist. You cry out, and her tongue burrows below to snake back into your juicing, soaked snatch. Somehow she’s sucking you and fucking you at the same time.");
	//No special texts? Get a generic paragraph before cummies :3
	else output("\n\nThe wet slap of pussy on face fills the air. You beat Illustria’s face like a drum, humping and grinding with reckless abandon. Riding high on a wave of pure, blissful sensation, you hump your way closer, and closer, and closer. Illustria’s mechanical muscle never flags or slows. It drives through your glossy, luridly squelching gates like the galaxy’s best, most expensive vibrator.");
	//Then cummies :3
	output("\n\nAnd you cum.");
	//Nonsquirt - no new PG
	if(!pc.isSquirter()) output(" Every inch of your body clenches, from head to " + (pc.hasToes() ? "toe":"[pc.footOrFeet]") + ". Squeezed-out dribbles of [pc.girlCum] race down Illustria’s messy visage, and the sexdoll-making mad doctor shudders with apparent bliss, her tongue thrashing inside your taut folds.");
	//Squirt - no new PG
	else
	{
		if(pc.girlCumQ() < 1000) output(" It starts out with a feeling of rolling, undulating clenches, starting at your [pc.footOrFeet] and lurking in your [pc.thighs] until a single spasm unleashes a flood of [pc.girlCum] into Illustria’s face. The sexdoll doctor seizes up in the moment, climaxing herself as she bathes in your copious juices, and together, you arch your backs and unleash waves of roiling, torrid heat from your distant but equally oozy loins.");
		//Gigasquirt :3
		else output(" The burst of [pc.girlCum] that sprays out of your quaking thighs fires with enough intensity to fling Illustria’s tongue back into her snide little mouth - and to soak her, the floor, and everything within a ten foot radius. Gyrating in mad pleasure, you geyser girlish joy all over her until she has no choice but to give into her own augmented urges and unleash a meager burst of her own fruity secretions. Climax wrings you out like a sponge, and as you cool down, you grind your twat into soaked scientist’s lips, forcing her to drink to the last dregs of your hyper-productive orgasm.");
	}
	//Merge
	output("\n\nShe’ll be thinking about your taste for ");
	if(!pc.isSquirter()) output("days");
	else if(pc.girlCumQ() < 1000) output("weeks");
	else output("months");
	output(".");
	processTime(45);
	enemy.girlCumInMouth(pc);
	pc.orgasm();
	pc.taint(1);
	//TF CITY!
	if(!pc.isSquirter()) 
	{
		pc.vaginas[x].wetnessRaw += 2;
		if(pc.isSquirter()) output("\n\n<b>You are now a squirter!</b>");
	}
	else if(pc.vaginas[x].wetnessRaw < 5) pc.vaginas[x].wetnessRaw = 5;
	if(pc.girlCumQ() < 1000) pc.boostGirlCum(15);
	else pc.boostGirlCum(2);
	IncrementFlag("KQ_FUCKED_PO");
	clearMenu();
	addButton(0,"Next",poEatsOutThePCPartDuesEx);
}

public function poEatsOutThePCPartDuesEx():void
{
	clearOutput();
	showPo(true);
	author("Fenoxo");
	output("Despite working so hard to give you a monstrous climax, Illustria Po looks barely winded when you deign to climb off her.");
	output("\n\nFortunately, she has an ample supply of handcuffs to keep her out of your way while you rescue your friend.");
	clearMenu();
	addButton(0,"Next",postPoOptionsWinRouting);
}

//Huge Dickings (The one only Fen cares about)
//Illustria amused. Pin her onto a table and grind on her. She grabs milker to suck onto your prickhead.
public function hugelyDickIllustriaYaCuntsauce(x:int):void
{
	clearOutput();
	showPo(true);
	author("Fenoxo");
	output("Needing no further encouragement, you take the cock-hungry doctor guide her onto a nearby table. She barely resists when you snap her arms and legs into the restraints, " + (!pc.isCrotchExposed() ? "and when you fiddle with":"and when you free") + " your slab" + (pc.hasCocks() ? "s":"") + " of titanic cockmeat, her expression morphs into one of sublime desire.");
	output("\n\n<i>“That would never fit inside this frame, no matter how I modified the pussy.”</i> She wriggles, leaking a dollop of pinkish goo onto the hard surface between her knees. <i>“I might have to make myself a bigger body, just for " + pc.mf("studs","breeders") + " like you.”</i> She gasps, <i>“Maybe even invite you back to take me for a ride...”</i>");
	output("\n\nYou " + (pc.tallness < 60 ? "climb onto a stool and ":"") + "drop your [pc.cock] onto her without another word. It impacts against her with a loud slap, smearing a bit of pheromonal sweat on the doctor’s cheek as it nestles into the creamy valley between her tits, too large to be entirely ensconced. She whimpers from the force at first, then from desire. Her breath is warm against your " + (pc.cocks[x].cLength() < 48 ? "[pc.cockHead]":"underside, so you scoot back enough for it to bathe the sensitive nerves of your [pc.cockHead]") + ". This is how Doctor Illustria Po should look: restrained, defeated, and drunk with the prospect of servicing your too-big dick.");
	output("\n\nSomebody ought to turn her into a fuckdoll, one of these days, but for now you’re more concerned with giving her a glazing to remember after how she teased you.");
	output("\n\nAs you begin to rut her proper, you find yourself wondering: was her skin always this slick? Did Illustria build herself a body that could be fucked in any way, from any angle, with any genitalia in the universe? Because sliding across her feels like sliding across slick velvet. She’s warm and low-friction, and when your veins bump across the fluid-bearing domes of her nipples, she arches her back and cries out in unrestrained bliss.");
	output("\n\n<i>“Mmmm, it’s a shame you didn’t floss that behemoth through my thighs. My pussyjuice could take a slut-breaker like that and make it even better - or at least bigger.”</i> Illustria wriggles in her restraints, producing hot spots of friction here and there along your length. <i>“I’ll just have to see if I can cum hard enough to give you a little boost!”</i>");
	output("\n\nNot thrilled at the idea of having your size fiddled with by outside forces, you respond by shifting the angle of your hips to press your [pc.cock] down more firmly. Then you work it back and forth, alternatively butting your tip into her lips before burying the entirety of her face beneath your spongy urethral bulge. You can’t imagine she’d cum without touching her pussy, but neither would you have expected anyone to come equipped with dick-expanding vaginal fluids.");
	output("\n\n<i>“Hey, " + (pc.mf("stud","slut")) + "!”</i> Illustria chirps, arms stretched over her head to hold a milking cup that’s just the right size for your [pc.cockHead]. <i>“I got you a present.”</i> She pushes it onto your [pc.cockNounSimple] without warning, the lip constricting snugly against your most sensitive places to hold on. Immediately, it begins to pump and suck, ravaging your tender apex with feathery strokes of pleasure designed to ease you into orgasm all on their own. <i>“Now you won’t make a mess while you use me... and I can do this.”</i> She wraps her arms around your girth, pinning you to her chest, and begins to kiss her way around your veins until you’re trembling and dripping into the milk-cup’s captive clutches.");
	output("\n\nYou <i>could</i> pull off of her and remove the troublesome device. You could. You could even put her back in the restraints and weld them closed this time, but you don’t. You just keep humping, drunk on pleasure, your [pc.cock] as hard as ever, leaking for the machine and Doctor Po both. If she truly meant to cause mischief, she would have by now - or so you hope. Either way, you’re too intent on getting off to care, savoring the extra excitement a little danger provides.");
	output("\n\n<i>“There you go,”</i> Illustria coos, her words muted into mumbles by your shaft smothering her face. She reappears bleary-eyed with a streak of spit across one cheek, licking her lips like a cat savoring a bit of creme. <i>“You should consider letting me work on you for real later. The pleasure you feel now cannot compare to the sublime delight of being remade into a being of ecstatic service.”</i> Her face vanishes again. This time when returns, she doesn’t open her eyes, but her hands are stroking more eagerly. <i>“Orrrr just keep doing this, I guess.”</i> Her hips twitch, and squeezes your cock tightly. <i>“Getting me all cock-drunk... mmmm...”</i>");
	output("\n\nSomething warm and wet is leaking from her nipples, perhaps forced out by the added pressure of her embrace, but it makes her body so undeniably, beautifully slick that it’s hard to care if she’s letting out a little milky lube. Grabbing her feet for support, you increase the tempo of your full-body frottage, humping against Illustria’s soft, fuckable form until you’re ");
	var cummies:Number = pc.cumQ();
	if(cummies < 1000) output("dribbling freely");
	else if(cummies < 20000) output("pumping thick dollops of pre");
	else output("drooling a river of pre");
	output(" into the milker’s receptive cavity, on the cusp of climax.");
	output("\n\nThe lusty cyborg groans, <i>“Nnngh... Just fucking bury me in dick, [pc.name]!”</i> She vanishes beneath your quivering mast once more, her thighs quivering in anxious desire. Her face reappears with pinkish tears leaking from her eyes. <i>“Probably sh-shouldn’t have left my pheromone receptors cranked up, but...”</i> She vanishes. Her reappearance is lightly sprinkled with whatever leftover goo leaked from her nipples. <i>“...Think I’ll just turn them up a little higher an’ love this dick some more, o-okay?”</i> The puddle between her thighs reaches the bottom edge of the table and starts dripping onto the floor.");
	output("\n\nThe restraints around Illustria’s thighs pop open. You suppose those metallic ‘ears’ of hers have wireless security overrides from everything in her lab, but rather than reacting with fear, you feel nothing but delight as her thighs wrap tight around your [pc.knot]. It’s too much. The constant low-grade teasing of your [pc.cockHead] combines with Illustria’s embrace, her increasingly sloppy kisses, and the fervent pressure of her thighs to drive you past the point of holding back.");
	output("\n\nYou unload, spraying a captive load right into her milker’s pipe, letting the machine wick away every drop.");
	if(cummies < 250) output(" It feels like a waste to shoot so little into such an impressive device, but if Illustria cares, she makes no sign of showing it.");
	else if(cummies < 1000) output(" It keeps perfect pace with your enhanced productivity, never even letting a base level of [pc.cum] pool in the bottom of the cup.");
	else if(cummies < 2000) output(" It somehow keeps pace with your enhanced productivity. For every coffee cup worth of seed that you fling, it answers with the perfect amount of suction.");
	else output(" Somehow it keeps pace with your inhuman production. You flood the cup over and over, and it responds by sucking with such force that the drain hose bulge and jerks. Illustria constricts her whole body around you to keep you shooting, putting every bit of her sex-modified frame to work emptying your " + (pc.balls > 0 ? "[pc.sack]":"load") + ".");
	output("\n\nYou sag back in the wake of your climax, stumbling " + (pc.tallness < 60 ? "off of the stool":"a step away") + " to unmask Illustria once more.");
	output("\n\nThe cybernetic doctor giggles drunkenly, her limbs going limp. She licks her own spit and tears from her face while craning her neck down to keep your cock in view, saying, <i>“Uhh wow. That was pretty... pretty powerful stuff, and I think we should do that again. For science.”</i> Grabbing one tit, she reaches between her thighs to begin fingerfucking herself to the memory. <i>“You can just drop by... and set that cock on my face whenever you want.”</i>");
	processTime(30);
	IncrementFlag("KQ_FUCKED_PO");
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",hyperBoiEpiloguesForPo);
}

public function hyperBoiEpiloguesForPo():void
{
	clearOutput();
	showPo(true);
	author("Fenoxo");
	output("Restraining her properly requires locating old style, analog handcuffs, but once she’s had a good cum and been properly bound, Illustria becomes much easier to handle.");
	clearMenu();
	addButton(0,"Next",postPoOptionsWinRouting);
}

//Leave
public function skipTownOnPosAssAfterWinning():void
{
	clearOutput();
	showPo();
	author("Fenoxo");
	//Lust
	if(enemy.lust() >= enemy.lustMax()) 
	{
		output("<i>“Wait!”</i> Illustria cries when you turn away. <i>“Fuck me!”</i> She arches her back upward to an almost inhuman display, presenting her tits with spine-shattering determination. <i>“Fuck me fuck me fuck meeeee!”</i>");
		output("\n\nUnmoved, you answer, <i>“Fuck yourself.”</i>");
		output("\n\nHer disappointed wails shift to self-indulgent moaning in no time.");
	}
	//HP
	else
	{
		output("Illustria’s eyes bore holes in your back when you turn away, perhaps wondering why you haven’t taken your revenge on her - or called the Peacekeepers to come collect her sorry ass.");
		output("\n\nYour reasons are your own, and she’ll have to live with the sting of this defeat for the rest of her days.");
	}
	clearMenu();
	addButton(0,"Next",postPoOptionsWinRouting);
}

public function postPoOptionsWinRouting():void
{
	clearOutput();
	showKiro();
	showName("\nVICTORY");
	author("Fenoxo");
	//Kiro Freedomed:
	//Non bimbo
	if(!kiro.isBimbo())
	{
		output("You smash Kiro out of her remaining restraints");
		if(flags["KQ_PO_DEAD"] == undefined)
		{
			if(flags["KQ_PO_DEAD"] == undefined && pc.RQ() < 33)
			{
				output(", and she wastes no time in grabbing your [pc.rangedWeapon] and using it to put an end to the defeated Doctor Po.");
				flags["KQ_PO_DEAD"] = 2;
				//kiro killed po :3
			}
			else
			{
				output(", and she wastes no time in going for your [pc.rangedWeapon]. You catch her wrist and stop her. If you wanted Po dead, you would have done it yourself.");
			}
		}
		else output(", and she wasts no time in saying,");
		output(" <i>“Let’s get out of here.”</i>");
		output("\n\nYou couldn’t have said it better.");
		//route out of there
		clearMenu();
		addButton(0,"Next",defeatedPoFinalOutro,true);
	}
	//Bimbo
	else
	{
		output("You walk up to the kneeling tanuki and say, <i>“Come on, let’s go.”</i>");
		output("\n\nKiro sits there, chewing her lip, occasionally looking down at the fallen doctor. <i>“65 doesn’t have permission. She serves her mistress.”</i>");
		output("\n\nYou point out " + (flags["KQ_PO_DEAD"] != undefined ? "that her mistress is dead, and you’re in line to inherit her.\n\nThat seems to do the trick.":"that her owner would rather give her to you than get killed.\n\nIllustria does you the favor of passing ownership. <i>“Sixty-five, ownership transfer. Authorization: Doctor Illustria Po, your mistress. New owner: [pc.fullName]. Acknowledge.”</i>"));
		output("\n\nKiro’s jaw goes slack. Her eyes empty of residual thought. Three seconds pass in silence, after which she wobbles, blinking in confusion. Bracing herself against the ground, she looks up at you with sudden, total love in her eyes. <i>“[pc.name]! You... oh wow. You own me.”</i> She strokes her cock in a way that somehow communicates abject wonder. <i>“I’m your property. Your doll number 65, your pet kui-tan pirate fucktoy.”</i> She shudders pinches both her nipples, firming up the dinner plate sized tit-toppers to rigid attention. <i>“You can name me, [pc.name]. You can call me anything, and I’ll love it. You could give me the most degrading, filthiest name in the galaxy, and I’d get hard to hear you say it...”</i>");
		output("\n\nYou open your mouth, about to tell her that her name is Kiro, but something stops you. This is an important choice, and Kiro is already broken. Maybe a new moniker would be in order?");
		output("\n\nWhat do you name Kiro?");
		//dialogue box :3
		processTime(3);
		clearMenu();
		addButton(0,"Name Her",nameKiroAfterWinning);
		displayInput();
		userInterface.textInput.text = "Kiro";
		output("\n\n\n");
	}
}

public function nameKiroAfterWinning():void
{
	clearOutput();
	author("Fenoxo");

	if (userInterface.textInput.text.length == 0)
	{
		youBoughtASlutGoodJob();
		output("<b>You must enter a name.</b>");
		return;
	}
	// Illegal characters check. Just in case...
	if (hasIllegalInput(userInterface.textInput.text))
	{
		youBoughtASlutGoodJob();
		output("<b>To prevent complications, please avoid using code in the name.</b>");
		return;
	}
	if (userInterface.textInput.text.length > 14)
	{
		youBoughtASlutGoodJob();
		output("<b>You must enter a name no more than fourteen characters long.</b>");
		return;
	}
	
	kiro.short = userInterface.textInput.text;
	this.removeInput();
	//This way we get correct name!
	showKiro();
	//Choose Kiro
	if(kiro.short == "Kiro")
	{
		output("<i>“Your name is Kiro,”</i> you state with absolute certainty. <i>“Just like it always was.”</i>");
		output("\n\nOnce more, the tanuki-girl’s eyes visibly empty of conscious thought, her rewired brain working triple-time to shape itself to her owner’s chosen reality. She whimpers in the back of her throat, her whole body tensing. Her tail slams down into the floor behind her with a muted ‘thump’, and she unleashes a deep, heartfelt sigh. <i>“You’re right, Angel. I </i>am<i> Kiro.”</i> A familiar, cocksure smile spreads across her blunted muzzle. <i>“And I’m so thrilled that you’re the one that gets to own me.”</i> She stands slowly, a web of glittering pussyjuice dangling between her furred thighs. <i>“I guess I’d have to be okay with </i>anyone<i> being my owner, but you’re, like... special.”</i> She steps closer, winding that big, poofy tail around your waist to hold you close. <i>“I’d love you even without Mistress Po’s work.”</i> Something that sounds like a happy purr escapes her lips. <i>“And now I get to love you even more than that!”</i>");
	}
	//Choose anything else
	else
	{
		output("<i>“Your name is [kiro.name],”</i> you say, a little hesitantly.");
		output("\n\n<i>“Oh.”</i> Kiro mouths as her eyes empty of conscious thought, her rewired brain working triple-time to shape itself for the reality you’ve chosen. She whimpers in the back of her throat, her whole body tensing. Her tail slams down into the floor behind her with a muted ‘thump’, then lifts and does it again, and again, and again. After a half-dozen such slams, partial awareness returns to her face, her expression still dopey. <i>“Hiiiiiiiii, [pc.name].”</i> The dollified tanuki smiles warmly, surging up onto her toes. A web of glittering pussyjuice hangs between her thighs, and the obscene girth of her flare wobbles eagerly in your direction. <i>“You’re such a naughty owner, [pc.name], getting rid of that old name and giving me a new one.”</i>");
		output("\n\nYou lean back a little surprised. <i>“Oh?”</i>");
		output("\n\n<i>“Yeaaaaah,”</i> the kui-tan purrs, prowling closer. <i>“You knew my real name, whatever that was, but you... you horny devil. You decided to take charge of me completely.”</i> [kiro.name]’s tail winds around your waist. <i>“Grab my titties if you want. I know you wannaaa! You <b>own</b> me, [pc.name]. I’m literally your personal toy. You can tell me to lay in your bed and wait for you, and I’ll love doing it. I’ll be there, hard if you want to cuddle.”</i> She strokes her cock. <i>“Soft if you want to rest.”</i> Her other hand lifts a breast and presses the soft expanse into your " + (pc.tallness+10 > kiro.tallness ? "side":"head") + ". <i>“And anything between. I’m yours.”</i>");
	}
	//merge
	processTime(5);
	defeatedPoFinalOutro();
}

//Defeated Po final outro:
public function defeatedPoFinalOutro(newScreen:Boolean = false):void
{
	if(newScreen)
	{
		clearOutput();
		showName("ONE\nLAST THING");
		author("Fenoxo");
	}
	else output("\n\n");
	output("None of this means anything if the turrets overlooking the hangar blow your ship to kingdom come. You scan the laboratory for a control console, delighted to discover that Illustria Po is still logged in. ");
	if(pc.IQ() < 35) output("You don’t really know what you’re doing, but it’s a pretty simple matter to turn off the turrets and change the user password to a string of " + (pc.isBimbo() ? "cock-loving ":"") + "gibberish. Oh, right - you have to sign out or the password change won’t matter. You tap the logout button.");
	else output("It’s a simple matter to disable the turrets, change the password to a gibberish string, switch languages to ‘Esperanto,’ and sign her out.");
	if(flags["KQ_PO_DEAD"] == undefined) output(" She’ll spend weeks trying to unlock her systems.");
	else output(" It wouldn’t do to have one of Po’s surviving pets turn the security back on.");
	//Actual victory here?
	addButton(0,"Next",move,rooms[currentLocation].northExit);
}

public function victoryEndWrap():void
{
	clearOutput();
	output("Victory!\n\n");
	CombatManager.genericVictory();
	queueReturnAllItems(false, true);
}

//following bonustexts
public function KQKiroFollowBonusTexts():void
{
	showBust(kiroBustDisplay(true));
	//Bimbokiro
	if(kiro.isBimbo())
	{
		output("\n\n" + RandomInCollection(["[kiro.name] bumps her expanded bust into the wall and bounces off with a giggle and a tweak of her nipple.","[kiro.name] follows demurely behind you, checking you out every time she thinks you’re not looking. Her cock stays hard the entire time.","[kiro.name] follows obediently.","[kiro.name] plays with her cock, not for pleasure but to show it off to you, presenting it new ways every time you look back her.","[kiro.name] rubs her boobs in wonder, clearly taken when their size and feel.","[kiro.name] hefts her tits in hand and pulls them apart, letting them clap together with an audible ‘smack’ and endless waves of roiling jiggles.","[kiro.name] bounces on the balls of her padded feet when you look back, jiggling her breasts for your amusement. It’s quite a sight.","[kiro.name] watches you with obvious infatuation.","[kiro.name] can be heard quietly muttering through a list of obscene euphemisms for breasts.","[kiro.name] hugs her tail and blushes when you glance her way.","[kiro.name] stops to hug a passing fuckdoll. The two herms grind against one another in obvious pleasure for longer than you would have expected before parting with shuddering smiles. Your tanuki returns to your side, and the fuckdoll moves on by as if you were nothing more than a piece of furniture.","[kiro.name] leans against the wall with her tail upraised, displaying her soaking wet twat and drenched ballfur."]));
	}
	//Nonbimbo - bought
	else if(flags["KQ_BUY_OFFER"] != undefined)
	{
		var collection:Array = ["Kiro glares at everything over her gag, but when she looks at you, her features soften somewhat.","Kiro slams her restraints repeatedly against the wall, to no avail.","Kiro follows silently after you, glaring at the floor.","Kiro stumbles into you by accident. When you apologize, she leans her weight into you, rubbing softly against your side. She steps back with a nod and a step toward the ships.","Kiro walks after you with her bound hands covering as much of her naked crotch as possible.","Kiro kicks at the wall in irritation. It does no damage to the wall, but the tanuki favors her other leg for a few steps.","Kiro nearly overtakes you in her hurry to get back to her vessel.","Kiro follows behind you cautiously.","Kiro scowls impotently at a security camera.","Kiro stumbles and nearly falls. She stares at her bindings in frustration.","When you pause, Kiro walks up next to you and lays her head on your shoulder in mute thanks.","Kiro bounces from foot to foot in anxiety."];
		//bigger boobs: 
		if(kiro.breastRows[0].breastRatingRaw > 11) collection.push("Kiro accidentally bumps her enlarged chest into you. When you turn back, she shrugs apologetically, at least as much as her restraints will allow.");
		output("\n\n" + RandomInCollection(collection));
	}
	//Rescued Kiro
	else
	{
		output("\n\n" + RandomInCollection(["Kiro follows after you, alert for any remaining danger.","Kiro smiles when you look back her.","Kiro gestures in the direction of the hangar.","Kiro follows with a stylish looking combat roll.","Kiro crouches, keeping low and out of the way.","Kiro silently points out a security camera, then gives it two big middle fingers.","Kiro bounces from side to side, alert for more danger.","Kiro places her hand on your shoulder reassuringly.","Kiro shakes her head. <i>“I can’t believe I almost got turned into one of those... things.”</i>","Kiro bumps into your back. <i>“Watch where you’re going, will ya?”</i> She grins. <i>“Unless you want me to keep bumping into you naked, perv.”</i> She winks."]));
	}
}

//Reach Ships
public function getBackToShipsWivKiroFollows():void
{
	//append to hangar text w/o newscreen?
	showKiro();
	author("Fenoxo");
	//Kiro Free, Not Bimbo
	if(!kiro.isBimbo() && flags["KQ_BUY_OFFER"] == undefined)
	{
		output("\n\nKiro races to the boarding ramp of her own vessel, but stops just short, turning back at the last minute. She sprints across the hangar at full tilt, slamming into you with bruising force. Your back impacts against your own ship with an audible ‘clang’. Fuzzy warmth envelops you, and you swear that Kiro’s breaths are halfway between pants and hitching sobs. Yet when she pulls away, the tanuki is appears somewhat more composed. Her ebon lips curl with a warm smile. Her tail wags. She kisses you on the nose and says, <i>“Thanks again, Angel.”</i>");
		//Bimbo
		if(pc.isBimbo()) output("\n\nYou give her ass a firm squeeze and answer with a giggle of your own, <i>“I’d like, fuck my way across the half the universe for ya, sugar.”</i>");
		//Bro
		else if(pc.isBro()) output("\n\nYou slap her ass and linger, squeezing her cushy heiny one-handed until you feel her dick firm up against your [pc.belly]. <i>“My pleasure.”</i>");
		//Nice
		else if(pc.isNice()) output("\n\nYou hug her back, a little less intensely, and answer, <i>“No problem, Kiro.”</i>");
		//Mischievous
		else if(pc.isMischievous()) output("\n\nYou look up, fail to find your halo, and answer, <i>“No problem, Kiro, but if I keep saving you, I might have to start a salvation punchcard.”</i>");
		//Hard
		else output("\n\nYou slap her ass and answer, <i>“I’m no more of an angel than you, you fluffy semen demon.”</i>");
		//merge
		output("\n\nThe kui-tan " + (pc.hasHair() ? "ruffles your hair":"strokes your cheek") + ". <i>“I’ll regroup with you at the next port of call.”</i> She chews a plump, sable lip, one fanged tooth hanging over the edge of it. <i>“I need a bit to think about all of this. Nothing like a little deep space travel to scratch that itch, eh?”</i>");
		addButton(0,"Leave",returnHomeFromKiroQuest);
	}
	//Kiro Restrained, Not Bimbo
	else if(!kiro.isBimbo())
	{
		output("\n\nA heavy clange resounds through the hangar as Kiro’s restraints disengage, allowing her to violently shake them from her body. She kicks the closest fallen piece, sending it cartwheeling through the air - and into the side of her ship. It ‘spangs’ off the side with an accompanying huff of annoyance from the tanuki. <i>“Fucking cunt-blasting shit-puddle!”</i>");
		output("\n\nApproaching from behind her, you place a calming hand upon her taut shoulder. <i>“Easy. It’s over now.”</i> Perhaps unsurprisingly, it does not have the desired effect.");
		output("\n\nThe recently freed kui-tan throws her hips back, grabs your wrist, and pivots to rotate your body weight over her shoulder and toward the floor.");
		if((pc.tallness >= 68 && pc.PQ() >= 75) || pc.tallness >= 90) 
		{
			output(" Of course, you’re a sturdier [pc.guyGirl] than that. Her most powerful yank barely budges you. No amount of Judo can change that.");
			output("\n\nKiro’s eyes widen in shock, alarm, and a bit of sadness. <i>“Oh shit, sorry Angel!”</i> She staggers back.");
		}
		else if(pc.RQ() >= 80) 
		{
			output(" You’re quick though, contorting about to land on your feet.");
			output("\n\nKiro’s eyes widen in shock, alarm, and a bit of sadness. <i>“Oh shit, sorry Angel!”</i> She staggers back.");
		}
		else 
		{
			output(" It bruises your ego more than your body.");
			output("\n\nKiro looks down at you in shock. <i>“Oh shit, sorry Angel!”</i> She offers her hand, pulling you up in a hurry.");
		}
		//merge, no new PG.
		output(" <i>“I just... fuck. I thought one of those </i>things<i> was grabbing me for a second. How could you make a deal with that cyber-bitch?”</i> She seems completely dumbfounded. <i>“I mean, you saved me. I get it. That couldn’t have been easy, but couldn’t you have... I don’t know, slammed a frag into her throat and picked up the pieces afterward?”</i>");
		output("\n\nYou point out that there’s a good chance you would’ve wound up fragged yourself, or worse: captured and converted alongside Kiro.");
		output("\n\n<i>“I... know that. I just wish we could’ve made her pay for what she did to me... to us... to all those people she’s already broken.”</i> A scowl wreathes her usually adorable features. <i>“People like her are the reason I became a pirate in the first place. Everybody else, all the police, all the corporations - they’re too busy walking on the little people, using them like cogs in their big machine or worse - transforming them into them, like Po.”</i> She kicks another piece of her discarded restraints. <i>“Walking out and lining her pockets stings worse than galotian STD.”</i> She makes another halfhearted kick, stepping closer to you in the aftermath. <i>“I can’t ignore that pain, but thank you all the same, [pc.name].”</i> Another step. <i>“If it you didn’t do what you did, I’d be one of them now - somebody’s doll.”</i> Her hip swishes with her next stride. <i>“Now? Now we get to go free. Thank you, Angel.”</i>");
		output("\n\nKiro kisses you, full on the lips. It’s long and soulful. Her tongue, for what must be the first time in a long time, doesn’t thrust crudely into your maw. It holds back. When you extend your own, she follows suit, then breaks away before things get too steamy.");
		output("\n\n<i>“Let’s get the fuck out of here before that bitch changes her mind.”</i>");
		output("\n\nYou couldn’t agree more.");
		output("\n\nThe kui-tan " + (pc.hasHair() ? "ruffles your hair":"strokes your cheek") + ". <i>“I’ll regroup with you at the next port of call.”</i> She chews a plump sable lip, one fanged tooth hanging over the edge of it. <i>“I need a bit to think about all of this, and nothing like a little deep space travel to scratch that itch, eh?”</i>");
		addButton(0,"Leave",returnHomeFromKiroQuest);
	}
	//Bimbo!
	else
	{
		output("\n\n[kiro.name] spares a sidelong look at her old vessel while following obediently to yours. <i>“I can’t believe you </i>own<i> me now, [pc.name].”</i> Her voice lilts giddily. <i>“We’re gonna have so much fun together! Like, once we get onboard, how about we fuck bareback on the table? Just to break it in. I can make you cum so much harder now, I swear!”</i> She bounces on her toes, letting the weight of her drooling phallus stroke itself against her supporting palm. <i>“Just think about it: every inch perfumed with our fuckscent, the air recyclers working double time to keep up with the muggy aroma of our non-stop sex.”</i>");
		output("\n\nAs <i>hot</i> as that may sound, your priority for the moment is getting off of this rock with your mind and body intact.");
		output("\n\nThe tanuki fuckdoll nods emphatically but does nothing to stop her stroking. <i>“Of course, Angel. I’m just making suggestions I thought you would like.”</i> Her other hand squeezes your forearm gently. <i>“I’d never think of telling you what to do - unless you wanted me to, of course.”</i> A dollop of crystalline goo wells out of her distended urethra at the idea, racing down the slick, veiny length of her horse-pole. <i>“Can I at least jerk myself off while we travel? It feels like my head’s bursting with positions and tricks, and I wanna figure out the best ones to use on you!”</i>");
		output("\n\nThat sounds... acceptable, but more pressing is the matter of ships. You could take Kiro’s instead of your own, if you wanted. She won’t need it anymore, and Doctor Po is in no position to stop you. Moving any stored possessions over should be trivial with the heavy equipment in the hangar, though any major ship upgrades and weapon systems will have to be left behind. Whose ship do you take?");
		output("\n\n(<b>[kiro.name] has joined your crew!</b>)");
		flags["KIRO_RECRUITED"] = 1;
		flags["KIRO_ONBOARD"] = 1;
		//[Store] [Yours] [Kiro's]
		if (shipStorageRoom() > 0) addButton(0, "Store Kiro’s", illustrialPoStoreKirosShip, undefined, "Store Kiro’s", "Doing this means sending Kiro’s leaf-shaped vessel to your hanger and keeping your own.");
		else addDisabledButton(0, "Store Kiro’s", "Store Kiro’s", "You have no room in your hanger.");
		addButton(1,"Yours",returnHomeFromKiroQuest,undefined,"Yours","Doing this means leaving Kiro’s leaf-shaped vessel behind, but it means you get to keep your own.");
		if (olympiaIsCrew() && shits["SHIP"] is Sidewinder) addDisabledButton(2, "Kiro’s", "Kiro’s", "Olympia won’t let you dare leave the Sidewinder behind.");
		else if (!canAbandonShip(shits["SHIP"])) addDisabledButton(2, "Kiro’s", "Kiro’s", "Unfortunately, you are unable to part with your current ship.");
		else addButton(2, "Kiro’s", takeKirosShip, undefined, "Kiro’s", "Doing this will leave your ship and its weapon/upgrade loadout behind. It will be lost to you, but you’ll claim the tanuki’s craft for your own.");
	}
}
public function illustrialPoStoreKirosShip():void
{
	clearOutput();
	output("Before boarding your ship, you set the auto-pilot on Kiro’s ship to fly to Tavros Station and let them know to expect it.");
	output("\n\nYou spend most of the trip back to Tavros Station sleeping. You had a hell of a day.");
	
	var tempShip:ShittyShip = new Blade();
	vahnAddAShip(tempShip);
	
	processTime(8*60);
	shipLocation = "TAVROS HANGAR";
	moveTo("SHIP INTERIOR");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
public function takeKirosShip():void
{
	clearOutput();
	showBust("BLADE");
	output("You spend some time using the hangar’s equipment to transfer possessions from your old vessel into the new, then plot a safe course back to Tavros Station.");
	processTime(8*60);
	shits["SHIP"] = new Blade();
	shipLocation = "TAVROS HANGAR";
	moveTo("SHIP INTERIOR");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
public function returnHomeFromKiroQuest():void
{
	clearOutput();
	output("You spend most of the trip back to Tavros Station sleeping. You had a hell of a day.");
	processTime(8*60);
	shipLocation = "TAVROS HANGAR";
	moveTo("SHIP INTERIOR");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function processKiroQuestEvents(deltaT:Number, doOut:Boolean):void
{
	//Quit out if quest not started or if TF segment over.
	if(flags["KQ_START"] == undefined || flags["KQ_RESCUED"] != undefined) return;

	//example eventqueue shit: if (eventQueue.indexOf(giveBirthThroughCuntTail) == -1) eventQueue.push(giveBirthThroughCuntTail);
	if(flags["KQ_START"] + 60*12 <= GetGameTimestamp() && flags["KQ_LAST_HOUR_TF"] == undefined)
	{
		if (eventQueue.indexOf(kq12HourTF) == -1) eventQueue.push(kq12HourTF);
	}
	if(flags["KQ_START"] + 60*18 <= GetGameTimestamp() && (flags["KQ_LAST_HOUR_TF"] == undefined || flags["KQ_LAST_HOUR_TF"] < 18))
	{
		if (eventQueue.indexOf(kq18HourTF) == -1) eventQueue.push(kq18HourTF);
	}
	if(flags["KQ_START"] + 60*24 <= GetGameTimestamp() && (flags["KQ_LAST_HOUR_TF"] == undefined || flags["KQ_LAST_HOUR_TF"] < 24))
	{
		if (eventQueue.indexOf(kq24HourTF) == -1) eventQueue.push(kq24HourTF);
	}
	if(flags["KQ_START"] + 60*30 <= GetGameTimestamp() && (flags["KQ_LAST_HOUR_TF"] == undefined || flags["KQ_LAST_HOUR_TF"] < 30))
	{
		if (eventQueue.indexOf(kq30HourTF) == -1) eventQueue.push(kq30HourTF);
	}
	if(flags["KQ_START"] + 60*36 <= GetGameTimestamp() && (flags["KQ_LAST_HOUR_TF"] == undefined || flags["KQ_LAST_HOUR_TF"] < 36))
	{
		if (eventQueue.indexOf(kq36HourTF) == -1) eventQueue.push(kq36HourTF);
	}
	if(flags["KQ_START"] + 60*42 <= GetGameTimestamp() && (flags["KQ_LAST_HOUR_TF"] == undefined || flags["KQ_LAST_HOUR_TF"] < 42))
	{
		if (eventQueue.indexOf(kq42HourTF) == -1) eventQueue.push(kq42HourTF);
	}
	if(flags["KQ_START"] + 60*48 <= GetGameTimestamp() && (flags["KQ_LAST_HOUR_TF"] == undefined || flags["KQ_LAST_HOUR_TF"] < 48))
	{
		if (eventQueue.indexOf(kq48HourTF) == -1) eventQueue.push(kq48HourTF);
	}
}
public function onPosShip():Boolean
{
	return (shipLocation == "KQ N32");
}
public function knowsPosName():Boolean
{
	return (flags["KQ_LAST_HOUR_TF"] != undefined && flags["KQ_LAST_HOUR_TF"] >= 18);
}

//Distress Call
public function kirosDistressCall(destination:String):void
{
	clearOutput();
	showKiro();
	author("Fenoxo");
	output("The message cuts directly to a poorly lit close-up of Kiro’s face. She looks like she’s hiding in a closet, her face uncomfortably close to whatever she broadcasted from. Splotches of oil and something... pink mat down ugly circles in her fur. <i>“[pc.name]!”</i> In the corner of the frame, her laser pistol shakes uncontrollably in her hand. <i>“I don’t even know if this’ll reach you, but Angel... I fucked up. I fucked up bad.”</i> Heavy footfalls sound from somewhere nearby. <i>“This freighter... it wasn’t abandoned. It was a trap. A trap for people like me.”</i> Kiro’s tail poofs out with fear as something electronic beeps. <i>“I’ve attached the coordinates. Please... help, Ang-”</i>");
	output("\n\nThe pneumatic hiss of a door swishing open seems to happen simultaneously with a metallic limb flying into frame, wrapping around Kiro’s mouth.");
	output("\n\nThe feed cuts to empty static.");
	output("\n\nYour computer received the coordinates before... whatever that was... interfered. Do you dare try to save her?");
	processTime(1);
	flags["KQ_START"] = GetGameTimestamp();
	shipLocation = "SPACE";
	clearMenu();
	addButton(0,"Next",mainGameMenu);

}

//12 Hours Later Notice:
public function kq12HourTF():void
{
	flags["KQ_LAST_HOUR_TF"] = 12;
	clearOutput();
	author("Fenoxo");
	//Didn’t go rescue Kiro
	if(!onPosShip())
	{
		showKiro();
		showName("\nHELP!");
		output("Another message from Kiro arrives in your inbox. You open it without delay.");
		output("\n\n<i>“Ah-ah-angel! Please!”</i>");
		output("\n\nThis time you don’t see her face, just a sterile, metallic lab. The viewpoint shifts and wobbles down to reveal a point-of-view shot of Kiro’s heaving breasts, bound in some kind of mechanic milker. Further below, her cock is similarly mated with machinery. Presently, it belches a thick line of cum. <i>“She... she’s modding me - experimenting on me... making me c-c-cum over and over!”</i> Sure enough, as her orgasm winds down, a deep, mechanical hum thrums to life, and Kiro’s monstrously flared cock shoots once more. <i>“Please! She says sex-dolls should c-c-cum easy! On command!”</i> Another thick pulse of ‘nuki-spunk sprays out of her. <i>“She’s making me into someone’s toy!”</i>");
		output("\n\n<i>“Oh dear,”</i> another voice announces. <i>“You’re quite the resourceful doll, hiding a transmitter in that little leaf. Let’s take care of that, shall we?”</i>");
		output("\n\nThe feed cuts off once more.");
	}
	//On ship
	else
	{
		showBust(poBustString(),kiroBustDisplay(true));
		showName("\nTROUBLE...");
		output("Your Codex chimes with another message blasted into its emergency channels, again from Kiro. You thumb it on without a second thought.");
		output("\n\nThe holographic face that materializes above does not belong to the charming kui-tan - or anyone else you’ve had the pleasure to meet. No, the pretty, sculpted features of a blue cyborg stare back at you unblinkingly. Her gaze is as piercing as it is relentless. <i>“Hello there, my little interloper.”</i>");
		//Bull
		if(pc.isBro()) output("\n\nYou answer with a menacing growl.");
		//Bimbo
		else if(pc.isBimbo()) output("\n\nYou blurt, <i>“Oh, hiya!”</i> before your brain catches up with your body’s near-constant friendliness.");
		//Nice
		else if(pc.isNice()) output("\n\nYou fire back, <i>“Hello yourself. Where’s my friend?”</i>");
		//Mischievous
		else if(pc.isMischievous()) output("\n\n<i>“I take it you’re the asshat that kidnapped my friend?”</i> You gesture back toward the cold vacuum of space. <i>“Better start looking for your escape pod, because I’m coming for you.”</i>");
		//Hard
		else output("\n\n<i>“Hello bitch,”</i> you grunt. <i>“I’m the [pc.guyGirl] that’s going to teach you some fucking humility.”</i>");
		//Merge
		output("\n\nThe mysterious cyborg patiently waits for you to finish, then carries on as if you had said nothing at all. <i>“You’re going to make an interesting addition to my catalog, I can tell. You have the marks of good breeding all over you, no doubt refined by a talented doctor’s hand before your birth, and so fierce!”</i> She licks her lips. <i>“You came scurrying out of the cosmic void to save your friend, but there’s nothing to save her from!”</i>");
		output("\n\nThe hologram shifts to reveal Kiro, strapped into an alabaster chair with golden handcuffs. Her nipples and cock are confined in similarly transparent tubes, pulsating rhythmically, but it’s the latter that’s spraying right now, hosing one of the tanuki-girl’s signature thick loads into the machine. As it tapers off, she slumps, but a deep, mechanical thrumming brings her right back to the precipice. Cock flaring, Kiro moans and sprays again, forcing you to listen to the sound of her churning pleasure swirling inside the milk-pump.");
		output("\n\n<i>“See? Less than a day with me, and she’s already on her... fifteenth orgasm. Would you believe that fluffy doll was so desensitized that she struggled to get off without a high-powered pump or a tight twat?”</i> The voice is full of pride. <i>“So of course I fixed that, genius that I am. A little dose of microsurgeons, and this little fuckdoll-to-be can come easily, often, and always will.”</i> The camera pans back around to the implacable face, smiling coldly. <i>“She’s going to experience more pleasure than either of us can dream of... but if you stick around... I’ll be happy to show you.”</i>");
		output("\n\nAn especially lurid discharge for Kiro clearly broadcasts through the microphone.");
		output("\n\n<i>“For now, I must return to my work. This lovely lady has so much <b>potential</b>, and it is my duty to bring it to the fore. Be a dear and submit to some of my other pets, would you? Combat is so bothersome.”</i>");
		output("\n\nAny reply is cut off by the call’s sudden end. The longer you wait, the more this madwoman is free to modify your friend’s body and mind. You’ve got to hurry!");
	}
	processTime(3);
	pc.changeLust(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//18 Hours: Always Ready To Fuck
public function kq18HourTF():void
{
	flags["KQ_LAST_HOUR_TF"] = 18;
	clearOutput();
	author("Fenoxo");
	output("Another message from “Kiro” arrives. You rush to open it, hoping she’s strong enough to endure the mad cyborg’s cruel attentions a little longer.");
	output("\n\n<i>“Ah, there you are,”</i> Kiro’s tormenter announces flatly. <i>“I assumed you’d like to be kept up to date on favorite slutdoll’s progress, though I must admit to deriving some pleasure from your reactions myself.”</i> Her smile is ice cold, almost an artificial mockery of the real thing. <i>“Let’s check in with her, shall we? Number 65, status report!”</i>");
	output("\n\nKiro’s voice blasts out of the tinny speakers, <i>“Go fuck yourself, bitch! I’m fucking Kiro Tamahime, not some fucking number, and I’ll never let a rancid, walking condom like you tell me I’m anything else!”</i>");
	output("\n\n<i>“Still mentally disobedient. Unfortunate, but an unmodified baseline is useful at this phase of the process. Let’s check in with dear 65, shall we?”</i>");
	output("\n\nThe camera spins to show Kiro, still strapped to a table, rock hard and stained with innumerable cumstains. You don’t know if you’ve even seen her balls that small - that empty. She growls for a moment before bleary-eyed exhaustion leaves her with little more than a slouch and a scowl.");
	output("\n\n<i>“Now, you might be asking yourself what the great Illustria Po has spent the hours since our last communique doing.”</i> The side of her face appears in frame as she taps at her chin thoughtfully. <i>“Mostly fucking, of course. I do so adore the feel of a thick cock and a slick cunt, but I found some time to improve your friend too. I always do.”</i> The frame centers back on Kiro. <i>“You see, a good sex-doll is always ready to screw - <b>always</b>. Even if she just emptied every drop in her poor, sore balls into a milker.”</i>");
	output("\n\nKiro mutters, <i>“I’d tell you to go fuck yourself, but I don’t think even you’d wanna fuck a mechanical freak that ugly.”</i>");
	output("\n\nThe camera effortlessly glides forward as if on a dolly, but you can hear the ‘click-clack’ of metal heels moving across the floor. Soon, you’re presented with an up-close view of the tanuki’s clearly spent-but-twitching horse-cock. <i>“I already helped the girl with her climaxing troubles of course, but allowing someone to freely orgasm involves more than eliminating mental desensitization. The refractory period had to go next, because if I’m making a toy as hung and productive as the lovely 65, I’m going to need that toy hard and ready to go at a moment’s notice.”</i>");
	output("\n\nA sleek hand appears in frame, firmly gripping Kiro about the medial ring while the cybernetic thumb draws spirals up and down the kui-tan’s urethra. She dribbles out pre almost as soon as she’s touched, and within the space of ten seconds, a steady stream is pouring out, racing down pulsating veins and the flawless forearm of her technological tormenter. Her balls wobble, swelling back to their normal size with alarming rapidity.");
	output("\n\nThe captive pirate whines, <i>“How does it still feel this goooooooood?”</i>");
	output("\n\nIn a flash, the viewpoint whips back to Illustria Po’s too-pleased face. <i>“I’ll update you in six hours or so, once the milk starts coming in, and as for you, naughty little 65... we’ll see if you can keep up that defiance after another some endurance testing with the milkers.”</i> A wet, slurping sound is the last thing you hear before the message cuts out.");
	kiro.refractoryRate++;
	kiro.createPerk("MinCumQ",2000);
	processTime(3);
	pc.changeLust(3);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//24 Hour Notice: Milk Starts, mention of growth enhancement
public function kq24HourTF():void
{
	flags["KQ_LAST_HOUR_TF"] = 24;
	clearOutput();
	//On the ship:
	if(onPosShip())
	{
		showPo();
		output("Another emergency call blasts through your Codex’s notification systems, and you rush to open the message.");
		output("\n\n<i>“Welcome back, [pc.name],”</i> the mad doctor says, looking as fresh and invigorated as if she had just woken from a twelve hour sleep. <i>“And you too, fuckdoll.”</i>");
		output("\n\nThe viewpoint rotates around to show Kiro - still strapped down, but just barely. She looks absolutely exhausted. The bags under her eyes are visible even through her trademark tanuki mask, and when she turns your way, her gaze is foggy, only really half there, like she’s been up for a week straight without an ounce of rest, and you can see why. The milker on her cock is still going, of course, but what truly catches your eyes are the cups on her nipples, rhythmically tugging alabaster droplets from raccoon-girl’s onyx nubs with ceaseless, mechanical precision.");
		output("\n\nKiro moans confusedly, not quite understanding what’s going on.");
		output("\n\nStroking a flawless finger across the tanuki’s sweaty brow, your cybernetic antagonist coos, <i>“Don’t worry that pretty little brain of yours. You just lie back and learn to love getting milked as much as a New Texan bimbo.”</i>");
		output("\n\nKiro grunts and shifts, rallying the tiniest token of resistance. <i>“You... uh... fuck...”</i> Her eyes roll back. <i>“The milking’s too gooood...”</i>");
		output("\n\n<i>“Did you know that I’ve researched the Treatment, [pc.name]? That mysterious New Texan elixir the UGC has been trying to repurpose for their military for decades, and I cracked it wide open midway through a vacation blowjob.”</i> She leans down and extends a pink, nubby tongue, curling more than a foot of artificial muscle around Kiro’s quaking tit before drawing it back to speak once more. <i>“It’s a crude elixir for ignorant brutes. I could make a better product in my sleep. Consider my fuckdoll-in-training for a second.”</i>");
		output("\n\nKiro’s mouth flops open, her recently licked breast disgorging noticeably more milk. She whimpers, ejaculating a healthy-sized squirt of kui-tan cream, and moans, <i>“...Ahm... acting like suuuch a slut.”</i>");
		output("\n\n<i>“The milk you’re seeing is the result of a much more complicated, more refined system than hormonally-simulated pregnancy responses. I call this product ‘Ever-Milk’ because, as you might imagine, it never ends. She’ll never stop making it, never grow sore from overproduction. It’ll just be there, brewing up in those cute little tits of hers, ready to spurt out in pleasure or feed her owner’s thirsty tongue. 65’s nipples will never be a liability to her, just sources of more milk-dribbling pleasure than she’s ever experienced before, isn’t that right, 65?”</i>");
		output("\n\n<i>“Hrmmm?”</i> Kiro unthinkingly answers, blinking her bleary eyes and arching her back.");
		output("\n\nIllustria Po coos, <i>“Good girl, answering to your name. You’re going to be my greatest creation yet.”</i>");
		output("\n\n<i>“Whatever,”</i> the tanuki mumbles back, finding a reserve of hidden sass.");
		output("\n\nThe doctor raises her hand, and the tip of her finger pivots open, as if on a hidden hinge. She presses it against Kiro’s neck, and your lawbreaking friend’s eyes drift closed into a deep, drugged slumber. <i>“I think it’s time for toy number 65 to take a nap, since her primitive brain still needs sleep. I’ll be busy prepping the next stage of treatment. After all, if idle hands did the Devil’s work, I’d be unemployed.”</i>");
		output("\n\nThe message cuts off. If you’re going to save Kiro, you need to hurry.");
	}
	//Not there:
	else
	{
		showPo();
		output("You receive another call from “Kiro” and open it without a second thought.");
		output("\n\n<i>“Hello there, [pc.name]. After that last broadcast, I thought it might be fun to give you some updates of my own. I have something I’d like to show you.”</i> The cyborg’s cruelly beautiful face vanishes, replaced with a side-on view of Kiro, only loosely strapped down. Heavy bags under her eyes make it look like she’s been awake for the past 24 hours, and likely has, but your gaze is almost immediately drawn to the clear cups on her nipples, now filling with creamy white in the brief moments before the machinery can slurp it down. Kiro’s tongue lolls out, and her similarly bound prick bounces half-heartedly, flinging out ropes of exhausted pleasure.");
		output("\n\n<i>“Mmmmm...”</i> the pirate moans, seemingly unaware of the fact that she’s being recorded by her tormentor for your sake. <i>“Fucking cow-bimbos... knew... what’s up...”</i>");
		output("\n\n<i>“Oh yes. Yes they do,”</i> the prissy cyborg’s voice coos in something approximating fondness. <i>“I’ve researched The Treatment, you see. The UGC’s best and brightest can’t even understand whole swathes of it, but to the glorious Illustria Po, it’s basic arithmetic.”</i> Reaching down, she cups Kiro’s balls and gives them a tender squeeze. Thicker squirts fill every single tube. <i>“And this... quantum physics by comparison. I call it ‘Ever-Milk’ because, well, she’ll never stop making it, but that’s okay because it’ll never make her sore either. It’ll just be there, brewing in those pert little tits of hers, ready to squeeze out on a thirsty tongue a moment’s notice. After all, who wants to keep up with the maintenance of regular milkings? My toys are fuck and forget.”</i>");
		output("\n\nYou snap back at her, but a fingertip appears onscreen, slowly wagging back and forth.");
		output("\n\n<i>“I don’t care for your audio. The expression on your face was sufficient. Now, if you’ll excuse me, I think it’s time for toy number 65 to take a nap, since her primitive brain still needs sleep. I’ll be busy prepping the next stage of treatment. After all, if idle hands did the Devil’s work, I’d be unemployed.”</i>");
		output("\n\nThe message cuts off. If you’re going to save Kiro, you need to hurry.");
	}
	kiro.createPerk("Ever-Milk",5000);
	processTime(3);
	pc.changeLust(3);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//30 Hours: Medium boobers and mention of rodenian hedonary glands/subliminals
public function kq30HourTF():void
{
	flags["KQ_LAST_HOUR_TF"] = 30;
	clearOutput();
	showPo();
	output("Another " + (onPosShip() ? "call":"message") + " arrives" + (!onPosShip() ? ", pre-recorded":"") + " from a <i>“Doctor Illustria Po.”</i> You open it, already having a vague idea what the contents are going to look like. Poor Kiro...");
	output("\n\n<i>“Would you like some pornography, [pc.misterMiss] Steele?”</i> The doctor’s poreless visage radiates pleasure. <i>“Of course you do. Everyone likes porn. Me? I adore it. Nothing like a nice pair of ripe tits to get the endorphins flowing and flush the genitals. Is there truly anything better to behold than another’s body, brazenly displayed for your pleasure, engorged with wanton desire?”</i> Her head shakes. <i>“Of course there isn’t. Porn is <b>art!</b> ...and I am an artist. Behold!”</i>");
	output("\n\nThe viewpoint glides once more to focus on Kiro.");
	output("\n\nThe hung tanuki is still sleeping, you note, but that’s not to say that she’s inactive. Quite the opposite. Her hips roll in slow, sensuous circles. Her cock throbs, and the thick-sounding gurgles of her seed being whisked down the connected pipe continue exactly as before.");
	output("\n\nBut that isn’t what the doctor wants you to look at. She wants your gaze higher, at Kiro’s tits. There’s no better word for them now. They’ve swollen from luscious breasts into obscene, cow-caliber udders. Milk courses out of them in regular, pulsing streams, much thicker than you saw in the previous video. In her sleep, Kiro occasionally arches her back and whimpers in unconscious pleasure, the motion making her cream-filled milktanks wobble about in the most delightfully hypnotic way. When they clap together, they simultaneously spurt torrents of perfect, alabaster white. You could sit here and watch them jiggle for hours... if you weren’t watching your " + (flags["KIRO_BF_TALK"] == 1 ? "girl":"") + "friend’s slow descent into lust-drunk fuckdoll.");
	output("\n\n<i>“Magnificent, aren’t they?”</i> Illustria appears back in frame, full of pride. <i>“But while these are certainly </i>slutty tits<i>, a fuckdoll amongst fuckdolls deserves better. Bigger. Real, plush, that proudly declare to the universe, ‘Hi, my only use is milking and fucking!’”</i> Her lip curls in a cruel sneer. <i>“But the supportive tissues and ligaments will need some time before they’re ready to support my boobalicious little toy.”</i>");
	output("\n\nThat’s good, at least. Kiro has some time...");
	output("\n\n<i>“Which means I should probably start in on her mind proper.”</i> The mad doctor glances to side, and a sleep, needle-bearing robot floats by. <i>“I could manually make the adjustments I want - establish custom synaptic linkages with a swarm of robotic helpers... or hit her with a crude but potent drug like dumbfuck that’ll hardwire her into a slut among sluts, seeking unending hedonistic delights, but why do something so crude when I can hack her very mind into rewiring itself?”</i> Letting go of the camera, Doctor Po strides away, allowing you enough of a glimpse at her body to spot translucent panels and glowing, sloshing fluids inside. She reclines against a console and taps her chin. <i>“I’ll take my time on this one.");
	if(!onPosShip()) output(" After all, there’s no hurry, right? If you actually cared about this girl, you’d have bashed down my door by now.");
	else output(" After all, if you were capable of stopping me, you would have already. If you truly cared about this girl, you’d submit so I can transform you both, together. Maybe, if you suck my cunt hard enough, I could be convinced to make you a packaged set.");
	output("”</i>");
	output("\n\nThe Codex shakes in your hand, fuzzing the image for a second.");
	output("\n\n<i>“Are you familiar with Rodenians, [pc.name]? I suppose it doesn’t greatly matter. Suffice to say, they’re one of the only species in the entire galaxy designed to mindfuck themselves into submission. You see, when they have sex, their brains release a lovely little chemical that greatly reduces forebrain activity while also stimulating the linkages of new synapses and thought patterns. In effect, they become hyper suggestible, able to be rewritten into a blank slate, or a slut, or a hard-working engineer with the right suggestions.”</i>");
	output("\n\nWhere is she going with all this?");
	output("\n\n<i>“Of course, in a brain not designed for such experiences, such a rapid shift in mindset could result in myriad disorders: personality splits, total mindbreak, even a complete descent into self-indulgent sociopathy.”</i> She pauses. <i>“Like all things in life, it’s important to take one’s time when doing important work, and this is very important work, [pc.name]. So, rather than break 65’s cute little mind, I’m going to microdose her with a slow dose of Rodenian hedonary secretion and use this lovely little headset full of subliminals to help her come to grips with her new lot in life.”</i> Illustria winks. <i>“After all, a good fuckdoll should love waiting for her owner’s attentions almost as much as receiving them.");
	if(onPosShip()) output(" You’ll find that out for yourself soon enough.");
	output("”</i>");
	output("\n\nShe’s literally going to rewrite Kiro’s mind! How much time do you have?");
	if(onPosShip()) output(" Curse this crazy place!");
	output("\n\n<i>“I wonder... are you masturbating to this? ");
	if(onPosShip()) output("Are my toys getting to you? Perhaps you can’t stop yourself. Perhaps being broken down into a drooly fucktoy makes you hotter than a supernova’s core. If that’s the case, you’ve already lost, [pc.name]. Just walk up to one of my pets, kneel, and submit.");
	else output("Perhaps I should put a little more effort into producing these treats if you’re going to be getting off to them. That’s a fair trade, right? Your friend becomes my toy, and in exchange you get top-tier porn?");
	output("”</i>");
	output("\n\nThe feed cuts out.");
	kiro.breastRows[0].breastRatingRaw += 17;
	processTime(4);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//36 Hours: Improved vaginal lining and penile tissue. Show mental progress
public function kq36HourTF():void
{
	flags["KQ_LAST_HOUR_TF"] = 36;
	clearOutput();
	showPo();
	author("Fenoxo");
	output("Your Codex accepts a call from Illustria Po without giving you so much as a prompt.");
	//On ship:
	if(onPosShip())
	{
		output("<i>“Hello, Steele-deary. I was worried that after my last communique that you might not want to see how things were going with your masked friend, so I took the liberty of compromising UGC-standard communication protocols so I could guarantee we get to have a lovely little chat.”</i> Grinning, the cyborg sweeps her eyes across you. <i>“");
		if(pc.hasStatusEffect("Cum Soaked")) output("You look like you’re having fun yourself, with all that tasty cum painted on you. If that was all you wanted, all you had to do was submit, [pc.name]. I could drench you in it, bathe you in, and help you love it even more.");
		else if(pc.hasStatusEffect("Pussy Drenched")) output("Ohh, I see someone’s been a naughty [pc.boyGirl]. Look at all that pussyjuice! You’re drenched in it! It must be so distracting, trying to get past all my lovely creations, having that rich, feminine aroma teasing your nostrils with every breath. Does it remind you of Kiro? Does it smell like the underside of her balls? Because I assure you, she’s never been wetter than she is right now.");
		else if(pc.hasStatusEffect("Milk Bathed")) output("Aww, and you’re all covered in milk! If you can be patient, I promise your friend will be more than capable of bathing you in it. Wouldn’t that be nice? You could jerk her off while she milks herself into the tub, thrilled at the prospect of <b>obedience</b>. Or would you rather be like her, milky and slowly growing more programmed by the hour?");
		else output("You look like you’re doing well for yourself. Look at you - not a drop of sexjuice on you, but what’s the cost? Are you being </i>too careful<i>? Is your desire to avoid your own impending transformation ensuring that ‘Kiro’ will finish hers? Tsk tsk!");
		output("”</i>");
		output("\n\nYou shake your head, unwilling to give her the gratification of an emotional response.");
	}
	//Not on ship
	else
	{
		output("<i>“Hello, [pc.name]-deary. I was worried that after my last communique that you might not want to see how things were going with your masked friend, so I took the liberty of compromising UGC-standard communication protocols so I could guarantee this message would open itself up, right on cue.”</i>");
		output("\n\nYou sigh, in annoyance. You’re in no position to rescue Kiro, and yet this bitch is determined to keep taunting you about it.");
	}
	//merge
	output("\n\n");
	showImage("KiroReprogramming1");
	output("Illustria rotates the view to focus on Kiro once more. The floating robot you saw last time rests against her head, its tendril split to embed its drugged payload into her tits. She doesn’t seem to mind, if anything, she looks like she’s just spotted the hottest girl in the bar, and she’s about to take her home for a hard-and-fast bang. She’s even up on her paws off the chair, straining the restraints. Her desire-hooded eyes peer through the strobing hypnotics on her visor to fixate on the camera lens beyond, and she whimpers, <i>“A-angel? I think... I think I need to fuck somebody. Anybody.”</i> She licks her lips, gyrating her hips into a new piece of equipment.");
	output("\n\nThe large penile milker has been swapped out for a ring studded with vibrators. The top of the ring connects to a translucent latex hose, connected to a tap in the wall. Thick gouts of pre bulge the connective spunk-pipe from time to time, proof of the tanuki’s lusty, ready-to-go state. Kiro’s breasts look almost a little bigger than the last time you remember them, still obligingly pumping out cream.");
	output("\n\nThe cyborg stalks forward, bringing the camera with her, and you’re treated to a PoV shot of her fingers dipping under Kiro’s quaking ballsack to rub her pussy. Working her digits in slow circles, Illustria winks to you and asks, <i>“Would you fuck me, 65?”</i>");
	output("\n\n<i>“Y-uh... uh... no!”</i> Kiro catches herself in the nick of time.");
	output("\n\nThe doctor smirks, still rubbing Kiro’s needy quim. You can hear its sloppy squishing from here. <i>“But you’d cum, wouldn’t you?”</i>");
	output("\n\nChewing her lip, Kiro nods, pupils dilating.");
	output("\n\n<i>“You’d cum soooo hard though, wouldn’t you?”</i>");
	output("\n\nKiro groans, <i>“Yesssssss,”</i> and floods the flare-hugging tube with a cup worth of pre-cum.");
	output("\n\n<i>“Mmmhmmm, I understand.”</i> Doctor Po changes position to fondle Kiro’s balls, smearing them with fur-matting pussyjuice. <i>“You wouldn’t fuck me because you’re restrained, but you wouldn’t mind if I fucked you, would you? You’d cum so hard from getting fucked...”</i>");
	output("\n\n<i>“Yes! Fuckme!”</i> Kiro cries, shaking her hips, her mammoth beast-prick flopping about so violently that it nearly flings the vibro-ring across the room. If it weren’t for Illustria’s quick reactions, the tanuki-girl might have made a mess of the lab.");
	output("\n\nWithdrawing her fingers, the cyborg lets the captured fuckdoll-to-be squirm. <i>“Next time someone wants you to fuck them, you should ‘yes.’ You should say ‘yes’ and beg for the privilege.”</i> She leans closer to one of Kiro’s rounded ears. <i>“The less disobedient you are, the more I’ll let you cum, and I’ve made cumming feel soooo nice for you, haven’t I, pet?”</i>");
	output("\n\n<i>“Yes, miss!”</i>");
	output("\n\n<i>“Yes what?”</i> Illustra strokes the kui-tan’s chin.");
	output("\n\n<i>“Yes, miss...tress?”</i> Kiro guesses.");
	output("\n\nThe camera pulls back, but Doctor Po announces. <i>“Very good, 65. You may orgasm as much as you like for the next three hours.”</i> The buzzing hum of the vibroring kicks up three or four notches, and Kiro cries out in absolute, sublime bliss. Over the sound of her captive’s caterwauling, Illustria states, <i>“It might not be visible, but I’ve made subtle adjustments to her penile and vaginal tissues for greater durability. Near-constant erections won’t leave her sore at all, and if her owner wants to leave her riding a dildo when not in use, she’ll happily bounce on it for as long as she’s allowed. And the subliminals are progressing more or less as planned. 65’s mental resilience is far above what I expected from a pirate with a slut-body like hers, but that just means I get to enjoy her struggles for a little bit longer.”</i> Kiro screams in ecstasy. <i>“Maybe not too much longer. Ta ta!”</i>");
	output("\n\nThe message ends.");
	kiro.vaginas[0].bonusCapacity += 100;
	kiro.ass.bonusCapacity += 100;
	processTime(3);
	pc.changeLust(3);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//42 Hours: Kiro becomes an active participant in her own corruption, freely rutting the machinery. Bigger lips?
public function kq42HourTF():void
{
	flags["KQ_LAST_HOUR_TF"] = 42;
	clearOutput();
	showPo();
	author("Fenoxo");
	output("Another message from the mad cyborg arrives, this one pre-recorded.");
	output("\n\n<i>“I have something I thought you’d like to see, " + (onPosShip() ? "number 66":"[pc.name]") + ". No, it isn’t 65’s tits, though I’ll be finishing those soon enough. No, I wanted to show you how your dear friend is doing mentally. Don’t worry, she hasn’t embraced her dollhood yet, or were you hoping she had? After all, you’ve left her in my clutches for soooo long.”</i> She shakes her head. <i>“It does not matter one iota either way. Here, allow me to show you.”</i>");
	output("\n\nThe camera is held up to another piece of machinery. Illustria taps at the holographically presented interface until it dissolves, replaced with a glowing representation of Kiro. The tanuki is no longer restrained, but she remains seated in the chair, the little robot lounging on her shoulder, still plugged into her neck. Another figure, an almost pure white, artificial-looking parody of feminine form bounces in her lap, slapping a leaky, foot-long dick into the tanuki’s belly with each downstroke.");
	output("\n\n<i>“I will use you,”</i> the girlbot’s artificial sounding voice intones.");
	output("\n\n<i>“Use me!”</i> Kiro echoes.");
	output("\n\nThe gleaming toy responds by grabbing Kiro’s breast and squeezing it with something approximating loving affection, causing the tanuki to splatter fresh breastmilk everywhere and shake from head to toe. <i>“You fuck when told,”</i> the voice announces.");
	output("\n\nKiro blubbers through lips that look a bit bigger than you recall, <i>“Yuh-huh!”</i>");
	output("\n\n<i>“What is your designation?”</i>");
	output("\n\nThe kui-tan’s head lolls as her own milk rains down on her face. With her eyes rolled halfway back, she mumbles, <i>“Six... sixty... fiiiiive.”</i>");
	output("\n\n<i>“Good toy.”</i> The machine-like hermaphrodite increases the tempo of the fuck, riding Kiro cowgirl faster than a human could ever hope to. Kiro’s flare appears in relief, its shape proudly displayed in the glossy latex skin that stretches around it. <i>“When 65 is a good toy, 65 feels good. Repeat.”</i>");
	output("\n\n<i>“When... 65... is... Stars, you’re a kinky slut!”</i> Kiro wears a sloppy grin until the fuck slows. <i>“Right, right... when 65 is a good toy, 65 feels good!”</i>");
	output("\n\nThe fuck resumes, and Illustria flicks the feed off once more, her face floating back into frame. <i>“She’s almost ready, [pc.name]. Look at how <b>obedient</b> she’s getting, how willing to serve. She even thinks it’s me that she’s fucking right now. I told her I wanted to ride her in a different body before I walked out, and she doesn’t care. The next time you see her, 65 will be ready. A little work on her lips and tits, maybe an increase in the hedonary feed, and she’ll happily lick my feet while she waits to be used." + (onPosShip() ? " ...and once I finish with her, you’ll be able to receive my undivided attention...":"") + "”</i>");
	output("\n\nThe message ends.");
	kiro.lipMod++;
	kiro.breastRows[0].breastRatingRaw += 16;
	processTime(3);
	pc.changeLust(3);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//48 Hour Notice: Huge boobs kiro basically becomes a slutbimbo. No more notices! Obscene bimbolips?
public function kq48HourTF():void
{
	flags["KQ_LAST_HOUR_TF"] = 48;
	clearOutput();
	showKiro(true);
	author("Fenoxo");
	output("You get a message from Kiro, and for once, you believe it’s actually from her. You cautiously open it, trembling with anxiety over the state of your friend.");
	output("\n\n<i>“[pc.name]!”</i> Kiro chirps through thick, dick-sucking lips. <i>“Look at the new lips Mistress Po gave me!”</i> She makes a kissy face at the camera, trying out different pouts before stuffing a fuzzy finger in between those two pillows to display just how lush and soft they are. Her eyes drift closed, and she spends a few seconds sucking before remembering to pull the wet finger free. <i>“They feel soooo good! Well, all of me does really, because I’m a total fuckdoll now, [pc.name]!”</i>");
	output("\n\nIllustria whispers, <i>“Good girl,”</i> from somewhere in the background, and Kiro squeals with happiness.");
	output("\n\n<i>“I don’t know why I was trying to be anything else. Look at me!”</i> The camera pulls back, revealing a fully nude Kiro with pendulous boobs so enormous that nearly hang to her belly button. When she moves, they take a while to catch up with the rest of her, slapping and wobbling absurdly, but through it all the onyx-tipped peaks of her nipples remain rigid and crinkled, glossy with residual milk. <i>“I’m made for fucking, [pc.name]. I always was, if you think about it, but Mistress Po helped the rest of me catch up with my crotch.”</i> She giggles. <i>“And I had a lot of time to think, while I was cumming and cumming and cumming, about how fucking hot it would be to be <b>owned</b>, ya know? About how good it feels when I do what I’m told.”</i> Her tail swishes behind her. <i>“It’s almost as good as cumming really. Like this message - the moment I did as I was told and started recording it, it felt sooo good. Better than busting the fattest nut in the drippiest slut.”</i>");
	output("\n\nIllustria’s voice rises, <i>“What if you were ordered to do that?”</i>");
	output("\n\nKiro’s eyes lose focus, and a gutteral sound of pleasure burbles out of her alien throat. <i>“I’d-uhhh... I’d probably never stop cumming until she wanted me to, I think. Right? She’d get to decide how much nut is enough, and I could just... lose myself in that tight, wet cunt.”</i>");
	output("\n\n<i>“Very good 65. And what if I wanted to give you another name?”</i>");
	output("\n\nTilting her head, the slave-tanuki shrugs. <i>“Sure, I guess. I mean, I guess I’m a slave, so you can call me whatever you want.”</i> She pauses. <i>“Actually, getting a new name sounds kind of hot. It’s like, the ultimate form of obedience, isn’t it?”</i> Kiro reaches down to rub the side of one pendulous breast, moaning, <i>“It’d be so fucking hot, being whatever somebody wanted me to be. Like, being owned for real-real. Fuck, Misstress Po, are you going to name me? You can keep me in a dark box all day - I don’t care - just name me and own me!”</i>");
	output("\n\n<i>“Calm now, 65. I haven’t decided if I’m going to keep you or sell you yet, and I bet getting sold is almost as good as getting a new name, isn’t it?”</i>");
	output("\n\nKiro makes something approximating a feline ‘churr’ of happiness and nods like a bobblehead. <i>“You fucking bet! I’m fucking soaking at the thought, but you were right - not masturbating feels just as good! And all because you told me not to! " + (kiro.vaginalVirgin ? "Fuck! I can’t wait for my new owner to take my virginity!":"Thanks for growing me a new hymen so I can give it to whoever winds up keeping me!") + "”</i>");
	output("\n\nIllustria says, <i>“I knew you’d be my best pet yet, 65, but be a dear and quiet down so I can talk to [pc.name] for a moment.”</i> Her voice is syrupy with mirth. Kiro’s mouth snaps shut, she contents herself by sliding a finger in and out of her cock-sucking lips while her creator talks. <i>“I must say, this whole affair puts me in a generous mood. I’ll tell you what: since you and 65 were so close, I’ll let you buy her if you like. All you have to do is make it through my ship to me without becoming a fuckdoll yourself, and I’ll give you a discount. How does that sound, [pc.name]? You can own my greatest creation of all time, and she’ll love you for it. After all, I’m not a total monster.”</i>");
	output("\n\nA moment passes by with nothing but the sound of Kiro lovingly suckling at her finger.");
	output("\n\n<i>“65, do you want [pc.name] to be your new owner?”</i>");
	output("\n\nKiro’s nose wrinkles, and she removes her finger with excessive slowness. <i>“Do I... want [pc.name] to own me?”</i> She chews her lip. <i>“I want everyone to own me, Mistress.”</i>");
	output("\n\nThat makes Illustria Po laugh. <i>“I see you’re still full of rodenian chemicals. No, what I meant was, obedience aside, would you enjoy being owned by [pc.name]?”</i>");
	output("\n\nKiro says, <i>“Oooooooooh,”</i> then taps her chin. <i>“Yeah, probably. [pc.HeShe] saved my life, and [pc.heShe] helped me out so much that I’d trust [pc.himHer] to treat me right even if I wasn’t a fuckdoll, and now that I am, I can be pretty confident [pc.name] would take great care of me so I could serve [pc.himHer] for a long, long time.");
	if(flags["KIRO_BF_TALK"] == 1) output(" [pc.HeShe] would have to break up with me, though, because I’m just a fucktoy.”</i>\n\n<i>“And if [pc.heShe] told you to be [pc.hisHer] perfect wife?”</i>\n\n<i>“Then I’d be [pc.hisHer] fucktoy wife forever,”</i> Kiro smartly answers. <i>“That’s a silly question.");
	output("”</i>");
	output("\n\nIllustria says, <i>“Good girl. You heard the toy, [pc.name]. Come buy her if you want her. I think I’ll be keeping her around for a while.”</i>");
	output("\n\nThe message ends.");
	processTime(4);
	kiro.lipMod++;
	kiro.createPerk("Ditz Speech");
	kiro.vaginas[0].bonusCapacity += 150;
	kiro.ass.bonusCapacity += 150;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
