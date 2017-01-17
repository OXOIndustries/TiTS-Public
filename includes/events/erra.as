//Erra can be found randomly at bars.

//Bar Text
public function erraBarText(num:Number):void
{
	showErra();
	author("Hugs Alright");
	if(flags["MET_ERRA"] == undefined)
	{
		output("\n\nThere’s a black-haired Ausar girl reclined against the bar, looking your way, tail gently swaying behind her. Seems like she could be some fun.");
		//[Ausar]
		addButton(num,"Ausar",approachErra);
	}
	//Repeatable Bar Text
	else
	{
		output("\n\nErra, the Ausar pilot you met before, is sitting at the bar. She points a furry finger-gun at you and fires it before giving the smoking barrel a gentle blow; seems a bit provocative.");
		//[Erra]
		addButton(num,"Erra",approachErra);
	}
}

public function showErra(nude:Boolean = false):void
{
	showName("\nERRA");
	if(nude) showBust("ERRA_NUDE");
	else showBust("ERRA");
}

//Opening Scene
public function approachErra(back:Boolean = false):void
{
	clearOutput();
	showErra();
	author("Hugs Alright");
	if(back)
	{
		output("What will you do now?");
	}
	else if(flags["MET_ERRA"] == undefined)
	{
		output("Well, how much damage could ");
		if(annoIsCrew() || syriIsCrew() || emmyIsCrew()) output("another");
		else output("an");
		output(" ausar girl cause? You stride your way to the bar, casting a few glances away from your mystery ausar. Walking towards the girl, her features become easier to see: short, black hair with a fluffy tail to match, what appear to be small C-cups, and a slight, lightly toned-figure. She’s dressed casually and seems pretty relaxed, but gives off an air of smugness, her gaze full of devious thoughts that you can only guess have something to do with you.");
		output("\n\nAs you reach the bar you take a seat at the stool next to hers and swing around to face the bottles that line the wall; she does the same, smiling self-assuredly. The ausar girl speaks up as you wave the bartender over: <i>“So,”</i> she begins, <i>“Did I do good with the whole ‘mysterious seductress’ thing?”</i>");
		output("\n\nYou let her voice play around your head for a moment: it’s poised but levelheaded. Her words make you chuckle before you respond, ");
		if(pc.isAss()) output("<i>“You were alright.”</i>");
		else if(pc.isMischievous()) output("<i>“Well, you got me over here, didn’t you?”</i>");
		else output("<i>“I’ll say.”</i>");

		output("\n\nThe ausar laughs while you finish ordering your drink, extending a hand and smiling. <i>“Erra.”</i>");
		output("\n\nGuessing that must be her name, you reach a [pc.hand] out to meet hers and tell her: <i>“[pc.name].”</i> She takes hold of your hand and gives it a surprisingly firm shake; the bitch has got one hell of a grip, that’s for sure.");
		output("\n\nYour hand comes free of her grasp, giving you a moment to stretch your strangled digits as your drink finally arrives. Erra takes a big swig of whatever she’s drinking and turns to you with a smirk. <i>“All right, [pc.name], do you always walk up to pretty ausar girls flashing you dirty looks or just me?”</i>");
		output("\n\nFinishing a gulp of your own drink, you give her a grin, returning her smugness in kind, ");
		if(pc.isMischievous() || pc.isAss()) output("<i>“Only ones that look like a good lay.”</i>");
		else output("<i>“Only the pretty ones.”</i>");
		output("\n\nErra laughs again, <i>“Well, I’m glad we’re both on the same page.”</i> She pauses, taking a drink and licking her lips. <i>“So do you want to get to know each other first, or just head back to my place?”</i>");
		output("\n\nHer assuredness of the fact that the two of you are going to fuck makes you smile.");
		flags["MET_ERRA"] = 1;
		processTime(7);
	}
	//Repeatable Opening Scene
	else
	{
		output("Erra’s ears perk up as you walk towards her, but she manages to keep her swishing tail under control. <i>“Back for more, [pc.name]?”</i> she asks with a smug look on her face. <i>“Should’ve known you wouldn’t be able to resist me.”</i>");
		output("\n\nYou roll your eyes at the cocksure ausar.");
		processTime(1);
	}
	//[Appearance] Take a good look at the ausar.
	//[Talk]
	//[Sex] Well, she was certainly open to the idea before, why wouldn’t she be now? //Not Taur or Naga compatible.
	erraMenu();
}

public function erraMenu():void
{
	clearMenu();
	addButton(0,"Appearance",erraAppearance,undefined,"Appearance","Take a good look at the ausar.");
	addButton(1,"Talk",talkToErra,undefined,"Talk","Talk to Erra about something.");
	if(pc.lust() >= 33) addButton(2,"Sex",erraSexGOOO,undefined,"Sex","Well, she was certainly open to the idea before, why wouldn’t she be now?");
	else addDisabledButton(2,"Sex","Sex","You aren’t aroused enough for that.")
	addButton(14,"Leave",mainGameMenu);
}

//Appearance
public function erraAppearance():void
{
	clearOutput();
	showErra();
	author("Hugs Alright");
	output("Erra is a 5\' 9\" ausar girl. Her short, black hair is parted by two rounded wolf-ears that match the colour of the fur on her arms, legs, and tail. Her body is ever-so-nicely toned, honed into a capable weapon by plenty of physical activity, and her striking green eyes only serve to bolster her can-do appearance.");
	output("\n\nShe’s dressed casually: jeans and a t-shirt, both hugging her athletic frame, making the dim light of the bar hit her curves and the swell of her C-cups just right. Sitting the way she is, she looks relaxed and just a bit full of herself.");
	output("\n\nOne pretty pink ausar pussy and a nice, tight tailhole sit between her legs.");
	erraMenu();
	addDisabledButton(0,"Appearance","Appearance","You’re doing that right now!");
}

//Talk
public function talkToErra():void
{
	clearOutput();
	showErra();
	author("Hugs Alright");
	//HOW THE FUCK HASNT HUGS COMPLAINED ABOUT THIS YET? -^
	output("<i>“Something on your mind, [pc.name]?”</i>");
	processTime(1);
	clearMenu();
	addButton(0,"Her",talkToErraAboutErra,undefined,"Her","Ask Erra about herself.");
	addButton(14,"Back",approachErra,true);
}

//[Erra]
public function talkToErraAboutErra():void
{
	clearOutput();
	showErra();
	author("Hugs Alright");
	output("<i>“Me?”</i> Erra begins, <i>“I’m a pilot - Reaper Armaments, ‘Anomalous Materials Transportation.’”</i> The ausar scoffs at her own words, <i>“Really wish they’d just call me a fucking delivery girl if they’re gonna pay me like one.”</i>");
	output("\n\n<i>“Is it that bad?”</i> You ask.");
	output("\n\nErra shrugs, <i>“Can’t complain, really. I like the work, flying through the infinite void, meeting new people and the occasional cute " + pc.mf("guy","girl") + ",”</i> she says, winking your way. <i>“It’s just,”</i> she pauses, <i>“You expect to make a bit more for, you know, flying through the infinite void with crates full of gods know what.”</i>");
	output("\n\nTelling her that’s understandable, you ask Erra a bit more about herself.");
	output("\n\n<i>“Well, when I’m not flying I usually like to hit the bar and find some... ‘company’,”</i> she says, giggling as she finishes her sentence. The ausar knocks back another drink before she continues, <i>“Other than that, I just sort’ve... hangout. Nice to get out of that stuffy uniform, you know? Chat with people I’ve already met, work out, listen to some music; gods, you wouldn’t believe how many good bands you find on the edge of nowhere.”</i>");
	output("\n\nErra looks like she’s about to go off on a tangent, tail wagging violently. She stops herself from getting too giddy, smiles, and stares into her drink for a moment. She brings her gaze back up towards yours and asks, <i>“What about you? Do anything interesting?”</i>");
	output("\n\nOh boy; you take a deep breath before you start to unravel your tale before her: your father, the probes, the fortune, your quest, your crew, ");
	//notOnTavros:
	if(getPlanetName() != "Tarkus") output("the planets you’ve been to, ");
	output("and your good name. Erra is impressed by the time you finish, looking at you wide-eyed for a moment before speaking up, <i>“Uh, wow, you know when you’re picking up random " + pc.mf("guys","chicks") + " at bars, you don’t exactly expect to come across billionaire fortune-hunters, especially not cute ones.”</i>");
	output("\n\nYou smile and tell her that’s what they usually say.");
	processTime(15);
	clearMenu();
	addButton(0,"Next",approachErra,true);
}

//Sex Scenes
//Sex Opening
public function erraSexGOOO():void
{
	clearOutput();
	showErra();
	author("Hugs Alright");
	if(flags["ERRA_SEXED"] == undefined)
	{
		output("<i>“So, why don’t we head to your place?”</i> you suggest.");
		output("\n\nErra’s complacent look turns to a lustful grin at your words. <i>“Think you can handle me, [pc.name]?”</i> she asks, tail swaying from side-to-side.");
		output("\n\nYou return her smirk and give her a mock-shrug, ");
		if(pc.isAss() || pc.isMischievous()) output("<i>“Eh, I’m sure I’ve seen worse.”</i>");
		else output("<i>“I guess we’ll find out.”</i>");

		output("\n\n<i>“Well then,”</i> Erra begins to respond, standing up and looking at you over her shoulder, longing in her gaze, <i>“Let’s get going, </i>tough " + pc.mf("guy","girl") + "<i>.”</i>");
		output("\n\nYou get up from your stool and begin to follow Erra as she walks out of the bar, watching her tail’s hypnotic motions as she leads you to her ship. When you enter the docks, you look for the ship that belongs to your ausar companion, and there it is: painted with Reaper Armament’s colours. It’s pretty damn big, incredibly beefy for a transport ship, and you spot a couple mean-looking turrets on the behemoth, probably installed by Reaper themselves.");
		output("\n\nFollowing Erra forward, you take in the sight of the ship until the airlock opens, and your ausar friend extends an arm, inviting you in. <i>“Welcome to my humble abode,”</i> she proclaims as you both enter the ship. Humble, yeah right; the interior of the ship seems a bit small compared to the outside, although most of the interior space is probably storage. All the furniture is very rounded and sleek, giving the interior a very modern feel.");
		output("\n\nYour inspection is broken by a booming, almost robotic voice coming from what seems to be the very walls of the ship, <i>“Welcome back captain. I see you’ve brought a guest.”</i>");
		output("\n\nErra groans, <i>“Dammit, Dee, I told you to stop doing that when I bring someone home.”</i>");
		output("\n\nThe robotic voice responds <i>“Apologies captain. It’s protocol.”</i>");
		output("\n\n<i>“Who’s this?”</i> you ask, raising an eyebrow.");
		output("\n\nTurning towards you Erra begins to explain: <i>“This is Dee, the AI Reaper installed in my ship to uh, ‘help’ with logistics and piloting, even though that’s my job.”</i> The ausar lets out a sigh, <i>“Meet [pc.name], Dee.”</i>");
		output("\n\n<i>“Nice to meet you, [pc.name],”</i> Dee answers, <i>“I am D74, KihaCorp piloting and logistics AI. You may call me Dee.”</i>");
		output("\n\nConfused by the sudden addition of an AI to this little adventure, all you can manage to say is: <i>“Uh, thanks, Dee.”</i>");
		output("\n\n<i>“New friends, all around,”</i> Erra announces, holding out her arms and turning towards a nearby door before stopping and looking over her shoulder, <i>“Coming, [pc.name]?”</i> You roll your eyes and follow her to the next room. The door hisses open, revealing a big, round bed with a Reaper Armaments jumpsuit lying strewn across it; must be Erra’s. You step forward towards the edge of the bed while your ausar friend dims the lights.");
		output("\n\nA pair of fuzzy hands grip your shoulders and turn you around before you’re pulled into a passionate kiss and pushed down onto the mattress. Erra straddles you and straightens herself, pulling back from the kiss. She smiles down at you as she removes her shirt, revealing her cuppable breasts. You grin deviously and grab at her hips, your hands running up and down her firm sides until Erra loses a bit of her composure. A quivering breath escapes her lips as your hands reach the swell of her tits. She quickly returns herself to the kiss, her mouth opening to let your [pc.tongue] explore it.");
		if(!pc.isCrotchExposed() && !pc.isChestExposed()) output("\n\nThe two of you work your way out of your clothes, discarded garments falling on the bed until you’re both naked as a couple of lovers can get, rolling around on the mattress.");
		else output("\n\nYou help Erra work her way out of her clothes until you’re both naked as a couple of lovers can get, rolling around on the mattress.");
		output(" Kissing quickly turns to groping and fondling as Erra makes her way atop you again, pulling herself back as her velveteen hands have their way with your body. <i>“Hold on, gotta get something quick,”</i> she says, rolling off you and reaching for a nearby drawer. You roll over on your side and take a good look at Erra’s ass as she grabs whatever it is she needs, licking your lips at the sight of those gropable cheeks.");
		output("\n\nWhen she turns around, you’re expecting to be handed a ");
		if(pc.hasCock()) output("condom");
		else output("toy of some sort");
		output(", but instead you’re handed a collar and leash, while Erra presents her neck to you expectantly.");
		output("\n\nYou sit up and tell her this wasn’t exactly what you were expecting from her.");
		output("\n\n<i>“What?”</i> she says, <i>“Aren’t all ausar girls into this kind of stuff?”</i>");

		if(InCollection(pc.race(), ["ausar","half-ausar"])) output("\n\nYou cross your arms, making sure you give your [pc.tail] an emphasizing flick so your canine friend sees it, ");
		else output("\n\nYou cock an eyebrow, ");
		output("resulting in a sigh from Erra as she brings herself to sit down on the mattress. <i>“Well, honestly, I didn’t really get into, or know much about this kind of stuff until I started hanging out with humans.”</i> The ausar smiles up at you, bringing herself down on all fours and crawling towards you. <i>“Ended up really liking it, getting treated like a puppy and all that stuff: the petting, the collars and leashes, all the ‘good girls’ and praise.”</i> She visibly shudders at her own words.");
		output("\n\n<i>“But, you can treat me like a bad girl if you really want,”</i> the ausar whispers, smile turning to a lustful grin as her tail begins to sway back and forth.");
		processTime(15);
		pc.lust(15);
	}
	else
	{
		output("<i>“How about the two of us get out of here?”</i> you suggest.");
		output("\n\nErra leans back as a smirk forms upon her face. <i>“Up for more, [pc.name]? Can’t say I’m all that surprised,”</i> she says, standing up from her stool. <i>“Most people can’t resist coming back for more.”</i>");
		output("\n\nYou give your eyes a good roll. <i>“If you say so,”</i> you tell her, standing up and running a finger along one of her wolf-ears as your voice quiets to a whisper, <i>“</i>puppyslut<i>.”</i>");
		output("\n\nErra grins deviously at that word, and the way her ears twitch make you think she likes it. The ausar still manages to keep her tail under control, allowing her to maintain her composure as the two of you make your way out of the bar.");
		output("\n\nIt isn’t long before Erra’s increasingly familiar ship comes into view, and the two of you walk through the airlock. You’re greeted by Dee’s robotic voice as you enter the ship’s atrium: <i>“Welcome back captain. Nice to see you again, [pc.name].”</i>");
		output("\n\n<i>“Hey, Dee,”</i> you say, walking to the bedroom with your ausar companion.");
		output("\n\n<i>“I trust you and captain Erra are here to conduct more ‘business,’”</i> the AI quips, making her captain groan with disdain as the bedroom door closes behind you.");
		output("\n\nErra’s already removing her clothes by the time the door closes, her breasts coming free of her shirt and jiggling as they come to a rest.");
		if(!pc.isCrotchExposed() && !pc.isChestExposed()) output(" You figure you better do the same and start to remove your [pc.gear]. As you’re making yourself bare, a crumpled up pair of jeans hit you, causing you to move your gaze, only to be granted a fantastic view of Erra’s firm puppy-butt, tail lifted straight up as she bends over to search for her collar. You grin at the lusty ausar’s little scheme as the last of your gear comes off. Sitting yourself down on her bed, you watch Erra straighten herself and flex her semi-muscular back before she turns around with a familiar, smug look on her face.");
		else output(" You decide to make yourself comfortable and sit down on the bed. While you’re waiting for your lover to get herself ready, you treat yourself to a fantastic view of Erra’s firm puppy-butt, tail lifted straight up as she bends over to search for her collar. You watch Erra straighten herself and flex her semi-muscular back before she turns around with a familiar, smug look on her face.");
		output("\n\nYour soon-to-be pet lunges onto the bed, landing on all fours and tossing her collar to you. <i>“So,”</i> she begins, <i>“What do you have planned for your puppy today?”</i> Her smugness turns to lust, tail swishing left to right, left to right as she patiently awaits your next move.");
		processTime(4);
		pc.lust(15);
	}
	clearMenu();
	//[Good girl] Reward your puppy with some vaginal lovin’.
	//[Bad girl] Punish your disobedient pet via her tight little tailhole. //Requires cock or hardlight strapon.
	//Neither are Naga or Taur compatible.
	addButton(0,"Good Girl",goodGirlSexForErra,undefined,"Good Girl","Reward your puppy with some vaginal lovin’.");
	if((pc.hasCock() && pc.cockThatFits(erraAnalCapacity()) >= 0) || pc.hasHardLightEquipped()) addButton(1,"Bad Girl",badGirlAnalErraStuff,undefined,"Bad Girl","Punish your disobedient pet via her tight little tailhole.");
	else addDisabledButton(1,"Bad Girl","Bad Girl","You need a penis that will fit inside Erra for this - or some underwear equipped with a hardlight phallus.");
	addButton(14,"Back",approachErra,true);
}

public function erraVaginalCapacity():Number
{
	return 250;
}
public function erraAnalCapacity():Number
{
	return 350;
}

//Repeatable Sex Opening
public function goodGirlSexForErra():void
{
	clearOutput();
	showErra(true);
	author("Hugs Alright");
	var x:int = -1;
	if(pc.hasCock()) x = pc.cockThatFits(erraVaginalCapacity());
	author("Hugs Alright");
	output("With a smile you lean forward and close Erra’s collar around her neck, taking hold of her leash. <i>“I think you’ve been a pretty good girl,”</i> you state, placing a hand between your puppy’s jet-black wolf-ears, making her elicit a contented sigh as she starts to nuzzle against your palm.");
	output("\n\nYou take a moment to scritch at Erra’s ears, running your hand through her short, dark mane until her breath starts to stutter and quiver. Giving your puppy a few last pets, you pull back, revealing her wide smile and wagging tail. <i>“Why don’t you get on the edge of the bed, girl?”</i> you suggest, making Erra’s tail wag even faster as you stand up off the bed and give her leash a tug. She’s quick to do as you say, bringing herself to the edge of the mattress, still on all fours, before turning around and presenting her oh-so firm and gropable booty.");
	output("\n\nKneeling down, you get yourself level with your puppy’s butt, gaze fixed on her lube-leaking pussy. You lick your lips and grab Erra’s ass with both hands, spreading her lower cheeks, giving you unrestricted access to her sex. While your pet wiggles with anticipation, you spread her velvety folds with your thumbs, drawing a shuddering breath from the leash-bound ausar. Not needing any encouragement other than Erra’s trembling figure, you dig in, [pc.tongue] already penetrating your puppy’s quim, delving deep to seek out her g-spot. She starts to moan and whimper as you have your way with her, sounds of pleasure turning to squeals as you knead and squeeze her ass in your hands.");
	output("\n\nYou happily lap up your puppy’s girlcum while her moans fill the room, driving you to probe her pussy deeper with your agile tongue. Once you’ve gotten Erra’s sex nice and juicy with your oral affections, you pull out of her, licking up the last of her arousal coating your lips before you stand up again. The room is silent except for the sound of your pet’s breathing, heavy and labored, still recovering from near-orgasm. Nudging her slightly, you get Erra to crawl forward a bit, enough so that you can make your own way onto the bed and kneel behind her.");
	//hasCock:
	if(pc.hasCock() && x >= 0)
	{
		output("\n\nGrinning, you bend yourself over Erra, [pc.chest] pressing into her back, making the puppy squirm while the [pc.cockHead " + x + "] of your stiffening shaft brushes against the folds of her sex. She shudders, body quivering, as you bring yourself closer to one of her raised wolf-ears and ask, <i>“Does puppy want a bone?”</i> She most certainly does, nodding hurriedly as you lift a hand to scratch between her ears. Not wanting to keep such a good girl waiting, you start to push into her, spreading her nether lips lips with ease, already loosened from your oral pleasures. Her love tunnel hugs at your [pc.cock " + x + "] as you slide it into her, keeping your tool nice and warm until ");
		if(pc.hasKnot(x)) output("your penetration is halted by your [pc.knot " + x + "].");
		else output("you finally bottom out inside her.");
		pc.cockChange();
		output("\n\nYou keep your [pc.cock " + x + "] lodged inside her for a moment, scritching at her ears as she whimpers and moans. <i>“Does that feel good, girl?”</i> you ask, giving your hips a little wiggle, cockflesh rubbing against Erra’s inner walls, making her whimper loudly, <i>“I’ll take that as a yes.”</i> Listening to your puppy moan, you start to pull out, groaning with bliss as ausar snatch starts to pulse around your [pc.cock " + x + "], trying to pull you back in. You give Erra’s needy quim what it wants and thrust back into her. Your pet cries out with delight as she’s filled again. You continue with the same motion, gradually picking up in speed until you’re pounding your puppy’s pussy, whispering words of praise into her twitching ears, making sure she’s reminded of what a good girl she is, bringing her to the edge of her climax.");
		if(pc.hasKnot(x))
		{
			output("\n\nWith one good thrust you pop your [pc.knot] into Erra, who cries out with pleasure as the bulb of cockflesh spreads her lube-soaked lips wide. The sheer size of your knot paired with your kind words appears to be enough to make your pet cum, ausar cunt beginning to spasm around your [pc.cock " + x + "], causing you to groan loudly. You continue to hump Erra’s ass with short, fast thrusts as girlcum spills out around your [pc.cockNoun " + x + "], racing to join your happy ausar pet in orgasm.");
			output("\n\nYour puppy’s pleasured tones and convulsing cunt quickly become too much for you, sending you over the edge. Fingers of release caress your [pc.cock " + x + "] as it spasms inside of your pet, [pc.cum] emptying into her love tunnel while she pants and moans.");
			if(pc.cumQ() >= 2500)
			{
				output(" You moan as loudly as Erra does as you shoot your tremendous load into her waiting womb, making her stomach swell until you hear a quivering plea of <i>“Please, more,”</i> from the puppy. You fill her with as much [pc.cum] as she can handle, all until she’s looking positively pregnant, full of your seed.");
			}
			else output(" You moan as loudly as Erra does as you shoot your load into her waiting womb, pumping her full of your seed, kept nice and secure inside her by your [pc.knot " + x + "].");
			output("\n\nYou run a hand across Erra’s fluffy ears as you finally come down from your climax, lovingly petting her ears and whispering <i>“Good girl.”</i> Pulling her down onto the mattress, you wrap your arms around her. You cuddle your puppy, whispering more praise into her ears until she falls asleep to await your knot’s deflation.");
		}
		//noKnot:
		else
		{
			output("\n\nYour thrusting picks up to a blinding pace, making Erra cry out with pleasure as you ravish her sex. The sheer vigor of your fucking paired with your kind words appears to be enough to make your pet cum, her ausar cunt spasming around your [pc.cock " + x + "], causing you to groan loudly. You continue to hump Erra’s ass with short, quick thrusts as girlcum spills out around your [pc.cockNoun " + x + "], racing to join your happy ausar pet in orgasm.");
			output("\n\nYour puppy’s pleasured tones and convulsing cunt quickly become too much for you, sending you over the edge. Fingers of release caress your [pc.cock " + x + "] as it spasms inside of your pet, [pc.cum] emptying into her love tunnel while she pants and moans.");
			if(pc.cumQ() >= 2500) output(" You moan as loudly as Erra does as you shoot your tremendous load into her waiting womb, making her stomach swell until you hear a quivering plea of <i>“please, more,”</i> from the puppy. You fill her with as much [pc.cum] as she can handle, all until she’s looking positively pregnant, full of your seed.");
			else output(" You moan as loudly as Erra does as you shoot your load into her waiting womb, pumping her full of your seed.");
			output("\n\nYou run a hand across Erra’s fluffy ears as you finally come down from your climax, lovingly petting her ears and whispering <i>“Good girl.”</i> You remove your softening [pc.cockNoun " + x + "] from her satisfied quim, making her shudder. Smiling, you pull your ausar down onto the mattress with you, wrapping your arms around her, cuddling the puppy and whispering more praise into her ears until she falls asleep.");
		}
		processTime(20);
		pc.orgasm();
	}
	//noCock:
	else
	{
		output("\n\nGrinning, you bend yourself over Erra, [pc.chest] pressing into her back, making the puppy squirm while a pair of your fingers brush against the folds of her sex. She shudders, body quivering as you bring yourself closer to one of her raised wolf-ears to ask <i>“Does puppy want a treat?”</i> She most certainly does, nodding hurriedly as you lift a hand to scratch between her ears. Not wanting to keep such a good girl waiting, you start to push your digits into her, spreading her nether lips with ease, already loosened from your oral pleasures. Her love tunnel hugs at your fingers as you slide them into her, so warm and wet.");
		output("\n\nYou keep your digits lodged inside her for a moment, scritching at her ears as she whimpers and moans. <i>“Does that feel good, girl?”</i> you ask, wiggling your intruding members against her inner walls, making her whimper loudly, <i>“I’ll take that as a yes.”</i> You slowly begin to retract your fingers, making your puppy whine as she’s emptied, begging for more. You give Erra’s needy quim what it wants and push your digits back into her, setting her moaning again. Picking up in speed, you continue to finger your pet’s sodden pussy, whispering words of praise into her twitching ears, making sure she’s reminded of what a good girl she is, bringing her to the edge of her climax.");
		output("\n\nWith nothing but pleasing your pet on your mind, you slip a third finger into Erra’s cunt, making her cry out with delight while you continue to finger her. Your vigorous probing paired with your kind words appears to be enough to make your pet cum. Her ausar cunt spasms around your prodding digits, girlcum spilling out onto the sheets as orgasm pulses through her body.");
		output("\n\nYou run a hand across Erra’s fluffy ears as she finally come down from her climax, lovingly petting your puppy’s ears and whispering <i>“Good girl.”</i> Pulling her down onto the mattress, wrap your arms around her, cuddling the puppy until she falls asleep with you.");
		processTime(25);
	}
	clearMenu();
	addButton(0,"Next",erraGoodGirl2);
}

public function erraGoodGirl2():void
{
	clearOutput();
	showErra();
	author("Hugs Alright");
	var x:int = -1;
	if(pc.hasCock()) x = pc.cockThatFits(erraVaginalCapacity());
	author("Hugs Alright");
	output("A familiar feeling of fur-on-skin wakes you; your vision is hazy with post-coital bliss, but you look down to see that Erra has moved a bit in her sleep, and is now nuzzling her head into your [pc.chest]. You grin at the sight of the smug ausar’s soft-side put on display and give her a pat on the back to wake her.");
	output("\n\nShe lets out a little yawn and moves her head to look up at you, <i>“Hey, [pc.name],”</i> she says, <i>“Stick around for seconds or... ?”</i>");
	output("\n\nYou roll your eyes at her and pull ");
	if(pc.hasCock() && x >= 0 && pc.hasKnot(x)) output("your [pc.cock " + x + "] out of her quim, eliciting a little whimper from the girl before you go to stand up");
	else output("yourself out out of her grasp and go to stand up");
	output(". Erra stretches and sits up, taking her collar off and going to put her clothes back on, ");
	if(!pc.isCrotchExposed() && !pc.isChestExposed()) output("and you figure you should do that same.");
	else output("and you get up to give your limbs a stretch.");

	output("\n\nOnce you’re both ");
	if(!pc.isCrotchExposed() && !pc.isChestExposed()) output("dressed and ");
	output("ready, you head out back into the ship’s atrium and make your way to the airlock. <i>“You seem happy captain,”</i> Dee’s voice booms. <i>“I trust that means you and [pc.name] enjoyed yourselves.”</i> Erra’s eyes widen with an emotion akin to anger as you start to walk out of the ship. She quickly regains control of her emotions before saying, <i>“Later, [pc.name], stop by some time.”</i>");
	output("\n\nDee chimes in as well, calling out <i>“Farewell, [pc.name].”</i>");
	output("\n\nYou say goodbye to the two, and as the airlock closes behind you, you can faintly hear, <i>“Hey, Dee, time for one of our ‘talks.’”</i>");
	IncrementFlag("ERRA_SEXED");
	processTime(35);
	currentLocation = shipLocation;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Bad Girl (Anal)
//[Bad girl]
public function badGirlAnalErraStuff():void
{
	clearOutput();
	showErra(true);
	author("Hugs Alright");
	var x:int = -1;
	if(pc.hasCock()) x = pc.cockThatFits(erraAnalCapacity());

	author("Hugs Alright");
	output("Without a word you bound forward, grabbing Erra’s shoulders and pushing her onto her back. She hits the mattress with a yelp, but a smirk still remains on her face. You straddle her, leering at her athletic frame while you trail a finger along the edge of her fluffy, black ears. Your teasing touch makes her whimper, her face curling with desire as you whisper into her ear. <i>“I think you’ve been a very bad girl,”</i> you murmur, removing your finger from her ears, <i>“And bad girls need to be punished.”</i> You take hold of Erra’s collar and buckle it nice and tight around her neck before you straighten yourself, smiling at the sight of your freshly collared pet. Taking hold of her leash you give it sharp tug, pulling her upward before you bark out <i>“Ass up, girl!”</i>");
	output("\n\nManaging to keep her smug demeanor, Erra rolls onto her stomach with her ass in the air and her face against the mattress, tail raised invitingly as she looks back at you with an eager grin. You don’t think she’ll stay that way for long. Keeping her leash taut, you reach your hands down to grab her firm, gropable butt... all yours to have your way with. Erra starts to whimper as you knead her ass in your dexterous grip. You give her behind a solid squeeze and spread her lower cheeks wide, giving you a good view of her tight little tailhole.");
	output("\n\nDubious thoughts cross your mind as you gaze upon Erra’s winking pucker, and you plan to put them into action. You quickly wet a finger and bring it to meet your puppy’s asshole. She tenses and shivers, whining gently as you press your naughty digit into her. <i>“Better loosen up, girl,”</i> you tell her, <i>“Unless you want me to go in dry.”</i> She forces herself to relax after hearing that, allowing your finger to slip into her supple hole. Your pet squirms and clenches her fists, trying to quell the sensation of your digits probing her.");
	output("\n\nShe must not get too much action in this end: she’s tight as can be, almost strangling your finger as it prods her asshole, her whimpers turning into moans. Grinning, you slip another finger in Erra’s pucker; your first finger already had her moaning, and the addition of a second digit has her crying out with delight. She moans until you give her leash a good yank, quieting her for a moment, fingering her ass while silent sounds of pleasure escape her mouth.");
	output("\n\nErra feels a bit looser now, and you think she’s just about ready. You yank her tether hard, pulling her up again with a gag. Your fingers are still lodged in her ass when you grab your pet from behind and pin her against the wall, pressing yourself into her with your [pc.chest] against her back. Erra’s hands claw at the wall, the poor puppy trying to comprehend the delightful mix of pleasure and pain she’s experiencing. <i>Now</i> she’s ready; with a sly grin you withdraw your fingers from Erra’s slightly-gaping pucker, making her whimper as your digits make their exodus. Your pet is panting now, longing for something to fill the emptiness you left her with... and you’ve got just the thing to fill her with.");

	//hasCock:
	if(x >= 0)
	{
		output("\n\nKeeping a hand on your ausar’s hips, you grab your rapidly stiffening member and give it a few strokes as you line it up with Erra’s pucker, left agape by your fingers. <i>“Time for your punishment, girl,”</i> you whisper into a twitching wolf-ear. With that said, you thrust into her, [pc.cock " + x + "] spreading her tailhole even wider as you shove your tool into her with one, long stroke. Erra moans all the louder when you push into her, but another good tug of her leash is enough to keep your puppy quiet, so she can focus on nothing but the [pc.cock " + x + "] filling her. She whines and whimpers as you bottom, her tight little tailhole spasming around your [pc.cock " + x + "] as she tries to accommodate your length.");
		pc.cockChange();
		output("\n\nYou smile at your pet’s little howls. Keeping her leash nice and taut, you start to pull out of her. Erra moans again as your [pc.cock " + x + "] glides along her inner walls; of course, she’s quickly silenced by a pull of her leash, making her grunt. You, on the other hand, aren’t able to stay so silent: the sheer tightness of your puppy’s pucker makes you groan with satisfaction until your [pc.cockHead " + x + "] meets her asshole again. Looking at Erra, you can see she’s still panting, tongue hanging out while she tries to suppress her noises of pleasure. With a grunt you thrust back into your pet, [pc.cock " + x + "] filling her once more, another moan escaping the ausar’s mouth before you pull her leash again, <i>“Bad girl, quiet.”</i>");
		output("\n\nYour wolf-puppy struggles to keep herself silent, little whimpers and whines constantly escaping her as you start to roll your hips; each time she fails results in another rough yank of her leash. Erra’s fists clench as you start to speed up, hammering her ass at an increasingly vigorous pace until your focus is broken by a shrill cry of pleasure. Your puppy’s voice quickly breaks into a moan as her orgasm begins. Her body tenses as her tailhole spasms around your [pc.cock " + x + "], her cock-hungry sex dripping girlcum onto the sheets. The ecstasy of climax has Erra shivering until her orgasm ebbs, her body going limp and pucker loosening as her chest heaves.");
		output("\n\nWith your pet as loose as can be now, you feel compelled to speed yourself to orgasm. Your thrusts are made easier by Erra’s now supple hole. A chorus of quiet moans and gasps ring in your ears as the speed of your reaming picks up, sending you closer to your edge.");
		//hasKnot:
		if(pc.hasKnot(x))
		{
			output("\n\nTightening your grip on your ausar’s hips, you pull her down, right onto your waiting [pc.knot " + x + "]. The bulb of flesh pops into her gaping pucker with ease. Erra screams with delight at the feeling of your knot stretching her asshole to its limits. Her pleasured crying turns into whimpering under the pressure of your ass-jackhammering that keeps her pinned against the wall. It isn’t much longer before your [pc.cock " + x + "] begins to spasm, a long groan escaping your lungs as you begin to fill your puppy with your seed.");
			if(pc.cumQ() >= 2500) output(" [pc.Cum] floods Erra’s pucker until her flat six-pack starts to distend, stomach swelling until she whimpers <i>“don’t stop.”</i> You have no intention of stopping, your knot locking your ausar in place until her belly bulges full of your cum.");
			else output(" [pc.Cum] floods Erra’s pucker, painting her inner walls [pc.cumColor] while you jerkily buck your [pc.hips] into hers.");
			output("\n\nYou’re panting as hard as your pretty little pet is after that, trying to keep your balance on the mattress as your orgasm wanes. <i>“Good girl,”</i> you coo, reaching a hand up to your thoroughly-punished puppy’s ears to give them a pet. You wrap your arms around Erra’s ");
			if(pc.cumQ() >= 2500) output("bloated belly");
			else output("flat six-pack");
			output(" and pull her down onto the bed with you. Her C-cups are still heaving as you hold her close, ready to sleep off your knot.");
			output("\n\nWaking with a yawn, you realize you’re still in Erra’s bed, the leash bound ausar still held in your arms. You give her a little tap on the shoulder and go to remove her collar as she gives her legs a stretch. <i>“Hey, [pc.name],”</i> she says, collar coming off, <i>“Still here?”</i>");
			output("\n\nYou tell her that neither of you could exactly leave and promptly remove your flaccid [pc.cockNoun " + x + "] from her ass, [pc.knot " + x + "] coming out with a pop, allowing [pc.cumNoun] to dribble onto the mattress.");
			output("\n\nShe chuckles, sitting herself up and wincing, rubbing her sore bottom, <i>“Gods, when I say ‘bad girl’ I don’t exactly mean ‘leave me walking funny.’”</i> Giving her a slap on a firm asscheek, you tell her you think she can handle it. You stand up and start to ");
			if(!pc.isCrotchExposed() && !pc.isChestExposed()) output("dress yourself.");
			else output("get ready to head out.");
		}
		//noKnot:
		else
		{
			output("\n\nTightening your grip on your ausar’s hips, you pull her down, holding her still on your [pc.cock " + x + "] as you hump her ass. Erra screams with delight as you pound at her gaping hole. Her pleasured cries turn into whimpering as you jackhammer her ass and keep her pinned against the wall. It isn’t much longer before your [pc.cock " + x + "] begins to spasm, a long groan escaping your lungs as you begin to fill your puppy with your seed. ");
			if(pc.cumQ() >= 2500) output("[pc.Cum] floods Erra’s pucker until her flat six-pack starts to distend, stomach swelling until she whimpers <i>“don’t stop.”</i> You have no intention of stopping, your ausar keeping her place on your [pc.cockNoun] until her belly bulges full of your cum.");
			else output("[pc.Cum] floods Erra’s pucker, painting her inner walls [pc.cumColor] while you jerkily buck your [pc.hips] into hers.");
			output("\n\nYou’re panting as hard as your pretty little pet is after that, trying to keep your balance on the mattress as your orgasm wanes. <i>“Good girl,”</i> you coo, reaching a hand up to you thoroughly-punished puppy’s ears and giving them a pet. You wrap your arms around Erra’s ");
			if(pc.cumQ() >= 2500) output("bloated belly");
			else output("flat six-pack");
			output(" and slowly pull yourself out of her. [pc.CumNoun] dribbles onto the mattress as you pull her down onto the bed with you, ready to sleep away the afterglow of your orgasm.");
			output("\n\nWaking with a yawn, you realize you’re still in Erra’s bed, the leash bound ausar still held in your arms. You give her a little tap on the shoulder and go to remove her collar as she gives her legs a stretch. <i>“Hey, [pc.name],”</i> she says, collar coming off, <i>“Still here?”</i>");
			output("\n\nYou tell her you thought it better to stick around, or else your puppy might’ve missed you when she woke up.");
			output("\n\nShe chuckles, sitting herself up and wincing, rubbing her sore bottom, <i>“Gods, when I say ‘bad girl’ I don’t exactly mean ‘leave me walking funny.’”</i> Giving her a slap on a firm asscheek, you tell her you think she can handle it. Standing up, you start to ");
			if(!pc.isCrotchExposed() && !pc.isChestExposed()) output("dress yourself.");
			else output("get ready to head out.");
		}
	}
	else
	{
		output("\n\nKeeping your ausar pinned to the wall, you reach for your hardlight-equipped [pc.lowerUndergarment] and quickly activate the holopenis. Erra moves her head to glance a look at your glowing dong as you give it a few strokes, lining it up with her pucker, left agape by your fingers. <i>“Time for your punishment, girl,”</i> you whisper into a twitching wolf-ear. With that said, you thrust into her, radiant cock spreading her tailhole even wider as you shove your tool into her with one, long stroke. Erra moans all the louder as you push into her, but another good tug of her leash is enough to keep your puppy quiet, so she can focus on nothing but the hardlight shaft filling her. She whines and whimpers as you bottom out. Her tight little tailhole spasms around your simulated cock as she tries to accommodate your length.");
		output("\n\nYou smile at your pet’s little howls. Keeping her leash nice and taut, you start to pull out of her. Erra starts to moan again as your hardlight cock glides along her inner walls, of course, she’s quickly silenced by a pull of her leash, making her grunt. You, on the other hand, aren’t able to stay so silent: the sheer tightness of your puppy’s pucker making you groan with satisfaction until your glowing cockhead meets her asshole again. Looking at Erra, you can see she’s still panting, tongue hanging out while she tries to suppress the noises of her pleasure. With a grunt you thrust back in your pet, lightdick filling her once more, another moan escaping the ausar’s mouth before you pull her leash again, <i>“Bad girl, quiet.”</i>");
		output("\n\nYour wolf-puppy struggles to keep herself silent, little whimpers and whines constantly escaping her as you start to roll your hips; each time she fails results in another rough yank of her leash. Erra’s fists clench as you start to speed up, hammering her ass at an increasingly vigorous pace until your focus is broken by a shrill cry of pleasure. Your puppy’s voice quickly breaks into a moan as her orgasm begins. Her body tenses, tailhole spasming around your energy-dick while her cock-hungry sex drips girlcum onto the sheets. The ecstasy of climax has Erra shivering until her orgasm ebbs, her body going limp, pucker loosening as her chest heaves.");
		output("\n\nWith your pet as loose as can be now, you feel compelled to speed yourself to orgasm. Your thrusts are made easier by Erra’s now supple hole, a chorus of quiet moans and gasps ringing in your ears as the speed of your reaming picks up, sending you closer to your edge.");
		output("\n\nTightening your grip on your ausar’s hips, you pull her down, holding her still on your hardlight as you hump her ass. Erra screams with delight as you pound at her gaping hole, her pleasured crying turning into whimpering as you jackhammer her ass and keep her pinned against the wall. It isn’t much longer before a burning feeling of pleasure builds in your loins until the bliss of release washes over you, climax rocking your body as you ride-out your simulated orgasm.");
		output("\n\nYou’re panting as hard as your pretty little pet is after that, trying to keep your balance on the mattress as your orgasm wanes. <i>“Good girl,”</i> you coo, reaching a hand up to your thoroughly-punished puppy’s ears and giving them a pet. You wrap your arms around Erra’s flat six-pack and slowly pull yourself out of her. Your light-bright dick flicks off as you pull her down onto the bed with you, ready to sleep away the afterglow of your orgasm.");
		output("\n\nWaking with a yawn, you realize you’re still in Erra’s bed, the leash bound ausar still held in your arms. You give her a little tap on the shoulder and go to remove her collar as she gives her legs a stretch. <i>“Hey, [pc.name],”</i> she says, collar coming off, <i>“Still here?”</i> You tell her you thought it better to stick around, or else your puppy might’ve missed you when she woke up. She chuckles, sitting herself up and wincing, rubbing her sore bottom, <i>“Gods, when I say ‘bad girl’ I don’t exactly mean ‘leave me walking funny’.”</i> Giving her a slap on one of her firm asscheek, you tell the puppy you think she can handle it. Standing up, you start to ");
		if(!pc.isCrotchExposed() && !pc.isChestExposed()) output("dress yourself.");
		else output("get ready to head out.");
	}
	processTime(24);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",erraBadPupper2);
}

public function erraBadPupper2():void
{
	clearOutput();
	showErra();
	author("Hugs Alright");
	output("Once you’re both ");
	if(!pc.isCrotchExposed() && !pc.isChestExposed()) output("dressed and ");
	output("ready, you exit the bedroom and walk into the atrium. You’re just about out the airlock when Dee speaks up, <i>“Leaving, [pc.name]? I trust you and the captain enjoyed yourselves. Speaking of, are you alright, captain? You seem to be... limping.”</i>");
	output("\n\n<i>“Can it, diodes-for-brains,”</i> barks Erra, before looking back at you with a smile, <i>“See ya around, [pc.name], don’t be afraid to pick me up if I’m in town.”</i> You bid her farewell and make your way out the airlock, the sound of Erra arguing with Dee fading as you walk away.");
	processTime(60);
	IncrementFlag("ERRA_SEXED");
	currentLocation = shipLocation;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}