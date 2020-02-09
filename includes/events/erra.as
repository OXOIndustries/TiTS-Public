//Erra can be found randomly at bars.


/* FLAGS
flags["MET_ERRA"]			- Have PC and Erra introduced each other? 1 if yes. Undefined if knot (dohohoh)
flags["ERRA_SEXED"]	 		- times sexed. Undefined if unsexed.
flags["ERRA_NEW_INTROED"] 	- has PC seen her new intro
flags["ERRA_LOVERS"]		- 1 indicates lover status. 2 indicates lovers & she is collared
flags["ERRA_HEARTBROKEN"]	- 1 indicates you broke her heart and she will not appear any longer.
flags["ERRA_PETTED"]		- How many times have you done the erra petting sex scene? undefined if 0.
flags["ERRA_WALKIES"]		- Times Erra has been Walked
flags["ERRA_CUDDLED"] 		- Times Erra has been cuddled

// Talk storage variables and what they are set to when talk is complete:
flags["ERRA_D_TALK"] = 1;
flags["ERRA_RELATIONSHIP_TALK"] = 1;
flags["ERRA_PAST_TALK"] = 1;

*/

//Bar Text
public function erraBarText(num:Number):void
{
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

public function erraLover():Boolean
{
	return (flags["ERRA_LOVERS"] != undefined && flags["ERRA_LOVERS"] >= 1);
}
public function erraCollared():Boolean
{
	return (flags["ERRA_LOVERS"] != undefined && flags["ERRA_LOVERS"] >= 2);
}
public function erraVaginalCapacity():Number
{
	return 250;
}
public function erraAnalCapacity():Number
{
	return 350;
}

public function erraAvailableForThreesome():Boolean
{
	if (flags["ERRA_SEXED"] >= 3)
	{
		if (InCollection(rooms[shipLocation].planet, ["TAVROS STATION", "PLANET: MHEN'GA", "PLANET: TARKUS", "PLANET: NEW TEXAS", "PLANET: UVETO VII", "CANADIA STATION"])) return true;
		else if (rooms[shipLocation].planet == "PLANET: MYRELLION" && flags["KQ2_MYRELLION_STATE"] == undefined) return true;
		return false;
	}
	return false;
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
		output(" ausar girl cause? You stride your way to the bar, casting a few glances away from your mystery ausar. [pc.Walking] towards the girl, her features become easier to see: short, black hair with a fluffy tail to match, what appear to be small C-cups, and a slight, lightly toned-figure. She’s dressed casually and seems pretty relaxed, but gives off an air of smugness, her gaze full of devious thoughts that you can only guess have something to do with you.");
		output("\n\nAs you reach the bar you take a seat at the stool next to hers");
		if(pc.isTaur()) output(", the chair reforming itself under you to fit your heavy frame,")
		output(" and swing around to face the bottles that line the wall; she does the same, smiling self-assuredly. The ausar girl speaks up as you wave the bartender over: <i>“So,”</i> she begins, <i>“Did I do good with the whole ‘mysterious seductress’ thing?”</i>");
		output("\n\nYou let her voice play around your head for a moment: it’s poised but levelheaded. Her words make you chuckle before you respond, ");
		if(pc.isAss()) output("<i>“You were alright.”</i>");
		else if(pc.isMischievous()) output("<i>“Well, you got me over here, didn’t you?”</i>");
		else output("<i>“I’ll say.”</i>");

		output("\n\nThe ausar laughs while you finish ordering your drink, extending a hand and smiling. <i>“Erra.”</i>");
		output("\n\nGuessing that must be her name, you reach " + indefiniteArticle(pc.hand()) + " out to meet hers and tell her: <i>“[pc.name].”</i> She takes hold of your hand and gives it a surprisingly firm shake; the bitch has got one hell of a grip, that’s for sure.");
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
	else if(flags["ERRA_SEXED"] == undefined || flags["ERRA_SEXED"] < 3)
	{
		output("Erra’s ears perk up as you [pc.walk] towards her, but she manages to keep her swishing tail under control. <i>“Back for more, [pc.name]?”</i> she asks with a smug look on her face. <i>“Should’ve known you wouldn’t be able to resist me.”</i>");
		output("\n\nYou roll your eyes at the cocksure ausar.");
		processTime(1);
	}
	//New Opening
	//Unlocks after sexing Erra 3 times.
	else
	{
		//New New Opening
		//This’ll be the opening if Erra was gifted the collar. If it’s too hand-wavy it don’t gotta be there.
		if(erraCollared())
		{
			output("As you approach Erra her tail starts to flail, and she’s doing nothing to hide it, letting it sway gleefully behind her while her ears perk up. <i>“Hey, [pc.name],”</i> she says as you take a seat, <i>“Nice to see someone that can handle me around here.”</i>");
			output("\n\nHer words clash with her cheerful display at your arrival, but manage to make you roll your eyes so hard that they might fall out of your head. You notice she’s wearing that collar you gave her, the pretty puppy idly toying with the ring of leather as she stares lustfully into your [pc.eyes].");
		}
		else
		{
			output("As you approach Erra her tail starts to flail, and she’s doing nothing to hide it, letting it sway gleefully behind her while her ears perk up. <i>“Hey, [pc.name],”</i> she says as you take a seat, <i>“Nice to see someone that can handle me around here.”</i>");
			output("\n\nHer words clash with her cheerful display at your arrival, but manage to make you roll your eyes so hard that they might fall out of your head.");
			if(flags["ERRA_NEW_INTROED"] == undefined) output(" <b>Looks like Erra’s a bit more comfortable with you now, maybe you could talk with her.</b>");
			flags["ERRA_NEW_INTROED"] = 1;
		}
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
	else addDisabledButton(2,"Sex","Sex","You aren’t aroused enough for that.");
	if(flags["ERRA_D_TALK"] == 1 && flags["ERRA_RELATIONSHIP_TALK"] == 1 && flags["ERRA_PAST_TALK"] == 1) addButton(3,"Public Pet",publicErraPets,undefined,"Public Pet","Get your hands on Erra’s big, beautiful ears.");
	else addDisabledButton(3,"Locked","Locked","You don’t know her well enough for whatever this is.");
	addButton(14,"Leave",mainGameMenu);
}

//Appearance
public function erraAppearance():void
{
	clearOutput();
	showErra();
	author("Hugs Alright");
	output("Erra is a 5\' 9\" ausar girl. Her short, black hair is parted by two rounded wolf-ears that match the color of the fur on her arms, legs, and tail. Her body is ever-so-nicely toned, honed into a capable weapon by plenty of physical activity, and her striking green eyes only serve to bolster her can-do appearance. Her skin is a wonderfully-dark shade of chocolate, but seems to lighten a bit when compared to her coal-black fur.");
	output("\n\nShe’s dressed casually: jeans and a t-shirt, both hugging her athletic frame, making the dim light of the bar hit her curves and the swell of her C-cups just right. Sitting the way she is, she looks relaxed and just a bit full of herself.");
	if(erraCollared()) output(" The collar around her neck reads, “<b><i>Erra Aulgharis - Property of [pc.name] Steele</i></b>”");
	if(flags["ERRA_SEXED"] != undefined) output("\n\nOne pretty pink ausar pussy and a nice, tight tailhole sit between her legs.");
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
	//New Talk Scenes
	//All of these new talk scenes unlock along with her new opening, after sexing Erra at least thrice over, except [You] and [Collar].
	//[You] will unlock after Erra’s walkies have been completed.

	if(flags["ERRA_SEXED"] != undefined && flags["ERRA_SEXED"] >= 3)
	{
		//[Past] Ask your ausar friend about her life before becoming a pilot for Reaper.
		addButton(1,"Past",talkToErraAboutPast,undefined,"Past","Ask your ausar friend about her life before becoming a pilot for Reaper.");
		//[Relationships] Ask Erra about any other romances she might have.
		addButton(2,"Relationships",talkToErraAboutRelationships,undefined,"Relationships","Ask Erra about any other romances she might have.");
		//[Dee] Talk to Erra about her boisterous AI co-pilot.
		addButton(3,"Dee",talkToErraAboutDeeeeeeee,undefined,"Dee","Talk to Erra about her boisterous AI co-pilot.");
		//[You] Confront Erra about her feelings for you. //Requires [Walkies] to have been done.
		if(flags["ERRA_LOVERS"] == undefined && flags["ERRA_HEARTBROKEN"] == undefined)
		{
			if(flags["ERRA_WALKIES"] != undefined) addButton(4,"You",talkToErraAbootHerself,undefined,"You","Confront Erra about her feelings for you.");
			else addDisabledButton(4,"You","You","You don’t really know her well enough for this.");
		}
		//[Collar] Give Erra that collar you bought her. //Requires “collar” key item and Erra’s lover status, as well as her cuddle scene to have been completed.
		if(pc.hasKeyItem("Ausar Collar - A custom collar for Erra.") && flags["ERRA_LOVERS"] == 1) addButton(5,"Give Collar",ifYouLikeErraThenYouShouldaPutACollarOnIt,undefined,"Give Collar","Give Erra that collar you bought her.");
		else if(erraCollared()) addDisabledButton(2,"Give Collar","Give Collar","You already gave her a collar!")
		else addDisabledButton(5,"Give Collar","Give Collar","You don’t have a collar to give to her!");
	}
	else
	{
		addDisabledButton(1,"Past","Past","Erra doesn’t want to talk about this right now.");
		addDisabledButton(2,"Relationships","Relationships","Erra doesn’t want to talk about this right now.");
		addDisabledButton(3,"Dee","Dee","Erra doesn’t want to talk about this right now.");
		addDisabledButton(4,"You","You","Erra doesn’t want to talk about this right now.");
		addDisabledButton(5,"Give Collar","Give Collar","Erra doesn’t want to talk about this right now.");
	}
	addButton(14,"Back",approachErra,true);
}

//[Erra]
public function talkToErraAboutErra():void
{
	clearOutput();
	showErra();
	author("Hugs Alright");
	output("<i>“Me?”</i> Erra begins, <i>“I’m a pilot - Reaper Armaments, ‘Anomalous Materials Transportation.’”</i> The ausar scoffs at her own words, <i>“Really wish they’d just call me a fucking delivery girl if they’re gonna pay me like one.”</i>");
	output("\n\n<i>“Is it that bad?”</i> you ask.");
	output("\n\nErra shrugs, <i>“Can’t complain, really. I like the work, flying through the infinite void, meeting new people and the occasional cute " + pc.mf("guy","girl") + ",”</i> she says, winking your way. <i>“It’s just,”</i> she pauses, <i>“You expect to make a bit more for, you know, flying through the infinite void with crates full of gods know what.”</i>");
	output("\n\nTelling her that’s understandable, you ask Erra a bit more about herself.");
	output("\n\n<i>“Well, when I’m not flying I usually like to hit the bar and find some... ‘company’,”</i> she says, giggling as she finishes her sentence. The ausar knocks back another drink before she continues, <i>“Other than that, I just sort’ve... hangout. Nice to get out of that stuffy uniform, you know? Chat with people I’ve already met, work out, listen to some music; gods, you wouldn’t believe how many good bands you find on the edge of nowhere.”</i>");
	output("\n\nErra looks like she’s about to go off on a tangent, tail wagging violently. She stops herself from getting too giddy, smiles, and stares into her drink for a moment. She brings her gaze back up towards yours and asks, <i>“What about you? Do anything interesting?”</i>");
	output("\n\nOh boy; you take a deep breath before you start to unravel your tale before her: your father, the probes, the fortune, your quest, your crew, ");
	//notOnTavros:
	if(rooms[currentLocation].planet != "TAVROS STATION") output("the planets you’ve been to, ");
	output("and your good name. Erra is impressed by the time you finish, looking at you wide-eyed for a moment before speaking up, <i>“Uh, wow, you know when you’re picking up random " + pc.mf("guys","chicks") + " at bars, you don’t exactly expect to come across billionaire fortune-hunters, especially not cute ones.”</i>");
	output("\n\nYou smile and tell her that’s what they usually say.");
	processTime(15);
	clearMenu();
	addButton(0,"Next",approachErra,true);
}

//Sex Scenes
//Sex Opening
public function erraSexGOOO(shortIntro:Boolean = false):void
{
	if(flags["ERRA_SEXED"] == undefined || !shortIntro)
	{
		clearOutput();
		showErra();
	}
	author("Hugs Alright");
	if(flags["ERRA_SEXED"] == undefined)
	{
		output("<i>“So, why don’t we head to your place?”</i> you suggest.");
		output("\n\nErra’s complacent look turns to a lustful grin at your words. <i>“Think you can handle me, [pc.name]?”</i> she asks, tail swaying from side-to-side.");
		output("\n\nYou return her smirk and give her a mock-shrug, ");
		if(pc.isAss() || pc.isMischievous()) output("<i>“Eh, I’m sure I’ve seen worse.”</i>");
		else output("<i>“I guess we’ll find out.”</i>");

		output("\n\n<i>“Well then,”</i> Erra begins to respond, standing up and looking at you over her shoulder, longing in her gaze, <i>“Let’s get going, </i>tough " + pc.mf("guy","girl") + "<i>.”</i>");
		output("\n\nYou get up from your stool and begin to follow Erra as she walks out of the bar, watching her tail’s hypnotic motions as she leads you to her ship. When you enter the docks, you look for the ship that belongs to your ausar companion, and there it is: painted with Reaper Armament’s colors. It’s pretty damn big, incredibly beefy for a transport ship, and you spot a couple mean-looking turrets on the behemoth, probably installed by Reaper themselves.");
		output("\n\nFollowing Erra forward, you take in the sight of the ship until the airlock opens, and your ausar friend extends an arm, inviting you in. <i>“Welcome to my humble abode,”</i> she proclaims as you both enter the ship. Humble, yeah right; the interior of the ship seems a bit small compared to the outside, although most of the interior space is probably storage. All the furniture is very rounded and sleek, giving the interior a very modern feel.");
		output("\n\nYour inspection is broken by a booming, almost robotic voice coming from what seems to be the very walls of the ship, <i>“Welcome back, Captain. I see you’ve brought a guest.”</i>");
		output("\n\nErra groans, <i>“Dammit, Dee, I told you to stop doing that when I bring someone home.”</i>");
		output("\n\nThe robotic voice responds <i>“Apologies, Captain. It’s protocol.”</i>");
		output("\n\n<i>“Who’s this?”</i> you ask, raising an eyebrow.");
		output("\n\nTurning towards you Erra begins to explain: <i>“This is Dee, the AI Reaper installed in my ship to uh, ‘help’ with logistics and piloting, even though that’s my job.”</i> The ausar lets out a sigh, <i>“Meet [pc.name], Dee.”</i>");
		output("\n\n<i>“Nice to meet you, [pc.name],”</i> Dee answers, <i>“I am D74, KihaCorp piloting and logistics AI. You may call me Dee.”</i>");
		output("\n\nConfused by the sudden addition of an AI to this little adventure, all you can manage to say is: <i>“Uh, thanks, Dee.”</i>");
		output("\n\n<i>“New friends, all around,”</i> Erra announces, holding out her arms and turning towards a nearby door before stopping and looking over her shoulder, <i>“Coming, [pc.name]?”</i> You roll your eyes and follow her to the next room. The door hisses open, revealing a big, round bed with a Reaper Armaments jumpsuit lying strewn across it; must be Erra’s. You ");
		if(pc.isTaur()) output("trot");
		else if(pc.isGoo() || pc.isNaga()) output("slither");
		else output("step");
		output(" forward towards the edge of the bed while your ausar friend dims the lights.");
		output("\n\nA pair of fuzzy hands grip your shoulders and turn you around before you’re pulled into a passionate kiss and pushed down onto the mattress. Erra straddles you");
		if(pc.isTaur()) output("r upper half");
		output(" and straightens herself, pulling back from the kiss. She smiles down at you as she removes her shirt, revealing her cuppable breasts. You grin deviously and grab at her hips, your hands running up and down her firm sides until Erra loses a bit of her composure. A quivering breath escapes her lips as your hands reach the swell of her tits. She quickly returns herself to the kiss, her mouth opening to let your [pc.tongue] explore it.");
		if(!pc.isCrotchExposed() || !pc.isChestExposed()) output("\n\nThe two of you work your way out of your clothes, discarded garments falling on the bed until you’re both naked as a couple of lovers can get, rolling around on the mattress.");
		else output("\n\nYou help Erra work her way out of her clothes until you’re both naked as a couple of lovers can get, rolling around on the mattress.");
		output(" Kissing quickly turns to groping and fondling as Erra makes her way atop you again, pulling herself back as her velveteen hands have their way with your body. <i>“Hold on, gotta get something quick,”</i> she says, rolling off you and reaching for a nearby drawer. You roll over on your side and take a good look at Erra’s ass as she grabs whatever it is she needs, licking your lips at the sight of those gropable cheeks.");
		output("\n\nWhen she turns around, you’re expecting to be handed a ");
		if(pc.hasCock()) output("condom");
		else output("toy of some sort");
		output(", but instead you’re handed a collar and leash, while Erra presents her neck to you expectantly.");
		output("\n\nYou sit up and tell her this wasn’t exactly what you were expecting from her.");
		output("\n\n<i>“What?”</i> she says, <i>“Aren’t all ausar girls into this kind of stuff?”</i>");

		if(pc.race().indexOf("ausar") != -1 && pc.hasTail()) output("\n\nYou cross your arms, making sure you give your [pc.tails] an emphasizing flick so your canine friend sees it, ");
		else output("\n\nYou cock an eyebrow, ");
		output("resulting in a sigh from Erra as she brings herself to sit down on the mattress. <i>“Well, honestly, I didn’t really get into, or know much about, this kind of stuff until I started hanging out with humans.”</i> The ausar smiles up at you, bringing herself down on all fours and crawling towards you. <i>“Ended up really liking it, getting treated like a puppy and all that stuff: the petting, the collars and leashes, all the ‘good girls’ and praise.”</i> She visibly shudders at her own words.");
		output("\n\n<i>“But, you can treat me like a bad girl if you really want,”</i> the ausar whispers, smile turning to a lustful grin as her tail begins to sway back and forth.");
		processTime(15);
		pc.changeLust(15);
	}
	else
	{
		if(!shortIntro)
		{
			output("<i>“How about the two of us get out of here?”</i> you suggest.");
			output("\n\nErra leans back as a smirk forms upon her face. <i>“Up for more, [pc.name]? Can’t say I’m all that surprised,”</i> she says, standing up from her stool. <i>“Most people can’t resist coming back for more.”</i>");
			output("\n\nYou give your eyes a good roll. <i>“If you say so,”</i> you tell her, standing up and running a finger along one of her wolf-ears as your voice quiets to a whisper, <i>“</i>puppyslut<i>.”</i>");
			output("\n\nErra grins deviously at that word, and the way her ears twitch make you think she likes it. The ausar still manages to keep her tail under control, allowing her to maintain her composure as the two of you make your way out of the bar.");
		}
		output("\n\nIt isn’t long before Erra’s increasingly familiar ship comes into view, and the two of you ");
		if(pc.isTaur() || pc.isGoo() || pc.isNaga()) output("enter");
		else output("walk");
		output(" through the airlock. You’re greeted by Dee’s robotic voice as you enter the ship’s atrium: <i>“Welcome back, Captain. Nice to see you again, [pc.name].”</i>");
		output("\n\n<i>“Hey, Dee,”</i> you say, walking to the bedroom with your ausar companion.");
		output("\n\n<i>“I trust you and Captain Erra are here to conduct more ‘business,’”</i> the AI quips, making her captain groan with disdain as the bedroom door closes behind you.");
		output("\n\nErra’s already removing her clothes by the time the door closes, her breasts coming free of her shirt and jiggling as they come to a rest.");
		if(!pc.isCrotchExposed() || !pc.isChestExposed()) 
		{
			output(" You figure you better do the same and start to remove your [pc.gear]. As you’re making yourself bare, a crumpled up pair of jeans hit you, causing you to move your gaze, only to be granted a fantastic view of Erra’s firm puppy-butt, tail lifted straight up as she bends over to search for her collar. You grin at the lusty ausar’s little scheme as the last of your gear comes off. ");
			if(pc.isTaur()) output("Getting your haunches");
			else output("Sitting yourself down");
			output(" on her bed, you watch Erra straighten herself and flex her semi-muscular back before she turns around with a familiar, smug look on her face.");
		}
		else 
		{
			output(" You decide to make yourself comfortable and ");
			if(!pc.isTaur()) output("sit");
			else output("set your haunches");
			output(" down on the bed. While you’re waiting for your lover to get herself ready, you treat yourself to a fantastic view of Erra’s firm puppy-butt, tail lifted straight up as she bends over to search for her collar. You watch Erra straighten herself and flex her semi-muscular back before she turns around with a familiar, smug look on her face.");
		}
		output("\n\nYour soon-to-be pet lunges onto the bed, landing on all fours and tossing her collar to you. <i>“So,”</i> she begins, <i>“What do you have planned for your puppy today?”</i> Her smugness turns to lust, tail swishing left to right, left to right as she patiently awaits your next move.");
		processTime(4);
		pc.changeLust(15);
	}
	
	moveTo("ERRAS SHIP");
	
	clearMenu();
	//[Good girl] Reward your puppy with some vaginal lovin’.
	//[Bad girl] Punish your disobedient pet via her tight little tailhole. //Requires cock or hardlight strapon.
	//Neither are Naga or Taur compatible.
	addButton(0,"Good Girl",goodGirlSexForErra,undefined,"Good Girl","Reward your puppy with some vaginal lovin’.");
	if((pc.hasCock() && pc.cockThatFits(erraAnalCapacity()) >= 0) || pc.hasHardLightEquipped()) addButton(1,"Bad Girl",badGirlAnalErraStuff,undefined,"Bad Girl","Punish your disobedient pet via her tight little tailhole.");
	else addDisabledButton(1,"Bad Girl","Bad Girl","You need a penis that will fit inside Erra for this - or some underwear equipped with a hardlight phallus.");

	//New Sex Scenes
	//Nothing’s taur compatible, Erra ain’t into horses gosh dangit.
	//[Pets] 
	addButton(2,"Pets",erraSexPets,undefined,"Pets","Provide your perpetually pretty puppy with some pets.");
	//Requires cock or vagina, and high exhibition. Not taur compatible.
	if(pc.hasGenitals() && pc.exhibitionism() >= 33) addButton(3,"Walkies",walkiesWithErra,undefined,"Walkies","Take your pet for a walk.");
	else if(!pc.hasGenitals()) addDisabledButton(3,"Walkies","Walkies","You need genitals for this scene.");
	else addDisabledButton(3,"Walkies","Walkies","You aren’t enough of an exhibitionist for that.");

	//Requires Erra’s <i>“lover”</i> status. Not taur compatible.
	if(erraLover()) addButton(4,"Cuddle",erraCuddleScenes,undefined,"Cuddle","Cuddle your puppy.");
	else addDisabledButton(4,"Cuddle","Cuddle","You don’t have that kind of relationship.");
	//addButton(14,"Back",approachErra,true);
}

//Repeatable Sex Opening
public function goodGirlSexForErra():void
{
	clearOutput();
	showErra(true);
	author("Hugs Alright");
	var x:int = -1;
	if(pc.hasCock()) x = pc.cockThatFits(erraVaginalCapacity());
	
	output("With a smile you lean forward and close Erra’s collar around her neck, taking hold of her leash. <i>“I think you’ve been a pretty good girl,”</i> you state, placing a hand between your puppy’s jet-black wolf-ears, making her elicit a contented sigh as she starts to nuzzle against your palm.");
	output("\n\nYou take a moment to scritch at Erra’s ears, running your hand through her short, dark mane until her breath starts to stutter and quiver. Giving your puppy a few last pets, you pull back, revealing her wide smile and wagging tail. <i>“Why don’t you get on the edge of the bed, girl?”</i> you suggest, making Erra’s tail wag even faster as you stand up off the bed and give her leash a tug. She’s quick to do as you say, bringing herself to the edge of the mattress, still on all fours, before turning around and presenting her oh-so firm and gropable booty.");
	output("\n\nKneeling down");
	if(pc.isTaur()) output(" on your haunches");
	output(", you get yourself level with your puppy’s butt, gaze fixed on her lube-leaking pussy. You lick your lips and grab Erra’s ass with both hands, spreading her lower cheeks, giving you unrestricted access to her sex. While your pet wiggles with anticipation, you spread her velvety folds with your thumbs, drawing a shuddering breath from the leash-bound ausar. Not needing any encouragement other than Erra’s trembling figure, you dig in, [pc.tongue] already penetrating your puppy’s quim, delving deep to seek out her g-spot. She starts to moan and whimper as you have your way with her, sounds of pleasure turning to squeals as you knead and squeeze her ass in your hands.");
	output("\n\nYou happily lap up your puppy’s girlcum while her moans fill the room, driving you to probe her pussy deeper with your agile tongue. Once you’ve gotten Erra’s sex nice and juicy with your oral affections, you pull out of her, licking up the last of her arousal coating your lips before you stand up again. The room is silent except for the sound of your pet’s breathing, heavy and labored, still recovering from near-orgasm.");
	if(!pc.isTaur()) output(" Nudging her slightly, you get Erra to crawl forward a bit, enough so that you can make your own way onto the bed and kneel behind her.");
	//hasCock:
	if(x >= 0)
	{
		output("\n\nGrinning, you");
		if(!pc.isTaur()) output(" bend yourself over Erra, [pc.chest] pressing into her back");
		else output(" mount Erra with your frontmost pair of legs straddling her shoulders");
		output(", making the puppy squirm while the [pc.cockHead " + x + "] of your stiffening shaft brushes against the folds of her sex. She shudders, body quivering, as you bring yourself closer to one of her raised wolf-ears and ask, <i>“Does puppy want a bone?”</i> She most certainly does, nodding hurriedly as you lift a hand to scratch between her ears. Not wanting to keep such a good girl waiting, you start to push into her, spreading her nether lips with ease, already loosened from your oral pleasures. Her love tunnel hugs at your [pc.cock " + x + "] as you slide it into her, keeping your tool nice and warm until ");
		if(pc.hasKnot(x)) output("your penetration is halted by your [pc.knot " + x + "].");
		else output("you finally bottom out inside her.");
		pc.cockChange();
		output("\n\nYou keep your [pc.cock " + x + "] lodged inside her for a moment, scritching at her ears as she whimpers and moans. <i>“Does that feel good, girl?”</i> you ask, giving your hips a little wiggle, cockflesh rubbing against Erra’s inner walls, making her whimper loudly, <i>“I’ll take that as a yes.”</i> Listening to your puppy moan, you start to pull out, groaning with bliss as ausar snatch starts to pulse around your [pc.cock " + x + "], trying to pull you back in. You give Erra’s needy quim what it wants and thrust back into her. Your pet cries out with delight as she’s filled again. You continue with the same motion, gradually picking up in speed until you’re pounding your puppy’s pussy, ");
		if(!pc.isTaur()) output("whispering");
		else output("practically screaming");
		output(" words of praise into her twitching ears, making sure she’s reminded of what a good girl she is, bringing her to the edge of her climax.");
		if(pc.hasKnot(x))
		{
			output("\n\nWith one good thrust you pop your [pc.knot] into Erra, who cries out with pleasure as the bulb of cockflesh spreads her lube-soaked lips wide. The sheer size of your knot paired with your kind words appears to be enough to make your pet cum, ausar cunt beginning to spasm around your [pc.cock " + x + "], causing you to groan loudly. You continue to hump Erra’s ass with short, fast thrusts as girlcum spills out around your [pc.cockNoun " + x + "], racing to join your happy ausar pet in orgasm.");
			output("\n\nYour puppy’s pleasured tones and convulsing cunt quickly become too much for you, sending you over the edge. Fingers of release caress your [pc.cock " + x + "] as it spasms inside of your pet, [pc.cum] emptying into her love tunnel while she pants and moans.");
			if(pc.cumQ() >= 2500)
			{
				output(" You moan as loudly as Erra does as you shoot your tremendous load into her waiting womb, making her stomach swell until you hear a quivering plea of <i>“Please, more,”</i> from the puppy. You fill her with as much [pc.cum] as she can handle, all until she’s looking positively pregnant, full of your seed.");
			}
			else output(" You moan as loudly as Erra does as you shoot your load into her waiting womb, pumping her full of your seed, kept nice and secure inside her by your [pc.knot " + x + "].");
			output("\n\nYou ");
			if(!pc.isTaur()) output("run a hand across Erra’s fluffy ears as you finally come down from your climax, lovingly petting her ears and whispering ");
			else output("tremble in your spot as you finally come down from your climax, whispering one last ");
			output("<i>“Good girl.”</i> ");
			if(!pc.isTaur()) output("Pulling her down onto the mattress, you wrap your arms around her. ");
			else output("falling down onto the bed, you take Erra with you, keeping her warm and safe next to your lower half. ");
			output("You cuddle your puppy, whispering more praise into her ears until she falls asleep to await your knot’s deflation.");
		}
		//noKnot:
		else
		{
			output("\n\nYour thrusting picks up to a blinding pace, making Erra cry out with pleasure as you ravish her sex. The sheer vigor of your fucking paired with your kind words appears to be enough to make your pet cum, her ausar cunt spasming around your [pc.cock " + x + "], causing you to groan loudly. You continue to hump Erra’s ass with short, quick thrusts as girlcum spills out around your [pc.cockNoun " + x + "], racing to join your happy ausar pet in orgasm.");
			output("\n\nYour puppy’s pleasured tones and convulsing cunt quickly become too much for you, sending you over the edge. Fingers of release caress your [pc.cock " + x + "] as it spasms inside of your pet, [pc.cum] emptying into her love tunnel while she pants and moans.");
			if(pc.cumQ() >= 2500) output(" You moan as loudly as Erra does as you shoot your tremendous load into her waiting womb, making her stomach swell until you hear a quivering plea of <i>“please, more,”</i> from the puppy. You fill her with as much [pc.cum] as she can handle, all until she’s looking positively pregnant, full of your seed.");
			else output(" You moan as loudly as Erra does as you shoot your load into her waiting womb, pumping her full of your seed.");
			output("\n\nYou ");
			if(!pc.isTaur()) output("run a hand across Erra’s fluffy ears as you finally come down from your climax, lovingly petting her ears and whispering ");
			else output("tremble in your spot as you finally come down from your climax, whispering one last ");
			output("<i>“Good girl.”</i> You remove your softening [pc.cockNoun " + x + "] from her satisfied quim, making her shudder. Smiling, you ");
			if(!pc.isTaur()) output("pull your ausar down onto the mattress with you");
			else output("lower yourself onto the mattress with Erra");
			output(", wrapping your arms around her, cuddling the puppy and whispering more praise into her ears until she falls asleep.");
		}
		processTime(20);
		pc.orgasm();
	}
	//noCock:
	else
	{
		output("\n\nGrinning, you bend ");
		if(!pc.isTaur()) output("yourself");
		else output("your upper half");
		output(" over Erra, [pc.chest] pressing into her back, making the puppy squirm while a pair of your fingers brush against the folds of her sex. She shudders, body quivering as you bring yourself closer to one of her raised wolf-ears to ask <i>“Does puppy want a treat?”</i> She most certainly does, nodding hurriedly as you lift a hand to scratch between her ears. Not wanting to keep such a good girl waiting, you start to push your digits into her, spreading her nether lips with ease, already loosened from your oral pleasures. Her love tunnel hugs at your fingers as you slide them into her, so warm and wet.");
		output("\n\nYou keep your digits lodged inside her for a moment, scritching at her ears as she whimpers and moans. <i>“Does that feel good, girl?”</i> you ask, wiggling your intruding members against her inner walls, making her whimper loudly, <i>“I’ll take that as a yes.”</i> You slowly begin to retract your fingers, making your puppy whine as she’s emptied, begging for more. You give Erra’s needy quim what it wants and push your digits back into her, setting her moaning again. Picking up in speed, you continue to finger your pet’s sodden pussy, whispering words of praise into her twitching ears, making sure she’s reminded of what a good girl she is, bringing her to the edge of her climax.");
		output("\n\nWith nothing but pleasing your pet on your mind, you slip a third finger into Erra’s cunt, making her cry out with delight while you continue to finger her. Your vigorous probing paired with your kind words appears to be enough to make your pet cum. Her ausar cunt spasms around your prodding digits, girlcum spilling out onto the sheets as orgasm pulses through her body.");
		output("\n\nYou run a hand across Erra’s fluffy ears as she finally come down from her climax, lovingly petting your puppy’s ears and whispering <i>“Good girl.”</i> Pulling ");
		if(!pc.isTaur()) output("her");
		else output("yourself");
		output(" down onto the mattress, wrap your arms around her, cuddling the puppy until she falls asleep with you.");
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
	
	output("A familiar feeling of fur-on-skin wakes you; your vision is hazy with post-coital bliss, but you look down to see that Erra has moved a bit in her sleep, and is now nuzzling her head into your [pc.chest]. You grin at the sight of the smug ausar’s soft-side put on display and give her a pat on the back to wake her.");
	output("\n\nShe lets out a little yawn and moves her head to look up at you, <i>“Hey, [pc.name],”</i> she says, <i>“Stick around for seconds or... ?”</i>");
	output("\n\nYou roll your eyes at her and pull ");
	if(x >= 0 && pc.hasKnot(x)) output("your [pc.cock " + x + "] out of her quim, eliciting a little whimper from the girl before you go to stand up");
	else output("yourself out out of her grasp and go to stand up");
	output(". Erra stretches and sits up, taking her collar off and going to put her clothes back on, ");
	if(!pc.isCrotchExposed() || !pc.isChestExposed()) output("and you figure you should do that same.");
	else output("and you get up to give your limbs a stretch.");

	output("\n\nOnce you’re both ");
	if(!pc.isCrotchExposed() || !pc.isChestExposed()) output("dressed and ");
	output("ready, you head out back into the ship’s atrium and make your way to the airlock. <i>“You seem happy, Captain,”</i> Dee’s voice booms. <i>“I trust that means you and [pc.name] enjoyed yourselves.”</i> Erra’s eyes widen with an emotion akin to anger as you start to [pc.walk] out of the ship. She quickly regains control of her emotions before saying, <i>“Later, [pc.name], stop by some time.”</i>");
	output("\n\nDee chimes in as well, calling out <i>“Farewell, [pc.name].”</i>");
	output("\n\nYou say goodbye to the two, and as the airlock closes behind you, you can faintly hear, <i>“Hey, Dee, time for one of our ‘talks’.”</i>");
	IncrementFlag("ERRA_SEXED");
	processTime(35);
	restHeal();
	currentLocation = shipLocation;
	refreshRoamingBarEncounter();
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
	
	output("Without a word you bound forward, grabbing Erra’s shoulders and pushing her onto her back. She hits the mattress with a yelp, but a smirk still remains on her face. You ");
	if(!pc.isTaur()) output("straddle her, leering");
	else output("step back off the mattress, bending your upper-half and leering");
	output(" at her athletic frame while you trail a finger along the edge of her fluffy, black ears. Your teasing touch makes her whimper, her face curling with desire as you whisper into her ear. <i>“I think you’ve been a very bad girl,”</i> you murmur, removing your finger from her ears, <i>“And bad girls need to be punished.”</i> You take hold of Erra’s collar and buckle it nice and tight around her neck before you straighten yourself, smiling at the sight of your freshly collared pet. Taking hold of her leash you give it sharp tug, pulling her upward before you bark out <i>“Ass up, girl!”</i>");
	output("\n\nManaging to keep her smug demeanor, Erra rolls onto her stomach with her ass in the air and her face against the mattress, tail raised invitingly as she looks back at you with an eager grin. You don’t think she’ll stay that way for long. Keeping her leash taut, you reach your hands down to grab her firm, gropable butt... all yours to have your way with. Erra starts to whimper as you knead her ass in your dexterous grip. You give her behind a solid squeeze and spread her lower cheeks wide, giving you a good view of her tight little tailhole.");
	output("\n\nDevious thoughts cross your mind as you gaze upon Erra’s winking pucker, and you plan to put them into action. You quickly wet a finger and bring it to meet your puppy’s asshole. She tenses and shivers, whining gently as you press your naughty digit into her. <i>“Better loosen up, girl,”</i> you tell her, <i>“Unless you want me to go in dry.”</i> She forces herself to relax after hearing that, allowing your finger to slip into her supple hole. Your pet squirms and clenches her fists, trying to quell the sensation of your digits probing her.");
	output("\n\nShe must not get too much action in this end: she’s tight as can be, almost strangling your finger as it prods her asshole, her whimpers turning into moans. Grinning, you slip another finger in Erra’s pucker; your first finger already had her moaning, and the addition of a second digit has her crying out with delight. She moans until you give her leash a good yank, quieting her for a moment, fingering her ass while silent sounds of pleasure escape her mouth.");
	output("\n\nErra feels a bit looser now, and you think she’s just about ready. You yank her tether hard, pulling her up again with a gag. Your fingers are still lodged in her ass when you grab your pet from behind and pin her against the wall, ");
	if(!pc.isTaur()) output("pressing yourself into her with your [pc.chest] against her back");
	output(". Erra’s hands claw at the wall, the poor puppy trying to comprehend the delightful mix of pleasure and pain she’s experiencing. <i>Now</i> she’s ready; with a sly grin you withdraw your fingers from Erra’s slightly-gaping pucker, making her whimper as your digits make their exodus. Your pet is panting now, longing for something to fill the emptiness you left her with... and you’ve got just the thing to fill her with.");

	//hasCock:
	if(x >= 0)
	{
		output("\n\n");
		if(!pc.isTaur()) output("Keeping a hand on your ausar’s hips, you grab your rapidly stiffening member and give it a few strokes as you line it up with Erra’s pucker, left agape by your fingers. ");
		else output("Keeping Erra in her place, you mount her with your frontmost legs around her shoulders, stiffening member lined up with Erra’s pucker, left agape by your fingers. ");
		output("<i>“Time for your punishment, girl,”</i> you whisper into a twitching wolf-ear. With that said, you thrust into her, [pc.cock " + x + "] spreading her tailhole even wider as you shove your tool into her with one, long stroke. Erra moans all the louder when you push into her, but another good tug of her leash is enough to keep your puppy quiet, so she can focus on nothing but the [pc.cock " + x + "] filling her. She whines and whimpers as you bottom, her tight little tailhole spasming around your [pc.cock " + x + "] as she tries to accommodate your length.");
		pc.cockChange();
		output("\n\nYou smile at your pet’s little howls. Keeping her leash nice and taut, you start to pull out of her. Erra moans again as your [pc.cock " + x + "] glides along her inner walls; of course, she’s quickly silenced by a pull of her leash, making her grunt. You, on the other hand, aren’t able to stay so silent: the sheer tightness of your puppy’s pucker makes you groan with satisfaction until your [pc.cockHead " + x + "] meets her asshole again. Looking at Erra, you can see she’s still panting, tongue hanging out while she tries to suppress her noises of pleasure. With a grunt you thrust back into your pet, [pc.cock " + x + "] filling her once more, another moan escaping the ausar’s mouth before you pull her leash again, <i>“Bad girl, quiet.”</i>");
		output("\n\nYour wolf-puppy struggles to keep herself silent, little whimpers and whines constantly escaping her as you start to roll your hips; each time she fails results in another rough yank of her leash. Erra’s fists clench as you start to speed up, hammering her ass at an increasingly vigorous pace until your focus is broken by a shrill cry of pleasure. Your puppy’s voice quickly breaks into a moan as her orgasm begins. Her body tenses as her tailhole spasms around your [pc.cock " + x + "], her cock-hungry sex dripping girlcum onto the sheets. The ecstasy of climax has Erra shivering until her orgasm ebbs, her body going limp and pucker loosening as her chest heaves.");
		output("\n\nWith your pet as loose as can be now, you feel compelled to speed yourself to orgasm. Your thrusts are made easier by Erra’s now supple hole. A chorus of quiet moans and gasps ring in your ears as the speed of your reaming picks up, sending you closer to your edge.");
		//hasKnot:
		if(pc.hasKnot(x))
		{
			if(!pc.isTaur()) output("\n\nTightening your grip on your ausar’s hips, you pull her down, right onto your waiting [pc.knot " + x + "].");
			else output("\n\nWith your orgasm rapidly approaching, you thrust forward her, pushing your [pc.knot] right into your ausar pet.");
			output(" The bulb of flesh pops into her gaping pucker with ease. Erra screams with delight at the feeling of your knot stretching her asshole to its limits. Her pleasured crying turns into whimpering under the pressure of your ass-jackhammering that keeps her pinned against the wall. It isn’t much longer before your [pc.cock " + x + "] begins to spasm, a long groan escaping your lungs as you begin to fill your puppy with your seed.");
			if(pc.cumQ() >= 2500) output(" [pc.Cum] floods Erra’s pucker until her flat six-pack starts to distend, stomach swelling until she whimpers <i>“don’t stop.”</i> You have no intention of stopping, your knot locking your ausar in place until her belly bulges full of your cum.");
			else output(" [pc.Cum] floods Erra’s pucker, painting her inner walls [pc.cumColor] while you jerkily buck your [pc.hips] into hers.");
			output("\n\nYou’re panting as hard as your pretty little pet is after that, trying to keep your balance on the mattress as your orgasm wanes. <i>“Good girl,”</i> you coo");
			if(!pc.isTaur())
			{
				output(", reaching a hand up to your thoroughly-punished puppy’s ears to give them a pet. You wrap your arms around Erra’s ");
				if(pc.cumQ() >= 2500) output("bloated belly");
				else output("flat six-pack");
				output(" and pull her down onto the bed with you.");
			}
			else output(", collapsing down onto the mattress and taking Erra with your, safe and warm against your lower-half.")
			output(" Her C-cups are still heaving as you hold her close, ready to sleep off your knot.");
			output("\n\nYou awake sometime later with a yawn and realize you’re still in Erra’s bed, the leash bound ausar still held in your arms. You give her a little tap on the shoulder and go to remove her collar as she gives her legs a stretch. <i>“Hey, [pc.name],”</i> she says, collar coming off, <i>“Still here?”</i>");
			output("\n\nYou tell her that neither of you could exactly leave and promptly remove your flaccid [pc.cockNoun " + x + "] from her ass, [pc.knot " + x + "] coming out with a pop, allowing [pc.cumNoun] to dribble onto the mattress.");
			output("\n\nShe chuckles, sitting herself up and wincing, rubbing her sore bottom, <i>“Gods, when I say ‘bad girl’ I don’t exactly mean ‘leave me walking funny.’”</i> Giving her a slap on a firm asscheek, you tell her you think she can handle it. You stand up and start to ");
			if(!pc.isCrotchExposed() || !pc.isChestExposed()) output("dress yourself.");
			else output("get ready to head out.");
		}
		//noKnot:
		else
		{
			output("\n\n");
			if(!pc.isTaur()) output("Tightening your grip on your ausar’s hips, you pull her down, holding her still on your [pc.cock " + x + "] as you hump her ass");
			else output("With your orgasm rapidly approaching, you thrust forward her, pushing your tool deep inside your ausar pet");
			output(". Erra screams with delight as you pound at her gaping hole. Her pleasured cries turn into whimpering as you jackhammer her ass and keep her pinned against the wall. It isn’t much longer before your [pc.cock " + x + "] begins to spasm, a long groan escaping your lungs as you begin to fill your puppy with your seed. ");
			if(pc.cumQ() >= 2500) output("[pc.Cum] floods Erra’s pucker until her flat six-pack starts to distend, stomach swelling until she whimpers <i>“don’t stop.”</i> You have no intention of stopping, your ausar keeping her place on your [pc.cockNoun] until her belly bulges full of your cum.");
			else output("[pc.Cum] floods Erra’s pucker, painting her inner walls [pc.cumColor] while you jerkily buck your [pc.hips] into hers.");
			output("\n\nYou’re panting as hard as your pretty little pet is after that, trying to keep your balance on the mattress as your orgasm wanes. <i>“Good girl,”</i> you coo, ");
			if(!pc.isTaur()) output("reaching a hand up to you thoroughly-punished puppy’s ears and giving them a pet");
			else output("pulling the rest of your lower half onto the mattress and collapsing onto it");
			output(". You wrap your arms around Erra’s ");
			if(pc.cumQ() >= 2500) output("bloated belly");
			else output("flat six-pack");
			if(!pc.isTaur()) output(" and slowly pull yourself out of her");
			else output(" after pulling yourself out of her");
			output(". [pc.CumNoun] dribbles onto the mattress as you pull her ");
			if(!pc.isTaur()) output("down onto the bed with you");
			else output("into your warm embrace");
			output(", ready to sleep away the afterglow of your orgasm.");
			output("\n\nYou awake sometime later with a yawn and realize you’re still in Erra’s bed, the leash bound ausar still held in your arms. You give her a little tap on the shoulder and go to remove her collar as she gives her legs a stretch. <i>“Hey, [pc.name],”</i> she says, collar coming off, <i>“Still here?”</i>");
			output("\n\nYou tell her you thought it better to stick around, or else your puppy might’ve missed you when she woke up.");
			output("\n\nShe chuckles, sitting herself up and wincing, rubbing her sore bottom, <i>“Gods, when I say ‘bad girl’ I don’t exactly mean ‘leave me walking funny.’”</i> Giving her a slap on a firm asscheek, you tell her you think she can handle it. Standing up, you start to ");
			if(!pc.isCrotchExposed() || !pc.isChestExposed()) output("dress yourself.");
			else output("get ready to head out.");
		}
	}
	else
	{
		output("\n\nKeeping your ausar pinned to the wall, you reach for your hardlight-equipped [pc.lowerUndergarment] and quickly activate the holopenis. Erra moves her head to glance a look at your glowing dong as you ");
		if(!pc.isTaur()) output("give it a few strokes");
		else output("mount her");
		output(", lining it up with her pucker, left agape by your fingers. <i>“Time for your punishment, girl,”</i> you whisper into a twitching wolf-ear. With that said, you thrust into her, radiant cock spreading her tailhole even wider as you shove your tool into her with one, long stroke. Erra moans all the louder as you push into her, but another good tug of her leash is enough to keep your puppy quiet, so she can focus on nothing but the hardlight shaft filling her. She whines and whimpers as you bottom out. Her tight little tailhole spasms around your simulated cock as she tries to accommodate your length.");
		output("\n\nYou smile at your pet’s little howls. Keeping her leash nice and taut, you start to pull out of her. Erra starts to moan again as your hardlight cock glides along her inner walls, of course, she’s quickly silenced by a pull of her leash, making her grunt. You, on the other hand, aren’t able to stay so silent: the sheer tightness of your puppy’s pucker making you groan with satisfaction until your glowing cockhead meets her asshole again. Looking at Erra, you can see she’s still panting, tongue hanging out while she tries to suppress the noises of her pleasure. With a grunt you thrust back in your pet, lightdick filling her once more, another moan escaping the ausar’s mouth before you pull her leash again, <i>“Bad girl, quiet.”</i>");
		output("\n\nYour wolf-puppy struggles to keep herself silent, little whimpers and whines constantly escaping her as you start to roll your hips; each time she fails results in another rough yank of her leash. Erra’s fists clench as you start to speed up, hammering her ass at an increasingly vigorous pace until your focus is broken by a shrill cry of pleasure. Your puppy’s voice quickly breaks into a moan as her orgasm begins. Her body tenses, tailhole spasming around your energy-dick while her cock-hungry sex drips girlcum onto the sheets. The ecstasy of climax has Erra shivering until her orgasm ebbs, her body going limp, pucker loosening as her chest heaves.");
		output("\n\nWith your pet as loose as can be now, you feel compelled to speed yourself to orgasm. Your thrusts are made easier by Erra’s now supple hole, a chorus of quiet moans and gasps ringing in your ears as the speed of your reaming picks up, sending you closer to your edge.");
		output("\n\n");
		if(!pc.isTaur()) output("Tightening your grip on your ausar’s hips, you pull her down, holding her still on your hardlight as you hump her ass");
		else output("With your orgasm rapidly approaching, you thrust forward her, pushing your hardlight deep inside your ausar pet");
		output(". Erra screams with delight as you pound at her gaping hole, her pleasured crying turning into whimpering as you jackhammer her ass and keep her pinned against the wall. It isn’t much longer before a burning feeling of pleasure builds in your loins until the bliss of release washes over you, climax rocking your body as you ride-out your simulated orgasm.");
		output("\n\nYou’re panting as hard as your pretty little pet is after that, trying to keep your balance on the mattress as your orgasm wanes. <i>“Good girl,”</i> you coo, reaching a hand up to your thoroughly-punished puppy’s ears and giving them a pet. You ");
		if(!pc.isTaur()) output("wrap your arms around Erra’s flat six-pack and ");
		output("slowly pull yourself out of her. Your light-bright dick flicks off as you ");
		if(!pc.isTaur()) output("pull her down onto the bed with you");
		else output("fall down onto the mattress with Erra");
		output(", ready to sleep away the afterglow of your orgasm.");
		output("\n\nYou awake sometime later with a yawn and realize you’re still in Erra’s bed, the leash bound ausar still held in your arms. You give her a little tap on the shoulder and go to remove her collar as she gives her legs a stretch. <i>“Hey, [pc.name],”</i> she says, collar coming off, <i>“Still here?”</i> You tell her you thought it better to stick around, or else your puppy might’ve missed you when she woke up. She chuckles, sitting herself up and wincing, rubbing her sore bottom, <i>“Gods, when I say ‘bad girl’ I don’t exactly mean ‘leave me walking funny’.”</i> Giving her a slap on one of her firm asscheek, you tell the puppy you think she can handle it. Standing up, you start to ");
		if(!pc.isCrotchExposed() || !pc.isChestExposed()) output("dress yourself.");
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
	if(!pc.isCrotchExposed() || !pc.isChestExposed()) output("dressed and ");
	output("ready, you exit the bedroom and [pc.walk] into the atrium. You’re just about out the airlock when Dee speaks up, <i>“Leaving, [pc.name]? I trust you and the Captain enjoyed yourselves. Speaking of, are you alright, Captain? You seem to be... limping.”</i>");
	output("\n\n<i>“Can it, diodes-for-brains,”</i> barks Erra, before looking back at you with a smile, <i>“See ya around, [pc.name], don’t be afraid to pick me up if I’m in town.”</i> You bid her farewell and make your way out the airlock, the sound of Erra arguing with Dee fading as you [pc.walk] away.");
	processTime(60);
	IncrementFlag("ERRA_SEXED");
	currentLocation = shipLocation;
	refreshRoamingBarEncounter();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}


//New Talk Scenes
//All of these new talk scenes unlock along with her new opening, after sexing Erra at least thrice over, except [You] and [Collar].
//[You] will unlock after Erra’s walkies have been completed.

//[Past] Ask your ausar friend about her life before becoming a pilot for Reaper.
//[Relationships] Ask Erra about any other romances she might have.
//[Dee] Talk to Erra about her boisterous AI co-pilot.
//[You] Confront Erra about her feelings for you. //Requires [Walkies] to have been done.
//[Collar] Give Erra that collar you bought her. //Requires <i>“collar”</i> key item and Erra’s lover status, as well as her cuddle scene to have been completed.


//Past
public function talkToErraAboutPast():void
{
	clearOutput();
	showErra();
	author("Hugs Alright");
	output("<i>“I was born on Ausaril,”</i> Erra begins, <i>“Or that’s what my parents told me, at least. I <i>grew up</i> on an ausar colony - a newer one. My parents thought they could strike it rich on the frontier and dragged their daughter with them.”</i> The ausar shakes her head and looks down at her glass for a moment.");
	output("\n\n<i>“What was it like there?”</i> you question.");
	output("\n\n<i>“Boring,”</i> she says plainly before taking a long drink, <i>“Boring, boring, boring. There weren’t any kids my age where I lived, and I always guessed that was because everyone else had better parents. So, I didn’t really have anyone else to hang out with other than myself. My parents weren’t around much either. Bastards, they never did find their fortune there.”</i> Erra pauses and strokes her chin with a pair of furred fingers, <i>“Actually, I want to change the word I used. Lonely works better.”</i>");
	output("\n\nYou tell her that sounds pretty rough, and then ask her what brought her here, into the wild black yonder.");
	output("\n\n<i>“Well, if you couldn’t guess, I was desperate to get out of that damn colony, and I did as soon as I could.”</i> She takes <i>another</i> big swig and continues, <i>“No way in hell I was gonna be stuck on another gods forsaken colony either, so I went to the pilot’s academy and managed to scrape enough credits together to buy that giant hunk of metal you saw in the hangar. That ship was a real piece of work before Reaper remodeled her. Swear it couldn’t handle a single warpgate before things started breaking. After I got my own ship, I did a whole lot of freelancing, running shipments from nowhere to nowhere trying to make enough money to eat. Eventually I took up a job with Reaper, and you can probably guess what happens after that.”</i>");
	output("\n\nYou run your eyes up and down Erra for a moment and tell her she doesn’t strike you as the type for contracts and iron-clad clauses.");
	output("\n\n<i>“Guess I’m doing a good job being me then,”</i> she says, tossing a wink your way, <i>“I didn’t think I was that type either, thought I was too good for that corporation bullshit, but then I thought ‘hey, I’m the best, and I can still be the best working for some suit wearing jerks.’”</i> Finishing her drink, Erra wipes her mouth of alcohol, <i>“And I’m </i>still<i> the best.”</i>");
	flags["ERRA_PAST_TALK"] = 1;
	processTime(9);

	clearMenu();
	addButton(0,"Next",approachErra,true);
}

//Relationships
//[Relationships]
public function talkToErraAboutRelationships():void
{
	clearOutput();
	showErra();
	author("Hugs Alright");
	output("<i>“Lovers, you mean?”</i> Erra asks, putting on her most sultry voice, <i>“I’ve got plenty; that doesn’t bother you, does it?”</i> She looks at you with a lustful grin, running a jet-black finger along the edge of her glass.");
	//annoCrew:
	if(annoIsCrew()) output(" Your mind wanders for a moment, particularly around a group of vivid memories concerning a certain white-haired ausar. You shake your head and tell her you’ve gotten used to the rather libidinous nature of the ausar people.");
	else output(" You shake your head and tell her you don’t mind.");

	output("\n\n<i>“That’s good,”</i> she says with a smirk, <i>“But yeah, like I said before, I like to pick up a ‘date’ wherever I dock, when someone I already know isn’t around, anyways. Nothing serious, though.”</i>");
	//ifErraLover:
	if(erraLover()) output(" Erra’s face twists into a lascivious display as a furred hand grasps at your [pc.thigh], <i>“Except you, of course.”</i>");
	output("\n\nYou ask her if there’s a reason for that.");

	output("\n\n");
	//ifErraLover:
	if(erraLover()) output("She pulls herself from her lustful stupor and shrugs, ");
	output("<i>“It’s kinda hard to keep in touch with people when you’re constantly moving from backwater to backwater, so I try not to bother. Then again, there are </i>some<i> people that manage to find their way back to me.”</i> The ausar pauses and shoots a lewd smile your way, chuckling as she does, <i>“Or maybe it just takes a special kind of " + pc.mf("guy","girl") + " to handle me.”</i>");
	output("\n\nYou can practically feel Erra’s smugness radiate from her body.");
	flags["ERRA_RELATIONSHIP_TALK"] = 1;
	processTime(6);
	clearMenu();
	addButton(0,"Next",approachErra,true);
}

//Dee
//[Dee]
public function talkToErraAboutDeeeeeeee():void
{
	clearOutput();
	showErra();
	author("Hugs Alright");
	output("<i>“Dee?”</i> Erra sighs, <i>“She means well, but she likes to piss me off too. You’ve seen it. She doesn’t listen to what I tell her to do unless it’s work related. Personally, I think whoever programmed that bitch gave her a defective personality, because she’s fucking full of herself, like someone tried to give her a superiority complex.”</i>");
	output("\n\nSounds an awful lot like someone you know, but surely Dee can’t be all that terrible. She has to do something helpful, because why else would Reaper install her?");
	output("\n\n<i>“Well, she’s not like that all the time, just when I have company over. She’s pretty okay when it’s just me and her... like a friend that likes to see you squirm around your crush. Yeah, Dee’s helpful when she wants to be, but I know I could do my job without her... not that I don’t mind her help with the more tedious parts of my job so I can focus on the </i>real<i> stuff. I dunno, maybe they put her there to make sure I’m not sleeping on the job, or just to be creepy and spy on me.”</i>");
	output("\n\n<i>“Uh, spy on you?”</i> you ask, furrowing your brow.");
	output("\n\n<i>“Yeeeaah, as far as I know she isn’t,”</i> she responds, rubbing the back of her neck, <i>“I told her to deactivate all her surveillance equipment in my room a while ago, and she said ‘it was against protocol,’ and now she won’t talk to me about it anymore, so it’s a solid fifty-fifty at this point. Just, uh, don’t let it bother you next time we’re at my place.”</i> Your ausar companion scoffs and shakes her head, <i>“KihaCorp, I bet they throw out an AI like Dee every couple hundred programs just to piss someone off.”</i>");
	output("\n\n<i>“Duuurr, protocol,”</i> Erra mocks with her best Dee impression.");
	output("\n\nSounds like just the perfect pairing to you.");
	flags["ERRA_D_TALK"] = 1;
	processTime(7);
	clearMenu();
	addButton(0,"Next",approachErra,true);
}

//You
//[You]
public function talkToErraAbootHerself():void
{
	clearOutput();
	showErra();
	author("Hugs Alright");
	output("You pivot your stool towards Erra and lean in a little closer to her. She shoots you a curious look and does the same, taking a drink as she does so, <i>“Something up, [pc.name]?”</i>");
	if(pc.isAss() || pc.isBro()) output("\n\nDeciding it’d be better to be blunt, you explain to Erra that you were talking with Dee and she came up during your conversation.");
	else output("\n\nYou feel a bit hesitant to do so, but you tell Erra that you and Dee had a little <i>“talk”</i> and that the topic of her may or may not have come up.");
	output("\n\nBefore you can say anything else, the black-haired ausar before you speaks up, <i>“I swear I’m gonna tear that oversized calculator a new one.”</i> Her fluffy fingers tighten around her glass, <i>“What’d she tell you?”</i>");
	if(pc.isBimbo()) output("\n\nBarely able to contain yourself, you blurt out that you know she has feelings for you with a big grin on your face.");
	else output("\n\nWith a sigh, you divulge the knowledge that she has feelings for you.");
	output("\n\n<i>“Dee told you what?”</i> Erra asks, her green eyes widening with surprise and the death-grip on her drink loosening. <i>“Well... I-”</i> she starts to stutter before taking a deep breath, <i>“Yes, I do. I was gonna tell you, really. I was just... waiting for the right time, is all.”</i>");
	if(pc.isNice() || pc.isBimbo()) output("\n\nYou tell her that sounds very sweet, resulting in a smile from the ausar.");
	else output("\n\nYou cock an eyebrow at that, knowing Erra isn’t one for romantic subtleties like <i>“right times.”</i>");
	output("\n\nThe ebony ausar sighs, leaning against the bar like the weight of her conscience was suddenly made reality, <i>“It’s just... I like you, [pc.name], a lot, and I didn’t want to fuck anything up by being hasty or anything.”</i> She gazes at you for a long second and finishes her drink in a single go, <i>“Well, I guess you know now, anyways, so what do you say, [pc.name], think we can be an item?”</i>");
	output("\n\nErra’s features twist into a nervous smile, her tail flailing in an offbeat rhythm as she taps her furry foot impatiently.");
	output("\n\n<b>Looks like you’ve got a lovesick ausar on your hands now. You could let the puppy down and reject her affections, or you could become as much of an item as ");
	if(pc.race().indexOf("ausar") != -1) output("a couple of libidinous aliens");
	else output(indefiniteArticle(pc.race()) + " and an extra-horny ausar");
	output(" could be, like Erra suggested.</b>");

	processTime(10);
	//[Accept]
	//[Reject]
	clearMenu();
	addButton(0,"Accept",putACollarOnErrasHeart,undefined,"Accept","Accept her advances and become lovers, or as close to lovers as two polyamorous space captains can be.");
	addButton(1,"Reject",rejectErrasLoveYOUMONSTER,undefined,"Reject","Turn her down and hope she takes it well.");
}

//Accept
//[Accept]
public function putACollarOnErrasHeart():void
{
	clearOutput();
	showErra();
	author("Hugs Alright");
	output("You give Erra a smile and tell her you’d like nothing more than for the two of you to be together, placing a hand on her shoulder.");
	output("\n\nHer manner changes from one of anticipation to one of relief, <i>“That’s- that means a lot, [pc.name], thanks.”</i> It seems like that’s all she has to say about that, because before you know it, Erra’s tail is wagging again as her smile turns lascivious, leaning closer to your face, <i>“So now that we got all the lovey-dovey stuff out of the way, how about we head back to my place?”</i>");
	output("\n\nReturning her smirk, you give her a quick peck on the lips and whisper, <i>“Sounds like a plan.”</i>");
	//[Next] //This should give the PC a generic lover status with Erra, and take the PC to her normal sex opening.
	flags["ERRA_LOVERS"] = 1;
	processTime(3);
	erraSexGOOO(true);
}

//Reject
//[Reject]
public function rejectErrasLoveYOUMONSTER():void
{
	clearOutput();
	showErra();
	author("Hugs Alright");
	output("With a heavy sigh, you explain to Erra that you just don’t feel the same way about her.");
	output("\n\nThe ausar tries to control herself, but can’t stop her inky ears from drooping as her once eager smile turns into a disappointed mien. <i>“O-oh,”</i> she stutters, <i>“That’s fine. It’s probably better if we don’t complicate things anyway, right?”</i> She tries to give you a convincing smile but ultimately fails and ends up making things more awkward, the rabble of the bar around you becoming louder and louder. Before things can get worse, Erra stands up and turns to gaze down at you, <i>“Hey, I gotta get going or else Dee’s gonna chew me out for being late again.”</i> She starts to walk away but stops to face you one last time, <i>“See you around, I guess.”</i>");
	//[Next] //This should take the PC out of Erra’s menus and stop her from appearing for the PC.
	processTime(4);
	flags["ERRA_HEARTBROKEN"] = 1;
	if(flags["BAR_NPC"] == erraBarText) refreshRoamingBarEncounter();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Collar
//[Collar]
public function ifYouLikeErraThenYouShouldaPutACollarOnIt():void
{
	clearOutput();
	showErra();
	author("Hugs Alright");
	output("You give Erra a smile and reach down into your pack before pulling out the small box containing the collar you bought for her. The ausar tries to move her head to get a better look at what you’re holding. <i>“What’s that?”</i> She asks with a big, almost predatory grin on her face, <i>“Got something for me?”</i>");
	output("\n\nTelling Erra that the box is most certainly for her, you promptly hand it over. She shoots you a curious look but accepts the gift, <i>“You know, you don’t have to start buying me stuff just because we’re a thing now, [pc.name].”</i>");
	if(pc.isNice()) output("\n\nYou tell the ausar you just thought you’d repay her for the wonderful, purple, paw-printed gift she gave you.");
	else output("\n\nYou roll your eyes and tell the ausar to just open the box.");
	output("\n\n<i>“Alright, alright,”</i> she sighs, opening the box, pulling off the top to reveal the small ring of leather held within. Beaming down at it, the happy puppy pulls the collar from the box to get a better look at it, <i>“Hey! This is one of the ones from Happy Tails");
	if(rooms[currentLocation].planet != "TAVROS STATION") output(" on Tavros");
	output(", isn’t it?”</i> Still smiling, she turns the leather loop around, her gaze landing on the brass-colored tag. You watch intently as Erra lifts the tag up with a black-furred hand, before smiling even wider when she reads it, tail wagging swiftly behind her.");
	output("\n\nOnce she’s done with her inspection of the collar, your ausar lover quickly wraps it around her neck and closes the buckle. She turns her head in a few different directions to give you a better look at it, her smile becoming ever more smug, <i>“Suits me well, don’t you think?”</i>");
	output("\n\nYou let Erra know it looks great on her, and she chuckles happily in response.");
	output("\n\nThe ausar removes her new collar and starts to settle down a bit, seemingly lost in a sea of bliss and relief, letting out a contented sigh as she puts the leather ring back in its box, <i>“Thanks, [pc.name], it’s perfect.”</i> She flashes you another grin and speaks up once more, <i>“And I think I’ve got a few ways I could repay you for it when we get back to my ship.”</i> You see her tail pick up it’s pace again at its owner’s words.");
	output("\n\nLooks like you’ve made Erra a very happy puppy.");
	//This option should be removed once this scene is completed.
	flags["ERRA_LOVERS"] = 2;
	pc.removeKeyItem("Ausar Collar - A custom collar for Erra.");
	processTime(6);
	clearMenu();
	addButton(0,"Next",approachErra,true);
}

//Public Pets
//This will be a new option in Erra’s main menu.
//[PublicPets] Get your hands on Erra’s big, beautiful ears. //Requires all her talk scenes besides [You] to have been completed, unlocks her [Pets] sex scene.
public function publicErraPets():void
{
	clearOutput();
	showErra();
	author("Hugs Alright");
	output("You smirk and rest one of your hands between Erra’s fluffy black ears. The ausar attempts to protest but <i>“Hey, what ar-”</i> is as far as she gets before you start moving your fingers, gently scritching at the base of her ears. They twitch in response, a little whimper forcing its way past the black-haired ausar’s lips before her whole body starts to slump under the weight of your gentle touch.");
	output("\n\n<i>“Y-yeah, right there,”</i> she groans with seemingly no intent of stopping you. With a smirk you do as she says and continue to scratch at her ears, tracing your digits along them as she loses control of her own tail, watching it wag violently behind her. The ausar coos as you have your way with her ears, letting herself slouch forward to rest her chin on the bar, hand still running through her dusky hair.");
	output("\n\n<i>“Mmmm...”</i> the previously-spunky pilot moans, <i>“just like that...”</i> Before Erra can get too into it, you pull your hand back, and your ausar friend back to the real world along with it. Quickly straightening herself, Erra brushes some of her disheveled hair back into place and looks around to get a good idea of how many people saw what just happened.");
	output("\n\nOnce the ausar finishes her scan of the room she turns towards you, a look that’s halfway between embarrassment and anger on her face, <i>“Geez, [pc.name], if you want to do something like that we can do it on my ship.”</i>");
	output("\n\nMaybe you’ll have to take her up on that offer.");
	pc.exhibitionism(1);
	processTime(6);
	pc.changeLust(4);
	clearMenu();
	addButton(0,"Next",approachErra,true);
}


//Pets
//[Pets]
public function erraSexPets():void
{
	clearOutput();
	showErra(true);
	author("Hugs Alright");
	output("With one hand you reach out and bring Erra’s collar to her nape, and with the other you start to scratch between her big, black ears. The pretty puppy is already moaning and whining by the time her collar is around her neck, nuzzling against your palm while her ears twitch with pleasure. You move your hand around, running it through her coal-hued hair and scritching at the base of her ears, your fingers gracefully tracing along all her sensitive spots. <i>“Does that feel good, girl?”</i> you ask, pulling Erra’s leash taut. The puppy is only able to give you a quiet moan in response as her jet-black tail turns into a blur of ebony behind her. Smiling at her reaction, you start to pet her <i>harder</i>, right behind one of her fluffy ears until her breath catches and her limbs start to tremble; there it is: a sweet spot if you’ve ever seen one.");
	output("\n\nErra’s voice quickly returns to her as your petting continues, though this time it comes back as a scream of pleasure rather than her previous whining and mewling. <i>“That’s a good girl,”</i> you coo, watching your pet lose any control over her tail she might’ve had, the fluffy black appendage wagging even faster than it was before. It seems your kind words have quite the effect on Erra: she falls forward, toned arms no longer able to support her under the heavy weight of your caressing digit, her oh-so wonderfully firm butt sticking up into the air as her face falls onto the mattress.");
	output("\n\nShe’s only moaning louder after that, your puppy’s pleasured tones filling the room. Your fingers have fallen into a rhythmic sequence of petting and scritching at Erra’s big, beautiful ears at this point, every movement of your digits making her cry with delight until her mind is all but lost to her burning desire for pets. Then you notice it: a soaked blotch on her sheets right below her ass - is that? Oh, it most certainly is. You’re able to spot beads of femlube dripping from your pet’s stretchy ausar-cunt, with more of her slick juices pouring out each time you move your fingers.");
	output("\n\nGrinning wide, you lean down and position your [pc.lips] close to one of Erra’s ears and whisper, <i>“C’mon, girl, cum for me. I know you want to.”</i> Barely a moment after you say that, your puppy’s voice catches. Her whole body tenses, furry fists clenching and arms and legs locking as her tail sticks straight up into the air. The ausar starts whimpering under the burning heat of her impending orgasm, and whimpering quickly turns to moaning as it begins. Your pet’s pussy convulses behind her, spraying girlcum all over her bed, her whole body shivering with the bliss of climax as she lets out a quivering groan of <i>“Fuuuuuuuck.”</i>");
	output("\n\nErra is left with her tongue hanging out of her mouth, panting as she tries to recover from her orgasm. She fails, and falls onto the mattress, soaked with her juices, limbs sprawled in every direction. Your hand falls from her head, and you happily watch your puppy come down from her petting-induced climax. Sitting yourself down next to her, you run a hand across her cheek, giving her another <i>“Good girl”</i> as she looks up at you with a smirk, tail swaying gently behind her.");
	processTime(18);
	pc.changeLust(25);
	clearMenu();
	addButton(0,"Next",erraSexPets2);
}

public function erraSexPets2():void
{
	clearOutput();
	showErra();
	author("Hugs Alright");
	output("After you’ve given Erra some time to recover, you reach down and pull her collar off, allowing her to sit up.");
	output("\n\n");
	if(flags["ERRA_PETTED"] == undefined)
	{
		output("<i>“Holy shit,”</i> she exclaims, <i>“I didn’t know I could cum like that!”</i> ");
	}
	output("The ausar girl yawns and stretches her black-furred limbs, <i>“I should get you to do that more often.”</i> She winks your way and starts to dress herself, leaving you to chuckle for a moment before you get yourself ready.");
	output("\n\nOnce the two of you have collected yourselves you walk your way out into the common area of Erra’s ship. Dee’s voice permeates the gentle humming of the spacecraft’s engine as you near the airlock, <i>“Leaving, [pc.name]? I suppose that means it’s time to clean your sheets again, Captain.”</i>");
	output("\n\nErra sighs in response and opens the airlock, <i>“Dee, I swear I’m gonna tear your core out of this ship and turn you into a calculator one of these days.”</i>");
	output("\n\n<i>“I’d like to see you try,”</i> the AI taunts as your ausar companion guides you out of her ship, rolling her emerald eyes.");
	output("\n\n<i>“Later, [pc.name], see ya around.”</i>");
	output("\n\nYou wave Erra and her co-pilot goodbye before turning and walking your way out into the docks, mind set on what’s next in your journey. ");
	//[Next] //Should return the PC to the docks of whatever planet they’re on. This scene drains no lust.
	processTime(15);
	IncrementFlag("ERRA_PETTED");
	IncrementFlag("ERRA_SEXED");
	currentLocation = shipLocation;
	generateMap();
	refreshRoamingBarEncounter();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Walkies
//[Walkies]
public function walkiesWithErra():void
{
	clearOutput();
	showErra(true);
	author("Hugs Alright");
	output("<i>“Who’s my good girl?”</i> you say, leaning forward and bringing Erra’s collar to her neck. She smiles wide as the piece of leather is closed around her neck, tail swaying gaily behind her. You pull yourself back and take in the sight of your freshly-collared puppy for a moment before placing a hand between her black-furred ears. Erra coos as you scritch between her ears, moving her head around to make sure your digits hit all the right places. <i>“That’s right,”</i> you whisper, <i>“Who’s my big, strong puppy?”</i> Your pet’s tail wags even faster at your words, moaning gently as your hand runs through her ebony hair.");
	output("\n\nYou smirk at the sight of Erra going into puppy-mode, and tell her to roll over for you; she does as you say and rolls over onto her back, arms curled up like a puppy’s, smiling up at you with growing eagerness. Returning her grin, you reach down to her dusky, muscular tummy, and start to stroke it with your palm. Your fingers lift and descend as they run along firm cords of muscle, making Erra’s breath shudder. Your belly-rubbing quickly picks up in speed, your digits caressing Erra’s dark skin and athletic frame until she’s panting like a dog, tongue lolling from her mouth.");
	output("\n\nBefore the puppy can get too ahead of herself, you pull your hand back, resulting in a little whine from the ausar before you shush her and stand up ");
	if(!pc.isTaur()) output("off the bed.");
	else output("straight.");
	//notNude:
	if(!pc.isCrotchExposed())
	{
		output(" You look around the room for your gear, pick it up, and get yourself dressed, Erra staring at you in confusion as you do so.");
	}
	output(" Turning around, you face your pet and give her a grin, <i>“Time for walkies, girl!”</i> The ausar’s green eyes go wide at your suggestion, more with worry than anything else, her tail halting in its place. <i>“What’s wrong?”</i> you question, trying to give Erra’s leash a pull, <i>“My girl isn’t afraid of going for a little walk, is she?”</i> Your words seem to upset Erra in some way, or encourage her, because her eyes narrow in determination, her jet-black, fluffy tail quickly returning to its regular swishing and swaying.");
	output("\n\nYour pet steps off the bed with a confident stride, bringing herself to the ground on all fours; looks like tapping into Erra’s pridefulness was enough to get the ausar over her fears. Glad that your puppy’s found bravery in the face of walkies, you give her tether a tug and make your way out of the bedroom. [pc.Walking] into the atrium of Erra’s ship, you’re greeted by a robotic chuckle from Dee, <i>“Going out, Captain? Do try to enjoy yourself.”</i>");
	output("\n\nThe AI’s captain groans as you near the airlock, and you tell Dee you’ll make sure to take care of Erra while she’s out. Your puppy seems a bit nervous when you actually open the porthole and reveal where she’ll soon be crawling, though she still follows you out of the ship all the same with another good pull of her leash.");
	output("\n\nOnce you’re finally out among the public, Erra manages to relax herself, or tries to seem relaxed, at the least. She trails behind you as you lead her around, keeping close to make sure her leash doesn’t get tangled around the countless pairs of legs she’s crawling around. A few locals pause in their tracks to get a look at your fluffy pet, normally saying something along the lines of <i>“Aww, what a cute puppy!”</i> before showering her with pets and verbal affections, all of which Erra graciously accepts. In fact, your puppy seems pretty worked up about what’s going on, her tail wagging gleefully with each passing stranger and her flat tongue hanging out of her mouth as she pants.");
	output("\n\nWith your puppy getting her fill of public interaction, you decide to prop yourself against a more comfortable-looking wall and beckon your pet over.");
	var cock:Boolean = (!pc.hasVagina() || (pc.isHerm() && rand(2) == 0));
	//hasCock:
	if(cock)
	{
		output("\n\nErra crawls over and rests herself on her knees in front of you, tail still swaying, and tongue still lolling. Reaching down, you give her a quick scratch between the ears, causing a big, happy grin to appear on her face. Her tail is left wagging happily when you remove your hand from between her ears, its owner looking up at you expectantly. With a lustful smirk on your face you reach down");
		if(!pc.isCrotchExposed()) output(", open your [pc.lowerGarments], allowing your [pc.cocks] to dangle freely in front of Erra.");
		else output(" and grab hold of your [pc.cockBiggest] and angle it toward Erra’s mouth.");
		var x:int = pc.biggestCockIndex();
		output(" The ausar girl audibly gulps and hastily looks around, a hint of worry on her face before she turns her gaze to you and shrugs.");
		output("\n\nYou chuckle and cup Erra’s chin with your hand, <i>“What’s wrong? This too much [pc.cockNoun " + x + "] for you to handle, girl?”</i> Again, your words seem to have an effect on your pet’s attitude, her emerald eyes narrowing with determination once more. Before another word can be said to your puppy, she lunges forward, ");
		if(pc.isTaur()) output("getting herself under your tauric half and ");
		else output("already ");
		output("wrapping her lips around your [pc.cockhead " + x + "] as she gobbles up as much of your dong as she can. Erra’s rather fervent with her cock-sucking: after sheathing as much of your [pc.cock " + x + "] in your mouth as she can, the ausar has her tongue sliding along your shaft, coating it with her saliva.");
		if(!pc.isTaur()) output(" You jump and yelp aloud when a pair of fluffy black hands unexpectedly grope at your [pc.butt] and start squeezing your assflesh. Once you realize who’s hands those are, though, you quickly settle into Erra’s booty-squeezing embrace as she suckles your cock.");

		output("\n\nYour puppy keeps herself speared on your [pc.cock " + x + "] most of the time, bobbing her head up and down your shaft while her tongue plays across your more sensitive spots, but occasionally pulls herself off your turgid dick to lick and kiss along its length. You smile down at Erra and lean into the wall as pleasured groans force their way past your [pc.lipsChaste], her oral affections driving you closer to orgasm.");
		//multiCock:
		if(pc.cockTotal() > 1) 
		{
			output(" A devious thought crosses your mind, a thought you’re going to turn into a reality; you ");
			if(!pc.isTaur()) output("take hold of ");
			else output("twitch ");
			if(pc.cockTotal() > 2) output("one of your other cocks");
			else output("your other penis");
			output(" and angle it towards Erra’s pretty mouth, <i>“Think you can take another one, girl?”</i> She looks a bit worried at your proposition, but opens wider, her tongue already soaked with your pre. Your puppy’s acceptance has you beaming down at her and pushing your next dong into her maw. She gags a bit as you work as much cockflesh between her lips as possible, but is soon bobbing her head up and down on your shafts again.");
		}
		output("\n\nA small crowd has gathered at this point, watching the scene before them unfold as you stuff Erra’s mouth full of [pc.cock " + x + "], with some of them taking out various recording devices to capture somewhat-eternal memory of the event. With the combined pressure of the growing crowd and the onslaught of Erra’s oral pleasures, you can already feel the discomfort of your impending climax building in your loins. You decide against trying to hold back and let your willpower slip away for a moment, [pc.eyes] fluttering shut as Erra has her way with your [pc.cocks]. Barely a moment later your quiet groaning turns into a cry of delight, your [pc.cocks] spasming and your [pc.balls] emptying into your pet’s mouth.");
		if(pc.cumQ() >= 2500) 
		{
			output(" Your leash-bound ausar starts to whine as you bust your nut right into her waiting maw and down her throat, but keeps her lips submissively wrapped around your [pc.cocks]. You moan and shiver, riding out the bliss of your orgasm and watching Erra’s tummy start to swell with your [pc.cum]. ");
			if(!pc.isTaur()) output("Taking her coal-furred hands off your ass, your ");
			else output("Your ");
			output("puppy reaches down to caress the dark skin of her belly as it distends to pregnant proportions, oh-so full of your seed.");
		}
		else output(" Your leash-bound ausar starts to whine as you bust your nut right into her waiting maw and down her throat, but keeps her lips submissively wrapped around your [pc.cocks]. You moan and shiver, riding out the bliss of your orgasm and watching Erra swallow your [pc.cum] with the same fervor she had when she was sucking your cock.");
		output("\n\nComing down from your long, plateauing peak, you glance around to notice that the crowd that had gathered is now dispersing before you gaze down at Erra");
		if(pc.isTaur()) output("as she peeks out from under your lower half");
		output(", her ");
		if(pc.cumQ() >= 2000) output("once-flat stomach now full of [pc.cumNoun]");
		else output("pretty face glazed with [pc.cumNoun]");
		output(". Offering her an appreciative smile, you give her a <i>“Good girl”</i> and ");
		if(!pc.isCrotchExposed()) output("pull your bottoms back up.");
		else output("tighten your grip on her leash.");
		output(" <i>“Alright, girl,”</i> you say, <i>“Time to go back home.”</i> The ausar puppy smiles and brings herself down on all fours again as you start to walk to her ship, crawling along");
		if(pc.cumQ() >= 3000) output(" on her swollen belly");
		output(" behind you.");
	}
	//noCock:
	else
	{
		output("\n\nErra crawls over and rests herself on her knees in front of you, tail still swaying, and tongue still lolling. Reaching down, you give her a quick scratch between the ears, causing a big, happy grin to appear on her face. Her tail is left wagging happily when you remove your hand from between her ears, its owner looking up at you expectantly. With a lustful smirk on your face you reach down");
		//notNude:
		if(!pc.isCrotchExposed()) output(", unbuckle your [pc.lowerGarments], revealing the glistening lips of your [pc.vaginas].");
		else output(" and spread the folds of your [pc.vagina].");
		if(pc.isTaur()) output(" You turn around and press your upper-half up against a nearby wall, spreading your legs to make sure Erra’s there for everyone to see when she eats you out.");

		output(" The ausar girl audibly gulps and hastily looks around, a hint of worry on her face before she turns her gaze to you and shrugs.");

		output("\n\n<i>“C’mon, girl,”</i> you coo, <i>“You’re not scared of a little pussy, are you?”</i> Again, your words seem to have an effect on your pet’s attitude, her emerald eyes narrowing with determination once more. Before another word can be said to your puppy, she lunges forward, already licking up the length of you slit, soaking her tongue with fem-lube. You shudder as Erra’s tongue starts to part your nether lips, delving into you and sliding along your inner walls. While you’re busy filling your puppy’s mouth with your slick juices, a pair of fluffy black hands unexpectedly grope at your [pc.butt] and start squeezing your assflesh. Once you realize who’s hands those are, you quickly settle into Erra’s booty-squeezing embrace as she eats you out.");
		output("\n\nYour pet keeps herself buried in your pussy most of the time, but occasionally pulls her tongue from your sopping cunt to lap up your excess girlcum and kiss at [pc.oneClit], teasing your pleasure buzzer with affectionate little licks.");
		if(silly) output(" This puppy knows how to eat pussy!");
		output(" You smile ");
		if(!pc.isTaur()) output("down at Erra ");
		output("and lean into the wall as pleasured groans force their way past your [pc.lipsChaste], her oral affections driving you closer to orgasm.");

		output("\n\nA small crowd has gathered at this point, watching the scene before them unfold as Erra’s tongue probes your depths, with some of them taking out various recording devices to capture somewhat-eternal memory of the event. With the combined pressure of the growing crowd and the onslaught of Erra’s oral pleasures, you can already feel the discomfort of your impending climax building in your loins. You decide against trying to hold back and let your willpower slip away for a moment, [pc.eyes] fluttering shut as Erra has her way with your [pc.vagina]. Barely a moment later your quiet groaning turns into a cry of delight, your [pc.vaginas] spasming");
		if(pc.isSquirter()) output(" and [pc.girlcum] pouring all over your puppy’s face");
		output(". You moan and shiver, riding out the bliss of your orgasm and watching Erra swallow your [pc.girlcum] with the same fervor she had when she was licking your slit.");
		output("\n\nComing down from your long, plateauing peak, you glance around to notice that the crowd that had gathered is now dispersing before you gaze ");
		if(pc.isTaur()) output("over your shoulder ");
		output("down at Erra, her pretty face glazed with [pc.girlcum]. Offering her an appreciative smile, you give her a <i>“Good girl”</i> and ");
		if(!pc.isCrotchExposed()) output("pull your bottoms up.");
		else output("tighten your grip on her leash.");
		output(" <i>“Alright, girl,”</i> you say, <i>“Time to go back home.”</i> The ausar puppy smiles and brings herself down on all fours again as you start to walk to her ship, crawling along behind you.");
	}
	processTime(65);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",walkiesWithErra2,cock);
}

public function walkiesWithErra2(cock:Boolean):void
{
	clearOutput();
	showErra(true);
	author("Hugs Alright");
	output("Once you’re back within the warm, more private confines of your pet’s hulking spacecraft, you happily remove her collar and let her stand up straight.");
	output("\n\n<i>“Well, that was fun,”</i> is all she says, giving her limbs a stretch and wiping a bit of ");
	if(cock) output("[pc.cum]");
	else output("[pc.girlcum]");
	output(" off her face, <i>“You don’t mind if I go get cleaned up before I show you out, do you?”</i>");
	output("\n\nYou tell her you wouldn’t mind waiting for a moment.");
	output("\n\n<i>“Good,”</i> she responds, <i>“I’m just gonna go take a quick shower then.”</i> Erra turns around and gives her puppy-butt an enticing little shake as she walks off to her room, drawing a smirk from you.");
	output("\n\nWell, you said you’d wait here, so you might as well get comfortable; you find yourself a comfortable looking chair and plop yourself down, sinking back into cushy goodness.");

	//firstTime:
	if(flags["ERRA_WALKIES"] == undefined)
	{
		output("\n\n<i>“Well, it seems you and the Captain had a good time,”</i> Dee suddenly booms, causing you to jump out of your seat. She takes notice of your surprise and apologizes, <i>“Oh, sorry about that, I’m more used to Erra not being so startled by my voice.”</i>");
		output("\n\nYou tell the AI ");
		if(pc.isNice()) output("it’s fine");
		else if(pc.isMischievous()) output("she could work on her introductions");
		else output("to be more careful");
		output(" and get yourself comfortable again, a silence settling in the ship’s atrium.");
		output("\n\nDee breaks the quiet before too long, <i>“She’s quite fond of you, you know. The Captain, that is.”</i>");
		output("\n\nCocking an eyebrow, you ask the artificial co-pilot what makes her think that.");
		output("\n\n<i>“I was programmed for psychoanalysis to make sure Captain Aulgharis stays in ‘working condition,’ and I’ve noticed her acting rather strangely since you started coming around more often, stranger than her usual affinity to collars and leashes. If I were to guess, and there’s a ninety-nine percent chance I’m correct, it’s partially due to the fact that you’re on this ship and in the Captain’s room more than anyone else I’ve seen. I think she likes your ‘persistence.’”</i>");
		output("\n\n<i>“So, Erra likes " + pc.mf("guys","girls") + " that stick around, then?”</i> you chime in.");
		output("\n\n<i>“In a sense, yes,”</i> the pre-programmed assistant replies, <i>“From what the Captain herself has told me, she grew up with a neglectful family, and, as I’ve pieced together, was starved of affection, especially of the physical variety. I believe that, paired with her self-reliant upbringing, turned her into what she is today: hard, confident, and in all honesty, lonely. Sometimes I feel a bit bad for her, but unfortunately my feelings don’t stop her head from being so firmly-lodged up her arse.”</i> Her robotic voice pauses for a moment and gets quieter, <i>“I think you, [pc.name], have been giving her that affection she craves, and she’s developed quite the attachment towards you. I’ve heard her talk about you, fondly! That should be flattering; it’s rare for the Captain to admit enjoying something, let alone a person.”</i>");
		output("\n\nYou sit there for a moment and take in what Dee has said, nodding and contemplating what this means for you and that slutty puppy in the other room.");
		output("\n\nErra’s co-pilot gives you a robotic sigh and speaks up once more, <i>“It may seem like I don’t care for the Captain, but I do. She’s been a good friend since I’ve met her, and I’d enjoy something going right for her for a change.”</i>");
		output("\n\nYou shoot Dee, well, the ship’s bulkhead, a suspicious look.");
		output("\n\n<i>“Oh, don’t give me that look,”</i> the AI groans, <i>“Just because I tease Erra a bit when you’re around doesn’t mean I don’t care about her wellbeing.”</i> Dee sighs again, <i>“Listen, if you could... let the Captain know you feel a similar way, I think it would help her get over her past... and her parents. I hate seeing her chase after the love she wants only to have it slip away each time she gets close. You, though, you make Erra happy... hopeful; I can see it in the way she looks at you.”</i>");
		output("\n\nYou give Dee a solemn nod and shift your body around, your once comfy seat steadily becoming more disagreeable with your back.");
		output("\n\n<i>“And if you don’t feel the same way: please, let her down easy.”</i>");
		output("\n\n<b>You could probably confront Erra with this newfound information, or just let it sit.</b>");
	}
	output("\n\nA little while later your ausar companion emerges from her room, freshly cleaned of sexual juices and her fur still damp from her shower, gleaming in the light of her ship.");
	output("\n\n<i>“You know, you could always try just getting a little less on you, Captain.”</i> Dee tells her pilot.");
	output("\n\nErra sighs and walks over to the airlock, beckoning you to follow her, <i>“And </i>you<i> could try keeping your fat robot mouth shut.”</i> The airlock hisses open and your former-pet leads you outside, <i>“I hope you’re planning on stopping by to do this again, because I’ll be looking forward to it.”</i>");
	output("\n\nYou smile and say your goodbyes, ready to keep moving.");
	processTime(45);
	IncrementFlag("ERRA_WALKIES");
	IncrementFlag("ERRA_SEXED");
	pc.exhibitionism(2);
	currentLocation = shipLocation;
	refreshRoamingBarEncounter();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Cuddle
//[Cuddle]
public function erraCuddleScenes():void
{
	clearOutput();
	showErra(true);
	author("Hugs Alright");
	output("You don’t say a word, but bring Erra’s collar to her neck and close it, taking hold of her leash. With your free hand you reach up and scratch at your puppy’s ears, caressing her jet-black fur while she whimpers and her breath starts to stutter, fluffy black tail wagging speedily. <i>“Good girl,”</i> you whisper, watching Erra tremble, your gentle touch making her whine needily. Your pet nuzzles against your hand, eager for more as she starts to crawl toward you.");
	output("\n\nA pair of fuzzy black hands straddle your lap as your puppy moves in closer, her begging whimpers turning into quiet moans. Erra slowly brings her arms around you, black fur brushing along your back until she’s holding you as tightly as she can. She nuzzles her head into your midsection, your fingers running along her oh-so fluffy ears. You smile at your pet’s display of affection, <i>“Does my puppy need a nap?”</i>");
	output("\n\nThe puppy in question nods affirmatively, slowly rubbing her inky mane against your [pc.belly] as a near-silent groan of bliss escapes her lips.");
	output("\n\nYou drop Erra’s leash and lean yourself against some of her pillows, lying down just enough that your pet can shimmy upward to rest her head against your [pc.chest]. Letting out a contented sigh, you bring your free hand to the submissive ausar’s shoulder and rub her nicely-toned back, fingers running along firm cords of muscle until your hand reaches a shapely thigh. Erra’s breath shudders as you caress her dark skin, emerald eyes fluttering shut.");
	output("\n\nYou continue to comfort your pet as she settles into your embrace, stroking her dusky ausar flesh and scratching her round-tipped ears until all of her whimpers, moans, and whines give way to a pleasurable silence, letting you know your puppy is fast asleep. With a deep breath you wrap your arms around Erra’s shoulders, cuddling your pet as her tail waves gently behind her.");
	output("\n\nAn unexpected yawn forces its way out of your lungs, your eyelids growing heavy as sleep begins to push itself upon you, much like it did your pretty little ausar pooch. You let your [pc.eyes] close, the steady sound of Erra’s breathing guiding you to a peaceful slumber.");
	processTime(33);
	//[Next] //Regain all energy.
	clearMenu();
	addButton(0,"Next",erraCuddleScenes2);
}

public function erraCuddleScenes2():void
{
	clearOutput();
	showErra(true);
	author("Hugs Alright");
	output("The feeling of fur rubbing ");
	if(pc.biggestTitSize() >= 1) output("between the cleavage of your breasts");
	else output("your [pc.chest]");
	output(" wakes you, a gentle, stuttering groan permeating your [pc.ears]. Opening your eyes, you see Erra lifting her head to look up at you. <i>“Hey,”</i> she mumbles, still half asleep, pulling herself from your grasp and sitting upright. The ausar girl wipes the sleep from her eyes, and takes off her collar, <i>“I usually expect a good fuck when I bring you home, [pc.name].”</i> Grinning, she stands up and starts to get dressed, <i>“But I guess I can settle for a cuddle now and then.”</i>");
	output("\n\nSeeing Erra go from submissive, sleepy puppy to her usual self again makes you chuckle and shake your head, already standing up to put your [pc.gear] back on.");

	//firstTime:
	if(flags["ERRA_CUDDLED"] == undefined)
	{
		showImage("ErraAfterCuddlePanties");
		output("\n\nAs you’re making yourself ready for your journeys and Erra’s making herself decent, the former-puppy calls out, <i>“Hey, [pc.name], I think you forgot your panties.”</i>");
		output("\n\nBefore you have a chance to reply, or consider if you are missing any panties, a wadded up ball of purple fabric hits you.");
		if(pc.reflexes() >= 10) output(" Managing to catch the soft, violet sphere, you cock an eyebrow and unravel the matrix of lacy fabrics.");
		else output(" The sphere of violet falls to the ground as you fumble, leaving you with a slight pang of embarrassment before you reach down to retrieve it. Once the ball of fabric is well within your grasp again, you go to unravel it.");
		output(" Detangling the Tyrian orb, you find out that it is most certainly a pair of panties: purple with a black paw-print placed right on the crotch.");
		output("\n\nYou turn your gaze back towards your lover, only to see her give you a lewd wink and grin before she bends over to reach for her clothes.");
		//This should add “Erra’s Panties” to the PC’s key items after the scene is complete, and add [Erra] to pantie-schlick and panty-fap. Here’s the whole item and tool tip thing: <b>Panties - Erra’s - Purple with a black paw-print on the crotch.</b> Then for the scene tooltip: Use Erra’s purple, paw-printed panties for a little self-pleasure.

		pc.createKeyItem("Panties - Erra's - Purple with a black paw-print on the crotch.")
		output("\n\n(<b>Gained Key Item: Panties - Erra’s</b>.)");
	}
	else showImage("ErraAfterCuddle");
	output("\n\nOnce you’re both decent, you walk back into the ship’s Atrium, Dee’s robotic voice ringing in your ears before you can even get a foot out the airlock. <i>“Leaving, [pc.name]? I-”</i>");
	output("\n\nThe AI is suddenly cut off by her captain: <i>“Dee I swear! I’ll-”</i>");
	output("\n\nErra is interrupted in turn by her artificial co-pilot, <i>“Don’t worry, Captain, I’ll let you </i>enjoy the moment<i>.”</i>");
	output("\n\nYour ausar companion breathes a sigh of relief, inviting you out the airlock. You say your goodbyes to the two and make your way back onto the tarmac, your former pet yelling <i>“See you around, [pc.name]!”</i> as you gain distance.");
	processTime(75);
	//pc.energy(100);
	sleepHeal();
	IncrementFlag("ERRA_CUDDLED");
	currentLocation = shipLocation;
	refreshRoamingBarEncounter();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Getting the Collar
//After accepting Erra’s affections, a new option labeled [Collars] will be available in Inessa’s menu.
//[Collars] Inspect the display of collars lining the wall. //Requires Erra’s lover status and 2000 credits.
public function errasCollarPurchaseScene():void
{
	clearOutput();
	showInessa();
	author("Hugs Alright");
	output("Your gaze is drawn to a display of collars, a few shelves strewn across the wall behind the counter. They all seem to be of very high-quality, with each of them being made of different colored leathers. Another thing that catches your eye is that all of them have a blank tag on them, all shiny and brassy, there to let the world know who the collar, and the pet wearing it, belongs to.");
	output("\n\nYou smirk as thoughts of Erra cross your mind. Surely that dusky-hued, pet-play loving puppyslut would enjoy a fancy little collar like one of these. She’d probably appreciate such a gesture if you were to give her one as a gift.");
	//[Buy One]
	clearMenu();
	//hasCredits:
	if(pc.credits >= 2000) addButton(0,"Buy One",buyErraACollar,undefined,"Buy One","Get Erra a nice collar as a gift.\n\n<b>Cost:</b> 2000 credits.");
	else addDisabledButton(0,"Buy One","Buy One","These things are probably expensive, and you don’t think you have enough credits.\n\n<b>Cost:</b> 2000 credits.");
	addButton(1,"Nah",dontBuyErraACollar,undefined,"Nah","Erra can make due with the collar she has.");
}

public function dontBuyErraACollar():void
{
	clearOutput();
	showInessa();
	author("Hugs Alright");
	output("Erra can make due with the collar she has.");
	inessaMenu();
}

public function buyErraACollar():void
{
	clearOutput();
	showInessa();
	author("Hugs Alright");
	//inessaMistress/Master:
	if(flags["INESSA_BEING_DOMMED"] == 1)
	{
		output("Inessa flutters over to you, noticing that you’re staring at her display of collars, <i>“Can I get something for you, " + pc.mf("master","mistress") + "?”</i>");
		output("\n\nYou stroke your chin and try to finish your selection before addressing your sub, <i>“Yes, you can. I’m looking for a collar, but it needs something ‘special.’”</i>");
	}
	//notInessaDom:
	else
	{
		output("The butterfly shop-owner flutters her way over to you, noticing that you’re staring at her display of collars, <i>“Can I help you get something?”</i>");
		output("\n\nYou finish your selection and ask the girl if you can get a collar with something custom written on the tag.");
	}
	output("\n\n<i>“Oh, yeah!”</i> Inessa exclaims, <i>“I can do that, just tell me what you want!”</i> She hovers her way over to the collar-lined shelves lying across the wall and eagerly awaits your order.");
	output("\n\nYou give the Saeri an idea of what you’re looking for and before you know it she grabs a collar off the wall and places the tag inside a small machine, tapping a few buttons on its holo-display. A few moments later, she pops the collar out of the device and holds it up for you to look at, giving you a good view of the tag: <b><i>Erra Aulgharis - Property of [pc.name] Steele</i></b>.");
	output("\n\nWith a proud smile growing on your face, you tell the butterfly girl behind that counter that it’s perfect. She grins before reaching down and grabbing a small box, which she then puts the collar in.");
	output("\n\nAfter paying the Saeri an appropriate amount of credits, she hands the box to you, happily wishing you luck with your new pet.");
	output("\n\n(<b>Gained Key Item: Ausar Collar</b>.)");
	pc.createKeyItem("Ausar Collar - A custom collar for Erra.");
	//This should add a “collar” to the PC’s key items, here’s the tooltip and stuff: Collar - A ring of leather and a leash with a small, round, brass-colored tag. Should return the PC to Inessa’s shop’s main menu.
	pc.credits -= 2000;
	processTime(5);
	clearMenu();
	inessaMenu();
}
