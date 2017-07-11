//Custom Follower, by Fenoxo

/*
//Physical Notes
Refs:
* https://e621.net/post/show/893307/2012-abstract_background-anthro-anus-avian-backsac
* https://e621.net/post/show/394399/anthro-areola-avian-balls-big_breasts-black_lips-b
* 9' tall - Obscenely tall for a Suula. Sure we couldn't do 8'? Not going to fit in most ships very well.
* 47 yrs old
* Long, prehensile tongue.
* curvy body with wide, childbearing hips etc - Pure Minerva is a good template
* "Massive bouncy funbags, G-cups or bigger"
* Start out as G-cups, become J during pregnancy, M after birth.
* Lactate permanently after first preggomancy. 
* Big dick - Just a hair under Kiro length but fatter around the middle.
* Overproductive balls. Glans and balls massively sensitive as a result of some dallying with Throbb.
* Produces pre very easily. Might provide fun play opportunities.
* Very sensitive siren cunt (filled with small wigglers - aphrodisiacs). Super sensitive clit. Bigger tendrils near entrance. Very elastic, doesn't ever really gape. Very wet.
* Cock tentacles can aphrodisiac sting, causes genital swelling and increased cum volume. (Assuming she can control this as an at will thing. Might be fun to play with).
* PHEREOMONES: Fertile/ready. Musky/heady balls&dong, especially when preggo. Cunt is more fragrant esp when preggo/horny.
* Azra just 'tastes' heavenly - clearly modded with some amazing xeno flower DNA to lend her pheromones an exotic floral hint and a taste of sweet, ambrosia, maybe a hint of peach for full mineva reference.
* Needs to be Kina's Siren race, obviously.

Personality Notes:
* Responsible single mom who successfully keeps her enhanced libido in check with sheer force of will. Sweet & slutty in the sheets, serious on the streets (with a hint of lovey-dovey).
* Supposed to be kind of a switch. Dommy side should probably very lovy-dovey and a lil milfy.
* Prefers taking vaginal over using her dick.
* Polyamorous
* Womb "belongs" to the PC, her "stud". Will orgy/threesome if condoms/contraception are used.
* History/Jorb
* Single mom after her ex died in a pirate raid. Raised her kids by herself. VERY close with her daughters (who I think Savin would rather have be blank slates to give him some freedom, but I'll leave that between you guys). So they're already sort of incestual. After things are serious with the mom, daughters can come visit if parked on Tavros and bang?
* Xenobiologist looking for a crew to take her out to rush planets. Specializes in unique flora (plants) and finding potentially useful adaptations for mods. Has contacts in both JoyCo and Xenogen that she can sell stuff to.
* Has an apartment on the residential deck where her daughters presently live.
 
Romancing/Recruiting the sharkMILF!
* Recruits herself the first time you introduce yourself! Warm and friendly but nonsexual at first.
* Requests your assistance with gathering samples on Mhen'ga, Tarkus, and Myrellion. Results in a gauntlet of 3 to 4 combat encounters. If you lose, she runs off and you're left in the wilderness of the planet by yourself. Have to go back to your ship to restart.
* Each success makes her more affectionate and causes her to open up more talk discussions.
* 1st: hug and kiss that she then apologizes for. All blushy and shy about it afterward. Doesn't want to do more.
* 2nd: Passionate kissing after. Apologizes again but wants more and kisses you mid apology. Has enough self-control to pull herself back but pheromones leave the PC wanting it baaaad.
* 3rd: Boning back on the ship. Explicitly declares you as her stud and in a moment of passion begs you to knock her up.
* 3rd if nocock: Bones your butt, trying to talk you into getting a dick so you can do things to her. If PC declines, puts her in "sad" state where she doesn't really want much to do with you. Perks up the moment you come back with dick.
* If sexy-times are unlocked and PC ever shows up sans dick, visibly disappointed and not interested in sexytimes. May offer the PC a throbb on a huge cooldown to "fix" them.

//Found wearing something like this lovely number (though distinct enough not to get us suuuueeed): https://cdnb.artstation.com/p/assets/images/images/004/333/055/large/ian-mcintosh-bloodassassin-iron-banner-female.jpg?1482538718
*/

/*Flags:

	MET_AZRA 				1 if met Azra.
	AZRA_DISABLED			1 if Azra is disabled from any other interactions.
	AZRA_RECRUITED			1 if recruited, 2 if ship intro has happened.
	AZRA_ONBOARD			1 if Azra is onboard the ship presently.
	AZRA_KISSED 			Count of times kissy kissed.
	AZRA_SEXED 				Count of times sexual acts done.
	AZRA_SEX_KNOWN			1 if you know about Azra's ween & cunt.

	AZRA_RACE_TALK			1 if you've talked with her about suulaness.
	AZRA_DAUGHTER_TALK		1 if you've talked about her daughters
	AZRA_STUD_TALK 			1 if talked about her "stud"
*/



 
public function showAzra(nude:Boolean = false):void
{
	var nudeS:String = "";
	if(nude) nudeS = "_NUDE";
	showBust("AZRA" + nudeS);
	showName("\nAZRA");
}

public function azraRecruited():Boolean
{
	return (flags["AZRA_RECRUITED"] != undefined && flags["AZRA_DISABLED"] == undefined);
}
public function azraIsCrew():Boolean
{
	return (flags["AZRA_ONBOARD"] != undefined && flags["AZRA_DISABLED"] == undefined);
}

//Tavros elevator or Uveto elevator, procs after using it the fourth time.
public function azraBonusProc(btnSlot:int = 0):Boolean
{
	showAzra();
	if(flags["MET_AZRA"] == undefined)
	{
		output("\n\nAn enormous, armored figure joins you in the elevator. She - and it must be a she based on the wide hips, narrow waist, and conspicuous bosom - ");
		if(pc.tallness < 84) output("bends her impressive stature low in order to make eye contact");
		else output("looks you square in the eye");
		output(". <i>“Pardon me, are you a rush captain?”</i> The gentle voice is entirely at odds with her imposing appearance and shiny new armor. The woman pulls back her hood to reveal the shark-like face of a gold-skinned suula, framed in a halo of wavy burnished hair.");
		if(CodexManager.entryUnlocked("Suulas")) output("\n\n{In the background, your Codex quietly announces that it has compiled an article on the race for your later perusal.");
		output("\n\nYou ");
		if(pc.isBimbo()) output("nod rapidly at the amazonian alien.");
		else if(pc.isNice()) output("give a friendly nod. <i>“You guessed it.”</i>");
		else if(pc.isMischievous()) output("shrug. <i>“I’m either that or a galaxy-touring superstar. Still trying to figure out which.”</i>");
		else output("gruffly nod. <i>“What of it?”</i>");

		output("\n\n<i>“Bravo! Excellent! Exemplary! My name is Azra, freelance Xenobiologist... " + pc.mf("Mister","Miss") + "...?”</i> The suula grabs your hand and shakes it hard enough for you to feel it in your [pc.feet]. Quite a grip on that one.");
		output("\n\n<i>“[pc.name] Steele,”</i> you answer.");
		output("\n\n<i>“Have you room on your craft for a passenger? You see, I’m a freelance Xenobiologist specializing in the adaptations of alien flora, but I am completely without transportation.”</i> She shakes her head and sighs. <i>“My chartered captain left without me when customs delayed my arrival at Tavros. ‘Riches wait for no man’ or some such.  The greedy syot took off with nearly all my credits! I have neither the funding to charter another or an alternative means of transit, leaving me to put myself upon the kindness of " + pc.mf("dashing","fetching") + " adventurers like yourself. Would you take me onboard? I don’t take up much room.”</i> Azra tucks her wings in tight and hunches her shoulders in, slouching as much as her nine-foot tall frame will allow. <i>“Relatively speaking, of course.”</i> A blush the color of a terran sunset colors her cheeks.");
		output("\n\nDo you have room for a scientist on your ship?");
		flags["MET_AZRA"] = 1;
		processTime(5);
		//[Hell Yeah] [Not Yet] [Never]
		clearMenu();
		addButton(0,"Hell Yeah",recruitDatSharkMomma);
		addButton(1,"Not Yet",notYetAzra);
		addButton(2,"Never",neverJoinMeYouBitch);
		return true;
	}
	else
	{
		output("\n\nAzra the suula scientist is here, trying to catch a ride to the frontier from another rusher. As you recall, she was quite keen to join your crew.");
		addButton(btnSlot,"Azra",walkUpToRepeatElevatorAzra);
	}
	return false;
}

//Never
public function neverJoinMeYouBitch():void
{
	clearOutput();
	showAzra();
	output("<i>“");
	if(pc.isNice()) output("I’m sorry, but no.");
	else output("No.");
	output("”</i> The answer is firm, brooking no argument. You want to be clear to her that you won’t ever have room for her on your ship.");
	output("\n\nAzra is appears crestfallen, then straightens. <i>“Then thank you for your time, but I must be off. There are other captains about, and I cannot afford to dally. Safe travels, Captain Steele.”</i> She walks off without another word.");
	processTime(1);
	flags["AZRA_DISABLED"] = 1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Not Yet
public function notYetAzra():void
{
	clearOutput();
	showAzra();
	output("<i>“Not yet,”</i> you answer, <i>“but that could change.”</i>");
	output("\n\nThe suula’s golden visage brightens. <i>“Oh, Captain Steele, thank you for even considering my situation. When you are able to accommodate me, let me know. I have my equipment packed for travel and armor fit for enduring the harshest rimward climes.”</i> She gives a small bow, then steps away, leaving you to return to your business.");
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Repeat approach
public function walkUpToRepeatElevatorAzra():void
{
	clearOutput();
	showAzra();
	output("Azra pipes up as soon as you turn her way. <i>“I’m still ready to go if you are.”</i>");
	processTime(1);
	clearMenu();

	addButton(0,"Sure",recruitDatSharkMomma);
	addButton(1,"Not Yet",notYetCrewAzraRepeat);
}

//Not Yet
public function notYetCrewAzraRepeat():void
{
	clearOutput();
	showAzra();
	output("<i>“Not yet,”</i> you answer.");
	output("\n\n<i>“Oh, okay.”</i> Azra sighs and turns away. <i>“Let me know if you change your mind.”</i>");
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Recruit Her Okay
public function recruitDatSharkMomma():void
{
	clearOutput();
	showAzra();
	output("<i>“Welcome to the crew,”</i> you say, giving her directions to your ship.");
	output("\n\nAzra smiles, displaying a small army of extremely pointed teeth. <i>“Thank you for this chance, Captain Steele. I cannot adequately express my gratitude, but I’m sure our time together will give me plenty of opportunities to try.”</i> She walks away, armor-encased hips swaying, the long, sinuous tail of a suula waving behind.");
	flags["AZRA_RECRUITED"] = 1;
	flags["AZRA_ONBOARD"] = 1;
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//First time entering the ship post-Azra.
public function azraInShipGreeting():void
{
	clearOutput();
	showAzra();
	output("<i>“Captain [pc.name]!”</i> Azra marches smartly down the boarding ramp to greet you. She starts to reach for a handshake, then turns it into a hug at the last moment, pressing you firmly into her armor-clad ");
	if(pc.tallness >= 84) output("shoulder");
	else if(pc.tallness >= 72) output("bust");
	else if(pc.tallness >= 60) output("belly");
	else output("hip");
	output(". ");
	if(pc.tallness <= 66) output("Your feet dangle off the ground. ");
	output("<i>“Thank you so much.”</i> She squeezes you tighter, tight enough to make the straps and buckles holding it all together creak. <i>“I went ahead and claimed the empty bunk. I think it’s actually nicer than the quarters I tried to book.”</i> She lets ");
	if(pc.tallness <= 66) output("you down onto the floor gently.");
	else output("you go far more gently than she grabbed you.");
	output(" <i>“So where to first, Captain?”</i>");

	output("\n\nYou scratch the back of your neck as you mull over your options. <i>“It doesn’t matter to you?”</i>");
	output("\n\n<i>“Nope. As long as it’s on the frontier and full of new plants to study, I’ll be happy as a galotian on Jitafore.”</i> Her enthusiasm is palpable.");
	output("\n\n");
	if(CodexManager.entryViewed("Kui-Tan")) output("You can only imagine how happy a galotian would be living on the kui-tan homeworld.");
	else output("The reference flies over your head, but you can only assume it’s a planet with a plentiful protein source.");
	output(" <i>“");
	if(pc.isBimbo()) output("Super-duper! I’m gonna be going to lots and lots and lots of planets, but they’ll all be super fun places to hang out, I swear. Cross my heart and hope for pie.");
	else if(pc.isBro()) output("Sure thing.");
	else if(pc.isNice()) output("I’m going to be heading all over. It’s a bit of a long story, but we could be cutting a pretty wide path through the rush.");
	else if(pc.isMischievous())
	{
		if(celiseIsCrew()) output("We’ve got one of those onboard. It’s good to know I can lean on you for tips on pleasing her.");
		else output("We’ll get along fine. Maybe your science will even wind up saving our asses someday.");
	}
	else output("Good. I intend to crush this rush in record time. Hope you can keep up.");
	output("”</i>");

	output("\n\nAzra ");
	if(pc.isMischievous() && celiseIsCrew()) output("blushes.");
	else output("smiles warmly.");
	output(" <i>“Fantastic. I’ll settle in for the long haul. I can’t wait to see the frontier!”</i>");
	output("\n\nYou walk into the ship beside your new crewmate, making small talk along the way. She peels off for her quarters once inside.");
	output("\n\n(<b>Azra has joined your crew!</b>)");
	flags["AZRA_RECRUITED"] = 2;
	processTime(4);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Azra as a Follower
//Random crew blurbs
public function azraCrewBlurbs(button:Number):String
{
	var buffer:String = "";
	if(pc.hasStatusEffect("Azra Plant CD")) 
	{
		buffer += "\n\nAzra is busy giving your latest samples a more permanent home on the ship, lest the rare flora die out.";
		addDisabledButton(button,"Azra","Azra","She's too busy with the latest sample to be bothered right now.");
		return buffer;
	}
	else if(rand(10) == 0) buffer += "\n\nAzra is sitting in front a codex-projected hardlight terminal. She appears to be answering emails.";
	else if(rand(9) == 0)
	{
		output("\n\nAzra the suula scientist is reclining on her bunk, reading something on her Codex.");
		if(rand(2) == 0) buffer += " She looks very focused.";
		else buffer += " Judging by her blush, she is quite intrigued.";
	}
	else if(rand(8) == 0) buffer += "\n\nAzra is wrapping up a holocall with another suula, likely a family member, judging by the resemblance.";
	else if(rand(7) == 0) buffer += "\n\nAzra is munching on a pink-colored fruit. You can’t quite place its species, but it vaguely resembles a terran peach.";
	else if(rand(6) == 0) buffer += "\n\nAzra is blushing hotly and hastily donning her armor. You must have interrupted something private...";
	else if(rand(5) == 0) buffer += "\n\nAzra is grumbling and massaging one of her wings. Evidently she must have whacked it in the tight quarters of your spacecraft.";
	else if(rand(4) == 0) buffer += "\n\nAzra is stretched out and preening her feathers.";
	else buffer += "\n\nAzra is packing away a tube filled with exotic plant samples. Her portable workstation still displays a visualization of its genetic structure.";
	addButton(button,"Azra",approachCrewAzra);
	return buffer;
}

//Azra Crew Approach
public function approachCrewAzra():void
{
	clearOutput();
	showAzra();
	output("Azra greets you with a warm smile as you approach. <i>“");
	if(hours > 3 && hours < 12) output("Morning");
	else if(hours < 18) output("Afternoon");
	else if(hours < 24) output("Evening");
	else output("Late Night");
	output(", eh Captain? ");
	if(rand(3) == 0) output("What brings you to my humble little pocket of your ship?");
	else if(rand(3) == 0) output("If you’re getting lonely up there in the Captain’s chair, I’m always happy to talk.");
	else if(rand(3) == 0) output("Something I can help you with? The plants out there can be quite rough.");
	else if(rand(2) == 0) output("Have a seat. I hope I haven’t been making too much noise.");
	else output("Would you like a cup of tea? A snack perhaps? Help yourself.");
	output("”</i>");
	//Bimbo
	if(pc.isBimbo()) output("\n\nYou give her a peppy thumbs’ up and consider what you’d like to ask of the giant suula.");
	//Bro
	else if(pc.isBro()) output("\n\nYou give her your friendliest sounding grunt. What did you want from the giant suula?");
	//Nice
	else if(pc.isNice()) output("\n\nYou flash a friendly smile and make yourself at home in her quarters. What would you like to ask the giant suula?");
	//Mischievous
	else if(pc.isMischievous()) output("\n\nYou answer with your most disarming grin and nonchalant wave. What did you need from the giant suula?");
	else output("\n\nYou shrug and lean back. What did you want from the oversized shark-girl?");
	azraMenu();
}

public function azraMenu():void
{
	clearMenu();
	addButton(0,"Appearance",azraAppearance);
	addButton(1,"Talk",azraTalk);
	addButton(2,"Expeditions",azraExpeditionStartup,undefined,"Expeditions","Go on an expedition with Azra.");
	if(flags["AZRA_MHENGAED"] != undefined) addButton(3,"Plant Samples",azraPlantSamples,undefined,"Plant Samples","Personally inspect the fruits of your labors.");
	else addDisabledButton(3,"Plant Samples","Plant Samples","You have yet to recover any plant samples on an expedition with Azra.");
	addButton(13,"Leave Crew",talkToAzraAboutLeavingTheCrew);
	addButton(14,"Leave",mainGameMenu);
}

//Appearance
public function azraAppearance():void
{
	clearOutput();
	showAzra();
	output("Azra is one of the chimeric suula, with all the racial traits that entails. That includes a short-muzzled face with hints of shark-like structure and a mouth filled with razer-sharp teeth. However, a crown of glimmering, burnished orange hair hints at typically mammalian traits, and her pointed ears seem almost elfin with a hint of aquatic frill. Azra’s lush black lips smile easily and often, lending her an aura of friendliness completely at odds with the more vicious-looking parts of her heritage.");
	//KISSED HER:
	if(flags["AZRA_KISSED"] != undefined) output(" You know from experience that her tongue is a length, prehensile serpent, capable of incredible dexterity and tenderness.");
	output("\n\nTiny, interlocking scales serve as her skin, shimmering softly under any light. They’re rich gold in hue, and with nine feet of suula to cover, ");
	if(flags["AZRA_SEXED"] == undefined) output("you imagine ");
	output("there’s shortage of glittering girl to admire. She covers up most of her form with a restricting suit of armor most of the time, but not even the padded chestplate can ");
	if(9999 == 9999) output("conceal her soccerball-sized breasts");
	else if(9999 == 0) output("cover up her massive, motherly breasts");
	else output("contain her mountainous, back-breaking boobs. A lesser creature would collapse under the weight, but not Azra");
	output(". Her shapely nature is further compounded by her height and slim nature, highlighting the suula’s motherly curvaceousness.");

	//Seen nudies
	if(flags["AZRA_SEXED"] != undefined)
	{
		output("\n\nYou know that under all that protective padding is a wonderland of female flesh. Azra’s pendulous breasts are soft and supple in all the right ways, capped by succulent nipples that beg you to feast your lips upon them until they can’t help but dribble milk. ");
		if(9999 == 0) output("And dribble milk they do. Ever since she started lactating, her breasts have given up their creamy flow at the slightest provocation. Azra makes sure to milk herself regularly, lest she transform into a walking white stain. ");
		output("Her middle ");
		if(9999 == 9999) output("is softened by a life well lived and years of motherly stress, giving it the slightest hint of pooch when she’s sitting or crouching.");
		else if(9999 == 99999) output("capped by the unmistakeable bump of a pregnancy in progress - your doing, no doubt. The tender reminder of your past pleasures is difficult to keep your hands away from. Azra too struggles with this. You can catch her patting your unborn child when she thinks you aren’t looking.");
		else output("is home to gravid dome - proof of your virility and affection for the lovely suula. She’s always encouraging you to rub your belly and feel your child kick. Sometimes you catch her cradling it and smiling when she thinks no one is looking.");
	}
	//Merge
	output("\n\nWide, child-bearing hips flare out below her waist, threatening to knock a table’s worth of knick-knacks to the floor with every step. It’s amazing she could find armor broad enough to contain them. With hips that like, every step is a swaying advertisement to potential suitors of her reproductive fitness, and the ass she carries behind them is sized to match, only partially hidden by the lengthy, finned tail of a suula as it sways behind her.");
	if(flags["AZRA_SEXED"] == undefined) output(" The crotch of her armor bulges with something substantive than a purely feminine slit, but until you get to know her better, you doubt you’ll get a peek inside.");
	else output(" You know for a fact that she’s hiding a fat, tendril-ringed dick under there. When hard, it can get up to 19 or 20 inches long, though when she’s unaroused, it’s a cute, chubby little thing all but asking you to fondle it. Two peach-sized balls hang under, almost perfectly spherical and swaddled in a supremely soft sack. Just behind are the folds of her sweet little pussy, tempting you with their saccharine scent and the promise of their tendrils’ embrace.");
	if(flags["AZRA_SEXED"] == undefined) output("\n\nYou can’t see it, but you can only assume h");
	else output("\n\nH");
	output("er asshole is placed in the classical position: nestled snugly between her voluptuous buttocks and sheltered beneath the swaying mass of her tail.");
	if(flags["AZRA_SEXED"] != undefined) output(" You’ve seen her naked enough to know that her golden skin fades to orange-red at the crinkled skin of her pucker.");
	azraMenu();
	addDisabledButton(0,"Appearance","Appearance","You're looking at her right now.");
}

//Talk
//Back:
public function azraTalk(back:Boolean = false):void
{
	clearOutput();
	showAzra();
	if(back) 
	{
		output("What else did you want to do?");
		azraMenu();
		return;
	}
	else if(pc.isBimbo())
	{
		output("<i>“I kinda wanted to talk and stuff.”</i> You ");
		if(pc.hasHair()) output("play with your hair while your brain catches back up to your lips.");
		else output("giggle to buy time for your brain to catch up with your lips.");
		output(" <i>“Uhh... lemme think of something to ask first.”</i>");
		output("\n\nAzra nods indulgently, watching you with a twinkle in her eye. <i>“Take your time.”</i>");
	}
	//Bro
	else if(pc.isBro())
	{
		output("<i>“Let’s talk,”</i> you rumble. After an awkward pause, you realize you should probably supply a question or topic. Fucking is so much simpler. <i>“One sec.”</i>");
		output("\n\nAzra bats her eyelashes and waits with rapt attention.");
	}
	//Nice
	else if(pc.isNice())
	{
		output("<i>“I just wanted to enjoy some company and conversation,”</i> you say.");
		output("\n\nAzra inclines her head in a slight nod. <i>“Of course.”</i>");
	}
	//Mischievous
	else if(pc.isMischievous())
	{
		output("<i>“One nice thing about being captain is nobody seems to mind when I barge into their quarters, trying to make small talk,”</i> you muse. <i>“I just have a few questions.”</i>");
		output("\n\nAzra nods agreeably. <i>“What sort of woman would I be if I didn’t repay your kindness in kind?”</i>");
	}
	//Hard
	else
	{
		output("<i>“There’s some talking to be done and some questions to be asked,”</i> you say.");
		output("\n\nAzra tilts her head quizzically. <i>“Certainly. It’d be my pleasure to educate you on my work.”</i>");
	}
	//[Her] [Her Job]
	processTime(1);
	clearMenu();
	addButton(0,"Her",talkToAzraAboutHer);
	addButton(1,"Her Job",talkToAzraAboutHerJorb);
	addButton(14,"Back",azraTalk,true);
}

//[Her Sex?]
public function talkToAzraAboutHerSex():void
{
	clearOutput();
	showAzra();
	output("<i>“So which sex are you? You don’t exactly strike me as a male, but that armor could be hiding quite a lot.”</i> ");
	if(pc.isNice()) output("You shrug apologetically. <i>“Not that it matters, but it’s good to know.”</i>");
	else if(pc.isMischievous()) output("You look at her crotch and waggle your eyebrows. <i>“Quite a lot.”</i>");
	else output("You openly glance at her crotch plate. <i>“A captain needs to know his crew.”</i>");
	output("\n\nAzra gives you a sly look. <i>“That’s a very personal question to ask, Captain Steele.”</i> She walks around you in a slow circle, a predatory glint in her eye. <i>“The sort of question you’d only ask if you were a bigot... or you meant to bed me.”</i> Her tail wraps around your leg. <i>“I doubt you’re a bigot. So the question is, does a little lady-cock put the kibosh on your romantic plans, or are you afraid to spend a night all alone with female genitalia?”</i>");
	output("\n\nYou shrug. <i>“You answer first.”</i>");
	output("\n\nAzra chuckles and steps back. <i>“I’m a hermaphrodite, if you must know, and my height isn’t the only thing rising above suula averages.”</i> She sits down in a chair, hands on her knees. <i>“But penis or not, I’ll have you know that I am a lady first and foremost. It’s the mind that makes a man or a woman, not what’s swinging between his or her legs. Now that I’ve answered your questions, why don’t you answer mine.”</i> She leans forward, chin on her knuckles, waiting.");
	output("\n\nBeing a hermaphrodite - great, okay, or weird?");
	flags["AZRA_SEX_KNOWN"] = 1;
	processTime(5);
	//[Great] [Okay] [Weird]
	clearMenu();
	addButton(0,"Great",talkToAzraAboutHerSexGreat);
	addButton(1,"Okay",talkToAzraAboutHerSexOkay);
	addButton(2,"Weird",talkToAzraAboutHerSexWeird);
}

//Great
public function talkToAzraAboutHerSexGreat():void
{
	clearOutput();
	showAzra();
	output("<i>“It’s great.");
	if(pc.isBimbo()) output(" Hot as hell! Dick to suck and pussy to lick; what more could I ask for?");
	else if(pc.isBro()) output(" More buttons to push.");
	else output(" You get to rock the best of both worlds.");
	output("”</i>");
	output("\n\nAzra smiles impishly. <i>“Good to hear, but you keep it in your pants for the time being.”</i>");
	if(pc.isCrotchExposed() && pc.hasGenitals()) output(" She glances at your completely exposed genitalia. <i>“Or at the very least, keep it at arm’s length. ");
	else output(" She keeps her gaze fixed firmly on your eyes. <i>“");
	output("I’m not the type of girl to hop in the sack just because a " + pc.mf("guy","girl") + " likes my sex organs.”</i> She wiggles her fingers at you. <i>“You’ll have to woo me for that. For now, why do you have anything else you’d like to ask me about? Something less personal, perhaps.”</i>");
	processTime(2);
	//[College] [Job] [Discoveries]
	clearMenu();
	addButton(0,"College",talkToAzraAboutCollege);
	addButton(1,"Her Job",talkToAzraAboutHerJorb);
	addButton(2,"Discoveries",talkToAzraAboutDiscoveries);
	addButton(14,"Back",azraTalk,true);
}

//Okay
public function talkToAzraAboutHerSexOkay():void
{
	clearOutput();
	showAzra();
	output("<i>“It’s okay. I wouldn’t say I’m thrilled about it, but It’s not going to crush my spirit or anything.”</i>");
	output("\n\nAzra nods. <i>“That’s a healthy attitude to have, especially considering I can bring more value to this crew than the mere presence of sexual organs.”</i> She smiles. <i>“Like my scientific mind and its potential discoveries. The rush a potential treasure trove of discoveries, both mundane and erotic!”</i>");
	output("\n\nShe sounded oddly thrilled about that.");
	processTime(1);
	//[College] [Job] [Discoveries]
	clearMenu();
	addButton(0,"College",talkToAzraAboutCollege);
	addButton(1,"Her Job",talkToAzraAboutHerJorb);
	addButton(2,"Discoveries",talkToAzraAboutDiscoveries);
	addButton(14,"Back",azraTalk,true);
}

//Weird
public function talkToAzraAboutHerSexWeird():void
{
	clearOutput();
	showAzra();
	output("<i>“I don’t like it,”</i> you admit. <i>“I don’t like it at all.");
	if(silly) output(" Peanut butter and jelly are better by themselves, not mixed together.");
	output("”</i>");
	output("\n\nAzra shrugs. <i>“Good thing nobody’s forcing you to go rooting around in my panties. If it’s that big a problem for you, you can drop me off at Mhen’ga, I guess.”</i> The disappointment is evident in her voice. She might have liked you... <i>“Did you need to know anything about my work, or are the prying personal questions enough for you?”</i>");
	processTime(1);
	//[College] [Job] [Discoveries]
	clearMenu();
	addButton(0,"College",talkToAzraAboutCollege);
	addButton(1,"Her Job",talkToAzraAboutHerJorb);
	addButton(2,"Discoveries",talkToAzraAboutDiscoveries);
	addButton(14,"Back",azraTalk,true);
}

//[Her]
public function talkToAzraAboutHer():void
{
	clearOutput();
	showAzra();
	//Bro
	if(pc.isBro()) output("<i>“What about you?”</i>");
	//Bimbo
	else if(pc.isBimbo()) output("<i>“So like, what about you?”</i>");
	//Else
	else output("<i>“I have some questions about you, actually.”</i>");
	//Merge
	output("\n\n<i>“Me?”</i> Azra leans back and gestures at her chest in disbelief. <i>“You want to know more about little ol’ me?”</i> Her sable lips take on a small smile, her cheeks flushing a richer gold than before. <i>“Very well. I’m an open book, so long as you restrain yourself to </i>proper<i> queries. I have heard of the sorts of hijinks you rushers get into out here, after all.”</i>");

	processTime(2);
	//[Her Race] [Her Job] [Her Age]  [Her Sex]
	clearMenu();
	addButton(0,"Her Race",talkToAzraAboutHerRace);
	addButton(1,"Her Job",talkToAzraAboutHerJorb);
	addButton(2,"Her Age",talkToAzraAboutAge);
	addButton(3,"Her Sex",talkToAzraAboutHerSex);
	addButton(14,"Back",azraTalk,true);
}

//[Her Race]
public function talkToAzraAboutHerRace():void
{
	clearOutput();
	showAzra();
	//Read Codex
	if(CodexManager.entryViewed("Suula") || flags["AZRA_RACE_TALK"] != undefined) 
	{
		output("<i>“You’re a suula, right? What’s that like?”</i>");
		//-conjoins into [Suula] talk.
		talkToAzraAboutSuula(true);
		flags["AZRA_RACE_TALK"] = 1;
		return;
	}
	//Talks about her race
	output("<i>“Well, what are you, exactly?");
	if(pc.isNice()) output(" I’ve never met anyone like you.");
	else if(pc.isMischievous()) output(" I think I’d remember a smile like yours.");
	else output(" Not everyday you meet a flying shark.");
	output("”</i>");

	output("\n\nAzra ");
	if(pc.isNice()) output("answers,");
	else if(pc.isMischievous()) output("blushes.");
	else output("rolls her eyes.");
	output(" <i>“I’m a suula, but if you prefer something simpler, you can call me a siren.  Just don’t expect me to burst into song. My daughters long ago disabused me me of any notion of talent.”</i>");
	flags["AZRA_RACE_TALK"] = 1;

	processTime(1);
	clearMenu();
	//[Suula] [Daughters] [Singing]
	addButton(0,"Suula",talkToAzraAboutSuula);
	addButton(1,"Daughters",talkToAzraAboutHerDaughters);
	addButton(2,"Singing",talkToAzraAboutSinging)
	addButton(14,"Back",azraTalk,true);
}

//[Suula]
public function talkToAzraAboutSuula(skippy:Boolean = false):void
{
	if(!skippy)
	{
		clearOutput();
		showAzra();
		//Skipped if repeated into:
		output("<i>“Is there anything you can tell me about what it’s like to be a Suula?”</i>");
	}
	//Merge
	output("\n\nAzra chuckles dryly, dragging her fingers through her hair while she gathers her thoughts. <i>“Tough to say? What’s it feel like to be a [pc.race]? Normal, I guess.”</i> She taps her chin with a finger. <i>“I get some odd looks from the odd sheltered ausar, even the occasional insult from an backwards terran.”</i> Ticking off her fingers, the suula begins to make a list of gripes. <i>“Then you have the idiots who think that my race’s reputation for polyamory means I’ll spread my legs at the first sight of dick. I won’t, and I don’t. If I do ever take another stud, it’ll be because he’s a man of worth and substance.”</i> Azra shakes her head. <i>“I doubt that’ll ever happen.”</i>");
	output("\n\nYou prod her for more information on her species. Surely she has something to share besides gripes!");
	output("\n\n<i>“Oh, well we’re amazing swimmers and half-decent fliers if I do say so myself. I’m a bit out of practice in the air, but I’m told I look more at home in the water than on the land. The wings are actually great for maneuverability - extra control surfaces, even if the extra drag will keep me from winning a race with any other aquatic species.”</i> Azra wraps her wings around herself and happily strokes them. <i>“They get in the way sometimes, but you can’t be the freedom they offer - or the aesthetics. More than once I’ve seen a nun equate me with an angel.”</i> She shakes her head disbelievingly. <i>“It’s hard to let them down once they get so excited.”</i>");
	processTime(4);
	clearMenu();
	//[Daughters] [Stud] [Religion] [Polyamory] [Her Sex]
	addButton(14,"Back",azraTalk,true);
	addButton(0,"Daughters",talkToAzraAboutHerDaughters);
	addButton(1,"Stud",talkToAzraAboutStud);
	addButton(2,"Her Sex",talkToAzraAboutHerSex);
}

//Daughters
public function talkToAzraAboutHerDaughters():void
{
	clearOutput();
	showAzra();
	output("<i>“");
	if(pc.isBimbo() || pc.isBro()) output("You have daughters?");
	else output("Could you tell me about your daughters?");
	output("”</i>");
	output("\n\nAzra sighs happily, a contented smile painted on her shark-like features. <i>“They’re the lights of my life. My two precocious little scamps. Just  blossoming into adulthood and yet willing to keep an eye on the house while Mom’s busy surveying the frontier.”</i> After a second, she produces a small holo of the pair of them. <i>“Jell is the taller one, and Kryz is the one with the grumpy look on her face. She never did like taking holos.”</i>");
	output("\n\nYou note that Jell isn’t just taller. She’s bigger all over: boobs, butt, and body curves in general. Kryz is no slouch either; beauty must run in the family. The dour sibling is sporting a punky hairstyle and rebellious-looking lip piercing, but with a little cleaning up she could easily pass for a model. <i>“");
	if(pc.isNice()) output("They look lovely.");
	else if(pc.isMischievous()) output("I can see where they got their good looks from their mother.");
	else output("Nice.");
	output("”</i>");
	output("\n\n<i>“They may not look it, but they’re twins. The greatest gift their stud ever gave me, One rest his soul, not that I buy that religion anymore.”</i> Azra clears her throat. <i>“He was a good suula. One of the best. If only he could see them now... Jell grow into amazing vocalist, Kryz... sweet Kryz. She’s still finding herself, but I’m sure that wit of hers will take her far, if she can tame it. I love them so much.”</i> Blinking rapidly to hide the formation of tears, the angel-winged xenobiologist shakes her head. <i>“Sorry, I think I may have gotten a little more emotional than this conversation calls for.”</i>");
	//Nice
	if(pc.isNice()) output("\n\nYou do your best to put her at ease. Family is an emotional topic for almost anyone.");
	//Misch
	else if(pc.isMischievous()) output("\n\n<i>“I don’t think you have to worry about anything like that around here, but you probably ought to worry about somebody trying to marry daughters.”</i> You’re surprised they aren’t married already.");
	//Hard
	else
	{
		output("\n\nYou shrug. <i>“So long as you’re upfront with me, I don’t give a ");
		if(!CodexManager.entryUnlocked("Rodenians")) output("rat’s");
		else output("rodenian’s");
		output(" puckered asshole.”</i>");
	}
	output("\n\n");
	if(pc.isNice()) output("Smiling warmly,");
	else if(pc.isMischievous()) output("Suddenly looking quite concerned,");
	else output("Nodding sharply,");
	output(" Azra looks deep in the thought. The conversation lulls. Is there something else you would like to ask her about?");

	processTime(10);
	flags["AZRA_DAUGHTER_TALK"] = 1;
	//[Stud] [Religion]
	clearMenu();
	addButton(14,"Back",azraTalk,true);
	addButton(0,"Stud",talkToAzraAboutStud);
	addButton(1,"Religion",talkToAzraAboutReligion);
}

//[Stud]
public function talkToAzraAboutStud():void
{
	clearOutput();
	showAzra();
	output("You ask her about her stud and why she chose that particular word.");
	output("\n\nRaising an eyebrow, Azra says, <i>“Well, in the human tongue, stud is the closest translation, though it’s more significant than that. A stud is more than a mere breeding partner, even if he shares his affection between more than a single woman. There is an aspect of bonded loyalty and the promise of support for any future children that may arise from the more physical aspects of intimacy. Absentee fathers are quite rare among my people, you see.”</i> Her significant breasts swell with pride. <i>“");
	if(pc.race() == "terran") output("You");
	else output("The");
	output(" terrans could learn a thing or two from us.”</i>");
	output("\n\n");
	if(pc.race() == "terran") output("You decide to let that one slide. ");
	output("<i>“What happened to him?”</i>");
	output("\n\n<i>“Pirates.”</i> Azra pauses, inhaling shakily. <i>“They ambushed the ship he was on, and he refused to get down and grovel with the rest of the passengers.”</i> She wipes at the corner of her eye before a tear can form. <i>“I’m told he prevented them from abducting a juvenile kaithrit. He fought the pirates long enough for the peacekeepers to show up on scanners and drive them. His wounds must have hurt him terribly, but... my Troktun died a hero.”</i> There’s no hiding the moisture leaking from her eyes now. <i>“I wish he hadn’t... but the man I loved, my stud... he would never sit idly by while a youngling was in danger.”</i>");
	//Bimbo
	if(pc.isBimbo()) output("\n\nYou sweep her up in a big, silent hug, instinctively comforting her with your body. No words could ever suffice, even if you were any good at putting them together.");
	//Bro
	else if(pc.isBro()) 
	{
		output("\n\n");
		if(pc.tallness < 9*12) output("It doesn’t matter that she’s taller than you, y");
		else output("Y");
		output("ou wrap a comforting arm around her and pull her into a firm, unyielding hug. She seems to melt against you, her body sagging limply into your hands.");
	}
	//Else non-hard
	else if(!pc.isAss())
	{
		output("\n\nYou put a comforting hand");
		if(pc.tallness >= 7*12) output(" on her shoulder");
		else output(" on her hip, since you can’t reach her shoulder");
		output(". <i>“I’m sorry.”</i>");
	}
	//Hard
	else output("\n\nTough break. You give her a comforting pat.");
	//Merge
	output("\n\nThe sighing shark pulls back after a moment. <i>“It’s all right. I’ve had plenty of years to come to terms with his passing. More than enough time for my daughters to start nagging me about going on a date.”</i> She laughs at that, making a trilling, surprisingly crisp sound of mirth. <i>“I guess it just goes to show how standards develop with age.”</i>");
	processTime(5);
	flags["AZRA_STUD_TALK"] = 1;
	clearMenu();
	//[Daughters (grayed out if came from Daughters)] [Date] [Age]
	addButton(14,"Back",azraTalk,true);
	addButton(0,"Daughters",talkToAzraAboutHerDaughters);
	addButton(1,"Date",askAzraOutOnADate);
	addButton(2,"Age",talkToAzraAboutAge);
}

//Date
public function askAzraOutOnADate():void
{
	clearOutput();
	showAzra();
	output("<i>“Why not go on a date with me?”</i>");
	output("\n\nIf you thought you had seen Azra blush before, the crimson hue suffusing her cheeks proves you haven’t, not really. She turns almost incandescent, her wings feathers visibly ruffling with shocked nervousness.");
	output("\n\n<i>“My presence here already imposes on you so much. A date would be too much,”</i> she says. <i>“Besides, we are strapped for time, are we not? If we delay too long, others will claim the juiciest research, and you will miss your chance for glory");
	if(9999 == 9999) output(" and fame");
	else output(", inheritance, and fame");
	output(". I will not let you miss a once in a lifetime opportunity, Captain [pc.name].”</i> Azra nods like someone who has worked tirelessly to convince herself of a difficult but necessary truth. <i>“But I’m open to dinner once we’ve both had time to settle down a bit, assuming you haven’t satisfied yourself on the fruits of the frontier.”</i> She waggles her eyebrows all too knowingly.");
	output("\n\nYou sputter for a response, sending Azra into uproarious laughter.");
	output("\n\n<i>“Just because I’ve had kids doesn’t mean I’ve forgotten how kids are made. A young adventurer like yourself is bound to get into more than a few trysts, especially one bold enough to date a woman twice [pc.hisHer] age.”</i>");
	var crewFucks:Array = [];
	if(annoIsCrew() && flags["ANNO_SEXED"] != undefined) crewFucks.push("Anno");
	if(kiroIsCrew() && kiroSexed()) crewFucks.push("Kiro");
	if(seraIsCrew()) crewFucks.push("Sera");
	if(syriIsCrew() && flags["FUCKED_SYRI_COUNT"] != undefined) crewFucks.push("Syri");
	if(reahaIsCrew()) crewFucks.push("Reaha");
	if(yammiIsCrew() && flags["SEXED_YAMMI"] != undefined) crewFucks.push("Yammi");
	if(pexigaIsCrew()) crewFucks.push("[pexiga.name]");
	if(shekkaIsCrew() && flags["TIMES_SEXED_SHEKKA"] != undefined) crewFucks.push("Shekka");
	if(crewFucks.length > 0)
	{
		output(" She gestures across the hall. <i>“And don’t think I don’t know what sorts of things you get up to with " + crewFucks[rand(crewFucks.length)] + ". The ability to please a partner is a very desirable trait in a mate.”</i> Her blush returns, though more muted on her confident smile. <i>“After the rush, [pc.name]...”</i>");
	}
	else output(" She smiles confidently. <i>“Surely you have questions besides my relationship status?”</i>");

	processTime(8);
	clearMenu();
	//[Age] [Daughters] [Polyamory?]
	addButton(0,"Age",talkToAzraAboutAge);
	addButton(1,"Daughters",talkToAzraAboutHerDaughters);
	addButton(2,"Polyamory?",talkToAzraAboutPolyamory);
	addButton(14,"Back",azraTalk,true);
}

public function kiroIsCrew():Boolean
{
	return false;//9999
}
public function shekkaIsCrew():Boolean
{
	return false;//9999
}

//Polyamory
public function talkToAzraAboutPolyamory():void
{
	clearOutput();
	showAzra();
	output("You probe for a little more information on polyamory and her race’s apparent take on it.");
	output("Azra grins wide at this, flashing a forest of dagger-sharp ivory. <i>“This is probably the first question most non-suulas ask about. I’ll give you credit for taking this long to get to it.”</i>");
	output("\n\n");
	if(silly) output("You decide not to point out that the game wouldn’t let you select it any earlier.");
	else output("\n\nYou shrug and explain that you just followed the conversation.");
	output("\n\n<i>“Well, suulas are a race with three sexes: males, females, and hermaphrodites. As you might imagine, a mix like that can make the dating scene pretty volatile. Not only are there boys and girls, there’s girl-boys in there with a little bit for everybody.”</i> Azra speaks as if explaining a basic fact of life. You suppose, to her, it is. <i>“So most of us wind up being at least a little bit bisexual, if not a lot, which almost invariably leads to having partners who can appeal to our varied interests. Boy meets girl meets dickgirl, or sometimes just boy meets a pair of very close twins.”</i>");
	output("\n\nYou point out that doesn’t really explain their penchant for polyamory, just bisexuality.");
	output("\n\n<i>“Be patient. I’m explaining.”</i> Azra boops you on the nose before continuing on. <i>“The other part of it is that we’re quite good at sharing our feelings, especially romantic feelings. When we’re attracted to someone, we get </i>really <i>attracted to them. Most suula are so good at it that they’re capable of feeling that way about more than one person at a time. Don’t get your hopes up too high, though. I’m not nearly as good at it as my schoolmates were.”</i> She shrugs. <i>“When I found my stud, I didn’t do anything but bury him in love, 26 Valderean hours a day, 456 days a year. I think I would’ve been okay with him having someone else, but I only had eyes for him, while I had him.”</i>");
	output("\n\n<i>“That’s a lot of love.”</i>");
	output("\n\nThe winged shark-girl sighs dreamily. <i>“It was... Someday I’m going to let myself feel like that again.”</i>");
	output("\n\nYou ask her how they keep from getting jealous.");
	output("\n\n<i>“We’re just wired differently than terrans and ausar I guess. Culture may play into it as well. To a suula, love and intimacy are these amazing, wonderful things that are meant to be shared. Why wouldn’t you want someone you love to feel even more of it? Terrans can be so greedy, wanting to keep the love all to themselves.”</i> Azra sighs. <i>“If your boyfriend or girlfriend has true affection for you, another lover isn’t going to stop them from caring about you. It isn’t a finite resource to be hoarded. It’s as limitless as the light from a star.”</i> She pauses, then looks you dead in the eye. <i>“And don’t even get into the mathematical energy output of the sun. I was being metaphorical.”</i>");
	output("\n\n");
	if(pc.hasHair() && pc.isBimbo()) output("You twirl your hair and giggle. That sounds a little too complicated to spend time worrying about.");
	else if(pc.isBro()) output("You grunt and shrug.");
	else if(pc.isNice()) output("<i>“I wouldn’t dream of it.”</i>");
	else if(pc.isMischievous()) output("<i>“I’d be more interested in watching a bunch of psionics argue over the energy content of love. Then we could bet on a winner.”</i>");
	else output("<i>“Sure.”</i>");
	output("\n\nAzra gives a wan smile. <i>“It means a lot that you’re so interested in my culture. Did you have any other questions, or should we get on with our adventures?”</i>");
	processTime(7);
	//[Her Stud] [Suulas] [Date]
	clearMenu();
	addButton(0,"Her Stud",talkToAzraAboutStud);
	addButton(1,"Suulas",talkToAzraAboutSuula);
	addButton(2,"Date",askAzraOutOnADate);
	addButton(14,"Back",azraTalk,true);
}

//Religion
public function talkToAzraAboutReligion():void
{
	clearOutput();
	showAzra();
	output("<i>“");
	if(pc.isBimbo()) output("So do you like, worship a god?");
	else if(pc.isBro()) output("Got a religion?");
	else output("Are you religious?");
	output("”</i>");
	output("\n\nAzra shakes her head slowly. <i>“Not anymore. I was when I was younger. Went to the Church of the One every two weeks alongside my mother and sire.”</i> She pauses, remembering. <i>“The religion came to our planet when we were uplifted, along with the stained glass, sermons, and hymns. It was the last part that most appealed to my people. Any opportunity to gather a crowd of us together and raise our voices in uplifting song was bound to be successful. Even someone like me, who can’t hold a tune to save her life, could lose herself in the shared masses.”</i>");
	output("\n\n<i>“But you aren’t religious any longer?”</i>");
	output("\n\nLeaning back, the armored scientist drags her fingers through her wavy copper hair. <i>“Not since I went to college. So much of what I was learning was at odds with the church’s dogma, and I could prove the science if I took the time to do the experiments. Faith gave me hope, but what use is hope it leads nowhere? Science... science gave me the ability to discover so much about the universe, and maybe change it for the better. In my first postgraduate year I did more for the universe isolating exotic toxin strains than my entire lifetime of prayers.”</i>");
	output("\n\n<i>“Wow.”</i>");
	output("\n\nHer eyes light up as she comes out of her memories at lightspeed. <i>“Yeah... I don’t do the religion thing any longer, and I didn’t bother doing it with my daughters. We took the time to do some home science experiments instead. Best choice I ever made.”</i> Azra pulls out her codex, and after a minute, pulls up a holo-video of her two daughters performing simple light refraction experiments. <i>“They were so cute back then...”</i> She goes silent, watching her children.");
	output("\n\nDid you want to ask her about anything else?");
	processTime(5);
	clearMenu();
	//[Daughters] [Her College] [Singing]
	addButton(0,"Daughters",talkToAzraAboutHerDaughters);
	addButton(1,"Her College",talkToAzraAboutCollege);
	addButton(2,"Singing",talkToAzraAboutSinging);
	addButton(14,"Back",azraTalk,true);
}

public function talkToAzraAboutSinging():void
{
	clearOutput();
	showAzra();
	output("<i>“");
	if(pc.isBimbo()) output("Aww, I bet your singing is adorable.");
	else if(pc.isNice()) output("You don’t like singing?");
	else if(pc.isMischievous()) output("Not much of a vocalist, eh?");
	else output("Lots of people suck at singing. No biggie.");
	output("”</i>");
	output("\n\nAzra vigorously shakes her head. <i>“I’m supposed to be good at it, right? One of the vaunted space sirens who can lure interstellar travellers into doing my bidding by dint of melody alone.”</i> She blows a puff of exasperated air into her bangs. <i>“No such luck for this suula. I used up my winnings in the genetic lottery elsewhere and forgot to save enough for basic vocal talent.”</i> Tugging on her chest armor, Azra sighs heavily. <i>“I could’ve done with a little less up top, I guess. Shopping for armor when you’re as... er... voluptuous as myself can be a little challenging. ");
	if(pc.biggestTitSize() >= 40 || pc.biggestCockLength() >= 30) output("I can only imagine your struggles. ");
	output("I had to special order this one.”</i>");
	output("\n\n");
	if(pc.isBimbo()) output("She totally chose right.");
	else if(pc.isBro()) output("Boobs are always a good choice.");
	else output("You use the opportunity to take a gander at her sizeable chest. She’s definitely smuggling an enormous rack in there");
	if(flags["AZRA_SEXED"] != undefined) output(". You know it all too well.");
	else output(", but it’s hard to learn any more with the layered plates of ceramic and metal pressing down on everything.");
	output(" <i>“You ever try a coach?”</i>");

	output("\n\n<i>“Tons.”</i> Azra rolls her eyes. <i>“They deemed me tone-deaf, unteachable, or somehow disabled.”</i> She folds her arms angrily across her chest. <i>“Just because I struggle to tell the difference between a C-sharp and a B-flat doesn’t mean something is wrong with me.”</i> She visibly shivers in irritation. <i>“At the worst, I suppose I may have some sort of musical learning disability, but that is hardly an excuse for the drubbing my teachers gave me. I would have gladly learned an instrument. A device sculpted by mathematical principles to produce certain tones on keypress? That I could work with. Instead, I suffered through years of wasted lessons.”</i>");
	output("\n\nYou utter a sympathetic, <i>“Yeesh.”</i>");
	output("\n\nAzra nods. <i>“No kidding. But that’s how life is sometimes. Maybe I wouldn’t have been as driven to pursue science all the way into college if I didn’t have such a high profile failure hanging over me, but...”</i> She shrugs helplessly. <i>“At least my daughters came out perfect. Neither has any issues with music. I couldn’t have asked for two better song-birds, Jell especially. She could sing the wings right off an angel.”</i>");
	output("\n\nYou look at Azra’s feathery wings and raise one eyebrow.");
	output("\n\nSeeing your expression, the tall winged woman colors slightly. <i>“I guess our species must have done that a few millenia back, huh? I’d tell you more, but there isn’t more to tell. I let my science do the singing.”</i>");

	processTime(8);
	clearMenu();
	//[Daughters] [College][Suula]
	addButton(0,"Daughters",talkToAzraAboutHerDaughters);
	addButton(1,"College",talkToAzraAboutCollege);
	addButton(2,"Suula",talkToAzraAboutSuula);
	addButton(14,"Back",azraTalk,true);
}

//College
public function talkToAzraAboutCollege():void
{
	clearOutput();
	showAzra();
	output("<i>“Where’d you go to college at?”</i>");
	output("\n\n<i>“");
	if(!silly) output("Saint Benrard’s Institute of Science and Technology");
	else output("Saint Bernard’s School for Good Girls");
	output(". One of the top schools back on Valdera, our homeworld. It used to be exclusively an all-girl’s college a few decades ago, but they opened it up to all sexes a few decades back as part of an initiative to level the playing field for males and hermaphrodites.”</i> Azra flashes her teeth. <i>“I can’t believe we did something so primitive this century. It’s the sort of thing you’d read about terrans doing millenia ago, not something any space-faring race should  be bothered by.”</i>");
	output("\n\n");
	if(pc.isBimbo()) output("You suggest that it might have been really hard to think with a bunch of yummy cocks around.");
	else if(pc.isBro()) output("You suggest that the boys might have found it hard to think of anything but all that sweet sweet shark tail.");
	else output("You suggest that they may have been trying to keep focus squarely on learning.");

	output("\n\nAzra rolls her eyes. <i>“We all have urges, and they don’t go away. Better to learn to handle yourself around the other sexes during training than on an actual job. Lastly, bisexuality and polyamory are quite common among my people. Even for a group composed of pure females, study sessions would be temptation enough for sapphic orgy, were certain individuals inclined.”</i>");

	//Bro/Misc:
	if(pc.isBro() || pc.isMischievous()) output("\n\n<i>“More like </i>reclined<i>, amirite?”</i> you put your hand up for a high five that never comes, but you swear you see the barest hint of a smile working to spread across Azra’s features.");
	//Else
	else output("\n\n<i>“Oh. I should’ve gone to suula school.”</i>");
	//merge
	output("\n\n<i>“...Right. Student orgies aside, Saint Benrard’s provided me with the best education one could ask for. The facilities were top notch, the professors highly intelligent individuals who were publishing groundbreaking work on a daily basis. The xenobiology department, where I spent most of my time, was particularly impressive.  More than one commercial gene-mod exists solely because of my professors’ work.”</i> Azra’s chest puffs up, and her wings lift slightly with pride. <i>“I switched my major from biology to xenobiology by my second year, and the rest is history, I guess. I made some contacts at a few leading genetic modification companies by the time I graduated - near the top of my class, by the way.”</i> Azra grins. <i>“Since then I’ve worked on identifying and isolating useful genetic structures to sell to whichever company wants to pay best for them.”</i>");
	output("\n\nYou congratulate her on her good choices.");
	output("\n\nAzra returns a self-deprecating shrug. <i>“I guess. Signing up with Xenogen on a permanent basis would’ve paid so much better. I could be retired by now, if all I cared about was credits, but then I wouldn’t have had time to spend with my daughters, let alone the ability to put down roots wherever I felt the urge, or run off alongside a " + pc.mf("handsome","fabulous") + " rush captain in an attempt to claim the choicest discoveries.”</i>");

	//[Job][Daughters][Date]
	processTime(8);
	clearMenu();
	addButton(0,"Job",talkToAzraAboutHerJorb);
	addButton(1,"Daughters",talkToAzraAboutHerDaughters);
	addButton(2,"Date",askAzraOutOnADate);
	addButton(14,"Back",azraTalk,true);
}

//[AGE]
public function talkToAzraAboutAge():void
{
	clearOutput();
	showAzra();
	output("<i>“");
	if(pc.isBimbo()) output("You look really good for whatever your age is. Total hottie!");
	else if(pc.isBro()) output("How old are you?");
	else if(pc.isNice() || pc.isMischievous()) output("How old are you? Not that old, I wager. You don’t look a day over twenty.");
	else output("Just how old are you?");
	output("”</i> You peer closer at your suula crewmember, daring her face to give you a clue.");

	output("\n\nAzra leans close to you, close enough for to get a good look at the texture of her inky lips as she replies, <i>“Old enough to be your mother and a little more. Old enough one of my daughters could have babysat you.”</i> She ");
	if(pc.hasHair()) output("ruffles your [pc.hair] affectionately");
	else output("playfully punches your shoulder");
	output(". <i>“Suulas don’t wrinkle up like a raisin, as old terrans might. We have a longer natural lifespan too, which helps. Having the ability to live well over 120 years without medicinal help is a nice little perk. I could hit four or five centuries if had the billions for top-end juvination treatments, but I think two will be just fine.”</i>");
	output("\n\nYou point out that she didn’t directly answer your question.");
	output("\n\nSmiling knowingly, Azra says, <i>“Oh, didn’t I? I could have sworn I gave you a fantastic answer.”</i>");
	output("\n\nYou tap your [pc.foot].");
	output("\n\n<i>“Oh the impatience of youth,”</i> the shark-woman groans theatrically. <i>“If you must know, I’m 47 terran standard years old, just now hitting my prime.”</i> She flexes a bicep. <i>“I’m stronger than I’ve ever been and just as quick-witted, so don’t even think about ordering me some prune juice and dropping me off at a retirement planet.”</i> Azra playfully waggles a finger at you. <i>“I won’t have it. And prune juice tastes nasty. Now, do you have anything to ask me that isn’t about how I’m twice your age?”</i>");
	processTime(9);
	//[Suulas] [Daughters]
	clearMenu();
	addButton(0,"Suulas",talkToAzraAboutSuula);
	addButton(1,"Daughters",talkToAzraAboutHerDaughters);
	addButton(14,"Back",azraTalk,true);
}

//[Her Job]
public function talkToAzraAboutHerJorb():void
{
	clearOutput();
	showAzra();
	output("<i>“What can you tell me about your job?”</i>");
	output("\n\nAzra says, <i>“For starters, it’s not what most would consider a job. I don’t have a boss. I don’t clock in anywhere or hang around a watercooler talking about the latest gravball match. It sounds pretty great, I’m sure.”</i>");
	output("\n\nYou nod emphatically.");
	output("\n\n<i>“But I’m my own boss. That means I have to make myself do my work without any external pressure. I have to get up every morning and force myself to sit down and peel apart genomes instead of catching the latest episode of The Youthful and Sleepless. If I slack off, I hurt myself and have noone else to blame. Not that different from being a captain out on the rush, I imagine.”</i> Azra nods to you. <i>“Not everybody can do it.”</i>");
	output("\n\nYou agree but ask her if she can give you more specifics, more details on the exact kind of work she does.");
	output("\n\n<i>“Oh, well I used to work at home, buying exotic plant samples to study in hopes of finding valuable mutations, enzymes, and the like. People will sell you almost anything on the extranet if you know where to look.”</i> Azra gestures to her codex. <i>“I’d spend most of my day hunched at my workstation, pouring over holoscreens filled with genetic data and computer simulations trying to unravel the secrets of alien life. It’s almost as much art as science, puzzling out the relevant genes and how to best recode the sequence for use in other plants or animals. The latter part is usually done by the scientists at Xenogen, JoyCo, or another biotech firm, but I dabble.”</i>");
	output("\n\n<i>“How do you get paid?”</i>");
	output("\n\nAzra idly spins her pointer finger in a circle. <i>“I have contacts at most of the major firms ever since college. I take my research, and pitch a watered down version of my findings, then see who will pay me the most for it. JoyCo tends to try to lowball me most of the time, but they’ll always offer something. Xenogen’ll typically pay the best, but they’re picky about what they’ll take. I imagine they try to match my findings to a project in development, and if there isn’t one, back off.”</i>");
	output("\n\n<i>“Not bad.”</i>");
	output("\n\n<i>“Not at all,”</i> the golden-skinned woman agrees. <i>“It’s not as much as I might make being a full-time scientist for Xenogen, but I’m able to work at my own pace, on my own schedule, at a place of my choosing.”</i> She spreads her arms wide, fingers pointing at your ship. <i>“And I get to load up all my gear and go on a real life Planet Rush! Sure, this armor ate up most of my rainy day fund, but this is a once in a lifetime opportunity. I’m going to be documenting dozens of new species, maybe even whole new types of life!”</i>");
	output("\n\nHer enthusiasm is so infectious you find yourself grinning right back along with her.");
	output("\n\n<i>“[pc.name], thanks to you I’m going to get my name in the next generation’s science textbooks and hopefully make enough to retire on in the process.”</i> She closes her arms around you in a big hug. It’d feel nicer if it wasn’t for the hard corners of her armor digging into your [pc.skinFurScales]. <i>“So thank you. Thank you so much.”</i>");
	if(pc.tallness < 70) output(" She drops you back to the deck, careful not to let you fall too far.");
	else output(" She releases you after a moment, blushing.");
	output(" <i>“Did you have any other questions you wanted to ask me?”</i>");
	processTime(7);
	//[College] [Discoveries]
	clearMenu();
	addButton(0,"College",talkToAzraAboutCollege);
	addButton(1,"Discoveries",talkToAzraAboutDiscoveries);
	addButton(14,"Back",azraTalk,true);
}

//Discoveries
public function talkToAzraAboutDiscoveries():void
{
	clearOutput();
	showAzra();
	output("<i>“Have you made any particularly amazing discoveries?”</i>");
	output("\n\nAzra scratches the back of her neck. <i>“Uhh... well I guess so.”</i>");
	output("\n\nYou tilt your head, waiting for more.");
	output("\n\n<i>“Oh...”</i> Azra blushes sheepishly. <i>“You want to know what it was?”</i>");
	output("\n\n<i>“Of course.”</i> You gesture imploringly. <i>“Come on.”</i>");
	output("\n\nShe lets out an enormous sigh. <i>“Okay, well the biggest one is a plant-derived elasticizing agent... and lubricant.”</i> Her blush deepens to a sunset crimson. <i>“It comes from a carnivorous plant that used it to aid in consumption of larger prey... which makes it ideal for helping partners of vastly mismatched sizes make... things... fit.”</i> She shrugs. <i>“It’s everywhere nowadays. I’m told it’s particularly popular with laquines and leithans, especially those with terran lovers. The terran vaginal canal is renowned for its lack of flexibility.”</i> She forces a cough. <i>“It uh... goes by Peggy’s Elasticizing Oil nowadays. I didn’t get to pick the name, or the branding. I just... uh... figured out the genetics and the use for it.”</i>");
	output("\n\nYou quizzically tilt your head. <i>“");
	if(pc.isBimbo()) output("Somebody’s mind is in the gutter!");
	else if(pc.isNice()) output("I didn’t expect you’d go there with it.");
	else if(pc.isMischievous()) output("Brilliant </i>and<i> dirty mind. I like it.");
	else output("All that scientific training... and your first thought was fucking?");
	output("”</i>");
	output("\n\nAzra stammers for a second, then stops, straightening her back and collecting herself. When she resumes speaking, it is with poise and a small smile. <i>“We’re all sexual creatures here, Captain [pc.name]. You, me... and most of the galactic populace. Even the galotians, creatures which merely divide, have come to enjoy sensuous acts. I have no more reason to be ashamed of my lewder discoveries than the universe does for giving birth to protein feeders in the first place. There are whole phylums of plants designed entirely around exploiting the reproductive instincts, behaviors, and fluids of animals.”</i> Her blush returns. <i>“I for one find such behaviors... fascinating.”</i>");
	output("\n\nAs if you could judge her. <i>“");
	if(pc.isBimbo()) output("That’s awesome. Think you can find me sexy plants that like to fuck as much as I do?");
	else if(pc.isBro()) output("Sweet. Lemme know if you find some plants to fuck.");
	else output("So you’re out on the rush looking for plants like that?");
	output("”</i>");
	output("\n\nAzra bites her lip but nods. <i>“Sure. I’ve been polling the extranet for reports on interesting possibilities. No matter where you go, I bet I can find something interesting or useful to research, or...”</i> A flash of lust crosses her features as she raises her fingers in air quotes, <i>“Research.”</i> This time, she winks, though it’s awkward enough that you can tell it’s not a gesture she makes frequently.");
	if(pc.libido() < 33) output("\n\nYou give her a neutral nod back.");
	else if(pc.libido() < 66) output("\n\nYou try not to show the thrill the idea gives you.");
	else output("You answer with a lewd smile. You’re down for that kind of 'research.'");
	output("\n\n<i>“I doubt my college professors expected I would spent so much time investigating plants that fuck the ever-loving shit out of their victims so many years ago, but they’d damn sure give me an A+ for my quality of work.”</i> Azra flashes her teeth at you. <i>“Maybe you could lend me a hand. Sometimes it pays to have a research assistant. Speaking of which... when we’re on a rush planet, maybe you could escort me on an expedition. This armor is great, but I’d feel a lot safer with someone to have my back.”</i>");

	processTime(10);
	clearMenu();
	//[College][Date]
	addButton(0,"College",talkToAzraAboutCollege);
	addButton(1,"Date",askAzraOutOnADate);
	addButton(14,"Back",azraTalk,true);
}

//Leave Crew
public function talkToAzraAboutLeavingTheCrew():void
{
	clearOutput();
	showAzra();
	output("<i>“I’m going to need to free up some space on the ship. Do you have somewhere you can stay?”</i>");
	output("\n\nAzra sighs. <i>“I knew this day would come. ");
	if(getPlanetName() != "Mhen'ga") output("I think I can find my way to Mhen’ga on my own, I guess.");
	else output("Thanks for dropping me on Mhen’ga.");
	output(" Finding lodging there should be cheap enough, and the biological diversity will keep me busy for a few months, at least.”</i> She begins packing up her workstation. <i>“If you’re in the neighborhood and need a girl who knows her way around plants, you’ll be able to find me.”</i>");
	output("\n\nShe pats you on the shoulder on her way out the door.");
	processTime(3);
	flags["AZRA_ONBOARD"] = undefined;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Rejoin Text
public function azraMhengaHook():void
{
	if(azraRecruited() && !azraIsCrew())
	{
		output("\n\nAzra the suula xenobiologist is here, studying a clipping from a Mhen’gan vine with a bored look on her face.");
		addButton(0,"Azra",approachCrewButNonCrewAzra);
	}
}

//Approach
public function approachCrewButNonCrewAzra():void
{
	clearOutput();
	showAzra();
	output("You greet Azra.");
	output("\n\n<i>“Oh, hey Captain. Got room for me back onboard? Frontier science is hard to pull off by yourself.”</i> The nine-foot tall shark-girl stands up and brushes herself off, hopeful.");
	processTime(1);
	clearMenu();
	//[Yes] [No]
	addButton(0,"Yes",yesAzraRejoinMuhCrew);
	addButton(1,"No",noAzraStayOnMhenga);
}

//Yes
public function yesAzraRejoinMuhCrew():void
{
	clearOutput();
	showAzra();
	output("Sure.");
	output("\n\n<i>“Excellent!”</i> Azra pulls you into a hug made far less comforting by her hard-edged armor, then lets go to gather her things. <i>“Same deal as before. I’ll be all but invisible, unless you need me. Come find me if you need anything.”</i>");
	output("\n\nAzra walks off a brisk pace, pumping a fist in the air victoriously.");
	processTime(2);
	flags["AZRA_ONBOARD"] = 1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//No
public function noAzraStayOnMhenga():void
{
	clearOutput();
	showAzra();
	output("<i>“Not at the moment.”</i>");
	output("\n\n<i>“Shucks.”</i> Azra sighs. <i>“Well, I’ll be here working if you change your mind.”</i> She buries herself back in her work, trying her best to conceal her visible disappointment. The poor girl really wanted to join you on your adventures.");
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}