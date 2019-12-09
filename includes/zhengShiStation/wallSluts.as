//Yay, written by Adjatha!

//Notes
//Run by Cyber Punks? Some cyber dealie to keep ‘em pacified maybe,
//Nominal credit charge for occupants (maybe one with their price tweaked to ‘free’ for extra degradation) or buy a “Puss Pass” key item to skip the payment prompt.
//holo pics of the occupants on each stall
//If enough stalls are added, put an ‘availability’ time span on them, where somebody else is using the stall. Possibly add opportunities where you can interact with a pirate who is using one of the stalls during this ‘down time’.
//
//Suggestions:
//- rodenian earfucks, has shallow vibe plugs in both ears passively,
//- rahn tit fucks: HUGE milf girl, anti-morph collar, no mouth, huge areola, pussy nips, several time slots where a various pirate is using one tit and the player can take the other (contest to fill asymmetrically, bro-down, ?)
//- kui-tan with huge balls, fuck his ass and plap balls, take him ass to ass and plap balls, visited by slyveren w/ bubble buddy who wants to have the two of you frot into mega bubbles
//- dzaan alpha with hefty, low-hanging balls and ass plug for pussy-only fucks. Has bubble buddy on her ladder-pierced cock and a collection basket under to gather her climaxes (player can collect/buy alpha bubbles to add gain extra strength lust dmg bubble projectile weapons?)
//- Vem easter egg (via Delita on HF), body writing prompt, pregnant w/ pussy plug
//- Laquine, former jumper, punished/kicked out and cum-dumpified
//- Human female with huge horsecock. Has a basket of condoms next to her and a cum-tank w/ tube going into her ass, can rawdog her pussy or use condom and toss it into the tank to help fill up her gut
//- Ovir on the wall with huge pussy lips, fuck her butt and her big gigantic ovir dick pops out of the cloaca and spunks all over you. Fuck her in the cloaca for the ultimate power move


/*================HER FLAGS===============================
CHERRY_HER_PLACE_INVITED_NORMAL	Ever seen her room invite event with the "Cherry Bomb" joke.
CHERRY_SMALL_BUBS				Small bubbles gifted
CHERRY_MEDIUM_BUBS				Medium bubbles gifted
CHERRY_LARGE_BUBS				Large cum bubbles gifted
CHERRY_HUGE_BUBS				Huge cum bubble gifts
CHERRY_TOTAL_BUBBLE_GIFTS		Total number of bubbles gifted
CHERRY_LAST_BUBBLE_GIFT			0 = small, 1 = med, 2 = large, 3 = yuge.

STATUS:
Cherry_In_Room					Denotes that Cherry is in her room, masturbating or something and
								Molli is running the shop.
Cherry_Internal_Cum				Tracks the size of the biggest cumload Cherry has had in the past
									24 hours. New cumshots can refresh the duration.
									NOTE: You cannot cumflate by repeated small blasts. Need 1 big
									huge one due to the way she's set up.
*========================================================*/
/*================rodenian pair FLAGS===============================
WALLSLUTS_NOISY_RODENTS_NUTTED			times fucked their earginas
WALLSLUTS_NOISY_RODENTS_NUTTED_TS		timestamp when fucked their ears
WALLSLUTS_NOISY_RODENTS_NUTTED_TS2		timestamp last cum update
WALLSLUTS_NOISY_RODENTS_NUT_CHOICE		where did you nut last time 0/never/1 Walnut, 2 Chestnut, 3 Both
WALLSLUTS_NOISY_RODENTS_WALNUTTED		times came in Walnut
WALLSLUTS_NOISY_RODENTS_CHESTNUTTED		times came in Chestnut
WALLSLUTS_NOISY_RODENTS_WALNUT_CUM		volume of cum in Walnut
WALLSLUTS_NOISY_RODENTS_CHESTNUT_CUM	volume of cum in Chestnut

*========================================================*/


public function feedCherry(arg:Number = -1):void
{
	if(arg == -1) arg = pc.cumQ();
	//If doesn't exist yet, set it uuuuup.
	if(!pc.hasStatusEffect("Cherry_Internal_Cum")) 
	{
		pc.createStatusEffect("Cherry_Internal_Cum",arg);
		pc.setStatusMinutes("Cherry_Internal_Cum",24*60);
	}
	//Add and math if she's already got cummies.
	else
	{
		//Big cumshots last 24 hours.
		if(arg >= 10000) pc.setStatusMinutes("Cherry_Internal_Cum",24*60);
		//Non ginormous cumshots last proportionally.
		{
			//Get a % of the threshold for cumflation and convert that to extra minutes
			var newMinutes:Number = 60*24 * arg/10000;
			var oldMinutes:Number = pc.getStatusMinutes("Cherry_Internal_Cum");
			//Add newminutes + current minutes. If over max, set max. If under, set.
			if(newMinutes + oldMinutes >= 60*24) pc.setStatusMinutes("Cherry_Internal_Cum",24*60);
			else pc.setStatusMinutes("Cherry_Internal_Cum",(oldMinutes+newMinutes));
		}
		//Jizz isn't actually added - we're just comparing the biggest individual loads. No cumflating via lots of tiny shots (to match Adj's text).
		//So instead we just track the biggest cummies.
		if(pc.statusEffectv1("Cherry_Internal_Cum") < arg) arg = pc.statusEffectv1("Cherry_Internal_Cum");
	}
}

public function showCherry(nude:Boolean = false):void
{
	showBust(cherryBustString(nude));
	showName("\nCHERRY");
}
public function cherryBustString(nude:Boolean = false):String 
{
	if(cherryCumflated()) return "CHERRY_CUMFLATED";
	return ("CHERRY" + (nude ? "_NUDE":""));
}
public function molliBustString():String 
{
	return "MOLLI";
}
public function cherryCumflated():Boolean
{
	return (pc.statusEffectv1("Cherry_Internal_Cum") >= 10000);
}
public function sendCherryToHerRoom():void
{
	if(!pc.hasStatusEffect("Cherry_In_Room")) pc.createStatusEffect("Cherry_In_Room");
	pc.setStatusMinutes("Cherry_In_Room",4*60);
}
public function cherryCapacity():Number
{
	return 3000;
}

//Cherry’s Tap-Hall
public function cherryTapHallBonerBonus():Boolean 
{
	showCherry();
	author("Adjatha");
	//First Time:
	if(flags["MET_CHERRY"] == undefined)
	{
		flags["MET_CHERRY"] = 1;
		output("A huge neon sign announces that you’re entering ‘Cherry’s.’ As you step into the market-style hall, the first thing that hits you in this room is the faint scent of cherry perfume. The second is ");
		if(pc.hasCock())
		{
			if(!pc.isErect()) output("the raging, rock-hard erection that springs up from your loins. It’s like your [pc.cocks] " + (pc.hasCocks() ? "have":"has") + " been kicked into overdrive and the tidal rush of blood leaves you faint-headed.");
			else output("the bass-like vibrations thrumming inside your [pc.chest], stoking the flames of your burning need to breed.");
		}
		else if(pc.hasVagina()) output("the heavy, moist need that thrum inside your loins. Your breath comes in short gasps and your head swims as your [pc.vaginas] drool" + (!pc.hasVaginas() ? "s":"") + " with impatient thirst.");
		else output("a blossoming warmth spreading across your face. It’s as if an insistent heat is being stoked within you, drawing lurid desires by simple proximity.");
		output(" Casting about for the source of this sudden, uncontrollable lust, you spy a battery of hefty, LED-lit machines that vibrate with a low, steady thump that seems to shake the air inside your lungs.");
		output("\n\nNone of the other figures filtering through the corridor seem alarmed by the machines, so you move to investigate just what’s going on for yourself. The dark, textured cylinders look " + (pc.isBimbo() ? "like person-sized, fuzzy dildos":"almost like omni-directional subwoofers") + ". A small pink-on-black placard mounted above them reads: <i>“Aural Stimulation Speakers provided compliments of the Cyber Punks.”</i>");
		output("\n\nThe mystery of your vibration-fed libido may have temporarily distracted you, but once you have a moment to survey the whole room, the purpose of the arousal engines becomes clear. The left wall of the hall is laden with a host of hardlight partitions, dividing the long chamber into a series of shallow compartments. The primary occupants of these stalls are humanoid figures mounted halfway through the wall by cushioned ovals. Some have their lower halves hanging out, bare legs fidgeting in place. Others have been bound the opposite way, their upper halves exposed and defenseless. There seems to be a few who are almost entirely hidden from view, folded in half so that only their ass and abdomen jut out like a pair of ripe hemispheres. Strapped in and utterly at the mercy of whomever might pay them a visit, you’d expect these victims to be struggling for their freedom, but their languid, writhing movements and heated, whimpering moans suggest otherwise.");
		pc.lust(75);
		clearMenu();
		addButton(0,"Next",meetCherriesPart2);
		return true;
	}
	//Repeat:
	else
	{
		if(pc.hasStatusEffect("Cherry_In_Room")) output("(<b>Debug text:</b> Ordinarily, Molli would be running the store while Cherry is in her room... but Molli isn’t done yet. So enjoy Cherry!)\n\n");
		output("The cloying scent of Cherry’s bio-chemical perfume wafts around you as the throbbing, subliminal vibrations of the Cyber Punks’ lust generators fill you once more. Your libido kicks into overdrive just by walking the length of the Tap-Hall. The wall of public use sluts is as popular as ever, but there are still plenty of unoccupied stalls.");
		//is lust is not at least 30, set lust to 30
		pc.lust(75);
		clearMenu();
		addButton(0,"Wall Sluts",pickWallSlut,undefined,"Wall Sluts","Take a gander at the wares on display.");
		return false;
	}
}

public function pickWallSlut():void
{
	clearOutput();
	showCherry();
	author("Fenoxo");
	output("Which wall-slut would you like to use? Or would you rather talk to Cherry?");
	//[Cherry] [Black Dragoness] [Double Booty] [Thick Goblin] [Leave] 
	// After using a wall-slut, deactivate their option for 2 hours (to let the staff clean up)
	pickWallSlutMenu();
}

public function meetCherriesPart2():void
{
	clearOutput();
	showCherry();
	author("Adjatha");
	output("The only figure who doesn’t seem to be examining or using the merchandise is a ruby red zel’rahn who leans against the far wall. Though she’s mostly nude, what draws your attention are the large, cybernetic legs she’s poured herself into. Catching your look, she shifts upright, the servos in her robotic lower half whirring to life as she stomps toward you, her torso wobbling like gelatin on vibrator.");
	output("\n\n<i>“You look new,”</i> she murmurs, eyes dipping to groin level. <i>“Not bad. Right then, the pitch. I’m Cherry and this is my Tap-Hall. You step up to a compartment, pay the price, and debauch.”</i> She gestures expansively, sending her chest jiggling.");
	output("\n\nAs she talks, your nose fills with a fruity perfume that makes your mouth water. Heedless of her effect on you, she pushes on. <i>“Anybody in the wall is fair game, but respect the bio-plugs - some of their owners like keeping certain holes on a VIP basis, yeah? The prices are set by whoever rented the hole in the first place, so don’t come to me for a discount.”</i>");
	output("\n\nShe folds her arms under her chest, sending fresh ripples through all the non-cybernetic bits. <i>“There’s also a Puss Pass for regulars. Everything gravy? Cool, on your way then.”</i> She shoos you toward the booths and goes back to leaning against the wall and watching her customers enjoy themselves.");
	output("\n\nSome of the nooks are currently in use while other, recently used captives still have ivory cream leaking from between their legs. An exceedingly chubby, pink galotian in a white collar oozes happily along, cleaning up after the patrons as best she can. The janitor, apparently.");
	processTime(5);
	clearMenu();
	//[Cherry] [Black Dragoness] [Double Booty] [Thick Goblin] [Leave]
	pickWallSlutMenu();
}

//[Cherry]
public function goForCherryStuff():void
{
	clearOutput();
	showCherry();
	author("Adjatha");
	if(!cherryCumflated()) output("The rahn as red as her namesake appears to be watching clients with a tireless interest. At your approach, she tilts her head sideways until her narrow, elfin ear touches her shoulder. <i>“What’s jigglin’, new meat?”</i>");
	else output("Swollen with more spunk than even a rahn can digest at once, Cherry still somehow manage to affect an attitude of detached interest.");
	//[Appearance] [Puss Pass] [Talk] [Give Bubble] [Bubbled] [Leave]
	cherryMenu();
}

//[Appearance]
public function cherryAppearance():void
{
	clearOutput();
	showCherry();
	author("Adjatha");
	output("Like most of her kind, the rahn is well sculpted and curvaceous in all the wickedest ways. This gel girl, however, has poured her legs up to the peak of her thighs into a pair of white, cybernetic legs shaped vaguely like set of armored, high-heeled boots. Besides those, she’s wearing precious little in the way of clothing. There’s a double-banded collar around her neck and a thick white band around her ‘hair’ giving her a crimson ponytail nearly as long as she is tall. It could be your imagination, but the ponytail almost seems to wags like a tail at your presence. A glowing VR visor perched just below her eye level gives her slender face a neon underlight.");
	output("\n\nHer globular breasts would be E-cups on an organic woman, but she’s sculpted them without nipples, giving her a slightly more professional appearance. She wears a pair of thick, waterproof gloves on both hands and an even thicker lacquer of glossy black lipstick on her plush lips.");
	if(!cherryCumflated())
	{
		output("\n\nHer only other adornment is a thin, loose-fitting belt draped over one curvaceous hip. Attached to the belt by loops are a series of multicolored, golf ball-sized latex orbs");
		//player has bubble buddy:
		if(checkToyDrawer(BubbleBuddy)) output(" that you recognize as filled Bubble Buddy condoms");
		output(".");
		//if player has given Cherry small bubbles:
		if(flags["CHERRY_SMALL_BUBS"] != undefined) output(" You recognize a few of the cum-filled balls as your own, an act of generosity that Cherry certainly seemed to appreciate.");
		output(" A larger, grapefruit-sized bubble sags between her upper thighs, hiding her pussy, though just barely.");
	}
	else
	{
		output("\n\nCherry has forgone her normal condom-laden belt, instead letting her massive, cum-filled belly conceal her femininity. Though her legs are more than up to the task of supporting her, the exhibitionist in her can’t help but jiggle every so often, letting the sloshing sound of your cum send tidal waves of undulations through her jelly body.");
	}
	clearMenu();
	addButton(0,"Next",goForCherryStuff);
}

public function cherryMenu():void
{
	clearMenu();
	addButton(0,"Appearance",cherryAppearance);
	if(pc.hasKeyItem("Puss Pass")) addDisabledButton(1,"BuyPussPass","Buy Puss Pass","You already have a Puss Pass!");
	else if(pc.credits >= 50000) addButton(1,"BuyPussPass",pussPassBuy,undefined,"Buy Puss Pass: 50,000C","For the low price of 50,000 credits, you can use the Tap-Hall as much as you like.");
	else addDisabledButton(1,"BuyPussPass","Buy Puss Pass","You don’t have enough money for this. Come back with 50,000 credits.");
	addButton(2,"Talk",talkToCherry,undefined,"Talk","Talk to Cherry.");
	//[Cum Bubble]
	addButton(3,"Give Bubble",cumBubblesOptionsForCherry,undefined,"Give Bubble","Goo girls love Bubble Buddy snacks.");
	if(cherryCumflated()) 
	{
		if(pc.lust() < 33) addDisabledButton(4,"Fuck","You are not aroused enough for this.");
		else addButton(4,"Fuck",bubbledBitchesNeedBoounced,undefined,"Fuck","With Cherry still cum-fattened from your previous feeding, she should be safely fuckable.");
	}
	else addDisabledButton(4,"Fuck","Fuck","Cherry’s not really safe to touch, let alone fuck.");
	addButton(14,"Leave",pickWallSlutMenu);
}

//[Puss Pass]
//mouseover: For the low price of 50k credits, you can use the Tap-Hall as much as you like.
//50000
public function pussPassBuy():void
{
	clearOutput();
	showCherry();
	author("Adjatha");
	output("You mention that you’d like to get one of those unlimited passes she mentioned.");
	output("\n\nShe flashes a grin and kicks off the wall to turn to you. <i>“Oh yeah? Loving the enthusiasm. Flash that fat cred stick my way and we’ll get you set.”</i>");
	output("\n\nYou produce the requisite cash and Cherry’s ponytail swings up to grab the chit from your hand, careful not to make any skin contact. She slaps it into a terminal and nods at the subsequent beep. Gesturing for you to follow her, she sashays with thudding impacts to a slightly raised platform marked by two vaguely-footprint like buttons.");
	output("\n\n<i>“Just stand there and give us a smile,”</i> she instructs, tapping out a code on the wall to expose a shuttered lens. You take your place, getting your [pc.feet] more or less on both buttons and ");
	if(pc.isNice()) output("beam at");
	else if(pc.isMischievous()) output("stick out your tongue to");
	else output("stare down");
	output(" the ocular as it opens and runs a green laser across your features. When if finishes, a plastic rectangle bisected by narrow circuitry spits out of the machine.");
	output("\n\nCherry presents the card to you with the tips of her fingers, showing off the holo-pic that floats an inch off the surface. When you take it, a painful jolt jumps through your hand and the plastic turns rose red. <i>“There you go, all set up to your biosignature. You change, it changes with you.”</i>");
	output("\n\nLeaning in until her lips are almost touching your [pc.ear], Cherry whispers, <i>“I look forward to seeing you work.”</i> She pulls back with a wink and takes her accustomed place, watching the patrons busting nuts in the wall-sluts.");
	//add <i>“Puss Pass”</i> to Key Items and remove [Puss Pass] from Cherry’s dialog options
	// Puss Pass Mouseover:
	output("\n\n(<b>Key Item Gained:</b> Puss Pass! This red card has a holographic picture of you on it that somehow changes whenever you change. It grants unlimited access to Cherry’s Tap-Hall in Zheng Shi station.)");
	pc.createKeyItem("Puss Pass", 0, 0, 0, 0, "A red card granting unlimited access to Cherry’s Tap-Hall in Zheng Shi Station.");
	processTime(5);
	pc.credits -= 50000;
	clearMenu();
	addButton(0,"Next",goForCherryStuff);
}

//[Talk]
// wears belt of filled condoms (bubbles) patrons give her as appreciation gifts (like leaving a tip)
//exudes rahn chemicals that put biologicals to sleep when policing the Tap-House. When she’s horny (turns a slightly pink), bodily contact simply paralyzes them. Has ‘squirt-gun’ arm cannon in one of her legs robo-cop style that lets her weaponize her chemicals from a distance

//[Talk]
public function talkToCherry():void
{
	clearOutput();
	showCherry();
	author("Adjatha");

	//first time:
	if(flags["CHERRY_TALKED"] == undefined)
	{
		output("You decide to strike up a conversation with the apparent proprietor of this unusual business. " + (pc.isTaur() ? "Folding your [pc.legOrLegs] beneath you,":"Leaning up against the far wall next to her") + ", the two of you look out on the long corridor of captive sluts and the patrons browsing through them. Cherry gives you a sideways glance before turning back to look at a Slyveren strutting towards a big balled Wall-Slut.");
		output("\n\n<i>“So, unaffiliated, huh? I should probably be giving you the hard sell for joining the Cyber Punks,”</i> she sighs, ponytail wiggling around to slap against her bionic legs. <i>“But then, I’ve already got a job.”</i> She grins at the serpentine woman at the other end of the hall cuddles up against the hefty sack of her captive and begins tongue-polishing the cum tanks. Absently, she pulls one of the spherical condoms off her belt and pops it in her mouth like a jawbreaker, swishing the bubble treat from cheek to cheek.");
		output("\n\n<i>“So, what’s up?”</i>");
		processTime(5);
	}
	//repeat:
	else
	{
		output("Cherry’s keenly observing all the patrons of the Tap-Hall, seemingly at ease and enjoying herself. Her ponytail gives a little waggle at you as you approach, as if to say hello. She’s not looking at you, but you know she’s listening.");
		processTime(1);
	}
	//[Herself][Her Job][Her Legs][Tap-Hall][Janitor][Nothing]
	clearMenu();
	//[Her Job]
	addButton(0,"Herself",askCherryAbootHerself,undefined,"Herself","Ask Cherry about herself.");
	addButton(1,"Her Job",cherryJobTalkies,undefined,"Her Job","Ask about Cherry’s job.");
	addButton(2,"Her Legs",cherryLegsTalkin,undefined,"Her Legs","Ask Cherry about her artificial legs.");
	addButton(3,"Tap-Hall",cherryTapTalking,undefined,"Tap-Hall","Ask Cherry about her fine establishment.");
	addButton(4,"Janitor",janitorTalkWithCherCher,undefined,"Janitor",(silly ? "The dummy THICC goo-girl cleaning up all the messes keeps distracting you with the clap of her ass-cheeks. Maybe you should ask about her.":"Ask Cherry about the janitor."));
	addButton(14,"Back",goForCherryStuff);
}

//[Herself]
public function askCherryAbootHerself():void
{
	clearOutput();
	showCherry();
	author("Adjatha");
	//first time
	if(flags["CHERRY_HERSELF_TALKED"] == undefined)
	{
		output("You ask Cherry if she wouldn’t mind telling you a bit more about herself. <i>“Me? Or rahn in general? I don’t know if you’re into the whole ‘brevity’ thing or not, but I subscribe to that particular feed, so long story short: I run the wall and rahn are like you, but a bit gooier.”</i>");
		output("\n\nYou explain that you’ve had some exposure to rahn before, but nobody quite like her.");
		output("\n\n<i>“Ha hah, I love terrible lines like that. Gimme another,”</i> she laughs, her torso jiggling like jelly.");
		output("\n\nYou were going to explain that you didn’t mean it that way, but she seems to actually get a kick out of it, so you rack your brain for the lamest line you can think of. <i>“I didn’t know rahn needed hearts,”</i> you start.");
		output("\n\n<i>“Oh yeah? Do we?”</i> she turns her attention fully to you, smiling wide in anticipation.");
		output("\n\n<i>“Well, you stole mine.”</i>");
		output("\n\n<i>“Hah! So awful!”</i> she snickers, leaning out to punch your shoulder in a friendly fashion before catching herself. <i>“Oh, whoops.”</i> She jerks back her small fist like it were a deadly weapon.");
		output("\n\n<i>“Is the staff on a strict ‘no-touching’ policy?”</i> you ask, confused by her overreaction.");
		output("\n\n<i>“Not quite. More like a ‘only touching people breaking the rules’ policy. You know about zel’rahn?”</i>");
		output("\n\nYour CODEX chirps, but you let her explain for you.");
		output("\n\n<i>“We basically sweat out chemicals all the time and with a little effort, we can change what those chemicals do. You high-five a random zel’rahn on the street and there’s no telling what’d happen to you.”</i>");
		output("\n\n<i>“As for me? Paralysis,”</i> she explains, arching an eyebrow. <i>“Lock up your muscles and make a pretty statue out of you. Too much exposure and you could be trapped in your own body for a week. Feeling everything, but unable to do anything about what’s happening to you.”</i>");
		output("\n\n<i>“It helps for my job,”</i> she winks, gesturing at the wall.");
		processTime(10);
		IncrementFlag("CHERRY_HERSELF_TALKED");
	}
	//second time
	else if(flags["CHERRY_HERSELF_TALKED"] == 1)
	{
		output("You prod for a little bit more about Cherry, but she seems reluctant to go into it.");
		output("\n\n<i>“My dude, this is a place of fucking and getting fucked. All this chatting is making me lose my wide-on. How about this: you give me a really, brutally awful pick up line and I’ll give you a ‘certified fresh’ Cherry fun fact. Sound good?”</i>");
		output("\n\nYou’ll have to think up some stinkers if you want to find out more about the red gel girl.");
		processTime(2);
		IncrementFlag("CHERRY_HERSELF_TALKED");
	}
	//repeat
	else
	{
		output("<i>“You know the deal,”</i> Cherry insists with a puckered smile. <i>“Gimme that pick-up artist charm.”</i>");
		output("\n\nIt’s a good thing you travel in some questionable circles because you always seem to have a line on hand. You clear your throat and hit her with a new worst:");
		//silly mode only: 
		if(silly && rand(3) == 0) output("<i>“I find the most erotic part of the woman to be the boobies.”</i>");
		//randomly select from one of the following:
		else output(RandomInCollection(["\n\n<i>“I can tell you work security, because one glance from you and I’m stunned.”</i>","\n\n<i>“I know your name’s on the door, but can I call you mine instead?”</i>","\n\n<i>“Do you think the Cyber Punks could get me new eyes? I can’t take mine off of you.”</i>","\n\n<i>“Aside from being drop dead gorgeous, what else do you do around here?”</i>","\n\n<i>“Kiss me if I’m wrong, but your parents were ausars, right?”</i>","\n\n<i>“Your gang owes me a new jaw, because when I looked your way, I dropped mine.”</i>","\n\n<i>“Your legs must be set to Long Distance mode, because you’ve been running through my mind all day.”</i>","\n\n<i>“I’m pretty good with numbers. Give me your measurements and you’ll be amazed at what I can do with them.”</i>","\n\n<i>“If I gave a credit to the thousand prettiest girls in the galaxy, you’d have yourself a cool grand.”</i>","\n\n<i>“Should we step over to the photo booth so you can picture us together?”</i>","\n\n<i>“I think you’re suffering from a lack of vitamin me.”</i>","\n\n<i>“I feel like I’ve seen you before. Oh, that’s right: in my codex, under ‘Gorgeous’.”</i>","\n\n<i>“Girl, you’ve got more pull than an event horizon.”</i>","\n\n<i>“I’m a bit lost in this station. Can you give me directions to your place?”</i>","\n\n<i>“I can tell you run this brothel, because ma-DAMN!”</i>","\n\n<i>“Fat korgonne. Sorry, I just needed an ice breaker.”</i>","\n\n<i>“If I were to rate you 1 to 10, I’d give you a 9 because I’m the 1 you’re missing.”</i>","\n\n<i>“I can tell you’re a pirate with plenty of wealth by the size of your chest and booty.”</i>","\n\n<i>“How about you slide out of those legs and sit on my lap? We can talk about the first thing to pop up.”</i>","\n\n<i>“You must come from a family of drug dealers, because I’m addicted to you.”</i>"]));
		//merge
		output("\n\nShe titters and claps her hands in delight. <i>“Thank you so much for that, I hated it. So, something about me, huh? Lemme think.”</i>");
		//select a random entry, then remove it from the talk options
		
		if(flags["CHERRY_HERSELF_TALKED"] == 2)
		{
			//player hasn’t given her a bubble: 
			if(flags["CHERRY_TOTAL_BUBBLE_GIFTS"] == undefined) output("\n\n<i>“You ever heard of a Bubble Buddy? They’re these wank sleeves Tamani Corp puts out.");
			else output("\n\n<i>“You know the Bubble Buddies, right? Of course you do.");
			output(" Anway, I’ve got a personal collection of those like you wouldn’t believe. Even limited run, collectors edition versions.”</i>");
			output("\n\nShe rubs the back of her neck thoughtfully. <i>“It’s actually getting to be kind of a problem! I should probably start giving away some of my duplicates. Maybe have a promotional give-away day at the Tap-Hall.”</i>");
		}
		else if(flags["CHERRY_HERSELF_TALKED"] == 3)
		{
			output("\n\n<i>“How’s this: ‘Cherry’ isn’t my real name. Shocking, I know. I chose it when I became a pirate because I wanted something that sounded sweet and unassuming but could also be deadly and poisoned by, like, an evil queen.”</i> She gives a wicked grin and wiggles her toxic fingers menacingly.");
			output("\n\nYou’re pretty sure she was thinking of an poisoned apple, but no sense in bringing it up this late in the game.");
		}
		else if(flags["CHERRY_HERSELF_TALKED"] == 4)
		{
			output("\n\n<i>“This is kind of embarrassing, but my first crime was breaking and entering. Not to steal anything, really. See, the home belonged to this kui-tan couple and, well, let’s just say they’d installed the extra large pipes for their private milking station. I basically lived there for a month until one of them heard me making yummy noises one day.”</i>");
			output("\n\nYou’d almost swear she’s blushing through all the red. <i>“Yeah, yeah, I was a dummy alright. I still hold that it’s inexcusably wasteful. That’s why I’ve got galotians on staff to clean up around here. Waste not, want not.”</i>");
		}
		else if(flags["CHERRY_HERSELF_TALKED"] == 5)
		{
			output("\n\n<i>“This might seem weird, but I kinda think the whole slaving thing we do is actually good for the people we capture. Sure, some of the people around here are a bit excessive, but it’s better we grab them then somebody like the Black Void, or one of those psychopathic mad scientists you hear about.”</i>");
			output("\n\n<i>“Besides, there’s always plenty of folk eager to make sure the slaves get three square meals a day,”</i> she adds, pulling one of the cum bubbles from her belt and popping it into her mouth.");
		}
		else if(flags["CHERRY_HERSELF_TALKED"] == 6)
		{
			output("\n\n<i>“Don’t get me wrong, it’s mighty handy having a body that generates its own weapon, but sometimes the whole toxic part of being a zel’rahn is more trouble than it’s worth. One little mistake and the erotic tingle you meant to go for turns into a narcoleptic coma. Never got a call back after THAT date.”</i>");
			output("\n\nShe taps her chin thoughtfully. <i>“I’ve always thought it would’ve been sweet to be a loo’rahn with their super fast body sculpting. Give yourself a different face for every day of the week,”</i> she muses, trailing off.");
		}
		else if(flags["CHERRY_HERSELF_TALKED"] == 7)
		{
			output("\n\n<i>“Obviously cum is my jam,”</i> she notes, adjusting her filled-condom belt, <i>“but you know rahn can eat pretty much anything organic, yeah? If it’s got DNA, it’s A-OK, or something along those lines.”</i>");
			output("\n\n<i>“Anyway, this may seem weird, but I actually can’t stand fruits. Yet, if you turn them into a wine, I like that just fine. I don’t know why! The best though, is a good, hard liquor. I don’t generally get a chance to go off-duty, but plenty of the gangers get pretty sauced before coming here, so I get a little second-hand enjoyment from time to time.”</i>");
		}
		else if(flags["CHERRY_HERSELF_TALKED"] == 8)
		{
			output("\n\n<i>“Before I signed up with the Cyber Punks, I used to pull jobs with the cutest little go’rahn you’ve ever seen. She was a master at putting people off guard long enough for me to get in there and neutralize any threats. And you wouldn’t believe how much she jizzed when you got her riled up! I swear that girl was hiding an ocean somewhere inside her.”</i>");
			output("\n\nCherry laughs in her reminisce, absently fingering the thick loop serving as a hair band for her ponytail. <i>“Anyway, that partnership ended and I came to Zheng Shi soon after. Still fond of the color white, though.”</i>");
		}
		else if(flags["CHERRY_HERSELF_TALKED"] == 9)
		{
			output("\n\n<i>“Don’t judge me too harshly, but when I first set this thing up, I was the only one in the wall. Greedy of me, I know! Anyway, I got fed plenty and it was loads of fun, but all these damned pirates kept skimping on the whole ‘payment’ part of the deal. More innocent times.”</i>");
			output("\n\n<i>“So, I invested everything I had in a camera equipment and used the recordings to track down the cheapskates. It turns out that I enjoyed watching myself getting fucked nearly as much as actually being there in the first place. The things we learn about ourselves,”</i> she laughs, staring a bit too intensely at one of the in-use boothes.");
		}
		else if(flags["CHERRY_HERSELF_TALKED"] == 10)
		{
			output("\n\n<i>“If I’m being really, REALLY honest? I had a bit of a bias against non-amorphs in my youth. I kinda treated them like walking dinner plates. You’ve probably heard how solid races see Rahn and galotians as sort of cum-hungry sluts? From our side of it, that’s usually just the only thing we see other races as being good for. Cultural misunderstandings, I guess. Anyway, I’m past that.”</i>");
			output("\n\nYou’re tempted to point out that her entire hall here is entirely devoted to treating people like meat, but you’re not sure she’d appreciate the irony of it. Maybe she’ll get there on her own one day.");
		}
		else if(flags["CHERRY_HERSELF_TALKED"] == 11)
		{
			output("\n\n<i>“You know what’s fucked up? I could sit here watching people rutting all day long - and, in fact, that’s exactly what I do - but porn does nothing for me. There’s just something different about knowing the fucking is done right here, instead of on some sound stage in some studio.”</i>");
			output("\n\nShe taps her VR glasses and lowers her voice. <i>“Pretty much everything I watch with these puppies are recordings from surveillance systems on the station.”</i> She glances down, then back up at you, raising her eyebrows meaningfully.");
		}
		//after all discussion prompts have been exhausted, repeat the following:
		else
		{
			output("\n\nCherry shares a brief snippet of her life, talking about raids she’s been on, partners she’s worked with, and interesting patrons who’ve visited her Tap-Hall. Though affable, you’re struck by how she legitimately doesn’t seem to feel bad about any of the criminal things she’s done over the years.");
			output("\n\nThe only things she never mentions is why she went into piracy in the first place, and how she originally lost her legs.");
		}
		IncrementFlag("CHERRY_HERSELF_TALKED");
		processTime(5);
	}
	clearMenu();
	addButton(0,"Next",talkToCherry);
}

//[Her Job]
public function cherryJobTalkies():void
{
	clearOutput();
	showCherry();
	author("Adjatha");
	output("<i>“Yeah, it’s pretty great, right? All these eager patrons and all that available flesh. A marriage made in the primordial soup.”</i>");
	output("\n\nYou ask what exactly she does all day, other than watch.");
	output("\n\n<i>“The fiddly bits of the business don’t really take all that much time. I’ll check in new arrivals and get them plugged in sometimes, or release people whose contracts have run their course. Boring stuff like that.”</i>");
	output("\n\nShe holds a hand out, studying her perpetually wet fingertips. <i>“Oh, there are rare cases where somebody feels like getting a free sample, damaging the equipment, or attempting to make off with merchandise itself.”</i>");
	output("\n\nHer expression hardens for a moment. <i>“I find a tap on the shoulder tends to discourage repeat offenders. And, of course, they can always pay off their debt with a contract of their own.”</i>");
	output("\n\nHer easy smile returns, though her ponytail sways like the tail of a venomous predator.");
	processTime(5);
	clearMenu();
	addButton(0,"Next",talkToCherry);
}

//[Her Legs]
public function cherryLegsTalkin():void
{
	clearOutput();
	showCherry();
	author("Adjatha");
	if(silly) 
	{
		output("<i>“So what’s with the metal legs?”</i> you ask out of nowhere.");
		output("\n\n<i>“Well, it was a risky operation, but I think it was worth it.”</i> Cherry gives them a slap and nods to herself. <i>“These bad boys can fit so much rahn in them.”</i>");
	}
	else
	{
		output("Cherry catches you looking her mechanical legs and folds her arms under her breasts. <i>“Hey. Goo’s up here,”</i> she teases.");
	}
	output("\n\nYou thought rahn could regenerate just about any injury, so you’re not really sure why one would be using cybernetics.");
	output("\n\n<i>“Don’t tell the Cyber Punks that, or they might kick me out,”</i> she whispers, a finger pressed to her glossy black lips.");
	output("\n\nYou admit it does seem like it’d be helpful to have something metallic on hand. Or on-foot, rather.");
	output("\n\n<i>“You mean when I need to put my size 20s up somebody’s ass? Yeah. Or when I really need to scoot. These gams got some get up and go,”</i> she brags, lifting her knees like she’s stretching for a runner’s start, sending booming clangs through the hall with each footfall. A few patrons turn to look, but most of them seem accustomed to the ruckus.");
	output("\n\nIf only it were that easy for everybody to get cybernetics, you lament.");
	output("\n\n<i>“Amorph privilege,”</i> she brags, jiggling her hips in their socketed seats.");

	//player has given her a Large or Huge Bubble
	if(flags["CHERRY_LARGE_BUBS"] != undefined || flags["CHERRY_HUGE_BUBS"] != undefined)
	{
		output("\n\n<i>“Though mostly,”</i> she confides with a sly glance, <i>“it’s a question of concentration. If I’m using my own legs, my surface area increases. The bigger I am, the less of an effect my toxin has. And when you’re dealing with a bunch of treacherous pirates, it’s best to keep a bullet in the chamber.”</i> She narrows her eyes at you, then shrugs. <i>“No offense.”</i>");
		output("\n\nYou’d ask her what kind of experiences she’s had with pirates to give her that opinion, but considering your surroundings, that question would probably be pretty silly.");
		output("\n\n<i>“Aaaaaaaaanyway,”</i> she adds with an eyeroll, <i>“I bring in money for the Cyber Punks with my little Tap-Hall here, and they keep my legs in state-of-the-art condition. Everybody’s happy.”</i>");
	}
	processTime(6);
	clearMenu();
	addButton(0,"Next",talkToCherry);
}

//[Tap-Hall]
public function cherryTapTalking():void
{
	clearOutput();
	showCherry();
	author("Adjatha");
	output("You ask her about the business she’s running in the middle of a pirate station. Wouldn’t something like this get more traffic in a public place?");
	output("\n\n<i>“Oh sure. But then I’d have to worry about things like paying taxes, paying rent, playing employees... man, just so many headaches. Here, I’ve got the Cyber Punks making sure none of the other gangs try to muscle in and all the free labor I could ask for. People just take out a contract for a booth, we install the merchandise, and the owner gets a cut of every patron who stops by.”</i>");
	output("\n\nBut why, you press, would people pay for enjoyment if there are so many slaves in Zheng Shi already?");
	output("\n\n<i>“Variety?”</i> she hazards. <i>“Eh, I assume a fair number of the slaves that come through here get sold off one way or the other. It can be a real hassle, managing a stable of hundreds for any length of time, you know. I’m not really on that end of the business, so your guess is as good as mine.”</i>");
	output("\n\nWagging her ponytail mischievously, Cherry leans in closer. <i>“Besides, we get some gangers in here from time to time, and it’s great stress relief when you can pound the hell out of somebody belonging to the group that’s been giving you trouble.”</i>");
	output("\n\nFair enough. As for the name...?");
	output("\n\n<i>“Is that not obviously? Tap-Hall. As in ‘tap that ass.’ Eh? Eh?”</i> She smirks, entirely too pleased with herself.");
	processTime(7);
	clearMenu();
	addButton(0,"Next",talkToCherry);
}

//[Janitor]
public function janitorTalkWithCherCher():void
{
	clearOutput();
	showBust("CHERRY","MOLLI");
	author("Adjatha");
	output("You notice the pink galotian scooting among the booths and are a bit surprised to see just how large she is up close. Even though she’s only manifested a humanoid form up to her knees, she’s easily over seven feet tall and voluptuous enough to embarrass primitive fertility idols. You point out the rubenesque slime to Cherry and ask if she’s an owner of the Tap-Hall too.");
	output("\n\n<i>“Molli? Not so much, no. She’s an employee. But, not like like them,”</i> she gestures expansively at the wall of presenting hindquarters.");
	output("\n\nCherry unhooks one of the cum bubbles from her belt and tosses it to the full-figured googirl, who doesn’t seem to notice the impact until it’s already sunk inside her body. She wiggles in happy surprise, digesting the condom and its cream in an instant and waves at her boss with an affectionate smile.");
	output("\n\nThe rahn’s tone turns more professional, almost possessive. <i>“Molli works for me directly, unlike those in the wall. As you’d expect, this place needs a full-time cleaner.”</i>");
	output("\n\nAs the two of you are talking the galotian oozes up to a recently used booth and buries her chubby cheeks against the wall-slut’s hindquarters. With a soft humming, she gleefully slurps up cum inside and out. Her bimbo-thick lips wiggle almost like tongues as she kisses inner thighs and trembling vaginal folds, diving in to lap at the furthest depths as only a slime girl can. By the end, she leaves the girl’s posterior cleaned to a sparkling polish, ready for the next customer to step up.");
	output("\n\n<i>“And the collar?”</i> You ask, noting the rather sizable hunk of technology laying heavily on the goo’s bare shoulders.");
	output("\n\n<i>“That’s our little compromise. You know what happens when galotians eat too much? For one, they get gigantic. Like, two tons big. And when they get big enough, they divide into a half dozen smaller goo daughters.”</i>");
	output("\n\nJust watching Molli go at it on those sex booths for a few minutes, you can imagine how much she must eat in a given week.");
	output("\n\n<i>“Hence, the collar,”</i> Cherry explains. <i>“Little bit of amorph tech. Past a certain size, it rapidly increases her digestion rate. That way, we’re not up to our nipples in galotians and my janitor can actually fit in the booths. In return, she gets to eat as much as she can all day, every day.”</i>");
	output("\n\nYou ask if Molli ever sees any first-hand action while working at the Tap-Hall.");
	output("\n\n<i>“Not on my watch,”</i> Cherry responds, in a tone that broaches no compromise. Seems like if you wanted to get to know the pink goo girl a bit better, you’d have to do it when Cherry’s not watching.");
	processTime(12);
	clearMenu();
	addButton(0,"Next",talkToCherry);
}

//[Give Bubble]
//Mouseover: <i>“Offer Cherry a sealed cum snack”</i>
//Cherry will wear PC’s small bubbles like jewelry on her tip belt, eat their medium bubbles on the spot, take the PC to the office to enjoy large bubbles, and tag in the janitor for double team on huge bubbles
// has a wide collection of Bubble Buddies she uses in conjunction with her waterproof lipstick to allow for blowjobs without ‘harming’ her partner. Sometimes likes paralyzing them for ‘time stop’ roleplay
//can manifest omnipositor when extremely high arousal (huge cum bubble), wears a cock-ring ‘belt’ w/ two large bubbles hanging like balls after layer donates 2+ large bubbles

public function pickWallSlutMenu():void
{
	//add a text display with brief descs for each NPC and if they are disabled
	clearMenu();
	addButton(0, "Cherry", goForCherryStuff, undefined, "Cherry", "Talk to the owner instead of jumping straight to the wall-bound sluts.");
	var btn:int = 1;
	
	if(pc.hasStatusEffect("BlackDragDisable"))
	{
		output("\n\nWhile the black dragoness is still resting in her spot in the wall, she has been shut down until Cherry has a moment to get her cleaned up for the next customer. Maybe if you come back in an hour or two, you can hit her up.");
		addDisabledButton(btn,"Black Dragon","Black Dragon","The black dragon is closed for cleaning.");
	}
	else addButton(btn, "Black Dragon", blackDragonessUse, undefined, "Black Dragon", "Investigate the big, dark dragon booty.");
	
	btn ++;
	if(pc.hasStatusEffect("RaskvelDisable"))
	{
		output("\n\nThe raskvel are still there, but shut down for cleaning at the moment.");
		addDisabledButton(btn,"DoubleRask","Double Raskvel","The raskvel are closed for cleaning.");
	}
	else addButton(btn, "DoubleRask", doubleBooty, undefined, "Double Raskvel", "Investigate two sandwiched raskvel.");
	
	btn ++;
	if(pc.hasStatusEffect("ThiccGobDisable"))
	{
		output("\n\nThe gabilani is closed for cleaning. Maybe next time!");
		addDisabledButton(btn,"Thick Goblin","Thick Goblin","The goblin is closed for cleaning.");
	}
	else addButton(btn,"Thick Goblin",thickGoblinSmex,undefined,"Thick Goblin","Investigate a gabilani.");

	btn ++;
	if(pc.hasStatusEffect("FoxyDisable"))
	{
		output("\n\nTura is closed for cleaning. Maybe next time!");
		addDisabledButton(btn,"Fox Herm","Fox Herm","The fox herm is closed for cleaning.");
	}
	else addButton(btn,"Fox Herm",approachDatUrtaKnockoff,undefined,"Fox Herm","One eye-catching stall houses what is clearly a fox-girl with more than a little extra: a 20-inch horse-cock and orange-sized spunk-bunkers hanging just below.");
	
	btn ++;
	if(pc.hasStatusEffect("TaurDisable"))
	{
		output("\n\nThe leithan is closed for cleaning. Maybe next time!");
		addDisabledButton(btn,"Demure Taur","Demure Taur","The fox herm is closed for cleaning.");
	}
	else addButton(btn, "Demure Taur", demureTaurWallIntro, undefined, "Demure Taur", "A white Leithan’s haunches are jutting out of the wall. Check them out!");
	
	btn ++;
	if(pc.hasStatusEffect("NoisyRodentsDisable"))
	{
		output("\n\nThe rodenians are closed for cleaning. Maybe next time!");
		addDisabledButton(btn,"Noisy Rodents","Noisy Rodents","The rodenians are closed for cleaning.");
	}
	else addButton(btn,"Noisy Rodents",wallSlutsNoisyRodentsWallIntro,undefined,"Noisy Rodents","A bickering duo of rodenian girls.");

	addButton(14,"Leave",mainGameMenu);
}

//[Black Dragoness]
//10'+ dark purple fanfir woman
//lower torso, vaginal only
public function blackDragonessUse():void
{
	clearOutput();
	showName("FANFIR\nPUSSY");
	showBust("WALL_FANFIR");

	author("Adjatha");
	output("You select a particularly prodigious posterior and take a moment to take it all in. By far the largest occupant of the Tap-Hall, this girl’s upper half is hidden on the other side of the wall, but the holo-pic next on the wall shows a mature, fanfir woman with narrowed eyes and a defiant glower, with a price at the bottom. Her lower half is at least 6’ tall, from her fat-tailed booty, down her thick, digitigrade legs to her taloned feet. An adjustable elevating platform has been installed for customers of every size.");
	output("\n\n");
	showImage("WallFanfir");
	output("The draconic matron’s scales seemed black from further back, but up close you can tell that they’re actually a deep purple-blue, like a midnight-blooming lotus. Each cheek of her girthy rump is nearly as large across as your shoulders and her plump ass seems so wedged into the oval-shaped window that you don’t think she’s getting out without some serious construction work. A band of vibrating metal runs the circumference of her hefty tail, keeping the appendage limp and twitching instead of batting potential clients brainless.");
	output("\n\nThere is an orange bio-plug in her ass, but her pussy is open for business. It will cost " + 2000 + " credits to fuck the fanfir." + (pc.hasKeyItem("Puss Pass") ? " <b>Of course, for you, it’s free.</b>":""));

	processTime(3);
	clearMenu();
	if(pc.hasCock())
	{
		if(pc.credits >= 2000 || pc.hasKeyItem("Puss Pass"))
		{
			if(pc.cockThatFits(1500) >= 0) addButton(0,"Fuck Pussy",cockSelect,[pussyDatGryvain,1500,false,0],"Fuck Pussy","Plow that pussy" + (!pc.hasKeyItem("Puss Pass") ? " for 2000 credits.":" for free, thanks to your pass."));
			else addDisabledButton(0,"Fuck Pussy","Fuck Pussy","Despite the enormity of her ass, you’re just too well endowed to take her for a spin.");
		}
		else addDisabledButton(0,"Fuck Pussy","Fuck Pussy","You can’t afford to ride this ride.\n\nCosts 2000 credits.");
	}
	else addDisabledButton(0,"Fuck Pussy","Fuck Pussy","You’re going to need to find a penis for this.");
	addButton(4,"Back",pickWallSlut);
}

//[Pussy]
//requires dick under 12" girth
public function pussyDatGryvain(x:int):void
{
	clearOutput();
	
	author("Adjatha");
	showName("FANFIR\nPUSSY");
	showBust("WALL_FANFIR");

	//no puss pass:
	if(!pc.hasKeyItem("Puss Pass")) 
	{
		output("The slot under her holo-pic takes your credit chit and bloops the go-ahead.");
		pc.credits -= 2000;
	}
	//has puss pass:
	else output("You insert your Puss Pass and get down to business.");
	//merge
	output("\n\nPutting the others in the Hall out of your mind, you step up to the deep indigo ass, ");
	//nude:
	if(!pc.isCrotchExposed()) output("giving your [pc.cock " + x + "] a few strokes");
	//clothed:
	else output("loosening your [pc.crotchCovers] enough to let your [pc.cock " + x + "] stand free");
	output(". Gingerly mounting the elevating platform, you ");
	//pc under 8’:
	if(pc.tallness < 8*12) output("tap the controls to raise dais until you’re at a more accommodating height.");
	else output("ignore the controls and instead run your palms across her supple hindquarters, delighting in an ass sized perfectly for your own titanic stature.");
	output(" You slide your girth atop the deep vale of her moon-wide cheeks, just under her rotund tail. You can feel the draconic captive tense, but the yielding warmth of her torso-sized bubble butt invites more vigorous admiration. Sinking your fingers into the malleable mountains of her aft orbs, you delight in the silky softness of her fine scale-skin. With just a bit of gripping force, your palms vanish into the doughy depths of her ample cushions. You squeeze and rub, rolling the massive mounds in slow clapping circles, gradually swallowing your [pc.cocks] into the fathomless cleft of the pillowy posterior.");
	output("\n\nRiding the tidal waves of her velvet hinterlands is a massaging delight, but your ");
	if(pc.libido() <= 33) output("rising, repressed desires");
	else if(pc.libido() <= 66) output("eager, unrestrained appetites");
	else output("raw, animalistic urges");
	output(" demand a more procreative position. You reach down and guide your [pc.cock " + x + "] to the nadir of the giantess’ exposed form until you settle at the cusp of her purple pussy. Even here, her girthy curves have given the woman a thickness far beyond human proportions. Her plum-colored vulva is as wide across as your head, making the plump cunt less a peach to be savored and more a whole melon just begging to be split open. You tweak and clasp the bulbous lips, earning a steady, drooling trickle of anxious juices from within.");
	output("\n\nWhen you finally push your [pc.cock " + x + "] in, you find her valley as plump within as without. ");
	//normal cocks: 
	if(pc.cocks[x].thickness() < 3) output("There is no canyon here, only a taut channel of rippling muscle that suckles your inches as eagerly as if you were twice her size. Almost virginal pressure squeezes around you, her clenching lust coaxing you as deep as your body can manage.");
	//huge cocks:
	else if(pc.cocks[x].thickness() < 5) output("Rippling inner muscles part with suckling pressure, your obscene, breeder’s mass no hindrance when pushing into a fanfir’s pussy. Obviously accustomed to far smaller patrons, her body quivers at your girth, a gush of femme cum pouring across your length from just the first sensations of penetration.");
	else output("Your monstrous endowment, far wider than most races can handle, meets an unusually yielding resistance. Elephantine, egg-laying hips squirm and twist as you push, inch by sweet inch through the colossal woman’s cock-stuffed tightness. Your shuddering, girthy pressure is the perfect complement to the stretched, lust-fattened thickness of the behemoth-sized slut.");
	pc.cockChange();
	output(" You drive into her, groaning with satisfaction as the giantess’ core strokes and slurps at your [pc.cock " + x + "] with each luscious pump. The oval aperture sealing her upper half in the wall creaks with the tension your hips apply to her tremendous stern.");

	output("\n\nHer posterior takes the slapping impact of your [pc.hips] indulgently, cheeks clapping their approval while matron-fattened thighs squeeze together. A tide of gushing nectar spills from her hefty snatch, soaking you from groin on down and even pooling at the base of the elevating platform. Enjoying yourself so much, you almost don’t noticed when the fanfir woman’s broad tail rises, casting an ominous shadow over you. You tense, but instead of striking, thankfully, it simply droops down over your shoulder. Its length wraps around your shoulders and down to the small of your back, before coiling around your [pc.footOrFeet], hugging you closely.");

	processTime(25);
	clearMenu();
	addButton(0,"Next",moreDragonfucks,x);
}

public function moreDragonfucks(x:int):void
{
	clearOutput();
	author("Adjatha");
	showName("FANFIR\nPUSSY");
	showBust("WALL_FANFIR");
	output("Despite the wordless, affectionate embrace, the temptation to put her colossal derriere through its paces proves too much and you slow your pace just enough to let you appreciate what’s to come. Raising an open-palmed hand up, you bend your waist slightly and whip around to slap one of her cheeks with a startling crack. The unexpected blow sends rippling waves from one dark-hued cheek to the other and a split second later, her nerves register the shock with an internal clenching unlike anything you’ve ever felt. Her tail pulls you tight enough that it crushes the air out of your lungs while her pussy clamps down on your stem with such force that your fingertips start tingling.");
	output("\n\nThe hold relaxes gradually and you follow up with another slap, hard enough to leave your palm burning. Another clench and you almost lose your balance. It feels like your head is in a velvet vice for just a second before the blossoming heat of a climax cuts through the haze. The dragoness’s cunny is suckling so hard at your [pc.cock " + x + "] that you almost feel lifted off your [pc.footOrFeet]. There’s certainly no way you’re stopping now, so the spanking continues until you’re forced to switch hands from the sheer numbness in your limb. Each impact brings a fresh wave of grasping constriction that it feels like she’s vibrating - inside and out - from the punishing buffet. Her pussy clenches randomly and wildly as the paddling sparks an orgasmic feedback that robs the giantess of muscular control and milks you within an inch of your life.");
	output("\n\nThe fanfir’s crushing depths are almost too much for your lust-sore [pc.cockHeadNoun " + x + "]. You grab hold of her wobbling haunches, all sensations in your body compressed down to the surging rush of your [pc.cockHead " + x + "].");
	//balls: 
	if(pc.balls > 0) output(" The downpour of hot dragon-girl juices polish your [pc.balls] in slavish, liquid adoration. Though lost in the endless expanse of milfy thighs, your cum tanks churn with the need to fill the wall-slut’s womb.");

	var cumQ:Number = pc.cumQ();
	//cum volume low:
	if(cumQ < 500) output("\n\nWhen your cream spills forth, your tender flesh is at once soothed and exhilarated. The warmth of your seed is practically a cool breeze next to the estrus heat of the giant dragoness’ furrow. Even her taut embrace slacks to a docile, submissive coaxing. Every pumping spurt you loose into her is swallowed by loops of inner muscle, shepherded into her fathomless depths. You’d be hard pressed to imagine what kind of oceanic virility it would take to actually fill the fanfir, but the stroking coils of her winding tail suggest that she’s plenty pleased with your contribution.");
	//cum volume high:
	else if(cumQ < 10000) output("\n\nThe molten pressure of your orgasm bursts loose in raging ropes of [pc.cumVisc] spunk. The regal claws of her hind legs scrape and tear gouges in the steel floor as they curl in bred bliss. You slow to shallow strokes, indulging in the feel of gushing seed rushing over her muscled depths with every hip-smacking plap against her pregnable puss. Despite a volume of jizz that would balloon a galotian’s belly, not so much as a drop of your nut flows back the way it came, siphoned away to sate the titanic thirst of the wall-bound dragon’s womb.");
	//cum volume hyper:
	else output("\n\nRather than try in vain to stand against the tide, you lean forward and brace your upper half against the indigo peaks of the dragoness’ rump. Orgasmic gouts of needful seed buffet inner walls, liquid volume parting the puckered muscle. Her lower body jolt, one leg kicking back in shock. You can just about hear a wall-shuddering cry of bliss the other side of her imprisonment as your endless ejaculate plumbs uncharted depths. It is not long before the fullness of her canal has filled with your spunk, fluid pressure driving each subsequent load past her unprepared cervix to fill the giantess’ womb. Though blocked from sight by the straining, oval of her compartment’s hole, you can feel the groan of her nut-stuffed gut expanding under your hot burden. Her motherly curves seem all the fatter from housing every drop of your [pc.cumVisc] lust within herself. Only a woman of such gargantuan stature could ever hope to house the full, fountaning magnitude of your cum reservoir and that is precisely what the black-purple fanfir manages. Truly a magnificent woman!");

	//merge
	output("\n\nEven by the time your orgasm runs dry, the girl in the wall hasn’t recovered from your rump-thumping. Her inner walls tremble as you pull yourself free and the oscillating sway of her buns continue for several minutes after the last stroke. A steady stream of femme cum drools down her fat pussy lips while the rippling contractions of the huge girl’s nethers look almost like she’s begging for more. Yet, not so much as a hint of your cum finds its way past her navy-black nethers, her muscles well trained enough to jealously horde every drop. The giantess’ tail tip strokes the well-used puff of her exposed femininity, though if she’s doing it to soothe or further tease her dark purple sex is anyone’s guess.");
	output("\n\nThough your hands and hips are throbbing at the abuse of their titanic efforts, your mast still stands upright. The fucking was plenty exhausting, but Cyber Punk’s subliminal engines make sure that there’s no such thing as a flaccid cock at Cherry’s. Perhaps it’s the post-coital haze, but it feels like you could go another round or twenty.");
	//drop lust to 30, remove 10-20 energy
	pc.createStatusEffect("BlackDragDisable");
	pc.setStatusMinutes("BlackDragDisable",90);
	pc.orgasm();
	while(pc.lust() < 33) { pc.lust(2); }
	pc.energy(-5);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Double Booty]
//Red and blue raskvel mounted on top of one another, puss to puss
//asses-out, vaginal only
public function doubleBooty():void
{
	clearOutput();
	showName("RASKVEL\nBOOTY");
	showBust("WALL_RASKVEL");
	author("Adjatha");

	output("Why settle for one when you can enjoy two at the same time? You step over to an alcove shared by two raskvel women who have been installed atop one another, their tails buckled against the wall to keep the dextrous hind-limbs from getting up to any mischief. The one on bottom has a rich, crimson hue while the one above has fair, light blue scales. A pair of flickering, digital portraits on either side of the sandwiched booties depict the girls from the waist up, before they were installed here. The ruby girl has a regal air to her, clad in a tall-necked dress with coifed hair, her head turned in profile, like she’s too good to look directly at the camera. The turquoise girl, on the other hand, has no such restraint, as her picture shows a pierced, punky brat bending her head to lick her own nipple, without breaking eye-contact.");
	output("\n\n");
	showImage("WallRaskvel");
	output("Though the oval gap conceals most of the girls’ bodies, there’s plenty on display in the form of breeding-widened hips, fat upper thighs, and even fatter asses. The red one on the bottom has a thicker ass than her companion, plump enough to muffin-top around the constraints of her hole. The blue girl’s most visible asset comes in the form of extra-puffy vulva lips, her outer labia at least half again the size of her cellmate’s. Both of the raskvel’s peach-shaped pussies are flushed from constant, rubbing contact. Their shared, dripping excitement has left the fissure between their womanhoods glistening. Slick with sweat and lubricant, their color-contrasting rumps shift slightly, as if the two are struggling against one another out of your sight.");
	output("\n\nThere’s a green bio-plug in the red one’s ass and a yellow one in the blue one’s, but both pussies are open for business. It will cost " + 1000 + " credits to ravish the raskvel.");
	if(pc.hasKeyItem("Puss Pass")) output(" Of course, <b>with your PussPass, it’ll be free</b>.");
	processTime(5);

	clearMenu();
	if(pc.hasCock())
	{
		if(pc.credits >= 1000 || pc.hasKeyItem("Puss Pass"))
		{
			if(pc.cockThatFits(800) >= 0) addButton(0,"Pussies",cockSelect,[raskvelCuntFun,800,false,0],"Pussies","Slide between those two sloppy cunts" + (!pc.hasKeyItem("Puss Pass") ? " for 1000 credits.":" for free, thanks to your pass."));
			else addDisabledButton(0,"Fuck Pussy","Fuck Pussy","You’re too big to even cram your cockhead inside those pint-sized pusses.");
		}
		else addDisabledButton(0,"Pussies","Pussies","You can’t afford to ride this ride.\n\nCosts 1000 credits.");
	}
	else addDisabledButton(0,"Pussies","Pussies","You’re going to need to find a penis for this.");
	addButton(4,"Back",pickWallSlut);
}

//[Pussies]
public function raskvelCuntFun(x:int):void
{
	clearOutput();
	author("Adjatha");
	showName("RASKVEL\nCUNNY");
	showBust("WALL_RASKVEL");
	//no puss pass:
	if(!pc.hasKeyItem("Puss Pass")) 
	{
		output("The slot under her holo-pic takes your credit chit and bloops the go-ahead.");
		pc.credits -= 1000;
	}
	//has puss pass:
	else output("You insert your Puss Pass and get down to business.");
	//merge
	output("\n\nYour [pc.cocks] " + (pc.totalCocks() == 1 ? "is":"are") + " stiff and growing harder the more you look at the two, squished pussies" + (!pc.isCrotchExposed() ? ", so you pull off enough of your [pc.crotchCovers] to unsheathe your meat":"") + ". Lining up your [pc.cock " + x + "] with the nectar-glazed nexus of the wall-sluts, you slide your [pc.cockHead " + x + "] against the moist lower lips. Your cockhead slips easily past the pliant, lubricated mounds of their heated loins, virtually sucked in by their restless struggles. Perhaps startled, the two shift, trying to pull back or twist away but in their captive state they only succeed in vigorously rubbing themselves against your firmness. Pushing your way across their nectar-lubed cunts, your [pc.cock " + x + "] drinks in their pillowy cushions. Red’s copious ass is so wide, it hugs the underside of your length while Blue’s pleasure-pumped pussy lips enfold your girth in a heated embrace.");
	output("\n\nYou slide slowly between them with a long, drawn-out thrust. The soft, lust-slick scales of their loins are compressed with pussy tightness. As you rock your crest back and forth between them, you marvel at how the moist pocket of the girl’s mutual nook seems to fit you like a glove. The differing textures of their mounds complement each other in a way that sends a thrill up your abdomen and coaxes a slight spurt of [pc.cumVisc] pre-cum. Cushioning cunts buff the [pc.cumGem] cream between themselves, the voluptuous pair of quivering muffs drooling their own agitated passion against your [pc.cock " + x + "] in twin, seeping flows.");
	//cock 9+
	if(pc.cocks[x].cLength() >= 9) output("\n\nYou slide right through the plump pussies and across the girls’ taut stomachs. In short order, you press against a second, unseen barrier: the raskvels’ compressed tits. The slickness of their shared lust lubricate your invading mast, allowing you slide through the mutual cleavage without only minor pressure. The pictures of the two on your left and right depict fairly average B-cups, but the squishy gulf caressing your [pc.cockHead " + x + "] is anything but modest. Perhaps their confinement in the Tap-Hall has left them to accumulate caloric mass. Maybe their owners gave them a little quality of life modification before shutting them up together. Whatever the reason, the shortstacks now share a veritable valley of soft tit-flesh to surround and stimulate their better endowed clientele. Pumping a foot at a time, you draw back to gather the warm femme cum gushing in their pliant vulvas before thrusting forward into the buxom furrow of their massive mammaries.");
	//cock 18
	else if(pc.cocks[x].cLength() >= 18) output("\n\nEven filling the fullness of the raskvels’ mountanous titslit, isn’t enough for someone with your sheer mass. You push all the way between them, your [pc.cockHead " + x + "] sliding past slender necks and across narrow jaws to rest against the girls’ faces. They wiggle and squirm as their narrow compartment fills with your throbbing, pussy-juice soaked cock. Saturated with their own fluid passion and the fat bubbles of your pre-cum, you can only imagine their expression at being being cheek-to-meat with the firmness so aggressively teasing their exposed posteriors. One, at least, seems delighted by the intrusion, her thick, seven inch tongue gliding across your [pc.cock " + x + "] in coiling circles. The other, seemingly reluctantly, joins in, her tongue making a serpentine path to your urethra, squeezing the peak and flicking at the leaking pre.");
	//merge
	output("\n\nAs much as you’re enjoying the press of the mismatched pair across your cock, the tension blooming in your loins demands more. Burying yourself fully in the slut-stuffed booth, you pull out an inch or two before slamming back in, taking only shallow thrusts, but putting all your weight behind them. Your [pc.hips] smack against their asses with a soft clap that grows louder the faster you plow the double flanks. Each impact makes the two tense and squeeze in unison, their exposed nethers blushing and their booties quaking at the force of your rapid, slapping strokes. The azure puss puffs so large from the hotdogging that it seems to swallow your length with its outer, puffy folds alone. The massive, scarlet ass at the foundation of the tribbing duo serves as a deliciously plump pillow for your" + (pc.balls <= 0 ? " [pc.thighs]. Your [pc.skinFurScales] spank her bubble butt hard enough that you’re almost afraid you’re going to knock her the rest of the way into the wall!":" [pc.balls]. The supple weight of your sack bumps against the rippling ocean of her bubble butt, each yielding collision seemingly adding just a bit more to their fluid burden."));
	output("\n\nYou can feel the slight firmness of the girl’s clits through the softness of their fleshy muffs, four firm, hot bulbs buried in velvet folds, like a quartet of tongue-tips inside cock-stuffed cheeks. Grabbing a cheek on each girl’s ass, you brace yourself, grinding your [pc.cock " + x + "] against the aliens’ sensitive pearls. Blue surrenders first, gushing with warm, orgasmic fluid that washes over your girth, soaking her rosy companion’s pussy in the process. It’s not long, however, before the bottom joins her top’s clenching climax. Red’s climax is rather more spectacular, as her orgasm shoots spraying jets of femme cum in wild spree, squirting all over herself, her partner, your cock, and even fountaining back to splatter across your abdomen and [pc.legOrLegs] as well!");
	output("\n\nWith these two shuddering and squirting, you pull back to sample the goods themselves. As lubed as they’re likely to get, you line up your [pc.cockHead " + x + "] and thrust into a pussy with heedless abandon. You don’t even notice which girl you pierced at first, your penetration bringing on another wave of clenching, bucking bliss. Muscled folds suckle in spasming ecstasy as you pump her cunt properly, wet [pc.skinFurScales] slapping lust engorged scales in an orgy of lewd abandon. You pull out long enough to switch holes before slamming home again, the new pussy unprepared and taut with orgasmic tremors.");
	pc.cockChange();
	output("\n\nThe girls rock back and forth against one another, as eager to coax your shaft to plow their aching slit as to enviously tease their roommate. They’re so wanton that by the time you withdraw from one and push against the other, your [pc.cock " + x + "] slides right in like a well oiled machine. You fuck the ruby raskvel for a few dozen strokes before switching to the lapis one, groaning at the continually re-tightening of their lust-sloppy holes. In no time, you have a pattern of fucking the two in rapid succession, each trembling and tightening in an effort to prove themselves the more suitable cocksheath.");
	output("\n\nTheir cascading climaxes press on your libido like a button, urgency crackling across your body with electric need. " + (pc.balls > 0 ? "Breeding urges wash through your [pc.balls] like a throbbing bass beat. The gravity of your seed-stuffed sack leaves you light-headed and fills your ears with the foam-crashing sound a rising tide. ":"") + "When your orgasm does come, you’ve lost track of which hole belongs to which girl. They’re both just as wet and willing, their pussies milking the stranger inside them or still shuddering with the rippling thrill of their latest cock-stuffing. A heated release pushes past suffocating tightness and spurting loads gush into trembling, raskvel puss. Fervor-flushed walls drink deeply, their fecund folds contracting in suckling ripples. You fill your palms with the crimson girl’s supple cheeks and unburden vent your liquid passion with white-knuckled enthusiasm.");

	var cumQ:Number = pc.cumQ();
	//high cum additional text:
	if(cumQ >= 1000) output("\n\nYou feel the gush of overflowing spunk and take a breath mid-load. You’ve got seed enough for the both of them you realize. Even though you’d be splitting the creampie between two cunts, your body is more than up to the task of giving each 100%. Biting the inside of your cheek, you force yourself to continue your fucking rotation, swapping from one pussy to the next between gushing loads. The excess spilling over their curvaceous rumps just about paints over the red and blue of their scales with your own [pc.cumColor] lacquer. Fat wads of gurgling jizz fill their depths with your virility, but that doesn’t stop you from switching back, pumping and thrusting to drive your [pc.cumVisc] seed deeper and deeper within them. In your lust-drunk haze, you can imagine them feeling the weight of your [pc.cum] oozing past their cervixes and right up into their ovaries.");
	//hyper cum additional text:
	if(cumQ >= 25000) output("\n\nThe puddle forming at your [pc.footOrFeet] tells you the two wall-wombs are as stuffed as their stretchy bodies can get, so you change tacks. Instead of driving into the nut-stuffed cunts, you push back, between their fat vulvas. Returning to the cradle of their femininities, you blast ropes of hot semen across their swollen, tender clits. Resting your urethra against the sensitive pearls, you shoot again, hosing them down with such fluid pressure the two shake with renewed orgasms. Peaking mindlessly against one another, your spout floods the narrow gap between the compressed shortstacks and into the compartment on the other side of the wall. You can imagine your steady, body-shaking cum blasts washing across their jizz-bloated stomachs, and through their shared cleavage. Again and again you geyser [pc.cum] past the partition and into the wall-sluts’ cubby, [pc.cumVisc] waves streaming over their long tongues, flowing up their nostrils, and running down their feathery hair. The sheer mass of the bottom girl’s rump serves as an excellent plug, keeping the gallons of your the excess sealed in with them.");
	//merge
	output("\n\nWhen you at last step away from the gooey mess you’ve reduced the raskvel girls to, sated and satisfied, you can’t help but admire your handiwork. The quaking rumps mounted in the wall are even puffier from your vigorous efforts, swollen and tender but still alluring. Almost a shame you’ve got other things to see to. And speaking of other things, for some reason you’re still hard and feeling the tingle of your wild oats. There really is no rest for the wicked in Cherry’s.");
	pc.createStatusEffect("RaskvelDisable");
	pc.setStatusMinutes("RaskvelDisable",90);
	processTime(25);
	pc.orgasm();
	while(pc.lust() < 33) { pc.lust(2); }
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Thick Goblin]
//Gabilani w/ torso-sized tits in a windowed compartment
//ass-out, anal only
public function thickGoblinSmex():void
{
	clearOutput();
	author("Adjatha");
	showName("THICK\nGOBLIN");
	showBust("WALL_GABILANI");
	showImage("WallGabilani");
	output("One of the booths catches your eye with an unusual difference. Rather than blank wall and holo pic, this compartment has its wall made from a thick, translucent plastic, almost like a fish tank. Its occupant is a short, green skinned girl with long, fey ears and heaving, J-cup breasts that entirely cover her torso and smother the lower half of her face. The gabilani’s plump legs and high-heel clad feet have been pulled back by ankle cuffs so that they form a V around her head. The only thing sticking out of the wall is her fat, emerald rump. ");
	//player hasn’t fucked her yet:
	if(flags["THICK_GAB_USED"] == undefined) output("Her expression flickers from outrage to disgust every moment you spend near her, but any attempts at speech she might be making are swallowed by the compartment. A far cry from the slack, wanton lust of the others in the Tap-Hall, you’d guess she’s a recent installation.");
	else output("Her glower turns to wide-eyed shock. Apparently she remembers you! How fun.");
	output("\n\nThere is a glowing green bio-plug in her pussy, but her ass is open for business. It will cost " + 500 + " credits to gape the gabilani.");
	if(pc.hasKeyItem("Puss Pass")) output(" Of course, <b>with your PussPass, it’ll be free</b>.");
	processTime(4);
	clearMenu();
	if(pc.hasCock())
	{
		if(pc.credits >= 500 || pc.hasKeyItem("Puss Pass"))
		{
			if(pc.cockThatFits(700) >= 0) addButton(0,"Buttfuck",cockSelect,[goblinAnalStuff,700,false,0],"Buttfuck","Take the hesitant gabilani for a spin" + (!pc.hasKeyItem("Puss Pass") ? " for 500 credits.":" for free, thanks to your pass."));
			else addDisabledButton(0,"Buttfuck","Buttfuck","You’re too big to even cram your cockhead inside dat ass.");
		}
		else addDisabledButton(0,"Buttfuck","Buttfuck","You can’t afford to ride this ride.\n\nCosts 500 credits.");
	}
	else addDisabledButton(0,"Buttfuck","Buttfuck","You’re going to need to find a penis for this.");
	addButton(4,"Back",pickWallSlut);
}

//[Anal]
//requires cock
public function goblinAnalStuff(x:int):void
{
	clearOutput();
	showName("\nGABILANI");
	author("Adjatha");
	showBust("WALL_GABILANI");
	//no puss pass:
	if(!pc.hasKeyItem("Puss Pass")) 
	{
		output("The slot under her holo-pic takes your credit chit and bloops the go-ahead.");
		pc.credits -= 500;
	}
	else output("You insert your Puss Pass and get down to business.");
	//merge
	output("\n\n");
	if(pc.isNice()) output("Though the enslaved girl’s predicament anguishes your better nature, the heat between your hips drowns out the anxiety with the promise of a damn fine lay." + (!pc.isCrotchExposed() ? " Your [pc.gear] is already off before you notice removing it.":""));
	else if(pc.isMischievous()) output("Leaving a gift-wrapped girl to suffer the chill of an unfilled ass would be downright cruel, you consider" + (!pc.isCrotchExposed() ? ", stripping off enough of your [pc.crotchCovers] to lend a helping hand":"") + ".");
	else output("You meet the girl’s gaze with a steady star and smile at her indignant glare. Clearly she hasn’t accepted her place just yet, you muse" + (!pc.isCrotchExposed() ? ", setting aside your [pc.crotchCovers]":"") + ". A lesson at your hands should prove instructive.");
	output(" The lust-stuffed atmosphere of the Tap-Hall is only partially responsible for your avid itch to sample the verdant-hued captive’s glossy, pre-lubricated ass. Your excruciatingly hard [pc.cockNounSimple " + x + "] feels almost numb as you step up to the mint-hued short stack. She eyes your cock with a wide, alarmed expression, her eyebrows arching to the peak of her tousled tresses. Her smaller size must surely make your member seem all the more intimidating.");
	output("\n\nPressing your crest against her plump, donut-lip anus, you take a moment to savor the involuntary bucking of her hips against the fuck-shelf’s restraints. She seems to be saying something, but her words are as much muffled by the wall between you as by the wildly disproportionate breasts wobbling atop her diminutive frame. You wonder if the pirates gave her those outrageous melons or if she did that to herself, but decide you really don’t care and focus on the task at hand.");
	output("\n\nYou press forward, into the girl’s sweat-slick rump with heated relish. Even lubricated, she’s so tight you can barely squeeze your [pc.cockHead " + x + "] past her tea-green ring. You huff a few deep breaths, lust-heat boiling in your lungs and sending tendrils of tingling urgency across your [pc.skinFurScales]. You seize hold of the goblin’s exposed inner thighs, sinking your fingers into the pliant handholds and push an inch deeper. She wiggles frantically, her heels helplessly kicking air as your girth spreads her public-use ass-pussy. Her taut abdomen visibly expands, the bulge of your encroaching tip pushing up her plugged cunt as you plumb her squeezing depths.");
	output("\n\nNo matter how many deep breath you take, you just can’t calm the urge to stuff the defenseless gabilani while she watches, bound and bucking. The last vestiges of your restraint vanish like whispers in the wind. ");
	if(pc.cocks[x].cLength() < 8) output("Plunging your full length in a single stroke, you ram your [pc.hips] against the green slut’s rotund rear with a lube-squelching slap.");
	else if(pc.cocks[x].cLength() <= 17) output("A half-foot at a time, you ram your length into the jade slut’s rippled rear until every last inch is buried in the alien slave.");
	else output("Though only the peaks of her hips muffintop through the wall’s oval, they’re thick enough to serve as handhold as you buck into the unprepared captive. Your girth strains against her containment, but you manage a full foot and a half into her large intestine before your progress is arrested by biology.");
	pc.cockChange();
	output(" Her eyes cross, irises contracting to pinpoints as the overwhelming sensations of your mismatched size spears through her mind. Clenching shudders all along your length tell you she’s orgasming harder than her small body is built for. As you’d guessed, she makes for a lovely cocksleeve. It’s a pity you can’t take her with you.");
	output("\n\nWhile the gabilani mindlessly rides her anal climax, you spear through her overstuffed hindquarters with relative ease. It’s not that she’s not squeezing you for dear life, it’s more that her muscles are just too weak to stand against your lubed length. Slapping and pumping the wall-slut to your heart’s content, you find yourself marvelling at the feel of her interior. The cushioned, bedding-like texture of her body, the taut sensation of her inner folds, the suckling draw of her whorish derriere... it’s like her ass was made for you.");
	output("\n\nYour vision darkens and sensations become flickering flashes of intense pleasure as your body takes the reigns. Pumping hard and fast into the voluptuous ass, her whole diminutive frame rocks against her restraints. Mammoth mammaries buffet her face, but every so often you can see the petite, panting pucker of her agape mouth, frozen in a blissed-out, soporific smile. You’re vaguely aware of an urgent tightness that must be your orgasm, but your frenzied state hardly registers such an insignificant detail. You slam against the lush, olive haunches jutting from the windowed wall, the gabilani girl’s fat-ringed asshole like a wedding band around your [pc.cock " + x + "].");
	var cumQ:Number = pc.cumQ();
	//cum volume low
	if(cumQ < 1000) output("\n\nBefore you realize it, you’re cumming, your orgasm weaving delicious tendrils of release into your fervent ass-pounding. " + (pc.balls > 1 ? "Your [pc.balls] clench as they strain to keep pace with the manic, reaming pace you’ve reached. ":"") + "You pound a fist against the thick plastic pane and bite your lower lip. Slapping her gut with your [pc.cockHead " + x + "], each wet plap delivering another spurt of your [pc.cumVisc] passion into her bowels. Her rump flushes from the relentless pace, faint red blush blossoming across her skin while her porn-star tits smack her face to a similar, humbled hue. You spunk her with everything you’ve got, slamming the nut all the way up into her belly, all while your capacity for cognizant thought recedes into an emerald haze.");
	//cum volume high
	else if(cumQ < 10000) 
	{
		output("\n\nIt feels like you’ve been slapped when your orgasm hits. Your [pc.cock " + x + "] pulses and bulges with the onrush, provoking a renewed tension all down your mast. She tenses but you’ve worn her down so savagely, that when your jizz hits her gut, her back arches and bucks wildly. Gouts of spunk rush into gabliani, so much so that at first you think her tits are growing even larger. It isn’t until your third or fourth load that you realize her gigantic bosom is merely being lifted up by the belly distending nut flooding into her.");
		output("\n\nDespite her race’s incredible elasticity, there’s only so much her stomach can take. " + (pc.balls > 0 ? "The weight of your [pc.balls] slapping against your inner thighs serves as an urging counterpoint to the fleshy sounds of your ass-twapping onslaught.":"") + " As you ram yet another load into her, you spy a trickle of gooey white running down through her cleavage. Apparently she’s so full, she started overflowing from her mouth! Even though your inner heat has been spent, you keep pounding her long after, spilling fresh gouts of excess across her slick skin.");
	}
	//cum volume hyper
	else 
	{
		output("\n\nThe crushing weight of your tectonic climax surges upward, distending your [pc.cock " + x + "] with the volume of its ascent. The goblin girl, feeling the rising thickness spreading her wider still, thrashes silently on the other side of the wall. Far too late to hold back, you catch the wall-slut’s rich hips in a white knuckled grip, rocking your plumping pressure for all its worth. Clenching your eyes shut at the moment of release, you can feel the impaled ass tighten uselessly as an uninterrupted stream of spunky goo rushes through her body. The gushing gallons can only flood her so fast, so a wake of [pc.cumColor] washes back past her trembling green donut hole and splashes across her exposed rump.");
		output("\n\nThe bulk of your seed runs its torrential path through the gabilani, saturating every crevice of her inner passages. It innundates her gut all the way up to her belly, which it swiftly fills. Your pounding loads expand the slut’s body to the point of obesity, but there is always another load to go. Her huge tits slide aside just long enough for you take her expression of confused alarm as her cheeks bloat and her glossy lips part, spilling your cream into her cleavage. You wallop that fat ass for all its worth while the inconceivable volume of your orgasm pumps fresh gallons to replace the old. " + StringUtil.capitalize(indefiniteArticle(pc.cumGem())) + " fountain sputters from her lips, drenching the interior of the goblin girl’s compartment with your excess. Filling the cube as a puddle at first, she tries to keep her mouth closed but the [pc.cumVisc] spills from her nostrils instead. The sealed container fills faster than you’d have believed, the green girl slowly vanishing in the rising tide of [pc.cumColor] cum. Your eyes close again, as you push yourself to empty completely and give that slut every last drop her ass has earned.");
	}
	//merge
	output("\n\nYour sight clicks back on, registering an uncertain passage of time. You don’t know how long you spent fucking the green skinned girl or how many time you came, but if her ");
	if(cumQ < 1000) output("cum-drunk expression is any indication, the two of you were at it for quite a while. Though all you can see above her bloated tits is her eyes, the dazed expression would look perfectly at home on a junkie who just had their hit. If she had any doubts about her new career as a public use cum dump, it seems she’s fully convinced now.");
	else if(cumQ < 10000) output("ballooned, cum-stuffed gut is any indication, the two of you were at it for quite a while. The narrow-waisted woman’s abdomen is so large that it dwarfs even her porn star J-cups. She has all the curves of an overfilled water balloon, her hoisted thighs squeezing the prodigious gut to fully block her vision of the world around her.");
	else output("nearly cum-filled compartment is any indication, the two of you were at it for quite a while. The narrow space on the other side of the translucent display wall looks very nearly like an aquarium, filled as it is with your slimy spunk. The peaks of her tips and her raised, restrained legs poke up through the [pc.cumColor] lake like verdant islands, while a pair of emerald lips just barely reach the surface. The fluid level does seem to be dropping slightly, bit by bit, from some too-narrow drain. Well, until then, at least you’ve given her a nice, warm bath.");
	output("\n\nYou pull yourself free of her still-clenching ass with some effort. Like pulling out a plug, the gooey excess of your bliss comes drooling from her freshly gaped booty. The well-used girl oozes like an over-filled condom and you give her a pat of appreciation on her jiggling, sweat-slick ass cheeks. Though a bit fatigued, your libido hasn’t appreciably diminished after your carnal spree. You don’t know if it’s the subliminal machines, the possibly pheromone-laced cherry perfume, or some other mechanism to keep the Tap-Hall’s clients at peak arousal, but you’re actually beginning to feel warm again.");
	pc.orgasm();
	while(pc.lust() < 33) { pc.lust(2); }
	pc.energy(-5);
	processTime(10 + rand(10));
	IncrementFlag("THICK_GAB_USED");
	pc.createStatusEffect("ThiccGobDisable");
	pc.setStatusMinutes("ThiccGobDisable",90);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Totally not Urta. Just a gray fox with a horsedick and a husband named Taoth :3 Don't tell nobody.
//Button:Fox Herm
//Tooltip: One eye-catching stall houses what is clearly a fox-girl with more than a little extra: a 20-inch horse-cock and orange-sized spunk-bunkers hanging just below.

//Early Approach
public function approachDatUrtaKnockoff():void
{
	clearOutput();
	showUrta();
	showBust("WALL_TURA_PORTRAIT");
	author("Fenoxo");
	output("Making your selection, you stride up for a better look at this potential partner. Embedded in the wall at her waist, this hermaphroditic fox-girl’s lower body is entirely on display. With her legs thrown up in a wide ‘V’ and held securely by rubberized straps while restraints bind her fluffy gray tail below, her genitals are perfectly arranged for your use - assuming you don’t mind lifting her heavy nuts out of the way for a better look at her pussy.");
	output("\n\nJust above those wobbling cumtanks is the fox’s baseball bat of a cock. Fully 20 inches long and equine in shape, it would look more at home on a leithan’s undercarriage than the petite fox from which it sprouts. No doubt it’d be aggressively slapping the wall if it wasn’t imprisoned in a snug, self-lubricating ring. Whenever sags the slightest amount, the faint buzz of vibrational motors whirs, and the head surges powerfully, bulging out in a thick, flaring lip around its crown. The toy winds down before the poor prick-vixen can release the monster load she’s been brewing, leaving her flare to pulse with her heart.");
	output("\n\nTransparent pre slicks the fox’s sodden shaft and balls as you glance to the accompanying display placard. Apparently her name is Tura, and in addition to costing 3,000 credits for her use, a special request is listed for her customers to give her their most <i>“virile, baby-making cumshots.”</i>");
	//PussPass
	if(pc.hasKeyItem("Puss Pass")) output("\n\nGood thing you won’t have to pay a dime if you want to make use of her.");
	output("\n\nDo you plow this vixen’s cunt?");
	processTime(3);
	clearMenu();
	if(pc.credits >= 3000 || pc.hasKeyItem("Puss Pass"))
	{
		if(pc.cockThatFits(1200) >= 0) addButton(0,"Fuck Cunt",cockSelect,[fuckThatExtendedUrtaReference,1200,false,0],"Fuck Cunt","Fuck her pussy.");
		else addDisabledButton(0,"Fuck Cunt","Fuck Cunt","You’re too big! You’d split her in half!");
	}
	else addDisabledButton(0,"Fuck Cunt","Fuck Cunt","You’re too poor to ride this ride.");
	addButton(4,"Back",pickWallSlut);
}

public function showUrta():void
{
	showBust("WALL_TURA");
	showName("WALL-FOX:\nTURA");
}
public function showTaoth():void
{
	showBust("TAOTH");
	showName("\nTAOTH");
}

//FUCK DAT CUNT!
public function fuckThatExtendedUrtaReference(x:int):void
{
	clearOutput();
	showUrta();
	author("Fenoxo");
	//Credits
	if(!pc.hasKeyItem("Puss Pass")) 
	{
		output("You bloop your credits into the machine without a second thought.");
		pc.credits -= 3000;
	}
	//Pass
	else output("You give your pass a swipe without a second thought.");
	//Merge
	output("\n\nBefore you can slam your stiff [pc.cockNounSimple " + x + "] into the fox-girl’s sopping cunt, you’ll have to do something about the hefty nuts hanging over it. You grab one, amazed at just how warm the fuzzy nad feels in your palm" + (!pc.isCrotchExposed() ? " while hurriedly working at your crotch to free the meat beneath your [pc.crotchCoverUnder]":" while gently stroking your exposed meat in anticipation") + ". Tura’s nuts are so large and heavy that it takes two tries to work both of them into your palm, but as soon as you do, the scent of horny fox reaches out and slaps you across the face.");
	output("\n\nThe herm-slut’s cunt is ripe with its own juices, the lips visibly pouting at their lack of fullness. Her clit, as inky as a moonless night, stands out like a cherry that’s ready to be plucked. You can’t stop yourself from gently touching it, just to see what it feels like. It’s firm, almost as hard as your dick and slicker than a swimming pool filled with lube. The fox’s asscheeks tremble at your caress, and her cunt squeezes down so hard that the lips visibly wink and exude a trickle of syrupy girlcum.");
	output("\n\nYou guide your [pc.cockHead " + x + "] up to Tura’s flexing gates, reveling in the vixen’s body heat for a moment before pushing through those slick lips and into the heavenly tunnel beyond.");
	//Size variants. No new PG.
	//Smol/normal
	if(pc.cocks[x].cLength() < 12) output("\n\nShe’s so wet that you glide in with a minimum of force, burying yourself all the way to your [pc.knotOrSheath " + x + "] in a single second of penetration. Her cunt hugs your cock like a long lost lover, squeezing itself down until every inch of dick is gently wrapped in adoring folds.");
	//12-18
	else if(pc.cocks[x].cLength() < 18) output("\n\nShe’s so wet that your dick barely meets any resistance on the way in, just a hint of friction as her oh-so-ready cunt stretches out around the mass of your impressive endowment. Her vagina blooms into a wide ‘O’ around your girth as the interior clenches down, massaging your every vein and crevice with raw, animal enthusiasm.");
	//18-26
	else if(pc.cocks[x].cLength() < 26) output("\n\nShe’s so wet that whatever resistance her cunt might have offered is smoothed away beneath a wave of liquid-lubed friction. Your eyes nearly cross from how her channel clutches and squeezes at you, hugging you tighter than a long lost lover. The fox-girl’s cunt feels almost shrink-wrapped to your [pc.cockNoun " + x + "], stretched out into a nerve-tickling delight film.");
	//26+
	else output("\n\nShe’s so wet that the obscene volume of cock you’re ramming inside her doesn’t hitch or hurt. It glides in slowly, distending her flexing passage around its inhuman girth an inch at a time. The fox-girl’s cunt strains, somehow growing even glossier as it distends into a widespread ‘O,’ the hard nub of her clit bouncing atop a vein to the tempo of your heartbeat. You watch in amazement as you push your prick-shaped distention past the wall’s seal and beyond, eyes only drawn away when your cock-holster’s toes curl in delight.");
	pc.cockChange();
	//Merge
	output("\n\nOver the steady thrum of the Tap-Hall’s aural stimulation systems, you pick out a muffled squeal of pleasure: <i>“Yessss!”</i>");
	output("\n\nAt the same time, Tura’s balls twitch powerfully, yanking themselves out of your palm as they draw closer to her crotch. There’s a gurgling, pumping sound from somewhere deep within her sexually taxed body, then her ring-restrained cock flares powerfully, only to be choked off by a sudden squeeze from its binding. The trembling equine cock strains futilely while a holographic display fizzes into existence above it, reading, <i>“Climax Detected. Allow? Y/N.”</i>");
	output("\n\nYou shudder, trying to adjust to the squeezing tightness and divert enough blood to your brain to make a decision at the same time. Do you let fox-slut cum?");
	processTime(10);
	pc.lust(50);
	clearMenu();
	addButton(0,"Y",yesLetUrtaCum,x);
	addButton(1,"N",noCummiesForUrta,x);
}

public function yesLetUrtaCum(x:int):void
{
	clearOutput();
	author("Fenoxo");
	showUrta();
	output("Not only do you reach out to give the ‘Y’ a firm press, but you curl your fingers down to graze the mighty member’s exposed flank while your thumb stretches upward to caress Tura’s powerfully bulging urethra. You marvel at how it pulses at your touch, the swollen equine fuckmeat trembling throwing out a ropey string of pre-cum before the inflating still further, heaving a rich and creamy load into the chamber.");
	output("\n\nA hoarse cry of delight reaches your ears through the wall’s otherwise capable insulation, and the fox-slut’s pneumatic press of a cunt scissors down around your. Her balls quiver, and as she blasts a titanic gout of pearlescent seed into the air, her flaring crowd balloons out nearly twice the width of her shaft. Tura’s slickened cunt’s grip falters, but her cock somehow stiffens further. It sprays cascading waves of goo up the wall. Her rich musk saturates the air. Alabaster webs cling between that mammoth equine tool and the soiled wall while spare shot glass sized droplets rain down across your [pc.chest] and crotch");
	if(pc.isCumSlut() || pc.isBimbo()) output(". You don’t let her waste too much, of course, affixing your mouth to the vixen’s sloppy cum cannon before she waste <i>too</i> much seed; swallowing her load is almost as good as fucking her twat");
	output(".");
	output("\n\n");
	showImage("WallTura");
	output("You turn your attention back to her sopping wet cunt while it flutters in artless ecstasy. You pound your [pc.cockNoun " + x + "] into it like a carpenter driving nails. Her ass and thighs jiggle and ripple with the force of the impacts. You barely notice the rivers of spunk sliding down her balls to bathe your dick, or that you’re fucking it right back into her. What you do notice is that Tura’s cunt feels almost molten around you, making exquisitely loud suckling sounds on your backstrokes. A healthy froth of off-white builds around her clinging lips as they strain to hold onto you, to pull you back in, and to smother you in Tura’s wanton heat.");
	//Balls deep
	if(pc.cocks[x].cLength() <= 20)
	{
		output("\n\nGoing balls deep, you spend a second to enjoy the way the fox’s cunt cradles your [pc.cock " + x + "], clutching it almost worshipfully");
		if(pc.balls > 0) output(", and in that moment, you realize that with your [pc.balls] dangling below and hers above, you’ve basically surrounded yourself in nut. Hers");
		else output(". Her balls");
		output(" slip and slide all over you, courtesy of her copious (and still going) orgasm, so when you adjust your angle and resume herm-stuffing, you actually get a greater appreciate for the understated friction of her ballsack’s nether-side. It feels nice to fuck a herm-girl through her own jizz, to reach up and give her dick a few idle pumps while slapping yourself home.");
	}
	//Toobigforballs deep
	else output("\n\nGoing as deep as her anatomy will allow, you find yourself wishing the excess alabaster lube could somehow take you deeper, but the snug ring of her cervix can only be battered back so far. You knew you’d probably be big for her to take entirely, but some small-minded, animal part of your brain still wanted to take her all the way. No matter. Hot cum drizzles over your [pc.cock " + x + "] while you knock on her uterus’s front door, and the soft underside of her ballsack proves an extra few inches of stimulation for the bits of you left to hang outside. It’s sopping wet and oh-so-slick against your tender organ, and wetter with every second that passes thanks to the prick-vixen’s ongoing orgasm" + (pc.isCumSlut() ? " and your own desire to gargle the mouthful you’ve already collected while letting the excess rain down on your face":"") + ".");
	//Merge
	output("\n\nStill holding Tura’s cock, you can feel her orgasm waning. It isn’t that it becomes any less stiff. Far from it; the tender shaft seems even larger than when she started. No, the thumb you rest upon her urethra can feel how the successive ejaculations are straining it less and less. No longer does the skin become so tight and glossy that it could be brand new latex. It gently bows outward, barely managing to shoot a rope a foot into the air. Cum splatters back down across the flare’s pulsating rim, which in turn drizzles it over your hand like a too-small umbrella in the tail-end of a hurricane’s path.");
	output("\n\nYou do the only think you can think of (besides continuing to fuck her): you stroke the herm fox’s cock. Tura’s beastly prick jumps as if shocked, and the flow of libidinous vixen-juice redoubles. The binding ring, already dilated to allow her orgasm, has to open up even further to keep from choking off her raging, cum-spewing cock. Tura’s cunt, seemingly empowered by the force of your jerking, begins to ripple enticingly around your length while you saw back and forth.");
	output("\n\nAll that warmth and wetness, around your cock and all over you, is too much - too intense for any mortal [pc.manWoman] to endure. You [pc.cock " + x + "] swells just like Tura’s did earlier");
	if(pc.cocks[x].hasFlag(GLOBAL.FLAG_FLARED)) output(" - exactly like hers did, thanks to your matching horse-like features");
	else output(", though not quite exactly owing to the differing shapes");
	output(", and you mount your climax just as you mounted this wall-bound cum-puddle of a fox.");
	var cumQ:Number = pc.cumQ();
	//Normie cum
	if(cumQ < 500) 
	{
		output("\n\n[pc.CumNoun] sprays deep into Tura’s cunt, smacking into her cervix" + (pc.cocks[x].cLength() > 20 ? " just as your [pc.cockHead " + x + "] did a moment ago":"") + ". Her pussy feels like it jumps four or five degrees in an instant. The massaging, muscular rippling sucks it deeper, keeping your [pc.cumVisc] [pc.cumNoun] from drooling out " + (pc.hasKnot(x) ? "around your [pc.knot " + x + "]":"across your [pc.sheath " + x + "]") + ". Even well and truly fucked out, her body finds the energy to secure its spermy prize where it has the greatest potential for impregnation" + (pc.cumQuality() <= 0 ? ", even if you are shooting blanks":"") + ".");
		output("\n\nYou groan in satisfaction as you come down from your climactic high, wallowing in the blissful caresses of the fox futa’s creampied cunny." + (pc.hasKnot(x) ? " Not like you could pull out right away with your [pc.knot " + x + "] lodged inside there, gaping Tura’s lips into a wide, satisfied ‘O’.":""));
	}
	//Big boi cummies
	else if(cumQ < 10000)
	{
		output("\n\n[pc.CumNoun] pours out of you in lances so thick and creamy that a single one would be sufficient to fully creampie your lover’s clutching cunt, but you’ve only just begun. Rope after extra-thick rope hoses down the vixen’s willing-but-obstinate cervix, slinging your impressive virility against the barrier of her cervix until you’re certain you’ve slung a few shot glasses worth of [pc.cumNoun] past the biological blockade." + (pc.hasKnot(x) ? " Your [pc.knot " + x + "] keeps any off-target sperm from sliding back out, and by the time your climax is on the wane, the interior of Tura’s pussy is practically pressured, forced to vent directly into her vacant womb.":" Without anything to seal your cummy but waning climax inside, Tura’s pussy drools streams of [pc.cumColor] white over your [pc.sheath " + x + "]. Your last few spurts produce especially messy flows. Wasted spunk sparkles in the air as it separates and falls to the floor in stringy webs."));
	}
	//Bigger boi cummies
	else
	{
		output("\n\n[pc.CumNoun] hoses out of you in a stream so thick and potent that it saturates the available space in Tura’s channel in an instant. Her cervix buckles beneath your load, admitting a sordid spray of raw virility directly into her vulnerable womb. It drinks deeply of your climax as you pump her greater and greater volumes into the slut-fox’s elastic body. There’s no way she’s not ballooning up on the other side of the wall, rounding out in pure pregnant parody until she could pass for a woman ");
		if(cumQ < 20000) output("several months into pregnancy");
		else if(cumQ < 30000) output("near the end of her pregnancy");
		else if(cumQ < 50000) output("about to birth twins");
		else if(cumQ < 70000) output("ready to birth triplets");
		else if(cumQ < 100000) output("about to birth quintuplets");
		else if(cumQ < 125000) output("carrying around an unborn gravball team");
		else output("carting around an inhuman amount of unborn offspring");
		output(".");
		//Knot bonus :3
		if(pc.hasKnot(x)) output("\n\nStrings of high-pressure [pc.cumNoun] sometimes spurt out around the straining seal your knot provides, glazing Tura’s lips and your [pc.thighs] alike in the glittering proof of your ecstasy. If it wasn’t for that inflated bulb of " + (InCollection(pc.cocks[x].cType, [GLOBAL.TYPE_CANINE, GLOBAL.TYPE_VULPINE, GLOBAL.TYPE_WORG, GLOBAL.TYPE_DOGGIE]) ? "canine":"alien") + " flesh, a [pc.cumGem] waterfall would be spilling out onto the floor" + (cumQ >= 125000 ? " and doing its damnedest to flood the entire facility":" to produce a slick puddle") + ". So much pressure builds inside the vixen’s spunk-suffused form that it takes a bit of force to hold yourself steady, even with your [pc.knot " + x + "] hanging onto her distended cuntlips for dear life.");
		//No knot boni
		else output("\n\nTorrents of pressurized [pc.cumNoun] backspray out around your [pc.sheath " + x + "], glazing Tura’s sodden quim and your [pc.thighs] alike. The glittering proof of your ecstasy refuses to be contained by something as meager as an unaugmented vagina. Enough [pc.cumGem] fluid escapes to paint the fox - not just her thighs, ass, and spooge-sponge of a tail, but her entire unseen body - tits and all. If you had access to her, you’d be painting her [pc.cumColor] white instead of the wall and floor. Your release is so excessive that even as you wind down, condom-filling loads of sperm-infused juice continue to rain down in front of your [pc.footOrFeet].");
		//The biggest boi cummies (bonus on bigger boi cummies)
		if(cumQ > 200000) output("\n\nA pink klaxon goes off overhead when your load begins to flood the booth, and well-placed vents in the floor pop open to drain away the excess. Squeegee-bearing robots wheel out of housings in the wall to do battle with the slimy morass, their little motors in overdrive as they struggle to keep up with Tura’s overflowing cunt.");
	}
	//merge
	output("\n\nYou pull out and wipe down with the provided cleaning towels" + (pc.isMischievous() ? ", giving the fox-slut a friendly swat on the ass to complement her good work":"") + (!pc.isCrotchExposed() ? ", then tuck your tackle away":"") + ", ready to face the universe once more.");
	processTime(25);
	pc.orgasm();
	pc.createStatusEffect("FoxyDisable");
	pc.setStatusMinutes("FoxyDisable",90);

	clearMenu();
	addButton(0,"Next",turaFinaleRouter,cumQ);
}

//[N]
public function noCummiesForUrta(x:int):void
{
	clearOutput();
	showUrta();
	author("Fenoxo");
	output("After a moment’s consideration (and another moment of savoring the way this slut-fox franticly clutches at your cock), you tap the glowing ‘N’. Something faintly hisses from inside the ring, and wall-woman’s hips seize in discomfort. Her cunt clamps down with vice-like force, trapping your [pc.cock " + x + "] while she writhes in a mixture of pleasure and pain, trapped on the edge and yet unable to leap over into the sea of bliss beyond. Tura squirms, thighs quivering, toes curling. Her pussy somehow grows juicier while small rivulets of gleaming pre-cum wind between down her heaving schlong to puddle in the creases of her ballsack.");
	output("\n\nShe writhes like that for a full twenty seconds before her cunt’s cruel pressure finally relents, allowing you to draw back for your first proper fuckstroke. Thrusting it straight back in seems almost brutish in the wake of what you’ve done, but you’re sure the denial will make Tura’s eventual release all the sweeter regardless of whether you’re the one to grant it. Dribbles of her musky nectar splatter your " + (pc.balls > 0 ? "[pc.sack]":"[pc.thighs]") + " on your push back in. The vixen’s cock-hungry cunt actually feels like it’s sucking you back in even as fresh slicks of girlish delight drip unimpeded across her asscheeks to stain the wall.");
	//Balls Deep
	if(pc.cocks[x].cLength() <= 20) output("\n\nYour lip peels back in a too-pleased smile when you finally take the fox-whore [pc.knotBallsHilt " + x + "]-deep. There’s no point in worrying about where her balls are resting when you can grab her by the ankles and " + (pc.cocks[x].cLength() >= 15 ? "nudge your [pc.cockHead " + x + "] against the squishy ring of her cervix":"burrow your [pc.cockHead " + x + "] so deep that you feel like you’ll lose yourself inside her") + ". So what if those heavy, swollen orbs slide against the top of your [pc.cock " + x + "] on the backstroke? They’re just as soaked in oily fox-lube as the clutching cuntlips below. It’s another tantalizing taste of pleasure for you to savor while pounding away at the wall-bound fox.");
	//Toobigforballs deep
	else output("\n\nYou snarl in delight and displeasure when your [pc.cockHead " + x + "] nudges up against the squishy but solid ring of the fox-whore’s cervix. Your whole length throbs in protest as you push harder, bowing slightly but unable to dive any deeper, forcing you to draw back for a shorter stroke and denying you the ecstasy of diving [pc.knotBallsHilt " + x + "]-deep. You grab her ankles, pumping your hips back and forth twice as fast to make up for the lack of depth, but you knew what you were doing when you grew this monster. You know that you’d be too big for most girls - that part of you would be hanging out, exposed to the chill air. It’s almost a relief that her balls are weighty and soaked with oily fox-lube. They rest atop your pumping shaft, stroking against you with every dive into the wall-bound’s fox velvet box.");
	//Merge
	output("\n\nThe ring binding your furry toy’s horse-prick relaxes somewhat, but she doesn’t surge back to full stiffness. Her imprisoned shaft retains all of its size but none of the rigidity, the flare wobbling beneath its own spongy weight instead of reaching out with womb-stretching authority, leaking out a steady flow of crystalline herm-juice in absolute submission, orgasm long forgotten.");
	output("\n\nTura’s cunt, meanwhile, gets better with every second that passes, warmer and tighter. When it squeezes now, it isn’t from the panic of a blocked orgasm but from the desire to take as much of your cock as possible for as long as possible. The lust-fattened lips cling tight to your [pc.dickSkin " + x + "], stretching when you draw back in an attempt to hold your veiny flesh as long as possible. On the instroke, they squish between the rest of her puffy mound and the inflexible wall of your cock, bulging out in engorged delight.");
	output("\n\nEvery " + (pc.cocks[x].cLength() <= 20 ? "hip-slapping":"cock-sheathing") + " pump carries with it the long, pronounced squelch of a pussy being properly used. Your cock throbs inside the velveteen folds, and you throw yourself into it, fucking fast and wild. Muscles burning, you rail her like a [pc.manWoman] possessed, feeling your [pc.cockNoun " + x + "] swell meaningfully, every inch fattened by lust and glittering with sensation. The best part about paying for a pussy to creampie is that you don’t have to worry about holding back. You can let loose whenever you choose.");
	var cumQ:Number = pc.cumQ();
	//Smol cummies
	if(cumQ < 100) output("\n\nThe weight of your orgasm feels like it slams into your hips from behind, throwing your [pc.cockNoun " + x + "] as deeply " + (pc.cocks[x].cLength() > 20 ? "as it can go":"as the fox-girl’s limited anatomy will allow") + ". You spurt your load into her suckling, hungry cunt one rope at a time, your [pc.cockHead " + x + "] swelling along with every spermy spurt to seal it inside" + (pc.hasKnot(x) ? ", though your [pc.knot " + x + "] does a much better job of that. No matter how much or how little you dump into her, you’re confident it’ll lock those virile droplets exactly where they need to be":"") + ". Groaning as you come down, you stand there for a moment, savoring the rhythmic squeezing of the fox-woman’s well-fucked twat.");
	//Med cummies
	else if(cumQ < 5000) output("\n\nOrgasm grabs hold of your hips and piledrives back and forth one last time, scissoring you home just in time for the first lance of boiling lust to erupt with womb-basting force. You blast stream after stream of creamy delight into Tura’s cunt, mixing your virile goo into her pussy’s puddled slickness it feels like one continuous, syrupy morass." + (pc.hasKnot(x) ? " If it wasn’t for your [pc.knot " + x + "], you know that some would be sloughing out with each passionate deposit, but your inhuman anatomy keeps your sperm locked in nice and tight.":" With each passionate deposit, a little leaks out, sliding down the crack of Tura’s ass and into her thick, spongy fur. The longer the creampie continues, the more sodden the fox’s thick gray brush becomes.") + " You grunt as you come down, spending a moment to savor the thankful, rhythmic squeezes the fox-woman’s well-fucked twat favors you with.");
	//Big Boi cummies
	else 
	{
		output("\n\nOrgasm grabs you by the ");
		if(pc.balls > 1) output("balls");
		else if(pc.balls == 1) output("ball");
		else output("crotch");
		output(" and explodes up your spine before you have time for another thought. The boiling, white-hot bliss of climax surges through your length with torrential force, bursting out a second later in the form of a tide of womb-drenching [pc.cumNoun]. You can feel it surge and whirl around your [pc.cock " + x + "], mixing with the copious cunt-juice into a potent sexual slurry, and that’s only from your first spurt. Ever great amounts of virile goo hose down the fox-woman’s well-fucked twat, rounding the bit of her abdomen out slightly, but you’re far from done.");
		output("\n\nYou cum like the true breeder you’ve become, not just drenching Tura’s passage but stuffing it full and then some." + (!pc.hasKnot(x) ? " Thick rivers of your excess pour out around your girth to slide down the crack of her ass and soak into the fibers of her furry tail, but the greatest portions remain inside.":" Not a single dribble escapes. Your [pc.knot " + x + "] seals her cunt tightly, trapping the fullness of your steaming hot load inside, where it belongs.") + " You’re sure that on the other side of the wall, her belly is inflating, rounding out in an obscene parody of the fecundity " + (pc.cumQuality() <= 0 ? "she’d soon experience, were you virile":"she’s liable to experience all too soon") + ". Spraying your last deposits, you smile and savor the caresses of her squeezing quim, muted by the pussy-inflating layer of seed between.");
	}
	//Merge
	output("\n\nYou pull out and wipe down with the provided cleaning towels" + (pc.isMischievous() ? ", giving the fox-slut a friendly swat on the ass to complement her good work":"") + (!pc.isCrotchExposed() ? ", then tuck your tackle away":"") + ", ready to face the universe once more.");
	processTime(25);
	pc.orgasm();
	pc.createStatusEffect("FoxyDisable");
	pc.setStatusMinutes("FoxyDisable",90);

	clearMenu();
	addButton(0,"Next",turaFinaleRouter,cumQ);
}

public function turaFinaleRouter(cummies:int):void
{
	if(cummies < 10000 || flags["MET_TAOTH"] == -1) 
	{
		mainGameMenu();
		return;
	}
	else
	{
		//Taoth first time meet cum threshold
		if(flags["MET_TAOTH"] == undefined)
		{
			clearOutput();
			showTaoth();
			author("Fenoxo");
			output("Before you can get to far, you’re stopped by a tall, gangly fox-morph, towering head-and-shoulders above the rest of the clientele. He seems nervous, looking back and forth and wringing his hands before daring to speak. <i>“Uh... hello. My name’s Taoth - not that you care, I know. I know.”</i> He idly smoothes the Cyber Punk-issue bodysuit he wears despite the complete lack of wrinkles. <i>“You fucked Tura... and I saw how much... how much cum you put in her. And... I wanted to thank you.”</i>");
			output("\n\nYou quirk an eyebrow at that.");
			output("\n\n<i>“It’s not like that! She’s my wife!”</i> Taoth pinches the bridge of his nose, bushy tail swishing in consternation. <i>“It’s... um, our mods fragged our genomes pretty good, to the point where we can’t conceive ourselves, and her chances are... miniscule. Anyway, you’re pumping out more than a rutting laquine, and that’s exactly what we need if we’re going to conceive. And I wanted to thank you for that. With money. Credits.”</i> Taoth scratches the back of his head, fumbling for a credit chit from his belt. <i>“If that’s okay? You put loads like that in her, and I’ll pay you back the credits, okay?”</i>");
			output("\n\nDo you accept his offer?");
			processTime(2);
			clearMenu();
			addButton(0,"Yes",dontTurnDownTaoth);
			addButton(1,"No",turnDownTaoth);
		}
		else
		{
			clearOutput();
			showTaoth();
			output("Taoth nervously hands you a credit chit to reimburse you for the cost of your visit. (+3000 credits)");
			pc.credits += 3000;
			clearMenu();
			addButton(0,"Next",mainGameMenu);
		}
	}
}

//[No]
public function turnDownTaoth():void
{
	clearOutput();
	showTaoth();
	author("Fenoxo");
	output("You turn down the offer.");
	output("\n\n<i>“Oh. Okay. I won’t bother you any more then.”</i> He twiddles his thumbs for a moment before loping away on legs that seem a bit too long for his frame.");
	output("\n\nYou doubt such a shy creature will work up the nerve to approach you a second time.");
	processTime(2);
	clearMenu();
	flags["MET_TAOTH"] = -1;
	addButton(0,"Next",mainGameMenu);
}
//[Yes]
public function dontTurnDownTaoth():void
{
	clearOutput();
	showTaoth();
	author("Fenoxo");
	output("You take the credit stick with a friendly nod. <i>“Sure thing.”</i>");
	output("\n\n<i>“Great!”</i> Taoth smiles, flashing a crooked fang. <i>“Super great. You uh, probably have places to be, huh?”</i> He fiddles with his shield belt like he doesn’t know where to put his hands. <i>“But you’re gonna come back again, right? We wanna make sure she’s... you know - good and pregnant, so it’ll probably take a lot of loads.”</i> He rocks back on his heels. <i>“A lot of ‘em. Probably like, twenty five or thirty or something. I didn’t do the math, but you be sure and come back. Spunk her up till she’s pregnant, kay?”</i> If his fur wasn’t already crimson, you’re fairly certain the blush beneath it would be tinting it that way.");
	output("\n\nYou nod even though you’re not entirely sure if you will just yet. Time will tell.");
	output("\n\n<i>“Great! I’ll uh, see you around then, stranger.”</i> Taoth lopes off without enough word, striding on legs that seem a touch too long for his lanky frame.");
	pc.credits += 3000;
	flags["MET_TAOTH"] = 1;
	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Demure Taur]
//White Leithan futa w/ horsecock
//lower torso, anal only (back and mid legs through, lay under for breeding press)
public function demureTaurWallIntro():void
{
	clearOutput();
	showName("\nLEITHAN");
	author("Adjatha");
	showBust("WALL_LEITHAN");

	output("One of the larger girls locked in the wall alcoves catches your eye. She’s a leithan, that much is obvious, though her coloration is singular: an albino! And no doubt a prize captive for whichever pirate grabbed her. The tauric woman’s upper body and front legs are hidden within the wall, but her rear four legs are enough to stick out past the shallow cell dividers and any hope of discrete modesty. The holo-pic on the wall displays a full-cheeked, heart-shaped face, her heavily lidded red eyes averted from the viewer in embarrassment. She has a considerable mane of elaborate, braided tresses, which suggests she may have come from money. A far cry from her current state.");
	output("\n\n");
	showImage("WallLeithan");
	output("Moving closer, you have a chance to admire the taur’s physique. Her wide, mare-like hips extend some distance from the oval hole her waist is stuck in. Her pale white scales are so fine they’re indistinguishable from oiled skin and the plates mounted along her back shimmer like polished alabaster. A short, un-armored tail ineffectually hugs her considerable rump tightly, too stubby to provide any modesty. Between her sculpted, champagne-hued ass lies a blushing, lilac anal ring as plump as a labia and glistening with the humiliated arousal of her indentured exposure. Just below her plugged, petal-perfect pussy hangs huge, dark purple balls squished between her back legs and a crude, animalistic sheath stuffed fat with her shameful girth.");
	output("\n\nThere is a pale white bio-plug in her pussy, but her ass and cock are open for business. It will cost " + demureTaurCost() + " credits to lay the leithan.");
	//PussPass
	if(pc.hasKeyItem("Puss Pass")) output(" Good thing <b>you won’t have to pay a dime</b> if you want to make use of her.");
	processTime(3);
	clearMenu();
	if(pc.credits >= demureTaurCost() || pc.hasKeyItem("Puss Pass"))
	{
		if(pc.cockThatFits(1300) >= 0) addButton(0,"Fuck Ass",cockSelect,[demureTaurAss,1300,false,0],"Fuck Ass","Take her ass for a ride.");
		else addDisabledButton(0,"Fuck Ass","Fuck Ass","You’re too big! You’d split her in half!");
	}
	else addDisabledButton(0,"Fuck Ass","Fuck Ass","You’re too poor to ride this ride.");
	addButton(4,"Back",pickWallSlut);
}

public function demureTaurCost():Number
{
	return 2500;
}

public function demureTaurAss(x:int):void
{
	clearOutput();
	showName("\nLEITHAN");
	showBust("WALL_LEITHAN");
	//no puss pass:
	if(!pc.hasKeyItem("Puss Pass")) 
	{
		output("The slot under her holo-pic takes your credit chit and bloops the go-ahead.");
		pc.credits -= demureTaurCost();
	}
	//has puss pass:
	else output("You insert your Puss Pass and get down to business.");
	//merge

	output("\n\nDespite being installed in a public use hole, it seems like the albino girl is largely untouched by the station’s denizens. Perhaps it’s the degree to which her rump juts out past the privacy walls, but it seems like she’s largely yours for the taking. Judging by the way her back legs anxiously paw at the ground and her tail ineffectually prods at her pussy plug, her predicament has apparently had an arousing effect on the captive woman. Well, just because the pirates may be intimidated by the chitin-armored alien, that’s no reason you can’t enjoy the unsullied maiden. " + (pc.tallness < (5*12) ? "You cast about for something to stand on, eventually finding a stray box somebody set left nearby. You’re going to need every inch you can get, when it comes to a lady like this!":""));
	output("\n\n" + (!pc.isCrotchExposed() ? "Pulling your [pc.crotchCovers] aside to give your [pc.cock " + x + "] room to hang, y":"Y") + "ou figure it wouldn’t hurt to make sure she’s ready and raring to go. You run a thumb along her broad flanks and down the smooth, slender length of her diminutive tail. She thumps a back paw against the ground at your touch, but as you reach her tail’s tip, the leg rises and trembles, shuddering in place. Lightly pinching the tender tip between your fingers, you pull it down to the rim of her plump asshole. Her leg kicks at the air but her tail doesn’t fight you as you run it across the raised, plush loop of her donut. Teasing the taur with a gradually diminishing spiral, you finally bring the tail to rest lightly against the muscle-taut sphincter. She stomps again, swaying her ass in a wide arc of shameful enjoyment, her tail slipping out of your hands and pulling away in a fashion that, incidentally, serves to present her posterior in a decidedly immodest fashion.");
	//pc has taur body
	if(pc.isTaur()) 
	{
		output("\n\nYou certainly need no stronger invitation than that. Your [pc.cock " + x + "] thumps the [pc.skinFurScales] of your undercarriage, roused to a bucking ardor at the ivory taur’s immediate submission. " + (flags["DEMTAUR_TAURED"] == undefined ? "Stepping forward enough to feel the heat pouring off of the girl’s backside, you have to wonder how long she’s been without a proper mate to mount her. Too long, you decide, as her back legs droop at your approach, her knees going weak in the presence of matched biology. She must be in desperate need indeed!":"Though she can’t see you, your approach is felt almost immediately. Her knees tense at the promise of a proper mounting and her heels rise to lift her rear to your level, eager for another wild ride. It seems she’s taken to your anal training with shameless zeal. Well, good ponies deserve rewards and you’re just the taur to give it to her."));
		output("\n\nKicking your front [pc.legOrLegs] up, your bulk lands heavily atop the leithan’s warm, delicate back-plates. " + (flags["DEMTAUR_TAURED"] == undefined ? "She sags somewhat under your encompassing pressure, but given that her upper body is mounted in the wall, she has little choice but to keep square and tall.":"Her back legs tremble at your weight, but her mid legs stay firm and upright as she pushes herself to remain standing.") + " One [pc.foot] at a time, you step forward until the great bulk of your lower body straddles the tremendous thickness of the snow white girl. You can feel the muscles beneath her silken scales tightening and clenching with the intimacy of your embrace - an intimacy shared by all the other patrons of the Tap-Hall by virtue of your body’s size.");
		if(pc.isNice()) output(" You avoid meeting any stares and have enough dignity to blush at the public display of your bestial mounting. A bit embarrassed, but certainly not enough to stop.");
		else if(pc.isMischievous()) output(" You flash a wide grin at the onlookers and offer a thumbs up, encouraging them to keep watching for what’s to come next. You’re met with scattered cheers and crude words of encouragement.");
		else output(" You meet the glances of onlookers with an expression that plainly states the only reason you’re not mounting them instead is that you’re busy at the moment. Most get the hint and go back to their own business.");
	}
	//merge
	output("\n\nYour wall-mounted pony’s shifts her stance, bucking back against your [pc.thighs] in the process. Her burdensome booty buffets your [pc.cock " + x + "], wobbling cheeks stroking your hoisted mast. Intentional or not, this filly’s ready for a stallion. You grab hold of the girl’s sides, your hardness guide itself past the milky warmth of her ample tush and right to the seething passion of her tail-hole. With your [pc.cockHead " + x + "] pressing lightly against her meek ring, the albino mare paws at the floor. The tip of her tail traces the length of your member, as if blindly measuring the scope of your imminent infiltration. The polished floor gives you an almost mirror-like view of her underside, the girl’s own shaft quickening in its sheath, plump, ivory inches peeking out from her sheath in anticipation.");
	if(pc.cocks[x].thickness() < 3) output("\n\nThere is just the faintest resistance as you press in, the big girl’s body taut but anxious. Spreading her sphincter with your easily enough, the fat band of plush muscle squeezes just enough to keep you from going too quickly, forcing you to savor each inch.");
	else output("\n\nDespite her size, the white maiden isn’t quite prepared for your mass. Stomping her back legs and pushing into your peak as best her confines allow, the two of you somehow manage to squeeze the tip of your cock past the compress of her taut sphincter.");
	output(" Your [pc.cockHead " + x + "] slips into the collaring ring of your mount’s posterior like a plug being pushed into place. Suckling heat engulfs your loins as her flushed biology ignites the intrusion like an engine starting between your [pc.thighs].");
	pc.cockChange();

	//first time:
	if(flags["DEMTAUR_FUKKED"] == undefined)
	{
		output("\n\nEven the first inch of penetration is too much for the leithan’s untouched, virgin ass. Her barely emerged horsecock spreads its flaring crest and practically lunges from its deep hued sheath. Her balls clench even tighter against her flanks and a geyser of white-gold spunk spurts in helpless spree. The gushing blast shoots upward, hosing her underside primarily, though some of the thick cream manages to splattering against the thighs of her middle legs, pooling around her trembling paws. Her tail twitches and flits restlessly in the throes of her first anal orgasm, her body trying to process the overflow of sensations.");
	}
	//repeat:
	else
	{
		output("\n\nMore used to your penetration, the leithan nevertheless reacts with knee-shaking delight at your first inch. The dark orbs between her thighs droop slightly, weighed down by the gravity of her carnal needs. A pale white cock slides out of the thick folds of her sheath, its mass ballooning with lust-glutted thickness. Her white-gold pre bubbles at the plump, flat peak of equine endowment, drooling desire onto the floor in splattering dollops.");
	}
	processTime(15);
	pc.lust(25);
	clearMenu();
	addButton(0,"Next",demTaurButt2,x);
}
public function demTaurButt2(x:int):void
{
	clearOutput();
	showName("\nLEITHAN");
	showBust("WALL_LEITHAN");
	author("Adjatha");
	output("You can’t help but smile at the taur’s prim and demure holo-pic staring back at you while her actual body is getting off on the slightest bit of anal stimulation, debasing herself with such enthusiasm. It’s almost more than your hyper-charged libido can stand. You " + (pc.isTaur() ? "tighten the grip of your forelegs around her midsection":"fill your hands with the pliant pillows of her copious rear") + " as you thrust forward, piercing her clenching hole in a single go. She kicks a leg back in shock, her inner walls pulling tight in irregularly spaced bands of rut-slick muscle." + (pc.balls > 1 ? " Your [pc.balls] slap against her weighty orbs while the overflowing wetness of her plugged pussy polishes both sets with a glistening heat. Holding her balls deep, you drive in with shallow thrusts, every stroke meaty enough to carry the vibrating impacts through her sheath and down her wobbling, bobbing member.":""));
	output("\n\nPulling back, you savor the narrowing closeness of each rippling internal loop as it tries to keep your peak from retreating. It isn’t until you reversing directions, that you find refreshed resistance every few inches. It’s as if her ass were lined with donut-thick sphincters all through the span of her devouring depths. It takes some getting used to, but before long you’re pumping at a steady pace, each hip-bobbing pluge forcing a couple of inches at a time. Once she’s swallowed everything you’ve got to give, you pull back through the gaped inner gates, ring by ring, before beginning again.");
	//first time:
	if(flags["DEMTAUR_FUKKED"] == undefined)
	{
		output("\n\nIt doesn’t take long until your relentless riding wears her down, breaking the filly into an obedient broodmare. Your swollen member claims her innocence in steady, pole-pumping thwacks that leave her legs weak and her tail limp. She slumps, but transfixed by your hardness, barely manages to remain upright. It’s not long before her fully engorged cock erupts again in overstimulated gouts, spilling her jizz in thick ropes. One of her mid legs lifts, the hefty paw rising to stroke the underside of her massive member as it spurts a few loads of wildly spirally cum across her underside. The more you fuck her, the more seed she spills, fountaining her helpless loads all the way to the wall imprisoning her.");
	}
	//repeat:
	else
	{
		output("\n\nBetter trained than her first time, the pale pony meets you, thrust for thrust, delighting in each breaching thwack of your [pc.cock " + x + "]. She even manages a degree of clenching control to let you speed up, the two of you rocking in quarter-time beats. Her massive cock bounces freely, slapping against her broad stomach while her heaving balls gradually descend in their drooping pouch before being tugged right back up with each orgasm. Her equine length spurts in time with your pounding while the puddle at fer paws grows wider and wider.");
	}
	//merge
	output("\n\nHer cunt clings to your [pc.cock " + x + "] with a needy, desperate desire, rewarding every panting thrust with a mirrored motion, humping in obedient rhythm to your pace. Even her silvery, scaled skin has flushed a wanton lavender as she floods with rutting heat. With a few more deep, savage plunges, you’re finally ready to turn this majestic mare into a proper cum dump. " + (pc.isTaur() ? "You put all your weight on your rear [pc.legOrLegs] before thrusting upward, burying":"You yank on her tail hard enough to haul her off her rear paws and bury") + " yourself as deep as you can before releasing your pent-up bliss. Liquid passion shoots into her and - incapable of doing anything less than obeying your body - her poor, depleted balls find a final reservoir of cum to match yours.");

	var cumQ:Number = pc.cumQ();
	//low cum:
	if(cumQ < 500) output("\n\nAn initial spurt of [pc.cumVisc] spunk jets into the leithan’s core, followed by another and another. Your surging heat multiplies against her own, irrepressible passions flowing both ways. With heavy, panting thrusts, you clap your [pc.thighs] against her bountiful booty. She bucks back against your [pc.cock " + x + "], her muscles riding your inches with disorganized fervor. She squeezes and slams into the liquid warmth spilling from your loins, desperate for more. Rather than sating her needs, your throbbing length driving inside her leaves the ivory mare hungrier, more desperate, and shudderingly needy for cum.");
	//high cum:
	else
	{
		output("\n\nLuckily for her, you’ve just begun.");
		if(pc.isTaur()) output(" Rocking atop her, you slam your hands against the wall and put every inch of your tauric spine into your thrusts.");
		else output(" Leaning down against her upraised tail and hooking your arms around the girl’s broad hips, you grab on for dear life.");
		output(" Your pounding becomes spasmodic as you let yourself go. Great gouts of [pc.cum] pour into the leithan, filling her with the bloating cream she so desperately craves. Your ejaculate gushes up against her inner, clenching walls and floods the space in short order. Her taut tunnel inflates with load upon load, [pc.cum] pushing deeper inside her greedy gut.");
		output("\n\nThe feel of your oversaturated reservoir pouring into every inch of her violated rectum proves just enough to rouse her flagging phallus. The alabaster woman tenses against you, stomping one last time before her body pours out everything it’s got. Deep purple balls lurch and her unblemished mast stiffens with vein-throbbing release. Despite the pool of golden-pearl goo beneath her, fresh ropes of sticky nut lance out to strike the the Slut-Wall. Her spurts clench in time with your own, as she were discharging the very cream you pump into her.");
		//hyper cum:
		if(cumQ >= 10000)
		{
			output("\n\nYet, even after she’s ceased her bucking and her cock has flopped heavily to the spunk-stained floor, your tanks keep draining. Seed drowns the deflowered girl in relentless gallons that rush through her with all the bestial lust you’ve been building towards. Her abdomen swells at the volume of your [pc.cum], inundating her from sphincter to her stomach. The feast of spunk balloons her midsection past the level of her knees, and all four rear legs tremble at the weight." + (pc.balls > 0 ? " Squishing your [pc.balls] against her fatigued sack, you let her feel every churning clench and heated load before unloading it inside her.":""));
		}
		//merge
	}
	output("\n\nIt isn’t until a passerby happens to accidentally brush up against your [pc.ass], that you remember you’re technically in a public place and sticking rather far out into the main thoroughfare. You catch your breath, and steady yourself as you " + (pc.isTaur() ? "gingerly dismount, careful not to tread on any paws.":"pull back, loosening your white-knuckled grip on her fine, equine ass.") + " Emptied of your warmth, she shudders, still savoring the ");
	if(cumQ < 5000) output("pool");
	else if(cumQ < 10000) output("lake");
	else output("ocean");
	output(" of anal ardor you left behind. Your unplugged creampie flows over the bio-plug in her pussy, down the girl’s considerably diminished balls, and washes over the retreating inches of her alabaster endowment.It’s not long, however, before her legs shake at your absence and she flops down on her ass with a spunky splash. The leithan hangs limply from her alcove, your excess pouring into the pond of her own white-gold seed with the pumping regularity of a heartbeat.");
	//drop lust to 30, remove 10-20 energy
	pc.orgasm();
	pc.energy(-5);
	pc.createStatusEffect("TaurDisable");
	pc.setStatusMinutes("TaurDisable",90);
	IncrementFlag("DEMTAUR_FUKKED");
	if(pc.isTaur()) IncrementFlag("DEMTAUR_TAURED");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Cum Bubble]
//Mouseover: Goo girls love Bubble Buddy snacks
public function cumBubblesOptionsForCherry():void
{
	clearOutput();
	showCherry();
	author("Adjatha");
	//first time
	if(flags["CHERRY_BUBBLE_TALK"] == undefined)
	{
		flags["CHERRY_BUBBLE_TALK"] = 1;
		output("As you’re speaking with the red rahn owner of the Tap-Hall, the two of you are interrupted by a passing pirate.");
		output("\n\n<i>“Some damn fine asses in there, Cherry,”</i> the half-clad laquine interjects, wiping the sweat of exhaustion from her brow. <i>“Keep the change,”</i> she adds with a grin, tossing a filled and tied-off latex condom to the goo girl before huffing her way to the exit.");
		output("\n\nCherry snatches the wobbling pouch out of the air with one hand and gives the hefty, blue ball an appreciative nod.\n\n<i>“Do you often get people tossing you gooey gifts?”</i> you ask.");
		output("\n\nShe shrugs and gives her bubble-filled belt a tug, attaching her latest prize to it. <i>“I’m here most of the time, so a few snacks are always appreciated.”</i>");
		//player hasn’t bought a Bubble Buddy
		if(!checkToyDrawer(BubbleBuddy))
		{
			output("\n\n<i>“Seems like you’ve got quite a bit to go through already,”</i> you point out.");
			output("\n\n<i>“Regular condoms I eat right off the bat, sure. But these are from Bubble Buddies. Some kind of special latex keeps the cum fresh and warm for years. You should get one,”</i> she teases, jutting out her hips to display her present collection of multi-colored cum bubbles.");
			output("\n\n<i>“Was that you asking for a tip?”</i>");
			output("\n\nCherry licks her black-glossed lips and folds her arms under her breasts. <i>“Well, I hear they’re useful when you’re on a long trip and don’t want to make a mess in your ship. And who knows, you might run across a rahn who wouldn’t mind taking a few bubbles off your hands,”</i> she notes, rising a suggestive eyebrow.");
		}
		//player owns a Bubble Buddy
		else
		{
			output("\n\n<i>“Bit like buying a drink for the bartender, is it?”</i>");
			output("\n\nRather than respond, the rose-hued gel girl unhooks one of the bubbles from her belt and pops it into her mouth without breaking eye contact with you. She moves it from one cheek to the other, closing her eyes in delight before taking a hard swallow. You can just barely make out the spherical shadow passing down her throat before it disappears for good.");
			output("\n\nYou’ll take that as a yes.");
		}
		processTime(5);
	}
	//repeat
	else
	{
		//player does not have a dick
		if(!pc.hasCock())
		{
			output("You’d have to be a real tease to hand her cum without the ability to make any more...");
		}
		else if(!pc.hasItemByClass(SmallCumBubble) && !pc.hasItemByClass(MediumCumBubble) && !pc.hasItemByClass(LargeCumBubble) && !pc.hasItemByClass(HugeCumBubble))
		{
			output("You don’t doubt Cherry would appreciate a little Steele Tech ‘donation,’ but it seems like you don’t have any of her favorite snacks on hand.");
		}
		//else
		else
		{
			output("Given Cherry’s fashion choices, you get the feeling she gratefully accepts donations. Care to give your gelatinous hostess a gooey gratuity?");
		}
		processTime(1);
	}
	//[Need a Buddy] [S.Bubble] [M.Bubble] [L.Bubble] [H.Bubble] [Nothing]
	clearMenu();
	giveCherryCummiesMenu();
}

public function giveCherryCummiesMenu():void
{
	clearMenu();
	if(!checkToyDrawer(BubbleBuddy)) addButton(0,"NeedABuddy",iNeedABuddyCherry,undefined,"NeedABuddy","You’d love to help her out, but you’re going to need a Bubble Buddy first.");
	else addDisabledButton(0,"NeedABuddy","NeedABuddy","You already own a bubble buddy.");
	if(pc.hasItemByClass(SmallCumBubble)) addButton(1,"S.Bubble",smallBubbleGiftForCherry,undefined,"Small Bubble","Give away a small bubble of cum.");
	else addDisabledButton(1,"S.Bubble","Small Bubble","You don’t have any small cum bubbles to give away.");
	if(pc.hasItemByClass(MediumCumBubble)) addButton(2,"M.Bubble",mediumBubbleGiftForCherry,undefined,"Medium Bubble","Give away a medium bubble of cum.");
	else addDisabledButton(2,"M.Bubble","Medium Bubble","You don’t have any medium cum bubbles to give away.");
	if(pc.hasItemByClass(LargeCumBubble)) addButton(3,"L.Bubble",largeBubbleGiftForCherry,undefined,"Large Bubble","Give away a large bubble of cum.");
	else addDisabledButton(3,"L.Bubble","Large Bubble","You don’t have any large cum bubbles to give away.");
	if(pc.hasItemByClass(HugeCumBubble)) addButton(4,"H.Bubble",hugeBubbleGiftForCherry,undefined,"Huge Bubble","Give away a huge bubble of cum.");
	else addDisabledButton(4,"H.Bubble","Huge Bubble","You don’t have any huge cum bubbles to give away.");
	addButton(14,"Back",goForCherryStuff);
}

//[Need a Buddy]
//mouseover: You’d love to help her out, but you’re going to need a Bubble Buddy first.
//remove this option if the PC already owns a Bubble Buddy
public function iNeedABuddyCherry():void
{
	clearOutput();
	showCherry();
	author("Adjatha");
	output("You mention that you were looking into getting a Bubble Buddy of your own, but weren’t quite sure where to pick one up. Judging by the way she unintentionally bites her lower lip, you’d say the remark has caught Cherry’s attention.");
	output("\n\n<i>“Well, I mean, I have plenty,”</i> she mentions, nonchalantly. <i>“Collect em. Like a hobby, you know? I could probably sell you one of my basic Buddies to save you a trip off-world. You know, as a favor.”</i>");
	//if the player has a Puss Pass:
	if(pc.hasKeyItem("Puss Pass")) output("\n\n<i>“I could maybe give you a discount,”</i> she adds, a bit too eagerly. <i>“Since you’re a regular.”</i>");
	processTime(2);
	clearMenu();
	//[Buy] [No Thanks]
	//costs 7500 credits normally, or 5000 if the player has a Puss Pass
	var cost:Number = 7500;
	if(pc.hasKeyItem("Puss Pass")) cost = 5000;
	output("\n\n<b>Buying a Bubble Buddy from Cherry will cost " + cost + ".</b>");
	if(pc.credits >= cost)
	{
		addItemButton(0, new BubbleBuddy(), function():void {
			clearOutput();
			eventQueue.push(cumBubblesOptionsForCherry);
			quickLoot(new BubbleBuddy());
		});
	}
	else addDisabledButton(0,"Buy","Buy","You can’t afford the " + cost + " credit cost.");
	addButton(1,"No Thanks",cumBubblesOptionsForCherry);
}

//[Any Bubble]
//if Cherry is cumflated, selecting any of the options below will display the following scene instead of the normal one:
public function gaveCumflatedCherryABubble(bubbleSize:Number):void
{
	clearOutput();
	showName("CHERRY\n& MOLLI");
	showBust(cherryBustString(),molliBustString());
	author("Adjatha");
	output("The ruby pirate shakes her head in disbelief as you hand her yet another gift. <i>“I’m still working off your last gratuity and you’ve got more coming? You sure you’re not a go’rahn in disguise?”</i>");
	output("\n\nCherry accepts the bubble but gives her belly a jiggling pat. <i>“You don’t mind if I hand this one off to Molli, do you? She works on tips, after all.”</i> Signaling the huge galotion with a wave, the crimson woman ");
	if(bubbleSize == 0) output("flicks the filled condom toward her curvy assistant.");
	else if(bubbleSize == 1) output("tosses her assistant the rubbery cum ball with an underhanded pitch.");
	else if(bubbleSize == 2) output("hands the hefty latex sack to an extremely grateful assistant.");
	else output("hoists the massive endowment toward her shocked looking assistant.");
	output(" <i>“Our friend here’s got so much to go around, even I can’t eat it all. Just don’t go begging for seconds, alright?”</i>");
	output("\n\nMolli lacks her employer’s solidity, so the bubble simply sinks into her curvaceous form, but she seems no less appreciative. <i>“Aren’t you just the sweetest darling,”</i> the pink giantess coos, wiggling her hips in hypnotically undulating waves. She leans forward and plants a warm, soft, wet kiss right on your forehead before oozing back to her appointed rounds.");
	output("\n\nWhile the two of you watch her go, Cherry waves a warning finger under your nose. <i>“You’re still not allowed to play with her, you know. A few gifts here and there are fine, but if you end up overloading her collar, I’m locking you in one of these booths and throwing out the key.”</i> You’re not sure if she’s serious or not.");
	output("\n\nThe Tap-Hall’s owner gives a cursory glance around to make sure everything’s running as intended before inclining her head toward her quarters. <i>“No good deed goes unpunished. You up for a little Cherry-Cream Pie?”</i>");
	processTime(5);

	giveCherryABubble(bubbleSize);
	//Cherry didn't keep this one!
	flags["CHERRY_LAST_BUBBLE_GIFT"] = undefined;
	//[Not Now] [Her Place]
	clearMenu();
	addButton(0,"Not Now",noCummiesNowForChubbyGoo);
	addButton(1,"Her Place",goToCherrysQuartersForBanging);
}

public function giveCherryABubble(bubbleSize:Number):void
{
	if(bubbleSize == 0) 
	{
		IncrementFlag("CHERRY_SMALL_BUBS");
		pc.destroyItemByClass(SmallCumBubble);
	}
	else if(bubbleSize == 1)
	{
		IncrementFlag("CHERRY_MEDIUM_BUBS");
		pc.destroyItemByClass(MediumCumBubble);
	}
	else if(bubbleSize == 2)
	{
		IncrementFlag("CHERRY_LARGE_BUBS");
		pc.destroyItemByClass(LargeCumBubble);
	}
	else
	{
		IncrementFlag("CHERRY_HUGE_BUBS");
		pc.destroyItemByClass(HugeCumBubble);
	}
	flags["CHERRY_LAST_BUBBLE_GIFT"] = bubbleSize;
	IncrementFlag("CHERRY_TOTAL_BUBBLE_GIFTS");
}

//[Not now]
public function noCummiesNowForChubbyGoo():void
{
	clearOutput();
	showCherry();
	author("Adjatha");
	output("<i>“Gonna give me a chance to burn off some of this water weight, huh?”</i> She slaps her belly, which jiggles like jelly at the impact. <i>“Shouldn’t be much longer.”</i>");
	processTime(1);
	clearMenu();
	addButton(0,"Next",goForCherryStuff);
}

//[Her Place]
public function goToCherrysQuartersForBanging():void
{
	clearOutput();
	showCherry();
	author("Adjatha");
	output("<i>“That’s what I like to hear. Sex drive to power a starship on this one,”</i> she muses, licking her lips and leading you off to her quarters.");
	pc.lust(5);
	//go to Cherry’s Quarters menu
	processTime(1);
	clearMenu();
	addButton(0,"Next",goToCherrysQuarters);
}

//[S.Bubble]
public function smallBubbleGiftForCherry():void
{
	if(cherryCumflated())
	{
		gaveCumflatedCherryABubble(0);
		return;
	}
	clearOutput();
	showCherry();
	author("Adjatha");
	output("Shifting through your equipment, you produce a small purple orb, about the size of a golf ball. The sealed condom is still warm with your spunk, and squishes between your fingertips as you raise the bubble to Cherry’s periphery.");
	output("\n\n<i>“Oh, for me?”</i> she inquires with pursed lips. <i>“Aren’t you the sweetest,”</i> she coos, her ponytail curling at its tip in delight.");
	output("\n\n");
	if(pc.isNice()) output("You place the bubble in one of her gloved hands with a charitable smile. <i>“My pleasure.”</i>");
	else if(pc.isMischievous()) output("<i>“Least I could do,”</i> you remark, bracing the ball on your thumb, and arcing it to her like you were flipping a coin. She snatches it out of the air with practiced ease.");
	else output("<i>“Here.”</i> You toss the bubble at her copious bust, the latex ball bouncing on her tits and sending a little quiver through her gelatin before settling in the ruby vale of her cleavage. She collects the prize with a laugh.");
	output("\n\nShe raises the shot-sized spunk bead to her polished lips and gives it a moist kiss. <i>“Mmmmm. I’ll have to save this for when you use the Wall next. Get a taste of what you’re pumping into the sluts.”</i> She affixes the bubble to her belt and leans forward to plant a second kiss on your cheek.");
	output("\n\nShe certainly seemed to appreciate the gift, though you suspect a single load is more a snack than a true meal to the ruby rahn.");
	processTime(5);
	pc.lust(2);
	giveCherryABubble(0);
	clearMenu();
	addButton(0,"Next",cumBubblesOptionsForCherry);
}

//[M.Bubble]
public function mediumBubbleGiftForCherry():void
{
	if(cherryCumflated())
	{
		gaveCumflatedCherryABubble(1);
		return;
	}
	clearOutput();
	showCherry();
	author("Adjatha");
	output("With Cherry watching curiously, you produce a fist-sized cum bubble and bounce it a few times in your palm. ");
	if(pc.isNice()) output("<i>“I thought you looked hungry, so I brought a snack.”</i>");
	else if(pc.isMischievous()) output("<i>“Is it Steele O’clock already? Well, time to kick back with a tall one.”</i>");
	else output("<i>“Any cum sluts around here in need of a fix?”</i>");
	output("\n\n<i>“My my,”</i> she purrs, admiring the hefty loads you’ve packaged for her. <i>“Aren’t you productive. If you don’t watch out, one of the Slyveren might just take you for a personal pet.”</i> She takes a step toward you, a little possessively. <i>“But not in my hall, at least.”</i>");
	output("\n\nYou had over the filled condom-ball and note how the rahn’s eyes widen a bit at the weight of it. <i>“Normally, I’d hold onto this for later...”</i> she remarks her hips shifting unconsciously in the cradle of her cybernetic legs. <i>“Or maybe put it in my collection,”</i> she adds in a low, appreciative tone. <i>“But...”</i> She licks her lips and glances up from the purple pouch, <i>“you don’t mind if I have a quick bite to eat, do you?”</i>");
	output("\n\nYou spread your arms magnanimously and take a step back to let her dig in.");
	output("\n\nCherry flashes you a pleased smile and turns her attention fully to the sizeable sphere in her hand. Her tongue, long and sinuous, slips past her lips and winds toward the fruit of your loins like a snake stalking its prey. The winding, half-foot organ drips with scarlet saliva as it wraps around the circumference of your gift, greedily squeezing the supple bulb with her oral lasso.");
	output("\n\n<i>“Das ‘ood ‘um,”</i> she remarks, lowering her hand and entrusting the full weight of your latex-sealed climax to her slender coil. Though her head bobs slightly, she remarkably manages to support the bubble with her drool-slick tongue alone. A few of the unoccupied patrons give a smattering of applause at the trick, but if Cherry notices it, she doesn’t react. All of her attention is centered wholly on the flavor-filled balloon inches from her lips.");
	processTime(5);
	pc.lust(4);
	clearMenu();
	addButton(0,"Next",mediumBubbleGiftForCherry2);
}

public function mediumBubbleGiftForCherry2():void
{
	clearOutput();
	showCherry();
	author("Adjatha");
	output("Slowly but steadily, she drags the tightly girdled gift to her pucker, pressing a kiss against the wobbling latex before opening wide. The seed-stuffed sack bulges against her narrow mouth, unable to pass at first. Her slippery tongue squeaks against the latex while fresh bubbles of saliva drool over her ebony lipstick, lubricating her puffy lower lip. The grasping tension around the bubble’s circumference tightens until the violet container is nearly pinched in two. Then, with a wet plop, the orb slips inside her mouth.");
	output("\n\nCherry’s cheeks bulge with the size of your bubble, her lips not quite able to close over it. Through the window of her parted mouth, you can see the length of the rahn’s tongue slipping and sliding all over the sphere, lapping at the rubber-bound blob filling her face. She gurgles her gratitude but you can’t make out a word of it through the ball-gag of your hefty condom.");
	output("\n\nWhen she’s savored the taste and feel of your cheek-stuffing load, Cherry throws her head back and attempts to swallow the bubble whole. You can see the bulge below her jaw where her snack is pressing against her tongue and the gulping contractions rippling down her throat as she gorges herself in front of everyone. It might be your imagination, but it looks almost like her cherry-red complexion has darkened in a blush of arousal.");
	output("\n\nGradually, the fist-sized lump in her neck slides down before hitting the first band of her leather collar. The gel girl touches her choker thoughtfully, but makes no move to remove the double banded cinch. Instead, the rahn’s ponytail wraps itself around the upper thigh of one of her robot legs, as if helping to brace her burdened jaw. She takes a guzzling quaff, but to no effect." + (flags["CHERRY_MEDIUM_BUBS"] == undefined ? " You start to wonder if rahn need to breathe, as it could become an issue in a moment.":""));
	output("\n\nCherry lowers her head and turns about, showing off the massive swell of your cum bubble distending her throat. With wink, she balls her fists and begins to swallow as vigorously as she can. Loud, wet gasps and throttled slurps bubble up from her bottlenecked gullet, her mouth filling with unswallowed saliva. The momentum of her exertion gives her entire upper body an eye-catching jiggle, the smaller cum bubbles on her belt slapping her hips and abdomen encouragingly.");
	output("\n\nThe bloated weight of your esophagus-stuffing ball is pulled against the straining, creaking choker bands so energetically, you’re not sure which will give first: the leather or the latex. Just as you’re sure you’re going to hear a pop, Cherry manages to drag the grapefruit sized ball past the restraining collar and sucks it down in a single, final gulp.");
	output("\n\nThe customers caught up in the display cheer and clap, but Cherry’s rosey, unguarded gaze is turned only to you. She smiles weakly, chest heaving as she fingers her neckband.");

	giveCherryABubble(1);

	//first time:
	if(flags["CHERRY_MEDIUM_BUBS"] == 1)
	{
		output("\n\n<i>“Delicious,”</i> she gasps, her upper body swaying unsteadily atop the robotic legs. <i>“My compliments to the chief.”</i>");
		output("\n\n<i>“My pleasure,”</i> you reply with a nod.");
		output("\n\n<i>“Next time, make it a double, okay?”</i>");
		output("\n\nAfter seeing that, you’re almost worried what she’d do with a bigger bubble!");
	}
	//second time:
	else if(flags["CHERRY_MEDIUM_BUBS"] == 2)
	{
		output("\n\n<i>“You’re spoiling me, you know,”</i> she teases with heavily lidded eyes. <i>“All that and not so much as a delivery fee.”</i>");
		output("\n\nYou tell her you’ll just put it on her tab.");
		output("\n\n<i>“Keep it up and one of these times I might end up popping my collar right off,”</i> Cherry tuts with affected reproach.");
		output("\n\nYou’d wager the latex will give out first, but it’d be fun to watch.");
		output("\n\n<i>“I didn’t mean the bubble would snap my collar,”</i> she flirts. <i>“I’m sure you’ve got something harder than a little latex on you.”</i>");
		output("\n\nShe blows you a kiss and turns back to the wall.");
	}
	//repeat:
	else
	{
		output("\n\n<i>“You know, I think I could really go for a bigger meal,”</i> she pants, her face flushed. <i>“You got a little time?”</i>");
		processTime(4);
		pc.lust(5);
		clearMenu();
		addButton(0,"Not Now",mediumBubHerPlaceNotNow);
		addButton(1,"Her Place",mediumBubHerPlace);
		return;
	}
	processTime(4);
	pc.lust(3);
	clearMenu();
	addButton(0,"Next",cumBubblesOptionsForCherry);
}

//[Not Now]
public function mediumBubHerPlaceNotNow():void
{
	clearOutput();
	showCherry();
	author("Adjatha");
	output("<i>“Fair enough,”</i> she murmurs, stroking her throat with a gloved hand. <i>“But the offer’s still on the table for next time.");
	//replace [Cherry] with [Molli] on the Tap-Hall menu for 4 hours
	//Fen note: Adjatha left that note, but the text doesn't indicate that she leaves. Therefore she stays in this instance!
	clearMenu();
	addButton(0,"Next",cumBubblesOptionsForCherry);
}

//[Her Place]
public function mediumBubHerPlace():void
{
	clearOutput();
	showCherry();
	author("Adjatha");
	//first time
	if(flags["CHERRY_HER_PLACE_INVITED_NORMAL"] == undefined)
	{
		flags["CHERRY_HER_PLACE_INVITED_NORMAL"] = 1;
		output("<i>“Two meals in a row? I should be careful or I’ll lose my figure. It’s right over here,”</i> she indicates, pointing to a steel door at the far end of the Tap-Hall. <i>“Oh, but first...”</i>");
		output("\n\nThe rahn reaches behind her and pulls a ruby red bubble somewhat unlike the filled condoms on her belt. <i>“Hey Molli,”</i> she calls to the chubby, pink galotian scooting around the Tap-Hall, cleaning recently used stalls with bubbly enthusiasm. <i>“Catch.”</i>");
		output("\n\n<i>“Huh?”</i> The goo girl turns as Cherry lobs the crimson sphere to her, eyes following the slow arc of the ball all the way up and back down, but making no attempts to grab it. The fluid-filled pouch plops on the slime’s bountiful cleavage and slowly sinks down into her. <i>“Oh! A rahn egg!”</i>");
		output("\n\n<i>“I’ll be in my quarters for a bit. If anybody breaks the rules, hit ‘em with the toxin and I’ll deal with ‘em when I get back. Got it?”</i>");
		output("\n\n<i>“I’ll Cherry Bomb them!”</i> she confirms with a gooey, dripping salute.");
		output("\n\nWith that, Cherry turns to a hefty steel door marking her quarters, Her high-heeled cybernetic legs arch each step to send jiggles through her polished, bubble butt. The long, swaying ponytail behind her curls with a motion for you to follow and that’s just what you do.");
		processTime(5);
		pc.lust(3);
	}
	//repeat
	else
	{
		output("The ripe rahn girl leaves one of her Cherry Bombs with the plump galotian and leads you back to her room.");
		processTime(1);
	}
	//go to Cherry’s Quarter’s
	clearMenu();
	addButton(0,"Next",goToCherrysQuarters);
}

//[L.Bubble]
public function largeBubbleGiftForCherry():void
{
	if(cherryCumflated())
	{
		gaveCumflatedCherryABubble(2);
		return;
	}
	clearOutput();
	showCherry();
	author("Adjatha");
	//first time:
	if(flags["CHERRY_HER_PLACE_INVITED_NORMAL"] == undefined)
	{
		flags["CHERRY_HER_PLACE_INVITED_NORMAL"] = 1;
		output("Hoisting your latex-sealed load with both hands, you present Cherry with a filled condom roughly the size of her head. She arches an eyebrow and gives a low whistle.");
		output("\n\n<i>“Damn [pc.boyGirl], you do that all by yourself? Color me impressed.”</i> She does, in fact, appear to be blushing slightly as she takes the wobbling bowling ball of spunk from you. She pulls it close and presses an ebony kiss to the purple rubber, holding it there to savor your trapped heat on her lips.");
		output("\n\n<i>“Well, I think this one’s a bit big for my belt,”</i> she laughs, tucking the violet sphere under one arm. <i>“And if I were to try to eat it here, I’d end up making a bigger mess than my employees in the wall!”</i>");
		output("\n\nGiven the pressure all your [pc.cumColor] goo is putting on the bubble’s elastic, you have to admit she’s got a point.");
		output("\n\n<i>“Gonna have to take this babe to my quarters. But I don’t want you to think I’m ungrateful, so why not come with? I’m sure by the time we get there I’ll have thought of some way to properly thank you.”</i>");
	}
	//repeat
	else
	{
		output("Hoisting your latex-sealed load with both hands, you present Cherry with another melon-sized cum bubble. It would seem your gifts never seem to lose their impact on her, as the rahn turns a deeper red at the mere sight of the thing.");
		output("\n\n<i>“Never one to disappoint huh? Given this kind of output, I can’t imagine why you don’t have a little pet rahn of your own,”</i> she purs as she takes the wobbling bowling ball of spunk from you. <i>“So, my place or yours?”</i> she asks as she turn to her quarters for a suitably messy festivities.");
	}
	processTime(5);
	pc.lust(2);
	giveCherryABubble(2);
	clearMenu();
	addButton(0,"Not Now",largeBubHerPlaceNotNow);
	addButton(1,"Her Place",largeBubHerPlace);
}

//[Not Now]
public function largeBubHerPlaceNotNow():void
{
	clearOutput();
	showCherry();
	author("Adjatha");
	//first time
	if(flags["CHERRY_HER_PLACE_INVITED_NORMAL"] == undefined)
	{
		flags["CHERRY_HER_PLACE_INVITED_NORMAL"] = 1;
		output("Cherry gives a shrug and jiggles her creamy prize. <i>“Suit yourself. I’ll have to get one of these from the right from tap another time. For now, I’ve got plenty to work through.”</i>");
		output("\n\nThe rahn reaches behind her and pulls a ruby red bubble somewhat unlike the filled condoms on her belt. <i>“Hey Molli,”</i> she calls to the chubby, pink galotian scooting around the Tap-Hall, cleaning recently used stalls with bubbly enthusiasm. <i>“Catch.”</i>");
		output("\n\nThe goo girl turns as Cherry lobs the crimson sphere to her, eyes following the slow arc of the ball all the way up and back down, but making no attempts to grab it. The fluid-filled pouch plops on the slime’s bountiful cleavage and slowly sinks down into her. She claps happily.");
		output("\n\n<i>“I’ll be in my quarters for a bit. If anybody breaks the rules, hit ‘em with the Cherry Bomb and I’ll deal with ‘em when I get back. Got it?”</i>");
		output("\n\nWith that, Cherry turns to a hefty steel door marking her quarters, Her high-heeled cybernetic legs arch each step to send jiggles through her polished, bubble butt as she goes. She gives you a glance back, pursing her lips playfully before the door closes.");
	}
	else
	{
		output("<i>“Busy busy. Let me know when that schedule clears up, won’t you?”</i> The rahn tosses her janitor a Cherry Bomb to keep the peace in her absence before taking a dinner break in her quarters.");
	}
	///replace [Cherry] with [Molli] on the Tap-Hall menu for 4 hours
	sendCherryToHerRoom();
	processTime(4);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Her Place]
public function largeBubHerPlace():void
{
	clearOutput();
	showCherry();
	author("Adjatha");
	//first time:
	if(flags["CHERRY_HER_PLACE_INVITED_NORMAL"] == undefined)
	{
		flags["CHERRY_HER_PLACE_INVITED_NORMAL"] = 1;
		output("<i>“I was hoping you’d say that. Something as exciting as this demands a... captive audience,”</i> she laughs. <i>“Oh, but first...”</i>");
		output("\n\nThe rahn reaches behind her and pulls a ruby red bubble somewhat unlike the filled condoms on her belt. <i>“Hey Molli,”</i> she calls to the chubby, pink galotian scooting around the Tap-Hall, cleaning recently used stalls with bubbly enthusiasm. <i>“Catch.”</i>");
		output("\n\n<i>“Huh?”</i> The goo girl turns as Cherry lobs the crimson sphere to her, eyes following the slow arc of the ball all the way up and back down, but making no attempts to grab it. The fluid-filled pouch plops on the slime’s bountiful cleavage and slowly sinks down into her. <i>“Oh! A rahn egg!”</i>");
		output("\n\n<i>“I’ll be in my quarters for a bit. If anybody breaks the rules, hit ‘em with the toxin and I’ll deal with ‘em when I get back. Got it?”</i>");
		output("\n\n<i>“I’ll Cherry Bomb them!”</i> she confirms with a gooey, dripping salute.");
		output("\n\nWith that, Cherry turns to a hefty steel door marking her quarters, Her high-heeled cybernetic legs arch each step to send jiggles through her polished, bubble butt. The long, swaying ponytail behind her curls with a motion for you to follow and that’s just what you do.");
	}
	else
	{
		output("Cum bubble in hand, the ripe rahn girl leaves one of her Cherry Bombs with the plump galotian and leads you back to her room.");
	}
	//go to Cherry’s Quarter’s
	processTime(2);
	pc.lust(3);
	clearMenu();
	addButton(0,"Next",goToCherrysQuarters);
}

//[H.Bubble]
public function hugeBubbleGiftForCherry():void
{
	if(cherryCumflated())
	{
		gaveCumflatedCherryABubble(3);
		return;
	}
	clearOutput();
	showCherry();
	author("Adjatha");
	//first time
	if(flags["CHERRY_HUGE_BUBS"] == undefined)
	{
		output("With a bit of effort, you heave the beach ball sized condom up to Cherry’s stunned surprise. ");
		if(pc.isNice()) output("<i>“I understand Rahn are fond of these sorts of gifts,”</i> you note, adjusting your grip as the distended rubber squeaks between your fingers.");
		else if(pc.isMischievous()) output("<i>“Hey, I was cleaning up my ship and I found one of these just lying around. Crazy, huh?”</i>");
		else output("<i>“Your clients get plenty of jizz, so it seems appropriate you join them,”</i> you offer with a grin.");
		output("\n\nThe crimson rahn blushes a few shades redder, her ponytail curling around one of her cybernetic legs. <i>“This is... wow. Just wow. That was from just one...? Okay. You’re coming with me. Right now.”</i>");
		output("\n\nShe grabs your elbow with a gloved hand and reaches behind her with the other, pulling a ruby red bubble from her belt. It looks different from the filled condoms. <i>“Hey Molli,”</i> she calls to the chubby, pink galotian scooting around the Tap-Hall, cleaning recently used stalls with bubbly enthusiasm. <i>“Catch.”</i>");
		output("\n\n<i>“Huh?”</i> The goo girl turns as Cherry lobs the crimson sphere to her, eyes following the slow arc of the ball all the way up and back down, but making no attempts to grab it. The fluid-filled pouch plops on the slime’s bountiful cleavage and slowly sinks down into her. <i>“Oh! A rahn egg!”</i>");
		output("\n\n<i>“I’ll be in my quarters for a bit. If anybody breaks the rules, hit ‘em with the toxin and I’ll deal with ‘em when I get back. Got it?”</i>");
		output("\n\n<i>“I’ll Cherry Bomb them!”</i> she confirms with a gooey, dripping salute.");
		output("\n\nWith that, she practically hauls you off to her quarters, her stomping setting an urgent pace for everyone in the Tap-Hall to hear. <i>“Oooh, somebody’s in trouble,”</i> one of the pirates laughs as you pass by. Cherry’s ponytail instinctively whips around and slaps him upside the head, dropping the man in a paralyzed heap. She doesn’t seem to notice.");
		processTime(5);
		pc.lust(4);
		clearMenu();
		addButton(0,"Next",firstTimeHugeBubCherrysPlace);
	}
	//repeat
	else
	{
		output("The red rahn claps her hands over her mouth as you present her with another magnum-sized, cum-bloated condom nearly as big as her entire gel body. She blushes and her eyes flit between you and the steel door at the end of the Tap-Hall leading to her private quarters. She swallows hard and then immediately gives in.");
		output("\n\nChucking a Cherry Bomb to the goo girl janitor in case she needs to knock out any troublemakers, the zel’rahn hurries your latest gift off to her quarters for some vigorous appreciation. You could join her, if you wanted to.");
		processTime(2);
		pc.lust(3);
		clearMenu();
		addButton(0,"Not Now",hugeBubHerPlaceNotNow);
		addButton(1,"Her Place",hugeBubHerPlace);
	}
	giveCherryABubble(3);
}

public function firstTimeHugeBubCherrysPlace():void
{
	clearOutput();
	showCherry();
	moveTo("CHERRYSROOM");
	author("Adjatha");
	output("The steel door at the end of the Tap-Hall slides closed behind the two of you and your host turns on your gift with stars in her eyes. <i>“Sweet, slimy fuck,”</i> she mutters, pulling one of her gloves off to run a hand along the warm, wobbling surface of the mammoth prophylactic. <i>“It’s so beautiful...”</i> she murmurs, emotion bubbling in her voice to the point that you’d almost think she was on the verge of tears.");
	output("\n\n<i>“Wait, I’ve got something for this!”</i> Before you can even take stock of your surroundings, the gelatinous girl pulls you to a desk with a digital rig and a holoscreen. She taps out something on the keypad and uses her gloved hand to grab your chin and tilt your face to a small blue dot that appears on the screen. <i>“Smile!”</i>");
	output("\n\nThe dot flashes and the computer start making a high buzzing sound. Cherry stoops down and retrieves a small, glossy square from a nearby printer, brandishing your picture proudly. <i>“Perfect!”</i>");
	output("\n\nYou’re about to ask what she’s doing, but the enthusiastic proprietress holds her arms out. <i>“May I?”</i> she asks, tenderly taking the latex blob from you, cradling it gingerly. Peeling the back off the picture, Cherry presses the photographic film onto your huge cum bubble. <i>“Magnificent.”</i>");
	output("\n\nYour eyes are drawn almost magnetically to another corner of the room, where a pair of similarly sized cum bubbles are resting. One has a picture of a surprised looking, black-furred laquine" + (flags["SHOCK_HOPPER_DEFEATED"] != undefined ? " that you recognize as the leader of the Jumpers gang":"") + ". The other bloated spunk sack has a rather pleased looking kui-tan pirate" + (flags["KIRO_BAR_MET"] != undefined ? " whose Tamahime charms are all too familiar to you":"") + ".");
	output("\n\nYou scratch your head, looking at the trophy-pillow she’s made of your jizz satchel.");
	if(pc.isNice()) output(" <i>“Um, I have some questions.”</i>");
	else if(pc.isMischievous()) output(" <i>“Does this mean you’re not hungry?”</i>");
	else output(" <i>“... the fuck?”</i>");

	output("\n\n<i>“Huh? Oh. Oh!”</i> For the first time, Cherry seems to realize what she’s doing might be a bit odd. <i>“This isn’t what it looks like!”</i> She hugs the torso-sized cum balloon in embarrassment.");
	output("\n\nYou ask what it is, exactly.");
	output("\n\n<i>“It’s not, like, a stalker thing, okay? It’s just, you know, I’m a... connoisseur.”</i> She puffs herself up a bit, trying to regain a measure of the cool dignity she had before geeking out about a gigantic condom. <i>“This kind of volume doesn’t just happen, you know. Even most kui-tan can’t come close to this with a single load. I just really respect that kind of dedication, okay?”</i>");
	output("\n\nYou look at the long, torso-sized purple mass bearing your likeness, then back to the other two on her bed. <i>“Do you sleep with them?”</i>");
	output("\n\nCherry’s eyes dart around the room. <i>“... no?”</i> she hazards. <i>“Anyway, that’s not important!”</i> She waves a hand dismissively, striding to the bed and carefully laying her newest acquisition next to the its cousins.");
	output("\n\nStraightening up, she takes a deep breath and clears away the awkward event with a rise of her eye-popping E-cups. <i>“Now then.”</i>");
	//[Next]
	//go to Cherry’s Quarters
	clearMenu();
	addButton(0,"Next",goToCherrysQuarters);
}

//[Not Now]
public function hugeBubHerPlaceNotNow():void
{
	clearOutput();
	showCherry();
	author("Adjatha");
	output("You’ll leave her own perversions for the time being. You’ve got other things to deal with at the moment.");
	processTime(1);
	clearMenu();
	//replace [Cherry] with [Molli] on the Tap-Hall menu for 4 hours
	sendCherryToHerRoom();
	addButton(0,"Next",mainGameMenu);
}

//[Her Place]
public function hugeBubHerPlace():void
{
	clearOutput();
	showCherry();
	author("Adjatha");
	output("You follow along, getting a face-full of Cherry’s extra intense, sweet-smelling perfume as as you do.");
	//go to Cherry’s Quarters
	clearMenu();
	addButton(0,"Next",goToCherrysQuarters);
}

//[Bubbled]
//only display this option if Cherry’s status is Cumflated
//mouseover: With Cherry still cum-fattened from your previous feeding, she should be safely fuckable.
public function bubbledBitchesNeedBoounced():void
{
	clearOutput();
	showCherry();
	author("Adjatha");
	output("The gravid silhouette of the Tap-Hall’s blushing owner of can’t help but draw your eye. Siddling next to her, you lean over and whisper to ask if she’s still safe to touch.");
	output("\n\nCherry sweeps her ponytail over one shoulder and fiddles with the tip as she considers. <i>“Well, yes... I should really stay out here to watch over things, but...”</i> she bites her lower lip, eyes straying toward the door to her quarters at the far end of the hall.");
	output("\n\n<i>“Uh, Molli? You got things out here?”</i> she calls to the pink galotian who nods with a happy, placid smile. Cherry grabs your elbow and drags you off to her quarters for a little leisure.");
	output("\n\n<i>“You know, if you keep this up, I’m going to end up forgetting how to make my toxin,”</i> she whispers, accusingly. You offer an innocent shrug.");
	//go to Cherry’s Quarters.
	processTime(4);
	pc.lust(4);
	clearMenu();
	addButton(0,"Next",goToCherrysQuarters);
}

public function goToCherrysQuarters():void
{
	moveTo("CHERRYSROOM");
	//Cherry’s Quarters
	//Secondary doc split off for ease of reference: https://docs.google.com/document/d/12i-hLq4qSNwX0oq8FaCIopEANPpXAj6ipLGoo7YRH4/edit?usp=sharing
	mainGameMenu();
}
public function leaveCherrysPlace():void
{
	moveTo("WALL SLUTS");
	sendCherryToHerRoom();
	mainGameMenu();
}
//show noisy rodents
public function wallSlutsShowNoisyRodents():void
{
	//in case there end up being different bust for tits sizes
	//var tits:int = wallSlutsNoisyRodentsTitsSize();
	showName("NOISY\nRODENTS");
	showBust("WALL_NOISYRODENTS");
	author("William");
}
//get current rodents tits size 0 = both, 1 = walnut, 2 = chestnut
public function wallSlutsNoisyRodentsTitsSize(slut:int=0):int
{
	var tits:int = 0;
	wallSlutsNoisyRodentsReduceCum();
	if (slut <= 1 && flags["WALLSLUTS_NOISY_RODENTS_WALNUT_CUM"] != undefined)
	{
		if (flags["WALLSLUTS_NOISY_RODENTS_WALNUT_CUM"] >= 3000) tits = 3;
		else if (flags["WALLSLUTS_NOISY_RODENTS_WALNUT_CUM"] >= 1000) tits = 2;
		else if (flags["WALLSLUTS_NOISY_RODENTS_WALNUT_CUM"] >= 300) tits = 1;
	}
	if ((slut == 0 || slut == 2) && flags["WALLSLUTS_NOISY_RODENTS_CHESTNUT_CUM"] != undefined)
	{
		if (flags["WALLSLUTS_NOISY_RODENTS_CHESTNUT_CUM"] >= 3000 && tits < 3) tits = 3;
		else if (flags["WALLSLUTS_NOISY_RODENTS_CHESTNUT_CUM"] >= 1000 && tits < 2) tits = 2;
		else if (flags["WALLSLUTS_NOISY_RODENTS_CHESTNUT_CUM"] >= 300 && tits < 1) tits = 1;
	}
	
	return tits;	
}
//total creampies 0 = both, 1 = walnut, 2 = chestnut
public function wallSlutsNoisyRodentsCreampies(slut:int=0):int
{
	var creampies:int = 0;
	
	if (slut <= 1 && flags["WALLSLUTS_NOISY_RODENTS_WALNUTTED"] != undefined) creampies += flags["WALLSLUTS_NOISY_RODENTS_WALNUTTED"];
	if ((slut == 0 || slut == 2) && flags["WALLSLUTS_NOISY_RODENTS_CHESTNUTTED"] != undefined) creampies += flags["WALLSLUTS_NOISY_RODENTS_CHESTNUTTED"];
	
	return creampies;	
}
//returns last creampie choice 0 = none, 1 = walnut, 2 = chestnut, 3 both
public function wallSlutsNoisyRodentsLastCreampie():int
{
	var creampies:int = 0;
	
	if (flags["WALLSLUTS_NOISY_RODENTS_NUT_CHOICE"] != undefined) creampies = flags["WALLSLUTS_NOISY_RODENTS_NUT_CHOICE"];
	
	return creampies;	
}
//reduce the cum in them based on time passed since last visit (5% per hour, set to 0 if 20 hours with no repeat visit)
//this isn't worth putting into the time update logic in game.as, so this is a simple way to track time and reduce the cum whenever the stats screen or they are visited
public function wallSlutsNoisyRodentsReduceCum():void
{
	var timeInc:Number = 60 * 20;
	var timePass:Number = 0;
	var newCum:Number = 0;
	if (flags["WALLSLUTS_NOISY_RODENTS_NUTTED_TS"] != undefined && GetGameTimestamp() != flags["WALLSLUTS_NOISY_RODENTS_NUTTED_TS2"])
	{
		timePass = GetGameTimestamp() - flags["WALLSLUTS_NOISY_RODENTS_NUTTED_TS"];
		if (timePass >= timeInc)
		{
			flags["WALLSLUTS_NOISY_RODENTS_WALNUT_CUM"] = 0;
			flags["WALLSLUTS_NOISY_RODENTS_CHESTNUT_CUM"] = 0;
			flags["WALLSLUTS_NOISY_RODENTS_NUTTED_TS"] = undefined;
			flags["WALLSLUTS_NOISY_RODENTS_NUT_CHOICE"] = 0;
		}
		else if (timePass > 0)
		{
			flags["WALLSLUTS_NOISY_RODENTS_NUTTED_TS2"] = GetGameTimestamp();
			newCum = timePass / timeInc;
			if (flags["WALLSLUTS_NOISY_RODENTS_WALNUT_CUM"] != undefined)
			{
				newCum = Math.round(flags["WALLSLUTS_NOISY_RODENTS_WALNUT_CUM"] * (1 - (timePass / timeInc)));
				flags["WALLSLUTS_NOISY_RODENTS_WALNUT_CUM"] = newCum;
			}
			if (flags["WALLSLUTS_NOISY_RODENTS_CHESTNUT_CUM"] != undefined)
			{
				newCum = Math.round(flags["WALLSLUTS_NOISY_RODENTS_CHESTNUT_CUM"] * (1 - (timePass / timeInc)));
				flags["WALLSLUTS_NOISY_RODENTS_CHESTNUT_CUM"] = newCum;
			}
		}		
	}
}
//ear pussy volume (fits 18" or so)
public function wallSlutsNoisyRodentsEarPussyVolume():int
{
	var vol:int = 135;	
	return vol;	
}
//max cum volume (per Will, 50,000!!! Where does it all fit???)
public function wallSlutsNoisyRodentsEarMaxCumVolume():int
{
	var vol:int = 50000;	
	return vol;	
}
public function wallSlutsNoisyRodentsWallIntro():void
{
	clearOutput();
	wallSlutsShowNoisyRodents();
	var walnutCreampies:int = wallSlutsNoisyRodentsCreampies(1);
	var chestnutCreampies:int = wallSlutsNoisyRodentsCreampies(2);
	var totalCreampies:int = walnutCreampies + chestnutCreampies;
	var titsSize:int = wallSlutsNoisyRodentsTitsSize();
	
	if (totalCreampies >= 1) output("Unlike the first time you’ve been here, Walnut and Chestnut aren’t their usual bratty selves, rendered (mostly) docile by a recent visitor.");
	else output("Before you’ve even entered this noisy alcove, your eardrums are battered by the kind of bickering one would overhear between two catty siblings. And a lot of angry squeaking.");
	
	output("\n\nSure enough, mounted in this section of wall are two " + (CodexManager.entryUnlocked("Rodenians") ? "rodenians" : "mouse-like girls that your handy-dandy codex identifies as Rodenians") + ", both having nearly identical brown coats of half-matted fur. Their petite bodies jut out from slut storage just above the waist. One rat-girl is stacked on top of the other, their ");
	if (titsSize >= 3) output("massively cumflated");
	else if (titsSize >= 2) output("heavily engorged");
	else if (titsSize >= 1) output("slightly inflated");
	else output("B-cup");
	output(" bosoms docked by rubbing nipples. Clinging to their nearly-identical oaken pelts are the sticky leavings of clients come and gone.");
	
	if (wallSlutsNoisyRodentsLastCreampie() == 1) output("\n\n<i>“Stop moving your stupid fat tits on my face!”</i> Chestnut crows, words falling into cum-clogged ears. Walnut, looking like she’s in a bit of a trance, automatically ignores the request, making life harder for her irate wall-mate.");
	else if (wallSlutsNoisyRodentsLastCreampie() == 2) output("\n\n<i>“Fuck off! Stop shaking around, it’s annoying! You’re getting cum everywhere, twat-for-brains!”</i> Walnut half-screams, words constantly interrupted by the sloshing slap of cumflated tit against her muzzle. Her plaintive expletives quickly fade into the background hum.");
	else if (wallSlutsNoisyRodentsLastCreampie() == 3) output("\n\nBoth Walnut and Chestnut are dazedly languishing in their oval compartment. It’s as pleasing to the ears as it is to the eyes: no heated tirades, no indignant quarrels, just the bliss of having cum leaking out of their ears and nipples in a hypnotic ecstasy exclusive to their race. Thick lines of jism trickle down the swollen swells of their spunk-fattened boobs, occasionally rippling, sloshing, or spurting stored sperm. Outwardly, they look rather presentable, but their rapture is thanks to having plenty of cum on the mind.");
	else output("\n\n<i>“" + RandomInCollection(["Shut up! I totally had that one and you fucking stole it!","I’ll always get more than you! Look, my tits are twice your size right now!","Agghhh, you fucking bitch, if you hadn’t shoved your nose in his balls then I would have won!","Damnit, stop squirming around! You’re pressing into me too much!","Laugh it up, skank, next one’s mine. Just watch. You suck at giving head anyway! You always move in right before they cum! It won’t work again!","Mikky’s gonna be happier with me! I made the most this time!","I’m totally gonna get bigger tits than you, whore! Mine swell up so much faster and easier!"]) + "”</i>");
	
	output("\n\nThe pair’ve yet to notice you, offering you a moment to look over a brightly-lit screen diagonal their bisecting bondage: <b>Walnut and Chestnut! Fuck our ears and give us big, boob-enhancing cumshots for 1500 credits!</b> Just above is the slot for " + (pc.hasKeyItem("Puss Pass") ? "your Puss Pass" : "a credit stick") + ".");
	output("\n\nThere’s a cutesy picture of the pair, showing the spunky rascals vying for the camera in poses that seasoned porn-stars would describe as ‘trying too hard’. Like their digital depiction, Walnut’s brunette hair extends to her shoulders while Chestnut’s caramel-toast strands are tied into a short, sporty ponytail; Walnut’s nipples are pierced while Chestnut’s tongue is long, prehensile, and studded. What catches your eye is the black wristband one of them is wearing" + (flags["RATCOUNTERS"] != undefined ? ", girded in glowing text clearly indicating her affiliation with <i>Rat’s Raiders</i>" : " with a glowing word visible on the hoop: <i>Raiders</i>") + ". Unlike most of the disposable cock-warmers in this wall, these protein pirates are here volitionally.");
	
	if (ratsPCIsGood() && totalCreampies == 0)
	{
		output("\n\n<i>“Wow! It’s you!”</i> Walnut coos. <i>“[pc.Mister] CEO! Those look-alike scamps were talking about you upstairs!”</i>");
		output("\n\n<i>“Ooh, ooh, gimme some cum, [pc.mister] CEO! Ffion said you were cute, and she wasn’t kidding! You wanna fuck my ears? Fill my tits so Walnut will shut up!”</i> Chestnut says in what sounds like an order and a whine.");
		output("\n\n<i>“No, fuck her!”</i> Walnut shouts. <i>“F.... Literally, <b>don’t</b> fuck her! You’re gonna fuck me - my ears even have lube! Perfect for rich [pc.guyGirl]s like you who jus’ need a quickie!”</i>");
		output("\n\n<i>“Wait! Look at my tongue, I’ll be your best brand of cock polish, then you’ll screw my head until my tits blow!”</i> Chestnut puts on a cum-gutter of a face and throws out her tongue, a full nine inches of pierced muscle. It dangles and sways there tantalizingly, doing its best to draw you into a wet, willing hole.");
		output("\n\n<i>“You can totes afford us, right!? Look, two rats all for the big shot!”</i>");
		output("\n\n<i>“Yah! Fuck me, nawt her!”</i>");
	}
	else if (wallSlutsNoisyRodentsLastCreampie() == 1) output("\n\n<i>“Yeessss gibbbvvme cum! I’m a rat slut who cums for big dicksh" + (ratsPCIsGood() ? " [pc.mister] CEO!" : "!") + "”</i> Walnut groans. Greedy slut’s eyes stare at you; she licks her lips in an exaggerated tease, shifting around so that her sperm-flated boobies roll over Chestnut’s glowering face.");
	else if (wallSlutsNoisyRodentsLastCreampie() == 2) output("\n\n<i>“Ohyesh, it’s you! Come here " + (ratsPCIsGood() ? "[pc.mister] CEO" : "") + ", Chesty-nut wants more... uhhh... nut!”</i> The bottom rat’s head lamely wobbles like a third tit, swinging a long, cum-flecked tongue around. Walnut isn’t too pleased about the extra stimulation, but without someone to argue with, she remains quiet, visibly desperate for the same treatment.");
	else if (wallSlutsNoisyRodentsLastCreampie() == 3)
	{
		output("\n\nLife returns to the twin’s eyes; they stir, sensing the presence of a new customer.");
		output("\n\n<i>“Ooh, heya" + (ratsPCIsGood() ? " [pc.mister] CEO" : "") + "!”</i> Walnut blubbers, green eyes glazed by layers of nut-lust. <i>“Wanna make our tits even bigger, until we can’t even find our heads?”</i>");
		output("\n\n<i>“Me too, me too!”</i> Chestnut stares up with sparkling blue eyes. <i>“I want your dick! Pleeeaaase? Can I have all your cum too? You don’t wanna mess with us! We’re the best thieves ever!”</i>");
		output("\n\n<i>“Yeah! Mikky won’t say it but we get all the money, we’re the best!”</i>");
	}
	else 
	{
		output("\n\n<i>“Oooh!”</i> green-eyed Walnut spots you. <i>“Heyyyy" + (ratsPCIsGood() ? ", [pc.mister] CEO!" : "!") + " Are you here to fuck me?" + (ratsPCIsGood() ? " I’m your number one fan, totally! Gimme all your cum!" : "") + "”</i>");
		output("\n\n<i>“No, you’re here to fuck me, right!?”</i> blue-eyed Chestnut interjects." + (ratsPCIsGood() ? " <i>“[pc.Mister] CEO! You have to let me suck your dick so you can fuck my ears really good!”</i>" : ""));
		output("\n\nThey both turn to each other, forcing you to endure another ten-second feud.");
		output("\n\n<i>“C’mon, big [pc.guyGirl]! Fuck my ears! I want Chestnut to have my tits all over her face again, she likes it!”</i>");
		output("\n\n<i>“No I don’t! Fuck my ears! Walnut’s all fake and modded, my ears are authentic!”</i>");
		output("\n\n<i>“Lemme suck your dick so you’ll give me a messy reward!”</i> Walnut retorts, opening wide and rolling out her tongue.");
		output("\n\n<i>“W-Wha-Wait! No! I can suck better, look!”</i> Chestnut deploys <i>her</i> tongue, long and coordinated. Nine inches of slavering maw-meat undulate tantalizingly, inviting you to the wet pocket between her suckling cheeks. <i>“Jush gib ush yer money!”</i>");
	}
	
	output("\n\nWalnut and Chestnut’s dish-shaped ears flare open, exposing the flush pink interiors of their honeyed holes to you. Both rats’ tongues draw enticingly lewd shapes in the air.");
	if (pc.hasCock() && CodexManager.entryViewed("Rodenians"))
	{
		if (pc.hasKeyItem("Puss Pass")) output(" If you want to take advantage of their services, your Puss Pass is within reach.");
		else output(" You’ll have to pay their price of 1500 credits to fuck them.");
	}
	else if (pc.hasCock()) output(" Before considering their offer, you bring up your codex and skim through the Rodenian entry. These alien mice breed in a rather non - traditional manner: through their ears. Vaginas are located deeper inside the frictionless canals. If you wanted to experience the joys of cranial coitus, now’s your chance - " + (pc.hasKeyItem("Puss Pass") ? "with your Puss Pass, you can get right down to business. Or into it, rather." : "the raucous rats will cost you 1500 credits to use."));
	else output(" Lacking any phallic implements, and without a way to emit cum, there’s nothing you can do here. You’re not keen on finding out what happens to someone who flaunts the rules at Cherry’s, particularly those set by voluntary onaholes.");
	
	processTime(3);
	
	if(!CodexManager.entryUnlocked("Rodenians")) 
	{
		output("\n\nYour codex beeps to inform you it’s identified the Rodenian race.");
		CodexManager.unlockEntry("Rodenians");
	}
	clearMenu();
	if (!pc.hasCock()) addDisabledButton(0,"Get Started","Get Started","Lacking any phallic implements, and without a way to emit cum, there’s nothing you can do here.");
	else if (pc.isTaur()) addDisabledButton(0,"Get Started","Get Started","Your <b>‘tauric shape does not lend itself to sex with a rodenian.</b>");
	if(pc.hasKeyItem("Puss Pass"))
	{
		if(pc.cockThatFits(wallSlutsNoisyRodentsEarPussyVolume()) >= 0) addButton(0,"Get Started",cockSelect,[wallSlutsNoisyRodentsGetStarted,wallSlutsNoisyRodentsEarPussyVolume(),false,0],"Get Started","Fuck the rats. <b>For free!</b>");
		else addDisabledButton(0,"Get Started","Get Started","Your dick is too big to fit in their earginas. <b>You’ll need to reduce your girth!</b>");
	}
	else if(pc.credits >= 1500)
	{
		if(pc.cockThatFits(wallSlutsNoisyRodentsEarPussyVolume()) >= 0) addButton(0,"Get Started",cockSelect,[wallSlutsNoisyRodentsGetStarted,wallSlutsNoisyRodentsEarPussyVolume(),false,0],"Get Started","Fuck the rats; <b>1500 credits</b> is a small price to pay for eager cumsluts.");
		else addDisabledButton(0,"Get Started","Get Started","Your dick is too big to fit in their earginas. <b>You’ll need to reduce your girth!</b>");
	}
	else addDisabledButton(0,"Get Started","Get Started","You’re too poor!");
	addButton(4,"Back",pickWallSlut);
}

//[Get Started]
public function wallSlutsNoisyRodentsGetStarted(kok:int=0):void
{
	clearOutput();
	wallSlutsShowNoisyRodents();
	var kok2:int = -1;
	//second cock that will fit?
	if (pc.cockTotal() > 1) kok2 = pc.cockThatFits(wallSlutsNoisyRodentsEarPussyVolume(), "volume", [kok]);
	var vag:int = -1;
	if (pc.vaginaTotal() > 0) vag = rand(pc.vaginaTotal());
	//no puss pass:
	if(!pc.hasKeyItem("Puss Pass")) 
	{
		output("Upon insertion of a credit chit, the slot cinches down and gives you an auditory thumbs-up.");
		pc.credits -= 1500;
	}
	//has puss pass:
	else output("The slot above their advertisement throws out an ego-boosting jingle when you insert your PussPass.");

	output("\n\nStepping up to the happily squeaking duo" + (pc.isCrotchExposed() ? ", stroking your [pc.cocksLight] into rigid readiness" : ", you loosen your gear to produce the [pc.cockType " + kok + "] object of their desires, pumping your [pc.cocksLight] from glans-to-[pc.knotOrSheath " + kok + "]") + "." + (pc.balls > 0 ? " Just out of their reach, you draw the cum-obsessive mischief’s attention to your [pc.sack], fondling the spunk-factory until a dollop of pre is layering over outsized veins." : "") + " Muffled, staccato thumps of tails against the cabinet’s interior declare their barely contained jubilation. The girls are ocularly masturbating at the sight of your [pc.cockType " + kok + "] equipment, mouths filling with saliva at the thought of getting a taste. They’re mesmerized by the");
	if (pc.cumQ() >= 1000) output(" dick-webbing cascade of [pc.cumColor] lubricant glazing your sizzling-hot length.");
	else if (pc.cumQ() >= 300) output(" steady flow of [pc.cumColor] lubricant glazing your sizzling - hot length.");
	else output(" thin stream of [pc.cumColor] lubricant glazing your sizzling - hot length.");
	
	if (kok2 >= 0)
	{
		output("\n\n<i>“Heeeeyy, that’s cheating! <b>[pc.cockCount] dicks!?</b> I hope you’re not thinking of giving Chestnut any cum, except on her face to shut her up" + (ratsPCIsGood() ? " [pc.mister] CEO!" : "!") + "”</i> Walnut wails, biting her lip and staring <b><i>hungrily</i></b> at your [pc.multiCocks]. <i>“I want <b>all</b> of that and I’m gonna show you how badly I want it. By the end of my super-practiced foreplay, you’re gonna be dribbling my head against your crotch like a gravball!”</i>");
		output("\n\n<i>“My head-cunts are better, I bet you could even fit " + (pc.cockTotal() > 2 ? "two" : "both") + " of those in mine! Walnut’s ears are all fat and plump from all the mods she takes, mine are the true rodenian experience! Once you cream my brain you’ll know that I’m right! Gimme your penises" + (ratsPCIsGood() ? ", [pc.mister] CEO!" : "!") + "”</i>");
	}
	else
	{
		output("\n\n<i>“C’mere, c’mere" + (ratsPCIsGood() ? " [pc.mister] CEO!" : "!") + "”</i> Walnut begs, thrashing against her confinement. <i>“One minute with my mouth and you’ll want to use my head like a gravball! Chestnut modded her tongue because she’s so bad at this part, trust me!”</i> The top-rat thrusts out her tongue. Her licks at the air throw crystal beads of saliva all over, particularly into her partner’s face. Chestnut thrusts upwards, slapping her own long tongue into Walnut’s muzzle.");
		output("\n\n<i>“No! You’ll be thinking of my head-cunts for hours after you use me! Once I get that dick of yours nice ‘n wet and you cream my brain you’ll be thinking of how good it felt for hours! Walnut can’t do that! Think of how good all my piercings will feel on your huge, tasty penis" + (ratsPCIsGood() ? " [pc.mister] CEO!" : "!") + "”</i>");
	}
	
	output("\n\nDeciding you’ve had enough of their sales pitch, you put the needy rats through their paces by pushing your [pc.cocksLight] into the space between their heads" + (pc.balls > 0 ? ", nestling Chestnut’s moist nose into your sweaty nutsack." : ".") + " Right away they get to work, sliding their tongues across your ");
	if (pc.cockTotal() >= 3) output("many members");
	else if (pc.cockTotal() >= 2) output("multiple girths");
	else output("girth");	
	output(" with incredible eagerness, slathering all " + num2Text(pc.cocks[kok].cLength()) + " inches of thickened [pc.cockNoun " + kok + "] in saliva and ecstasy. Hot hyperventilations puff across the top and bottom of your member, the presence and flavor of dick reducing Walnut and Chestnut to their natural states as cock-gobbling runts.");

	output("\n\nCalming your breathing, you take hold of the girls, guiding their drooling maws to where your " + (pc.cockTotal() > 1 ? "phalli most need" : "phallus most needs") + " pleasure, learning them the places you love to be touched. Walnut plants a series of squishy, relishing kisses across your upper mast " + (pc.cocks[kok].cType == GLOBAL.TYPE_EQUINE ? "all the way to your medial ring" : "down to your [pc.base " + kok + "]") + ". From below, Chestnut " + (pc.balls > 0 ? "is slobbering over your [pc.ballsNoun]" : "slobbering at your pubic mound") + ", wrapping her silky-soft tongue around the [pc.knotOrSheath " + kok + "] of your slick stick and jacking it full of submission and ardor. Her aimed efforts fatten your meat and massage your cum-vein to its full diameter whilst Walnut enjoys the resulting inundation, slurping all the [pc.cumFlavor], gushing tension into her gut.");
	output("\n\nSo horny is the top-mounted mousegirl that her eyes are rolling back. Libidinous Walnut swoons, begging with useless cock-drunk eyes, wanting you to act on her slackened tongue, start pounding her face. Tangy nectar drips from her unnaturally swollen ears, plush and plump like gum-colored marshmallows. You move a hand to the pink opening, shocked by the raw heat billowing from her excited vagina. The air and lighting of Cherry’s establishment is muggy and hazy enough, but if you strain your eyes, you swear it visibly steams.");
	output("\n\nYour urgent ear-fingering revives Walnut; like she hadn’t just lost herself, she’s sucking your dick, realizing that you’re not ready to test the waters, as it were. Although her wish is yet to be granted, the tawny trollop flies up and down your [pc.cockType] mass, voice vibrating your throbbing-hot boner into a quivering state. <i>“Shooo good, [pc.master],”</i> she giggles, closing her mouth around your buffed bulk affectionately. The immodest rodent pulls away, chittering and beaming.");
	
	if (pc.cocks[kok].cType == GLOBAL.TYPE_EQUINE) output("\n\n<i>“I looove horse dicks! All those dopey bunnies have these, and they smell soooo good! The best part is when the tip flares, too!”</i> Walnut coos, staring at you bleary and cock-drunk, her senses gradually being overwritten by your phallic scent. Both she and Chestnut are, for once, in agreement, uniting their suckling efforts from north and south, flattening their taste buds to your breed-steed, insatiable, never satisfied. <i>“Those Jumpers all have super awesome cumshots! You’re gonna pump Walnut full of yummy jizz, right? S’long as my boobs are nice and big we won’t have to listen to Chestnut anymore!”</i>");
	else if (pc.cocks[kok].cType == GLOBAL.TYPE_CANINE) output("\n\nWalnut flattens her tongue to your cumslit, moaning into the hot little hole of your turgid bitch-breaker. <i>“Mmmm puppy-[pc.guyGirl]s always have reaaaallly tasty dicks! Look at your knot, too, it’s all veiny! Wanna press that to my ear-cunt?”</i> Before you have time to process that provocative utterance, Chestnut is buffeting your gorging bulb like it’s her favorite flavor of you, striking and lashing it with organic purpose that slowly fades into disorganized stupor. They combine their suckling efforts at that place the most, spit and pre seeping from their restless lips.");
	else if (pc.cocks[kok].cType == GLOBAL.TYPE_FELINE) output("\n\n<i>“These little nubs feel sooo good against my tongue, I can’t wait to feel them inside! Most of the kaithrits on the station mod their cocks for some reason, I don’t get it!”</i> Walnut strokes your adoration-coated rod in breathless, suckling motions, making an absolute mess of your penis and loving every second of it. Every little nodule extending from your [pc.cockColor] pulsing gloriously after their cycling kisses. <i>“These are gonna feel great when you fuck me!”</i>");
	else if (pc.cockCanSting(kok)) output("\n\nBefore Walnut or Chestnut can wonder as to the meaning of your staff’s tendrils, they get a first-hand lesson in suula venom. Their tongues are pricked and lashed by drug-bearing cilia, driving their competitive fellatio into all-out chaos. Waterfalls of spit submerge your heavy fuckstick in enough saliva to fill a bucket, keeping it feeling like you’re waist-deep in water for the rest of your session. It’s always such a joy to see how the denizens of the galaxy take to a mouthful of chemical bliss...");
	else if (pc.hasSheath(kok)) output("\n\nFirst a nose and then a tongue-tip drives into your sheath. An exasperating mix of pain and pleasure whirls about your spine as one of the caged critters (Chestnut, probably) savors your penis’ secret area. The smooth studs of her pierced tongue slide it back just a little like foreskin before pressing in like beads meant for any other orifice. You scream, nearly cumming, totally unprepared for the sudden, intense - maddeningly fucking intense - pressure that hurriedly pulls away by the grace of some dead God. Now when she teases that spot, it’s nowhere near that extent, but that tenderness is forever emblazoned on a part of your <i>soul.</i>");
	else if (pc.hasKnot(kok)) output("\n\nA flutter in your belly spreads to your heart when the bottom-bitch of a rat orally implores your [pc.knots] to inflate. The temperature at your crotch rises, accompanied by a coiling tightness. Your propagative bulb hardens, grows outwards, juicy and gratified for the compliance of a worshipful slut in her rightful place. Shifting down, you strain Chestnut’s lips around the sperm-plugging mass, muttering a few coarse words under your breath. She likes it, and she’s grateful for the opportunity to cover your extra-special bit in more of her sticky love.");
	else output("\n\n<i>“I loooove this taste! You’ve got such a yummy cock" + (ratsPCIsGood() ? ", [pc.mister] CEO!" : "!") + "”</i> Walnut praises, devoting even her hair to reverence of your flexing dong. Chestnut’s drooling murmurs from below aren’t intelligible, what with all the desirous sucking and slurping going on, but you get the idea. <i>“You’re gonna make sure to fuck me right?”</i> At those words, Chestnut plasters your undergirth in a needy, lonely kiss. <i>“Make sure you cum lots, that’s why we’re doing this! ‘Ya gotta pick the winner!”</i>");
	
	if (pc.balls > 0)
	{
		output("\n\nChestnut’s gluttonous nut-lust leads to difficulties in maintaining balance. Drowned in and dominated by sweat-infused ball-musk, the snake-tongued rodenian wraps her fleshy length around one side of your [pc.ballsNoun] and then the other, affectionately squeezing and swabbing your weighty seed-stash in a skillfully taut grasp. Loud whiffs serve notice of her intent to remember your scent for a long time, if not for the rest of her life. Obedient service sends quivers through your legs, moving you forward until she’s all but framed in the cushiony, virile dimensions that span the dips and falls of her snout. This sends the mousey prostitute into a manic frenzy. Starting from the underpouch, she kisses all up and down, nuzzling your wild oat" + (pc.balls > 1 ? "s and jerkily polishing them" : " and jerkily polishing it") + " to a mirror-shine that reflects the working girls’ every action.");
		if (pc.ballSize() >= 20)
		{
			output("\n\nAbout the only thing saving poor Chestnut from asphyxiation via elephantine scrotum is the long, studded tongue hastily washing the sperm-glutted sack encompassing her entire head. The nutty rat’s serpentine tongue drags across angry veins and fervid ball ");
			if (pc.hasFur()) output("fuzz");
			else if (pc.hasScales()) output("scales");
			else output("skin");
			output(", twisting and turning through slopes of squishy acres. Her mouth opens to a wide ‘O’, squeezing against the girth of your jizz - generators in deific reverence, leaving marks of lipstick behind, covering every inch from top to bottom, front to back, with her paralyzingly - pleasant organ.");
		}
		else if (pc.ballSize() >= 7) output("\n\nTry as the cum-hungry rodent might, she can’t close her thirsty mouth around " + (pc.balls > 1 ? "even one of your girthy nuts" : "your girthy nut") + ", only managing to plant hickeys and lipstick marks randomly on your sperm-packed circumference. Her serpentine tongue mops your succulent orb" + (pc.balls > 1 ? "s" : "") + " left to right to left, then reaches to the oft-ignored backside, poking little love taps into your vigor-sagged squish. This prompts you to drag your freshly-cleaned scrotum over and back her short muzzle, delighting in the frictious slipperiness.");
		else
		{
			output("\n\nThe rat-slut’s long tongue spins spirals of serpentine beatitude across your testicle" + (pc.balls > 1 ? "s" : "") + ", drawing the swelling source of orgasm into her mouth. Indulgent cheeks seal around your ‘nad" + (pc.balls > 1 ? "s" : "") + ", sucking softly at first, then pulling so hard that you realize just how much of a vacuum her lipsticked mouth is. Your [pc.fingers] stretch");
			if (pc.hasTail()) output(" and your [pc.tails] out - thrust" + (pc.tailCount > 1 ? "s" : ""));
			output(" to the ravenous hunger swallowing your ballsack, trapping it in an inescapable tunnel of thirsty pleasure.");
		}
		if (pc.hasVagina()) output("\n\nThudding in your loins is the untapped, impatient nerves of your [pc.pussies]. Chestnut slips behind your herm-hood, feasting on your [pc.clits], parting your feminine lips and sinking her pierced protrusion into your [pc.girlCumNoun]-dappled cunt. Your [pc.vaginaColor " + vag + "] pussy attempts a robbery of your muscle control; it takes all your taxed willpower not to fall on the rat-girl’s face. The profoundly delightful sensations of having a nub-studded tongue exploring your moist hole adds a pleasant contrast to all the ball worship from before!");
	}
	else if (pc.hasVagina()) output("\n\nTaking you by surprise, Chestnut deploys her nub-studded tongue to your female side, parting your lips with <i>her</i> lips and swimming the broad edge of her organ through the lust-pumped slit. Cursing and growling is all you manage, doing your damndest not to fall on the rat-slut and hurt her. Before you know it, the adventurous mousegirl’s sawing back and forth through your [pc.pussy " + vag + "]" + (pc.vaginaTotal() > 1 ? " and the other" : "") + "" + (pc.vaginaTotal() > 2 ? "s" : "") + ", swirling that amazingly soft organ around your [pc.clits], then surprising you with another penile polishing.");
	
	if (kok2 >= 0)
	{
		output("\n\nPulling back isn’t easy. The captives’ [pc.cumGem]-flecked cock-pillows struggle to keep your members where they are, lingering open with glossy, angling tongues fishing for another taste. It takes but a moment to line " + (pc.cockTotal() > 2 ? "two of your masts" : "your twin masts") + " up with their lips and thrust into the tight, wet entrances they’ve made for you, screwing the bottom rat’s fleshy tendril back into its lair. Sinking your [pc.fingers] into their heads of hair, you steamroll over Chestnut’s uvula and drive through Walnut’s tonsils in a singular motion, encountering no gag reflexes on your lubricious thrust. Inhaling deeply, you hilt yourself in the wall-slut’s maws, noting the upquirked smile on the top-rat’s face.");
		output("\n\nThe sensation of a double blowjob, of being tucked away in two knob-polishing throats demands no less than a maniacal face-fucking. The entire wall creaks and groans from the pressure you put on the two, stuffing their snouts with dick that must seem all the bigger to ones so small. The all-consuming desire to unload pounds against your gut while your [pc.cockHeads] pound their bellies; crackling urgency spider-webs across your tensing prostate. <b>Shlucks</b> of copious saliva fill your ears; your hips wiggle and haul; your [pc.tongue] falls from your mouth. Audible, spunk-hungry swallows assail your lunging [pc.cockHeads] with a violent physical experience.");
		output("\n\nOnly one thought crosses your mind as you plunge your pillars past buttressed jaws: <b>More.</b> The need to bury yourself [pc.knotBallsHilt " + kok + "]-deep in them erodes the last of your self-control. You buck and bounce, slapping your full weight into their gurgling muzzles " + (pc.cockTotal() > 2 ? "while your unslotted member" + (pc.cockTotal() > 3 ? "s flail and thrash" : "flails and thrashes") + " uselessly, spurting off ribbony arcs of slick spoo" : "") + ", enjoying the view of their caramel throats straining over the shape of your [pc.multiCocks]. As the flow of pre begins to saturate their windpipes, reflexive swallows occur more frequently, intensifying the [pc.cumColor] flow into their rippling voids.");
		output("\n\nWalnut and Chestnut simultaneously orgasm from the rough dicking you give them. You pull all the way out then shove back in, grunting and growling like an animal, savoring the tender, near-orgasmic clench of the twin’s tensile throats. Translucent juice launches from the upper rat’s ears just as her eyes roll back, and the horizontal whore gurgles from below, unable to breathe in anything but the heavy sexual stench roiling near the floor. A squelching ‘pop’ follows your double shafts out from the clinging hug of their lips - the two are a mess, yet without a slimy payoff, the scene looks tragic.");
		output("\n\nBut that’s not what you’re here for. You didn’t pay for a blowjob.");
		output("\n\nYou paid for those ears.");
	}
	else
	{
		output("\n\nWithdrawing from the valley of genital genuflection, you command Walnut to ‘open up’ before sheathing yourself rather forcibly in her smiling suckhole. You think you even hear a little ‘yay’ just before your [pc.cockHead " + kok + "] rolls over her uvula and wears her adams’ apple like a hat. Grinning, content to sit there, you allow the rodenian a moment to luxuriate in the feel of taking <i>your</i> dick. You let Chestnut get her last stimulations in before you start pumping.");
		output("\n\nIt’s as much an intense experience for Walnut as it is for you: her green eyes roll all the way back as your penis rides into her gloriously accepting throat, wearing it like a tailor-made condom. No gag reflex in sight");
		if (pc.libido() >= 66) output(" enables you to thrust all " + num2Text(pc.cocks[kok].cLength()) + " inches into this dispensable prick - holster without any care in the world, satisfying your savage impulses.");
		else if (pc.libido() >= 33) output(" fills you with the kind of glee one invariably gets when they realize that their unleashed sexual desires can be carried out.");
		else output(" triggers your oft - repressed libido to surge forward, claiming her as powerfully as your hips will allow.");
		if (pc.cocks[kok].cLength() >= 12) output(" You pound your dick all the way to her belly in one magnificent thrust, wearing her like a leithan would their favorite bitch.");
		else if (pc.cocks[kok].cLength() >= 6) output(" Your dick pins her tongue and bulges the entirety of her throat until you’re wearing her like a furry sock.");
		else output(" Your prick’s a perfect fit for her, vanishing between powerfully - gulping cheeks and overlaying her adam’s apple.");
		output(" Your ballooning tip stretches her lubricious passage on repeat strokes, making way for the broadness you drive into her erotically - charged wetness.");
		if (pc.balls > 0) output(" From below, your ballsack swings back and forth, slapping indulgently into Chestnut’s brow.");

		output("\n\nWalnut’s glossy" + (pc.cocks[kok].cLength() >= 12 ? ", straining" : "") + " lips quiver and shudder, hugging your invading [pc.cockNoun " + kok + "]. How openly pleased she is to have your crotch mashing into her face would be enough to arouse a room full of people into nutting in their pants. The rodenian blinks, not bothering to do anything but stare into your loins, sucking just in time for your impassioned twitches and pushes. Her eyes roll back for the next " + (pc.cocks[kok].cLength() >= 12 ? "belly-deep" : "neck-deep") + " thrust. A squirt of ear-cum launches from her head once your [pc.knotOrSheath " + kok + "] slams home. She orgasmed from being facefucked.");
		output("\n\nNow to see if Chestnut follows suit.");
		output("\n\nGrabbing both of her cheeks and bending tugging her head down, you exposed her neck and create an arrow-straight path to her tiny stomach. Your motions are all the warning the bottom bitch-rat needs: her nipples harden and her mouth opens wide. The rat’s tongue twirls around your [pc.cockNoun " + kok + "] only to be fucked back inside its lair. Like her wall-mate, she also lacks a gag reflex. That sublime, wonderful absence of biology lets you drill her face until your thighs are squeezing around her pierced, jingling ears. Looking over Walnut’s fucked face, you consider the qualities of her mouth versus Chestnut’s.");
		output("\n\nThe sinuous tongue seizing your [pc.cockColor " + kok + "] boner refuses to unravel, and its owner’s head bobs to your blood-boiling pace. Crushing softness lavishes your erection while your coiled inches are sucked further into her petite, greedily suckling maw. The round, bulbous outline of your [pc.cockHead " + kok + "] can be seen bulging against the exterior of her cum-drinking neck like a burrowed mole, sliding to and fro. The pressure is incredible, and if she were wearing a collar of any kind, your ferocious plowing would have snapped it clean off. Chestnut certainly proves herself an equally sodden slut, pleasing you to her own sympathetic orgasm.");
		output("\n\nBut you’re far from satisfied. You pull away, watching her pleasure-seize.");
		output("\n\nIt’s time to see to their ears.");
	}
	
	processTime(5 + rand(5));
	clearMenu();
	addButton(0,"Next",wallSlutsNoisyRodentsEarFucking,kok);
}
public function wallSlutsNoisyRodentsEarFucking(kok:int=0):void
{
	clearOutput();
	wallSlutsShowNoisyRodents();
	var kok2:int = -1;
	//second cock that will fit?
	if (pc.cockTotal() > 1) kok2 = pc.cockThatFits(wallSlutsNoisyRodentsEarPussyVolume(), "volume", [kok]);
	
	output("The formidable slap of your [pc.cock " + kok + "] to Walnut’s fuzzy cheek jerks her out of post-orgasmic beatitude. Her snout widens blithely when she realizes that she’s to be first. <i>“Yes! Yesyesyesyes!”</i> she squeals. <i>“You’re gonna love this! My ears are softer than any pussy in this wall, you’ve got such good taste!”</i> The fuckable shape of her circular ear descends to your girth’s level, the outer rims flapping against the shaft. It ebbs and flows before flaring open, gushing out high temperatures and fragrant juices from its chubbily-aroused interior.");
	output("\n\nYou get a better look at the cranial cunt on offer, finding it to be rather unusual for an aural orifice. A surface that should be flat and smooth is <i>puffy</i> and swollen, deliciously thick and velvety. Her ears aren’t as large as the other pair, but that’s likely due to all the shifted skin. The dewy, unsubtle smell of estrus need all but confirms this perverse and obscenely lewd cunt is ready to be used. Just seeing it there, glistening and refulgent, little begging squeaks coming from around it, is proof positive. Taking Walnut’s horny head in your [pc.hands], you daintily stroke her hair in a reassuring gesture, prepping the mirthful mouse for her reward.");
	output("\n\nChestnut’s plaintive whines do nothing to pause your insertion. Before you’ve even found the pussy inside Walnut’s head, the moist slopes of her fat ear enfold your [pc.cockColor " + kok + "] pole in an exotically lewd sleeve. Your [pc.cockHead " + kok + "] slides past her hearing tunnel into a channel of rippling vulnerability, spurting boiling pre-jizz to your thumping heartbeat. Even though you’re keeping her steady, you can’t say the same for yourself.");
	output("\n\nBut then, you get there.");
	output("\n\nInner muff muscles clench down on your crown, inhaling your breeding organ like oxygen. You struggle not to give her every inch there, but any involuntary movement brings the bloated walls down on your dick in ways that cannot be resisted. Every motion brings with it newer pleasures that defy description, all while you’re sinking into the rodenian’s skull, swaddled in the embrace of a pussy that buzzes and vibrates <i>just right.</i> The carnality of your position overwhelms you, and the pliant creature whose head you’re slotted in screams in bliss, driving you wild.");
	output("\n\nNobody in their right mind (least of all you) would dare attempt to halt or slow your deafening thrusts. Luscious pumps carry your lust-sore [pc.cockNoun " + kok + "] into the depths of indescribable depravity. You swear you can empathize with just how empty Walnut feels on the backstrokes, having something to fill her void suddenly disappearing, leaving her colder than ever. Any agony she might have felt vanishes when you thrust back in, smashing on her hedonary gland" + (pc.cocks[kok].cLength() >= 12 ? " and wondering for a moment if your beefy prong might emerge from the other end" : "") + ". Stuffed so full of dick, all the rat can do is helplessly cum and beg for the next one to be sooner and harder.");
	output("\n\n<i>“Yeeessss, I wannna get your cummmm...”</i> she drones in delirious passion. The artless way you burrow into her head-pussy like crazy, you can’t take full advantage of her susceptibility beyond encouraging her to debase herself. <i>“I’m a big slutty rat who likes getting her ear cunts fucked! I like making Chestnut jealoouuussss- EEK!”</i> Walnut squeaks, head craning to the left.");
	output("\n\nIt happens with one of your full-body throbs. The sudden twist of pleasure and lethal press of changing trajectory undermines your plans. <i>“Give cum! Give cum! Make me your favorite! You’ve gooootta gimmmeee the cuuuuuum!”</i> With a howl of inarticulate bliss you right the skank’s neck and screw her harder, skullfucking her on wanton instinct that engraves your initials on her impressionable mind. When her eyes have the wherewithal to glance in your direction, she laps at her lips, blinking slowly. <i>“I wanna be covered in cum tooo... but fill my boobs! Pleeease! Don’t give Chestnut annnyy I deserrrve it! I’m your favorite girl riight? Ri- aack-! Right!? Pleh.... I want it!”</i>");
	output("\n\nFaint trickles of cream reach the floor, most of it splattering off your crotch. You’re railing her plumpness so powerfully it’s like you want this incredibly soft cunt to be yours. You want everyone who uses it from now on to know how well you’ve fucked it. A surge of lust later and your groin-to-rodenian jackhammering is echoing off the fuck-shelf in which she’s bound and carrying into the other booths, putting shame to the sex in your immediate vicinity.");
	if (pc.hasKnot(kok)) output(" You grind your [pc.knots] into the sticky walls of her ear-dome, only slightly miffed that you’ll never knot this bitch’s hole.");
	if (pc.balls > 0) output(" You’re certain by the end of this, your churning, heavy, cheek-clapping ball" + (pc.balls > 1 ? "s" : "") + " will have left a small mark in her fur.");
	output(" Sex-heat shudders through your body until your breathing is short and ragged. This rodent’s cunt is little more than a juicy mold of your [pc.cock " + kok + "].");
	
	if (kok2 >= 0) output("\n\nEntranced as you are by Walnut’s noggin, Chestnut takes every opportunity she can to please your spare equipment, and with a tongue like hers the job is a rather simple one. Writhing mawflesh pleasures your unused dick" + (pc.cockTotal() > 2 ? "s" : "") + ", ensuring that she’ll be richly rewarded once you pump your chosen slut with cream. The wet pinkness of her organ keeps you guessing as to where it’ll apply its alien softness next, and it soon becomes a game she plays: what buttons will she push next in her task of serving you?");
	if (pc.tentacleCockCount(true) > 0) output("\n\nOne vice is not enough, and you have the means to breed Walnut for all she’s worth. Willing " + (pc.tentacleCockCount(true) > 1 ? "a" : "your") + " prehensile breeding stalk over and thrusting it into heaven is effortless. " + (pc.tentacleCockCount(true) > 1 ? "Shoving even more in? Even easier." : "") + " Rhythm comes easy: you’re giving this rodenian a taste of what it’s like to be in a mating pair, threading locks of her hair, screaming her praises, telling her how badly you want to cum inside. The pleasure she’s experiencing now is not something you’ll ever fully appreciate, but the face she’s making, lacking in any propriety or civility, is one you’ll never forget.");
	
	output("\n\nBut it’s time to see to Chestnut. You can’t, in good conscience, leave any partner undicked. Yanking yourself out stokes spectacular climax in Walnut, so powerful that she doesn’t even care you’re leaving her behind. Besides, she can’t, because you tell her not to. Hedonary glands make things so much easier!");
	output("\n\n<i>“A-Am I-”</i>");
	output("\n\nChestnut doesn’t get more than a word in before you grip her jewelry-encrusted ear with a breeder’s fury, yanking her head up and diving into the frictionless ditch. Her boobies wobble under your spurting assault, hard nipples carving the fuck-fog. Premature loads of [pc.cumNoun] glaze her not-so-sacred surfaces, imbuing them with a rut-enhancing quality they lacked just a second ago. [pc.Fingers] curling into her brain-box, you thrust your spear in all the way, every inch of [pc.dickSkin " + kok + "] vanishing into a strange and elastic place."); 
	if (pc.balls > 0) output(" The bloated weight of your supple sack slams into her hard enough for your lips to feel it.");
	output("\n\n<i>“Hey! W-Wha-”</i> Walnut whines. <i>“Why aren’t you fucki-NG meeee? That’s supposed to be miiiine!”</i> You’re not entirely sure how they both feel about their bondage, but you can see how suddenly she’s disagreeing with her place in the wall. Chestnut’s just like her now, whimpering and groaning for your pleasure, shuddering on the solid end of your rat-charming phallus." + (pc.tentacleCockCount(true) > 0 ? " She’s also not spared the penetration of your tentacular attachments." : "") + " The lower rodent clenches in gooey climax, hidden folds of authentic rodenian cunt squeezing down on your lofty rod in rippling ecstasy.");
	output("\n\n<i>“Yaaaaayyyy!”</i> Chestnut’s muzzle, laden with tremors, spreads as her oiled junction retightens around your outlined lump, all but asking for you to give it to her deeper and rougher. It’s a request you very quickly grant, conjuring up every force of nature imaginable to accelerate your thought-destroying velocity. <i>“You’re- sooo- so-! Soooo goood at this! Seeee? My ears are so... so- so... Aaaa... Eek! - ssssssooooooo mush better than Walnut’s!”</i> You impale yourself up to the [pc.knotOrSheath " + kok + "], tearing a heart-stroking squeak from her lungs" + (pc.hasKnot(kok) ? ", threatening to shove a bulb twice the size of her head-pussy inside" : "") + "" + (pc.hasSheath(kok) ? ", delighting in the crinkle of your sheath on her throbbing barriers" : "") + ". <i>“Chestnut waaants your chunky nuuuut! You’ve gotta cum inside meeeeee! Turn my head into a waterpark!”</i>");
	output("\n\nYou pull out, slamming back into Walnut’s slippery hole, barreling through nut-starved conduits. Frenzied thrusts deflect your fist of a [pc.cockHead " + kok + "] off her hedonary gland no less than ten times, demolishing her cognition and reducing her utterly into a crazed mess craving the burningly-hot rush of duct-swelling jism. Sweat stings your eyes when you swap back to Chestnut’s recesses, establishing yourself as her sugar-" + pc.mf("daddy","mommy") + ". Ear cunts set permanently to <i>“milk my [pc.master]!”</i> darken your surroundings with peaking lust. She’s draped over your crotch like a habit on a spunked nun’s head and shoulders, looking more and more like a filling bubble-buddy.");
	output("\n\n<i>“Cum in meee, meeeee!”</i> Walnut begs, only to be silenced by your rampant impulses.");
	output("\n\n<i>“No, I need it! I need it! Me, me!”</i> Chestnut shouts - <i>plap, plap, PLAP!</i>");
	output("\n\n<i>“Fffffffmeeeeeee MEEEEEEEEEEEEEEE!”</i>");
	output("\n\n<i>“NOOOOOOOO!”</i>");
	output("\n\n<i>“I’ll come and suck your dick after this, you can make me your new belt!”</i>");
	output("\n\n<i>“EYE’LL be your new cock sock, I’ll lick you every day and night!”</i>");
	output("\n\n<i>“AYE WILL DO anyythiiiiing for your cum! I HAVE to have the bigger tits! I was such a proud girl until I found out how great dick was, you have to believe me!”</i>");
	output("\n\n<i>“NO! It’d be wasted on her! Break my fucking head in half, split me like a big stupid vegetable!”</i>");
	output("\n\n<b>Fuck!</b> Fuck, fuck! Quavering and clamoring and madness-inducing voices demand too much of you - you can’t fuck rat pussy forever, and you can’t hold back any longer! The only thing that will bring order to chaos is to cum... but where!?");
	
	processTime(5 + rand(5));
	clearMenu();
	addButton(0,"Walnut",wallSlutsNoisyRodentsEarFuckingFillWalnut,kok,"Walnut","Walnut, for all her sass, deserves your cum!");
	addButton(1,"Chestnut",wallSlutsNoisyRodentsEarFuckingFillChestnut,kok,"Chestnut","Chestnut’s a persuasive little thing!");
	if (kok2 >= 0 || pc.cumQ() >= 1000) addButton(2, "Both", wallSlutsNoisyRodentsEarFuckingFillBoth, kok, "Both", "Compete though they might, you’re the paying customer, and both those ears are deserving of a thick creampie!");
	else addDisabledButton(2,"Both","Both","<b>You’ll need two cocks " + (pc.cockTotal() > 1 && kok2 < 0 ? "that fit" : "") + "</b> to cream both bratty ratties at once, <b>or a high enough cum output.</b>");
}
public function wallSlutsNoisyRodentsEarFuckingFillWalnut(kok:int=0):void
{
	clearOutput();
	wallSlutsShowNoisyRodents();
	var cumVolume:Number = pc.cumQ();
	
	output("You become too aware of the aches in your haunches - tightness builds at your [pc.base " + kok + "]. No chains can hold you in this rutting state. Velveteen folds, overstuffed with [pc.cockNoun " + kok + "], cling to your mast, so slippery that no material or force of strength could ever grip them. Walnut’s brilliant cries, rich with lust, reach you through it all. Adorable squeaks are the cherry on top. Her lungs push out broken airs and ignominious wails matched to the onslaught you carry out on her chubby head-cunt. It’s an overflowing pot, spilling an endless reserve of her wants, her needs, her desires. Individuality doesn’t matter to a rodenian, least of all one presented for public use.");
	output("\n\nChurning maelstroms of breeding urge swirl below your [pc.skinFurScalesNoun]. Eyes glinting, you drive your arousal into the rodenian’s interior, holding back the spermy tide for a few seconds longer. Long enough to emblazon the unearthly qualities of her pinkness in your memories, for your [pc.cock " + kok + "] to archive each alluring detail" + (pc.cocks[kok].cType == GLOBAL.TYPE_EQUINE ? ", and for your equine flare to fully expand into a proper seal" : "") + ". Coalescing euphoria manifests in your pleasure centers, counteracting your demands for prolonged stimulation and beginning the overdue process of unspooling your impulses shot by [pc.cumVisc] shot.");
	
	if (pc.cumQ() >= 1000)
	{
		output("\n\nWalnut’s wish is about to come true. One wet ‘plap’ later and your furious reaming comes to its end, and [pc.cum] erupts into her alien depths. [pc.CumGem] goo floods the taut interior of sperm-milking muscles, pink nerves tensing against you, smashing on your girth like an angry mob looking for justice. Fresh profusions of [pc.cumFlavor] creaminess flood into fervid vaginal canals, quickly inflating her boobs through multiple cup sizes. It happens so abruptly that the rushing [pc.cumColor] jizz leaks from the relentlessly swelling tanks. Your prostate itself seems to lurch being this deep in Walnut’s head and neck; every single blood duct throbs to a level of stiffness comparable to common metals.");
		output("\n\nYour lay’s bosom grows to such an extent that it obscures Chestnut’s face in its sperm-sloshing shadow. The rodenian’s cum-ballooned boobs are a sight to behold, no matter how transient the transformation may be. " + (pc.cockTotal() > 1 ? " They’re looking even better with the extra loads your unsheathed [pc.cocksLightIsAre] pumping out, matting the bloating curtains of her fur in frosting stripes of [pc.cumColor] slickness." : ""));
		if (pc.cumQ() >= 3000)
		{
			output("\n\nClimax continues despite your thoughts of it having begun to end a minute ago. [pc.CumVisc], urethral-straining loads of seed churn viscerally through your burdened member. It’s shunting so slowly that it burns inside the bulk of your cock. It’s unbearable, and the only way to twitch it out is by unsleeving yourself from the rat-girl and plowing back in. The resulting fountain of cum splashes into a hidden reservoir and causes an instant backblast of spooge that hits your groin and geysers out of her other ear, launching into the wall of your booth with a lewd splat. Damn!");
			cumVolume *= .75;
		}
	}
	else output("\n\nOne final <i>plap-plap</i> ends your furious reaming and opens the gates to orgasm. [pc.Cum] spurts in ropes and the occasional gout, weaving through Walnut’s violated muff. Another cry and one turn of the rat’s head divides your world in two, multiplying the [pc.cumVisc] warmth surging from your loins into an inexpressible wonderland of alien biology. She shivers in your grasp, squeaking softly through the process" + (pc.balls > 0 ? ", intimately aware of the clench and churn of your [pc.ballsNoun] on her muzzle" : "") + ". Spasmodic muscles milk your lusts into taut channels of careless craving. " + (pc.cockTotal() > 1 ? "It’s unfortunate that your loads are being divided, but Chestnut’ll take whatever she can get. Her hungry tongue lashes at the aching peak of your unslotted boner" + (pc.cockTotal() > 2 ? "s" : "") + ", seeking any and all errant flow with admirable accuracy." : ""));
	
	if (pc.cumQ() >= 1000) output("\n\nSpent and satiated, catching your breath, you inspect Walnut’s temporary growth, feeling rather proud of yourself for giving her the kind of boobage needed to silence her noisy partner. She definitely earned it. Hmmm... since you made it possible... oh hell <i>yes,</i> they feel amazing in your palms! Stuffed so full of [pc.cumVisc] [pc.cumGem], dribbling lamely... these plush cushions are a wonderful leave-behind. Man, rodenians are a hell of a treat!");
	else output("\n\nBefore it’s too late, you look down to get a look at Walnut’s boobs, identifying a few inches of growth. That’ll have to do.");
	
	IncrementFlag("WALLSLUTS_NOISY_RODENTS_NUTTED");
	IncrementFlag("WALLSLUTS_NOISY_RODENTS_WALNUTTED");
	flags["WALLSLUTS_NOISY_RODENTS_NUT_CHOICE"] = 1;
	if (flags["WALLSLUTS_NOISY_RODENTS_WALNUT_CUM"] == undefined) flags["WALLSLUTS_NOISY_RODENTS_WALNUT_CUM"] = cumVolume;
	else flags["WALLSLUTS_NOISY_RODENTS_WALNUT_CUM"] += cumVolume;
	if (flags["WALLSLUTS_NOISY_RODENTS_WALNUT_CUM"] > wallSlutsNoisyRodentsEarMaxCumVolume()) flags["WALLSLUTS_NOISY_RODENTS_WALNUT_CUM"] = wallSlutsNoisyRodentsEarMaxCumVolume();
	processTime(3);
	pc.orgasm();
	while(pc.lust() < 33) { pc.lust(2); }
	clearMenu();
	addButton(0,"Next",wallSlutsNoisyRodentsEarFuckingFinish);
}
public function wallSlutsNoisyRodentsEarFuckingFillChestnut(kok:int=0):void
{
	clearOutput();
	wallSlutsShowNoisyRodents();
	var cumVolume:Number = pc.cumQ();
	
	output("Left to your own devices you might stay here fucking yourself with Chestnut’s head until the end of time. There’s just something about the texture of rodenian ear that you always want more of. Maybe the chemical effects of her hedonary gland have washed through your [pc.cock " + kok + "], silently brainwashed you into being her mate for life. Wouldn’t be a bad ending, but that’s not your fate. You can’t concern yourself with settling down, not even with this easy addition to any harem.");
	output("\n\nSpearing her sweeping, slimy folds with reckless abandon, going deep into her fuck-socket of an ear, you pump Chestnut with the utmost passion, ready to claw your way over the last obstacle and fall into a pit of release. You huff, plowing the rat with your slimy rod, strings of your own cock-drool swinging like [pc.cumGem] crystals on a chandelier, buffeting her libidinously-red ear-dome in clingy preseed. A faint smile appears on your [pc.face] just moments before you end your pistoning pace and bury yourself to the [pc.knotOrSheath " + kok + "]" + (pc.balls > 0 ? ", impacting your [pc.sack] to her jaw" : "") + ". The only natural response gushes upwards" + (pc.cocks[kok].cType == GLOBAL.TYPE_EQUINE ? " towards your expanding flare" : "") + ": your spunk.");
	output("\n\nYou’re cumming.");
	
	if (pc.cumQ() >= 1000)
	{
		output("\n\nGasping, sweaty, in a monstrous haze, you ram hard into Chestnut’s torso, slamming a raging pillar of [pc.cum] into her alien wombs and bouncing off her head. Walls of bestial hunger clamp down on your girth, devouring gushing waves of [pc.cumVisc] sperm. Brain-draining volumes of [pc.cumFlavor] goop pack her reproductive tubes to the brim, stretching them to a comforting fullness that expands her tawny titties. Right before your eyes the runty rodent’s rack expands with each visceral eruption of cranial creampie. It’s a reinvigorating sight, something that strengthens your next surging loads. Frothy wads of bag-swelling baby-batter leak from her nipples like perverse lactation, and soon enough, Walnut’s shelf disappears in the churning slosh of a rat properly fucked." + (pc.cockTotal() > 1 ? " Completing her temporary transfiguration is the frosting your extra equipment lends her. Gouts of boob-striping [pc.cumNoun] tattoo her fibrous pelt in layers of satisfied slickness." : ""));
		if (pc.cumQ() >= 3000)
		{
			output("\n\nUnbelievably, your climax continues, yet it slows to shallow passings. It’s a weird, unbearable sort of ache building in your [pc.cocks]. No matter how hard her infinitely-parched walls pull stimulate, your phallus-burdening loads seep out slowly. It’s hot, it’s painful - you rear back and cram it all in, ensuring Chestnut lives up to her punny alias. Your next eruption strikes the reservoir sitting somewhere inside her, causing a geyser of thick, splattering spooge to launch from her opposing ear, spraying up and down the wall of your sex-booth while also plastering your own crotch in sex-juice. Nice.");
			cumVolume *= .75;					
		}
	}
	else output("\n\nThe fucking comes to a grinding and screeching halt. Ropes of [pc.cum] blast into Chestnut’s containers, her bosom blushing under the fur as their curves are enhanced by thick wads of [pc.cumVisc] spooge. Sperm-packed ribbons are guided by rhythmically drinking walls into her twin uteruses, maybe fertilizing an egg or two. The brim of her ear vibrates around your spurting loins" + (pc.balls > 0 ? ", massaging your wobbling balls" : ", listing downwards") + ". They pulse and throb in tune with your pumping lusts, sucking your [pc.cumFlavor] weight into well-fucked depths. " + (pc.cockTotal() > 1 ? "The rest of your modest loads end up smattering Walnut’s face and tits in a steaming-hot reminder of your passing." : ""));
	
	if (pc.cumQ() >= 1000) output("\n\nYou can’t help but reach a [pc.hand] down and play with Chestnut’s... nut-stuffed... chest. A chuckle transfers a too-pleased vibration into her spunk-glutted cleavage, filled with ample [pc.cumGem] volume. Fuck, rodenians are a hell of an experience. Better not touch too long... wouldn’t want her to lose more than you’ve already squeezed out!");
	else output("\n\nIt’s hard to see past all the fuck-fug, but you detect a change in Chestnut’s bosom. Yes, she’s gained a few inches, maybe a full cup-size, but it’s not much. It’ll have to do!");
	
	IncrementFlag("WALLSLUTS_NOISY_RODENTS_NUTTED");
	IncrementFlag("WALLSLUTS_NOISY_RODENTS_CHESTNUTTED");
	flags["WALLSLUTS_NOISY_RODENTS_NUT_CHOICE"] = 2;
	if (flags["WALLSLUTS_NOISY_RODENTS_CHESTNUT_CUM"] == undefined) flags["WALLSLUTS_NOISY_RODENTS_CHESTNUT_CUM"] = cumVolume;
	else flags["WALLSLUTS_NOISY_RODENTS_CHESTNUT_CUM"] += cumVolume;
	if (flags["WALLSLUTS_NOISY_RODENTS_CHESTNUT_CUM"] > wallSlutsNoisyRodentsEarMaxCumVolume()) flags["WALLSLUTS_NOISY_RODENTS_CHESTNUT_CUM"] = wallSlutsNoisyRodentsEarMaxCumVolume();
	processTime(3);
	pc.orgasm();
	while(pc.lust() < 33) { pc.lust(2); }
	clearMenu();
	addButton(0,"Next",wallSlutsNoisyRodentsEarFuckingFinish);
}
public function wallSlutsNoisyRodentsEarFuckingFillBoth(kok:int=0):void
{
	clearOutput();
	wallSlutsShowNoisyRodents();
	var kok2:int = -1;
	//second cock that will fit?
	if (pc.cockTotal() > 1) kok2 = pc.cockThatFits(wallSlutsNoisyRodentsEarPussyVolume(), "volume", [kok]);
	var cumVolume:Number = pc.cumQ();
	
	if (kok2 >= 0) 
	{
		output("There’s no way you’re going to leave both out, their silly competition be fucking damned. Neither of these ear-cunts deserves to go without a proper filling. Grabbing Walnut and Chestnut by their dizzy domes, you cram their faces into kissing distance and hurriedly align your [pc.multiCocks] with their exposed breaches. Before they can put one and three together, they’re both enjoying the mind-melting bliss of being stuffed all over again, this time together. You spare a curious thought, wondering if this is the first time they’ve ever tolerated each other.");
		output("\n\nThat’s the last spare thought you get. You pump and you thrust, thwacking your multiple organs through ripe head-pussies, your girths bowing to account for awkward and unbelievably potent direction. Burning-hot need ravages you from within and without like supercharged plasma, the dual sensations of double-cunt-penetration, the very fact you’re about to seed <i>four</i> wombs at once, enlarge both sets of hardened nipples with " + (pc.balls > 0 ? "the contents of your fluid-packed [pc.ballsNoun]..." : "your output."));
		output("\n\nIt’s heaven.");
	}
	else output("You breathe in mid-stride, whole body pulsating at that moment. Pure, animalistic intent roils inside, ready to seize upon its opportunity. You produce enough cum to share it between the installed rodenians. They’ll both get bigger tits. Even if you have to work a little harder and divide the [pc.cumNoun], it’ll all be worth it to see them both a pair of leaking sluts. It’s already oozing out. To Walnut, then Chestnut, to Walnut and back - your increments are contracting a single point. The storm raging inside explodes outwards in thunderously thick expression, Walnut being the first to receive" + (pc.balls > 0 ? " from your heavy [pc.ballsNoun]" : "") + ".");

	if (pc.cumQ() >= 1000)
	{
		output("\n\nJetting spunk lists into Walnut’s lush acres, rocketing deep into her chest and beginning the process of blessing her boobs with fresh wads. It won’t be an opulent rack, but it’ll be a hydrated one. Chestnut, too, gets her due - [pc.cum] unloads to the urgings of your shallow thrusting. Fountaining blasts of [pc.cumVisc] jism saturate the duo’s pillowy ears, feeding fluid tension into increasingly thirsty walls. " + (pc.cockTotal() > 1 ? "The feel of your multiple cocks fattening with seed forces you to lurch forward, burrowing another inch or two deeper in your chosen bitches." : "You swap, making great time and wasting nothing, giving Walnut a hefty burst and then Chestnut.") + " [pc.CumGem] seed, densely packed into immense, uterus-battering emissions of nut, overflows into the pair.");
		output("\n\nTits grow in real time like on a pervy film, swelling out, even lactating the overflow. [pc.CumColor] lines of curving trickle run down the shaking rodentses bodies, certainly felt and relished on a level deeper than base comprehension. Unloading your colossal tides into the pair is an absolute joy, as is the quadruple clenching of ear and dick at once." + (pc.cockTotal() > 2 ? " To commemorate their temporary endowments, you wiggle your hips to paint their sloshing swells in seed, making sure that your unused [pc.cocksLightIsAre] gratified in equal measure." : ""));
		if (pc.cumQ() >= 3000)
		{
			output("\n\nIt’s not over yet. Prolonged climax may not be healthy, especially on a pirate base, but it’s just another opportunity to show these dim-as-fuck rats who their preferred client will be from now on. Bucking muscles drown their already clogged tubes in knee-buckling weight. By the time you’re done, they’ll need a back-support just to not go sore from having been infused with gallons of [pc.raceShort] loin-fruit. Jug-filling eruptions take place over the next minute, careening into pools of ovarian delicacy. With nowhere else to go, the law of physics inserts itself on your illicit coitus. Splashes of [pc.cumFlavor] spooge smash into your pelvis while torrential bolts launch from Walnut and Chestnut’s other ears, spraying up and down the wall of your booth, sending micro-droplets your way.");
			output("\n\nFuck yeah.");
			cumVolume *= .75;
		}
	}
	else
	{
		output("\n\nSpurt after spurt after [pc.cumVisc], [pc.cumFlavor] spurt pours into Walnut’s whorifice. Gushing warmth inflates her taut, cushiony tunnel and your urethra on its path to her egg-makers. " + (kok2 >= 0 ? "Your several endowments suit you and this task fine. Chestnut enjoys an equal treat, reaching the same vocal octaves as her sister." : "You hastily withdraw, serving Chestnut her very own reward in spate.") + " Pump- Walnut’s boobs get a little bigger. Pump- Chestnut’s too. Clenching walls suck down all that your overproductive biology has to offer. Your output seems insufficient for the two of them. It cultivates a desperate, shuddering need inside their vaginas, which pull even harder than before. Maybe if they suck hard enough, they’ll drain a few extra seconds from your refractory period." + (pc.cockTotal() > 2 ? " Whatever’s left is a woefully diluted and paltry amount spilling from your unholstered [pc.cocksLight] onto their interwoven breasts." : ""));
	}
	
	if (pc.cumQ() >= 1000) output("\n\nWalnut and Chestnut both got what they wanted, and then some. You fill your [pc.hands] with their sumptuous titties, milking their jizz-filled cleavages of [pc.cumGem] semen. They’re like little water balloons, easily handled... but you don’t touch them much further. They wouldn’t be happy if they didn’t get to keep it in for as long as possible. Damn, though, rodenians are a rather interesting race! Maybe you’ll be by later to offload your lusts into these lovely little storage compartments?");
	else output("\n\nNeedless to say, they got what they wanted. Even a couple inches to their chest-mounted advertisements should keep them docile for an hour or two, long enough for another freebooter to empty his or her balls in ‘em.");
	
	
	IncrementFlag("WALLSLUTS_NOISY_RODENTS_NUTTED");
	IncrementFlag("WALLSLUTS_NOISY_RODENTS_WALNUTTED");
	IncrementFlag("WALLSLUTS_NOISY_RODENTS_CHESTNUTTED");
	flags["WALLSLUTS_NOISY_RODENTS_NUT_CHOICE"] = 3;
	if (flags["WALLSLUTS_NOISY_RODENTS_WALNUT_CUM"] == undefined) flags["WALLSLUTS_NOISY_RODENTS_WALNUT_CUM"] = cumVolume/2;
	else flags["WALLSLUTS_NOISY_RODENTS_WALNUT_CUM"] += cumVolume/2;
	if (flags["WALLSLUTS_NOISY_RODENTS_CHESTNUT_CUM"] == undefined) flags["WALLSLUTS_NOISY_RODENTS_CHESTNUT_CUM"] = cumVolume/2;
	else flags["WALLSLUTS_NOISY_RODENTS_CHESTNUT_CUM"] += cumVolume/2;
	if (flags["WALLSLUTS_NOISY_RODENTS_WALNUT_CUM"] > wallSlutsNoisyRodentsEarMaxCumVolume()) flags["WALLSLUTS_NOISY_RODENTS_WALNUT_CUM"] = wallSlutsNoisyRodentsEarMaxCumVolume();
	if (flags["WALLSLUTS_NOISY_RODENTS_CHESTNUT_CUM"] > wallSlutsNoisyRodentsEarMaxCumVolume()) flags["WALLSLUTS_NOISY_RODENTS_CHESTNUT_CUM"] = wallSlutsNoisyRodentsEarMaxCumVolume();
	processTime(3);
	pc.orgasm();
	while(pc.lust() < 33) { pc.lust(2); }
	clearMenu();
	addButton(0,"Next",wallSlutsNoisyRodentsEarFuckingFinish);
}
public function wallSlutsNoisyRodentsEarFuckingFinish(kok:int=0):void
{
	clearOutput();
	wallSlutsShowNoisyRodents();
		
	output("Emptied, but still aroused thanks to pirate machinistry, you step away from Walnut and Chestnut, wiping your windshield with a leaden arm. The impetuous imps are shuddering, caked in your liquid signature, savoring the vicious fervor you fucked into them. The rodenians flop into a twilight consciousness, softly panting, squeaking in their dreams a positive testimonial for your patronage. Surplus spills from them into the lake of effluvium where you once stood. Cherry’s goo-janitor will have a buffet waiting for her when she gets around to these silly pi-rats.");
	output("\n\nUnfortunately, your [pc.cocksIsAre] still rock-hard. Maybe it’s time to check out the other stock in this tempting inventory?");
	
	pc.createStatusEffect("NoisyRodentsDisable");
	pc.setStatusMinutes("NoisyRodentsDisable", 90);
	flags["WALLSLUTS_NOISY_RODENTS_NUTTED_TS"] = GetGameTimestamp();
	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
