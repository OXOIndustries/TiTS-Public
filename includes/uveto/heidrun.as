//Heidrun, the Korgonne Clothing Merchant
public function showHeidrun(nude:Boolean = false):void
{
	var nudeS:String = "";
	if(nude) nudeS = "_NUDE";
	showName("\nHEIDRUN");
	showBust("HEIDRUN" + nudeS);
	author("Doots");
}

//The Warm Crusts
public function warmCrustsBonus():Boolean
{
	if(flags["MET_HEIDRUN"] == undefined)
	{
		greetingsHeidrun();
		return true;
	}
	output("“The Warm Crusts” is the local clothing store for all of your winter wear needs. It’s located inside of a relatively small cave, its walls jagged and carelessly carved. Several clothing racks occupy the small room, making it feel even smaller. Opposite from the doorway, you see a counter and Heidrun standing behind it, tapping her clawed fingers on the stone surface and looking at you from time to time while you browse the wares. The shopkeeper tries her best to look just as bored as she was before, but the way her tail occasionally twitches betrays how glad she is to have a " + pc.mf("handsome","cute") + " customer around. She’s flirting with you quite forcefully, as usual, making sure that the best goods are on display.");
	addButton(0,"Heidrun",approachHeidrun);
	return false;
}

//Greetings
public function greetingsHeidrun():void
{
	clearOutput();
	showHeidrun();
	//(activated immediately when entering the warm crust for the first time)

	output("The moment you step inside the cave, an unmistakably female korgonne bounces out from behind the counter. Walking up to you, she presses herself intimately close before she starts to speak.");
	output("\n\n");
	if(!korgiTranslate()) output("<i>“Alien, welcome Warm Crust! Alien needing help? We selling many furs and leathers to keeping warm outside burrow.”</i>");
	else output("<i>“Welcome to the Warm Crust, outsider. Do you need help with anything? We have a lot of different clothing available, in case you need to go outside. Everything from undergarments to jackets, soft but sturdy - like us!”</i>");
	output(" As the dog lady speaks, she pushes her massive breasts together, creating a tantalizing cleavage for you to ogle.");

	if(pc.isNice()) output("\n\n<i>“Thank you, but no. I’m just looking around for now.”</i>");
	else if(pc.isMischievous()) output("\n\n<i>“Nah, just browsing </i>the goods<i>.”</i>");
	else output("\n\n<i>“If I need your help, I’ll ask.”</i>");

	if(!korgiTranslate()) output("\n\n<i>“Of course,”</i> she says, darting back behind the counter and beckoning you to come closer, clearly excited to have you here. All the while, her tail is wagging up a storm behind that squishy big butt of hers. <i>“If alien wanting to buy many things - just say. Call-word Heidrun. Happy to meet alien.”</i>");
	else if(pc.isMischievous()) output("\n\n<i>“Of course,”</i> she says, darting back behind the counter and beckoning you to come closer, clearly excited to have you here. All the while, her tail is wagging up a storm behind that squishy big butt of hers. <i>“If you need help with anything or you want to buy something - just ask. I’m Heidrun. Happy to meet you, stranger.”</i>");
	output(" She leans even lower, squishing her luscious bust against the counter and enhancing her cleavage even more.");

	if(!pc.isBimbo() && !pc.isBro()) output("\n\nTempting as she may be, for now you are more interested in getting a feel of this place than in flirting with the shopkeeper.");
	else 
	{
		output("\n\nYou spend some time flirting right back at the stout and sexy doggo, ");
		if(pc.isBro()) output("leaning closer and subtly flexing your muscles while you expose her to a heady mix of confidence and pheromones you practically exude.");
		else output("flashing her your sweetest smile as you take her up on a game of asset showing. It’s your favorite kind of game, because everybody wins!");
		output(" Meanwhile, the boring part at the back of your brain takes a stock of the place, easily operating in the background while the rest of you is busy with what’s really important.");
	}
	output(" You conclude that if you’re ever in need of some clothing to protect you from the cold or the beasts of the wilderness, Heidrun is the korgonne to ask.");
	processTime(5);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
	flags["MET_HEIDRUN"] = 1;
}

//Repeat Visits
public function approachHeidrun():void
{
	clearOutput();
	showHeidrun();
	output("You’re greeted by a wagging tail and a warm smile from Heidrun as you [pc.walk] into the cozy cave of the aptly named Warm Crusts. ");
	if(!korgiTranslate()) output("<i>“Alien welcomed back. Alien here for buy something, yes?”</i>");
	else output("<i>“Welcome back, outsider. Are you here to buy something?”</i>");
	output(" She gestures at the multiple clothing racks lining up the wall of the store, while keeping her own sizable rack perfectly on display.");

	//[Buy] [Appearance] [Sex]
	processTime(1);
	clearMenu();
	if(pc.lust() >= 33) addButton(2,"Sex",sexWithHeidrun);
	else addDisabledButton(2,"Sex","Sex","You aren’t turned on enough for that right now.");
	addButton(1,"Appearance",heidrunAppearance);
	if(flags["HEIDRUN_CREDS"] != undefined)
	{
		if(korgiiCredits()) addButton(0,"Buy",buyFromHeidrun);
		else addDisabledButton(0,"Buy","Buy","She still doesn’t accept credits. You should talk to Ula if you want to buy something.");
	}
	else addButton(0,"Buy",buyFromHeidrun);

	addButton(14,"Leave",mainGameMenu);
}

//Buy
public function buyFromHeidrun():void
{
	clearOutput();
	showHeidrun();
	//No payment
	if(!korgiiCredits())
	{
		// When trying to buy something before explaining credits to Ula. Disables the buy option until explaining credits.
		//Tooltip for disabled Bbuy: She still doesn’t accept credits. You should talk to Ula if you want to buy something.
		output("When you pull out your codex and activate the app to pay for your purchase, Heidrun tilts her head, looking confusedly at the clearly unfamiliar device. ");
		if(!korgiTranslate()) output("<i>“What is alien doing?”</i>");
		else output("<i>“Excuse me, but what are you doing?”</i>");
		output("\n\nYou cock your eyebrow at her. <i>“I’m going to pay you.”</i>");
		if(!korgiTranslate()) output("\n\n<i>“Oh. Alien money not good here, sorry.”</i>");
		else output("\n\n<i>“Sorry, but your money is worthless here”</i>.");
		output(" She shrugs apologetically. With nothing else to pay her with, you put your codex away, letting Heidrun put your would-be purchase back to where you took it from. <b>Perhaps you should speak to Ula and see if she can convince the clan’s merchants to accept your credits.</b>");
		flags["HEIDRUN_CREDS"] = 1;
		processTime(2);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
	//Tooltip: Browse her wares.
	else
	{
		output("\n\nThe moment you bring up buying clothing, she’s right next to you in a heartbeat, pressing her massive breasts against you. ");
		if(!korgiTranslate()) output("<i>“Alien wanting to buy clothes yes? Alien bring many credits, yes? Everything is for sale except Heidrun.”</i>");
		else output("<i>“Are you looking to buy some clothing? An outsider like you surely has plenty of credits to give? Everything besides me is for sale.”</i>");
		shopkeep = chars["HEIDRUN"];
		itemScreen = mainGameMenu;
		lootScreen = mainGameMenu;
		useItemFunction = mainGameMenu;
		shopkeep.keeperBuy = "The moment you bring up buying clothing, she’s right next to you in a heartbeat, pressing her massive breasts against you.";
		if(!korgiTranslate()) shopkeep.keeperBuy = " <i>“Alien wanting to buy clothes yes? Alien bring many credits, yes? Everything is for sale except Heidrun.”</i>\n";
		else shopkeep.keeperBuy = " <i>“Are you looking to buy some clothing? An outsider like you surely has plenty of credits to give? Everything besides me is for sale.”</i>\n";
		buyItem();
	}
}

//Appearance
//Tooltip: She’s practically begging you to stare so you might as well.
public function heidrunAppearance():void
{
	clearOutput();
	showHeidrun();
	output("Heidrun is your average korgonne: short, chubby and lovable all around. Two fluffy canine ears rest on the top of her head, flinching at the slightest noise. Two green eyes stare right back at you. There is a lustful glint in her eyes no matter what. Below her eyes she has a black nosed muzzle wrapping up the appearance of typical korgonne.");
	output("\n\nStaying in her shop most of the time, she doesn’t bother wearing anything other than some bandage wraps covering her breasts, she doesn’t even have any underwear on. Her massive G-cup breasts constantly strain the cloth around her torso. She shoots you a sly look and crosses her arms under her tits pushing them together, enhancing her magnificent cleavage.");
	output("\n\nAs you gaze at her, she turns around, pretending to do something productive. In reality, she is just bending over. Her short curly tail in the air she shows off her tight pucker alongside her leaky blue cunt. Turning to face you again she looks you with smoldering bedroom eyes. What a horny slut.");
	if(!korgiTranslate()) output("\n\n<i>“As much as Heidrun likes alien looking at her, Heidrun has business to run... Unless alien wanting the real deal...”</i>");
	else output("<i>“As much as I appreciate you ogling my body, I have a business to run. But if you want, we could step into the back room for a moment...”</i>");
	output(", the husky corgi coos, her voice dripping with lust.");

	processTime(2);
	pc.changeLust(4);
	clearMenu();
	addButton(0,"Next",approachHeidrun);
}

//Sex
//requires genitalia of some sort
//Tooltip: Browse her <i>wares</i>
public function sexWithHeidrun():void
{
	clearOutput();
	showHeidrun();
	output("Time to bring on the Steele charm. ");
	if(pc.isNice()) output("<i>“You look like you could use a break, how about we go into the back room and I treat you right?”</i>");
	else if(pc.isMischievous()) output("<i>“Hey, baby, let’s head into the back room, and I’ll show you a good time.”</i>");
	else output("<i>“Close down the store for a while, and I’ll treat you like the bitch you are.”</i>");
	output(" Despite your poor pickup line she presses her breasts against you.");

	output("\n\n");
	if(!korgiTranslate()) output("<i>“Yes, alien show many pleasures.”</i>");
	else output("<i>“I’m sure that an outsider like you has many pleasurable things to show me.”</i>");
	output(" Her pheromones start to quickly fill the room as her pussy starts to drip down her legs. She grips you by your hand and starts pulling you towards the back. ");
	if(!korgiTranslate()) output("<i>“Alien come in back. Other korgonne not bother there.”</i>");
	else output("<i>“Let’s go into the backroom, the other korgonne stay out of there.”</i>");

	output("\n\nMaking your way past the wooden counter, she leads you into a small backroom. Ripping off her bandages, she flops down onto the bedroll, spreading her legs and giving you a tempting blue target. ");
	if(!korgiTranslate()) output("<i>“Come alien, Heidrun all yours.”</i>");
	else output("<i>“Come on, I’m all yours.”</i>");
	output("\n\n");
	if(!pc.isCrotchExposed() && !pc.isChestExposed()) output("You disrobe in record time, all the while giddy with anticipation. ");
	output("Now to decide what you want to do.");
	processTime(3);
	pc.changeLust(10);

	clearMenu();
	if(pc.hasGenitals())
	{
		if(!pc.hasCock() && pc.blockedVaginas() > 0) addDisabledButton(0,"Lick Muff","Lick Muff","You need some genitalia that isn’t all plugged up for this.");
		else addButton(0,"Lick Muff",lickMuffHeidrun,undefined,"Lick Muff","Get between her thighs and put your tongue to work.");
	}
	else addDisabledButton(0,"Lick Muff","Lick Muff","You need some genitalia for this. Heidrun isn’t going to let a good deed go unrewarded...");
	
	if(pc.hasCock() && pc.cockThatFits(300) >= 0) addButton(1,"Bone Her",penisRouter,[boneHeidrun,300,false],"Bone Her","Give the dog a bone.");
	else if(pc.hasCock()) addDisabledButton(1,"Bone Her","Bone Her","You need a penis that would fit inside her in order to do this.");
	else addDisabledButton(1,"Bone Her","Bone Her","It would be difficult to bone her without a bone.");
	
	if(pc.hasVagina() && !pc.hasCock())
	{
		if(pc.blockedVaginas() > 0) addDisabledButton(2,"Get Boned","Get Boned","You’ll want to take care of the blockage below before receiving any sort of sex like this...");
		else addButton(2,"Get Boned",getBonedByHeidrun,undefined,"Get Boned","Maybe the shopkeeper has something to help you out.");
	}
	else if(pc.hasCock()) addDisabledButton(2,"Get Boned","Get Boned","She has no interest in substitutes while you’re packing the real deal.");
	else addDisabledButton(2,"Get Boned","Get Boned","You’ll need to only have a vagina for this.");
	addButton(14,"Leave",approachHeidrun);
}

public function lickMuffHeidrun():void
{
	clearOutput();
	showHeidrun(true);
	output("Time to go muff diving! You grab those juicy thighs of hers and lift her lower body up into the air. With the blue tinted cunt in position, you dive in, shoving your face into it. You lick her outer lips before starting to slowly feed your tongue into the depths of her pussy.");

	output("\n\n");
	if(!korgiTranslate()) output("<i>“Oh! Alien likes taste of muff? Alien can have much as want!”</i>");
	else output("<i>“Oh! Do you want to lick my juicy little pussy? Feel free to do so! I won’t stop you.”</i>");
	output(" She pants as you keep thrusting your tongue into her slit.");

	output("\n\nSlinging her legs over your shoulders, your reach forward to grab her luscious mounds. Digging your fingers into that soft tit flesh you start to rub her nipples, making them harden and turn outwards. You grab her blue tinted nipples and gently rub them before give them a rough twist. The amount of juices flowing into your mouth almost doubles as you grope her sizable boobs.");
	output("\n\nFeeling like you’ve been neglecting her clit, you withdraw your [pc.tongue] from the depths of her pussy and let go of her breasts. You switch onto sucking on her clit while thrusting your fingers into her gushing slit.");

	if(!korgiTranslate()) output("\n\n<i>“Oh, Alien good with tongue,”</i>");
	else output("\n\n<i>“Oh, you’re skilled with your tongue,”</i>");
	output(" she pants out as you keep sucking on her clit as if it was a miniature cock. ");
	if(!korgiTranslate()) output("<i>“Not fair if alien give all pleasure!”</i>");
	else output("<i>“It’s not fair if you do all of the work.”</i>");

	output("\n\nWithout a warning, she flips the two of you around before turning herself around so that you’re staring straight into her tail hole. Well, until she shifts backward and blocks your view with her juicy ass. <i>“");
	if(!korgiTranslate()) output("Get back working");
	else output("Come on, continue licking");
	output(".”</i> Desperate for her to start returning the favor, you start to slurp at her pussy, trying to find out her sensitive spots. Twisting your [pc.tongue] in a particular way, you hit an especially sensitive spot, earning a gush of feminine fluids and a moan from somewhere above.");

	if(pc.hasVagina() && !pc.hasCock())
	{
		output("\n\nYou feel two of her furry digits prodding at your netherlips and spreading them apart, followed by her exploring canine tongue. She starts to prod deeper into your slit with her broad tongue until it fully slips inside you, licking and lapping inside your tunnel. She doesn’t relent her assault on your [pc.pussy], instead starting to pinch your [pc.clit] as well.");
	}
	if(pc.hasCock())
	{
		output("\n\nA furry paw grasps your [pc.cock] softly, pulling it back to her mouth. You feel her warm breath upon your sensitive member as it gets closer and closer. You gasp into her pussy as she starts licking around your [pc.cockHead], placing the occasional kiss right on your urethra.");
		if(pc.cocks[0].thickness() > 4) 
		{
			output(" She kisses on your [pc.cock] and licks along the side. ");
			if(!korgiTranslate()) output("<i>“Alien cock much too big, not fit into mouth.”</i>");
			else output("<i>“Your cock is so big, I can’t even fit it into my mouth.”</i>");
		}
		else
		{
			output(" She envelopes your [pc.cock] in her warm mouth, soon pressing against the entrance of her throat. With a small gag she shoves your member into the depths.");
		}
		output(" She continues orally pleasuring your dick while gently rubbing your thighs.");
	}
	//Ohgod really?
	output("\n\nYou gasp as suddenly a single furry digit sneaks into your [pc.ass] without a warning and starts to thrust in and out of your hole. Seemingly she’s pulling out all of the stops. You’re not content to just lie there and let her make you orgasm first. You stop licking her pussy for long enough for you to stick your finger in your mouth and soak it in saliva. Then, going back to your muff munching, you dig deep into her folds with the tip of your tongue. When she clenches around your tongue, it’s your time to strike; you shove your finger into her pucker. She gasps ");
	if(pc.hasVagina() && !pc.hasCock()) output("into your [pc.pussy]");
	else if(pc.hasCock()) output("around your [pc.cock]");
	output(" as you sneak your finger into her butt.");

	output("\n\nThe digit up her tailhole is all it takes to set her off, quite evident from her slit and pucker clenching around your intruding flesh. She floods your face with her fluids as she continues orgasming. When she comes down from her high she goes back to ");
	if(pc.hasVagina() && !pc.hasCock()) output("slurping at your [pc.pussy]");
	else if(pc.hasCock()) output("sucking your [pc.cock]");
	output(".");

	output("\n\nYou’re not too far from the edge either, and watching her orgasm certainly didn’t calm you down. ");
	if(pc.hasVagina() && !pc.hasCock()) output("She licks on your insides passionately, scooping at your g-spot with her tongue. You feel the heat building up inside you, your thighs starting to shake as she tongues at your pussy, and your panting turns faster. Your legs shake, and you wrap your legs around her head as she brings you to a mind-melting orgasm, your juices soaking her muzzle.");
	else if(pc.hasCock()) 
	{
		output("She starts polishing your cock head again, licking it in slow strokes while massaging the shaft. ");
		if(!korgiTranslate()) output("<i>“Alien cock taste so good.”</i>");
		else output("<i>“Your cock is so delicious.”</i>");
		output(" She murmurs into your crotch. ");
		//dick girth under 4:
		if(pc.cocks[0].thickness() > 4) output("She starts milking your shaft with quick strokes, tightly squeezing you at the base of your [pc.cock] and running her pre slicked hands up to your [pc.cockHead].");
		else output("She stuffs your cock back into your mouth. She hollows her cheeks before dragging her warm maw back up your dick, then letting air back into her mouth and sloppily slamming her muzzle back down.");
		output(" You feel your orgasm coming, your [pc.balls] preparing to spew into her mouth anytime now. As if sensing this she hastens her movements, making it even more pleasurable for you.");

		output("\n\nWhen your [pc.balls] send");
		if(pc.balls <= 1) output("s");
		output(" your [pc.cum] forth she latches onto your cock head while stroking your length with her hands. You thrust your hips upwards as she starts swallowing your jizz.");
		if(pc.cumQ() >= 700) output(" She diligently swallows your cum for the first three shots but then she has to relinquish your cock head. She starts stroking you faster as ropes of your [pc.cum] fly through the air and splatter wetly on the cave floor.");
		else output(" She keeps sucking on your cumslit until you have nothing else to give. Only then she pops your [pc.cockHead] out of her mouth, she licks her lips before giving your sensitive member a final kiss.");
	}
	output("\n\nShe lifts her juicy behind from your face, allowing you to breathe pussy free air once again. She climbs off you and stands up picks up the pile of bandages. She turns to you while wrapping her breasts in the cloth again. ");
	if(!korgiTranslate()) output("<i>“Alien come back, bring more pleasure.”</i>");
	else output("<i>“Come back and treat me to a wonderful time again.”</i>");
	output(" She winks at you lustily before sauntering out of the backroom. You quickly throw your things back on and follow her to the storefront.");
	processTime(20);
	IncrementFlag("SEXED_HEIDRUN");
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Bone her
//requires dick under 20 inches
public function boneHeidrun(x:int):void
{
	clearOutput();
	showHeidrun(true);
	output("You growl playfully before pouncing atop of her, pinning her down to the bedroll. Gently nipping her ear you breath down to her. <i>“");
	if(pc.isAss()) output("Are you ready to be pounded like a bitch?");
	else output("Are you ready for a world of pleasure?");
	output("”</i> You don’t give her a chance to respond, instead thrusting balls deep into her pussy with a single solid thrust. Any response she was trying to form is turned into a wordless gasp as her pussy is filled with your meaty dick.");
	pc.cockChange();
	output("\n\n<i>“You like that, don’t you? Well don’t worry, I’m not going to stop anytime soon.”</i> You grab hold of the wide hips and start to thrust, creating a rhythmic sound of lewd squelches as her pussy juices soak your [pc.cock " + x + "] and the cloth below.");
	output("\n\nAlready in a fuck haze, she starts aimlessly stroking along your [pc.skinFurScales], brushing gently over your shoulders, biceps, and down to your [pc.belly] as you pump into her. She wraps her arms around your neck, pulling down and smushing your [pc.lips] against her muzzle. Your eyes shoot open in surprise as her tongue slips into your mouth and pulls your [pc.tongue] into hers. You close your eyes and go with the flow, letting your tongue dance and weave with hers.");
	output("\n\nWhile your tongues mingle in her mouth, you hasten the speed of which you thrust into her sodden slit. Working your entire length into her pussy, you make her moan into your mouth every time you hit a particular spot inside her quim. You smile to yourself internally as you work over her sweet spot. Accelerating your thrusts, you start grinding your [pc.cockHead " + x + "] against that small spot that makes her moan every time.");
	output("\n\nIt doesn’t take long for her to start spasming and clenching around your cock uncontrollably. Not wanting her to cum this early, you slow down and give her g-spot a break. Eventually coming to a complete stop, letting your [pc.cock " + x + "] rest inside her tunnel, you continue to make out with her.");
	output("\n\nBreaking the kiss, she looks at you with smoldering eyes before pushing you gently back. You’re confused, but you back off nonetheless. Now that you aren’t pinning her down, she turns around and lifts her derriere high into the air.");
	output("\n\nYou grin as you catch on to what she wants. Grabbing onto her tail with one hand and her fertile hip with the other, you drive your cock home into her pussy. She moans out loud and bucks back into your [pc.hips], urging you to fuck her faster. You’re happy to oblige, pulling back until only your [pc.cockHead " + x + "] remains inside her, only to drive back into her with the full force of your body.");

	output("\n\nShe barks and whimpers into the bedroll as you hammer into her juicy slit, only encouraging you to go ");
	if(silly) output("harder, better, faster, stronger");
	else output("harder and faster");
	output(". You slap her furry cheek, telling her to calm down. You start fucking her harder nonetheless.");

	output("\n\nAs you pound into her, she starts to clench and quake around your [pc.cock " + x + "] uncontrollably, and this time you don’t give her any time to calm down. A handful of solid, whole-length thrusts is enough to push her over the edge into a juicy, screaming orgasm which sends her passion gushing down her thighs and soaking the bedroll in her fragrant feminine essence.");

	output("\n\n");
	if(!korgiTranslate()) output("<i>“Alien so good, Heidrun couldn’t hold it.”</i>");
	else output("<i>“Wow, you’re a good lay. I don’t cum that fast normally.”</i>");
	output(" She pants into her pillow in between huge gasps for air. It takes a while for her to notice you’re still rock hard inside her pussy. Her only reaction to your remarkable stamina is a small whimper, a teasing wiggle of her hips, and a clench of her cunt.");
	output("\n\nWith this wordless encouragement, you take hold of her shoulders and start to fuck her hard and fast once more, making her whimpering even louder. Unfortunately, you’re not too far from the edge either, so you won’t be keeping this up for much longer. Gritting your teeth, you fuck her like your life depends on it.");

	output("\n\nYou can already feel your orgasm swelling inside you, and with few more thrusts, you hilt inside her. Your [pc.balls] tighten");
	if(pc.balls <= 1) output("s");
	output(" before sending ropes of your [pc.cum] forth to invade her womb.");
	if(pc.hasKnot(x)) output(" Your knot swells in place, locking her into your crotch, making sure that none of your precious seed ends up outside her pussy.");
	output(" She moans weakly as your [pc.cumNoun] lays claim on her insides.");

	if(pc.cumQ() >= 4000) output("\n\nHer womb swells as you fill her like a water balloon, and it seems like there’s no end to it. But eventually, all good things must come to an end, at least you left her nicely stuffed.");
	if(pc.hasKnot(x)) output(" It takes a while but eventually your knot shrinks enough for you to pull out of her.");
	else output(" You catch your breath while letting your member soften inside her.");
	output(" You dismount her, pulling out of her quim and flopping down onto the bedroll.");

	output("\n\nShe turns around and lies back on the bedding with her legs spread wide, showing off her cum oozing pussy. ");
	if(pc.cumQ() < 250) output("The proof of your claim slowly oozes out of her and down onto the bed");
	else if(pc.cumQ() < 4000) output("Your [pc.cum] oozes thickly out of her pussy, soiling the soft cloth below her");
	else output("Your cum flows out of her pussy like a waterfall, creating a puddle under her");
	output(". She shoves her fingers into her cunt, stirring her slit. She pulls her fingers out of her muff, sticking them into her mouth she tastes your cum. ");
	if(!korgiTranslate()) output("<i>“Mmm, alien tasty. Alien give more other time?”</i>");
	else output("<i>“Mmm, you taste good. Come back and give me some more.”</i>");
	output(" You stand up, stretching your limbs you grab your equipment before [pc.walking] back to the storeroom.");
	output("\n\nA moment later Heidrun walks out of the backroom, cum still leaking down her thighs. She licks your neck affectionately before ushering you out of the store.");
	IncrementFlag("SEXED_HEIDRUN");
	processTime(20);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Get boned
//requires pussy and no cock
public function getBonedByHeidrun():void
{
	clearOutput();
	showHeidrun(true);
	var x:int = rand(pc.totalVaginas());
	output("Seeing your [pc.crotch] and noticing that you’re lacking the equipment to properly mate with her, she grabs a small wooden box next to the pillow.");
	if(!korgiTranslate()) output(" <i>“No member-having is not problem. Lumi gived toy for such time.”</i>");
	else output(" <i>“Your equipment is a bit lacking down below, but it won’t be a problem. Lumi gave me this for times such as this.”</i>");
	output(" She pulls out a carved bone strap-on. She slips on the leather straps, bringing the pseudo-erection to her crotch. To no one’s surprise, it’s shaped like a canine member, with a tapered tip and a knot at the base. But unlike a normal dog dick, it has small nubs along its length for stimulating a partner.");
	output("\n\n");
	if(pc.hasHardLightEquipped()) output("Despite your underwear being a superior strap-on you let the chubby korgonne have her fun. ");
	output("You lie back, spreading your [pc.thighs] invitingly for her. Instead of kneeling in between, she stands next to you, her strap-on poking against your [pc.nose]. ");
	if(!korgiTranslate()) output("<i>“Make bone wet, alien feel better that way.”</i>");
	else output("<i>“You’ll want to make it wet, it feels a lot better that way.”</i>");
	output("\n\nKnowing that a dry piece of bone in your cooter would be an uncomfortable experience, you wrap your [pc.lips] around the spearlike head of the strap-on, working your way towards the swollen base of the toy. Sucking on the boney prick is a weird experience, it’s harder than a normal dildo but softer than you would expect. You get the bone carving about one fourth into your mouth before you give up and start to lick all over it, making sure to slather your spit on its length.");
	output("\n\nWhen the artificial boner is slathered in spit, you kiss its tip and lie back. Finally, she kneels in between your legs, bringing the strap-on against your [pc.pussy " + x + "]. She grabs the dildo by the base, teasing your clit before slowly starting to penetrate your tunnel. You try to contain your moans as the nubs massage your insides in a way that makes you gush. You moan out loud when she hilts the bone in you.");
	pc.cuntChange(x,200);
	output("\n\nShe grins softly as moans of pleasure pour out of your mouth unabated. Cherishing the pleasurable noises you make, she gently pushes you onto your back. She starts to pinch and rub your [pc.nipples]. She continuously switches between soft rubs and rough pinches, bordering on the edge of pain.");
	output("\n\nShe continues fucking you at the same lazy pace and shows no sign of hastening it. She just keeps tormenting your [pc.nipples] while lazily fucking your [pc.pussy " + x + "]. You’re going to go crazy before you’re going to cum if she doesn’t speed up. You open your mouth but the words turn into slutty moans as she pinches your nipples again.");
	output("\n\nShe offers you a smug grin before she speaks up. ");
	if(!korgiTranslate()) output("<i>“Did alien try talk something?”</i>");
	else output("<i>“Were you trying to say something?”</i>");
	output(" She continues making you moan every time you open your mouth to say something.");

	output("\n\nEventually, you get hold of your voice and manage to gasp. <i>“Fa- faster. Fuck me faster!”</i>");
	output("\n\nShe stifles her laughter as you mindlessly beg for her to go faster. <i>“");
	if(!korgiTranslate()) output("Alien almost as slutty as me.");
	else output("You’re almost as slutty as I am when I’m at the receiving end.");
	output("”</i> Finished with teasing you she speeds up her thrusting, turning that slow thrusting into blinding pleasure.");

	output("\n\nWhile she was slowly pumping into you at first, she’s now hammering into you with such force that you see stars. She pulls all the way out in such a way that all of those small nubs massage your g-spot. When only the tip remains inside, she thrusts back in, bringing it right against your cervix. Not to mention the knot that stretches you out deliciously everytime she thrusts deep as possible.");

	output("\n\nYou can’t move your arms properly even if you wanted to so there’s nothing you can do when she pulls the dildo out of your slit and flips you over onto your stomach. She lifts your [pc.ass] to her crotch level so that your resting on your [pc.breasts] and knees. Somehow this position allows her to thrust even harder.");
	output("\n\nYou drool onto the pillow as she keeps roughly pounding your [pc.pussy " + x + "]. You’re not going to last long at this pace. Hopefully, you’ll cum before she breaks your body... or your mind. You can feel the pleasure building inside you, and it’s going to spill over any second now. It’s so close that you feel like you’re going to go mad. You reach between your legs, towards your [pc.clit]. You start jilling on it like there’s no tomorrow.");
	output("\n\nWith the rough fucking from her and your touching your [pc.clit] the pleasure inside you spills over. With a breathless scream you cum explosively, your [pc.girlCum] squirting around the boney dildo inside you. You curl your toes and clench around the toy as waves of pleasure roll over you.");
	output("\n\nWhen your orgasm is over you can’t feel your legs and you can’t smell anything but pussy. Thankfully the feeling returns to your legs rather quickly, allowing you to stand up, very shakily, but standing nonetheless. Once you can stand again Heidrun sits down and pulls off her strap-on. <i>“");
	if(!korgiTranslate()) output("Alien enjoyed " + pc.mf("himself","herself") + " yes? Alien go now, Heidrun is needing to take care of her own need.");
	else output("Did you enjoy yourself? Good, now if you don’t mind I have some business to take care of.");
	output("”</i> She starts to licking the strapon while fingering her pussy, leaving no doubt what she’s going to do. Not wanting to disturb her you grab your gear and limp your way out of the backroom. Damn your [pc.pussy " + x + "] is sore.");
	IncrementFlag("SEXED_HEIDRUN");
	processTime(20);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

/*
output("\n\nLeather Bra 20 000 credits");
output("\n\nLeather Panties 20 000 credits");
output("\n\nFur Bra 24 500 credits");
output("\n\nFur Loincloth 24 500 credits");
output("\n\nHide Vest & Breeches 25000 credits");
output("\n\nInsulated Coat 17000 credits");
output("\n\nTraveler’s Cloak 22 000 credits");
output("\n\n Item descriptions and stats");
output("\n\nLeather Bra");
output("\n\nA skimpy bra made from leather. It’s decorated with primal looking curves and swirls along the leather. While it looks and feels nice it won’t protect you from the coldness.");
output("\n\nSexiness 3");
output("\n\nLeather Panties");
output("\n\nA pair of panties made from fine leather, decorated with tribalistic lines. They don’t cover much skin so they won’t protect you from the cold, but at least you’ll look sexy when you’re freezing your ass off.");
output("\n\nSexiness 2");
output("\n\nFur Bra");
output("\n\nA bra made from fur and leather, it looks quite like a sport bra. It’s made to protect your upper body from the harsh, cold air. Unfortunately the thick leather and dense fur doesn’t make for the most attractive garment.");
output("\n\nSexiness -2");
output("\n\nDamage resistances:");
output("\n\nFreezing 20%");
output("\n\nThermal -10%");
output("\n\nFur Loincloth");
output("\n\nA loincloth made from fur and leather, designed to keep your genitals warm. Not too effective, since there is nothing blocking the cold air from underneath.");
output("\n\nDamage resistances:");
output("\n\nFreezing 15%");
output("\n\nThermal -5%");
output("\n\nItemtype: undergarment");
output("\n\nTraveler’s Cloak");
output("\n\nA thick and warm cloak made from fur, used for traveling in cold climates. Will keep you warm during a snowstorm. Unfortunately, it’s highly flammable and the hood tends to get in front of your eyes.");
output("\n\nAccuracy -2");
output("\n\nDamage resistances:");
output("\n\nFreezing 15%");
output("\n\nFire -10%");
output("\n\nItemtype: accessory");
*/