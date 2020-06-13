import classes.Characters.ZilPack;
import classes.Creature;
import classes.Engine.Combat.DamageTypes.DamageResult;
import classes.Engine.Combat.DamageTypes.TypeCollection;
import classes.GameData.CombatManager;
//ZIL_PROBLEM_DEALT_WITH

/*Notes:
Short, silky-smooth fur.
Hair is a close-cropped and auburn (reddish-brown) mohawk.
Blue eyes
Big Ol’ Ears with very keen hearing.
Ears are sensitive, loves having them played with.
Shy about how good her ears feel.
DD-cup tits.
Pink, puffy, Inverted nipples.
Nipples pop out like lil’ turkey timers.
Pink pussy with a very tiny, almost unnoticeable clit.
Wetness is good enough for easy lubing but doesn’t squirt or anything.
The outer lips are nice, large, and puffy, while her inner labia are small enough that you can barely see them through Penny’s swollen mound.
Lithe and quick.
Five foot even in height.
About 115 lbs in weight.
Former asian (of japanese ancestry) human who took out loans and a shitty but high paying post to pay for her splices.
She is literally a furry taken to the scifi extreme.
Very business-like most of the time. Doesn’t like the planet and is a little lonely since she’s only been there a short time.
Very predatory and femdommy in the bedroom. She does have a submissive side when surprised.
Likes to call her lovers prey when being dommy and beasts or predators when subbing.
Uses tonfas for weapons.
Is Asian. Has Asian last name: Inoue
*/

// Flags:
// TALK_WITH_PENNY_ABOUT_FUN		    : TODO - FIXME
// TALK_WITH_PENNY_ABOUT_SPECIES        : TODO - FIXME
// TALK_WITH_PENNY_ABOUT_YOURSELF       : TODO - FIXME
// TALK_WITH_PENNY_ABOUT_YOUTH          : TODO - FIXME
// TIMES_FROTTAGED_PENNY                : TODO - FIXME
// TIMES_JACKED_PENNY_OFF_WITH_ONAHOLE  : TODO - FIXME
// TIMES_PENNY_PAWJOBBED                : TODO - FIXME
// HAD_PENNY_GOAL_CHAT                  : TODO - FIXME
// SEXED_PENNY                          : TODO - FIXME
// MET_PENNY                            : TODO - FIXME
// PENNY_AFFECTION                      : TODO - FIXME
// PENNY_FUTA_TALK                      : TODO - FIXME
// PENNY_THROBB_PURCHASE_UNLOCKED       : TODO - FIXME
// PENNY_THROBB_USES                    : TODO - FIXME
// PENNY_TIMES_ANAL_SEXED               : TODO - FIXME
// PENNY_TIMES_OVER_DESK_FUCKED         : TODO - FIXME
// ZIL_PROBLEM_DEALT_WITH               : TODO - FIXME
// PENNY_CREW_ASKED						: -1 = ASKED TOO SOON. 1 = ASKED AND GOT OKAYED. 2 = ON RECRUITMENT ADVENTURE. 3 = MISSION COMPLETE, 4 = ACTUALLY RECRUITED.
// PENNY_ONBOARD						: 1 = PENNY IS ONBOARD THE SHIP. 0 = WAITING OFF THE SHIP. undefined = prolly not recruited
// PQUEST_ZILTRAP_RESULTS 				: 1 = defeated by HP, 2 = lust


public function pennyAffection(arg:int = 0):Number {
	if(flags["PENNY_AFFECTION"] == undefined) flags["PENNY_AFFECTION"] = 0;
	if(arg != 0) flags["PENNY_AFFECTION"] += arg;
	if(flags["PENNY_AFFECTION"] > 100) flags["PENNY_AFFECTION"] = 100;
	else if(flags["PENNY_AFFECTION"] < 0) flags["PENNY_AFFECTION"] = 0;
	return flags["PENNY_AFFECTION"];
}

public function pennysOffice():Boolean {
	return pennyRoomDesc();
}

public function showPennyName():void
{
	if(flags["MET_PENNY"] == undefined) showName("POLICE\nWOMAN");
	else showName("\nPENNY");
}

public function pennyRecruited():Boolean
{ 
	return (flags["PENNY_CREW_ASKED"] == 4 || flags["PENNY_CUMSLUT_RECRUITED"] != undefined || flags["PENNY_BIMBO_RECRUITED"] != undefined);
}
public function pennyIsCrew():Boolean
{ 
	trace("PENNY CREW OUTPUT: " + (flags["PENNY_CREW_ASKED"] == 4 && flags["PENNY_ONBOARD"] == 1));
	trace("PENNY CREW ASKED: " + (flags["PENNY_CREW_ASKED"] == 4));
	trace("PENNY ONBOARD: " + (flags["PENNY_ONBOARD"] == 1));
	return (flags["PENNY_ONBOARD"] == 1);
}

public function pennyBustDisplay(nude:Boolean = false):String
{
	var sBust:String = "PENNY";
	if(penny.isBimbo() || pennyIsCumSlut() || nude)
	{
		if(penny.isBimbo()) sBust += "_BIMBO";
		else sBust += "_NUDE";
		if(penny.hasCock(GLOBAL.TYPE_VULPINE))
		{
			sBust += "_VIXEN";
			if(penny.cocks[0].cLengthRaw < 11.5) sBust += "";
			else if(penny.cocks[0].cLengthRaw < 18) sBust += "_1";
			else sBust += "_2";
		}
		else if(penny.hasCock(GLOBAL.TYPE_EQUINE))
		{
			sBust += "_HORSE";
			if(penny.cocks[0].cLengthRaw < 16) sBust += "";
			else if(penny.cocks[0].cLengthRaw < 20) sBust += "_1";
			else sBust += "_2";
		}
	}
	
	return sBust;
}
public function showPennyBust(nude:Boolean = false):void
{
	if(penny.isBimbo() || pennyIsCumSlut())
	{
		if(pennyIsCrew()) showBust(pennyBustDisplay(true));
		else if(hungryFlahneWithBimboPenny()) showBust(flahneBustDisplay(true),pennyBustDisplay(true));
		else showBust(pennyBustDisplay(true));
	}
	else showBust(pennyBustDisplay(nude));
}
public function showPenny(nude:Boolean = false):void
{
	showPennyName();
	showPennyBust(nude);
}

public function moveOutsidePennysOffice():void
{
	if(pennyIsCrew()) mainGameMenu();
	else move("SOUTH ESBETH 3");
}

//First Encounter
//Appended to room description!
public function pennyRoomDesc():Boolean {
	// Penny in office
	if(!pennyRecruited())
	{
		showPennyBust();
		
		// Pump King Special
		if((flags["PUMPKING_COMPLETION"] == undefined || flags["PUMPKING_COMPLETION"] < 3) && MailManager.isEntryViewed("pumpking_alert"))
		{
			showName("PEACEKEEPER\nOFFICE");
			showBust("");
			if(flags["PUMPKING_COMPLETION"] == undefined) 
			{
				pumpkinStartingQuest();
				return true;
			}
			addDisabledButton(0,"Officer T.","Officer Trent","Officer Trent is laying low until this whole mess blows over." + (flags["PUMPKING_COMPLETION"] == -1 ? " Not your problem, at least.":""));
			return false;
		}
		if(flags["ZIL_PROBLEM_DEALT_WITH"] == undefined) {
			if(flags["MET_PENNY"] == undefined) {
				flags["MET_PENNY"] = 1;
				output("\n\nBehind the desk, sits a female... fox-girl? She’s definitely a girl, or at least very feminine, judging by the DD-cup bosom, barely constrained by her white wrap and loose, open black vest. An armband stamped with the words “U.G.C. Peacekeeper” adorns her right arm, marking her as a source of law on this backwater planet. The frown she’s giving you is spread across a vulpine muzzle, her blue eyes narrowed as she sizes you up. Two pointed ears swivel like radar dishes, each almost as large as her head. A quarter of the way up those ears, a close-cropped, auburn mohawk sweeps back towards the nape of her neck. With ears like that, her species seems closer to the fennec foxes of earth, almost perfectly so.");
				output("\n\n<i>“Something I can help you with, " + pc.mf("Mister","Miss") + "... ?”</i> the law woman asks.");
				output("\n\nReturning her level gaze, you realize that the seated fennec is remarkably short. She can’t be any taller than five feet standing up! You inform the short, chesty fennec that you were merely getting to know the town and wanted to introduce yourself to the locals.");
				
				output("\n\nThe police lady runs a sandy-furred hand through her mohawk, clearly exasperated. <i>“I guess you’re new here, huh?”</i> With no better response, ");
				if(pc.isNice()) output("you nod");
				else if(pc.isMischievous()) output("you shrug noncommittally");
				else output("you smirk and tip your head");
				output(".");
				
				output("\n\nShe continues, <i>“Well, I’m Penny, and I’m what passes for the law out here. I keep things civil and legal. At least, as civil as they can be, given the current collection of laws we call civilization. Lucky for me, Flahne’s got an eye for paperwork, so between the two of us, we’ve cobbled together a few local statutes to keep things running smooth here.”</i> Penny begins to tic off her fingers as she rattles off a list of regulations, inadvertently showing off clawlike nails and padded fingertips. <i>“No murdering anybody. No killing the locals, at least, not if you can help it. Don’t start fights. Don’t rape nobody, and most of all, don’t piss off Penny. Consider that your education. Any questions?”</i> ");
				
				output("\n\nWell, that was... simple.");
				output("\n\n<i>“Look, just use your common sense and you’ll do fine. I’ve got my hands full trying to keep the Zil from running us out of town. And I’d rather not have to spend time scraping anybody off the floor at Burt’s or wasting time when one of you decides to kill the other.”</i> Penny huffs.");
				output("\n\nShe sounds like she has her hands full. Is there something you’d like to ask her?");
			}
			//Repeat Pre-Problem Encounter
			else {
				output("\n\nPenny is sitting behind her desk as usual. Scratching at the fur under her overlarge ear in consternation, the busty fennec fox is grumbling at some notes. She looks to be having a problem with the locals.");
			}
			// Zil codex unlock
			if(!CodexManager.entryUnlocked("Zil"))
			{
				output("\n\nYour codex beeps, informing you about some details on the Zil.");
				CodexManager.unlockEntry("Zil");
			}
			
			this.addButton(0,"Need Help?",askPennyIfSheNeedsHelp);
		}

		//Badgurquest raygun handoff 
		else if(flags["BADGER_QUEST_TIMER"] == -1 && !pc.hasKeyItem("Doctor Badger's Bimbo Raygun - Still programmed for use on Penny.")) 
		{
			output("\n\n<b>You got her message, talk to Penny to see how you can <b>turn the tables</b> on Dr. Badger!</b>");
			addButton(0,"Penny",turnTheTablesOnBadger);
		}
		//Shortcut friend penny if bimboed.
		else if(penny.isBimbo())
		{
			if(flags["SEEN_BIMBO_PENNY"] == undefined) output("\n\nPenny is sitting up straight in her chair, looking fairly perky and attentive, considering her recent transformation into a hyper-sexed, hermaphroditic bimbo.");
			else if(hours >= 8 && hours < 17) output("\n\nPenny is at her desk looking a little pent-up - and drinking something suspiciously white from her coffee cup.");
			else output("\n\nPenny is slouched with a lazy, half-aware grin on her face. Now that regular office hours have come and gone, she must be indulging herself beneath her desk.");
			output(" She doesn’t seem to notice you, that or she can’t see you past all the cum plastered over her fur.")
			addButton(0,"Approach",approachBimboPenny);
			return false;
		}
		//Friendly penny
		else if(flags["SEXED_PENNY"] == undefined) {
			output("\n\nPenny is seated behind her desk and typing away at a cheap terminal. She seems pleased to see you here, flicking a warm smile your way before turning back to her work.");
			this.addButton(0,"Approach",approachFriendPenny);
		}
		//Cumslut penny
		else if(pennyIsCumSlut())
		{
			if(flags["PENNY_HIDING_CUMSLUTTERY"] != undefined)
			{
				output("\n\nPenny doesn’t seem to be at her desk at the moment. Perhaps she’s hiding, as per your instructions.");
			}
			else if(flags["PENNY_LETTING_OTHERS_WATCH_CUMSLUTTERY"] != undefined)
			{
				output("\n\nPenny’s over-large cock is already as far into her mouth as she can manage. She’s busily slurping up and down its length, unaware of your presence just yet.");
			}
			//Join in
			else 
			{
				if(flags["SEEN_PENNY_BE_A_GANGBANG_SLUT"] == undefined) 
				{
					clearOutput();
					output("Heading towards Penny’s office, you suddenly find that the area just outside it has been hastily changed to a sort of impromptu waiting room. A ‘Take A Number’ system has been set up, and a bewildering array of colonists are all sitting about on a variety of scavenged seats clutching at the little colored tickets. You consider taking one, but it looks the next available one is 324, and they’re only up to 256. As you watch the number ticks up to 257, and an extremely satisfied-looking human colonist emerges from the door to Penny’s office.");
				}
				else
				{
					output("\n\nPenny is behind her desk, coated in a rainbow of different-colored cum, relaxing after a long day tending to her queue. You’ve got to get past the people in her improvised waiting area to get her, but that shouldn’t be a problem for you.");
				}
			}
			this.addButton(0,"Approach",approachGirlfriendPenny);
		}
		//Girlfriend penny
		else {
			//Non-Futa
			//Appearance blurb: 
			if(!penny.hasCock()) output("\n\nPenny is hard at work as ever, though once you enter, she flashes a knowing smile in your direction. She doesn’t stop working for you, however. The gene-spliced fennec seems content to leer at you from time to time, getting a bit of a show at her job.");
			//FUTA!
			//Appearance Blurb: 
			else output("\n\nPenny is hard at work as ever, though once you enter, she flashes a knowing smile and a brazen leer in your direction. Her nipples are so hard that they’ve popped out and become visible through her bra and wrappings, though given that she’s packing sex organs for two, you suppose it makes sense. The fennec tries her best to keep working in spite of her rampant hormones.");
			this.addButton(0,"Approach",approachGirlfriendPenny);
		}
	}
	// Replaced officer
	else
	{
		// Pump King Special Hotfix
		if(!pennyIsCrew() && (flags["PUMPKING_COMPLETION"] == undefined || (flags["PUMPKING_COMPLETION"] != -1 && flags["PUMPKING_COMPLETION"] < 3)) && MailManager.isEntryViewed("pumpking_alert"))
		{
			if(flags["PUMPKING_COMPLETION"] == undefined) 
			{
				pumpkinStartingQuest();
				return true;
			}
			addDisabledButton(0,"Officer T.","Officer Trent","Officer Trent is laying low until this whole mess blows over.");
			return false;
		}
		output("\n\nA new officer has taken over for Penny, but they regard you with an air of business-like disinterest.");
		if(!drBadgerImprisioned())
		{
			if(flags["NO_REPORTING_DOC_BADGER"] != undefined) addDisabledButton(0,"ReportBadger","Report Dr. Badger","You’ve decided not to turn in Doctor Badger.");
			else if(flags["MET_DR_BADGER"] != undefined) addButton(0,"ReportBadger",whineToPennyCauseYerABitch,undefined,"Report Dr. Badger","That Doctor Badger thought she could get the best of you... Time to turn the tables the right way: by bringing the hammer of the LAW down on her.");
			else addDisabledButton(0,"Locked","Locked","Someone would have to do something illegal to you to unlock this button...");
		}
		else addDisabledButton(0,"ReportBadger","Report Dr. Badger","You already turned in Doctor Badger.");
		// IQ B-Gone
		if(pc.hasItemByClass(IQBGone)) addButton(1,"IQ B-Gone",turnInIQBGoneToPenpen,undefined,"IQ B-Gone","Turn in the IQ B-Gone you got from Dr. Badger’s lab.");
	}
	return false;
}

//[Need Help?]
public function askPennyIfSheNeedsHelp():void {
	clearOutput();
	showPenny();
	output("<i>“I’ve got two Zil locked up out back. High Command doesn’t care what I do with them, and Flahne is too busy trying to suck golf balls through garden hoses. The Zil just keep dosing me with their pheromones, trying to fuck me whenever I try to talk to them.”</i> Penny pulls a hand out from under the waistband of her pants and wipes her moist digits off on a damp rag, alerting you to a clearly feminine scent. <i>“I’m trying to get some kind of sensible communication established, but all I’ve wound up with is sticky fingers. The morons that go prancing out into the jungle know more about these waspy bastards than me.”</i> ");
	output("\n\nHuge ears pivot towards you a moment before Penny glances back your way. <i>“You’re one of those crazies aren’t you? From what I hear, when the Zil aren’t in their villages, they’re pretty much rutting. So the long and short of it is that I’ve got two sex-crazed insects both trying to fuck the nearest hole, and if I want to figure out what they want, I’ve got to walk into a literal hornet’s nest.”</i> ");
	output("\n\nPenny steeples her fingers in thought. <i>“I can’t keep them captive forever...”</i> She shakes her head. Her gaze is directed down at the desk, so absorbed in her problem that she’s no longer talking to you.");
	output("\n\nYou could offer to beat the lust out of them yourself, or let them sate themselves on your body. You could also just suggest she get an intercom. Or you could always leave and worry about it later. What do you do?");
	processTime(2+rand(3));
	//[Fuck Zil] [FightThem] [Get an Intercom]
	this.clearMenu();
	this.addButton(2,"Get Intercom",getAnIntercom);
	this.addButton(0,"Fuck Zil",fuckTheZilForPennyBecauseYouAreADumbStupidSlut);
	this.addButton(1,"Fight Them",fightDemZil);
	this.addButton(14,"Leave",mainGameMenu);
}

//[Get an Intercom]
public function getAnIntercom():void {
	clearOutput();
	showPenny();
	output("You suggest she toss an intercom into the cell and save herself a lot of time and effort.");
	output("\n\nPenny sighs. <i>“Don’t you think I thought of that? The primitives don’t even know what to do with them. The first ‘com got smashed on the wall. When I tried giving them a baby monitor, they just kept trying to get me to come fuck them, and they promised they’d tell me everything I needed to know...”</i> She shakes her head. <i>“No, I need to solve this in a way that doesn’t end with me on my back.”</i> ");
	//Same menu
	this.clearMenu();
	this.addButton(0,"Fuck Zil",fuckTheZilForPennyBecauseYouAreADumbStupidSlut);
	this.addButton(1,"Fight Them",fightDemZil);
}

//[Fuck Them]
public function fuckTheZilForPennyBecauseYouAreADumbStupidSlut():void {
	clearOutput();
	showPenny();
	if(pc.isNice()) output("<i>“Why don’t I just fuck them until they’re spent, and you can interrogate them after they can’t get it up anymore?”</i> ");
	else if(pc.isMischievous()) output("<i>“What if I tire out the little bugs for you... you know, sexually,”</i> ");
	else output("<i>“Quit being a pussy. I’ll go fuck them so they’ll calm down and you can interrogate them,”</i> ");
	output(" you offer.");
	
	output("\n\nPenny perks up at your words. <i>“You know, that just might work, but aren’t you worried about, you know, picking up some kind of disease?”</i> ");
	//[Explain] [FlirtItOff] [Nevermind(Back)]
	this.clearMenu();
	this.addButton(0,"Explain",explainWhyYoureAHugeSlut);
	this.addButton(1,"FlirtItOff",flirtySlutPCsTellPennyFlirts);
	this.addButton(14,"Never Mind",askPennyIfSheNeedsHelp);
}

//[Explain]
public function explainWhyYoureAHugeSlut():void {
	clearOutput();
	showPenny();
	output("You explain to Penny that you’re in possession of a supplemented immune system that should eradicate all known pathogens. No bug in the universe can stand up to your microsurgeons; at most, the worst you would have to deal with would be some subtle mutations. And that’s only if you don’t get yourself checked up.");
	output("\n\nPenny idly licks her fingers to clean them the rest of the way and pauses as you finish. She raises an eyebrow, remarking, <i>“Is that so? I suppose I shouldn’t be surprised.”</i> She rolls her eyes and quotes the old Xenogen Biotech slogan, <i>“The wonders of biotechnology never cease!”</i> She stands up and sighs, grabbing a pair of tonfas off the desk. With a look at the expression on your face, she smiles and assures you that they’re just there for personal protection.");
	//[Yes] [Nope-goes back to last choice.]
	this.clearMenu();
	this.addButton(0,"Yes",getSpitRoastedForPenny);
	this.addButton(1,"Nope",fuckTheZilForPennyBecauseYouAreADumbStupidSlut);
}

//[Flirt Off]
public function flirtySlutPCsTellPennyFlirts():void {
	clearOutput();
	showPenny();
	output("You smirk and tell her not to worry about it. Besides, the idea of having a sexy fennec like her watching you fuck some horny aliens is worth every medical bill you might incur. Penny’s tail flutters briefly, twitching in the air before settling back down. It stills just as quickly.");
	output("\n\n<i>“I-is that so?”</i> she coyly remarks in between a few last licks of her fingers, cleaning the remnants of pussy juices from her fur. She pushes back her chair, stands up, and smiles, grabbing a pair of tonfas off the desk, which she assures you are just for protection. <i>“You ready for this, lover-" + pc.mf("boy","girl") + "?”</i> ")
	//Adds to affection
	pennyAffection(3);
	//[Yes] [Nope-goes back to last choice.]
	this.clearMenu();
	this.addButton(0,"Yes",getSpitRoastedForPenny);
	this.addButton(1,"Nope",fuckTheZilForPennyBecauseYouAreADumbStupidSlut);
}

//[Yes] (Go Get Spit-Roasted for Penny)
public function getSpitRoastedForPenny():void {
	clearOutput();
	this.userInterface.showBust("ZIL", "ZIL");
	output("<i>“Alright, ");
	if(pc.hasVirginVagina() || pc.analVirgin) output("I hope you weren’t attached to your virginity");
	else if(pc.legCount > 1) output("I hope you don’t mind getting fucked bow-legged");
	else if(pc.hasVagina()) output("I hope you’re on birth control");
	else output("I hope you know what you’re doing");
	output(",”</i> Penny remarks dryly as she steps out from behind the desk, giving you a good look at her lower body. Her legs are digitigrade, meaning they bend twice, like some earth animals’. Those limbs end with fluffy, sandy, fur-covered paws, unhindered by any kind of footwear. Her pants are baggy around the calves and bottoms to accommodate her unique physiology but tighten up noticeably around her pert bottom. The fennec fox-girl’s tail emerges from a hole cut just under the waistline, and it sways enticingly as you follow her into the holding area.");
	output("\n\nPenny grabs a breathing apparatus off the wall. The device looks like a clear faceplate with a cluster of tubes attached to a number of filters that dangle low. A single black band loops around the back of the head, and a foam and rubber seal is there to fit it to just about any humanoid face. The fox-girl fits it over her muzzle, then opens the door. The musk that rolls out from the cells hits you with all the subtlety of a hammer. You cast a baleful look in Penny’s direction for not offering you any protection, but you’ve already breathed in a deep lungful of the sweet yet musky aroma. Slowly, the musk becomes less noticeable to you, while the sweet notes remain. You can feel your heartbeat in your ears and your ");
	if(pc.hasCock() || pc.hasVagina()) output("genitals engorge with heat, puffy and sensitive");
	else output("[pc.asshole] tingles, becoming more sensitive");
	output(". You stand there shuddering, breath coming so fast that you’re hyperventilating. As you fill with lust, Penny just pushes you in.");
	output("\n\nYou stumble forward into a set of vertical bars, and the moment you regain your balance, you grind your feverish body against them in need. Your half-lidded eyes settle upon two insectile forms just inside the cell. Most of their bodies are covered in shining black chitin, though some of the exoskeletal plates retract from their faces, chests, and, most importantly, their crotches. One of them has black colored skin, where it is exposed, and the other yellow. Each of their cocks is on display, wreathed in foreskin and already hard, and both are leaking amber pre-cum. What appear to be shimmering capes hang behind them, though you soon realize that the iridescent drapes are folded, sharply triangular wasp wings.");
	output("\n\nOne zil buzzes, <i>“Open the door....”</i> ");
	
	output("\n\nThe other finishes, <i>“We’ll give you the fucking you crave, teach you your place.”</i> He strokes his cock down, and as his foreskin peels back, you can practically see the cloud of pheromones filling the air. You tremble as you breathe them in, feeling them invading your system. You practically cum on the spot as the second zil repeats the same action, revealing his shiny cockhead and dosing you with another potent blast of sweet zil perfume.");
	
	output("\n\nThey stalk closer and speak in unison, <i>“Fuck you senseless,”</i> but you’re nearly beyond hearing.");
	output("\n\nPenny intervenes at this point; her voice is muffled by the mask she’s wearing. <i>“Fuck this " + pc.mfn("guy","girl","person") + ", and we can all talk when you’ve cleared your heads, bee-brains.”</i> The door clicks open, and Penny shoves you through, though really, you hardly needed any encouragement. You nearly bowl over the wonderful-smelling insects before one stops you in your tracks, clutching you tightly to his slim chest in his lithe arms. Behind you, the bars ‘Ka-CHUNK’ into place, but you don’t particularly care. It feels like you’ve been waiting an eternity to get to the zil, and now that you’re here, you wouldn’t even dream of leaving.");
	
	output("\n\n<i>“Thanks, foxy,”</i> the wasp-like man coos past your ear, his exposed skin dusky and covered with a sheen of what appears to be oily sweat. It smells far better than it should, and before you realize what you’re doing, you begin nuzzling against his chest, your tongue slipping out from between your [pc.lips] and lapping experimentally at his slick, onyx skin. Rubbing your cheek submissively against his inky nipple, you lap at his skin, tasting the salty oils, taking in deep breaths through your nose as you seek out the source of his hypnotic scent. He ruffles his fingers ");
	if(!pc.hasHair()) output("across your head");
	else output("through your [pc.hair]");
	output(", patiently letting you explore his body. Inch by inch, you search, barely aware of the plaintive mews coming from your mouth. Your tongue and lips trace the landscape of his chest, down the hardened plates that protect his abs, until you locate the source of his delicious musk: his crotch. You pant in triumph, mouth watering as, unthinkingly, you fold your [pc.knees] beneath you. With a single exhalation against his body, you sink down, your nose tracing against his skin and down his cock, nuzzling to one side while you bite your lower lip at the sight of his smooth, hairless ballsack. It clings rather tightly to his taint, clearly displaying the heft of his nicely-rounded balls to your eager eyes.");
	
	output("\n\n<i>“Suck,”</i> comes the insistent command. Your jaw is open before the word is over, bending down to catch his cock in your mouth. The salty-sweet taste is divine, and you slither your tongue to peel back the sable skin. His glans is immediately exposed to your sucking, hungry hole, his slick cockhead oozing hot, alien honey onto your tongue, inundating your senses with his succulent flavor. You let out a content moan as you begin to bob on his shaft. The taste is addictive in your current, hedonistic state. Better than any food or drink you’ve ever had, the honey-cum is so ambrosial that you can’t even think about stopping, not until you feel it gushing into your mouth like a river of sweet, sweet nectar, bulging your cheeks, and flooding your throat with its syrup heat.");
	
	output("\n\nThe other prisoner finally makes his move. You catch a glimpse of his yellow dermis out of the corner of your eye, closing in on you from behind. When his shadow falls over you and your sugar-daddy’s honey nozzle, you shiver in intuitive delight. His hands grab you by your [pc.hips], guiding your [pc.butt] higher until you’re standing, bent over to service your ebony friend, with your [pc.butt] on level with your new partner’s crotch. ");
	if(!pc.isNude()) output("He removes your [pc.gear]. ");
	output("Your [pc.vagOrAss] is completely unprotected, and you wouldn’t have it any other way. You balance precariously on one hand to reach back with the other, grabbing your own asscheek to spread yourself hospitably wide for your new friend. His hand mirrors yours, spreading your opposite cheek, his grip firm and commanding on your backside. You let out a babbling groan when his finger slips inside you ");
	if(pc.hasVagina()) output("to gauge your wetness");
	else output("to gauge your tightness");
	output(". Your nerves spark like live wires, and every touch from the Zil sends short-circuiting bursts of ecstasy into your skull. Your eyes roll back as you moan like a greedy whore, drooling around the cock in your mouth.");
	
	output("\n\nA matching moan echoes from the other side of the musk-hazed chamber. In the second that you eyes wander away from your black-chitined lover, you glance at the form of Penny, crouched on a nearby bench. You give a shaky grin and an extra swallow at the sight of Penny’s predicament. The busty fennec’s pants are around her ankles and her fingers are stuffed up to the knuckles in her twat. Her rapid breathing rasps inside her breathing apparatus, the pheromone-filtering capabilities of the device obviously failing. She’s frigging her cunt with desperate abandon, wordlessly shuddering as her jealous eyes watch you through her fogging visor. The cheap plastic bench she reclines on is already slick and glossy with her dripping juices.");
	
	output("\n\nAbruptly, your [pc.vagOrAss] is split wide by a thick, throbbing zilcock. You can feel the honey spurt from your nethers as the zil’s fuckstick shoves deliciously into your hole. ");
	if((pc.vaginalVirgin && pc.hasVagina()) || (!pc.hasVagina() && pc.analVirgin)) {
		output("With a single plunge, it claims your virginity in mere moments, conditioning your satisfied hole to accept its slightly-curved shape and thickness, the oily skin and slippery foreskin making the loss of your ");
		if(!pc.hasVagina() && pc.analVirgin) output("anal ");
		output("innocence surprisingly bearable. ");
	}
	var x:int = -1;
	if(pc.hasVagina()) {
		for(x = 0; x < pc.vaginas.length; x++)
		{
			pc.cuntChange(x,zilpack.cockVolume(0),false, false,false);
		}
	}
	else {
		pc.buttChange(zilpack.cockVolume(0),false, false,false);
	}
	output(" You swoon as it presses down on your misfiring nerve-endings and batters straight into your core with a hard, almost feral plunge. Your eyes roll partway back, half-hidden under your heavy eyelids as you surrender to the pleasure");
	if(pc.hasCock()) output(", [pc.eachCock] drooling a steady trickle of pre-cum onto the ground");
	else if(pc.hasVagina()) output(", [pc.eachVagina] dripping with moisture as your walls tremble around the invader");
	output(".");
	if(pc.balls > 0) {
		output(" Your [pc.balls] ");
		if(pc.balls > 1) output("are");
		else output("is");
		output(" quickly soaked with leaking alien pre-ejaculate, shining with a coat of amber honey as they ready their own copious load.");
	}
	
	output("\n\nBoth zil share a smile at your descent into debauchery, one grabbing you by the head and the other seizing you by the hips, sawing your body back and forth on their slick honeysticks. You aren’t inclined to protest with how good this feels, and the zil don’t seem to have any intention of slowing. The black-skinned one in front jams his dick all the way into your throat, pressing his smooth sack against your lower lip. Grinding up against your nose, the smell is even more potent than the haze already suffusing the metal-paneled cell");
	var cumQ:Number = pc.cumQ();
	if(pc.hasCock() && cumQ >= 50) output(", making your naughty bits drip like a faucet");
	output(". The ebony zil’s cock slides back out from your lips, leaving only its honeysweet head against your lips. You gasp, catching your breath but immediately seal your lips back around the cock in an airtight “O” of need. You tremble, feeling your ");
	if(!pc.hasVagina()) output("bowels are plugged full of rigid zil-cock");
	else output("[pc.vagina] is stuffed full of rigid zil-cock");
	output(". As the cock in your mouth withdraws, you are hilted; yellow balls slap against your butt. They saw into you, their athletic forms building speed. The aliens use you as little more than a sentient cock-sleeve. A thrill of pleasure runs through your body, feeling like a soft sex-toy just waiting to be turned into a double cum-dump.");
	
	output("\n\nIf the throbbing of their dicks is any indication, the zil are clearly enjoying dominating your submissive body. You rock back and forth, greedily gulping down pre-cum, desperately working your muscles to coax ever more from them. They don’t keep you waiting much longer. As one, they break their rhythm, and both cocks are rammed into you. The throbbing ballsacks grind against your [pc.skinFurScales], and a torrent of honeyed jism erupts into your mouth, flooding your cheeks. Different from the syrupy pre, the zil’s cum is creamy and thick, satisfying a deep desire you didn’t even know you had until you started to swallow. You gulp it down with a blissful smile, feeling only wanton abandon at amber trails slopping out of the corners of your mouth and down your chin. At the same time, the yellow zil explodes in your [pc.vagOrAss], hot, thick spunk flooding your insides, jet after jet of it lancing deep into your ");
	if(!pc.hasVagina()) output("bowels");
	else if(!pc.isPregnant()) output("womb");
	else output("passage");
	output(".");
	
	output("\n\nGurgling happily, you lose yourself in a mind-bending orgasm.");
	if(pc.hasCock()) {
		output(" [pc.EachCock] gushes [pc.cum] onto the cell floor, spattering the tile with [pc.cumColor] globs.");
		if(cumQ >= 200) output(" You giggle, nearly out of your mind in pleasure as cum saturates and slathers over you until the three of you, zil and human, are in an orgasmic puddle of your own creation.");
	}
	if(pc.hasVagina()) {
		output(" [pc.OneVagina] clutches tight around the invader");
		if(pc.totalVaginas() == 2) output(" while the other trembles in futile bliss");
		else if(pc.totalVaginas() > 2) output(" while the others tremble in futile bliss.");
		else output(".");
		if(pc.wetness() <= 2) output(" A trickle of [pc.girlCum] escapes your pussy lips.");
		else if(pc.wetness() <= 4) {
			output(" What feels like a torrent of [pc.girlCum] leaks from your quivering cunt");
			if(pc.cockTotal() > 1) output("s");
			output(".");
		}
		else output(" Gushing freely, your [pc.girlCum] washes out in a sticky wave, splattering your [pc.legs], the zil’s armored thighs, and the floor with liquid lust.");
	}
	else output(" Your [pc.asshole] clenches tight around the intruder, milking the jism deep inside you with pleasured contractions.");
	if(pc.canMilkSquirt()) {
		if(pc.lactationQ() < 500) output(" [pc.Milk] dribbles from your [pc.nipples], coaxed out by the tremors of pleasure running through your body.");
		else {
			output(" [pc.Milk] spurts from your nipples, splashing ");
			if(pc.hasCock() && cumQ >= 200) output("into the pooling fluids");
			else output("onto the floor");
			output(".");
		}
		if(pc.milkType == GLOBAL.FLUID_TYPE_MILK) output(" If your mouth wasn’t full of cock, you’d moo like the universe’s sluttiest cow.");
	}
	
	output("\n\nYour waspish suitors pull out of you at the same time, wings buzzing. Your shaking limbs tremble, trying to hold you up as they switch places, floating past each other as they reposition, presenting you with a yellow-skinned, cum-covered cock to suck. You smile drunkenly up at the Zil and open wide to the sound of Penny’s moans.");
	
	output("\n\nThe fox-morph watches you fuck these bug-men with her cunt dribbling on the tiled floor. Her mask fell off during her frenzied self-pleasure. She pants as she aggressively smooshes her hand deep into her now-exposed tits, burying her palm wrist-deep in boob. Her other hand is halfway buried in her snatch, leaving only her thumb to tend to a tiny, barely-visible clit. Penny grunts bestially as her muscles lock, her body shivering lustily before she sags against the wall, still watching. Her hand comes partway out of her reddened slit, though she continues to idly stroke a single digit through her folds as she watches the cum ooze from you.");
	output("\n\nYou’re filled on both sides once more, each zil getting sloppy seconds in one of your holes. Gushing everywhere, the honey quickly coats the floor");
	if(pc.wetness() >= 3) output(" along with your own moisture");
	output(", squirting from your well-used holes. The constant sexual onslaught sends you to orgasm after orgasm, almost one on top of the other. Your mind seems to be turning to putty under the ecstatic assault, shutting down one thought process after another as you ride pleasure unending. Dimly, you’re aware of one sloppy honey injection after another...");
	pc.orgasm();
	var ppZil:ZilMale = new ZilMale();
	if(pc.hasVagina())
	{
		for(x = 0; x < pc.vaginas.length; x++)
		{
			pc.loadInCunt(ppZil, x);
		}
	}
	else pc.loadInAss(ppZil);
	//Cum, pregnancy chances, sensitivity reduction
	//Pass 2 hours.
	processTime(120+rand(20));
	flags["ZIL_PROBLEM_DEALT_WITH"] = 2;
	pc.exhibitionism(1);
	this.clearMenu();
	this.addButton(0,"Next",getFucked4PennyEpilogue);
}

//[Next]
public function getFucked4PennyEpilogue():void {
	clearOutput();
	this.userInterface.showBust("ZIL", "ZIL");
	output("You wake to the sound of flesh impacting flesh, the hard clap of it ringing out through the confined prison. Your jaw and [pc.vagOrAss] are both incredibly sore and dripping, though there is a palpable, satisfying tingle coming from both orifices to make it more bearable. Looking over, you see Penny entangled with one of the zil, legs splayed as she grapples with him, slapping him across the face repeatedly.");
	output("\n\n<i>“You jackasses! You damn near fucked [pc.name] to death! Look at " + pc.mf("him","her") + ", not a single spot that isn’t sticky!”</i> Penny slaps the zil again. <i>“What do you have to say for yourself?”</i> ");
	output("\n\nThe zil, looking confused and hurt, answers, <i>“Is custom when meeting other tribes. Sex establishes dominance and who is to be obeyed. Even though you’re aliens, we assumed you worked the same. We thought if we could dominate you, you would acknowledge us and leave.”</i> He slumps, looking defeated.");
	output("\n\nYou note that Penny has a trickle of golden goo escaping from between her legs. Obviously she stepped in for you at some point and took them the rest of the way down. Her lip pulls back in a sneer. <i>“Well since you two are my... </i>prey<i>, I guess you’ve gotta listen to me now, huh?”</i> ");
	output("\n\nBoth zil nod.");
	output("\n\n<i>“Good. I’m going to lead you out of here on leashes in a minute. You be sure to tell your people that we’ll kill anyone that comes into town trying to force customs on us again. Make sure that message spreads through all your villages. I don’t care if you have to fuck or get fucked by every one of them to do it,”</i> Penny declares while separating herself from the beaten zil. She grabs her pants and throws them on in a huff, closely followed by her wraps, bra, and vest.");
	output("\n\nYou stagger up after the fox-girl, groggily grabbing your things, all of them covered in sexual fluids. She smirks and points you to a shower while she finds some restraints.");
	this.clearMenu();
	this.addButton(0,"Next",postSexShower);
}

//[Next]
public function postSexShower():void {
	clearOutput();
	setLocation("THE\nSHOWER",rooms[currentLocation].planet,rooms[currentLocation].system);
	output("The shower is blessedly warm, washing away the filth of the encounter and easing the pain on your sore form. Flashes of memory play through your mind as you work, and your breathing slowly becomes heavier and more aroused as you remember the lascivious way in which you acted. You stop before you wind up on the floor masturbating, but you definitely think your libido has increased as a result.");
	output("\n\nWhen you step out, the cell room is empty and the wonderful-smelling zil are gone....");
	
	//Boost libido and stick PC in empty jail room.
	pc.libido(1);
	pc.shower();
	processTime(50);
	this.clearMenu();
	this.addButton(0,"Next",mainGameMenu);
}

//[Fight Them]
public function fightDemZil():void {
	clearOutput();
	showPenny();
	output("<i>“I bet I could take them down before their pheromones stop me,”</i> you offer confidently with ");
	if(pc.isNice()) output("an open smile");
	else if(pc.isMischievous()) output("a knowing smirk");
	else output("a confident grin");
	output(".");
	
	output("\n\nPenny’s gaze jerks up to meet yours. <i>“You sure about that? I get all of two sentences out before my fingers start winding between my legs. I don’t think I could stay in there long enough to fight, and even with a breathing filter, it’d still get to me in a minute or two.”</i> The giant-eared fox gestures towards some breath masks suspended from the wall. <i>“They’re meant for dealing with tear gases and similar airborne weapons, though some of the pheromones seem to slip past the filter. They’ll give you a fighting chance if you want to risk it.”</i> ");
	output("\n\n<i>“Last chance to pussy out,”</i> the fennec growls, <i>“What are you gonna do?”</i> ");
	//[Pussy Out] Goes back
	//Fight them
	this.clearMenu();
	this.addButton(0,"Pussy Out",askPennyIfSheNeedsHelp);
	this.addButton(1,"Fight Them",seriouslyFightTheZil);
}

public function seriouslyFightTheZil():void {
	clearOutput();
	this.userInterface.showBust("ZIL", "ZIL");
	//[Fight Them (Confirmed)]
	output("The fairly buxom fox gets up, giving you a good look at her lower body. Her legs are obviously digitigrade like those of an animal, capped off by large, fluffy, fur-covered paws, uncovered by any kind of shoe. Her pants are baggy around the leg to accommodate her unique physiology, but they tighten up quite noticeably around her pert bottom. The fennec fox-girl’s tail emerges from a hole cut just under the waistline, and it wags slightly as you follow her into the holding area.");
	
	output("\n\nGrabbing a pair of masks, she tosses one towards you and says, <i>“I hope you’re half as determined as you sound, because otherwise I’m going to wind up schlicking to a threesome until they sate themselves.”</i> Penny fastens her breather into place, then watches you as you do the same. A rueful smile graces her face as she glances back your way. <i>“Let’s do this.”</i> ");
	output("\n\nPenny leads you into the holding area, stopping at a sealed door. <i>“Heads up,”</i> she warns before depressing the switch. The door opens with a snappy, pressurized hiss, and a wave of musk rolls out. You can smell it through your breather, tickling at your nose and speeding the beat of your heart already. Penny pushes you in, following shortly behind, her tail waving mischievously behind. Two nude aliens stand on the other side of a barred enclosure, their thick, foreskin-enclosed cocks hard and dripping as they regard you.");
	
	output("\n\nThe fox-girl gives you an appraising look, and you nod, indicating you’re ready. She unlocks the cell door for you, guiding you in with a quick push. It slams shut behind you as soon as you’ve stumbled the whole way into the enclosure.");
	output("\n\n<i>“Good luck,”</i> Penny’s muffled voice encourages. She’s seating herself on a bench across the room. The wrappings around her chest have already begun to tent. Even through all that cloth, it’s easy to tell the aliens’ arousing aroma is having an effect on her, just as it is on you. You turn to regard the two bug-men, who are even now advancing on you with confident swaggers. Your gaze flicks down to behold their dripping genitalia, and you idly find yourself wondering what they would look like cumming helplessly beneath you. Right... you came here to defeat them.");
	this.clearMenu();
	
	//Start combat
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(new ZilPack());
	CombatManager.victoryScene(defeatZilPair);
	CombatManager.lossScene(loseToZilPair);
	CombatManager.displayLocation("TWO ZIL");
	
	this.addButton(0, "Next", CombatManager.beginCombat);
}

//Lose to Zil Pair
//By Savin
//Get fucked from both ends until the Zil sate themselves. Penny schlicks in the corner until they’re done, then she takes em down, actually converses with them. They say forcing sex with strangers is a cultural thing, penny says she’ll kill any that try that in town, and turns them loose to tell the rest of their people (by leading them out on leashes)
public function loseToZilPair():void
{
	author("Savin");
	
	output("The onslaught of ");
	if(pc.HP() <= 0) output("physical punishment");
	else output("sexual pheromones");
	output(" is just too much for you. Your [pc.knees] buckle, and you slump down to the cold, hard floor of the jail cell. You hear Penny rush toward you, momentarily recovering from her fap session enough to realize you’re in trouble. But even with her gas mask, she’s unable to withstand the growing power of the fuck-scent filling the room, growing muskier and more irresistible, more... intoxicating... with every second. You twist around to see the foxy police girl collapse, spreading her legs as she mindlessly pulls her mask off, drinking deep of the mind-numbing Zil odor. Separated by the cell bars, Penny’s safe from the wrath of the two horny breeders as she starts to furiously masturbate, fingers diving back into her womanly gash, still soaked with the last flow of her pleasure.");
	output("\n\nYou, however, have nothing to save you. You feel a pair of chitiny hands, so slick they’re almost like latex, grab your neck. Through the mad haze rushing through your mind, you’re only dimly aware of the mounting pressure on your lips. You look up, only to see your entire world dominated by a pair of swinging gonads dangling beneath a bright yellow cock wrapped in a tight layer of foreskin. The Zil boy looming over you licks his lips, grinding his hips on your face, his rock-hard prick dragging across your lips. A slick, oily trail is left in the alien cock’s wake, a heady mix of pre and sex pheromone deposited right on your nose.");
	output("\n\nWhatever cognition you had left after that fight quickly evaporates as the Zil boy spurts a thin, honey-colored drop of pre-cum right on your upper lip. The potent musk overwhelms your last mental defenses in the blink of an eye, and like an eager whore, you open your mouth, tongue rushing out to taste of the magnificent meat dangling before you. <i>“Ahhhh, much better,”</i> the yellow Zil grins as your lips wrap around the head of his throbbing erection, sucking in the first inches of his girth. <i>“You learn your place quickly, " + pc.mfn("boy","girl","little toy") + ". And a talented tongue. See, brother, I told you: patience is key.”</i>");
	
	output("\n\nThe other Zil chuckles, dusky body moving out of sight behind you. Some part of you screams out in worry, but is soon suppressed as you feel the potent amber elixir dribbling down your throat, its source responding to your every touch and lick. The yellow Zil runs dark-armored fingers ");
	if (pc.hasHair()) output("through your [pc.hair]");
	else output("across your head");
	output(", gently guiding you down his dick until your lips press against his base, cock utterly buried in your mouth. You almost gag as the last inches push past your lips, but at a word from your master, your entire body seems to go limp, easily accepting his delicious offering of cock.");
	
	output("\n\n<i>“Good, good,”</i> the yellow Zil coos, slowly guiding you down ");
	if (pc.tallness >= 48) output(pc.isBiped() && pc.hasLegs() ? "onto all fours" : "to the floor");
	else output("as he gets on his knees");
	output(", never letting even the tiniest amount of his prick escape your hungry hole. Reclining, the Zil locks his fingers around your [pc.face], holding you perfectly still. Instinctively you nuzzle into his palm, looking up at the sexual beast with pleading eyes as he slowly moves his hips back, dragging every last inch of his wonderful tool out of you until just the head remains, glans planted on the tip of your tongue. Like the good, hungry slut you are, you lap and lick and kiss his cock head, suckling from it like a teat as ever more of his marvelous amber seed stains your tongue, as sweet as honey and as potent as a drug.");
	
	output("\n\n<i>“[pc.name],”</i> Penny groans behind you, voice filled with unbridled pleasure. Though you can’t see her, it’s easy to imagine her furiously fapping, fingers fucking her hole with abandon. The thought is alluring, but the sudden influx of eight inches of Zil cock drives any thought of Penny from your mind. The yellow jacket pumps his prick back into your eager mouth, then out again, soon settling into a steady rhythm of face fucking that leaves you drooling and moaning around his cock. You barely notice as your gear is stripped away by his brother, piece after piece clattering to the floor. When a hand caresses your [pc.butt], fingers digging into the full cheeks, you instinctively wiggle your ass enticingly, relaxing your [pc.asshole] as a latexy thumb pushes up against the dark little hole.");
	
	output("\n\nYou shiver with shameless excitement as a spit-slick digit prods into your ass, smearing your quivering walls with just enough lubricant to make the coming rape bearable. Rather than dread, you mind flushes with eager anticipation, and you hump back against the hand planted against your butt, drawing the rawest bit of pleasure from the anal fingering before the dark Zil boy withdraws, clasping his hands on your [pc.hips]. You scream around the cock buried in your throat in what your addled mind insists is ecstasy as a big, thick alien cock presses hard against your [pc.asshole], sinking into the slick, unresisting hole with agonizing slowness. You groan as the Zil dick sinks steadily into your ass; you try to busy yourself on the yellow prick in your face, reaching up to fondle the Zil boy’s heavy sack as you suck his shaft, but your mind is relentlessly distracted by the swelling pressure in your backside, insatiably eager for a direct suppository of the Zil’s potent seed.");
	pc.buttChange(zilpack.cockVolume(0));
	output("\n\n<i>“Oh GOD YES!”</i> Penny screams from beyond the bars, <i>“Fuck " + pc.mf("him","her") + " hard, you beasts! Yes! I wanna see your seed pouring from every hole! Oh yeah,”</i> she cries, masturbating with such furious abandon that you can hear her fingers fucking herself even over your own cries and moans and the buzzing of your Zil masters.");
	
	output("\n\n<i>“As you say,”</i> the black jacket laughs, giving you a hard swat on that ass. You reflexively tighten, anal muscles gripping hard on his manhood as it slowly slides out, and in again. This Zil doesn’t even try to match his brother’s frantic, face-fucking pace; instead, he goes slowly on you, enjoying the squeeze and spasm of your sphincter around his cock.");
	if(pc.hasCock()) output(" Your own prick twitches in response; dribbling a thick [pc.cumColor] stream onto the cell floor as the alien prick pumps onto your prostate, accidentally massaging your sensitive anal bud.");
	output(" Submissive, addled, and eager for seed, you can’t help but wiggle your ass and suck as hard as you can, reveling in the bliss of the Zil’s perfect sexual dominance, the aromatic cock shoved down your throat and the carnal anal pleasure of the Zil fucking your butt.");
	
	output("\n\nSuddenly, the yellow jacket seems to seize up, fingers clutching at your cheeks as his fuckstick slams into your throat with a sudden force and speed that makes his previous oral assault seem like foreplay. You groan as his pelvis slams into your face, cock thrusting down your throat again and again until a sudden feral groan escapes his lips, and you feel a rushing flood of sweet honey pouring down your throat. The unstoppable wave of seed shoots into you in great pulsing bursts that soon have you feeling utterly, impossibly full; ever so contented and sated. But a moment later, that satisfaction feels like a distant memory when the dusky Zil buried eight inches in your ass grips your [pc.hips] tight and throws his head back, pounding like a jackhammer as the first sticky flood of his own seed joins his brother’s, bursting into your abused asshole like a geyser.");
	if (silly) output(" The two Zil reach over your insensate form, high-fiving each other");
	else output(" The two Zil grunt and groan");
	output(" as they cum in unison deep into your bowels, filling you with all the sweet alien seed their eager cocksleeve deserves.");
	
	output("\n\n<i>“YES! Yesyesyes!”</i> Penny screams as she, too, climaxes, turned on far beyond her normal sexual limits by the potent musk of the Zil climax that fills the room like a haze, dominating her with sexual need that she can barely strive to fulfil. As the two Zil boys push you off their cocks, thoroughly used and now discarded until next they need release, you roll over in time to see Penny’s cunt gush around her fingers, soaking the floor in her release.");
	pc.changeLust(100);
	penny.orgasm();
	this.clearMenu();
	this.addButton(0,"Next",loseToZilpackPartTwoLoseHarder);
}

public function loseToZilpackPartTwoLoseHarder():void {
	clearOutput();
	output("With amber seed leaking from your lips and gaping ass, you crawl away from the two zil, your own lusts seeming to regulate as the Zils calm down, finally sated. The yellow and black aliens relax against the far wall of the cell, one yellow jacket grabbing you and pulling you back onto his cock as they regard the foxy police girl. You groan as the potent alien pulls you into his lap, one hand stroking his brightly colored cock as the other swirls his brother’s seed around in your abused hole, readying you for round two.");
	output("\n\n<i>“T-that’s enough,”</i> Penny groans, pulling herself up off the floor. <i>“You two bastards have had your fun, now talk.”</i>");
	
	//If PC has a vag:
	if (pc.hasVagina()) 
	{
		output("\n\nThe Yellowjack laughs in the police girl’s face as he lowers your defenseless body down on his prick, spearing into your so-far untouched [pc.vagina]. <i>“We came to this town to breed, little girl. We’ll talk, but first...”</i> He pushes you down, making you support yourself on your arms, hands planted on the cold, cum-slick ground. Digging his fingers into your [pc.butt], the Zil soon has you humping up and down on his prick, taking his cock deep into your womb. You look helplessly up at Penny, but there’s nothing she can do to save you now. Not without meeting the same fate.");
		pc.cuntChange(0,enemy.cockVolume(0));
	}
	//IF PC don't have a cunt: 
	else
	{
		output("\n\nThe Yellowjack laughs in the police girl’s face as he lowers your defenseless body down on his prick, spearing into your ass, using his brother’s cum as lube for a nice, easy sloppy second. <i>“We came to this town to breed, little girl. We’ll talk, but first...”</i> He pushes you down, making your support yourself on your arms, your hands planted on the cold, cum-slick ground. Digging his fingers into your [pc.butt], the zil soon has you humping up and down on his prick, taking his cock deep into your bowels. You look helplessly up at Penny, but there’s nothing she can do to save you now. Not without meeting the same fate.");
		pc.buttChange(enemy.cockVolume(0));
	}
	output("\n\nWith little other choice, Penny begins interrogating the Zil, trying to drag information out of him as the yellowjacket busily defiles your [pc.vagOrAss].");
	output("\n\n<i>“Does everyone out here on the rim spend all their time trying to fuck everyone else?”</i> Penny asks, watching with a mix of arousal and disgust as you start to bounce on the Zil’s cock, unable to mask the pleasure that’s taking hold in your abused body. The Zil laughs, holding onto your hips as you move, guiding your motions. The dusky brother joins in, too, getting to his feet and presenting his cock to you: the sudden influx of his returning aroma has you sucking it in seconds.");
	output("\n\nThe triumphant Zil laughs, <i>“It is a custom when meeting other tribes. Sex establishes dominance and who is to be obeyed. Even though you’re aliens, we see now that your culture is similar. We thought if we could dominate you, you would acknowledge us and leave.”</i> He grins through the bars, but grits his teeth as he cums again, filling your " + (pc.hasVagina() ? "womb" : "bowels") + " with another hot, sticky load of honey-colored cum. <i>“And what are you going to do about it, hmm? Clearly your friend likes it... " + pc.mf("he","she") + " knows the way of the world. Dominate, or submit. There is no other choice.”</i>");
	output("\n\nYou note that the crotch of Penny’s trousers has begun to soak through. She just can’t hide how hard she got off to watching you tangle with the slutty aliens. She bites her lip. <i>“But you’re the ones behind bars. You’re </i>my<i> prey, now. You’ll submit to me, or rot in here.”</i>");
	output("\n\nA moment passes. You gag as the dusky Zil brother fills your mouth with a heady load of sweet cum. Then, glumly, they nod. They’re sexual predators, but not stupid... and they’re awfully sexy. Dominant beasts of sensual prey - you shake your head and spit out the cum, trying to focus.");
	output("\n\nPenny continues more confidently, <i>“Good. If you want to be left alone, then don’t come into town trying to fuck everyone. I’m going to release you, but you WILL listen to me: be sure to tell your people that we’ll kill anyone that comes into town trying to force ‘customs’ on us again. I don’t give a damn about your sick take on dominance; we do NOT exist to be fucked by your people. Do you fuckheads understand that? We will </i>kill<i> the next one that tries to rape an offworlder. Make sure that message spreads through all your villages. I don’t care if you have to fuck or get fucked by every one of them to do it,”</i> Penny declares while pulling her mask back on and hastily twining her wraps back around her torso, covering them them partway with her vest a minute later. <i>“Gotta keep the girls in place,”</i> she mutters as her hard nipples press plainly through the fabric.");
	output("\n\nPenny smirks and points you to a shower while she finds some restraints. <i>“Get cleaned up, I’ll take care of the hooligans.”</i> You are a bit worked up from the fight. A shower would be nice.");
	
	if (pc.hasVagina())
	{
		pc.loadInCunt(enemy, 0);
		pc.loadInCunt(enemy, 0);
	}
	else
	{
		pc.loadInAss(enemy);
		pc.loadInAss(enemy);
	}
	pc.loadInMouth(enemy);
	//pc.orgasm();
	
	this.clearMenu();
	this.addButton(0,"Next",finishLosingToZilYouLoser);
}

//[Next]
public function finishLosingToZilYouLoser():void {
	clearOutput();
	output("The shower is blessedly warm, washing away the filth of the encounter and easing your worked-up body. By the time you finish, you’re feeling a little calmer and more in control of your rampantly sexual urges.");
	output("\n\nWhen you step out, the cell room is empty and the wonderful-smelling zil are gone...");
	//Reduce libido and stick PC in empty jail room.
	//(NO WAY SAV-O)
	pc.libido(2);
	pc.shower();
	//Pass 30m
	processTime(30);
	flags["ZIL_PROBLEM_DEALT_WITH"] = 0;
	CombatManager.genericLoss();
}

//Win to Zil Pair
public function defeatZilPair():void {
	clearOutput();
	output("The zil slump over into a pile, ");
	if (enemy.HP() <= 0) 
		output("no longer aroused and very much looking like the fight has been beaten out of them");
	else 
		output("sucking each other’s cocks idly while presenting their bottoms to you");
	output(". Exposed to their pheromones as you were, you do realize that you’ve become aroused by fighting in their presence");
	if (pc.hasCock() && pc.hasVagina())
		output(", and both your [pc.vaginas] and [pc.cocks] are engorged and ready");
	else if (pc.hasCock())
		output(", and [pc.eachCock] is hard and ready");
	else if (pc.hasVagina())
		output(", and [pc.eachVagina] is moist and ready");
	else
		output(", and your [pc.asshole] tingles in anticipation");
	output(". You’re in the process of considering scratching your itch when a satisfied groan from Penny catches your attention.");
	
	output("\n\nPants slip up over the fox-girl’s delta just as you turn back to regard her, obscuring the thoroughly juiced panties from view. She catches you looking and smirks, mirth twinkling in her eyes. <i>“Ease up there, lover-" + pc.mf("boy","girl") + ". These are my prisoners and it’s time to interrogate them. One of us has to keep a clear head.”</i> Penny wipes her stained fingers on her trousers as she steps between you and the zil, snapping her bra back into place as she goes.");
	output("\n\n<i>“Hey, native jackasses!”</i> Penny slaps one of the zil. <i>“Why’d you have to make things so goddamned hard on me?”</i> Penny growls in the back of her throat. <i>“Does everyone out here on the rim spend all their time trying to fuck everyone else?”</i>");
	output("\n\nThe zil, looking confused and hurt, answers, <i>“Is custom when meeting other tribes. Sex establishes dominance and who is to be obeyed. Even though you’re aliens, we assumed your culture is similar. We thought if we could dominate you, you would acknowledge us and leave.”</i> He slumps, looking defeated. <i>“Are you going to take us now?”</i>");
	output("\n\nYou note that the crotch of Penny’s trousers has begun to soak through. She just can’t hide how hard she got off to watching you tangle with the slutty aliens. She bites her lip. <i>“Well since you two are my... </i>prey<i>, I guess you’ve gotta listen to me now, huh?”</i>");
	output("\n\nBoth zil nod.");
	output("\n\nPenny continues more confidently, <i>“Good. I’m going to lead you out of here on leashes in a minute. You be sure to tell your people that we’ll kill anyone that comes into town trying to force ‘customs’ on us again. Make sure that message spreads through all your villages. I don’t care if you have to fuck or get fucked by every one of them to do it,”</i> Penny declares while separating herself from the beaten zil. She grabs her wraps and hastily twines them around her torso, covering them partway up with her vest a minute later. <i>“Gotta keep the girls in place,”</i> she mutters as her hard nipples press plainly through the fabric.");
	output("\n\nPenny smirks and points you to a shower while she finds some restraints. <i>“Get cleaned up, I’ll take care of the hooligans.”</i> You are a bit worked up from the fight. A shower would be nice.");
	//[Next]
	pc.changeLust(10);
	this.clearMenu();
	this.addButton(0,"Next",beatPennysZilPartII);
}
public function beatPennysZilPartII():void {
	clearOutput();
	output("The shower is blessedly warm, washing away the filth of the encounter and easing your worked-up body. By the time you finish, you’re feeling much calmer and more in control of your urges.");
	output("\n\nWhen you step out, the cell room is empty and the wonderful-smelling zil are gone....\n\n");
	//Reduce libido and stick PC in empty jail room.
	flags["ZIL_PROBLEM_DEALT_WITH"] = 1;
	pc.libido(-.5);
	pc.shower();
	//Pass 30m
	processTime(30);
	CombatManager.genericVictory();
}

//Visit Penny Post Problem 1x
//Penny admits to all her second-hand gene splices making her libido rather out of control, accidentally lets slip that’s actually kind of lonely which makes it worse. Opens up repeat talk options but not sex.
//Repeat Greetings
//Friendly stuff - all her talk options. Doing all the talks opens up options for sexy.
//Despite earlier sexiness
	//Appearance blurb: 
	//Actual approach:
public function approachFriendPenny(outputT:Boolean = true):void {
	showPenny();
	if(outputT) {
		clearOutput();
		output("Penny turns back up at you, greeting, <i>“‘Sup, crazy? Need a hand for anything? I still owe you, you know.”</i> Her voice carries a playful undertone, like she’d rather not be working. Perhaps you could offer her a welcome distraction.");
	}
	clearMenu();
	addButton(14,"Back",mainGameMenu);
	addButton(0,"Talk",friendPennyTalkMenu);
	if((pc.hasCock() || pc.hasVagina()) && pc.lust() >= 33) addButton(1,"Sex",pennySexFirstTime);
	else addDisabledButton(1,"Sex","You need a penis or vagina and lust at or above 33 to attempt intercourse with Penny.");
	if(!drBadgerImprisioned())
	{
		if(!pennyRecruited())
		{
			// Go Whine to Penny that a Mustelide was Mean to You
			// PC must have encountered Doc Badger, haven’t turned Penny into a useless cumslut
			// Add [Badger Help] to Penny’s talk menu
			if(flags["NO_REPORTING_DOC_BADGER"] != undefined) addDisabledButton(2,"ReportBadger","Report Dr. Badger","You’ve decided not to turn in Doctor Badger.");
			else if(flags["MET_DR_BADGER"] != undefined) addButton(2,"ReportBadger",whineToPennyCauseYerABitch,undefined,"Report Dr. Badger","That Doctor Badger thought she could get the best of you... Time to turn the tables the right way: by bringing the hammer of the LAW down on her.");
			else addDisabledButton(2,"Locked","Locked","Someone would have to do something illegal to you to unlock this button...");
			// Penny has the doc's raygun
			if(flags["BADGER_QUEST"] == -1 || flags["BADGER_QUEST"] == -2)
			{
				addDisabledButton(2,"ReportBadger","Report Dr. Badger","Why would you report Dr. Badger when you and Penny are planning to give her a taste of her own medicine?");
			}
			// Mission complete
			if(flags["BADGER_QUEST"] == -3) addDisabledButton(2,"ReportBadger","Report Dr. Badger","Why would you report Dr. Badger when you’ve turned her into your big-breasted, bimbo badger fucktoy?");
		}
		if(flags["BADGER_QUEST"] == 1)
		{
			if(flags["NO_ZAP_PENNY"] == undefined) 
			{
				if(flags["PENNY_BADGER_WARNED"] == undefined) addButton(2,"Zap Penny",surpriseZapPennyWithBimboRay,undefined,"Zap Penny","This seems like a jerk move, but if nothing else you can be pretty sure she’ll probably enjoy the end result, as will you.");
				else addButton(2,"Zap Penny",zapPennyAfterWarningHer,undefined,"Zap Penny","Go ahead and zap Penny with the Bimbo Raygun, now that it seems like she approves.");
			}
			else addDisabledButton(2,"Zap Penny","Zap Penny","Now that you’ve tipped her off, it’ll be impossible to catch her with her guard down.");
			addButton(3,"BadgerWarn",warnPennyAboutDoctorBadgersNefariousSchemes,undefined,"Warn Her About Dr. Badger","Penny would probably have some opinions about Dr. Badger’s plan. Who knows, maybe she’d be into it, or maybe she’ll have some ideas about how to turn the tables on Dr. Badger instead.");
		}
	}
	else addDisabledButton(2,"ReportBadger","Report Dr. Badger","You already turned in Doctor Badger.");
	// IQ B-Gone
	if(!pennyRecruited() && pc.hasItemByClass(IQBGone)) addButton(4,"IQ B-Gone",turnInIQBGoneToPenpen,undefined,"IQ B-Gone","Turn in the IQ B-Gone you got from Dr. Badger’s lab.");
}
public function friendPennyTalkMenu(func:Function = null):void
{
	clearMenu();
	if(func == talkToPennyAboutYourself) addDisabledButton(0, "Yourself");
	else addButton(0, "Yourself", talkToPennyAboutYourself);
	if(func == pennysYouth) addDisabledButton(1, "Youth");
	else addButton(1, "Youth", pennysYouth);
	if(func == whatDoesPennyDoForFun) addDisabledButton(2, "Fun");
	else addButton(2, "Fun", whatDoesPennyDoForFun);
	if(func == talkToPennyAboutSpecies) addDisabledButton(3, "Species");
	else addButton(3, "Species", talkToPennyAboutSpecies);

	if(flags["PENNY_CREW_ASKED"] == undefined) addButton(4,"Recruit Her",offerPennyAJob,undefined,"Recruit Her","Penny looks like a stern, capable, reliable type. You could probably find a place for her as a security officer on your ship, easy.");
	else addDisabledButton(4,"Recruit Her","Recruit Her","You already tried, and Penny wasn’t having it. However, with the way the conversation ended, you might be able to win her over in time...");

	addButton(14, "Back", approachFriendPenny, false);
}

//[Sex]
public function pennySexFirstTime():void {
	clearOutput();
	//Not Done All Talks Yet
	if (flags["TALK_WITH_PENNY_ABOUT_YOURSELF"] == undefined || flags["TALK_WITH_PENNY_ABOUT_YOUTH"] == undefined || flags["TALK_WITH_PENNY_ABOUT_FUN"] == undefined || flags["TALK_WITH_PENNY_ABOUT_SPECIES"] == undefined)
	{
		showPenny();
		output("You suggest that the two of you could slip into the shower for a little fun if work is getting her down.");
		output("\n\n<i>“Look, [pc.name], I know things were a bit weird earlier, but that doesn’t mean I shimmy out of my shorts for just anyone,”</i> Penny says with a sigh. <i>“I mean, we don’t even know each other all that well yet. Heck, you don’t even know </i>");
		var shitPennySays:Array = new Array();
		if(flags["TALK_WITH_PENNY_ABOUT_YOURSELF"] == undefined) shitPennySays[shitPennySays.length] = "if I like you that way";
		if(flags["TALK_WITH_PENNY_ABOUT_YOUTH"] == undefined) shitPennySays[shitPennySays.length] = "my last name";
		if(flags["TALK_WITH_PENNY_ABOUT_FUN"] == undefined) shitPennySays[shitPennySays.length] = "what kinds of things I do for fun";
		if(flags["TALK_WITH_PENNY_ABOUT_SPECIES"] == undefined) shitPennySays[shitPennySays.length] = "what species I am";
		output("<i>" + shitPennySays[rand(shitPennySays.length)] + "</i>");
		output("<i>!”</i> She chuckles to herself before dazzling you with a open smile. <i>“That doesn’t mean I don’t appreciate the attention - I do... but even a lonely law woman on a crazy alien planet has to have standards.”</i>");
		output("\n\nThe foxy fennec fiddles nervously with the back edge of her mohawk, where it meets the nape of her neck. <i>“Stick around, crazy, and maybe sometime you might talk me into it.”</i> The way she fidgets, you swear she should be blushing, but it’s impossible to tell through her fur. Perhaps this is one case where her inhumanity provides an advantage.");
		processTime(4);
		approachFriendPenny(false);
	}
	//Done All Talks (Req’s Gender)
	else {
		showPenny(true);
		output("You suggest that the two of you could slip into the shower for a little fun if work is getting her down.");
		output("\n\nPenny looks up at you with a little bit of red tinge in her big blue eyes. <i>“You aren’t joking, are you?”</i>");
		output("\n\nSmiling warmly, you confirm that you aren’t.");
		output("\n\n<i>“Even after... knowing what I am, and what a... what a loudmouth I can be? You still want to fuck me?”</i> The words ‘fuck me’ are almost whispered.");
		output("\n\nYou nod");
		if(pc.isNice()) output(" and tell her she’s quite a specimen, fur and all.");
		else if(pc.isMischievous()) output(" and tell her that you don’t mind, so long as she doesn’t start smelling like a wet dog after she cums.");
		else output(" and tell her that you won’t be satisfied until you’ve had her.");
		
		output("\n\nPenny stands up at that point, sending her chair skittering against the wall behind her. One narrow finger depresses a key on her keyboard, and you hear the whole unit power down, followed closely by the solid ‘ka-chunk’ of the outside door sealing. She kicks out of her pants without a word, a pair of panties following shortly behind. Swaying back and forth, the bottomless fennec sheds her unclosed vest and begins unwrapping the bindings that keep her chest in place. Her mammaries seem to swell larger and larger with each and every piece of fabric that is removed, eventually resolving into a pair of double D’s held snugly aloft by a white bra. Even that soon vanishes, forgotten by both of you as it falls into the mound of discarded garments.");
		output("\n\nStrutting over to you, the naked fox waves her tail gracefully around herself, concealing and revealing her assets with surprising dexterity. You have a moment to admire Penny, and you take it, brazenly leering at her body. Her nipples are bright pink and about the size of quarters. They look to be entirely areola until you see the slit in the middle, revealing that the fox woman has inverted nipples. The whole of their surface is already puffy and somewhat engorged, eager to be touched and squeezed. Her middle is white with lighter colored fur, blending into the orangey-yellow that wraps the rest of her body near her hips and sides. Further down, just around her sex, Penny’s fur fades away entirely, though you’re unsure if it is a genetic quirk of her mutations or simple grooming. Regardless, there’s a nice, moist slit at the juncture of the vulpine’s legs. The outer lips are nice, large, and puffy, while her inner labia are small enough that you can barely see them through Penny’s swollen mound. Around the entrance the pink gives way to a deeper, almost purplish-red.");
		output("\n\n<i>“Like what you see?”</i> Penny asks.");
		output("\n\nYou nod eagerly, flushing a bit with your own lust at the completely exposed vixen");
		if (pc.hasCock() && (pc.armor.shortName != "" || pc.lowerUndergarment.shortName != ""))
		{
			output(", tenting your ");
			if (pc.armor.shortName != "") output("[pc.armor]");
			else output("[pc.lowerUndergarment]");
			output(" noticeably with your engorging mast");
			if(pc.cockTotal() > 1) output("s");
		}
		else if(pc.hasCock())
		{
			output(", growing hard with shameful rapidity");
		}
		else if(pc.hasVagina()) output(", [pc.eachVagina] moistening enough that you wonder if the fennec’s keen nose can smell it");
		output(".");
		
		output("\n\nPenny presses herself up against you, tilting her head");
		if(pc.tallness >= 65) output(" back");
		else if(pc.tallness <= 55) output(" down");
		output(" to peer into your eyes. Her moistening cleft presses against your [pc.leg] as she looks at you");
		if(!pc.isNude()) output(", slowly tracing her fingers across your gear, undoing it with quick pulls");
		else
		{
			output(", slowly letting her hands explore your exposed torso");
			if(pc.biggestTitSize() >= 1) output(", focusing mostly on your [pc.fullChest]");
		}
		output(". <i>“So, you’re trapped in here with a sexy fox,”</i> Penny says with an almost feline purr. <i>“A sexy, hungry vixen.”</i> She takes your hand and presses it against her moist mons. <i>“Now, you’d better not disappoint her,”</i> she says with a nip at ");
		if(pc.tallness <= 60) output("your ear");
		else if(pc.tallness <= 72) output("your neck");
		else output("your side");
		output(", <i>“...or who knows what she’ll do.”</i>");
		
		output("\n\nThe fox-morph grabs your [pc.butt] in her hands, squeezing your cheeks momentarily, distracting you from the loss of heat against your front. Once she lets go, you discover that Penny has circled around you. She’s at a doorway now, her butt wiggling in your direction with her tail upraised as she fiddles with the portal’s control panel. You come after her, but the door chooses that moment to open, allowing Penny to slip away. The last thing you see is the flash of a tail vanishing into the darkness. Well, you may as well follow and finish what you started...");
		//[Next]
		processTime(10);
		this.clearMenu();
		if(pc.hasCock()) {
			if(pc.cockThatFits(penny.vaginalCapacity()) >= 0) this.addButton(0,"Next",firstTimePennyShowerSex);
			else this.addButton(0,"Next",stickAHugeDickInPennysWorld);
		}
		else this.addButton(0,"Next",femaleFirstTimePennyLesboz);
		IncrementFlag("SEXED_PENNY");
	}
}

//Male First Time Shower Sex
public function firstTimePennyShowerSex():void {
	clearOutput();
	showPenny(true);
	var x:int = pc.cockThatFits(penny.vaginalCapacity());
	if(x < 0) x = 0;
	var y:int = pc.cockThatFits2(penny.vaginalCapacity());
	output("Stepping into the next room, you hear the gentle sound of a running shower. You follow the auditory trail through another doorway, getting hit by a wave of steam and a view of feminine curves all at once. Penny is standing in a surprisingly large shower stall with the door open and the water running down her back, slicking her fur down so that it shines with the moisture. She beckons you closer, saying, <i>“I don’t bite... much.”</i>");
	output("\n\nYou step in alongside her, letting the hot water run over your [pc.skinFurScales]. The heat practically melts the soreness and exhaustion from your body, though it does nothing for the different warmth blooming in your loins. In fact, the burgeoning lust seems to expand, spreading through your limbs when Penny presses her warm, wet form against you, her arms winding their way to your groin, sliding her palms down your [pc.belly] until they press against the turgid mass of [pc.oneCock].");
	output("\n\n<i>“Mmm, a fitting tribute, prey,”</i> Penny coos from behind you. One hand wraps around your " + num2Text(Math.round(pc.cocks[x].thickness())) + " inches of girth, squeezing it softly. <i>“I like to play with my food.”</i> True to her word, she begins to stroke you, sliding her water-slicked palm up and down along your length. Her other hand ");
	if(pc.hasVagina()) 
	{
		output("seeks out your [pc.vagina]");
		if(pc.balls > 0) output(", though first it has to burrow behind your [pc.balls], eventually");
		output(",");
		output(" sinking into your folds to explore your channel.");
	}
	else if(pc.balls > 0) output("seeks out your [pc.balls], cupping them gently. She rolls them around while she works your shaft, careful to heft them gently, lest she damage the sperm inside.");
	else output("curls into a tight ‘o’ around your base, trapping the blood there so that you grow bigger and more sensitive in her grip.");
	output("\n\nYou brace your hand against the wall to keep your balance in the face of the sensations rushing out of your groin. Your [pc.legs] seem weak while your [pc.hips] seem determined to thrust, but to do so now would only tear your maleness from the aggressive fennec’s wonderful fingers.");
	
	output("\n\nThe gentle slap Penny’s hand makes whenever she bottoms out against your ");
	if(!pc.hasSheath(x)) output("crotch");
	else output("sensitive sheath");
	output(" soon fills the shower. ");
	if(pc.cockTotal() > 1 && y >= 0)
	{
		output("Her other hand moves away from your ");
		if(pc.hasVagina()) output("[pc.vaginas]");
		else if(pc.balls > 0) output("[pc.sack]");
		else output("dick");
		output(" and over to another penis, allowing her to double the handjob. She works the [pc.cock " + y + "] with matched pumps, gleefully using your array of handholds to her advantage. ");
	}
	output("Plush breasts push up against your back, grinding against you as Penny’s eager handjob becomes more enthusiastic. She leans ");
	if(pc.tallness >= 72) output("under your arm");
	else if(pc.tallness >= 55) output("around you");
	else output("over top of you");
	output(" and looks ");
	if(pc.tallness <= 55) output("up");
	else output("toward you");
	output(", grinning in the sharp-toothed, almost frightening way that only predators can. Her fluffy ears tickle you slightly, and before long the smile is replaced by an open mouth and panting tongue. You shudder slightly, rocking your waistline back and forward with her strokes, no longer able to completely restrain yourself. <i>“Atta " + pc.mf("boy","girl") + ",”</i> she whispers encouragingly.");
	
	output("\n\nDollops of pre-cum begin to leak from your tip, though the water mixes with them almost immediately, diluting them even as they decrease the friction you’re feeling on your rod");
	if(pc.cockTotal() > 1) output("s");
	output(". Penny’s palm becomes so slick that she starts to slide faster without meaning to, pumping harder and faster, making you mast and thicken in her hand, your member leaking its love-juice more freely in response.");
	if(y >= 0) output(" The second lucky cock is soon sluicing its own prejaculate over the fox-girl’s other hand.");
	output(" Giggling, the chesty fennec pulls her hand");
	if(y >= 0) output("s");
	output(" away and sidles around your side, making a show of smearing her well-lubricated hands along her chest, massaging her hefty globes. Her rounded areolae grow larger and more prominant thanks to the attention until she squeezes them. Like sexual turkey timers, two nubs pop out of their hidden slits, each standing proud and erect, nearly three quarters of an inch long. It seems Penny is ready to go.");
	
	output("\n\nYou gawk as she ");
	if(pc.tallness >= 78) output("climbs up onto the lip of the tub, grabbing hold of your shoulders for balance as she lines herself up for penetration.");
	else output("comes the rest of the way in front of you, pressing her lips against the curve of your shaft as she prepares to penetrate herself on you.");
	output(" The fox-girl jumps without any kind of warning, using her arms to hold herself while she aligns her wet nethers with your equally-soaked cock.");
	if(y >= 0) output(" The second flops around, unused, until you grab it and angle it toward the vixen’s unclaimed asshole.");
	output("<i>“Now, to take you as mine,”</i> Penny hisses, slowly lowering herself towards your waiting " + pc.cockHead(x));
	if(y >= 0) output(" and " + pc.cockHead(y));
	output(". Her velvety-soft lips slowly, exquisitely part around you, kissing the most sensitive parts of your dick");
	output(" with soaked, silken kisses. Her tunnel stretches to hold you");
	if(y >= 0) output(", just as her pucker gives into persistent, back-door prodding");
	output(", and Penny sighs comfortably, languidly filling herself with cock, one inch at a time.");
	
	output("\n\nPenny’s pussy devours your " + pc.cockDescript(x) + " over the span of a minute or so. Every time you twitch or move to thrust inside her, she backs off, lifting an inch or two away, forcing you to calm the instincts that madly demand you rut the bitch.");
	output("\n\n<i>“Mine,”</i> the vixen growls, suddenly slamming herself down to your " + pc.sheathDescript(x) + " with a powerful thrust. Her innards squeeze down around your " + pc.cockDescript(x));
	if(y >= 0) output(" and " + pc.cockDescript(y));
	output(", binding you in the fennec’s sex. Legs wrap around your [pc.butt], and Penny suddenly kisses you. Her tongue slithers into your mouth, prying your lips apart so that it can caress your own. You find yourself kissing back; you’re far too turned on not too. Your hips buck against her, slamming her into the wall in your eagerness to truly fuck her, but she’s already fully impaled. There’s no further penetration to be gained by such an act, and unless she unwraps her legs, she’s going to stay that way. Her claw-like fingernails dig into your back hard enough to draw lines of blood, the pain actually pulling you from your rutting stupor.");
	pc.cockChange();
	
	output("\n\nPenny growls, <i>“Be still, my lucky, " + pc.mf("handsome","sexy") + ", prey.”</i> She does not merely command you, however. Her hips lift with her words, and she begins to slide herself up and down your pole. Your newly inflicted wounds ache, but she tenderly begins to wash them, using the water that’s pouring over you both to care for the damage she’s done. From her position, Penny can fuck you quite well. Her heavenly slit stretches wonderfully with each fuck");
	if(y >= 0) output(", her ass tighter and differently textured but equally pleasant");
	output(", making you throb with such need that [pc.eachCock] feels ready to explode.");
	if((pc.cockTotal() == 2 && y == -1) || pc.cockTotal() > 2)
	{
		output(" The untaken portion of your genitals are suddenly wrapped in tail, the fluffy, silky fur stroking your heated boner");
		if(pc.cockTotal() > 1) output("s");
		output(" with long, wet caresses.");
	}
	
	output("\n\nRiding you faster and faster, the vixen starts to groan and growl in equal measure. Her facade is cracking away, allowing you to see her sinking into the pleasure, submerging herself in lust with each drop down onto your dick");
	if(y >= 0) output("s");
	output(". The growls eventually give way to plaintive whines, and her authoritative grip loosens, slackening under her growing heat. You take the opportunity to thrust against her, pounding her pussy with every downstroke she makes, slamming your hips hard into hers. You passionately kiss her, wrapping one arm around her waist to allow you to control the pace more readily, not that it matters. You’re both operating like two halves of a sexual machine, running at the red-line, shaking your bodies so that your piston is plowing through her oil-slick snatch so fast it feels like a blur of pleasure.");
	output("\n\nPenny breaks the kiss, but only to cry out. Her orgasmic scream is muffled by your shoulder, as she bites down on it a moment later, hard enough that for a moment, you worry she’s wounded you again. That thought is obliterated by the sudden onslaught of attention from her pussy, which is wringing you tightly within her folds, squeezing, twitching, and fluttering around your " + pc.cockDescript(x) + " in an attempt to share the orgasmic delights it’s experiencing.");
	if(y >= 0) output(" Her asshole is not nearly as active, but her ring does squeeze tight, forcing your dick to bloat within her to what feels like elephantine proportions.");
	output(" The feelings the fox-girl is forcing into you obliterate your worry and replace it with pleasure, starting in a knotted up ball of heat inside you. You unthinkingly plow the whole way inside her and hold her there, cock-stuffed as you begin to spew your load.");
	
	output("\n\nPenny’s convulsing cunny gleefully accepts the [pc.cum] you spray into it, taking it deep inside her pussy, perhaps even all the way into her womb.");
	var cumQ:Number = pc.cumQ();
	if(pc.hasKnot(x))
	{
		output(" She grunts as your knot swells within her, eyes wide as her gene-spliced pussy starts a second orgasm from being mated the way she was meant to be. Her body goes limp in your arms, and you’re forced to support the pleasure-drunk fox, your gushing goo filling her with an instinctual lust that drowns reason and leaves only a savage, primal love.");
		if(cumQ < 750) {}
		else if(cumQ < 2000) output(" Her belly rounds slightly from all you put into her, but the way her eyes are rolling back, you’re sure she doesn’t mind the added weight.");
		else
		{
			output(" Her belly balloons from all the spunk you pour into her, but the way her eyes roll back and her mouth mouths ‘more,’ you’re sure she doesn’t mind.");
			if(cumQ >= 5000)
			{
				output(" Of course, after that the pressure becomes to great, and your [pc.cum] runs out in a wave, ");
				if(cumQ <= 10000) output("puddling at the bottom of the tub");
				else if(cumQ <= 20000) output("slowly filling the tub");
				else output("slowly filling the tub until you fear it will overflow");
				output(".");
			}
		}
	}
	else
	{
		if(cumQ <= 50) output(" Droplets of it leak down her legs to be washed away before they can dry, and you stay inside her until you’ve squeezed out every drop.");
		else if(cumQ <= 250) output(" Some of it oozes down her legs in thick streams. The water ensures it doesn’t get to dry there, but you’re cumming hard enough for it not to matter.");
		else
		{
			output(" Waves of [pc.cumColor] fluid roll down the fennec’s thighs, drenching her legs faster than the water can wash it away. Penny’s pussy is turned into a [pc.cum] fountain by your orgasm, and all she can do is hang there, orgasming so powerfully that she looks about to lose consciousness.");
			if(cumQ >= 1000) output(" Her belly expands under your sordid care, rounding nicely into a little paunch, filled with [pc.cum].");
			if(cumQ >= 3000) output(" Your body refuses to stop there, and soon that paunch transforms into a gravid tummy, packed full of your fluid.");
			if(cumQ >= 5000) 
			{
				output(" She whimpers when her body becomes too full to handle any more, and the cum running out of her speared slit begins to fill the tub faster than it can drain, turning the enclosure into a");
				if(cumQ <= 5500) output("n inch deep puddle");
				else if(cumQ <= 6000) output(" two inch deep puddle");
				else if(cumQ <= 10000) output(" four inch deep puddle");
				else if(cumQ <= 20000) output(" almost a foot deep puddle");
				else output("tub full of sex-juice");
				output(".");
			}
		}
	}
	output("\n\nGradually sliding down, ");
	if(pc.hasKnot(x)) output("hanging for a moment before she pops off, ");
	output("Penny eventually frees herself from your manhood and collapses into the tub. She looks at you through bleary eyes and abruptly climbs back up, ");
	if(cumQ >= 2000) output("cradling her stuffed middle and ");
	output("kissing you on the lips. You kiss her back until you both tire of dueling tongues and simply enjoy feeling of the shower washing you clean, helping each other to scrub off.");
	output("\n\n<i>“My mate...”</i> Penny muses out loud, <i>“I like the sound of that.”</i> She looks at you with a warm smile, putting an arm around your ");
	if(pc.tallness <= 55) output("shoulder");
	else if(pc.tallness <= 75) output("waist");
	else output("hips");
	output(". <i>“My </i>");
	if(pc.tallness <= 50) output("<i>little </i>");
	else if(pc.tallness >= 70) output("<i>big </i>");
	output("<i>mate. We’ll have to do something like this again, and soon.”</i> She smiles. <i>“It is nice to finally cut loose with someone. I just hope you don’t mind too much when I get all riled up and get a little predatory on you.”</i> Her hand traces down your flank. <i>“You are one delicious piece of prey, though.”</i>");
	output("\n\nThe conversation dies away, and the two of you get dressed to go on your separate ways. You find yourself on the receiving end of a tonguing kiss before Penny goes back to work, looking more satisfied than you’ve ever seen her.");
	pc.orgasm();
	penny.loadInCunt(pc, 0);
	processTime(75+rand(25));
	pc.shower();
	this.clearMenu();
	this.addButton(0,"Next",mainGameMenu);
}
//Female First Time Shower Sex
public function femaleFirstTimePennyLesboz():void {
	clearOutput();
	showPenny(true);
	output("Stepping into the next room, you hear the gentle sound of a running shower. You follow the auditory trail through another doorway, getting hit by a wave of steam and a view of feminine curves all at once. Penny is standing in a surprisingly large shower stall with the door open and the water running down her back, slicking her fur down so that it shines with the moisture. She beckons you closer, saying, <i>“I don’t bite... much.”</i>");
	output("\n\nYou saunter closer, feeling the telltale moistness of your arousal building in [pc.eachVagina]");
	if(pc.wetness() >= 5) output(", cascading down your [pc.legs] as it passes far beyond what any normal woman could hope produce");
	else if(pc.wetness() >= 3) output(", dripping down your [pc.legs] thanks to your copious secretions");
	output(". Before you’re halfway there, Penny is over the lip of the tub and bounding into you, her water-soaked fur crashing into your [pc.skinFurScales], pressed against your body by her heaving tits. You allow her to take your hand and lead you back to the shower. Her eyes flick ");
	if(pc.tallness >= 66) output("up");
	else if(pc.tallness >= 55) output("over");
	else output("down");
	output(" at you as she leads you into the streams of heated moisture, visibly shivering with delight at the feeling of the water jets on her back. She drops your hand, and you numbly look at the glistening fox, watching drops of water roll across her pebbly nipples, her glossy breasts moving from side to side, hypnotically.");
	
	output("\n\nSuddenly pressing into your lubricated nethers, the vulpine’s fingers splash down in [pc.oneVagina], hooking up inside you to press on your sensitive places, her thumb coming to rest upon ");
	if(pc.totalClits()/pc.vaginaTotal() > 1) output("a ");
	else output("your ");
	output(" clit");
	output(". A smile spreads across her face as your [pc.legs] turn to rubber, and Penny presses herself against you, toying with you while she mouths, <i>“Gotcha.”</i> Her other hand paws at your [pc.fullChest], grabbing ");
	if(pc.biggestTitSize() >= 1) output("a breast");
	else output("a pec");
	output(" and rubbing around the [pc.nipple]. <i>“Now, what to do with my poor, trapped prey,”</i> she says, giggling when her fingers hit a sensitive spot and drop some of your weight into her arms. <i>“Atta " + pc.mf("boy","girl") + ".... I’m going to take you and make you mine... my mate. You don’t mind, do you?”</i>");
	
	output("\n\nYou open your mouth, but as soon as you do, Penny’s thumb graces the sensitive flesh around [pc.oneClit] with steady circles. Her other exposed fingers spread apart your lips, dilating your entrance to better allow her middle fingers to penetrate you. All that escapes your mouth is a pleasured gasp, and it turns into a moan a moment later. You writhe on the pretty fox’s fingers with sensuous need, bucking your [pc.hips] against her for more: more touches, more penetration, more teasing of your nipples. You want it all.");
	if(pc.tallness >= 84) output(" If you were more conscious of the scenario, you’d find it almost comical how the little fennec is supporting your larger frame. Instead, you luxuriate in the moment, leaning back against the wall while Penny helps to keep you on your [pc.feet] in the water.");
	
	output("\n\n<i>“Speak up,”</i> Penny says encouragingly, <i>“I couldn’t hear you. You came into this shower, my little trap, and now you’re not leaving until I’ve made you my mate. Or would you rather remain my prey, to be taken and discarded once you satisfy me?”</i>");
	output("\n\nAll you can manage to do is moan and nod, almost gibbering from pleasure.");
	if(pc.hasNippleCocks()) output(" Your [pc.nippleCocks] reveal themselves a moment later, springing out from your areolae, the flesh of your nipples looking like little more than an a sheath for your strange penises upon your chest. Each of them is already beading pre, and when Penny squeezes one, you almost gush more of the stuff on her arm, a prelude of the [pc.milk] to come. Penny purrs, <i>“Go on, squirt for me, my little mutant pet.”</i>");
	else if(pc.hasFuckableNipples())
	{
		output(" Penny’s fingers soon prod at the tips of your [pc.nipples], finding purchase at their apex that she clearly didn’t expect, judging by the shocked look on her face. She nervously pushes on, and her slender digits are soon sliding into your [pc.nippleCunts], disappearing into the improbable orifices with lewd squelches. You moan louder at this, assaulted by pleasures from sexes above and below, and [pc.milk]y moisture begins to leak out around her probing tips. Penny purrs, <i>“Go on, soak my fingers, </i>");
		if(pc.tallness <= 55) output("<i>little </i>");
		output("<i>pleasure pet.”</i>");
	}
	else if(pc.canMilkSquirt()) output(" [pc.Milk] has started to leak from your nipples, even though Penny barely touches them. She’s only squeezing them every now and again, mainly letting her fingers circle just beyond the areola, gathering up your leaking, lactic lube and smearing it over your breasts, painting them [pc.milkColor] until the water washes it away. Penny purrs, <i>“Should you moo for me, little cow?”</i> You let out more, dripping the stuff.");
	else 
	{
		output(" Your [pc.nipples] are achingly hard by this point, ");
		if(pc.breastRows[0].nippleType == GLOBAL.NIPPLE_TYPE_FLAT) output("even though they have no proper tips, only engorged areolae, ");
		output("and Penny begins to properly work them, gliding her fingers in circles over their soft surface, gripping them between her thumb and index finger, gently tugging or rolling them in between. You gasp, arching your back to allow her better access, and the fox is more than happy to oblige");
		if(!pc.isLactating()) output(", purring, <i>“A pity you don’t lactate, like proper prey.”</i> She pinches, <i>“But, perhaps you might be a worthy mate after all.”</i> Her digits hurriedly work your box, making you moan again. <i>“Maybe not.”</i>");
		else output(". She pinches them and licks her lips as a rivulet of [pc.milkColor] runs down your flesh and dilutes itself in the falling water. Her digits hurriedly work your box, making you moan again.");
	}
	output("\n\nThe fox-girl pushes onward, guiding you down to the base of the tub. She quickly arranges your [pc.legs] to allow her the best possible access to [pc.oneVagina]");
	if(pc.totalVaginas() > 1)
	{
		output(", though she runs a hand over the other");
		if(pc.totalVaginas() > 2) output("s");
		output(", not wanting any part of you to feel left out");
	}
	else output(", admiring its flush, aroused state with a gentle squeeze of her hand");
	output(". You cry out and arch your back, battling momentarily being bereft of sensation and then soaking in lust, knowing only that you need to be touched. There’s a fire raging in your loins, and you know that to quench it, Penny has to give you more. Just as you’re lifting your [pc.hips], ");
	if(pc.totalVaginas() > 1) output("one of ");
	output("your hungry box");
	if(pc.totalVaginas() > 1) output("es");
	output(" is filled with fingers again, though they run over the vulvae before slipping through the curtains of your labia, eventually disappearing entirely into your rabbit hole. You feel yourself climbing up a cliffside, mounting the edge of a precipice involuntarily, pushed by Penny’s noisily pumping hand, her palm grinding the exterior of your sex while the fingers take you higher. You’re shuddering and twitching involuntarily, and you watch your new mate’s smile widen as she pushes you off the cliff.");
	
	output("\n\nYou bite your lip and let your eyes roll back, humping Penny’s hand as it carries you into orgasm. The contractions of pleasure run up from your [pc.feet], through your [pc.legs], across your spasming puss");
	if(pc.totalVaginas() == 1) output("y");
	else output("ies");
	if(pc.totalCocks() > 0)
	{
		output(", into ");
		if(pc.cockTotal() > 1) output("each ");
		else output("your ");
		output("spurting erection");
	}
	output(", over your [pc.belly], and into your [pc.fullChest], causing your whole body to clench and relax over and over again. As you shudder and shake your way through release, the small fennec seems content to continue her ministrations, cooing, <i>“Good " + pc.mf("boy","girl") + ", cum for me.... Such obedient prey.”</i>");
	if(pc.hasCock())
	{
		var cumQ:Number = pc.cumQ();
		output(" A look of irritation covers her face when [pc.cum] ");
		if(cumQ <= 1000) output("stains her fur");
		else if(cumQ <= 2000) output("fills the bottom of the tub");
		else if(cumQ <= 15000) output("turns the tub into a half-full bath");
		else output("floods the entire tub, covering you to your neck and her to her waist");
		output(", but it is soon forgotten once she sees your eyes roll back.");
		if(pc.canMilkSquirt())
		{
			output(" Your milk pours out to join the rest of the fluid in the tub");
			if(cumQ + pc.lactationQ() <= 5000) output(", vanishing down the drain as quickly as it appears");
			else if(cumQ + pc.lactationQ() <= 10000) output(", filling it a little bit higher");
			else if(pc.lactationQ() + cumQ <= 15000) output(", filling it to the brim");
			else output(", pouring out over the sides, wasted");
			output(".");
			pc.milked();
		}
	}
	if(pc.wetness() >= 5) {
		output(" Her hand is drenched with your secretions, suddenly soaked by your squirting cunt");
		if(pc.totalVaginas() > 1) output("s");
		output(". Feeling you gush around her intruding fingers brings a smile to the fox’s face.");
	}
	else if(pc.wetness() >= 2) {
		output(" Her hand is soaked with your copious secretions, coated by your climaxing cunt");
		if(pc.totalVaginas() > 1) output("s");
		output(" secretions. Feeling you leak around her intruding fingers brings a smile to the fox’s face.");
	}
	else output(" Her hand grows even wetter thanks to your orgasmic secretions, and Penny smiles as she feels it happen.");
	pc.orgasm();
	output("\n\nOnly after you’ve finished thrashing orgasmically does the vixen deign to release your sex. You sag down into the tub, luxuriating in the wet heat after experiencing such bliss, but the look on Penny’s face makes it clear that she’s far from done. She steps forward, straddling your chest");
	if(pc.biggestTitSize() >= 20) 
	{
		if(!pc.hasNippleCocks()) output(" and gasping as your mammoth boobs barely fit beneath her");
		else output(" and gasping as your mammoth boobs push your engorged nipple-dicks up to grind against her lower lips");
	}
	output(", making her way up to present her plush, pink pussy your face. Her hand comes to rest affectionately on your head");
	if(pc.hasHair()) output(", stroking fondly through your [pc.hair]");
	output(", and she says, <i>“I showed you what I can do, darling. Now it’s time to return the favor.”</i> As she speaks, her lips redden slightly, and you can tell she’s very horny, not just by the sight but by the smell as well. The fragrant scent of a woman in need is just inches from your nostrils.");
	
	output("\n\nYou let your fingers dive back into [pc.oneVagina]");
	if(pc.vaginaTotal() > 1) output(", a second hand finding another twat to fondle,");
	output(" and demurely lick your [pc.lips], egging the lusty fox on. You even lean up and extend your [pc.tongue], letting it hang out as an open invitation. Penny growls and throws her hips forward, pressing her fur-ringed mound into your face, the top of her folds parting on your nose while the majority of her channel rubs upon your unresisting mouth. She grabs you by the head and pushes harder, grinding her slippery snatch into your face, sliding her lower lips against your upper ones and alternatively releasing assertive growls and pleasured groans.");
	output("\n\n<i>“Ahhhh,”</i> the fennec moans, <i>“I knew that mouth would be good down here, a perfect slit-stuffer, huh, my mate?”</i> She doesn’t allow you to answer her rhetorical question, and instead gyrates in lewd semi-circles on your face. Her tiny button can be felt through her engorged mons, concealed with her small, inner labia behind the puffy, outer portion of her twat. Her juices are both sweet and tangy on your [pc.tongue], and you allow your hungry mouth-muscle to slide into her, burrowing as deeply as you can into her channel.");
	if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) 
	{
		output(" Of course, you have a rather long tongue, so you’ve completely filled her gash with squirming oral appendage in no time flat.");
		if(pc.hasTongueFlag(GLOBAL.FLAG_PREHENSILE)) output(" Your dextrous muscles make it easy to control your tongue inside her, and you coil it so that it can press on all the portions of her walls at once, sliding over every fold and sensitive portion with skilled licks.");
	}
	
	output("\n\nPenny’s pussy isn’t the only one getting attention; your talented fingers have been busy at your crotch, stirring your soaked nethers until they’re ready to go off again. The fennec woman’s juicy slit isn’t far from climax either. Her hot little box is trembling around your tongue, dancing on the edge of orgasm. It’ll just take one little push to send her careening off into sexual ecstasy. You tip your head back and let your nose slip across the hidden bud, pressing just so on it, giving the fox-girl the stimulation her needy cunt is aching for. The reaction is as immediate as it is violent. Penny holds you firmly, grinding herself so hard against you that she must feel your teeth through your [pc.lips], her whole body quaking. Juices drip down your tongue, letting you know that the fennec is far from a squirter, but she’s plenty wet, judging by the way your throat is bobbing as you swallow. You reach another nice climax while your face is used by Penny’s pussy, providing a blissful memory to associate with the taste of her twat.");
	output("\n\nGradually slowing down, Penny’s frenzied humping eventually drains away to nothing, and she slides down your [pc.fullChest], groaning at the passage of each [pc.nipple], eventually perching atop your [pc.belly] in a fucked out puddle of fur. She looks at you through bleary eyes and abruptly kisses you on the lips, tasting herself on you and not caring in the slightest. You kiss her back until you both tire of dueling tongues and simply enjoy feeling the shower washing you clean, both standing to finish the job.");
	output("\n\n<i>“My mate...”</i> Penny muses out loud, <i>“I like the sound of that.”</i> She looks at you with a warm smile, putting an arm around your ");
	if(pc.tallness <= 65) output("shoulder");
	else if(pc.tallness <= 84) output("waist");
	else output("hips");
	output(". <i>“My ");
	if(pc.tallness <= 55) output("little ");
	else if(pc.tallness >= 72) output("big ");
	output("mate. We’ll have to do something like this again, and soon.”</i> She smiles. <i>“It is nice to finally cut loose with someone. I just hope you don’t mind too much when I get all riled up and get a little predatory on you.”</i> Her hand traces down your flank. <i>“You are one delicious piece of prey, though.”</i>");
	output("\n\nThe conversation dies away, and the two of you get dressed to go on your separate ways. You find yourself on the receiving end of a tonguing kiss before Penny goes back to work, looking more satisfied than you’ve ever seen her.");
	processTime(55+rand(25));
	pc.shower();
	this.clearMenu();
	this.addButton(0,"Next",mainGameMenu);
}

//Huge Dick First Time Sex
public function stickAHugeDickInPennysWorld():void {
	clearOutput();
	showPenny(true);
	var x:int = pc.biggestCockIndex();
	output("Stepping into the next room, you hear the gentle sound of a running shower. You follow the auditory trail through another doorway, getting hit by a wave of steam and a view of feminine curves all at once. Penny is standing in a surprisingly large shower stall with the door open and the water running down her back, slicking her fur down so that it shines with the moisture. She beckons you closer, saying, <i>“I don’t bite... much.”</i>");
	
	output("\n\nYou step over the lip of a large basin at the base of the shower, similar to a giant-sized tub, and let the water wash over your nude form. [pc.EachCock] is already suitably hard after the striptease Penny gave you. This is only a problem due to the mass of your [pc.cockBiggest]. It juts hard out in front of you, pressing against Penny’s belly button when you first enter, eager to reach inside her but so big that there’s no way the petite fennec could handle such a big, bitch-breaking fuck-stick. She shifts sideways, dragging it across her moisture-glossed fur inadvertently in a way that makes you groan. No matter how you move, your titanic endowment always seems to butt up against her body, forcing her to acknowledge your dick while simultaneously dulling your wits, flooding your mind with a haze of lustful impulses.");
	output("\n\nGrabbing hold of your [pc.cockBiggest], the fox-girl giggles, pointing it up so that it’s a bit less obtrusive. Her fingers can’t even fully encircle its thickness; the best she can do is lamely heft the shaft, her fingers sinking slightly into the fleshy mast due to its weight. <i>“You know, I had meant to ambush you and take you as my prey, but hung like that...”</i> Penny half growls, half purrs, <i>“...there’s no doubt about it. You’re my mate... my thick... pulsating... monstrously endowed mate.”</i> Penny leans forward to lick you, letting her warm, slippery tongue slide across every vein and feature, her moist nose exhaling panting breaths that wash across the rest of the twitching package.");
	
	output("\n\nYou lean against the wall and grab a nearby shower rung, nonchalantly standing there as the prick-hungry vixen worships your musky tool, rubbing her face against it with great enthusiasm. ");
	if(pc.hasKnot(x)) output("When she sees your knot, she gives it a happy squeeze.");
	else if(pc.hasCockFlag(x,GLOBAL.FLAG_FLARED)) output("When she sees your flare, she licks around the edge of the expanding dick-rim with a happy hum.");
	else if(pc.hasCockFlag(x,GLOBAL.FLAG_NUBBY)) output("When she feels the nubs, she stops and suckles on them one after another, happiness plastered on her face.");
	else if(pc.hasCockFlag(x,GLOBAL.FLAG_STINGER_TIPPED)) output("When she feels the tendrils pricking on her cheek, she gasps and turns, unintentionally getting stung all over her lips. They swell slightly, but her eyelids lower as the aphrodisiac venom sinks in. Her oral service resumes in short order with even greater enthusiasm.");
	else if(pc.hasCockFlag(x,GLOBAL.FLAG_AMORPHOUS)) output("When the heat half-melts your gooey boner, Penny purrs, blowing bubbles over your semi-liquid shaft to happily pleasure it. The bubbly bliss is intimately pleasurable, and Penny seems to greatly be enjoying the goo-play.");
	else output("When she notices you watching, she gives you a happy smile, nuzzling your dick with great enthusiasm.");
	output(" The short auburn hairs of her mohawk tickle your [pc.cockHeadBiggest] occasionally, causing you to jerk back a half-inch involuntarily before your lustful urges reassert themselves, compelling you to get closer and plant your dick back on the fennec’s whorishly-pleased face.");
	
	output("\n\nPenny inches her face to the side so that her hair will stop bothering you, which in turn causes your [pc.cockHeadBiggest] to slide through her soft fur and over the velvety interior of her fluffy ear, pushing it partway back. The sensation summons dollops of pre-cum up from inside you. It oozes out to be sloppily smeared over her auditory orifice’s plush covering, dripping down the side of her cock-obsessed visage quite fittingly.");
	if(pc.balls > 0) output(" Grabbing hold of you by your [pc.sack], a dangerous glint reappears in the fennec’s blue eyes. <i>“Gotcha.”</i> Her fingers sink into the soft skin, just barely squeezing on your [pc.balls]. The touches are firm enough to make you wince, but pleasant enough that Penny’s ear catches a fresh coat of goo. You stand completely stock still; to move would risk injury, and there’s no way you’re getting out of her hand with the grip she has.");
	else if(pc.hasVagina()) output(" Hooking a finger in [pc.oneVagina], she crooks it to press on a sensitive bundle of nerves along the upper interior. A moment later, a second follows, giving her a firm grip on your cooch. <i>“Gotcha.”</i> Penny’s grip is pleasant, but every little movement you make risks twisting or pushing her digits against your sensitive canal unpleasantly. She has you, hook, line, and sinker.");
	else output(" Slipping a finger behind you, Penny inserts the rogue digit into your unprepared anus. You try to pull away, but she curls it upward, hooking inside of you and arresting your movement rather suddenly. There’s a moment of pain, but once you still, you realize that the tip is moving in little circles inside you, orbiting a sensitive spot. You are overwhelmed by anal pleasure.");
	output(" <i>“Mmm, maybe I trapped some prey after all,”</i> the vixen drawls.");
	
	output("\n\nImmobilized by firm fingers in your most tender areas, you have no choice but to let Penny play with your rod");
	if(pc.cockTotal() > 1) {
		output(", though sometimes she licks ");
		if(pc.cockTotal() == 2) output("your other member");
		else output("some of your other members");
	}
	output(", always returning to big, meaty focus of her attentions. She says, <i>“So much meat,”</i> while licking it up from " + pc.sheathDescript(x) + " to [pc.cockHeadBiggest] again and again. <i>“I could just feast on this all day...”</i> The busty vulpine rises up a bit to let the middle of your mast fall between her soaked breasts, lubricated with a mixture of water and your copious drippings, coming harder now thanks to what her busy fingertips are doing down south. Squishy, soft boobs wrap around you from either side. They’re not big enough to fully engulf your [pc.cockBiggest], but they compress quite nicely along your side, caressing you with squishy chest.");
		
	output("\n\nYou groan and pump your [pc.hips] in response, sliding your [pc.cockBiggest] through the chesty valley. ");
	if(pc.cockTotal() == 2) output("Your other penis slips under Penny’s armpit, squeezed into another tight crevice, surrounded by the perfect combination of heat, moisture, and pressure. ");
	else if(pc.cockTotal() > 2) output("Your other penises slip under Penny’s armpits, squeezed into two similar, tight crevices, surrounded by the perfect combination of heat, moisture, and pressure. ");
	output("Slobbering over the tip, Penny kisses it each time it lurches up to the apex of its pistoning motions. Sometimes she swirls her tongue over its entire crown, turning her saliva-oiled muscle into a vortex of salacious delight. You give up a fresh squirt of pre-cum and watch it adhere to the fox-babe’s tongue, stretching into a gossamer strand when you slide away from her increasingly-glazed maw.");
	
	output("\n\n<i>“Too bad... this mammoth... is too beastly... even for me,”</i> Penny comments in between mouth-filling tit-fucks. <i>“I’d love to... feel it... inside me.”</i> The next sound to come out of her mouth is a muffled moan that vibrates through your [pc.cockBiggest] and all the way into your spine, bringing you to the cusp of climax in an instant. Penny realizes this and holds you there, releasing her restraining grip on your ");
	if(pc.balls > 0) output("[pc.sack]");
	else if(pc.hasVagina()) output("[pc.vagina]");
	else output("[pc.asshole]");
	output(" so that she can handle a tit in each hand, bouncing them up and down alternatively. The waves of slick, mammary sensation wash across your pulsating length with such rapidly that your abdomen begins clenching and your dick begins flexing, building to an unavoidable, orgasmic deluge. Penny purrs, <i>“Give it to me, my new mate... my big, hung " + pc.mf("stud","breeder") + ". I want to taste it.”</i>");
	
	output("\n\nYour urethra bulges, first at the base and then at the tip. A moment later, your cum-slit opens up, and a thick jet of [pc.cum] launches forth, straight into the fox-girl’s open maw. Her eyes are twinkling happily while she watches lust consume your mind. Then, the next rope comes and paints her from nose to forehead, causing her to unintentionally blink over her beautiful blue orbs. She holds them closed while you pool cum on top of them, even getting some into her short mohawk.");
	var cumQ:Number = pc.cumQ();
	if(cumQ >= 500)
	{
		output(" You grunt, your [pc.hips] lurching slightly with the spasms of ecstasy rolling through your body, flinging a steady flow of [pc.cum] across the few portions of her muzzle still unpainted. One spurt after another claims those rogue patches of fur, soaking them before sloughing off her cheekbones to drip down her body. The puddle in her maw deepens when a few blobs fall on her tongue and roll on in, but she doesn’t seem to mind.");
		if(cumQ >= 1000) output(" When you adjust your aim and completely fill the orifice with [pc.cum], not much changes. She pushes some out, and big blobs of your ejaculate splatter off her tits. This only serves to give your orgasm-riddled consciousness an idea. You aim lower and soak the nape of her neck, her tits, and then draw a line down her navel towards her unclaimed sex, painting the pink lips in your efflux.");
		if(cumQ >= 3000) 
		{
			output(" [pc.Cum] fills up the tub around your [pc.feet] thanks to your immense virility");
			if(cumQ >= 5000) 
			{
				if(cumQ >= 7000)
				{
					output(", and it just gets higher and higher ");
					if(cumQ <= 10000) output("before thankfully stopping halfway up");
					else output("until you worry it’ll overflow. Thankfully, your worry puts the brakes on your excessive orgasm, cutting it off before you flood the whole bathroom");
				}
			}
			output(".");
		}
	}
	output(" The corners of her mouth twist upward around the [pc.cumColor] puddle filling her mouth, luxuriating in the lewd face-painting you’ve doled out with a happy sigh.");
	
	output("\n\nPenny tips her head back under the shower to wash her eyes clear, making a show of swallowing the portion of your load still in her mouth while she does. <i>“Ahhh, tasty.”</i> She gathers some up on her fingers and makes a show of sucking them clean. All the while, the cascading sheets of cleaning hydration clear her upper body completely. ");
	if(cumQ >= 3000) output("The drain gurgles under the load, but the ocean of love juice and h2o IS lowering. ");
	output("Safe to open her eyes, the fox-girl blinks her sticky eyelids apart, and she growls, <i>“I’m still horny.”</i> Penny rises up out of the accumulated mess, hooking her leg behind yours so fast you that you’re barely aware of what’s going on before you’re falling, dropping straight into her waiting arms. She eases your climax-slackened musculature into a seated position and steps over your torso");
	if(pc.biggestTitSize() >= 1) output(", dragging her puffy, pink pussy across your [pc.nipples] with an agonizingly aroused moan");
	output(". Her soaking-wet cunt gradually finds its way up in front of your [pc.face], dripping water and feminine juices in almost equal measure.");
	
	output("\n\n<i>“I think,”</i> Penny states, <i>“that it’s time for you to return the favor and show my just how good my new mate is at playing prey.”</i> Her eyes twinkle mischievously. <i>“Lick.”</i>");
	//Should I ever feel like making a more dommy fork, this would be a good spot to insert it.
	output("\n\nThe pretty pussy in front of you is tempting enough that you don’t really need much encouragement to dive in. Its outer lips are plush with lust, while the inner labia are small enough to be barely visible in Penny’s current state. Prying her vulvae open, you take a good look at the slippery passage, noting that while her clit is exposed, it is quite tiny, almost undersized. The fox-girl responds to your touches by placing her hands on your head");
	if(pc.hasHair()) output(" and running her fingers through your [pc.hair] affectionately");
	output(", shifting position to rub herself against your digits. She’s so horny, and so very, very wet that you can feel her trembling against your touches.");
	
	output("\n\nYou lean forward, opening your mouth, and explore her interior of her sodden box with your [pc.tongue], letting her walls clamp down invitingly around the intruding muscle. Penny’s controlled demeanor evaporates at that point. She moans, her voice jumping an octave halfway through when your nose brushes her petite clitty. You shift to fit the sensitive buzzer in your mouth while you lick, and ever so gently apply a bit of suction, pumping your [pc.tongue] through her ecstatically trembling tunnel.");
	
	output("\n\n<i>“Oh fuck, [pc.name], ungh... oooohhh, here it comes!”</i> she cries with a forceful thrust of her hips, slamming her twat square against your mouth, grinding her perky little button as hard against you as she can. Her legs tremble wildly, and she holds onto your ");
	if(pc.hasHair()) output("[pc.hair]");
	else output("head");
	output(" for dear life. Your poor [pc.tongue] is ruthlessly squeezed, milked for nonexistent ejaculate while being drenched in tasty girl-cum. There’s enough that you’re swallowing a mouthful of the stuff by the time the fennec’s pleasured twitches finally die down. Her body goes limp at last, the orgasmic bliss finally robbing her of her strength. She slumps down the rest of the way in a fucked-out mess of soaked fur and weakly trembling limbs.");
	
	output("\n\nPenny comes to rest against [pc.fullChest], groaning and nearly insensate. She looks at you through bleary eyes and abruptly kisses you on the lips, tasting herself on you and not caring in the slightest. You kiss her back until you both tire of dueling tongues and simply enjoy feeling of the shower washing you clean, both standing to finish the job.");
	
	output("\n\n<i>“My mate...”</i> Penny muses out loud, <i>“I like the sound of that.”</i> She looks at you with a warm smile, putting an arm around your ");
	if(pc.tallness <= 65) output("shoulder");
	else if(pc.tallness <= 84) output("waist");
	else output("hips");
	output(". <i>“My ");
	if(pc.tallness <= 50) output("little ");
	else output("big ");
	output("mate. We’ll have to do something like this again, and soon.”</i> She smiles. <i>“It is nice to finally cut loose with someone. I just hope you don’t mind that I can’t fit this monster.”</i> Her hand traces down to your crotch. <i>“You are one delicious piece of prey, though.”</i>");
	output("\n\nThe conversation dies away, and the two of you get dressed to go on your separate ways. You find yourself on the receiving end of a tonguing kiss before Penny goes back to work, looking more satisfied than you’ve ever seen her.");
	pc.orgasm();
	processTime(45+rand(25));
	pc.shower();
	this.clearMenu();
	this.addButton(0,"Next",mainGameMenu);
}


//[Species]
public function talkToPennyAboutSpecies():void {
	clearOutput();
	showPenny();
	flags["TALK_WITH_PENNY_ABOUT_SPECIES"] = 1;
	output("Without worrying too much, you ask Penny what species she is. Your codex hasn’t turned up anything, but you’ve never seen someone with her particular features before.");
	output("\n\nThe fox-girl smirks at that. <i>“You don’t say? Well, there’s a good reason for that. Technically, I’m human... or at least I was.”</i> Your surprise must show on your face, because Penny sighs before continuing, <i>“Not everyone wants to be a plain-jane human all their lives, ya know? Sometimes... you want to be something more, or something different.”</i> She drums her fingers on the table, a sound muffled slightly by her fur. <i>“I’d been called foxy before by boys, so I guess I was pretty enough. I just... never really felt comfortable in my own skin. When I learned some actresses had spliced themselves in order to appear inhuman for certain roles, the idea just kind of... hooked inside me.”</i>");
	output("\n\nYou nod understandingly. As gene splicing and modification has become more popular, cosmetic uses for the tech have become more and more common. There’s actually whole communities of modded individuals that have sprung up in some areas of the core worlds. Surprisingly, they haven’t drawn much ire from the rest of the populace. It’s hard to give a crap about folks running around with lizard tails or horse weiners when there’s sentient goo women and four-mouthed horrors running corner shops.");
	output("\n\nSeeing your understanding, Penny prattles on faster and faster, the words tumbling out of her in a rush now that she ");
	if(pc.isNice()) output("realizes you won’t judge her for her choices");
	else output("thinks you won’t judge her for her choices");
	output(". <i>“I’ll admit, I may have seen some racier footage out there on the extranet that gave me the extra push to do this. I mean, what young single girl doesn’t want to be unique and sexy, to literally embody an animal associated with pleasing female forms?”</i> Penny smiles and stretches, arching her back for good measure. <i>“I never really took it seriously until I was in the academy though...”</i>");
	output("\n\n<i>“What happened in the academy?”</i> you ask.");
	output("\n\nPenny answers, <i>“I met someone that was doing it already, and... she loved it. She even changed her name to Kit after her cat ears grew in. I wound up being pretty good friends with her... great friends actually, and I decided I was going to go for it.”</i> The way she talks, it sounds like her and this cat-girl might have been a little more than friends, but you don’t push the issue. <i>“Unfortunately, I didn’t have a nice inheritance from a rich aunt to pay for my changes. Instead, I took the toughest, best paying posts I could.”</i> Penny growls low in her throat. <i>“It was hell, but I stuck it out. I knew what I wanted, and bit by bit, I saved up the cash for some splices.”</i>");
	output("\n\nThe fox-girl curls her left hand into a fist. <i>“I had to take out a huge loan for the rest, but I managed to afford what I wanted: a fox transformation, and not just any fox, a fennec fox.”</i> Her ears flit this way and that. <i>“Not to sound all girly or anything, but don’t fennecs just have the cutest ears?!”</i> They swivel your direction. <i>“First my ears moved up and started reshaping. Then, my face started to elongate, and the fur began growing out. It wasn’t long before I wound up with digitigrade legs and footpaws.”</i> Penny snugs her vest a bit more tightly around her chest wrap. <i>“I actually managed to get some breast enhancement included with it. As a flat-chested asian girl, I always wanted a big pair. Given my vocation, I think I went a bit overboard. I gotta keep the girls packed pretty tight if I want to be able to run or fight worth a damn.”</i>");
	
	output("\n\nYou’re a little stunned by the information she’s piled onto you, but it seems to have lifted the big-eared vixen’s attitude a bit. <i>“" + (!pennyIsCrew() ? "I better get this report filed, [pc.name]. ":"") + "Thanks for listening. It’s nice to get things off your chest every once and a while.”</i> She chuckles at her inadvertant pun" + (!pennyIsCrew() ? " as she turns back to her computer":"") + ".");
	
	//Pass 30m
	processTime(30);
	if(pennyIsCrew())
	{
		clearMenu();
		addButton(0,"Next",pennyCrewTalk)
	}
	else friendPennyTalkMenu(talkToPennyAboutSpecies);
}

//[Do For Fun?]
public function whatDoesPennyDoForFun():void {
	clearOutput();
	showPenny();
	flags["TALK_WITH_PENNY_ABOUT_FUN"] = 1;
	output("You ask Penny what kinds of things she does for fun, besides being the long arm of the law, that is.");
	output("\n\n<i>“Oh, this and that,”</i> she says as she pulls her attention away from her computer. <i>“I used to be really into anime - Japanese-style cartoons. It’s amazing that the art form has stuck around, and there’s something therapeutic about coming home from a day of wrangling drunks, drug-dealers, and criminals to watch magical girls or reluctant heroes firing energy out of their hands like some kind of psychic super hero.”</i> She taps her chin. <i>“There was this one I really liked, Cowboy Star. It was about a bounty hunter and his android sidekick. I really got into it.”</i>");
	output("\n\nYou didn’t expect her to be into such a niche activity, and say as much.");
	output("\n\nThe vixen smirks, <i>“Don’t judge a book by its cover, crazy. That’s far from my only interest. A good game of Tamball and a good glass of wine beats out cartoons just about any day. It just so happens that the season doesn’t run all year, and my team can’t play every day. Maybe I could see if any of the other crazies around town want to throw together a team.”</i>");
	output("\n\n<i>“It couldn’t hurt,”</i> you offer.");
	output("\n\n<i>“I know, but who would we play against? The zil? I need to wait for this planet to get more than a dozen permanent, civilized residents before I try anything like that,”</i> Penny declares. <i>“Other than that, fitness is my real hobby. Being a girl, I’ve got to keep in good shape to take down some of the more burly customers I get. I can run laps around just about everyone I’ve met. The extra animal vitality I’m packing might be helping a little bit with that.”</i> She winks. <i>“That isn’t all, but if you want the whole scoop, you’ll just have to keep coming around and getting me talking until I’m comfortable telling you about my... racier hobbies.”</i>");
	processTime(25);
	friendPennyTalkMenu(whatDoesPennyDoForFun);
}

//Her Youth
public function pennysYouth():void {
	clearOutput();
	showPenny();
	flags["TALK_WITH_PENNY_ABOUT_YOUTH"] = 1;
	output("You ask Penny what she was like when she was younger. Did something motivate her to become a U.G.C. Peacekeeper?");
	output("\n\n<i>“Oh, hell yes something motivated me to be a Peacekeeper,”</i> Penny answers. <i>“I was always a smaller kid. I had small parents who didn’t really get behind the whole gene selection technologies a lot of richer couples take advantage of. I was a genetic roll of the dice, and I came up short. I didn’t have that much trouble for it myself, but I always saw nerdier or fatter kids getting beat up on. I lived in a bad neighborhood too, so witnessing crime was an almost everyday affair.”</i> Penny’s visage hardens. <i>“I was too little to do anything about either one.”</i>");
	output("\n\nThe fennec-girl relaxes as she continues, <i>“I actually got mugged, or near enough to it, as a teenager. A Peacekeeper was passing through the neighborhood and saved my bacon that day. He wasn’t big or particularly strong, just smart and skilled. He had the perp disarmed and stunned before I knew what happened.”</i> Penny smiles enthusiastically. <i>“At that moment, I realized what I wanted to do with my life.”</i>");
	output("\n\nYou ask her if she ran off to join up after that.");
	output("\n\n<i>“Don’t be crazy, crazy. I finished school first before I enrolled. I wanted to protect people, even though I’m not the biggest or the strongest, and the U.G.C. gave me a chance to do that.”</i> Penny beams. <i>“The academy wasn’t easy, particularly not for a small Penny Inoue. I toughed it out all the same. You don’t get to serve law and order if you can’t take a few hits.”</i>");
	processTime(20);
	friendPennyTalkMenu(pennysYouth);
}

//[PC Name]
public function talkToPennyAboutYourself():void {
	clearOutput();
	showPenny();
	flags["TALK_WITH_PENNY_ABOUT_YOURSELF"] = 1;
	output("<i>“So, what do you want to know about me?”</i> you ask");
	if(pc.isNice()) output(" openly");
	else if(pc.isMischievous()) output(" with the corner of your mouth lifted partway into a smirk");
	else output(" expectantly");
	output(".");
	output("\n\nPenny sighs, <i>“Narcissist much?”</i> The mischievous twinkle buried in her eyes exposes the jest’s true nature. <i>“Not that I mind telling anyone just what I think of them. I suppose that’s one of the perks of authority: I get to do it on a daily basis. At least, that’s the case out in backwaters like this. I do still have to guard my tongue coreward - after all, you never know when the youth you’re tongue-lashing is a senator’s son.”</i> Penny chuckles, <i>“Of course I’m not going to fire anti-alien slurs at anyone - not that I ever would. There’s no point in calling anyone a freak when you look like I do.”</i>");
	
	output("\n\nYou clear your throat and give Penny a meaningful look, reminding her that she’s deviated from the original topic.");
	output("\n\n<i>“You’re an impatient cuss, aren’t you, [pc.name]? Alright, fine,”</i> Penny says as she folds her arms across her chest. <i>“I think you’re capable but reckless. I think you’re a little too happy to stick your nose into other people’s thoughts.”</i> Penny’s lips pull back to display surprisingly sharp teeth. <i>“I also happen to think you’d be cute if you’d get taken down a peg or two.”</i> There’s humor behind that, but you get the impression she definitely means what she’s saying. Her blue eyes openly leer at you");
	if(!pc.isNude()) output(", seeming to penetrate beneath your gear with the ease of a freight scanner");
	output(". <i>“Maybe three.”</i>");
	
	output("\n\nBefore you can react, Penny shifts the discussion, realizing that she’s just said some rather unprofessional things. <i>“We need more people like you here in Esbeth - go-getters who aren’t afraid to get their hands or tentacles dirty, people who will help bring this rock up to snuff before a mining syndicate discovers something valuable and levels the jungles to save a few creds.”</i>");
	output("\n\nYou say, <i>“I never took you for an environmentalist.”</i>");
	output("\n\n<i>“I’m not, but that doesn’t mean I want to see this planet turned into some corporation’s whore. God knows enough planets out here on the rim are going to wind up that way,”</i> Penny retorts with an irritated flick of her prodigious ears. <i>“Don’t get me wrong, I hope we find a place in the galactic economy. I just hope that Mhen’ga climbs to prominence on hard work and responsibility, not as some corporation’s cash cow.”</i>");
	output("\n\nOnce more, you direct Penny’s attention to you, asking her if she has anything else to say about you.");
	
	output("\n\nEars standing straight up, Penny bristles, <i>“No, I think I’ve said it all. Now, unless you have something else to discuss, I do have work to do, you know.”</i> You shrug, letting the conversation end, but before you can go anywhere, Penny looks back up at you again. <i>“Come back soon, okay crazy?”</i>");
	processTime(20);
	friendPennyTalkMenu(talkToPennyAboutYourself);
}
	
//Girlfriend Greetings
public function approachGirlfriendPenny():void {
	clearOutput();
	showPenny();
	if(penny.isBimbo())
	{
		approachBimboPenny();
		return;
	}
	//Cumslut approaches
	if(pennyIsCumSlut()) 
	{
		//REPEAT GREETINGS:
		//IF TOLD TO KEEP IT SECRET:
		if(flags["PENNY_HIDING_CUMSLUTTERY"] != undefined)
		{
			output("You approach the desk Penny normally works at, but she herself is nowhere to be seen. Before you wonder too long about what is happening however you hear her voice emerge from underneath. <i>“Just a minute!”</i> she calls. <i>“I just, uh, dropped something down here!”</i>");
			output("\n\nBending yourself down, you catch sight of her snout peaking out from under her desk to sneak a look at you. You wave with a joking politeness, and she responds with a sigh of relief.");
			output("\n\n<i>“Oh, thank goodness it’s you, [pc.name]. Hold on a bit - I just had to blow a load down here when someone else just </i>refused<i> to leave. Give me a minute to clean it all up.”</i>");
			output("\n\nYou tell her to take her time, and accordingly you soon hear a series of lewd slurping noises as she proceeds to lap up all her spent cum. Despite her claims of only needing a minute, it’s actually more like three by the time she finally works herself back up onto her chair with a contented grin on her face.");
			output("\n\n<i>“Now, [pc.name],”</i> Penny says happily, <i>“what can I do for </i>you<i>?”</i> After locking eyes with you for a moment you hear the familiar thump of flesh contacting wood beneath the desk. <i>“After all,”</i> Penny continues seamlessly, <i>“it seems like you’re already doing something for me...”</i>");
			output("\n\nIt looks like she’s up for just about anything - including being under control enough to just talk, if you’d prefer. That said, despite how much you’ve worked her into being a nice little submissive, from the look in her eyes she’d be just as comfortable going back to being on top. If you let her, of course.");
			//[Give all normal Penny girlfriend menu. Include new cumslut sex options and talk to change her cumslut status (keep it secret/let others watch/join in)]
			if(flags["SEEN_PENNY_HIDE_CUMSLUTTERY"] == undefined) flags["SEEN_PENNY_HIDE_CUMSLUTTERY"] = 1;
			//Repeat times can unlock her giving you panties!
			else if(needPennyPanties())
			{
				acquireCumslootPennyPanties();
				return;
			}
		}
		//IF TOLD TO LET OTHERS WATCH
		else if(flags["PENNY_LETTING_OTHERS_WATCH_CUMSLUTTERY"] != undefined)
		{
			output("Penny looks up at you as you come close, the edges of her lips curling upwards in a smile before she turns back to focus on her cock. Giving herself an abrupt jerk from under the table, you watch as her massive shaft shudders, her cock head pulsing as she blasts a fresh load down her throat. After simply sucking dreamily at it for a few moments her tongue springs into well-practiced action, sweeping up any of the missed cum quickly and expertly.");
			output("\n\nWhen she’s finally done she looks back up at you, smacking her lips softly to separate the thick strands of drool that still connected her to her cock. <i>“Sorry for the fast finish,”</i> she purrs, <i>“but I didn’t want to try talking to you with my mouth full.”</i>");
			//FIRST TIME ONLY:
			if(flags["PENNY_BEEN_IN_WATCH_CUMSLUT_MODE_AND_BLOWN_IN_FRONT_OF_PC"] == undefined) 
			{
				output("\n\nShe settles back in her chair, which you only notice now is sitting high enough that it keeps her entirely above the desk, so that now as she relaxes her entirely-unrestrained cock simply settles down on top of it. It seems she’s reorganized her work space so that she’s completely on display, whether she’s actively masturbating or not.");
				output("\n\nNoticing you taking that in, Penny smiles. <i>“Like the new set up?”</i> she asks. <i>“I sure do.”</i>");
				flags["PENNY_BEEN_IN_WATCH_CUMSLUT_MODE_AND_BLOWN_IN_FRONT_OF_PC"] = 1;
			}
			//Repeat times can unlock her giving you panties!
			else
			{
				if(needPennyPanties())
				{
					acquireCumslootPennyPanties();
					return;
				}
			}
			output("\n\nShe gives her shaft a long lazy stroke as she looks up at you. <i>“So lover, what do you want to do?”</i>");
			output("\n\nIt looks like she’s up for just about anything - including being under control enough to just talk, if you’d prefer. That said, despite how much you’ve worked her into being a nice little submissive, from the look in her eyes she’d be just as comfortable going back to being on top. If you let her, of course.");
			//[Give all normal Penny girlfriend menu. Include new cumslut sex options and talk to change her cumslut status (keep it secret/let others watch/join in)]
		}
		//IF TOLD TO LET OTHERS JOIN IN
		else
		{
			//FIRST TIME ONLY:
			if(flags["SEEN_PENNY_BE_A_GANGBANG_SLUT"] == undefined)
			{

				if(pc.isNice()) output("You genuinely consider waiting, but given that you don’t live here you just don’t have the time, and at this rate it seems like you’d never be able to see Penny again. You apologize profusely to the person getting up to head in next, saying it’s important, and thank them heartily when they let you go in ahead of them.");
				else if(pc.isMischievous()) output("You consider waiting, but you really don’t have time for that. Intercepting the person just getting up to head in now you tell them that you’re on official police business, and they sit back down meekly and let you go in first.");
				else output(" You definitely don’t have time to wait, so without much thought you whip out your weapon and yell, <i>“Emergency! Emergency!”</i> sprinting in through the door to Penny’s office before anyone else can react.");
				output("\n\n");
				output("Inside you find Penny sitting happily naked at her desk, her fur positively dripping with dozens of different colors of cum. She’s absorbed in sweeping up the biggest concentrations of it while you approach, scooping it eagerly into her mouth and then blissfully licking her hands clean. It’s only when you’re right next to the desk that she actually notices you, her face breaking into a satisfied smile.");
				output("\n\n<i>“[pc.name]!”</i> she cries happily. <i>“I hope you didn’t wait long, I’ll make sure to let folks know to always let you pass when you arrive in the future. What do you think of the new set up though?”</i> She indicates the foyer with a wave of one hand, her other still preoccupied with gathering up the spunk she’s coated with and feeding it into her mouth. <i>“I - mfmm - I figured that if I was going to get myself coated with cum, I might as well be organized about it. Plus, crime is </i>way<i> down. Turns out people are confessing to pretty much anything just to have an excuse to come in here. Or they were at first, anyway, before they realized that wasn’t necessary. Even so, just having this communal stress relief seems to have done a world of good.”</i> She pauses for a moment as nods her head down towards her massive cock, sitting entirely exposed on top of her desk. <i>“Of course, it also helps that people know about this big guy here, so they know I can dish it out as good as I can take it if needs be.”</i>");
				output("\n\nShe gives a predatory grin, shuddering as she rubs one hand slowly along the length of her shaft.");
			}
			//REPEAT ENCOUNTERS:
			else 
			{
				//Repeat times can unlock her giving you panties!
				if(needPennyPanties())
				{
					acquireCumslootPennyPanties();
					return;
				}
				output("You walk past the people waiting for Penny, getting yourself more than a few envious looks in the process. Inside Penny is again relaxing happily naked on her chair, a new and interesting kaleidoscope of cum coating her bare fur.");
				output("\n\n<i>“[pc.name]!”</i> she calls out happily when she sees you, idly stroking her shaft along the top of her desk.");
			}
			output(" <i>“Let me just wash all this off quickly");
			if(pc.hasCock()) output(" - it wouldn’t do to mix your cum in with all the rest here");
			output(".”</i>");
			output("\n\nBefore you can respond she launches herself out of her chair and disappears into her back room, where you hear the sudden noise of a high-pressure shower system starting up.");
			//FIRST TIME ONLY: 
			if(flags["SEEN_PENNY_BE_A_GANGBANG_SLUT"] == undefined) 
			{
				output(" She must have had that hooked up specially for when she needed to look presentable in a hurry, you figure.");
				flags["SEEN_PENNY_BE_A_GANGBANG_SLUT"] = 1;
			}
			output(" In a surprisingly brief amount of time she re-emerges, having gone through an equally fast blow-dry to emerge clean and fluffy. If not for the way her massive cock drips with pre-cum as she absently strokes it, you’d be hard-pressed to connect this cute fennec with the cum-hungry slut that was sitting here moments ago.");
			output("\n\nNoticing your stare, Penny gives a sly grin. <i>“Would you like to corrupt this poor, innocent little fox");
			if(pc.hasCock()) output(" with your delicious cum");
			output("?”</i> she teases. <i>“Or do you have something else in mind?”</i>");
			output("\n\nIt looks like she’s up for just about anything - including being under control enough to just talk, if you’d prefer. That said, despite how much you’ve worked her into being a nice little submissive, from the look in her eyes she’d be just as comfortable going back to being on top. If you let her, of course.");
			//[Give all normal Penny girlfriend menu. Include new cumslut sex options and talk to change her cumslut status (keep it secret/let others watch/join in)])
		}
	}
	//NORMAL APPROACHES!
	//Actual approach: 
	else if (!penny.hasCock()) 
	{
		output("Penny glances up at you with a knowing smile, <i>“How’re you doing, my </i>");
		if(pc.tallness >= 66) output("<i>big, </i>");
		output("<i>crazy</i>");
		if(pc.tallness <= 55) output("<i>, little</i>");
		output("<i> mate?”</i>");
		//Lusty:
		if(penny.lust() >= 66) output(" Her voice is rife with affection, and she doesn’t hesitate to add, <i>“I know I’ve been wondering when you’d stop in. Maybe being exposed to those zil so much did something to my libido, but I’m up for a little jailhouse rock, if you catch my meaning.”</i>");
		else output(" Her voice is rife with affection, but she soon turns business-like. <i>“Need anything? I’m a bit busy but I can usually find time for you.”</i>");
	}
	//Actual Approach:
	else
	{
		output("Penny’s fluffy tail wags behind her, faster and faster the closer you come. When you’re right in front of her desk, she looks up at you with a lusty look and admits, <i>“I was just thinking of how much I enjoyed using this with you, my mate.”</i>");
		//Max size {17-20}
		if(penny.longestCockLength() >= 17) output(" There’s the sound of fabric starting to rip, cut short by the sound of a zipper and the heavy thud of flesh contacting wood. Penny sighs and looks at you meaningfully. <i>“I’m not sure making it so big was a great idea...”</i> Her voice trails off as one of her hands moves under the desk. <i>“It does feel nice, of course.... Did you come by to get cavity searched?”</i>");
		//Normal size {10-16”}
		else if(penny.longestCockLength() >= 10) output(" A quiet, stifled groan starts in her throat after her admission, and Penny scoots a little lower in her chair, hiding what can only be a nice, big bulge beneath the desk. The groan turns into a whimper, and then you hear the zipper on her trousers lowering. Gasping with relief, the fennec makes love to you with her eyes and offers, <i>“Up for being violated by your favorite prison guard?”</i>");
		//Small size
		else output(" There’s the quiet sound of a zipper opening from beneath the desk. <i>“Did you want to play with the toy you talked me into getting? I must admit, I’m rather taken by the little guy.”</i>");
	}
	if(flags["BADGER_QUEST"] == 1)
	{
		output("\n\n<b>This is who Dr. Badger wanted you to ‘deal with’ for her. You could talk with Penny about this, and see what her opinion is on the subject, or you could just go ahead and zap her.</b>");
	}
	processTime(1);
	pennyGirlfriendMenu();
}

public function pennyGirlfriendMenu():void
{
	clearMenu();
	this.addButton(0,"Talk",talkToGirfriendPenny);
	if(pc.lust() >= 33) this.addButton(1,"Sex",pennySexMenu);
	else this.addDisabledButton(1,"Sex","Sex","This choice requires lust at or above 33.");
	
	if(!drBadgerImprisioned())
	{
		if(!pennyRecruited())
		{
			// Go Whine to Penny that a Mustelide was Mean to You
			// PC must have encountered Doc Badger, haven’t turned Penny into a useless cumslut
			// Add [Badger Help] to Penny’s talk menu
			if(flags["NO_REPORTING_DOC_BADGER"] != undefined) addDisabledButton(2,"ReportBadger","Report Dr. Badger","You’ve decided not to turn in Doctor Badger.");
			else if(flags["MET_DR_BADGER"] != undefined) addButton(2,"ReportBadger",whineToPennyCauseYerABitch,undefined,"Report Dr. Badger","That Doctor Badger thought she could get the best of you... Time to turn the tables the right way: by bringing the hammer of the LAW down on her.");
			else addDisabledButton(2,"Locked","Locked","Someone would have to do something illegal to you to unlock this button...");
			// Penny has the doc's raygun
			if(flags["BADGER_QUEST"] == -1 || flags["BADGER_QUEST"] == -2)
			{
				addDisabledButton(2,"ReportBadger","Report Dr. Badger","Why would you report Dr. Badger when you and Penny are planning to give her a taste of her own medicine?");
			}
			// Mission complete
			if(flags["BADGER_QUEST"] == -3) addDisabledButton(2,"ReportBadger","Report Dr. Badger","Why would you report Dr. Badger when you’ve turned her into your big-breasted, bimbo badger fucktoy?");
		}
		if(flags["BADGER_QUEST"] == 1)
		{
			if(flags["NO_ZAP_PENNY"] == undefined) 
			{
				if(flags["PENNY_BADGER_WARNED"] == undefined) addButton(2,"Zap Penny",surpriseZapPennyWithBimboRay,undefined,"Zap Penny","This seems like a jerk move, but if nothing else you can be pretty sure she’ll probably enjoy the end result, as will you.");
				else addButton(2,"Zap Penny",zapPennyAfterWarningHer,undefined,"Zap Penny","Go ahead and zap Penny with the Bimbo Raygun, now that it seems like she approves.");
			}
			else addDisabledButton(2,"Zap Penny","Zap Penny","Now that you’ve tipped her off, it’ll be impossible to catch her with her guard down.");
			addButton(3,"BadgerWarn",warnPennyAboutDoctorBadgersNefariousSchemes,undefined,"Warn Her About Dr. Badger","Penny would probably have some opinions about Dr. Badger’s plan. Who knows, maybe she’d be into it, or maybe she’ll have some ideas about how to turn the tables on Dr. Badger instead.");
		}
	}
	else addDisabledButton(2,"ReportBadger","Report Dr. Badger","You already turned in Doctor Badger.");
	// IQ B-Gone
	if(!pennyRecruited() && pc.hasItemByClass(IQBGone)) addButton(4,"IQ B-Gone",turnInIQBGoneToPenpen,undefined,"IQ B-Gone","Turn in the IQ B-Gone you got from Dr. Badger’s lab.");
	
	if(pennyRecruited()) addButton(5, "Join Crew", pennyRejoinCrew, undefined, "Join Crew", "Ask Penny to rejoin your crew and move back into your ship.");
	else
	{
		//[=Cave=]
		// Add this button after having spoken to Penny about getting the Oxonium.
		// Tooltip: Set off for the cave full of Oxonium that Penny had told you about.
		if(flags["PENNY_CREW_ASKED"] == 1) addButton(5,"OxoniumHunt",startPenpenQuest,undefined,"Oxonium Hunt","Help Penny score that Oxonium, pay of a bunch of her debt, and convince her to join your crew.");
		if(flags["PENNY_CREW_ASKED"] == 3) addButton(5,"Recruit",recruitPennyOfferFinal,undefined,"Recruit","Now that you’ve excavated the cave full of Oxonium, maybe Penny will be more receptive to the possibility of joining your crew?");
		if(pennyIsCumSlut()) addButton(5,"Recruit",recruitCumslutPenny,undefined,"Recruit As Camwhore","Since Penny’s already spending most of her time jacking off, why not join you in the stars and get to indulge 100% of the time?");
	}
	
	this.addButton(14,"Back",mainGameMenu);
}


//Talk to Girlfriend Penny
public function talkToGirfriendPenny():void {
	clearOutput();
	showPenny();
	output("You tell Penny you just want to talk about something today.");
	output("\n\n<i>“Well, I suppose we can do that for now,”</i> she says");
	if(penny.lust() >= 66)
	{
		if (penny.hasCock())
			output(", shifting in her seat as she tries to settle her rambunctious third leg down");
		else 
			output(", wiggling a little uncomfortably as she tries to suppress her arousal");
	}
	output(". <i>“I’m pretty much an open book for you at this point, my mate.”</i> Penny’s tail wiggles up alongside her like a snake-charmer’s viper. <i>“Though you could always touch my fluffy tail instead of talking.”</i> She smirks and waves it back and forth as she awaits your response.");
	//[Her ‘Species’] [Happy?] [Goals] [TouchFluffyTail]
	this.clearMenu();
	this.addButton(0,"Her ‘Species’",askGFPennyAboutSpecies);
	this.addButton(1,"Happy",isGFPennyHappy);
	this.addButton(2,"Goals",goalsForGFPenny);
	this.addButton(3,"TouchFluffTail",touchFluffyTail);
	if(flags["HAD_PENNY_GOAL_CHAT"] == 1) this.addButton(4,"Futanari",pennyFutanariTalk);
	else addDisabledButton(4,"Futanari");
	if(flags["PENNY_THROBB_PURCHASE_UNLOCKED"] == 1) this.addButton(5,"Buy Throbb",buySomeThrobbFrompenny);
	else addDisabledButton(5,"Buy Throbb","Buy Throbb","You need to talk to Penny about futanarification before you can buy this from her.");
	if(pennyIsCumSlut()) addButton(6,"Cumsluttery",pennyCumslutterMenuTalk);
	else addDisabledButton(6,"Cumsluttery");

	if(flags["PENNY_CREW_ASKED"] != undefined && flags["PENNY_CREW_ASKED"] > 1) addDisabledButton(7,"Recruit Her","Recruit Her","You’ve already had this talk. Having it again won’t do anything.")
	else if(flags["HAD_PENNY_GOAL_CHAT"] == undefined) addDisabledButton(7,"Recruit Her","Recruit Her","You’ve been playing with a thought ever since you first had sex with Penny and she called you her mate, but you think it’d be safer if you could lead into it through conversation....");
	else if(pennyIsCumSlut()) addDisabledButton(7,"Recruit Her","Recruit Her","Recruiting Cumslut Penny is not currently supported.");
	else addButton(7,"Recruit Her",fuckedPennyRecruitmentInvite,undefined,"Recruit Her","Penny said something <i>very</i> interesting to you when you asked her what her plans for the future are. If you’re going to ask her more about it, now would be the time....");
	this.addButton(14,"Back",approachGirlfriendPenny);
}

//[Touch Fluffy Tail]
public function touchFluffyTail():void {
	clearOutput();
	showPenny();
	output("You look at Penny, then back at her tail... then back at her for a split-second before zeroing back in on her soft, twitching, posterior adornment. Your hand reaches out almost of its own volition, creeping closer and closer to the wiggly brush. Darting back, the tail stays just out of reach, forcing you to edge closer and closer until you’re leaning partway over the desk and stretching past Penny’s shoulder. You strain a little farther, and finally, you make contact with the some of the softest, fluffiest fur you’ve ever felt.");
	output("\n\nPenny grins and grabs hold of your wrist and shoulder, snarling, <i>“");
	if(silly) output("You’ve just activated my trap card,");
	else output("Gotcha!");
	output("”</i> before springing out of her chair and over the table, crossing the distance between you in a flash");
	if(penny.hasCock() && penny.longestCockLength() >= 10) output(", her swollen meat swinging freely between her legs, pulsating merrily");
	output(". She crashes into your core with enough force to stagger you off-balance and carry you to the floor, landing hard with the victorious vixen atop you");
	if(penny.hasCock())
	{
		output(", her throbbing cock ");
		if(penny.longestCockLength() < 10) output("lewdly pressed against the underside of your chin");
		else if(penny.longestCockLength() < 17) output("sliding lewdly across your cheek");
		else output("lewdly draped across your face, forcing you to catch your breath with the scent of her sex in your nose");
	}
	output(". One of her hands is ");
	if(pc.hasCock() || pc.hasVagina()) output("at your groin");
	else output("grabbing your [pc.butt]");
	output(" almost immediately, rubbing your most sensitive places with knowing caresses.");
	
	output("\n\n<i>“Now, my prey, I think it’s time you...”</i> Penny leans over, bending almost double to put her face next to your ear, <i>“...satisfy the predator, don’t you think?”</i> The ‘k’ in think is punctuated by the sound of her jaws snapping closed.");
	output("\n\nIt looks like Penny has got you where she wants you. What do you do?");
	pc.changeLust(15);
	//Display sex menu.
	pennySexMenu(false);
}

//[Her ‘Species’]
public function askGFPennyAboutSpecies():void {
	clearOutput();
	showPenny();
	output("<i>“My ‘species’?”</i> Penny asks. <i>“You want to hear more then?”</i>");
	output("\n\nYou nod and motion for her to go on.");
	output("\n\nIdly playing with her ear, the tawny fox mulls it over until her eyes light up. <i>“There are some things I wasn’t comfortable telling you about before that you might like to hear.”</i> She winks knowingly and pulls back on her vest to display the curves of her breasts to you. <i>“My libido definitely spiked with the size of my boobs. That was one thing I didn’t mind at the time, but it’s been a pain in my ass ever since.”</i> During the discussion, one of her hands had begun to squeeze at a breast, pawing at the plush orb. She tears it away with a look of infinite irritation. <i>“It’s hard as hell when you take down some muscly hunk, really pin him to the ground, and all you want to do is shag his balls off instead of dragging him back to a cell. I’ve gotten pretty damned good at reining myself in as a result.”</i>");
	output("\n\nYou suppose that explains why she was fingering herself at her desk so often when you met her.");
	output("\n\n<i>“No,”</i> Penny asserts, <i>“That was my sex drive combined with alien fuck pheromones. I may not have shown it, but I was pretty much in heat from breathing in so much of their musk. The only way to keep my head was with a steady diet of climaxes. So, I did what I had to do. I spent so much time schlicking that I gave up on running to the restroom to hide it after the first few hours. Turns out that fingerfucking yourself in between report pages is one way to get through the day.”</i> Penny casually runs her tawny hand through her close-cropped mohawk. <i>“It’s not really an approved tack, though.”</i>\n\n");
	
	if(pc.isNice()) output("That’s quite the confession! You had no idea she had so much trouble with her baser urges and ask her if there’s anything else about the transformation that she held back.");
	else if(pc.isMischievous())
	{
		output("That’s a hell of a confession! You ask her if she’d like you to see if you can synthesize some zil pheromones for " + pc.mf("cologne","perfume") + ". Penny’s response is a slow, salacious lick over the periphery of her mouth, glossing her lips with a clear invitation. Well, that might be something to try if you can ever get your hands on them! Back to the matter at hand, you ask her if there were any other changes she’d like to share.");
	}
	else output("Well, maybe you should have flirted a bit more heavily back then. You could have gotten this vixen wrapped around your finger a great deal more quickly. Smirking, you ask her if there’s any other tidbits she held back.");
	
	output("\n\nPenny is quick to answer. <i>“That’s the main one. I also found myself eating a LOT more protein.”</i> ");
	if(pc.hasCock()) output("Seeing the look on your face she shouts, <i>“NOT THAT KIND!”</i> ");
	output("The fox-girl flashes you a toothy smile. <i>“Squirrel, rabbit, beef, Teladren meat beast.... If it was once alive, it probably tastes great to me now.”</i> Scratching under her ear, she comments, <i>“It’s hard as hell to getting a food splicer here to make decent, rare steak. I swear to god, I’m going to learn how to program one just so I can get a good meal out here.”</i>");
	output("\n\nLeaning back, the vixen flashes you an easy smile. <i>“That’s the long and short of it. I got turned into a sexy, busty, nympho predator bitch. And I love it.”</i>");
	output("\n\nYou return an affable grin.");
	
	output("\n\n<i>“Be sure and let me know if you want a roll in the hay later, okay? </i>");
	if(!penny.hasCock()) output("<i>I may not always be horny, but it’s worth getting a little riled up to have a clear head later,</i>");
	else output("<i>You know how I feel about fucking: the more the better. And thanks to you, I have the best tool to do it with,</i>");
	output("<i>”</i> Penny offers" + (!pennyIsCrew() ? " as she turns back to her job":"") + ".");
	clearMenu();
	processTime(25);
	if(pennyIsCrew()) addButton(0,"Next",pennyCrewTalk);
	else addButton(0,"Next",approachGirlfriendPenny);
}

//[Happy?]
public function isGFPennyHappy():void {
	clearOutput();
	showPenny();
	output("<i>“Am I happy?”</i> Penny answers with another question. Scratching at her chin, she mulls it over for a moment. <i>“No, not really.”</i> The fennec chuckles. <i>“Is anybody? I don’t know, but I don’t think it’s in human nature to ever be truly happy. We’re happy when we get what we want, and then we get used to it. Then we feel exactly the same again and find something new to want. Contentment just isn’t something we’re built for as a species, ya know?”</i>");
	output("\n\nThat’s a little depressing to hear. You mention that after all she’s gone through, she ought to be at least a LITTLE happy to have reached her goal.");
	output("\n\nSighing, the fox-girl looks you dead in the eyes. <i>“Don’t get me wrong, I AM happier, really. That doesn’t mean everything is perfect. I’d love to be getting a big fat paycheck for what I do. I’d be thrilled if I could feel like I’m doing more than running a glorified drunk-tank, or if I didn’t also feel that I’m the only decent line of defense between these folks and a nasty wasp orgy.”</i> Moisture beads at the corners of her eyes. <i>“The truth is... everything is pretty great. I look great, I found myself a cute mate, and we’re making some real headway with the town now. It’s hard to hate the place when there’s people like you and Flahne helping me out.”</i>");
	
	output("\n\nPenny props her chin on her fist and leans over her desk at you. <i>“Is that more the answer you were looking for, mate?”</i>");
	output("\n\nThere’s really nothing to do but nod at that.");
	output("\n\n<i>“Good. People like you and me, we make a difference, even if we have to slog through shit sometimes to do it,”</i> Penny quips. <i>“Now, I have to do some checks on the calibrations of the turrets, but holler at me if you need anything else.”</i>");
	processTime(25);
	this.clearMenu();
	this.addButton(0,"Next",approachGirlfriendPenny);
}

//[Goals]
public function goalsForGFPenny():void {
	clearOutput();
	showPenny();
	output("<i>“My goals?”</i> Penny muses. <i>“That’s a good question.”</i> The fox-girl drums her fingers on the table, clicking noisily thanks to her claw-like nails. <i>“First and foremost: I need to pay off my debts. Another five years in this post and I’ll finally be out from under my bank’s thumb. My credit might even be good enough at that point to finance a place of my own. U.G.C. standard issue bunks aren’t the most comfortable thing in the universe, ya know.”</i> She idly rubs her back for emphasis.");
	output(" Looking at her chest, you aren’t sure her back pain is entirely due to her sleeping accommodations, but keep it to yourself for now.");
	output("\n\n<i>“Anything else?”</i> you ask.");
	output("\n\nPenny puffs out her chest proudly. <i>“I’m gonna keep training in my off time until I’m the best damned fighter on the planet... as much as that would mean.”</i> She pulls out one of her tonfas and flicks it around expertly, slamming the nightstick-like weapon down onto her table with an accompanying crackle of electricity. <i>“Sometimes it takes more than a kinetic hit to drop a criminal,”</i> she explains. The smell of ozone hangs in the air while Penny puts her weapon away. <i>“I’m not taking a club to a gunfight either. If need be, I’ve got sentry turrets up all over town and a locker full of guns I can get to without much fuss.”</i>");
	output("\n\nYou ask, <i>“What if someone else shoots first, when you aren’t near the station?”</i>");
	
	output("\n\n<i>“I’ve got a pretty great shield to cover my tail while I get away then,”</i> Penny replies. <i>“People are a little more comfortable around you without a gun. Besides, this isn’t some gang-filled ghetto - at least, not yet. We’re still small enough that it’s pretty hard for me to be far away from the office. You won’t catch me out in the jungle.”</i> Penny explains, <i>“I don’t think I’d get to come back. I’d probably be hugging a tree while those wasp-looking assholes took turns drilling my holes.”</i>");
	
	output("\n\nChuckling at that, you ask if she had any other goals she meant to discuss before the discussion got sidetracked.");
	
	output("\n\nBiting her lip, the vixen considers for a moment. <i>“Nah, I don’t think so. Get things paid for, train, and maybe make enough scratch to get a comfy place to call my own.”</i> Her eyes twinkle mischieviously, <i>“Maybe someday I’ll let someone talk me into being a wife and not a mate. Heck, maybe I’ll go nuts and decide to retire to chase adventures with you among the stars.”</i> She shakes her head. <i>“No sense worrying about that now. Esbeth needs me here.”</i>");
	if(!penny.hasCock()) output("\n\n<i>“Oh!”</i> Penny adds, <i>“There was one other thing I’ve been thinking about.”</i> She wrings her hands. <i>“It’s a little weird, but I’ve been entertaining the idea of growing myself a cock. Maybe we should talk about that later, though.”</i> Her eyes flick back to her monitor. <i>“I probably need to get back to work. Give me a yell if you need anything else, [pc.name].”</i>");
	processTime(25);
	this.clearMenu();
	flags["HAD_PENNY_GOAL_CHAT"] = 1;
	this.addButton(0,"Next",approachGirlfriendPenny);
}

//[WhatSheLookedLikeB4]
public function whatSheLookedLikeBFour():void {
	clearOutput();
	showPenny();
	output("<i>“What I used to look like?”</i> Penny asks. <i>“Mousy little asian girl, about yay tall.”</i> She motions with her hand, indicating a slightly shorter girl. <i>“Slanted eyes, olive skin, pitch-black hair. You know the look. I looked different from most folks, but I don’t know, I always felt kind of frumpy and plain.”</i> She nervously scratches at the tip of one expansive ear. <i>“Oh, I nearly forgot. I can probably dig up an old pic of myself off the extranet. Give me a moment.”</i>");
	output("\n\nPenny turns to her computer and begins to click away in a frenzy, pounding out access codes one after another as she searches for records of her previous self. Her tail is flicking back and forth like a metronome as she works. <i>“One more... hang on,”</i> she says. Clattering one last time, her fingers work the cheap keys over, and the fox-girl announces, <i>“Done!”</i>");
	output("\n\nSpinning the monitor around, Penny shows you what she looked like. The picture on screen is... well, cute. A pretty nice looking asian girl. She was more attractive than she gives herself credit for.");
	output("\n\n<i>“See? I told you,”</i> Penny says with a smile. <i>“Not much to look at it.”</i>");
	output("\n\nYou scratch your chin as you look at it, lost in thought. She’s changed so much....");
	output("\n\nPenny swivels the monitor away from you and swiftly closes the image. <i>“That was me.”</i> She runs her hands up her front, emphasizing the size of her rack and her sinuous curves. <i>“Now, this is me.”</i> She cocks an eyebrow at you. <i>“Any questions?”</i>");
	output("\n\nNone.");
	output("\n\n<i>“Good, now let me get this requisition typed up.”</i> She winks at you. <i>“Just holler up when you need something.”</i>");
	processTime(25);
	this.clearMenu();
	this.addButton(0,"Next",approachGirlfriendPenny);
}

//[Futanari] - Option to have her go futa!
//Requires her mentioning futa already!
public function pennyFutanariTalk():void {
	clearOutput();
	showPenny();
	if (flags["PENNY_FUTA_TALK"] == undefined && !penny.hasCock())
	{
		flags["PENNY_FUTA_TALK"] = 1;
		output("<i>“Grow a dick?”</i> Penny states with a dumbfounded look. Ears flattening back on her head, she admits, <i>“I did mention that, didn’t I?”</i>");
		output("\n\nYou nod expectantly.");
		output("\n\nThe fox-girl snorts and sets some paperwork aside in a huff, swivelling her chair to more directly face you. She searches your eyes for something for a long moment before talking. <i>“Yeah, I guess... I was thinking about it....”</i> Penny’s ears gradually rise again. <i>“The girl I told you about at the academy... she had one, and all things considered, she was pretty happy with it. Once we got comfortable, she kept finding excuses to show it to me. She even let me watch her masturbate!”</i>");
		output("\n\nCoughing nervously, the vixen adds, <i>“I thought a vagina was plenty enough to please, but watching her hands dance over two sets of genitals.... I think I might want one too, [pc.name]. It was dirty and decadent and wet in all the right ways. You should see the way she squirted - from both holes!”</i> Penny’s breathing has gotten heavier from recounting this sordid tale, though her nipples have yet to pop out to visibility. <i>“Could you imagine, mate? Could you see me with a big, throbbing dick just cumming all over you while you fuck me or stretching out your [pc.pussyOrAsshole]? Fuck, that’s hot!”</i>");
		output("\n\nYou ready a response, but Penny plows on, obviously wanting to get a bit more out before she takes in your feedback.");
		output("\n\n<i>“There’s one complication though. I can’t afford a high grade, custom tailored phallus like Kit did. That’s her name, by the way. Anyway, there’s another way I could grow a dick: a drug called Throbb,”</i> the fox-girl offers. <i>“It was originally developed as a hormone and body altering cocktail that could grow or enlarge penises on just about anyone for cheap. Of course, when the people taking it were found to be four times more likely of attempting rape, it started getting pulled off the market. Apparently it ratchets up the libido rather effectively. The drug’s situation didn’t get any better once holos of binge users showed up on the extranet. Some people grew dicks and balls so big they couldn’t move. Can you believe that?”</i>");
		
		output("\n\nActually, you can. Some of your old coworkers exposed you to some rather questionable things on the ‘net, and that doesn’t even count the weird shit you stumbled onto by yourself.");
		
		output("\n\nPenny smirks, <i>“So it’s illegal almost everywhere! A self-respecting police-girl could never get into something like that. Unless she was stationed on a rim world where no statutes against it had been established yet. A world that didn’t even have a decent tax on imports.”</i> Penny looks up at you with big, wide eyes. <i>“I might have bought myself a pretty big batch of it, but I wanted to ask you what you think.”</i>");
		
		output("\n\nScratching at her mohawk, the policewoman asks, <i>“If I say... had a big cache sitting around, waiting to give me a huge dick, do you think I could handle it? Would you be okay with me getting a penis? I don’t think I can really judge myself here.”</i> She sighs. <i>“Being a herm would really open things up to me sexually, but am I getting self-destructive here? Would you like me better as a girl?”</i>");
		//[Stay Girl] [Get A Dick]
		this.clearMenu();
		this.addButton(0,"Stay Girl",stayAGirlYouBitch);
		this.addButton(1,"Get A Dick",pennySproutsAWeiner);
		if(pc.hasItemByClass(HorseCock)) 
		{
			if(CodexManager.entryUnlocked("SynthSheath")) addButton(2,"SynthSheath",givePennyAHossCawk,undefined,"SynthSheath","Give Penny the Xenogen SynthSheath you found on Tarkus. She’d probably love having a horse-cock.\n\nWho needs Throbb when you can be a stallion?");
			else addButton(2,"Try This",givePennyAHossCawk,undefined,"Try This","Give Penny the horse-cock strap-on you found on Tarkus. You have a hunch it might be more than it seems. You shouldn’t give this to her unless you’re ready for things to get a little out of hand.\n\nIt might also prevent her from getting too into Throbb.");
		}
		else addDisabledButton(2,"Locked","Locked","You don’t have the required item for this option.");
	}
	//Repeat Futanari Talk
	else
	{
		if(penny.hasCock(GLOBAL.TYPE_EQUINE))
		{
			output("<i>“Oh, you mean this show pony you tricked me into getting?”</i> Penny asks with a knowing grin. <i>“I thought Throbb would have me all drippy and horny at all times of the day, but this thing is almost as bad!”</i> She shifts uncomfortably. <i>“I can barely hide the thing, and just thinking about it gets it hard enough to whack into the bottom of my desk.”</i>");
			if(flags["PENNY_THROBB_USES"] >= 3 && flags["PENNY_THROBB_USES"] != undefined)
			{
				output("\n\nThe over-sized futanari fennec shifts to bring the flared head up to her lips. She swiftly slathers it in a fresh layer of spit. <i>“Part of me wants more... but...”</i> She moans, swallowing at least six inches of pulsing meat. When she pulls it back out again her cock is slick and dripping white. <i>“This is just so awesome already.”</i> A pearl-white smile spreads across her face.")
			}
			output("\n\nShe’s no longer interested in taking Throbb.");
			if(flags["PENNY_THROBB_USES"] == undefined || flags["PENNY_THROBB_USES"] == 0) 
			{
				output("\n\n<i>“You know, I’ve actually still got plenty of Throbb left over. If you ever want some, just ask.”</i> Penny glances at your groin and ");
				if(pc.biggestCockLength() >= 15) output("smiles wickedly, licking her lips. <i>“God, imagine you with an even more enormous cock. You’d break my jaw!”</i>");
				else output("smirks knowingly. <i>“Imagine how much harder you could make me drool if we gave you a little boost. Just enough to make your dickgirl mate </i>really<i> whimper.”</i>");
				flags["PENNY_THROBB_PURCHASE_UNLOCKED"] = 1;
			}
			clearMenu();
			if(flags["PENNY_THROBB_USES"] >= 3 && flags["PENNY_THROBB_USES"] != undefined)
			{
				output("\n\nThat said, she’s more than a little pliable with her dick that close to her face, so if you wanted to turn her into an obedient, sex-addicted pet you could probably quite easily work her up into embracing throbb-enhanced horse-dick a little more enthusiastically. Chances are it would still impact on her ability to work, but not as irreversibly pumping her full of more drugs. Teasing her into being more of a orgasm-addicted love pet still wouldn’t exactly be <i>nice</i>, but at least she’d be able to control herself and do work when she absolutely had to.");
				output("\n\nSo, what do you want to do?");
				//[Tell her to calm down] [Have fun with her]
				clearMenu();
				addButton(0,"Calm Down",calmDownYouPennySlut);
				addButton(1,"Tease Her",teasePenny)
			}
			else this.addButton(14,"Back",approachGirlfriendPenny);
		}
		//Not yet futa
		else if (!penny.hasCock())
		{
			output("<i>“Oh, you want to talk about me growing a dick again?”</i> Penny asks. <i>“You know, if I dose myself with Throbb I’m going to wind up horny and dripping more often than normal. My self control will probably slip a little too. However, I’ll be able to fuck you like a freight train, and oh god I bet the orgasms will feel great.”</i>");
			output("\n\nFrom the sounds of it, Penny’s panties are already more than a little moist at the idea. Do you tell her to take some Throbb?");
			//[Stay Girl] [Get A Dick]
			this.clearMenu();
			this.addButton(0,"Stay Girl",stayAGirlYouBitch);
			this.addButton(1,"Get A Dick",pennySproutsAWeiner);
			if(pc.hasItemByClass(HorseCock)) 
			{
				if(CodexManager.entryUnlocked("SynthSheath")) addButton(2,"SynthSheath",givePennyAHossCawk,undefined,"SynthSheath","Give Penny the Xenogen SynthSheath you found on Tarkus. She’d probably love having a horse-cock.\n\nWho needs Throbb when you can be a stallion?");
				else addButton(2,"Try This",givePennyAHossCawk,undefined,"Try This","Give Penny the horse-cock strap-on you found on Tarkus. You have a hunch it might be more than it seems. You shouldn’t give this to her unless you’re ready for things to get a little out of hand.\n\nIt might also prevent her from getting too into Throbb.");
			}
			else addDisabledButton(2,"Locked","Locked","You don’t have the required item for this option.");
		}
		//Already futa
		else
		{
			if(penny.longestCockLength() < 10)
			{
				output("<i>“So you like my dick as much as me, right?”</i> a hopeful Penny asks. <i>“You don’t mind if I take another dose of Throbb, do you? I just want to get a little bit bigger - you know, like a foot long. That way I’d have a cock big enough to get into porn if the police gig ever falls through.”</i> Her tentpole swells a little at that admission.");
				output("\n\nShe’s as horny as an animal in heat, but she hasn’t had any trouble keeping herself under control thus far. Do you suggest she take it again?");
				this.clearMenu();
				this.addButton(0,"Give Throbb",pennyToBigPenny);
				this.addButton(14,"Back",approachGirlfriendPenny);
				if(pc.hasItemByClass(HorseCock)) 
				{
					if(CodexManager.entryUnlocked("SynthSheath")) addButton(1,"SynthSheath",givePennyAHossCawk,undefined,"SynthSheath","Give Penny the Xenogen SynthSheath you found on Tarkus. She’d probably love having a horse-cock.\n\nWho needs Throbb when you can be a stallion?");
					else addButton(1,"Try This",givePennyAHossCawk,undefined,"Try This","Give Penny the horse-cock strap-on you found on Tarkus. You have a hunch it might be more than it seems. You shouldn’t give this to her unless you’re ready for things to get a little out of hand.\n\nIt might also prevent her from getting too into Throbb.");
				}
				else addDisabledButton(1,"Locked","Locked","You don’t have the required item for this option.");
			}
			//Footlong Penny
			else if(penny.longestCockLength() < 17)
			{
				output("<i>“Ohgod, you want me to get bigger, don’t you?”</i> Penny asks with a full-body shudder. She wraps one hand around her [penny.cock] and begins to languidly stroke it, barely caring that the door is unlocked. Her male endowment is big enough to be visible over the edge of her desk. <i>“Nnnngh, it’ll feel so good! I... uh... don’t know how I’ll fit in my pants. Fuck, my sheath will probably bulge through even when I’m not horny.”</i> The lust-drunk vixen giggles as she bends double to slurp a drop of pre-cum off her [penny.cockHead]. <i>“Yeaaaah, let’s give me a real monster!”</i>");
				output("\n\nTo say that Penny is enthused by the prospect of a bigger member and a heightened libido would be an understatement. She’s jubilant at the prospect and nearly beyond reason with lust from at the prospect of taking more. With her self-control obviously slipping, do you give her the okay to take another dose?");
				this.clearMenu();
				this.addButton(0,"Give Throbb",pennyBecomesHYPERPENNY);
				if(pc.hasItemByClass(HorseCock)) 
				{
					if(CodexManager.entryUnlocked("SynthSheath")) addButton(1,"SynthSheath",givePennyAHossCawk,undefined,"SynthSheath","Give Penny the Xenogen SynthSheath you found on Tarkus. She’d probably love having a horse-cock.\n\nWho needs Throbb when you can be a stallion?");
					else addButton(1,"Try This",givePennyAHossCawk,undefined,"Try This","Give Penny the horse-cock strap-on you found on Tarkus. You have a hunch it might be more than it seems. You shouldn’t give this to her unless you’re ready for things to get a little out of hand.\n\nIt might also prevent her from getting too into Throbb.");
				}
				else addDisabledButton(1,"Locked","Locked","You don’t have the required item for this option.");
				this.addButton(14,"Back",approachGirlfriendPenny);
			}
			//Hyper Pre-cumslut Penny
			else if (!pennyIsCumSlut()) {
				author("Abe E. Seedy");
				output("<i>“MMmoooore?”</i> Penny moans as she starts to masturbate in front of you. Her hand can’t even close around her girth at this point, and the tip is so tall that it smacks her in the chin whenever she gets careless. She grabs hold of it with both hands, one sliding over the half facing you while the other ");
				if(penny.balls > 0) output("cradles her balls");
				else output("dips into her sheath to play with it");
				output(". Her womanly folds are almost entirely forgotten as she babbles, <i>“I think I want more, [pc.name].... I mean, I remember not wanting to turn myself into a hyper-dicked freak, but now... I kind of want to see how big it can get. Each time it feels better!”</i> She slurps at her tip as you consider the situation. <i>“Umph! So good! Come on, give me a monster cock! I promise I won’t split you in half with it!”</i>");

				output("\n\nThinking about it for a moment, you realize that Penny probably wouldn’t be able to handle any more of the drug. Her lust seems to be stoked to a high degree already, and giving her more Throbb would certainly lead to her losing her post. That said, she’s very pliable at the moment, so if you wanted to turn her into an obedient, sex-addicted pet you could probably quite easily work her up into embracing her new assets a little more enthusiastically. Chances are it would still impact on her ability to work, but not as irreversibly as pumping her full of drugs. Teasing her into being more of a orgasm-addicted love pet still wouldn’t exactly be <i>nice</i>, but at least she’d be able to control herself and do work when she absolutely had to.");
				output("\n\nSo, what do you want to do?");
				//[Tell her to calm down] [Have fun with her]
				clearMenu();
				addButton(0,"Calm Down",calmDownYouPennySlut);
				addButton(1,"Tease Her",teasePenny)
				if(pc.hasItemByClass(HorseCock)) 
				{
					if(CodexManager.entryUnlocked("SynthSheath")) addButton(2,"SynthSheath",givePennyAHossCawk,undefined,"SynthSheath","Give Penny the Xenogen SynthSheath you found on Tarkus. She’d probably love having a horse-cock.");
					else addButton(2,"Try This",givePennyAHossCawk,undefined,"Try This","Give Penny the horse-cock strap-on you found on Tarkus. Maybe the randy hermaphrodite could use it as a sex toy.");
				}
				else addDisabledButton(2,"Locked","Locked","You don’t have the required item for this option.");
				addButton(14,"Back",approachGirlfriendPenny);
			}
			else 
			{
				output("<i>“Mmmoooore?”</i> Penny moans as she starts to masturbate in front of you. Her hand can’t even close around her girth at this point, and the tip is so tall that it smacks her in the chin whenever she gets careless. She grabs hold of it with both hands, one sliding over the half facing you while the other ");
				if(penny.balls > 0) output("cradles her balls");
				else output("dips into her sheath to play with it");
				output(". Her womanly folds are almost entirely forgotten as she babbles, <i>“I think I want more, [pc.name].... I mean, I remember not wanting to turn myself into a hyper-dicked freak, but now... I kind of want to see how big it can get. Each time it feels better!”</i> She slurps at her tip as you consider the situation. <i>“Umph! So good! Come on, give me a monster cock! I promise I won’t split you in half with it!”</i>");
				output("\n\nPenny will surely lose it if you give her the go ahead to take any more. Her already lustful nature seems to be stoked to a high degree already, and giving her more Throbb would certainly lead to her losing her post. No, she can’t have any more now, and you tell her as much.");
				output("\n\nAmazingly, she actually wilts a little at that. Her masturbation stops as the fennec dreamily says, <i>“Okay, okay, I guess. I’m getting a little out of hand, aren’t I?”</i> You nod. <i>“Good, cause it seems to be keeping you around. I’m going to fuck you so hard as soon as I get caught up on work!”</i> She turns back towards what she was doing while trying to pack her monster dick into her pants. It doesn’t work all that well.");
				this.clearMenu();
				if(pc.hasItemByClass(HorseCock)) 
				{
					if(CodexManager.entryUnlocked("SynthSheath")) addButton(1,"SynthSheath",givePennyAHossCawk,undefined,"SynthSheath","Give Penny the Xenogen SynthSheath you found on Tarkus. She’d probably love having a horse-cock.");
					else addButton(1,"Try This",givePennyAHossCawk,undefined,"Try This","Give Penny the horse-cock strap-on you found on Tarkus. You have a hunch it might be more than it seems. You shouldn’t give this to her unless you’re ready for things to get a little out of hand.");
				}
				else addDisabledButton(1,"Locked","Locked","You don’t have the required item for this option.");
				this.addButton(14,"Back",approachGirlfriendPenny);
			}
		}
	}
}

//Get A Dick
public function growADickPenny():void {
	clearOutput();
	showPenny();
	output("<i>“You’ll be fine,”</i> you suggest, letting a hint of a lascivious smile creep onto your [pc.face]. <i>“I’m sure a girl like you can handle a little bit of extra arousal from time to time, and if it ever gets to be too much, well, I’m right here.”</i>");
	output("\n\nPenny gives you a doubtful look, but she reaches into her desk all the same, coming out with a vial full of cyan fluid so transparent you can barely identify the color. She twists it between her fingers, looking meaningfully at it as she works up her courage. <i>“This stuff is going to give me a dick, likely forever. My genome is so hacked up by the fennec splicing that most transformation won’t even take anymore - part of the downsides of going as cheap as I did on it. So if I grow this dick, it’ll be hard as hell to get rid of, and maybe the only thing about me we can transform. Are you sure you want me to be your foxy little futanari girlfriend?”</i>");
	//[Grow It] [Nevermind] - back to talk menu.
	this.addButton(0,"Grow It",pennySproutsAWeiner);
	this.addButton(1,"Never Mind",stayAGirlYouBitch);
}
//Penny Grows Her Dick NOW!
public function pennySproutsAWeiner():void {
	clearOutput();
	showPenny(true);
	output("You smile and let her know that you’re more than fine with her having a package. If anything, you’re anticipating the change. The idea of the vixen sporting a nice, thick cock to tease along with her vagina is eminently pleasing.");
	output("\n\n<i>“Really?”</i> Penny smiles, though her hand is shaking. <i>“I guess... there’s no time like the present then.”</i> " + (pennyIsCrew() ? "One-handed, she triggers her room’s door to seal":"Typing one handed, she powers off her workstation and seals the doors") + " in short order. <i>“Just, " + (!pennyIsCrew() ? "unlock the doors and ":"keep an eye on me and book it to the nearest hospital and ") + "call for help if anything goes wrong, okay mate?”</i>");
	output("\n\nYou nod.");
	output("\n\nPenny exhales, <i>“Okay.”</i> She gingerly sets the expensive, barely-legal drug on her desk and unbuttons her pants with a grunt of irritation, lifting up her cute little bottom so she can slide the stifling garment down to the floor. A pair of white panties with a noticeable dark patch at the gusset follow it, exposing Penny’s glistening-wet sex to your eyes. She leans back, spreading her legs to give you a better view, her vulva engorging with every breath she takes. Grabbing hold of the vial, Penny pops the plastic guard off the needle and gulps. <i>“This is it,”</i> she says to herself, <i>“the moment of truth.”</i>");
	output("\n\nThe shaking vial slowly descends toward her pubic mound clasped as it is in the fennec’s quaking fingers. It stops perhaps a millimeter above her exposed skin, just above her slit but below the line where her tawny fur begins. She whimpers, glances at you for support, and without another word, she plunges the needle into herself. Startled, Penny gasps, <i>“It didn’t hurt at all! The anesthetic coating on these needles is perfect!”</i> She depresses the plunger with one firm push, her previous worries forgotten.");
	output("\n\nThere’s no change at first. Penny glances up at you with a worried look while she works the needle free and places it on her desk. <i>“Was it a d... dud?”</i> she wonders. One of her eyes starts to dilate, and then the other. Her tongue doesn’t even make it the whole way back into her mouth. It just kind of flops out to the side and twitches slightly. <i>“F-feeling it aowww...”</i> she slurs, her breaths coming hard and fast. Her left nipple and then her right pop out, sticking out through her wraps as lust overwhelms her. At the same time, her pussy lips clench and then relax, opening as wide as that orifice can, leaking clear, feminine fuck-slime onto her chair.");
	output("\n\nThe insensate fennec slams her hand down onto her pussy hard enough to splatter her lubricants onto her desk, three fingers immediately buried to the knuckle in her simmering slot. Her hips lift and grind against her hand, and a lazy, ecstatic grin spreads across her face as she masturbates. <i>“Sho good,”</i> she babbles while fucking herself. <i>“So hot... so hot!”</i> Her movements grow jerky, and an ugly-looking lump begins to rise at the injection site, discolored and red.");
	output("\n\nPenny doesn’t seem to care about the growth in the slightest. She’s worked a fourth finger into her twat and is so busily fucking herself that she looks about ready to start fisting any moment now. Meanwhile, the red lump is nearly an inch tall. Veins rise on the surface, visibly expanding with each pump of heated blood, seeming to fill the object as it rises higher. Around the border of the protrusion, her skin bunches up, folds stacking upon folds into something not dissimilar from foreskin or an animal’s sheath. Penny’s fur spreads down as it thickens, confirming that it is a sheath, which means the red bulge is... her cock. It’s risen up to a full two inches in height already, and the rate of its growth is only accelerating.");
	output("\n\nBlinking as she starts to fist-fuck herself, Penny seems to suddenly become aware of the new, growing organ. Her free hand wraps around it, and she gasps. A narrow tip peeks through her fingers while the base thickens, fed by the spiderwebs of fresh veins that feed further engorgement. Her cock swells further, slowly straining her tightly-clasped fingers apart to reveal a bulging knot. At the same time, a tiny slit appears at the tip and begins to weep white droplets of liquid lust.");
	output("\n\nThe lust-drugged vixen throws her head back and moans in orgasmic bliss while her expanding fox-cock flexes in her grip, just in time to launch long ropes of jism up onto its owner’s tits. Again and again, sticky semen is sprayed up onto the underside of Penny’s breasts. Some falls on her belly after a few moments, losing momentum as the drug’s potential is expended. Slouching into her chair, Penny shudders and sighs, pulling her hand free of her momentarily-gaped snatch with a lewd-sounding pop.");
	output("\n\n");
	showImage("PennyGrewDick");
	output("The newly-minted hermaphrodite uncurls her fingers from around her prized possession, gazing on it with a sense of wonder. It’s definitely a dog-dick; it has a clearly visible but shrinking knot at its base. The new-grown tool looks to stand about six inches tall when hard, but it’s already starting to retract into its fleshy sheath. <b>Penny has a cock!</b> She doesn’t have balls, but from her description of the drug, she’s liable to get some if you give her more.");
	output("\n\nPenny interrupts your speculations with a ringing endorsement, <i>“Oh god, it’s perfect! It’s just like I always imagined.”</i> She flutters her lashes in your direction, letting her eyebrows sink low as she says, <i>“And it felt better than I ever expected. I can’t wait to try it out with you!”</i> In confirmation of her statement, her sheath spreads to expose an inch of the pointed tip, sliding out to point accusingly in your direction. She idly gathers some of her cum off her chest to taste, each swallow aiding another inch of erection in slipping free. By the time she’s cleaned, her cock is out and throbbing again.");
	output("\n\nPenny purrs, <i>“Oh, it wants to go again!”</i>");
	output("\n\nThe fox-girl’s libido has definitely jumped up a notch - she’s probably always going to be lusting after you now. Hell, the way she’s eyeing you up, you wouldn’t be surprised if she leapt across the " + (pennyIsCrew() ? "room":"desk") + " right now. She shows some restraint, luckily, and instead slides her bottoms back up. Though, she does leave the fly undone so that her new addition can breathe.");
	if(pennyIsCrew())
	{
		output(" <i>“What do you say, mate? Want to take it for a spin?”</i> She breathes heavily. <i>“I’m still horny as all hell.”</i>");
	}
	else
	{
		output(" <i>“Maybe later though, little guy. I’ve got work to do.”</i> Her smile turns your way. <i>“Thanks again, mate. I’m gonna get things cleaned up and work, but come back as soon as you have time for a little prison fun, okay?”</i>");
		if(silly) output("\n\nYou’ll have to be careful not to drop the soap around her from now on.");
	}
	this.clearMenu();
	processTime(20);
	penny.createCock();
	penny.shiftCock(0,GLOBAL.TYPE_VULPINE);
	penny.cocks[0].cLengthRaw = 6;
	penny.cumMultiplierRaw += 1;
	penny.ballEfficiency += 2;
	penny.orgasm();
	flags["PENNY_THROBB_USES"] = 1;
	flags["PENNY_THROBB_PURCHASE_UNLOCKED"] = 1;
	if(!pennyIsCrew()) this.addButton(0,"Next",mainGameMenu);
	else pennyCrewSexMenu();
}

//Penny Turns To Big Penny
public function pennyToBigPenny():void {
	clearOutput();
	showPenny(true);
	output("Penny cheers, <i>“I knew you would!”</i> in between strokes on her [penny.cock]. Tearing into a drawer one-handed, she comes up with another vial of Throbb. This one looks exactly like the last - a syringe filled with transparent, pale blue fluid. She bites the plastic cap off the needle and casually spits it aside, spinning the injector in her fingers until she has it aimed point-down at herself. Breathing in anxious puffs, she declares, <i>“I’m going to have a hard time hiding this, [pc.name]...”</i>");
	output("\n\nThe lusty prick-vixen jams her chosen enlargement method into her [penny.sheath] with alarming suddenness. Pushing in the plunger, she yanks out the spent syringe to toss aside, forgotten by the time it hits her desk. Instead, the fox is bent down to look at her dick as she masturbates, sliding her hand slowly across every spot of exposed erection. Like the last time, there are a scant few seconds where nothing happens, but then, the fox-girl begins to drool. At first, only strings of saliva escape her open maw, but all too soon, she’s dripping all over her dick while she jacks off.");
	output("\n\nAt the same time, Penny’s [penny.cock] visibly swells, starting inside the sheath, stretching her fur-lined orifice wide. The tremors of growth pass up the shaft, compressed as it is in her hand, and force her fingers apart with newfound girth. Last, the fennec’s [penny.cockHead] blooms with fresh size before elongating upward, stretching with new length. The cock quivers and pulses as it builds higher, passing eight inches of height with ease. As it hits ten, the lust-doped fox-girl whimpers, and a flow of white begins to flow from her tip in languid spurts.");
	output("\n\nPenny bends low, her tongue hanging down to catch her [penny.cockHead]’s juices, tasting herself as her cock inexorably reaches towards her mouth. You estimate her [penny.cock] to be about eleven inches long when the fox-girl’s lips touch down. The contact between the two must feel exquisitely good, because you actually see her urethra bulge with a heavy load, and the tip surges up into the vixen’s hungry maw in time to spray the cum straight into her throat. Her cheeks bulge from the spunky volume, pressurized to their limit. Penny goes straight into swallowing while her eyes roll back from bliss. Her body is running on automatic at this point, stroking, licking, and swallowing on the altar of her swelling phallus until it becomes satisfied.");
	if(penny.balls == 0) output("\n\nMid-orgasm, the flesh between Penny’s [penny.cock] and pink slit bulges out, her skin ballooning slowly, coming to rest flat and empty upon her quivering folds. A second later, something squeezes out of the fox-girl and into the sack of pink skin. It’s a rounded, egg-shaped little bulge that you identify as a testicle almost immediately. A second falls into the other side, and both bounce happily in their new home as they grow, swelling up to the size of golf balls before stopping. Fine amber hairs sprout all over the pouch a moment later, blending in with the sheath above and the fur to either side. <b>Penny grew a ballsack!</b>");
	output("\n\nGulping noisily, the now-hung hermaphrodite works to keep up with her prodigious alabaster flow. Her [penny.cock] seems to have finished the worst of its growth and appears content to serve as a sperm highway straight into Penny’s belly. Her taut tummy bulges slightly with hastily-swallowed, liquid weight, distending under the size of the drug-born load. Still, even such ludicrous orgasms have to come to an end, and Penny’s tapers down to an unsubtle white-leaking drip.");
	
	output("\n\nYou watch the fennec come down from her orgasmic high with a bit of uncertainty. She’s gotten pretty big, and you can’t even see the whole size of her member with it buried in her throat. Penny answers your unasked questions a moment later by pulling off and gasping for breath. <b>Her cock has grown to somewhere just under twelve inches, maybe eleven and a half.</b> The tip is still leaking white, but it does begin to recede into the vixen’s enlarged sheath. Her balls have nowhere to go, and she comments, <i>“");
	if(penny.balls == 0) output("I guess I better be careful how I sit from now on....");
	output(" That felt better than last time!”</i>");
	output("\n\nYou cock your head to the side.");
	
	output("\n\n<i>“Seriously! Last time, it was like I was supremely horny and HAD to bring myself off right now,”</i> Penny explains. <i>“This time, it’s like I was getting more and more aroused with each passing second. I didn’t have to touch myself, I <b>knew</b> I’d be coming in ten or fifteen seconds, I just touched myself because I wanted it to feel even better, and boy did it ever! When it started growing, it was like I was having this beautiful, perfect, slow orgasm, and then when it went into my mouth, I started cumming all over again! I got off on jizzing into my own throat and I came forever! I can still feel it sloshing inside of me...”</i> She cradles her belly, but her shaft has apparently re-engorged, ready to go again.");
	
	output("\n\nSlapping at it, the fox giggles, ");
	if(!pennyIsCrew()) output("<i>“Not now... but maybe we can take a break in an hour to drain you.”</i> She adjusts herself to be half presentable before turning back to thank you. <i>“You’re the best, my mate. I never would have done something like this, and let me tell you that I’m having a hard time trying not to mount you right now. I mean... your butt is just... wow.”</i> She covers her mouth and swivels back to her computer to work, but you overhear her whisper, <i>“Okay, maybe a break in five minutes...”</i> Her enhanced tentpole twitches in agreement.");
	else output("<i>“Haha! Look at it! I just came, and it’s already ready to go again.”</i> She adjusts herself to present the bulging, vulpine length to you. <i>“Look at what you gave me, my mate. Look at how fucking firm I am for you. Without you, I never would have gotten so hard or felt so good, and I want to mount you so bad. Like, it’s taking everything I have not to jump you right now. I mean... your butt is just... wow.”</i> She covers her mouth and squirms giddily. <i>“Come on. Let’s fuck. Right now.”</i>");
	processTime(25);
	if(penny.balls == 0) {
		penny.balls = 2;
		penny.ballSizeRaw = 2;
	}
	penny.cumMultiplierRaw += 2;
	penny.ballEfficiency += 3;
	penny.cocks[0].cLengthRaw = 11.5;
	penny.cocks[0].cThicknessRatioRaw = 1.1;
	if(penny.cocks[0].knotMultiplier < 1.5) penny.cocks[0].knotMultiplier = 1.5;
	penny.orgasm();
	flags["PENNY_THROBB_USES"] = 2;
	this.clearMenu();
	if(!pennyIsCrew()) this.addButton(0,"Next",mainGameMenu);
	else pennyCrewSexMenu();
}

//Penny Goes Hyper Penny
public function pennyBecomesHYPERPENNY():void {
	clearOutput();
	showPenny(true);
	output("Penny’s only response to your decree is to eagerly slam her face down on her [penny.cock], wrapping her lips around the [penny.cock] into a vacuum tight seal. Holding that position, she reaches into her drawer, fumbling around a little while before she comes up with the object she sought: a small injector filled with bluish fluid. The fennec pops off her spit-slicked rod, but only long enough to say, <i>“Are you ready, my mate? Ready to see my cock get so huge that I don’t even have to lean over to self-suck anymore?”</i> She shivers with uncontained anticipation. <i>“It’s gonna get sooooo big.”</i>");
	output("\n\nYour mouth splits into a slight grin as you nod to her. You’re definitely ready to see this.");
	output("\n\n<i>“Okay thenmrph!”</i> she gurgles as she slurps down her [penny.cockHead] once more. The vial of cyan drug has its plastic safety sheath removed by Penny’s practiced fingertips, and it’s unceremoniously jammed needle-first into her sheath. The fox-girl barely whimpers at this. She didn’t even miss a stroke; her hand is pumping as fast and ready as before. At the same time, she pumps in a whole other way, depressing the plunger to inject the chemical into herself, tossing the empty syringe away as soon as it’s completed its mission inside her genitals.");
	output("\n\nPenny lazily looks at you as she slurps upon her foot-long rod, popping off long enough to say, <i>“Here it comes, [pc.name]. Watch closely.”</i>");
	output("\n\nThe first difference you notice is actually Penny’s tail. It had been waving back and forth until now, but it’s stopped and fallen limp behind her. Next, a full-body shiver works its way through the fennec’s form, starting at her footpaws before traveling the whole way up to her head. That actually interrupts the vixen’s autofellative masturbation, at least for a few seconds. She goes right back into sucking her [penny.cock] like a horny gutterslut the moment the involuntary twitches cease.");
	output("\n\nYou watch this with a lusty smile, grinning wider when you see her ears begin to lazily droop backwards. At the same time, her cock pulsates powerfully, throbbing so mightily that you’re reminded briefly of someone inflating a toy. You shake your head to cast off the idle thoughts and watch, noticing the way Penny’s sheath has begun to swell first. The fleshy lips of it are thickening nicely while the orifice opens wider. Stranger still, that entrance (or is it an exit?) migrates further up the fox-woman’s groin as it deepens in order to handle the soon-to-be swelling organ, surely immense in its flaccid state.");
	//No balls
	if(penny.balls == 0) {
		output("\n\nThe flesh between Penny’s [penny.cock] and pink slit bulges out, the skin ballooning out slowly, coming to rest flat and empty upon her quivering folds. A second later, something squeezes out of the fox-girl and into the sack of pink skin. It’s a rounded, egg-shaped little bulge that you identify as a testicle almost immediately. A second falls into the other side, and both bounce happily in their new home as they grow, swelling up to the size of golf balls before stopping. Fine amber hairs sprout all over the pouch a moment later, blending in with the sheath above and the fur to either side. <b>Penny grew a ballsack!</b>");
		penny.balls = 2;
		penny.ballSizeRaw = 2.5;
	}
	//Balls below max size
	if(penny.ballSizeRaw < 4) {
		output("\n\nThe nicely formed sack below Penny’s [penny.cock] abruptly begins to tighten as its contents swell with fresh virility, practically sloshing against each other as they fill the rapidly stretching pouch. That pouch gets larger and larger before your very eyes, and the vixen’s seed-producing organs become more perfectly spherical as they enlarge, the only flaw in their perfect, rounded shapes visible in the way their bottoms compress flat against Penny’s seat under their own weight. <b>Her balls have grown to the size of grapefruits!</b>");
		penny.ballSizeRaw = 4;
	}
	//Resume!
	output("\n\nChange arrives at the vixen’s prick at last, starting at the ");
	if(penny.hasKnot(0)) output("knot");
	else output("base");
	output(", which blooms into a full, girthy, ");
	if(penny.hasKnot(0)) output("six-inch, orgasmicly enlarged sphere");
	else output("three-inch thickness");
	output(" well ahead of the rest of the organ. Penny’s cheeks abruptly fill with what must be a momentous amount of seed, forcing her to gulp and swallow to keep up. Meanwhile, the shape of her phallus is stretching lengthwise, thickening to keep it proportional. Her urethra pulsates and jumps with each hot load of jism that it’s forcing into the fox-girl’s mouth, stretching larger with each shot in order to handle the growing copiousness of her ejaculations.");
	output("\n\nPenny’s lips stretch a little bit around the thickening tip, but the true entertainment lies in watching it reach deeper into her throat. The fox soon reaches her limit, and you get to watch her slowly be pushed up out of her own groin and into a more upright position. Her meaty fuck-piston is actually lifting her into a proper, upright sitting stance by the force of its multiplying erectile tissues. Not long after that, cum starts to pour out around the corners of her mouth, and she pulls off with a gagging cough, spewing unswallowed jism over her tits while her growing cock dumps a load of the stuff across her mohawk.");
	output("\n\nWith her cock acting as a spooge geyser, Penny can do naught but lie back and try to clear her throat while she showers herself in more. You’re certain she’s at least fifteen or sixteen inches long by this point, and still growing. Heck, even her balls look swollen; they’re currently as big as cantaloupes, but they do look to be shrinking a little with each blast of warm goo. The hugely endowed prick-vixen jacks herself off through the next few sordid splatters, gasping out a sigh when the blasts of seed trail off into a steady flow of dribbling white. She uses that as lubricant for a few lazy strokes, but after that orgasm, Penny seems completely wiped out. <b>Her cock is standing up a proud eighteen inches, rock hard</b>.");
	output("\n\nThe white-painted fox gasps, <i>“Ohhhhhhhhhhhh,”</i> and lets her head hang back limply over the back of her chair, cum dripping off her to splatter onto the dozens of puddles on the floor around her. The corners of her mouth are twisted into an ecstatic smile, and she is soon back to properly stroking herself once more. <i>“[pc.name], you gotta try this. It feels so good. I just came but like, I know if I just keep stroking it I won’t get very soft. I can feel it in my balls. I’ll be able to cum again real soon. I’ll be able to cum so often!”</i> She shudders as she cups one of her engorged nuts.");
	if(!pennyIsCrew())
	{
		output(" <i>“Damn, it sucks that I have to work!”</i>");
		output("\n\nYou chuckle and point out that she’s got quite a bit of cleaning to do before she can even do that.");
		output("\n\n<i>“You’re right...”</i> Penny drawls with a lazy stroke of her sperm-soaked phallus. <i>“I’ll get this cleaned right up, and then I can take care of myself in the shower!”</i> Her cock pulsates powerfully along with that last statement, giving you a clear picture of exactly what she plans to do in the shower.");
	}
	else
	{
		output(" <i>“Damn, it sucks that we have to do rush stuff.”</i>");
		output("\n\nYou chuckle and point out that she’s got quite a bit of cleaning to do as well.");
		output("\n\n<i>“You’re right...”</i> Penny drawls with a lazy stroke of her sperm-soaked phallus. <i>“But wouldn’t it so much more fun to screw right now? You can fuck me raw, right now,”</i> her cock pulsates powerfully, <i>“and then I can clean up two messes at once.”</i>");
	}
	penny.cocks[0].cLengthRaw = 18;
	penny.cocks[0].cThicknessRatioRaw = 1.2;
	if(penny.cocks[0].knotMultiplier < 2) penny.cocks[0].knotMultiplier = 2;
	penny.cumMultiplierRaw += 5;
	penny.ballEfficiency += 3;
	penny.orgasm();
	this.clearMenu();
	flags["PENNY_THROBB_USES"] = 3;
	if(!pennyIsCrew()) this.addButton(0,"Next",mainGameMenu);
	else pennyCrewSexMenu();
}
//Stay Girl
public function stayAGirlYouBitch():void {
	clearOutput();
	showPenny();
	output("You calmly tell Penny that it would probably be best for her to remain a girl. After all, she’s already spoken about her lustful nature. Taking anything that would exacerbate it is probably a bad idea. Imagine what it would be like if she bumped into a zil with twice the libido and an irresistible desire to fuck?");
	output("\n\nGrowling, Penny says, <i>“Rrrr, I think you’re right, but fuck, it’d be fun to try.”</i> She looks meaningfully down at one of her desk drawers and continues. <i>“Well, maybe you’ll change your mind later on. I’ll just hold on to the Throbb for now, unless maybe you want to buy some of it to help me recoup the cost.”</i> Her ears perk up a bit. <i>“Just ask me later, I can probably give you the hookup for something like 300 creds a pop. Remember, don’t overdo it with this stuff unless you want to wind up a mindless fuckbeast or an immobilized, orgasm-addicted dick-stroker.”</i>");
	output("\n\nThe fox-girl giggles, <i>“If you do decide to do that, let me know! I want to watch.”</i> She swivels her chair back. <i>“Right now, I have work to do. You know the drill.”</i>");
	flags["PENNY_THROBB_PURCHASE_UNLOCKED"] = 1;
	CodexManager.unlockEntry("Throbb");
	this.clearMenu();
	if(pennyIsCrew()) addButton(0,"Next",approachCrewPenny,true);
	else this.addButton(0,"Next",mainGameMenu);
}
	
//Buy Throbb - Unlocked by futa talk, rejected or accepted
public function buySomeThrobbFrompenny():void {
	clearOutput();
	showPenny();
	CodexManager.unlockEntry("Throbb");
	output("Penny gives you a saucy smile as she reaches into her desk to retrieve a little injector needle. <i>“It goes straight into </i>");
	if(pc.hasCock()) output("<i>your dick</i>");
	else output("<i>your crotch</i>");
	output("<i>, [pc.name]. It shouldn’t hurt much if at all - the needles are coated in a numbing agent for easy application. The effects will be immediate and powerful. 300 credits, and don’t tell anybody you got them from me. It may not be illegal, but I don’t necessarily want my baser impulses told to the whole town, okay?”</i>");
	output("\n\nYou nod");
	if(pc.credits < 300) output(", but inform her that <b>you cannot afford a dose of Throbb</b>");
	else output(" and wonder if you’re sure that you want to spend 300 credits for a back-alley dick-enlargement formula");
	output(".");
	this.clearMenu();
	if(pc.credits >= 300) this.addButton(0,"Buy It",buyThrobbTransact);
	else this.addDisabledButton(0,"Buy It");
	if(pc.credits >= 600) this.addButton(1,"Buy 2",buyThrobbTransact,2);
	else this.addDisabledButton(1,"Buy 2");
	if(pc.credits >= 900) this.addButton(2,"Buy 3",buyThrobbTransact,3);
	else this.addDisabledButton(2,"Buy 3");
	if(pc.credits >= 1200) this.addButton(3,"Buy 4",buyThrobbTransact,4);
	else this.addDisabledButton(3,"Buy 4");
	if(pc.credits >= 1500) this.addButton(4,"Buy 5",buyThrobbTransact,5);
	else this.addDisabledButton(4,"Buy 5");
	if(pc.credits >= 1800) this.addButton(5,"Buy 6",buyThrobbTransact,6);
	else this.addDisabledButton(5,"Buy 6");
	if(pc.credits >= 2100) this.addButton(6,"Buy 7",buyThrobbTransact,7);
	else this.addDisabledButton(6,"Buy 7");
	if(pc.credits >= 2400) this.addButton(7,"Buy 8",buyThrobbTransact,8);
	else this.addDisabledButton(7,"Buy 8");
	if(pc.credits >= 2700) this.addButton(8,"Buy 9",buyThrobbTransact,9);
	else this.addDisabledButton(8,"Buy 9");
	if(pc.credits >= 3000) this.addButton(9,"Buy 10",buyThrobbTransact,10);
	else this.addDisabledButton(9,"Buy 10");

	if(pennyIsCrew()) addButton(14,"Back",approachCrewPenny,true);
	else this.addButton(14,"Back",approachGirlfriendPenny);
}
//[Buy] [Back]
//Transact It
public function buyThrobbTransact(amount:int = 1):void {
	clearOutput();
	showPenny();
	output("<i>“Thanks, mate,”</i> Penny says as she checks her cred account. <i>“Looks like everything came through okay. Maybe I’ll get my loans paid off faster I thought!”</i>\n\n");
	
	/*
	//Acquire 1x throbb
	//lootList.push(new Throbb());
	if(flags["THROBB_QUANTITY_STORAGE_CHEAT"] == undefined) {
		flags["THROBB_QUANTITY_STORAGE_CHEAT"] = amount;
		eventQueue[eventQueue.length] = lootThrobb;
	}
	else flags["THROBB_QUANTITY_STORAGE_CHEAT"] += amount;

	//-300 credits
	pc.credits -= amount*300;
	clearMenu();
	addButton(0,"Next",talkToGirfriendPenny);
	*/
	pc.credits -= amount*300;
	var throbbs:ItemSlotClass = new Throbb();
	throbbs.quantity = amount;
	quickLoot(throbbs);
	if(pennyIsCrew()) eventQueue.push(pennyCrewTalk);
	else eventQueue.push(talkToGirfriendPenny);
}
/* Not needed no more.
public function lootThrobb():void {
	clearOutput();
	output("You have some Throbb you bought from Penny.\n\n");
	var foundLootItems:Array = new Array();
	foundLootItems[foundLootItems.length] = new Throbb();
	//Set quantity!
	foundLootItems[foundLootItems.length-1].quantity = flags["THROBB_QUANTITY_STORAGE_CHEAT"];
	if(foundLootItems[foundLootItems.length-1].quantity > foundLootItems[foundLootItems.length-1].stackSize)
		foundLootItems[foundLootItems.length-1].quantity = foundLootItems[foundLootItems.length-1].stackSize;
	//More to loot? Queue up another loot batch.
	if(flags["THROBB_QUANTITY_STORAGE_CHEAT"] > foundLootItems[foundLootItems.length-1].quantity)
	{
		flags["THROBB_QUANTITY_STORAGE_CHEAT"] -= foundLootItems[foundLootItems.length-1].quantity;
		eventQueue[eventQueue.length] = lootThrobb;
	}
	//Clear quantity
	else flags["THROBB_QUANTITY_STORAGE_CHEAT"] = undefined;
	itemScreen = mainGameMenu;
	lootScreen = mainGameMenu;
	useItemFunction = mainGameMenu;
	//Start loot
	itemCollect(foundLootItems);
}*/

//Penny Sex Menu
public function pennySexMenu(outputT:Boolean = true):void {
	showPenny();
	if (outputT)
	{
		clearOutput();
		//Non-futa
		if (!penny.hasCock())
		{
			//Horny
			if(penny.lust() >= 66) output("Penny’s ears perk right up when you admit that you want to have sex. She even says, <i>“Ohhh, this is just what I need, [pc.name]!”</i> Out of her seat a moment later, the busty, aroused vixen coos, <i>“So, any preference as to how I take you today, mate?”</i>");
			//Not Horny
			else output("Glancing up at you, Penny sighs, <i>“Right now?”</i> She doesn’t really look up for it right now, but after a moment, a sly look spreads across her face. <i>“I suppose it’s as good an excuse for a break as any.</i> She shimmies a hand into the waistband of her pants as she lazily stands. Her eyelids drop seductively as she pulls her fingers out, glistening with moisture. <i>“I guess your scent has about as much effect on me as the zil, huh?”</i> she jokes, though you wonder if there’s a bit of truth sliding underneath the jest.");
		}
		//Futa
		else
		{
			output("Penny is up and out of her chair almost as soon as you mention the idea of sex. Her fly is undone, leaving her [penny.cock] to point up at you, almost accusingly. She touches it experimentally and shivers from the rush of pleasure that courses out of it in response. <i>“I think so, [pc.name].”</i> Rubbing it a little faster, the fennec enthusiastically offers, <i>“Does my mate have any preference for how I take " + pc.mf("him","her") + "?”</i>");
		}
	}
	this.clearMenu();
	
	// I don't THINK these scene is supposed to /require/ the player have a cock; it never once uses any logic or parse tags for the players cock, nor refer to it within the scene text OR the "exit" texts...
	if(penny.hasCock()) this.addButton(0,"Onahole Her",jackinPennyOffWithAnOnahole,undefined,"Onahole","Jerk off Penny’s newly grown cock with an onahole.");
	else this.addDisabledButton(0, "Onahole Her","Onahole Her","Penny must be a futanari for this scene to work.");
	
	if (pc.hasCock())
	{
		//if(penny.hasCock()) this.addButton(0,"Onahole Her",jackinPennyOffWithAnOnahole);
		//else this.addDisabledButton(0,"Onahole Her");
		//Needs dick or strap-on
		if (pc.cockThatFits(penny.vaginalCapacity(0)*1.5) >= 0) this.addButton(1,"OverDeskFuck",pennyOverTheDeskRoughFuck,undefined,"OverDeskFuck","Bend Penny over the desk and go to town.");
		else this.addDisabledButton(1,"OverDeskFuck","OverDeskFuck","You’re too big to bend her over the desk and fuck her.");
		if(penny.hasCock()) this.addButton(2,"Frottage",pennyFrottage,undefined,"Frottage","Grind dicks with Penny.");
		else this.addDisabledButton(2,"Frottage","Frottage","This scene requires Penny to have a dick.");
		this.addButton(3,"Pawjob",penniliciousPawjob,undefined,"Pawjob","Get a fluffy footjob from Penny.");
		this.addButton(4,"FaceFuckHer",faceFuckPenny,undefined,"FaceFuckHer","Fuck Penny’s face.");
	}
	else 
	{
		this.addDisabledButton(1,"OverDeskFuck","OverDeskFuck","This scene requires you to have a penis.");
		this.addDisabledButton(2,"Frottage","Frottage","This scene requires you to have a penis.");
		this.addDisabledButton(3,"Pawjob","Pawjob","This scene requires you to have a penis.");
		this.addDisabledButton(4,"FaceFuckHer","FackFuckHer","This scene requires you to have a penis.");
	}
	this.addButton(5,"EatHerOut",gardeFordWritesPennySmex,undefined,"EatHerOut","Eat out Penny.");
	if(penny.hasCock() && !pc.isTaur() && !pc.isNaga()) addButton(6,"U.Desk Suck",suckPennyUnderDesk,undefined,"Under Desk Suck","Suck Penny off under her desk.");
	else if(!penny.hasCock()) addDisabledButton(6,"U.Desk Suck","Under Desk Suck","Penny needs to be a hermaphrodite for this.");
	else addDisabledButton(6,"U.Desk Suck","Under Desk Suck","You need to have a body that would fit under Penny’s desk for this.");
	if(penny.hasCock() && pc.hasGenitals()) addButton(7,"Roleplay",pennyRPScene,undefined,"Roleplay","Roleplay a penitent prisoner for Penny to abuse.");
	else if(!penny.hasCock()) addDisabledButton(7,"Roleplay","Roleplay","Penny needs a penis in order to this.");
	else addDisabledButton(7,"Roleplay","Roleplay","You need genitals to roleplay with Penny.");
	if(penny.hasCock()) this.addButton(8,"Catch Anal",getAssFuckedByPenny,false,"Catch Anal","Get ass-fucked by Penny.");
	else addDisabledButton(8,"Catch Anal","Catch Anal","Penny needs a dick to fuck you in the ass.");
	
	if(pennyIsCumSlut()) this.addButton(9,"Selfsuck",pennySelfSuckCumsluttery,undefined,"Selfsuck","Watch Penny suck herself off.");
	else addDisabledButton(9,"Selfsuck","Selfsuck","Penny has to be a futanari cum-slut for this scene.");
	if(pennyIsCumSlut() && pc.hasCock()) this.addButton(10,"Bukkake",bukkakePenny,undefined,"Bukkake","Cooperatively cover Penny in spunk.");
	else addDisabledButton(10,"Bukkake","Bukkake","This requires Penny to be a futanari cum-slut and for you to have a penis.");
	if (flags["FLAHNE_TALKED_ABOUT_CUMSLUTPENNY"] != undefined && pennyIsCumSlut()) addButton(11, "Invite Flahne", pennyVsFlahneWhoWillOutslutWho,undefined,"Invite Flahne","Invite Flahne over for a threesome with Penny.");
	else addDisabledButton(11, "Invite Flahne","Invite Flahne","This scene requires Penny to be a cum-slut and Flahne to have been told about it.");
	this.addButton(14,"Back",approachGirlfriendPenny);
}

//Face Fuck Penny
public function faceFuckPenny():void {
	clearOutput();
	var x:int = pc.biggestCockIndex();
	showPenny(true);
	author("Savin");
	output("Even while she’s sitting, you can barely keep your eyes off Penny’s tight little ass, barely concealed by " + (penny.armor is UGCUniform ? "her skin-tight uniform":"her choice of casual wear") + ". Catching onto your attentions, Penny shifts ");
	if(!penny.hasCock()) output("excitedly");
	else output("uncomfortably");
	output(" in her seat, legs crossing and big fennec ears perking.");
	if(pc.legCount == 2) output(" You sit down on the corner of the " + (pennyIsCrew() ? "former-":"") + "police girl’s desk");
	else output(" You lean your inhuman body against the " + (pennyIsCrew() ? "former-":"") + "police girl’s desk");
	output(" and snake a hand in between her ears; you could swear you see her flush as you scratch her.");
	
	output("\n\n\<i>“Mmm, see something you like " + pc.mf("handsome","beautiful") + "?”</i> Penny purrs, fluffy tail swishing happily at your merest touch. Grinning down at her, you twirl your finger, still staring at her bountiful butt.");
	
	output("\n\nWith a quick look around to make sure nobody’s around to see, Penny slips out of her chair and pirouettes on a heel. Her hands brace against the wall behind her desk as she gives her hips a little wiggle for you, straining the tight fabric of her pants");
	if(penny.hasCock()) output(" as her bulge grows, clearly aroused by your undivided attention");
	output(". She moves faster, swaying her hips and wiggling her butt in a hypnotic dance, filling your gaze with a display of raw, animalistic sexuality: every move meant for your sexual gratification. And hers, by the looks of things. Turning back around to face you, Penny slides down the wall, spreading her legs to reveal a growing ");
	if(penny.hasCock())
	{
		output(" tent with a damp patch from its peak all the way down to its base");
	}
	else output(" damp patch over her crotch");
	output(". Her fingers dip in, swirling across the dark, taut fabric, teasing and caressing her sensitive bud.");
	
	output("\n\n\<i>“I love the way you look at me,”</i> Penny sighs, voice husky with desire. <i>“Why don’t you come prove that you liked the show?”</i>");
	
	output("\n\nShe licks her lips seductively, mouth wide open and inviting. You strip your gear off and slip around the desk as Penny adjusts her stance, getting her face at just the perfect height to accept your ");
	if(pc.cocks[x].cLength() >= 10) output("massive, ");
	output("throbbing need.");

	if(pc.cocks[x].cLength() >= 10) output(" <i>“I don’t know if I’ll be able to fit all that down my throat... but I’m sure as hell gonna try,”</i> Penny says, her voice filled with lust and want.")
	output(" Her nose brushes your underside, lifting your [pc.cock " + x + "] up as her tongue darts out, lapping at your base. Your shiver at her cool touch, her inhuman nose wet on your pecker as her tongue slides across your length.");
	
	output("\n\n<i>“Did just a little show like that get you this turned on?”</i> she teases, nuzzling your erection.");
	
	output("\n\nYou growl an affirmative, stroking the fox girl’s huge ears as she wraps her lips around your [pc.cock " + x + "], sucking it in. Her tongue plays across your glans, wrapping around the [pc.cockHead " + x + "] and slathering it with warmth. Oh, that feels good. You urge her on, bucking your [pc.hips] slightly, pushing ");
	if(pc.cocks[x].cLength() <= 10) output("every inch down her throat");
	else output("as much of your cock as she can take past her lips until she threatens to gag");
	if(pc.cocks[x].cLength() >= 18) output(" (which isn’t even half of your length)");
	output(". The fennec fox-girl groans as you push in, filling her mouth with cock, letting the first drooling drop of pre slide right down her throat. Leaning back against the wall, Penny tries to say something around her mouthful of dick, which sounds like an invitation to you. Grinning down at the hapless fox, you grab the sides of her head and ram your hips in!");
	
	output("\n\nYou launch into a brutal face-fucking, holding the fox’s head steady as you pound your prick down her throat like a battering ram. She gurgles and squirms in your iron grip, unable to resist your " + possessive(pc.cockDescript(x)) + " assault on her mouth. Eventually, she slumps back and takes it like a champ, letting her mouth hang agape as you press in, slathering up your prick in her drool until it drips from her lips in sticky strands. Her eyes roll back in her head, chest heaving as her fingers dip further and further into her honeypot, loosening her pants until they fall down to her ankles");
	if(penny.hasCock()) output(", letting her cock pop free. Her hands wrap around her throbbing erection, furiously stroking her [penny.cock]");
	output(". Masturbating with wild abandon, she moans around your spasming [pc.cockNounSimple " + x + "], gurgling as viscous streams of your salty pre slalom down her throat, her spittle turning more and more white with every thrust into her maw.");
	
	output("\n\nThrowing your head back and screaming in pleasure, you thrust in as hard as you can");
	if (pc.cocks[0].cLength() <= 10)
	{
		output(" until your ");
		if(pc.balls == 0) output("base");
		else if(pc.balls > 0) output("[pc.balls] ");
		if(pc.balls == 1) output("slaps");
		else if(pc.balls > 1) output("slap");
		if(pc.balls > 0) output(" against her chin");
	}
	output(". Penny yelps as your [pc.cock " + x + "] invades her throat, ramming down as your prick spasms and spurts, flooding her tight throat with a deluge of your [pc.cumColor] seed. Her wet, warm tongue lashes at the underside of your twitching staff, thrashing wildly as its owner desperately copes with the rush of cum pouring into her mouth. The feeling is heavenly, throat and lips squeezing your [pc.cock " + x + "] as you try and pull out of the well and truly face-fucked fennec fox; your body responds to the sensations by squeezing out another thick spurt of cream, depositing the glistening [pc.cumColor] dollop right on the tip of her tongue as it rolls out of her mouth, trailing behind your prick’s exodus with thick, slimy strands connecting her to you, tinted [pc.cumColor] by the mouthful of cum she just swallowed.");
	
	output("\n\nCollapsing to the floor, Penny wipes her mouth with the back of her hand, staining her thick fur with the evidence of your oral pleasure. <i>“That was... you’re an absolute beast, [pc.name]. ");
	if(pc.cocks[x].cLength() >= 10) output("My jaw is going to be sore for a while, a");
	else output("A");
	output("nd I can’t say I don’t love it.”</i> You sigh with relief, leaning back against her desk with [pc.cock " + x + "] still twitching, the last, most viscous drops of cum pooling on your [pc.cockHead " + x + "] before dropping onto the floor between the panting fox’s legs.");
	
	output("\n\nLike a charm, Penny’s ears perk and her tongue licks her lips.");
	
	output("\n\n<i>“Mmm, that was fun, you </i>");
	if(pc.cockVolume(0,false) >= 200) output("<i>big, hung </i>");
	output("<i>beast, but I still haven’t had my fill.”</i> She saunters over, hips swaying suggestively as she slips into your arms, pushing you back up against the desk. <i>“Wanna finish what you started, lover " + pc.mf("boy","girl") + "?”</i>");
	
	processTime(30+rand(15));
	pc.orgasm();
	penny.loadInMouth(pc);
	//[Fuck her butt] [Get ass fucked] [Nah, girl]
	clearMenu();
	if(pc.hasCock() && pc.cockThatFits(penny.analCapacity()*1.5) >= 0) addButton(0,"Fuck Her Butt",fuckPennyButtFromFraceFuckSceneNyahhhh,undefined,"Fuck Her Butt","Fuck Penny’s ass.");
	else addDisabledButton(0,"Fuck Her Butt","Fuck Her Butt","You need a dick that fits to fuck Penny’s ass.");
	if(penny.hasCock()) addButton(1,"GetButtFucked",getAssFuckedByPenny,true,"Get Butt Fucked","Let Penny drill you in the ass.");
	else addDisabledButton(1,"GetButtFucked","Get Butt Fucked","Penny needs to have a dick for this scene.");
	addButton(2,"Nah, girl",nahhhhGurrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrllllllllllllllllllllllllllllllllllll,undefined,"Nah, girl","You’re too tired for that right now.");
}

//Nah,girl
public function nahhhhGurrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrllllllllllllllllllllllllllllllllllll():void {
	clearOutput();
	showPenny();
	author("Savin");
	output("Way too exhausted after the furious face-fucking you just gave Penny, you sadly must decline. The pretty fox girl seems to deflate in your arms, but still gives you a hug and tells you to come back soon. <i>“After all, I owe you a good fucking for this!”</i>");
	this.clearMenu();
	this.addButton(0,"Next",mainGameMenu);
}

//Get ass fucked (Penny gotta have the D, yo)
public function getAssFuckedByPenny(fromFaceFuck:Boolean = false):void {
	clearOutput();
	showPenny(true);
	author("Savin");
	if(fromFaceFuck)
	{
		output("You grin ");
		if(pc.tallness <= 55) output("up ");
		else if(pc.tallness >= 66) output("down ");
		output("at the lusty fox-girl, and give her a little push. With a gasp, Penny flops back into her chair, rolling it right back against the wall. You pounce on her, straddling her and her big, throbbing cock, pointed right up at you like a third arm. Still reeling from the push and roll, Penny’s breath catches in her well-fucked throat as your fingers wrap around her [penny.cock], roughly stroking her prick until it’s as hard as diamonds in your grasp.");
		
		output("\n\n<i>“Mmm, you really want it, hmm?”</i> Penny says, hands reaching around your waist. A low moan escapes your lips as her small fingers, so delicate and yet so strong, dig into your [pc.butt], pulling you hard against her. You can’t resist the urge to kiss your lover, leaning in and pressing your lips to hers, tasting your seed still hot on her lips. Her tongue probes in, playing across your own, delving deep into your mouth as the predatory fox starts to take back control, kneading your flesh as she holds you fast to her, trapping your hand around her cock between your two bodies. She cups your cheek, holding the kiss a moment longer before you can lean back, still nuzzling her hand as you slip out of her lap and down onto your [pc.knees]. Your head rests gently in her lap, chin barely an inch from her erection which is twitching of its own accord, a pearly bead forming at its tip. Cooing happily, Penny strokes your [pc.hair], urging you on with a few growled words of encouragement. <i>“I did it for you, [pc.name]. The least you could do is return the favor...”</i>");
		
		output("\n\nGrinning up at her, you figure ");
		if(pc.isNice()) output("fair’s fair, after all");
		else if(pc.isMischievous()) output("you might as well lube her up before she gets any ideas of her own");
		else output("you might as well make her squirm before the main course");
		output(". You give her shaft a few experimental strokes, and in no time the police girl’s legs are trembling, breath quickening and cunt wettening, the sodden box drooling its feminine slime freely onto Penny’s chair. How cute. Your free hand snakes over, twirling around her prominent little clit until she gasps, back arched. You pick up the pace, jerking her off faster and faster until she squeaks a cute little moan, biting her lip as her hips buck, trying to fuck your hand like her personal onahole.");
	}
	else 
	{
		//Get Buttfucked (Alt. Intro, for dickless characters. Selectable from sex menu)
		output("Looking down at the lusty hermaphroditic fox-girl sitting before you, you can’t help but notice the bulge in her pants - the very thick, beautiful cock you convinced her to grow. Licking your lips, you slip down onto her " + (pennyIsCrew() ? "desk":"bed") + ", sitting with [pc.legOrLegs] dangling just inches from Penny’s lap. Seeing where your eyes are going, the fox-girl crosses her legs, blushing under her dark fur. You lean in and give her a scratch between the ears, running your fingers through her short, punky mohawk. Almost unconsciously, Penny nuzzles your hand, moaning lightly.");
		output("\n\n<i>“Got a few minutes, officer?”</i> you ask, grinning, <i>“I’ve got a real problem, and I think you and that [penny.cockNounSimple] of yours are just the thing to help.”</i>");
		output("\n\nPenny gulps as you slip into her lap, pushing her rolling chair back against the wall as you press your lips to hers. You pounce on her, tearing off her pants and straddling her and her big, throbbing cock, freed and pointing right up at you like a third arm. Still reeling from the push and roll, Penny’s breath catches in throat as your fingers wrap around her [penny.cock], roughly stroking her prick until it’s as hard as diamonds in your grasp.");
		output("\n\n<i>“I-is that so,”</i> Penny says, hands reaching around your waist as you unbutton her shirt, groping and sucking at her perky little tits. A low moan escapes your lips as her small fingers, so delicate and yet so strong, dig into your [pc.butt], pulling you hard against her. You can’t resist the urge to kiss your lover, leaning in and pressing your lips back to hers, tasting her hot breath, growing faster and more shallow as your tongue probes hers; it counters, delving deep into your mouth as the predatory fox starts to take back control, kneading your flesh as she holds you fast to her, trapping your hand around her cock between your two bodies. She cups your cheek, holding the kiss a moment longer before you can lean back, still nuzzling her hand as you slip out of her lap and down onto your [pc.knees]. Your head rests gently in her lap, chin barely an inch from her erection which is twitching of its own accord, a pearly bead forming at its tip. Cooing happily, Penny strokes your [pc.hair], urging you on with a few growled words of encouragement.");
		output("\n\nYou give her shaft a few experimental strokes, and in no time the police girl’s legs are trembling, breath quickening and cunt wettening, the sodden box drooling its feminine slime freely onto Penny’s chair. How cute. Your free hand snakes over, twirling around her prominent little clit until she gasps, back arched. You pick up the pace, jerking her off faster and faster until she squeaks a cute little moan, biting her lip as her hips buck, trying to fuck your hand like her personal onahole.");
	}
	//[Dickless scene intro combines back here]
	output("\n\nBut you’ll have none of that! You put a firm hand on her thigh, pushing her back down against the chair. Penny groans but doesn’t resist, letting you hold her down as you slip down between her legs, tongue rolling out down across her cock’s base. Slowly, you trail up and up her shaft, leaving a nice slick trail from stem to stern. Whining with pleasure, Penny tears her shirt open, bearing her nicely-rounded tits; she cups the two swollen mounds, squeezing her pink teats as you plant an affectionate kiss on her cockhead.");
	// If PC has C+ cup tits:
	if(pc.biggestTitSize() >= 3) {
		output(" The sight of the sexy fox playing with her own tits gives you an idea, though....");
	
		//Con’t: 
		output("\n\nYou rise up on your [pc.knees] and grab your [pc.chest], cupping the two heavy orbs and squeezing them together, giving Penny the perfect view of your sizable cleavage. Giving your tits a little jiggle for her, you lean in and let them wrap around her shaft, burying Penny’s cock in a bed of boobage. Slowly, you drag her [penny.cock] through the valley of your cleavage, lifting your tits up and down her girth until she’s left you a nice, pearly trail between your tits, her [penny.cockHead] just poking out between the two soft orbs. You gobble it up, sucking down the first inches of her cock as your tits work her length, sending the sensitive fox girl into a whole new realm of pleasure that soon has her panting and gasping, cock bubbling pre freely.");
	}
	
	output("\n\nYou don’t let up, continuing to jerk the foxy fox off until she’s putty in your hands, whimpering and moaning in pleasure, alternating between stroking her tits, pulling you down on her cock, and fingering her sodden box. You let her guide your head down her shaft, parting your lips to take every inch of her throbbing erection");

	if(chars["PENNY"].longestCockLength() <= 6) output(". You easily suck up her salty, musky cock, wrapping your tongue around the pulsing shaft until your [pc.lips] brush her crotch.");
	else output(" but quickly finding yourself overwhelmed. There’s just... so much of her. She’s completely stuffing your mouth and there’s still inches to go before you can nuzzle your [pc.lips] against her crotch.")
	output(" You look up at Penny expectantly, but find her eyes closed, head rolled back in pleasure, trying hard not to cum right in your mouth.");
	
	output("\n\nWith Penny’s pulsating prick nice and slathered in spit and drooling her musky pre, you deem her nice and ready for a real fucking. You slip up her svelte, vulpine body, trailing kisses and caresses up her belly to the peaks of her breasts, pushing her fingers aside to wrap your lips around one of the erect teats. You give the red bud a hard suck, pulling it back until it slips from your lips with a wet pop; Penny gasps, breath quickening as you shower her in affection. Her hands cup around your [pc.butt], lifting you into her lap, resting your head on her shoulder. She spreads your cheeks, squeezing them roughly as her [penny.cock] slips in, sliding into your [pc.butt]’s cleavage before her fingers let go, trapping her meaty shaft in your cheeks.");
	
	output("\n\nGrabbing the fox’s lithe shoulders for support, you start to move your hips, gently sliding along the length of her " + num2Text(Math.round(penny.cocks[0].cLength())) + "-inch shaft. You take every inch slowly, tenderly squeezing and rubbing her thick pole’s entire length until just the head is parting your cheeks before you slide back down. Penny cries out, practically trembling in your grasp as your [pc.butt] pleasures her prick, humping away until you can feel her [penny.cock] twitch violently, practically spasming as it spurts a glob of pre right on your [pc.asshole]. Warm and wet and oh-so-sinfully sticky, you shudder with pleasure as Penny gives you her very own lube, adding to the slick coating you’ve given her cock already. Well, she’s clearly ready and raring to go, and you can’t deny the burning need growing in your loins.");
	
	output("\n\nYou press your lips to hers, locking Penny in a kiss as you rear up, grabbing her cock and holding it steady. Her fingers lock around yours, holding you for a brief second before spreading your cheeks wide, letting you glide down her throbbing shaft. It parts your walls with a second of mind-numbing pressure, her head spearing past your sphincter a second later. You both moan with shared breathless pleasure as your [pc.hips] slide down, taking inch after inch of [penny.cock], feeling your stomach churn as the thick member spreads you wide. Penny’s hands lock on your hips, guiding your descent until your butt’s on her lap, balancing on her legs as her cock twitches and spurts inside you, filling your ass with juicy fox-pre.");
	penny.cockChange();
	
	output("\n\n<i>“So good...”</i> Penny whimpers, ");
	//if PC is tight
	if(pc.ass.looseness() <= 1) output("<i>“so t-tiiiight...”</i>");
	else if(pc.ass.looseness() <= 3) output("<i>“fits just like a glove...”</i>");
	//if PC is SUPAH LOOSE:
	else output("<i>“m-maybe I ought to grow this beast out a little, [pc.name]... if I want to keep up with a gaped slut like you....”</i>");
	pc.buttChange(penny.cockVolume(0),true,true,false);
	
	output("\n\nYou silence her with another kiss, pinning her back as your arms wrap around her neck, steadying yourself as your hips begin to rise. Your breath comes ragged as you rise off her cock, feeling the hollow emptiness overwhelm your hole as you nearly dismount her rod, only to be filled with inch after inch of foxy cock again. The feeling of completeness, of wholeness, is undeniable. You sit a moment, relishing the sensation, before rising again, dragging out the heavenly feeling of your anal walls being spread and sphincter ravaged across bounce after bounce.");
	
	output("\n\nYou don’t have any warning at all when Penny cums: only a quiet, feminine grunt and a sudden warmth in your ass as her [penny.cock] twitches and churns, blasting in a sticky white load deep in your bowels. You gasp and moan, quickening your pace to milk her spasming prick.");
	if(pc.biggestTitSize() >= 3) output(" Throwing her head back, Penny grabs your tits, roughly squeezing the full mounds of your breasts as you ride her cock to fulfilment.");
	else output(" Throwing her head back, Penny reaches around to grab your ass, squeezing the full cheeks as you ride her cock to fulfilment.");
	output(" Both groaning in pleasure, you buck and bounce on the fox’s cock while she shoots load after load of bubbling fox cream deep up your ass, painting your rectal walls white with seed.");

	//If PC has a cock:
	if(pc.hasCock()) 
	{
		output("\n\nThe feeling of Penny’s seed coating your prostate, slathering the sensitive bud in hot cum, is too much for you. With a " + pc.mf("primal roar","feminine whimper") + " you feel [pc.eachCock] spasming, [pc.balls] churning as your own [pc.cumColor] spunk rushes up your cumvein");
		if(pc.cockTotal() > 1) output("s");
		output(". Penny yelps as a blast of hot, sticky jizz splats onto her belly, staining her dark fur [pc.cumColor]");
		if(pc.cumQ() >= 50) output(" as a particularly powerful spurt shoots upward, smearing onto her neck to dribble down onto her breasts");
		output(".");
	}
	//IF PC has a cunt:
	if (pc.hasVagina())
	{
		output("\n\nYour quim clenches and spasms as Penny’s cock spears your ass, desperate for some semblance of pleasure, for a big, thick fox-cock to milk. Your fingers delve into your [pc.vagina], swirling around [pc.oneClit], trying to bring it a little pleasure, tiding it over as your [pc.asshole] clenches hard on Penny’s [penny.cock], an anal orgasm working through your body until you’re shivering and moaning in rectal pleasure.");
	}
	output("\n\nExhausted, you collapse onto Penny, chin resting on her shoulder as you both heave and sigh, basking in the exquisite pleasure, feeling your lover’s rod still moving inside you, depositing its last drops of salty seed deep in your bowels. Penny groans, holding you close as her ");
	if(penny.hasKnot(0)) output("knot");
	else output("cock");
	output(" starts to deflate, letting her slowly pull it from your battered hole. You shudder as the feeling of absolute emptiness overwhelms you, but that sensation quickly gives way to warmth and wetness as her seed follows her cock, drooling out of your [pc.asshole] to pool between your lover’s legs.");
	
	output("\n\n<i>“Such a little buttslut, my mate,”</i> Penny growls, giving you a nip on the ear. <i>“And I love it.”</i>");
	
	output("\n\nYou stumble to your [pc.feetOrFoot], helping the weary fox-girl up and pulling her into a tight hug. <i>“All right, all right,”</i> she laughs, giving you a quick kiss, <i>“go on, get going. I’ve gotta clean up" + (!pennyIsCrew() ? " before someone comes by":"") + ".”</i>");
	output("\n\nYou give the lusty fox a quick pat on the rear and saunter off, walking a bit stiffly as your anus recovers from the pounding it just took.");
	pc.orgasm();
	pc.loadInAss(penny);
	processTime(32);
	this.clearMenu();
	this.addButton(0,"Next",mainGameMenu);
}

//Fuck Her Butt (From Facefuck scene)
//Read the function name in Lothar’s voice.
public function fuckPennyButtFromFraceFuckSceneNyahhhh():void {
	clearOutput();
	showPenny(true);
	var x:int = pc.cockThatFits(penny.analCapacity());
	if(x < 0) x = pc.smallestCockIndex();
	output("Finish what you started? As if she had to ask.");
	output("\n\nYou grab Penny’s tight ass, pulling her close against yourself as you kiss her, tasting your seed still hot and [pc.cumFlavor] on her lips, her breath still heavy and tainted with lusty moans. Her arms slip around your waist, squeezing your [pc.butt] right back before they trace around your [pc.hips], furry fingertips brushing along sensitive [pc.skin] until they delve into your groin, wrapping around your spit-slick cock, still brimming with juicy cum and ready to fuck it into the lusty fox until she’s screaming for more.");
	output("\n\n");
	if(penny.hasCock()) showImage("PennyBentOverDeskFuta");
	else showImage("PennyBentOverDesk");
	output("With one easy motion, you flip Penny around so she’s lying on her belly, legs spread and heiny hiked in the air, swaying seductively as the dazed fox recovers. You sink your fingers into that ass, kneading her taut, tight bum until Penny is squirming in your grasp. Her breath is shallow and ragged as you savage her butt, lavishing every inch with gropes and caresses, sliding your fingers through her thin, velvet-soft fur. Slowly, you work your way down, gently spreading her legs even further until you can slide a finger into her drenched cunt, still sodden with feminine slime. Penny lets out a low, sensual moan as your fingers dip into her honeypot, swirling around the quivering walls of her quim until your fingers are nice and soaked with the fox girl’s own lubricant.");
	output("\n\nWhen you pull out, fingers trailing with shimmering slime, Penny rolls over to face you, chest heaving as she stares down at you. Her hips wiggle, legs wrapping around your shoulders as you get down on your [pc.knees], grinning at the puckered little hole hidden between her tight, furry cheeks.");
	
	output("\n\n");
	//If First time anal:
	if (flags["PENNY_TIMES_ANAL_SEXED"] == undefined)
	{
		output("Penny squirms as your fingers trace along the crescent of her cheek, breath catching as your slick finger presses gently against her ass. <i>“Be gentle, my mate... I haven’t done a lot of this before.”</i>");
		
		output("\n\nYou grin at the police girl and pat her thigh, telling her you’ll be extra gentle. ");
		flags["PENNY_TIMES_ANAL_SEXED"] = 1;
	}
	else flags["PENNY_TIMES_ANAL_SEXED"]++;
	output("Leaning up to plant a quick kiss on her prominent red bud, you press two fingers down with a gentle but unyielding force against Penny’s tightly-clenched sphincter. With a gasp and a pop, the tips slide in, vanishing through the clenching hole into the dark, smooth, and sinfully tight confines of her anal passage. Her whole body seems to react to the moment of penetration: her back arches, legs writhing around you. Penny’s fingers dig into the desk, teeth gritting as your first knuckle passes through her sphincter, pushing through the madly contracting muscle and into the dark depths of her hole. The second knuckle passes a long moment later, and Penny’s practically crying with pleasure and pressure, squirming and straining against the desk as you gently move back out and in again, smearing her feminine lube liberally on her warm walls, getting her nice and wet and loose for you.");
	output("\n\nWith a few final, furious thrusts, you pull your fingers from the fox’s butt, letting her catch her breath from the relentless finger-fucking. You stand, bracing your hands on her shaking knees as your stiff, [pc.cock " + x + "] comes to rest against her thigh, both your cock and her tender flesh practically quivering in sexual anticipation. You stroke your member, guiding the mighty shaft to Penny’s slick ass, letting the [pc.cockHead " + x + "] gently press against the clenched hole. The foxy beauty stops you, though, just a moment before penetration: Penny grabs your hands in hers, guiding them to her hips and lacing her fingers through yours, holding you tight as you finally push in.");
	pc.cockChange();
	
	output("\n\nThe entrance is pure bliss. Penny’s ass is a silken vice around your [pc.cock " + x + "], a perfect glove to fit your probing member, glistening with feminine lubricant to ease the entry past her quivering muscles, contracting and squeezing in mindless quasi-rhythm. Your head rolls back, a pleasured sigh escaping your lips as you revel in the milking vice churning around your prick. Your hips sink in, slowly spearing your [pc.cock " + x + "] deeper into Penny, making the poor police girl moan and scream, arching her back and squeezing her breasts, trying desperately to take your length in her tight hole. Finally, after long moments of pressure and exertion, you feel your [pc.cock " + x + "] ");
	if(pc.cockVolume(x) < penny.analCapacity()) output("bottom out inside her, your groin pressing against her tight cheeks");
	else output("has reached the limit of what the little fox can take, leaving inches of your massive girth outside in the cold air");
	output(". Breathing hard, Penny looks up at you with lust-glazed eyes, whimpering with need.");
	
	output("\n\n<i>“G-go on... fuck me. Please...”</i> she moans, jerking her hips ever so slightly, trying to get a little more of your prick. With a face like that, torn apart by lust and need, you can’t help but give her what she so desperately wants.");
	
	output("\n\nGripping Penny’s hips, you start to move, slowly at first, giving the fennec girl a chance to adjust to the anal assault, each motion taking several seconds from pull to thrust. She moans and groans, voice steadily growing from primal grunts of pleasure and pain to ecstatic cries of sexual satisfaction, screaming your name and her love for your [pc.cock " + x + "] as you pick up the pace, jackhammering her ass with abandon. Her legs lock around your waist, pulling you harder against her, jamming your prick deep in her hole, forcing you to go faster and faster until your hips feel like they’re on automatic, furiously buttfucking the fox until she’s screaming at the top of her lungs. Stacks of data slates and jars of pens go flying off her desk as your [pc.legs] slam into it, the whole room seeming to shake as your lovemaking approaches its crescendo.");
	
	output("\n\nThrowing your head back with a cry of pleasure to rock the heavens, your [pc.cock " + x + "] discharges its load deep into the fox’s ass, hips humping and her muscles squeezing, milking the first thick globs of [pc.cumColor] seed to paint her anal walls. Her ass contracts around you, muscles running rampant as the fox joins you in orgasmic bliss, bucking her hips on your thrusting member until you can see her cunt spasming, soaking her fur as she cums and cums.");
	
	output("\n\nMinutes pass in ecstasy, feeling the slow deluge of your seed pouring into Penny’s bowels, enjoying her muscles around your member and the cute moans she makes as she soaks herself in femcum. Eventually, your joint orgasms wear down, and you’re able to gently pull yourself from the fox’s gaping hole, letting the excess cum pour out and pool on the floor. Penny groans, trying to stand and failing miserably. Eventually, she just rolls onto her belly and smiles absently as you grab your gear, a fuck well done.");
	
	output("\n\n<i>“That was amazing, my mate,”</i> she purrs, patting her well-fucked ass. <i>“Let’s do it again... and soon.”</i>");
	pc.orgasm();
	penny.loadInAss(pc);
	processTime(27);
	this.clearMenu();
	this.addButton(0,"Next",mainGameMenu);
}

//Pennilicious Pawjob
public function penniliciousPawjob():void {
	clearOutput();
	showPenny(true);
	output("<i>“A little paw-play, huh? Well I guess I do have the fluffiest feet on the planet,”</i> Penny muses as she rounds " + (pennyIsCrew() ? "her chair":"the desk") + ". Her hips swish back and forth seductively, drawing your eyes down to her hip-hugging pants");
	if(penny.hasCock()) output(", her [penny.cock] hard and free, bouncing with anticipation");
	output(". She rubs a furred paw against your [pc.leg] affectionately");
	if(inPennyQuest() || pennyIsCrew())
	{
		output(" before turning back to smile at you, squeezing teasingly. She does not leave you to wait long, however.");
		output(" Her fluffy paw migrates higher to press against [pc.oneCock]");
		if(!pc.isCrotchExposed()) 
		{
			output(" through your [pc.crotchCoverUnder]");
		}
		output(", squeezing it with tantalizing soft pads. You cheerfully answer, <i>“Ohh yeah,”</i> and grind your [pc.hips] up against it.");
		if(!pc.isCrotchExposed()) output("\n\nStripping out of your equipment,");
		else output("\n\nSetting your possessions aside,");
		output(" your turn to take in your the sight of your foxy lover. The tawny girl stripped naked while you were divesting yourself of your belongings, and she’s standing " + (pennyIsCrew() ? "totally nude":"between you and the venus ziltraps") + ". This gives you a perfect view of her pert, almost heart-shaped rump, exposed by her upraised tail. It wags back and forth above her while she ensures your privacy, allowing you to see everything from the pink lips of her sex to the darker pucker of her anal star.");
		output("\n\nYou’re considering jumping her right now, but the foxy fennec finishes up and turns around, catching you mid-stare. She smiles genuinely and turns back around, walking backwards with an exaggerated sway to her steps, wiggling her bottom with almost hypnotic motions. Tickling at your nose, the vixen’s tail slides down your chest to press back on you, guiding you toward the " + (pennyIsCrew() ? "ground":"bed") + ". You flop back, looking up at the short");
		if(pc.tallness >= 65) output("er");
		output(" woman while she circles around, shaking her body for your enjoyment until she sits down beside you.");
		output("<i>“So, mate, do you mind licking me out</i>");
		if(penny.hasCock()) output("<i> or sucking me off</i>");
		output("<i> while I do this, or we going to forget this foot business and just get naughty?”</i> Penny asks.");
	}
	else 
	{
		output(" before turning away towards the cells. Rather than take you into the general holding cells, she veers a left down a dank-looking corridor toward a single metal door.");
		//First time
		if (flags["TIMES_PENNY_PAWJOBBED"] == undefined)
		{
			output("\n\nThe short, stacked vixen arches her back and looks over her shoulder, raising one paw to lewdly press on your crotch");
			if (pc.armor.shortName != "" || pc.lowerUndergarment.shortName != "")
			{
				output(" through your ");
				if(pc.armor.shortName != "") output("[pc.armor]");
				else output("[pc.lowerUndergarment]");
			}
			output(". The oh-so-soft pads upon the bottoms of her feet compress nicely against you as she soothingly prattles, <i>“Don’t worry about the decor, mate. There’s no more private place than the inside of a solitary confinement cell.”</i> She jangles the key ring on her hips, but you barely notice. You’re openly grinding against her foot as she talks, so into the act that you’re really beyond caring. <i>“Do my squeezing, caressing little toes have you feeling so good that you don’t even care about potentially getting locked in a cell?”</i> the vixen purrs. You nod, explaining in panting breaths that you trust her");
			if(pc.isAss()) output(", to avoid pissing her off");
			output(".");
		}
		//Repeat
		else
		{
			output("\n\nThe vixen glances your way, seeing the smile on your face, and she slowly raises a paw in your direction, holding it up at crotch level but not quite against you. <i>“Ready for another night in solitary confinement?”</i> she asks with a lewd smile.");
			output("\n\nYou step forward so that her fluffy paw is pressing against [pc.oneCock]");
			if (pc.armor.shortName != "" || pc.lowerUndergarment.shortName != "")
			{
				output(" through your ");
				if(pc.armor.shortName != "") output("[pc.armor]");
				else output("[pc.lowerUndergarment]");
			}
			output(", squeezing it with tantalizing soft pads. You cheerfully answer, <i>“Ohh yeah,”</i> and grind your [pc.hips] up against it.");
			output("\n\nPenny sighs ruefully, jangling her keys to double-check that she brought them while you busy yourself on her supple toes. <i>“Atta " + pc.mf("boy","girl") + ", come along now.”</i>");
		}
		//Merge
		output("\n\nSliding open the door, Penny takes her time in order to allow to you to really work yourself up on her fluffy extremity. She does not give you too long to enjoy the paw-grinding. Instead, she pulls her leg away and enters the room, leaving you to chase along after her.");
		output("\n\nYou enter the darkened room behind her");
		if(!pc.isNude()) output(", stripping out of your equipment as you go");
		else output(", setting your possessions aside");
		output(", and turn to take in your surroundings. There’s not much to see - a simple cot with clean sheets, a toilet in the corner, and a light fixture that only has one working light source. That’s discounting the other occupant of this little cell. The tawny girl stripped naked while you were divesting yourself of your belongings, and she’s now sealing the door. This gives you a perfect view of her pert, almost heart-shaped rump, exposed by her upraised tail. It wags back and forth above her while she ensures your privacy, allowing you to see everything from the pink lips of her sex to the darker pucker of her anal star.");
		
		output("\n\nYou’re considering throwing your earlier suggestion out the window, but the foxy fennec finishes up and turns around, catching you mid-stare. She smiles genuinely and turns back around, walking backwards with an exaggerated sway to her steps, wiggling her bottom with almost hypnotic motions. Tickling at your nose, the vixen’s tail slides down your chest to press back on you, guiding you towards the bed. You flop back onto the simple prison bunk, looking up at the short");
		if(pc.tallness >= 65) output("er");
		output(" woman while she circles around, shaking her body for your enjoyment until she sits down beside you.");
		
		output("<i>“So, mate, do you mind licking me out</i>");
		if(penny.hasCock()) output("<i> or sucking me off</i>");
		output("<i> while I do this, or we going to forget this foot business and just get naughty?”</i> Penny asks.");
	}
	//[Lick Out] [Suck Off] [GetGroundOn] [Frot]
	//The first two go to the same scene with variations. The second two are unique.
	this.clearMenu();
	this.addButton(0,"Lick Out",lickOutSomePennyDawg,undefined,"Lick Out","Eat out Penny’s vagina.");
	if(penny.hasCock()) this.addButton(1,"Suck Off",suckOffPennyDawgYoMahDiggity,undefined,"Suck Off","Suck off Penny’s cock.");
	else addDisabledButton(1,"Suck Off","Suck Off","You can only suck off Penny if she actually has a dick.");
	this.addButton(2,"GetGroundOn",getGroundOnByPenny,undefined,"Get Ground On","Have Penny mount your dick and grind across its length.");
	if(penny.hasCock()) this.addButton(3,"Frot",pennyFrottage,undefined,"Frot","Rub dicks with Penny.");
	else addDisabledButton(3,"Frot","Frot","Penny needs to have a dick in order for you to frot with it.");
}

//Lick Out
public function lickOutSomePennyDawg():void {
	clearOutput();
	showPenny(true);
	output("You motion for Penny to mount your face");
	if(inPennyQuest()) {}
	else if(pennyIsCrew()) output(" and recline back onto her well-cushioned bed");
	else output(" and recline back onto the meager cushions your temporary bunk affords you");
	output(". Gleefully giggling, the fox-girl sweeps herself up onto your middle, assailing you with her body heat for a moment until she begins to drag herself upwards. Her moisture is leaking from her slit just enough for you to feel it trickling on your [pc.skinFurScales] as she moves. You reach up, grabbing her supple butt, and you drag her the rest of the way to your face, setting her down so that she’s straddling your head, her moist slit kissing your lips with leaking liquid affection. It seems to draw your tongue inside it without any action from you, but that can’t be the case. Your anticipation has risen to maddening levels, giving you all the motivation you need to service the fennec while you await the reciprocation of pleasure.");
	suckAndLickAtPennyYouDildo(false);
}
//Suck Off
public function suckOffPennyDawgYoMahDiggity():void {
	clearOutput();
	showPenny(true);
	output("You open your mouth into a wide-stretched ‘o’ and flop out your tongue");
	if(inPennyQuest()) {}
	else if(pennyIsCrew()) output(" and recline back onto her well-cushioned bed");
	else output(" and recline back onto the meager cushions your temporary bunk");
	output(" as the message sinks into Penny’s lusty, hermaphroditic psyche. She squeals a moment later, leaping up onto " + (inPennyQuest() ? "you":"the bed with you") + ". Her [penny.cock] flops down squarely between your [pc.fullChest], and ");
	if(pc.biggestTitSize() >= 1) output("you teasingly squeeze them down around her in a breasty hug");
	else output("you teasingly press it against your flat body to give her a little more sensation");
	output(". Penny groans, but she keeps moving higher, dragging her twitching, erect boner up your body to your face. A single dollop of pre beads on the tip, hanging lower and lower. Penny aims it down and slides it straight through your open lips. Gurgling, you accept her [penny.cock] as well as you can, taking it deep inside you, suppressing your gag reflex as well as you’re able. A single, muffled moan vibrates through her boner as you lick at the shaft, aching for her to touch you down below.");
	suckAndLickAtPennyYouDildo(true);
}

//Merge suck off and lick out
public function suckAndLickAtPennyYouDildo(dick:Boolean = true):void {
	output("\n\nPenny gasps, <i>“Oh, mate, you are something else.... Your mouth, god! It’s good!”</i> She whimpers a little, coupled with a sexy wriggle atop you to press her genitals more firmly into your accomodating mouth. <i>“I guess it’s time I held up my- ooohhhh... umm, end of the bargain.”</i> A second later, there’s soft fur tickling at [pc.oneCock], pressing down on it from both sides at once. The vixen’s supple paws push down on either side. Her pads feel heavenly against your [pc.cockBiggest], perfectly textured with their puffy, super-soft pads. Groaning into Penny’s crotch, you struggle to hold still so that her feet can properly tend to you.");
	output("\n\n<i>“You like that, don’t you, [pc.name]? You like my foxy paws wrapping around your cock and stroking it, jacking you off with my feet,”</i> Penny states with a sigh. Her toes interlace around your [pc.cockBiggest]");
	if(pc.biggestCockVolume() >= 500) output(" as well as they can, given its girth");
	output(", and she begins to pleasure you. Twisting them around, she keeps one on top for a while, slowly pumping up and down, squeezing your naturally secreted lubricant onto the other before switching. Then, the process begins anew, making Penny’s feet shine with sexual juices while they clasp your cock in their honeyed embrace. It’s all you can do not to thrust and try to fuck her feet right then and there.");
	output("\n\nGrabbing hold of the fennec-morph by her curvy bottom, you try to focus on the oral you’re providing - anything to distract your body from its building need to fuck, to thrust wildly and with reckless abandon into the faux orifice surrounding it. Sensing this, Penny takes her slick paws and begins to go faster, polishing your [pc.cockBiggest] with its own juices. The alternating textures of her soft fur and pleasant pads are stoking your ardor until you feel like your whole body is a blaze of sexual need, but you strain to hold still. You’re determined to let her feet bring you to climax, after all.");
	output("\n\nYou start to moan enthusiastically into Penny’s crotch. The vibrations only serve to turn her strokes jerky and irregular, which in turn heightens your own excitement. The fox-girl grunts, <i>“Come on, my </i>");
	if (dick) output("<i>cock</i>");
	else output("<i>cunt</i>");
	output("<i>-pinned prey! Cum for me! Shoot it out all over my paws!”</i>");
	
	output("\n\nPenny’s feet are completely soaked with your pre-cum by this point, and each sloppy stroke is squelching quite noisily in the confined space. A knot of pressure has begun to well up inside you, signaling that your impending climax is but a moment away and growing more and more noticeable with each passing heartbeat. You whip your tongue around ");
	if (!dick) output("inside the fox-girl’s clenching cunt with wild abandon, suddenly hungry to taste her climactic juices.");
	else 
	{
		output("the fox-girl’s trembling shaft with wild abandon, suddenly hungry to feel her pump her hot load straight into your throat.");
		if(pc.balls > 0) output(" Her balls are tightening above you and alert you to the success of your actions.");
	}
	output(" Then, she cums, pouring her juices into your mouth, and you find yourself cumming with her.");
	
	output("\n\nYour hot load spews out onto your belly, one jet after another. Penny intervenes mid-climax, rubbing a paw against the topside of your spurting cock and guiding her other in the way of your slippery stream. Your [pc.cumColor] pleasure washes across her foot, and she grunts, still cumming into your mouth while she enjoys watching your [pc.cum] cling to her soles.");
	var cumQ:Number = pc.cumQ();
	if (cumQ >= 40) 
	{
		output(" The excess rolls off you to either side to soak into the " + (inPennyQuest() ? "muddy ground, turning it":"mattress pad, turning the bunk") + " into a sopping mess");
		if(cumQ >= 500 && !inPennyQuest()) output(", eventually overwhelming its meager absorptive capabilities to cascade onto the floor");
		output(".");
		if(cumQ >= 1000)
		{
			if(!inPennyQuest()) output(" Luckily, there’s a drain to catch the waves of spooge you put out, and you don’t wind up flooding the entire " + (!pennyIsCrew() ? "cell" : "area") + ".");
			else output(" Luckily, the floor is sloped, so the waves of spooge you put out are free to flow away.");
		}
	}
	if(dick) output(" The prick-toting vixen is no slouch when it comes to cum production, and you’re actually grateful that she’s buried so deeply into your throat, as it saves you the trouble of having to swallow. She shoots straight into your belly until you’re feeling " + (penny.cocks[0].cLength() >= 14 ? "awfully swollen":"full") + ".");

	output("\n\nEventually, both your climaxes die down. Penny lazily mops up some of the jizz that missed her with the clean paw, soaking it in [pc.cum]. Your juices trail from her padded foot in a sticky web, and the fox-girl giggles at her ineffectual attempts to clean you up. She even spends a few moments rubbing her drenched soles over [pc.eachCock], soaking you with your liquified bliss, allowing you to luxuriate in post-climactic ecstasy.");
	
	if(!inPennyQuest())
	{
		output("\n\nOnce you’ve had your fill, you push the lewd little fox-girl off of you, feeling quite sated and sticky. Penny teases, <i>“Ohhh, mate, you’ve soiled my feet! I need a shower now!”</i> That doesn’t stop her from walking in a way that has her slippery limbs sliding against each other, smearing your leavings higher and higher up her calves on her way to the door. There’s the satisfying click of a lock being disengaged, and Penny scampers away, ");
		if(penny.hasCock()) output("[penny.cock] flopping comically between her legs, ");
		output("leaving [pc.cumColor] footprints in her wake. You grab your gear and see your way back out" + (!pennyIsCrew() ? " to her office" : "") + " now that you’ve gotten a handle on your baser urges.");
		pc.loadInMouth(penny);
		processTime(34);
		pc.orgasm();
		penny.orgasm();
		this.clearMenu();
		this.addButton(0,"Next",mainGameMenu);
	}
	else
	{
		output("\n\nOnce you’ve had your fill, you push the lewd little fox-girl off of you, feeling quite sated and sticky. Penny teases, <i>“Ohhh, mate, I hope that’s enough for you!”</i> She walks away, ass wiggling happily, to gather her things. <i>“We’ve got a busy mission ahead of us, after all!”</i>\n\n");
		pc.loadInMouth(penny);
		processTime(34);
		pc.orgasm();
		penny.orgasm();
		CombatManager.genericVictory();
	}
}

//GetGroundOn
public function getGroundOnByPenny():void {
	clearOutput();
	showPenny(true);
	output("<i>“Huh,”</i> Penny responds, <i>“I was kind of looking forward to seeing how much of your [pc.face] and [pc.tongue] I could cram in my pussy.”</i> She shrugs noncommittally. <i>“A cock is fine too.”</i>");
	output("\n\nYour [pc.cockBiggest] is suddenly squeezed by the vixen’s soft fingertips. She caresses it lovingly while admitting, <i>“Oh, I’m definitely going to enjoy this.”</i> One furry thigh after another, Penny throws herself up onto the cot to straddle your [pc.hips]. Your member, previously hard and jutting slightly upward, is swiftly pinned between your two bodies. Penny’s plush mound and petite cleft grind against it, spreading slightly over your urethral bulge. Her legs splay wider, almost into a perfect split as she settles in, rubbing her plush, pink cunt back and forth along your length gently, smearing a trickle of lubricants onto your dick. You sigh and look up at the big breasted fennec. Her curvy breasts bounce slightly, and your eyes fixate on the pink nipples while you enjoy the feel of her sex on you.");
	output("\n\nPenny sighs and leans forward, letting her elbows drop down to either side of your face. Her big, blue eyes peer into yours, and she abruptly licks the side of your face. You frown up at her until she tilts her head to plant a proper kiss upon your [pc.lips], putting that tongue to work in your mouth. At the same time, her rump begins to shake, ass-cheeks jiggling. The bouncing can be felt through the soft folds shrouding part of your [pc.cockBiggest]. Shivers of excitement radiate out around the point of sensuous contact, causing you to moan excitedly. Giggling, the fox-girl slides herself forward, dragging her posh cunt across your cock, the velvet curtains massaging your flesh every bit as wonderfully as a masseuse’s hands.");
	// Boobiegrind
	if (pc.biggestTitSize() >= 1) 
	{
		output("\n\nYour [pc.nipples] drag across Penny’s lush breasts as she moves into position. She giggles and squeezes your breasts with one hand - an act that requires her to balance quite oddly on the other. She manages it quite well, letting you enjoy the feeling of her furry teats pressed against yours, rubbing back and forth the same way her twat is gliding along your [pc.cockBiggest]. You grab hold of the matched bosoms and let your hands do what they want, sometimes squeezing Penny’s teats and other times groping your own. Sometimes your fingers find your way into the sea of nipples to pinch, tug, and tweak.");
	}
	// No boobies
	else
	{
		output("\n\nWith her tits hanging down like that above you, there’s no way you couldn’t grab hold of them and squeeze. Your hands reach up to cup Penny’s soft bosom, caressing her heaving mammaries, feeling the sweat beading on her skin under the fur. It makes your hands slide all the more easily across the plush orbs. You arrest your slippery gropes and let your digits find her pink, puffed up nipples. They’re pebbly and humanlike in shape in texture, unlike much of the rest of the vixen, and you grab them, tugging Penny’s perky nipples up and down to guide her cunt across your [pc.cockBiggest].");
	}
	//Merge
	output("\n\nThe fox-girl’s kisses become more passionate as you play with her mammaries and nipples. Her tongue is now violently spearing through your [pc.lips], plunging again and again into your mouth with rapacious delight. Simultaneously, Penny’s hips undulate so fast that she’s had to stop shaking her ass. Her pussy is so hot and wet that you swear it’s practically steam-bathing your [pc.cockBiggest], and every time that wet gash slides back down, the angle presses the tiny, tight bud of Penny’s clit against you. She moans into your mouth whorishly, finally abating her eager mouth-fucking long enough for you to wrangle her tongue back inside her maw, pushing it with your own. Wet warmth drips over your [pc.cockBiggest]. The fennec is creaming herself all over your cock right now.");
	
	output("\n\nFinding Penny far less assertive with her faculties softened by pleasure, you grab hold of her hips and begin to vigorously fuck your cock through her spasming slit. The bits of her walls that you can feel are trembling with orgasmic pleasure, and her dripping ladyspunk visibly shines your [pc.cockBiggest]. Your phallus becomes so drenched with it that it shines. Coming near climax yourself, you rub her body faster and faster atop you, letting her mouth fall completely away from yours while you piledrive her insensate form. At long last, you feel your own climax approaching, and you make one last, long thrust from [pc.cockHeadBiggest] to [pc.sheath] through her gates.");
	output("\n\n[pc.Cum] bubbles up out of your dilating cum-slit, launching out in long ropes that spatter between Penny’s body and your own. Her fur slickens, and her body soon feels both slippery and stuck against you. Enjoying your ecstasy, you nip at Penny’s ear, licking along behind the edge of it. Her entire body quakes as soon as you touch that sensitive dish. When your tongue contacts it, her pussy gushes a fresh deposit of girlcum onto your boner, and her legs begin to tremble atop your");
	if(pc.legCount > 1) output("s");
	else output("[pc.legs]");
	output(".");
	if (pc.cockTotal() > 1)
	{
		output(" Your other erection");
		if(pc.cockTotal() > 2) output("s spew");
		else output(" spews");
		output(" a little off to the side, over your hip and onto the mattress.");
	}
	output("\n\nYou hold her there, pumping out your [pc.cum] onto both your bodies, forcing her to feel the warm, wet juices sliding into her fur. Her mouth falls open and her tongue lolls out. An unmistakably happy smile is painted upon her face, even if the spark of intelligence behind her eyes is still missing. All that you can see is animal pleasure, a feeling matched by the pulsing throbs down below.");
	var cumQ:Number = pc.cumQ();
	if(cumQ <= 100) {}
	else if(cumQ <= 500) output(" [pc.Cum] spills off your sides to soak into the mattress by the time you finish, soaking it with [pc.cumColor].");
	else
	{
		output(" [pc.Cum] spills off your sides, soaks the mattress, and falls in syrupy waterfalls down to puddle on the floor.");
		if(cumQ >= 2000) 
		{
			output(" That puddle doubles in size, then triples");
			if(cumQ >= 10000) output(", then the entire floor is filling");
			output(".");
		}
	}
	output("\n\nOnce you’re done cumming and Penny has come back to consciousness, the fox-girl throws herself off of you with an accusing glare. <i>“Careful with the ears, they’re sensitive, ya know?”</i> she says, scratching herself behind the ear you were playing with. She shivers from her own touches, barely aware of the cum dripping from her front. <i>“Come, let’s get a shower to get cleaned up. I’ll even polish THAT personally.”</i>");
	output("\n\nSmiling, you follow after....");
	//Reset lust, pass 50 minutes.
	processTime(50);
	pc.orgasm();
	this.clearMenu();
	this.addButton(0,"Next",mainGameMenu);
}

//Frottage
public function pennyFrottage():void {
	clearOutput();
	showPenny(true);
	output("<i>“Really?”</i> Penny says in response. She may be surprised, but her [penny.cock] twitches at your suggestion, becoming more engorged than you would’ve thought possible a moment ago. The chesty");
	if(penny.biggestCockVolume() >= 200) output(", well-hung");
	output(" futanari fox wraps her hand around her stiff meat for one long stroke. She bites her lip in nervous anticipation, eyes fixed on your [pc.cockBiggest]");
	if(pc.cockTotal() == 2) output(" rather than your other penis");
	else if(pc.cockTotal() > 2) output(" rather than your other penises");
	output(". A salacious grin gradually spreads across her face, and she admits, <i>“");
	if (flags["TIMES_FROTTAGED_PENNY"] == undefined)
	{
		output("I’ve wanted to do this since I got one of these.");
		flags["TIMES_FROTTAGED_PENNY"] = 1;
	}
	else
	{
		output("I was hoping I’d get to do this with you again. I love watching us cum together, particularly when you’re the one getting painted,");
		if(pc.biggestCockVolume() < 50) output(" little");
		else output(" my meaty");
		output(" mate.");
	}
	output("”</i>");
	output("\n\nYou reply, <i>“");
	if(inPennyQuest()) output("Then hurry! I need you!");
	else
	{
		if(pc.isNice()) output("Then get up on here. You’ve gotten me plenty hard already!");
		else if(pc.isMischievous()) output("Then why not get up here and get started? I bet you’ll cum first anyway.");
		else output("Then get your furry ass up here and start rubbing my dick, bitch.");
	}
	output("”</i>");
	output("\n\nThe fox-girl’s ears twitch nervously, and you can tell she’s blushing by the way her bare genitalia darken. This time, she can’t hide behind her fur. She launches herself ");
	if(inPennyQuest()) output("onto you in a huff, bearing you to the ground with her weight. ");
	else output("onto the " + (pennyIsCrew() ? "her bed":"cot") + " in a huff, causing the frame to rock and creak dangerously in spite of her modest weight. ");
	output("You catch her hips to guide her into place, and Penny seems truly grateful for the assistance. She even leans down to kiss you as you line her up on top of you, pushing her [penny.cock] against your [pc.cockBiggest] such that the two turgid organs compress slightly but pleasurably. Sighing, she groans and reaches down to handle the doubled dongs");
	if(pc.cockTotal() > 1) output(", letting her fingers play across the entirety of your assembled packages before settling on her favorite");
	output(".");
	
	output("\n\n<i>“Oooh, this is quite nice,”</i> Penny gleefully announces, and she starts to wiggle her hips. You gasp out an agreement when the feelings surging from your loins hit your brain. Twitching encouragingly beneath the fox-girl’s ");
	if(pc.biggestCockVolume() * 1.25 < penny.cockVolume(0)) output("bigger ");
	else if(pc.biggestCockVolume() * .75 > penny.cockVolume(0)) output("smaller ");
	output("phallus, your erection swells with passion. You cannot help but squeeze her pert bottom in response. Her delicate fingers caress the throbbing veins ringing both tools tenderly, and as she shifts to slide herself across you, the sensitive flesh tingles with hot and heavy need.");
	if(penny.balls > 0 && pc.balls > 0) output(" Her balls roll across your own, each sack grinding and rolling against the other.");
	else if(penny.balls > 0) output(" Her balls roll across your " + pc.sheathDescript(pc.biggestCockIndex()) + ", slipping and sliding as they prepare a hot load for you.");
	else if(pc.balls > 0) output(" Your [pc.balls] rub against her pink little pussy, aching to unload into her honeyed hole but knowing their load is meant to be wasted.");
	output("\n\nYour hands knead and caress her perky ass with eager attentiveness, while she grinds atop you, working her [penny.cock]. The phalli slide against one another, both beginning to drip pre from stimulation. Gathering up the leaking cock-lube, Penny uses her hand to slather it over the pulsating pair of pricks. You grunt at that and look her in the eye, begging for more.");
	
	output("\n\nWinking back at you, Penny takes your [pc.cockBiggest] in a two handed grip and eagerly announces, <i>“I can’t take much more of this!”</i> Lifting the doubled dicks up partway, the fox-girl begins to mount your cock, sliding her pre-greased tool back and forth eagerly. Her own liquid ardor spills out in thick ribbons onto your ");
	if(pc.biggestCockVolume() * 1.25 > penny.cockVolume(0)) output("bigger dick");
	else output("[pc.belly]");
	output(", polishing your skin with her leaky anticipation. [pc.EachCock] is throbbingly, achingly erect, surging with each beat of your hammering heart. Little muscle spasms wrack your crotch, making your genitals dance beneath the busily humping fox, and you start to lift your hips with anticipation. Your [pc.cockBiggest] slides against the vixen’s [penny.cock] faster and faster.");
	
	output("\n\nThe both of you are eagerly humping the other’s cock at this point, possessed by the unflinching need to reach the apex of pleasure that’s just moments away. Giving up all sense of restraint, Penny whines and squeezes her hands down into a pair of tight rings");
	if (pc.totalGirth() + penny.totalGirth() >= 5) 
	{
		output(", or as close as she can come given ");
		if(penny.totalGirth() * .75 > pc.totalGirth()) output("her girth");
		else if(pc.totalGirth() * .75 > penny.totalGirth()) output("your girth");
		else output("your girths");
	}
	output(". Each surging, blissful sausage fucks an artificial fingercunt with a brutal, rutting pace, sliding its expanding tip against the other’s bottom during the backstroke.");
	
	output("\n\nLoud gasps draw your attention away from the frotting cocks, though the way pleasure is rising up in your loins, you’re going to be aware of your building bliss regardless. Penny’s eyes are half closed and droopy at this point, and she’s panting like a dog. Her tongue is lolling so far out of her mouth that her spittle is falling on her [penny.cock], frothing into a foam from the way the pistoning meat-pillars move. You forget the vixen’s face when the saliva soaks its way down your entire circumference, and your abdominal muscles clench. Magma-hot heat erupts from your ");
	if (pc.balls > 0)
	{
		if (pc.balls > 1) output("clenching balls");
		else output("clenching ball");
	}
	else output("middle");
	output(", and the need for release becomes as irresistible as it is enticing.");
	
	output("\n\nA low grunt works its way up the back of your throat, but before it can tear its way out of your [pc.lips], Penny groans startlingly loudly. A flow of warm, girlish juice drips onto ");
	if(pc.balls > 0) output("your [pc.balls]");
	else output("your " + pc.sheathDescript(pc.biggestCockVolume()));
	output(", setting off a mind-blanking pleasure-cascade. Two streams of cum erupt from the doubled-up dicks");
	if(pc.cockTotal() > 1) output(", boosted by the stuff spraying from the rest of your [pc.cocks]");
	output(". Penny’s is alabaster white and gooey as it falls over your [pc.fullChest]. Yours ");
	if(pc.cumType == GLOBAL.FLUID_TYPE_CUM) output("matches it nicely");
	else output("is similarly gooey but [pc.cumColor] in coloration");
	output(" when it ");
	if(pc.biggestCockLength() < penny.biggestCockLength() * .5) output("leaks lamely into your belly, unable to launch far due to the overwhelming size of the fennec’s superior shaft");
	else if(pc.biggestCockLength() < penny.biggestCockLength() * 1.5) output("blasts up to mix with the fox-girl’s");
	else if(pc.biggestCockLength() < pc.tallness * .33) output("blasts up against your chin");
	else output("blasts over your shoulder to splatter off the wall");
	output(". The twinned streams launch in matched pulses, their respective cum-slits splaying wide to allow the passage of such tremendous ejaculations. Penny’s urethra bulges against you with each load, compressing your own slightly before it fights back, reversing the pressure with your next jet.");
	
	output("\n\nYour bodies continue to slide against one another throughout, not stopping until the free-flowing spunk has slowed to a dripping trickle. Penny’s cock and yours are both soaked with mixed up spooge, saliva, and pre, all mixed together into a frothing, bubbling mess. Neither of you seems to care; the fox flops down onto you once her pleasure is totally spent, sliding over your spunky [pc.skinFurScales]. You wrap your arms against her and grind your slick form against hers, luxuriating in the pleasure ");
	processTime(35);
	pc.orgasm();
	penny.orgasm();
	if(inPennyQuest())
	{
		output("before either of you bothers to rise and face the real world once more. Still, it’d be best not to longer overlong if you’re going to claim that Oxonium...\n\n");
		penny.orgasm();
		CombatManager.genericVictory();
	}
	else
	{
		output("before everyday worries can return to haunt you. Cleanliness can come later...");	
		this.clearMenu();
		this.addButton(0,"Next",postPennyFrottage);
	}
}

public function postPennyFrottage():void {
	clearOutput();
	showPenny(true);
	output("<b>A little later...</b>");
	output("\n\nPenny’s body looks three times as big after toweling off. She’s a giant puff-ball thanks to the aggressive toweling off you gave her");
	if(pc.hasHair()) output(", and your [pc.hair] didn’t fare much better");
	else output(", and her hair didn’t fare much better");
	output(". Giggling, the bundle of fluff snaps you with her towel before ducking around the corner. You chase after her, towels snapping each other until you’ve dried the rest of the way off and had time to get ready to go. She’s sure to pinch your bottom before flouncing off towards her desk, calling, <i>“I’ll be " + (!pennyIsCrew() ? "doing some reports" : "here") + " if you need anything! Stay out of trouble, mate!”</i>");
	output("\n\nYou follow after her, glad for her shower facilities.");
	//Reset lust
	//Pass 50 minutes.
	processTime(20);
	pc.shower();
	this.clearMenu();
	this.addButton(0,"Next",mainGameMenu);
}

//Rough Over The Desk Fuck (AKA Penny Is The Prey DOHOHOH)
//Bend dat bitch over a desk, make her all nervous, play with her ears till she cums and then rail her like nobodies business.
//Needs dick that fits or strap-on
public function pennyOverTheDeskRoughFuck(usingCock:Boolean = true):void {
	clearOutput();
	showPenny(true);
	output("You tell Penny to seal the room; you want to take her right here. She looks curiously in your direction, but does as you say. " + (!pennyIsCrew() ? "Typing something into her keyboard, she":"Grabbing her Codex, she brings up the door control and") + " finishes with a single button press, and the door seals behind her. The busty fox springs out of her chair and turns around to undress, teasingly looking over her shoulder to say, <i>“No peeking!”</i> Her " + (penny.armor is UGCUniform ? "vest":"shirt") + " slides down her arms, and you choose that moment to act.");
	output("\n\nCrossing the room in a flash, you grab hold of the garment as it falls to her wrists and twist. The fabric goes taut, turning from clothing to improvised handcuffs. Penny stumbles in your grip, but you hold her in place. “”W-what are you doing?”</i> she grunts, not really fighting back just yet. <i>“I can’t take you like this!”</i>");
	output("\n\n");
	if(penny.hasCock()) showImage("PennyBentOverDeskFuta");
	else showImage("PennyBentOverDesk");
	output("You grab hold of the hem of her pants, digging your fingers into the back of her panties as well, and yank. Strong-arming her over the edge of her desk at the same time, you marvel at the expanse of tush laid out before you. A peach-colored slit divides the two amber-furred globes into a pair of nice-looking handholds, but that isn’t what you’re here for. You growl, <i>“I’m taking you this time, Penny,”</i> as you ");
	if (usingCock)
	{
		if(!pc.isNude()) output("free your [pc.cocks] from your gear and ");
		output("handle the thickening tool you plan to use on her");
	}
	else output("affix a strap-on to yourself");
	output(". <i>“And you, my dear, are going to sit there and take it.”</i>");
	
	output("\n\nYou push the fox-girl down the rest of the way against the table, compressing her tits so that they bulge outlandishly. The avalanche of titty flesh sends her pens and papers flying off the side and onto the floor. Squirming against you, Penny starts to twist and turn, but she’s small and has no leverage. The panties around her knees do a good job of preventing her from using any martial arts to counter your dominant position. In a nutshell, she’s helpless - bound, exposed, and presenting her pretty pink pussy for inspection. You bend low over her back, taking your hand away from your ");
	if(!usingCock) output("strap");
	else output("hard");
	output("-on long enough to grip her neck and immobilise her. She let her guard down, and there’s nothing she can do to stop you from doing whatever you want to her.");
	
	output("\n\nYou lick against the lobe of the pinned vixen’s ear and let her writhe beneath you. Your voice comes out in a hot exhalation, <i>“Shall I continue?”</i> The end of your question is marked by a lick along the outer edge of her dish-like ears. Shivering, Penny whimpers. It’s a weak, whining sound, like an animal caught in a trap. She speaks as soon as your [pc.tongue] separates from her ears, <i>“Ahhh... yes please, you... you ravenous beast. You caught me.”</i>");
	
	output("\n\nAtta girl. You knew she’d be up for a little role reversal");
	if (flags["PENNY_TIMES_OVER_DESK_FUCKED"] == undefined)
	{
		output(" after the way she came last time");
		flags["PENNY_TIMES_OVER_DESK_FUCKED"] = 1;
	}
	else flags["PENNY_TIMES_OVER_DESK_FUCKED"]++;
	output(". Letting go of her neck, you split two of your fingers into a V and position them to either side of her mohawk, tracing them along the edge of where her ears join with her skull. The sentivity of her aural organs is immediately apparent from the way she begins to thrash anew against your restraining grip. This time it isn’t an attempt at escape, but a simple combination of extreme arousal combined with a surprisingly sensitive erogenous zone.");
	output("\n\nFeeling moisture against your [pc.foot], you glance down in irritation. That irritation turns into irrepressible excitement when you realize that the fennec has transformed from a prim police-girl into a leaky faucet. Her pink nethers have grown flush and wet with arousal. The lips have a visible shine so thick that it looks like painted-on gloss, and a single bead of moisture hangs from them, waiting to fall after its sister. You gingerly insert a finger to test the waters, surprised when it vanishes into her greedy slit in a single swallow. Her pussy is practically pulling you inside of it! Reluctantly, you remove your soaked digit and turn your attention back to the fox’s upper half.");
	
	output("\n\n<i>“You got my finger wet. Here, clean it up,”</i> you say as you wag your soiled fingertip in front of the fennec’s face.");
	output("\n\nPenny whines, <i>“Fuck meeeeee,”</i> but she does not do as you asked.");
	output("\n\nYou wipe her feminine juices across her nose, making her sneeze. <i>“Clean it up,”</i> you command again, <i>“Hurry up if you want to get fucked.”</i>");
	
	output("\n\nTwisting as far as she can, Penny wrenches her body to the side to swallow your finger, not stopping until her lips are kissing the knuckle joint. Her tongue swirls around and around with single-minded attention. Sometimes, it draws deeper into her maw, and you hear her swallowing her own sexual juices. <i>“Lewd little fox, aren’t you?”</i> you comment as you take your freshly cleaned finger away. There is an audible pop when the tip is pulled free.");
	output("\n\nPenny gasps, <i>“Yes... I’m a lewd little fuck-hungry fox! A dirty dripping fennec whose pussy gushes when she’s tied down. Fuck me, predator! Claim your right!”</i>");
	
	output("\n\nWell, that’s a little dirtier than usually, but you want to key her up a bit more before you fuck her. Holding back is difficult as ");
	if(!usingCock) output("turned on ");
	else output("hard ");
	output("as you are. Particularly since ");
	if(usingCock) output("[pc.eachCock] is twitchingly, aching erect and ready to go");
	else output("[pc.oneVagina] is being pressed on quite presently by your faux phallus");
	output(", sapping your will with potent physical need in a way that must mirror what Penny is experiencing. You battle with your baser instincts for a second until self control wins out... for now.");
	
	output("\n\n<i>“Not yet,”</i> you announce. Curious about how far you can push her with her ears alone, you resume fondling her immense auditory sensors, tracing a finger along the outer edge of one of them. Penny bites her lip to stifle a moan, but you hear it all the same. She can’t hold it all in, and by muffling it, she just makes it more clear how completely and totally she’s being aroused by this. When you reach the bottom edge, you take your finger back up alongside her mohawk, watching her squirm.");
	
	output("\n\nThis time, the dripping-wet vixen doesn’t even remember to try to suppress herself. <i>“Fuuuuuuckit’sgood!”</i> Her gash drips, and she actually shifts to press herself against you, rubbing her plump labia against your [pc.leg]. Your hand pulls away from her ears long enough to smack hard upon her upraised bottom. Penny yelps and pulls away, just in time for your digits to return to their previous occupation, caressing and touching every part of her sensitive ears. At first, they flicked this way and that. The fennec was trying to keep them away from you. But now, her ears are leaning back into your touches, and Penny’s thighs are trembling with need.");
	
	output("\n\n<i>“Oh dear,”</i> you comment, <i>“I think you might actually get off from this, little fox.”</i>");
	
	output("\n\nPenny gasps, <i>“More!”</i> Her statement is simple, passionate, and followed by another, <i>“Please!”</i> The way her body is writhing has changed. It’s become less uncontrolled... more focused. You idly play with the very tips of her ears as you figure it out. Her motions are sliding her breasts across the " + (pennyIsCrew() ? "bed":"desk") + ", making a mess but likely causing her to receive some stimulation even through her bra. You twist her to the side to lift one of the orbs and see your suspicions confirmed when the outline of a large, prominent nipple becomes visible.");
	
	output("\n\nPushing her back down, even harder than before, you really grind her chest against the desk. At the same time, you spread your fingers wide around her mohawk and begin to stroke madly back and forth across both her ears and the top of her skull, making sure to hit every spot that made her squirm and drip earlier. <i>“Ohhh, g-g-g-g-od!”</i> Penny cries. Her legs are straining against her pants and panties so hard that you can see the muscles clearly outlined under her fur. The sounds of tearing seams reach your ears, but not before you deliver the coup de grace to hers: a fluttering series of strokes from tip to base.");
	
	output("\n\nPenny’s voice moans its way into a high-pitched scream, covering at least two octaves in the process. Her pants shred, and her legs begin to thrash so hard that you have to twist to avoid being kicked. Penny’s leaky pussy drools so much moisture that the fur on the inside of her thighs is being coated in waves of shining girlcum.");
	if(penny.hasCock()) output(" Her [penny.cock] twitches against the side of the desk, thickening noticeably. A second later, cum launches from it so forcefully that it audibly splatters off the floor, liberally coating the items that fell before, and that was just the first jet. Each successive blast seems more voluminous and decadent than the last. Penny’s prostate is working harder than you’ve ever seen it.");
	output(" Getting shriller by the minute, her blissful screeches climb to the point where you worry that someone will hear. Then, the wind goes out of her sails and she slumps down, limp. Her legs do still twitch, but now they move with lame little spasms. Their owner’s voice gibbers, <i>“Fuckmpleasebeastmasterfuckfuckfuckme....”</i>");
	
	output("\n\nSeeing no reason to not to oblige the lady’s request, you lift your ");
	var x:int = pc.cockThatFits(penny.vaginalCapacity());
	if(x < 0) x = pc.smallestCockIndex();
	if(usingCock) output(pc.cockDescript(x));
	else output("fake cock");
	output(" up to the drooling slit and press inside. Her tunnel is so slick that you slide in without a second of hesitation");
	if(pc.cockVolume(x) > penny.vaginalCapacity()) output(" in spite of your size");
	output(". The walls are still trembling with the aftershocks of Penny’s explosive orgasm, and at your touch, they ripple and squeeze delightfully around your ");
	if(!usingCock) output("faux ");
	output("girth.");
	if(pc.balls > 0) output(" Her juices run unchecked over your [pc.sack], painting it in the same clear moisture that’s now threatening to overtake the fennec-girl’s knees.");
	else
	{
		output(" Her juices run unchecked past your ");
		if(!usingCock) output("harness");
		else output(pc.sheathDescript(x));
		output(" and onto your [pc.legs], coating you in the same clear moisture that’s threatening to overtake the fennec-girl’s knees.");
	}
	output(" You’ve never seen her this wet");
	if (flags["PENNY_TIMES_OVER_DESK_FUCKED"] > 1) output(", at least not since the last time you bent her over like this");
	output(".");
	pc.cockChange();
	
	output("\n\nPenny starts moaning again, and in a surprising show of coherence, she blubbers, <i>“Ohhhh, fuck me, [pc.name]! Fuck me raw! Use my juicy, dripping prey-cunt as your personal cock-sheath!”</i> She whimpers at that last exclamation and lets her legs wrap around you, exerting gentle pressure whenever you slide too far out. She wants you inside her.... No, she wants you deep inside her, buried to the hilt and spewing a hot, thick load directly into her orgasmically contracting twat.");
	if(!usingCock) output(" It’s a shame the poor, blissed fox is going to have to settle for your toy.");
	
	output("\n\nYou give her exactly what she wants. Your ");
	if(usingCock) output(pc.cockDescript(x));
	else output("toy");
	output(" plows her pussy wide open as you ram it in to the hilt, not pausing at all before it yanks back out, ready to start all over again.. The desk creaks with each ass-slapping impact");
	if (usingCock)
	{
		if(penny.balls > 0 && pc.balls > 0) output(", and you feel a terrible pressure rising in your [pc.balls] each time they clap against the fennec’s own");
		else if(pc.balls > 0) output(", and you feel a terrible pressure rising in your [pc.balls] each time you clap against the fennec");
	}
	else if (pc.hasVagina()) output(", and you feel a terrible need rising in [pc.eachVagina] each time you clap against the fennec");
	output(". After so much foreplay, you are primed and ready to go. You can actually feel ");
	if(!usingCock) output("your girlish lust leaking out through the toy");
	else output("the pre-cum pouring out of your urethra");
	output(" and into the swampy snatch. There, it mixes into a lewd, sexual slush. You let go of her arms, finally, grab hold of her hips with both hands and bury your");
	if(!usingCock) output(" toy");
	else output("self");
	output(" inside with one last, bone-jarring impact, leaning over the dominated girl to bite her ear as you feel your breeding fluids flow.");
	
	var cumQ:Number = pc.cumQ();
	//Girl
	if(!usingCock)
	{
		output("\n\nThe submissive fox’s sordid snatch devours the [pc.girlCum] that leaks out through your fake erection. Each ");
		if(pc.wetness() <= 2) output("drop");
		else if(!pc.isSquirter()) output("flow");
		else output("squirt");
		output(" disappears deep into her furthest recesses, nestled firmly inside. Only after [pc.eachVagina] stops fluttering with passion do you pull free to admire the mixed [pc.girlCumColor] creampie. It’s small, all things considered, but Penny’s cunt seems to have a powerful thirst.");
	}
	//Small cum
	else if (cumQ <= 100)
	{
		output("\n\nThe submissive fox’s sordid snatch devours your [pc.cum] with aplomb. Each jet disappears deep inside her furthest recesses, nestled firmly inside. Only after your [pc.cock " + x + "] is empty and softening do you pull free to admire the [pc.cumColor] creampie. It’s small, all things considered, but Penny’s cunt seemed to have a powerful thirst.");
	}
	//Med cum
	else if (cumQ <= 1000)
	{
		output("\n\nThe submissive fox’s sordid snatch devours your [pc.cum] with a seemingly insatiable thirst. Yet even with such an appetite, your bountiful virility quickly gains the upper hand. [pc.cumColor] trickles become visible around your [pc.cock " + x + "] as you fill the fox, and after so much teasing, this orgasm seems particularly long and potent. Penny’s pussy is thoroughly glazed with [pc.cum] by the time you start to soften and pull out. Better yet, there’s enough fuck-slime that a significant stream leaks out in your wake. It gets all over the items from her desk.");
	}
	//Large cum with XLarge and XXlarge options
	else
	{
		output("\n\nThe submissive fox’s sordid snatch devours your [pc.cum] with a seemingly insatiable thirst. It proves inadequate when compared to your unholy virility. Midway through the second, long jet of [pc.cum], you feel her passage pressurize. The third jet causes spurts of fuck-slime to backwash out onto the floor, where it falls across Penny’s scattered possessions. You pump inside her until her belly rounds slightly under the lusty deluge, and then you inject some more.");
		if (cumQ < 5000)
		{
			output(" By the time you’ve finally started to soften inside her, she’s leaking [pc.cumColor] joy down the inside of her legs and sporting a belly that would make any who saw her assume pregnancy. Pulling out rewards you with the sight of a river of escaping [pc.cum] and the sight of a fox helplessly cumming a second time from the sensation.");
		}
		else
		{
			output(" Bigger and bigger, you fill her until she cannot accept a single drop more. At that point, each sloppy squirt is matched ounce for ounce by a vaginal [pc.cum] ejaculation that would make a horse jealous. Your [pc.cumColor] juices puddle high on the floor by the time you finally start to soften inside her. She’s leaking like a sieve, and when you pull out, so much escapes that she cums a second time on the spot, cradling her distended middle. Apparently the twisted-up vest wasn’t that hard to wriggle free from.");
		}
	}
	
	output("\n\nYou spend the next minute cooling off and helping Penny out of her ruined clothes. At first, she lets you do it with a dopey smile and eyes that look half-vacant, but as time passes, more of her fucked-out personality seems to return.");
	output("\n\n<i>“Ohhhh, god damn that was hot!”</i> she giggles. <i>“You know, you’re a great mate, right? The absolute best.”</i> After that uninhibited declaration, she staggers up onto her feet, slipping and sliding around the accumulated juices. <i>“Fuck! [pc.name], help me out here. We’ve got to get a mop and bucket!”</i>");
	
	output("\n\nYou watch the bow-legged fox’s shapely rump as she wobbles and let her words sink in. Oh, right! ");
	if(pc.isNice()) output("You happily help her to a supply closed where the two of you can gear up for a bit a cleaning. Two bodies make it go twice as fast!");
	else if(pc.isMischievous()) output("You playfully escort her to a supply closet, pretending to slip a few times for a laugh. After the first two times, Penny gets tired of the joke and socks you on the shoulder, but together you clean the place up and have a surprising amount of fun doing it.");
	else output("You begrudgingly help her to the closet and to clean up. Toying with her like that was a lot of fun, and you aren’t about to throw away the opportunity to repeat it over a little bit of cleaning.");
	//Reset lust.
	//Pass two hours.
	processTime(110+rand(20));
	penny.orgasm();
	penny.orgasm();
	pc.orgasm();
	if (pc.hasCock()) penny.loadInCunt(pc, 0);
	pc.shower();
	this.clearMenu();
	this.addButton(0,"Next",mainGameMenu);
}

//Jack Penny off with an Onahole
public function jackinPennyOffWithAnOnahole():void {
	clearOutput();
	showPenny(true);
	//First Time!
	if (flags["TIMES_JACKED_PENNY_OFF_WITH_ONAHOLE"] == undefined)
	{
		output("<i>“Got a sex-toy for your new toy?”</i> you ask.");
		output("\n\nStammering, Penny goes wide eyed and nervous. After a moment, her confidence returns, and she admits, <i>“I might. Why? I thought we were going to fuck.”</i> Her ears twist the side apprehensively.");
		if(pennyIsCrew())
		{
			output("\n\nYou lean over her, putting your hands down on either side of the fox’s, and you gamely look straight down at her bulging erection. <i>“I want to play with that.”</i> One handed, you give the [penny.cock] a slow stroke. It twitches happily. <i>“I want to watch this bounce while I jerk you off with a fake pussy.”</i> You give it a firm squeeze, and it pulses in your hand. <i>“A horny girl like you has one, right?”</i> The fennec groans and slumps back in her chair a bit.");
		}
		else
		{
			output("\n\nYou lean over her desk, putting your hands down on either side of the fox’s, and you gamely look straight down at her bulging erection. <i>“I want to play with that.”</i> One handed, you give the [penny.cock] a slow stroke. It twitches happily. <i>“I want to watch this bounce while I jerk you off with a fake pussy.”</i> You give it a firm squeeze, and it pulses in your hand. <i>“A horny girl like you has one, right?”</i> The fennec groans and slumps back in her chair a bit.");
		}
		output("\n\n<i>“Ahhh, I do.... Let me... mmmm... let me get the door" + (!pennyIsCrew() ? "s":"") + " closed first, and you can use it on me, okay?”</i>");
		output("\n\nSomewhat reluctantly, you release the prick-vixen’s swollen boner. <i>“Be my guest.”</i>");
		output("\n\nPenny doesn’t waste a second. " + (!pennyIsCrew() ? "She busily types on her computer to finish what she’s doing. Every now and again, she flicks her eyes up to you and gives an eager smile before resuming her feverish work upon the keys. At last, the door locks click into place, and Penny’s computer powers down. She spins around in her chair, throws herself up onto her feet, and hops over to an equipment locker, cock slapping awkwardly against her belly as she goes. The compartment rattles noisily as it opens.":"She rapidly triggers the door’s remote control, fumbling a few times with the remote before finally slapping the button. The door lock clicks into place, and Penny leaps to rifle around in her footlocker."));
		output("\n\nRotating around, the foxy policewoman presents her faux pussy and a nanofiber condom. <i>“I got it off the extranet, even before I got a cock. There’s this company called Naughty Wyvern that I ordered it from. They make all kinds of specialty toys, but I went with a plain ol’ onahole.”</i> She hands it to you. <i>“What a weird name for a sex toy, huh? Its interior is self-lubricating, so long as I keep it maintained.”</i> Putting the condom on, she explains, <i>“We wouldn’t want to make a mess out of my office, would we? Besides, these suckers are so thin that it feels like you’re wearing nothing at all.”</i>");
		if(silly) output(" Stupid sexy Flanders.");
		flags["TIMES_JACKED_PENNY_OFF_WITH_ONAHOLE"] = 1;
	}
	//Repeat
	else
	{
		flags["TIMES_JACKED_PENNY_OFF_WITH_ONAHOLE"]++;
		output("<i>“Ready for another cock milking?”</i> you ask.");
		output("\n\nPenny is up and out of her chair about as soon as you ask, slapping a button on her way " + (!pennyIsCrew() ? "out ":"") + "that seals the doors and powers off her workstation. Her locker is opened and closed in a flash. Flopping lamely about in her hand, the fake pussy jiggles about with the promise of artificial pleasure. <i>“You know I’m always ready to drain off some lust,”</i> the ");
		if(silly) output("hung ");
		output("vixen quips. She tosses the onahole at you with an eager grin. <i>“Now to get this bad boy on. No muss, no fuss!”</i> The sound of tearing plastic and something sheer being stretched over a masculine attribute reaches your ears.");
	}
	//Merge
	output("\n\nYou examine the onahole for a moment. It’s big, pink, and transparent. The inside is filled with concentric rings of varying sizes that look quite pleasing to your eye. Sticking a finger inside it, you find the lubrication instantly soaks your digit in pleasing slickness. When you remove it, the moisture that clings to your [pc.skinFurScales] silently evaporates. The whole process takes perhaps twenty or thirty seconds, but when it’s complete it’s as if nothing at all had happened. Penny is going to enjoy this.");
	output("\n\nStepping over to her chair, ");
	if(pc.legCount == 2) output("you seat yourself on it, gesturing for Penny to rest on your lap");
	else output("you shove it aside and lean against the desk, gesturing for Penny to come over and lean herself back against you");
	output(". She gleefully snugs her tush right up against your ");
	if(pc.armor.shortName == "" && pc.lowerUndergarment.shortName == "") output("exposed");
	else output("girded");
	output(" loins, wiggling back and forth excitedly. <i>“Like this?”</i>");
	
	output("\n\nYes, just like that. You reach around the fennec, holding her tight, feeling the press of the warm fur on her bottom against you. One hand quickly finds her [penny.cock] while the other explores her boobs through her wrappings. The small bumps of her nipples are concealed from your questing fingers just yet, but a simple kneading motion swiftly remedies that. Popping up against the layers of fabric, Penny’s perky buds strain to be seen, and more importantly, felt. You tweak one while getting the pink toy lined up with her [penny.cockHead]. The vixen’s panting breaths along with the way she squirms whenever you squeeze her make proper alignment difficult, but you manage.");
	
	output("\n\n<i>“Mmmm,”</i> Penny moans, <i>“Push it down!”</i> She grabs hold of your ");
	if(pc.isTaur() || pc.isDrider()) output("fore-");
	output("[pc.legOrLegs] for support while the tip of her condom is lubricated by the faux fuckhole. She throbs powerfully under your affections, but you hold back for now, getting in a good, long feel up top before you progress. This leaves the fox with nothing to do but squirm against you. Her body is getting warmer and warmer as she gets turned on, and the steaming heat emanating from her female sex seems a few degrees hotter than the rest of her. There’s enough moisture leaking from her slit that you can feel a touch of dampness condensing on your own [pc.skin].");
	
	output("\n\nThe horny little futa fox has waited long enough, you decide, and you gently begin to push the device down her ");
	if(penny.biggestCockLength() < 10) output("average ");
	else if(penny.biggestCockLength() < 17) output("meaty ");
	else output("over-sized ");
	output("length. Inch after inch of cock slides down the squishy toy’s passage. Lubricated as it is, the onahole must feel wonderfully slick on Penny’s throbbing phallus. Indeed, she’s quietly whining, almost inaudibly, while the toy smoothly glides down to surround more and more of her. ");
	if(penny.biggestCockLength() < 10) output("You push it down until it’s bunching up the sheath at her base. Inside, you can see the reservoir at the tip swell slightly with pre-seed.");
	else if(penny.biggestCockLength() < 17) output("You push it down until the [penny.cockHead] is protruding garishly from the top and slowly filling the reservoir with pre-seed.");
	else output("You push it down until the [penny.cockHead] and a half-dozen inches of dick have thrust out the opposite end to lewdly bob in the air. The reservoir at the tip is clearly exposed and slowly filling up with pre-seed before your very eyes.");
	output(" She’s clearly enjoying the attention.");
	
	output("\n\nYou nip at one of Penny’s ears to get her attention. Instead, she winds up closing her eyes and lifting her hips hard against the onahole’s entrance, mashing herself as firmly into it as she can. Her tongue spills out of her mouth, and her eyelashes flutter. Bestial groans filter out of her throat, intermingled with feminine pants of need. With her so lost to passion already, you settle for enjoying the weight of her teats in your hand, openly pinching and tugging on her nipples through the " + (penny.armor is UGCCasualOutfit ? "thin fabric of her anime T-shirt":"wraps and bra between you") + ". The fabric soon grows bothersome, and you wriggle your hand underneath her coverings to get a better grip on things. The pebbly texture of the nipple you locate is exquisite, and you delight in playing with it, tugging and pinching to watch the way it changes Penny’s lascivious mask.");
	
	output("\n\nThe vixen is all too happy to let you have your way with her. Her body is responding with the eagerness of an aphrodisiac-dosed animal in heat. You reward her by giving her what she wants: long slow strokes along her [penny.cock]. The toy’s slippery fluids cause it to noisily slurp and squelch along the shaft as it goes. Through the transparent surface, you can see the folds compressing around Penny’s penis, clinging to each ridge and vein briefly before slipping past the obstruction. Her [penny.cock] is rock-hard. You can feel it even through the squishy-soft onahole.");
	
	output("\n\n<i>“Faster,”</i> the fox-girl pants. <i>“More!”</i>");
	
	output("\n\nYou give her exactly what she wants. A quick pump here, a fast thrust there, and before you know it, you’re sliding the pleasure tool along her shaft so quickly that it seems a blur.");
	
	output("\n\nPenny blurts, <i>“Fuuuuck! I love my cock! I love you, [pc.name]! I love cumming! Make my cock cum, please, mate!”</i>");
	if(penny.balls > 0) output(" Her balls are quaking just below your busy hand. It won’t be long now.");
	
	output("\n\nTweaking her nipple, you nuzzle at the edge of her ear and whisper, <i>“Cum whenever you want, Penny. I want to see you fill that condom for me. I want my horny, futanari fox girl-friend to jizz herself silly from a cheap sex-toy!”</i>");
	
	output("\n\n<i>“Oh god,”</i> she whimpers in reply.");
	
	output("\n\nYou go a little faster while your hand locates the other unmolested nipple. <i>“That’s right, I want to watch you make me the fattest, sloppiest jizz balloon possible,”</i> you say.");
	
	output("\n\nThe prick vixen’s body tenses");
	if(penny.balls > 0) output(", balls quaking");
	output(", and her [penny.cock] begins to violently spasm in your insulated grip. Her urethra expands to its full size a moment before the condom-sheathed cumslit dilates with the first batch of fox-cum. The filthy flow bursts into the reservoir in an explosion of white, stretching it almost four whole inches out from Penny’s [penny.cock] before it snaps back into a bubble of obscene white");
	if(penny.biggestCockLength() < 10) output(", barely cresting past the tip of the onahole");
	output(". You keep going, twisting back and forth around the foxy girl’s load-spewing meat to wring out every drop. ");
	if(penny.biggestCockLength() < 7) output("Growing larger by the second, the bubble at the tip expands from the size of a dime to the size of a quarter. It doesn’t stop there, though the bigger that bubble gets, the slower it seems to fill. It soon passes the size of a plum. The weight of the sexual fruit causes it to dangle down, weighing heavily upon the fox-girl’s cock. There, it fills to the size of an apple.");
	else if(penny.biggestCockLength() < 13) output("Bloating larger by the second, the bubble at the top expands from the size of a dime to the size of a golf-ball in a single pulse. It doesn’t stop there, though the bigger the bubble gets, the more it sags. It soon passes the size of a orange, slopped halfway over the edge of the toy. There, it fills to the size of a small melon.");
	else output("Ballooning bigger by the second, the bubble at the top grows from the size of a dime to the size of an orange in a single pulse. It doesn’t stop there, though the bigger the bubble gets, the more it weighs on Penny’s cock, dragging it partway down by weight alone. It soon passes the size of a melon, tugging the sheath taut. It wobbles dangerously with each fresh pulse, swelling to rest on the fox-girl’s thighs like a spermy watermelon.");

	output("\n\nSeemingly spent, Penny sags back against you with a smile. Her tongue is still hanging out of her mouth to drool all over her tits, of course, but she’s moved beyond the body-seizing orgasm that claimed her.");
	
	output("\n\n<i>“That was just what I needed, mate,”</i> Penny confesses.");
	if(flags["TIMES_JACKED_PENNY_OFF_WITH_ONAHOLE"] > 1) 
	{
		output(" <i>“You aren’t going to do that again, like the last time, are you?”</i>");
	}
	output("\n\nYou smile and respond, <i>“");
	if(pc.isMischievous() || pc.isNice()) 
	{
		if(flags["TIMES_JACKED_PENNY_OFF_WITH_ONAHOLE"] > 1) output("You know I am. How else will I see how big you can make it?");
		else output("Well we aren’t done yet. I bet you can do it again!");
	}
	else output("We aren’t done yet. You’re going to go again. After all, how else will we see how big a balloon you can make?");
	output("”</i>");

	output("\n\nPenny’s tongue is back up in her mouth in a moment, and she growls, <i>“It’s too soon!”</i>");
	
	output("\n\nYou answer by resuming stroking her, this time at a leisurely pace in order to rest your arm. Throwing back her head, the fox-girl redoubles her grip on your [pc.legOrLegs] and futilely kicks for a second. Her oversensitive shaft is clearly not quite ready to feel the bliss of a tight, wet fuck-tunnel like this one. She gradually relaxes as her body adjusts to the sensations. The cock inside your grip is softer than it was before, partially turgid after spewing so hefty a load. You keep at it, pumping, twisting, and sometimes squeezing through the soft toy to give Penny the best possible experience.");
	
	output("\n\nSlowly, life comes back to her partly sagging boner. The first sign is a twitch that you can feel even through the onahole. The second is the way Penny’s eyelashes lower again. The third and final sign is a gradual increases in the firmness between your fingers. Encouraged by this, you stroke her faster, the groping of her breasts forgotten momentarily as you enjoy the sight of your foxy lover’s thickening fuckstick. When her tongue rolls back out and she begins to pant and gasp anew, you know you’re going to be able to pull this off.");
	
	output("\n\nThroughout this entire time, Penny’s captured load has been hanging there, bobbing in the science-toughened material’s encapsulating transparency. <i>“Naughty fox,”</i> you comment, <i>“Buying such perverted toys and setting herself up to be milked by lusty offworlders.”</i> You squeeze her through the onahole. <i>“You probably bought this just so something like this could happen, didn’t you?”</i>");
	
	if(flags["TIMES_JACKED_PENNY_OFF_WITH_ONAHOLE"] == 1) output("\n\nPenny surprises you by meekly nodding and throbbing all at once.");
	else output("\n\nPenny nods and throbs in your hand, just like last time. <i>“You know I did...”</i>");
	
	output("\n\nYou begin to move slightly faster and far more firmly, smashing the onahole down against the fox-girl’s sheath with greater vigor than before. <i>“Are you gonna give me another big load?”</i>");
	
	output("\n\nThe vixen nods.");
	
	output("\n\nYou keep the stroking motions going as you tickle at Penny’s ears with your lips. <i>“I bet I could make you do this all day, couldn’t I?”</i> Extracting your hand from under her bra, you reach down to ");
	if(penny.balls > 0) output("cup and squeeze her balls");
	else output("cup her mound before slipping a finger inside");
	output(". <i>“I could have you sitting here squirming for me in this chair until your jizz-balloon is as big as you, couldn’t I?”</i>");
	output("\n\nPenny blurts, <i>“Yes! Milk my cock whenever you want! I’m so horny all the time ever since I got it... I- ahhh... I’m always thinking of naughty things I could do with it to you. You’ve made me such a horny herm fuck-slut that I can barely do my job and I love it!”</i>");
	
	output("\n\nHer hips twitch violently against you. She’s close! You squeeze your palm a bit to tighten your grip. The extra stimulation should push her the rest of the way to orgasm, and if that doesn’t speeding up will. Faster and faster, you give Penny’s [penny.cock] the stroking of a lifetime. You’re jacking her off with some toy she got off the internet, and she’s just letting you! The horny vixen loves it, and she says as much when she finally climaxes.");
	
	output("\n\n");
	if(penny.hasCock(GLOBAL.TYPE_EQUINE)) showImage("PennyOnaholeEquine");
	else
	{
		if(penny.cocks[0].cLength() < 7) showImage("PennyOnaholeSmall");
		else if(penny.cocks[0].cLength() < 13) showImage("PennyOnaholeMedium");
		else showImage("PennyOnaholeBig");
	}
	output("<i>“C-cumming for you, mate!”</i> Penny babbles, <i>“I’m giving you so much dickmilk, [pc.name]! I’m cumming it all out for you!”</i> True to her words, the balloon on the tip is swelling faster than before. ");

	if(penny.cocks[0].cLength() < 7) output("It’s rounding out deliciously, now as big around as an orange. Penny’s hips continue to lurch, firing huge ropes of spunk. Each time they distend the opposite side of the bubble with the force of their ejaculation before settling back down into a lascivious sphere. The vixen’s liquid lust pours out until the condom reaches the size of a grapefruit. It wobbles there a few times and stops.");
	else if(penny.biggestCockLength() < 13) output("It’s rounding out deliciously, so heavy that it drags Penny’s lurching dick down, despite it still firing fresh, huge ropes of spunk. Each time the opposite side of the bubble distends with the raw force of her ejaculation before settling back down to a jiggling, lascivious sphere. Liquid lust pours out until the condom reaches the size of a record-winning watermelon, balanced precariously on the fox’s knees.");
	//watermelon
	else output("It’s rounding out deliciously, as big as a beach ball. Penny’s hips continue to lurch, firing fountainous ropes of spunk. Each volley distends the opposite side of the bubble with the force of its ejaculation before allowing it to settle back down into a bottom-heavy barrel of liquid lust. Spooge pours into the condom until it completely swallows the fox’s thighs, threatening to rip free at any moment.");
	
	output("\n\nPenny goes limp in your arms, her eyes drifting almost entirely closed as she lets out a satisfied sigh. Her voice pipes up after to breathily ask, <i>“Did I cum enough?”</i>");
	
	output("\n\nYou yank the toy off of her, squeezing the bloated, spermy bubble through the well-used passage before you can fully extricate it from the hermaphrodite vixen. She shudders at the friction but otherwise holds still until you can heft both her packages. You carefully weigh the balloon in your hand while you decide what to do with it. You could tie it off to throw away. Then again, if you bit it, you could get a huge facial to wear like some kind of slut. Or you could always make Penny drink her milk.");
	
	processTime(30);
	penny.orgasm();
	//+10 lust
	pc.changeLust(10);
	this.clearMenu();	
	//[Throw It Away] [Bite It] [Feed2Her]
	this.addButton(0,"Throw Away",throwPennysCumAway,undefined,"Throw away the filled condom.");
	this.addButton(1,"Bite It",bitePennysCondom,undefined,"Bite the filled condom, probably getting quite a bit messy in the process.");
	this.addButton(2,"Feed2Her",feedPennysCondomToHer,undefined,"Feed2Her","Feed Penny her own cum.");
}

//Throw It Away
public function throwPennysCumAway():void {
	clearOutput();
	showPenny(true);
	output("Carefully tugging the filled balloon off the spent fox’s deflating member, you tie it off and " + (penny.cocks[0].cLength() >= 14 ? "roll":"toss") + " it in the nearest trash receptacle. You ease Penny into her chair and push her back up to her desk with her cock still hanging out");
	if(pc.biggestCockLength() >= 17) output(", making sure that the mammoth shaft is up on top where it belongs");
	output(". She shudders but allows you to pose her as you will, not even struggling when you blatantly wrap her hand around her cock and fetch her another condom from her locker, just in case she wants to practice while you’re out.");
	output("\n\nPenny’s dick twitches at that, and she groans, <i>“Thanks for that [pc.name], but you can’t really milk me all day!" + (pennyIsCrew() ? " You need to get some work done, you know.":" I need to get some work done, you know.") + "”</i> You nod and tell her that you believe her, even if her horny cock doesn’t. She twitches again" + (!pennyIsCrew() ? ", but resolutely returns to her work":"") + ".");
	//Pass 35 minutes.
	processTime(5);
	penny.changeLust(70);
	this.clearMenu();
	this.addButton(0,"Next",mainGameMenu);
}
//Bite It
public function bitePennysCondom():void {
	clearOutput();
	showPenny(true);
	output("Easing out from around the fox, you set her down in her chair so that her ass is just barely on the edge of her seat. This leaves her spent cock to hang out over the edge with its juicy surprise " + (penny.cocks[0].cLength() >= 13 ? "dragging along on the floor":"hanging there") + ", just waiting to be picked. You kneel down before the alabaster fruit almost worshipfully and open wide, letting some of the liquid weight sag into your mouth. You’ve positioned it so that it’s resting flat on your [pc.face]. Whatever they make these condoms out of is slippery and super thin. You’re sure that despite its surprising strength, a simple bite would pop the balloon and give you a huge facial.");
	output("\n\nClosing your jaw slightly, you feel the teeth catch on the condom. There’s a moment of delicious, almost exquisite tension while you slowly increase the pressure, unsure when or if this ball of saved-up fox-cum is going explode on your face. Then, the moment you’ve waited for arrives, punctuated by a boom loud enough to make you jump. What feels like gallons of Penny’s fuck-juice fills your mouth and throat. You swallow it compulsively as your face is basted with alabaster spunk. Thick rivulets of it cling to your [pc.hair] and [pc.face], dangling from your chin in ropes of salty spooge. Semen drips down onto your [pc.chest], unnoticed as you gulp the animal-girl’s cream down.");
	
	output("\n\nThe knowledge that you’re completely painted with Penny’s warm lust brings a pleasant fire to your nethers and a smile to your face. The fox-girl looks down at you as you blink strands of the stuff out of your eyes and lick some of the accumulated mess from your lips. She’s practically aglow with delight, but she does stop you to say, <i>“Hang on, you missed a spot.”</i> One handed, she lazily drags her drooling [penny.cockHead] up your cheek, smearing you with her sweat- and cum-soaked shaft. <i>“Got it!”</i> she declares. <i>“It’s a good look for you!”</i>");
	
	output("\n\nYou give her a grin and thank her for the mask, teasing her that you’ll show everyone where you got it. You even go so far as to encourage her to practice her condom filling for next time. Maybe she’ll give you a proper bath if she trains her dick hard enough. Penny goes wide eyed at that, but she promises, <i>“Oh I’ll try!”</i> while removing the other half of her broken condom from her member.");
	
	output("\n\nShe’s cleaning up the wet spot on the floor when you prepare to leave, but you see another condom has been laid out on her desk.");
	//Pass 35 minutes.
	processTime(5);
	pc.loadInMouth(penny);
	this.clearMenu();
	this.addButton(0,"Next",mainGameMenu);
}
//FeedIt2Her
public function feedPennysCondomToHer():void {
	clearOutput();
	showPenny(true);
	output("Easing the sagging fox into her chair as you stretch, you admire the way she looks right now: sexually spent at your hands and still delectable. You have no doubt that she’d be up for another round if you phrased it right, but as you eye the bobbing present that hangs from the end of her [penny.cock], you know exactly what you want to do.");
	output("\n\nYou ");

	if(penny.cocks[0].cLength() < 10) output("cup the weighted sphere in the palm of one hand while you gently work the condom free of the prick-vixen’s half-deflated tool. It takes a little work to slide the last of the superthin material free, but you manage to do it without spilling a drop. Penny doesn’t react at all aside from watching you with a lazy smile.");
	else if(penny.cocks[0].cLength() < 10) output("heft the enormous sphere with both hands, wiggling it back and forth to pull the condom free of the prick-vixen’s half-deflated tool. It takes a little work to tag the last of the material free, but you manage to do so without spilling a drop. Penny doesn’t react at all aside from watching you with a lazy smile.");
	else output("drag the weighted sphere back slowly, rocking it back and forth in an attempt to free the prick-vixen’s half-deflated tool. You have to be quite careful. One wrong pull, and it’s going to roll over and dump a wave of spunk directly onto you. Penny doesn’t react at all aside from watching you with a lazy smile.");
	output("\n\n<i>“Open up,”</i> you command with a grin of your own. <i>“I got you a present.”</i>");
	output("\n\nThe fennec obeys without a second thought, too tired and conditioned by pleasure to care what you do to her at this point. Her sharp teeth glint in the light as you feed one end of the narrow tube between them. Then, you put a curled finger under her chin and tip her head back as you " + (penny.cocks[0].cLength() >= 14 ? "squeeze":"lift") + " her sphere of condensed love. Salty girl-jizz runs into the fox’s mouth in a rush as gravity asserts itself, bulging her cheeks and forcing her throat to work. Her eyes open wide, looking accusingly at you, but she doesn’t stop. If anything she chugs harder, gulping her spunk down like a true pro. For nearly thirty seconds straight, she drinks her cum.");
	
	output("\n\nWhen " + (penny.cocks[0].cLength() < 7 ? "the condom is empty, you pull it out ":"the stuffed fox dribbles and coughs spunk all over herself, you pull it out ") + "and look at Penny, seeing the " + (penny.cocks[0].cLength() < 7 ? "trails of white on her lips and the way her taut middle has a little bit more paunch to it.":"lakes of white on her tits and the way her once-taut middle is bulged with spermy satisfaction.") + " She lazily belches before patting her middle. <i>“I guess that’s one way to clean up my mess.”</i> She glances around a little nervously. <i>“I... could get used to that taste, honestly.”</i>");
	if(!pennyIsCrew()) output("\n\nShe goes on to thank you for the fun but admits she needs to get to work. <i>“Just give me a yell if you need anything. Knowing this thing, I’ll be good to go in a minute.”</i>");
	//Pass 35 minutes.
	processTime(5);
	penny.loadInMouth(penny);
	this.clearMenu();
	this.addButton(0,"Next",mainGameMenu);
}

public function gardeFordWritesPennySmex():void {
	clearOutput();
	showPenny(true);
	author("Gardeford");
	output("Your attention keeps drifting back to the large ears on the fox girl’s head. You stroll around Penny" + (!inPennyQuest() ? "’s desk":"") + ", trying to look as nonchalant as possible. A grin raises the ends of your mouth as you see the large furry fox ears twitch and move at small sounds. Soon you are positioned directly behind her" + (!inPennyQuest() ? " chair":"") + ", ready to strike at a moment’s notice. Before she can turn to look, you pounce on her from behind.");
	output("\n\nThe fur on her head feels as soft as silk as your hands caress the base of her ears. Penny begins to stand at first but falls forward onto ");
	if(inPennyQuest()) output("the ground");
	else if(pennyIsCrew()) output("the bed");
	else output("her desk");
	output(". Her body tenses at your rubbing");
	if(!inPennyQuest()) output(", barely managing to hit the button to lock the door");
	else output("");
	output(". You move a hand down her back, pressing lightly on her " + (penny.armor is UGCUniform ? "vest":"shirt") + " but making no attempt to remove it. Penny hums lightly and shivers at the attention you’re giving her. Her tail thrashes to-and-fro, batting against your [pc.legOrLegs] as it goes.");
	output("\n\nYou trace a finger across her pinna, eliciting a sigh of pleasure from the foxy girl. Your other hand moves along the inner line of her panties before pulling them - and her pants along with them - down to her feet. You lean in close and give the unattended ear a quick kiss, finding it warm against your lips. Heat rushes to her face, making her feverish with need. ");
	if(pc.biggestTitSize() >= 3) output("Your [pc.chest] presses into the back of her " + (penny.armor is UGCUniform ? "vest":"shirt") + ". ");
	output("You blow on the sensitive lobe and it flops down for a second to escape. The finger at her pelvis rubs her rapidly wettening slit. It feels as if your digit will be sucked into her depths, but first you move it up all the way to the base of her fluffy tail. When you give the area around her tail a playful tickle it sends her over the edge.");
	
	output("\n\nPenny’s knuckles turn white as " + ((inPennyQuest() || pennyIsCrew()) ? "she thoughtlessly digs her nails into her palms":"they grip the desk") + " while she cums from your playing. Feminine juices run down her legs, and she lets out a long moan as the tension leaves her body. You move your head down to her nethers, licking your lips as you appraise the fur-less snatch. One of your hands continues to massage her ears, alternating between the two and brushing her fuzzy mohawk as it transitions. The fox girl’s tail wags weakly but somehow manages to stay aloft.");
	
	// height < 5 feet
	if (pc.tallness < 60)
	{
		output("\n\nYou plant a sloppy kiss on the fennec’s puffy mound, rubbing your tongue against her tiny clit. " + ((inPennyQuest() || pennyIsCrew()) ? "":"Penny’s legs give out for a moment, and she grips the desk before sliding off. ") + "Her knees lock " + ((!inPennyQuest() && !pennyIsCrew()) ? "her in a half-standing position as ":"") + "you continue to assault her pussy with licks and kisses. The slippery combo of her juices and your saliva trails down her knees, dripping down to the floor and pooling on the ground.");
		output("\n\nPenny’s wagging tail bats against your head whenever it comes by, and her fur feels wonderfully soft against your [pc.skin]. Your [pc.tongue] pushes aside the fox-girl’s pussy lips and slides into her depths. Penny lets out a long moan as your tongue explores her moist cleft. “Ooohhh, [pc.name], pull me down and devour me like the beast you are!” Penny shouts with a growl of lust. You happily oblige, and the busty fennec’s knees buckle as your licking intensifies. One of your hands continues to stroke the feisty fox girl’s sonar dishes, rubbing with the fur to make sure it feels the best. Your other hand helps to steady her legs.");
		output("\n\nThe foxy police-woman’s moans escalate as your tongue stretches as far as it can inside her love tunnel. ");
		if(!pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output(" You slather her walls with your saliva, and it mixes with her juices as the combined fluids run down her legs like a softly flowing stream.");
		else output(" Your tongue snakes all the way to her womb and swirls around her cervix in short circles. She gives out a little squeak with the completion of each rotation. Her juices flow into your mouth and down her legs to drip into the growing pool at your feet.");
		output(" Penny’s entire body gives a great shiver as you explore her depths, and you greedily lap at the escaping ");
		if(!pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output("juices");
		else output("fluid");
		output(".");
		
		output("\n\nSuddenly the fennec girl’s moans escalate to screams of pleasure. Her lower legs nearly give out as they slip on the massive puddle of juices. Her hands splay out and her tail stands on end as she cums with all her might. You pull your tongue out of her pussy and suck on her tiny clit to push her even further into a whirlpool of pleasure.");
		if(penny.hasCock()) 
		{
			output(" Penny’s unused [penny.cock] blows its load, spattering all over the fox girl’s buckled knees. You wrap one hand around the ");
			if(penny.hasKnot()) output("swelling knot ");
			else output("thick, medial ring ");
			output("and give it light squeezes to simulate pulling it out. A short burst of jizz escapes the [penny.cock] with every tug accompanied by a yip of pleasure from its owner.");
		}
	}
	//height > 5 feet
	else
	{
		output("\n\nYou position one arm under Penny’s leg and lift her pelvis up to your face. " + ((!inPennyQuest() && !pennyIsCrew()) ? "Her upper body is pushed further onto her desk, knocking papers onto the floor. ":"") + "You give her lust-engorged pussy a big lick, starting at her tiny clit and traveling all the way up to the base of her tail. The fox girl’s legs dangle in the air, her feet stretching out as far as they can in her spasms of pleasure. " + ((!inPennyQuest() && !pennyIsCrew()) ? "The foxy police-woman struggles to maintain a grip to stop herself from sliding over the edge of the desk. ":"") + "A combination of her juices and your saliva trickles down her belly all the way to the cleft of her breasts.");
		output("\n\nThe fennec’s tail bats against your face with every pass, the soft fur feeling wonderful against your [pc.skinFurScales]. You move your tongue back down to her vagina and circle it around the edge. When you reach her hole you slide in and lick around her inner walls. <i>“Ahh, f-fuck, eat me like the predator you are, Steele,”</i> Penny slurs through her moans. You happily oblige, moving her legs over your shoulders for easier holding. Her thighs tighten around your head as your licks intensify, and you return both hands to Penny’s sonar dishes.");
		output("\n\nThe feisty fox-girl’s moans escalate as you stretch your tongue as far as it can go. ");
		//if short tongue: 
		if(!pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output("You slather her walls with your saliva, mixing it with her juices and letting it run into your mouth and down her body like a mountain stream.");
		else output("Your tongue reaches all the way to her womb and runs little circles around her cervix. Her thighs tense against your head as each rotation is completed. The juices flow into your mouth and down her own body to pool on the table.");
		output(" The full length of Penny’s body shivers as you explore her depths, and you greedily lap at the fluid that escapes.");
		output("\n\nSuddenly the fox-girl’s legs tense and her moans grow into screams of ecstasy. You remove one hand from her head and drag it seductively along her trembling body until it reaches her nethers. When it arrives you slowly rub its thumb in circles around her budding clit, and the fur on Penny’s body stands on end as she explodes in orgasm.");
		if(penny.hasCock()) 
		{
			output(" The fox-girl’s unused [penny.cock] blows its load and spatters on the floor. You slide your hand around her ");
			if(penny.hasKnot()) output("swelling knot ");
			else output("thick, medial ring ");
			output("and give it light squeezes to simulate pulling out. With each tug Penny’s voice raises to a yip of pleasure before lowering back to soft moans.");
		}
	}
	//size variation end
	output("\n\nThe fox-girl lies panting against the table, looking thoroughly exhausted from the ordeal. Little does she know that the pleasure is only half over; ");
	if(pc.hasCock() || pc.hasVagina()) output("you have yet to be pleasured yourself.");
	else output("you have a lot more pleasure to give her.");
	output(" You give both of Penny’s furry buttcheeks a big squeeze and begin to move up her body, planting kisses along her athletic form as you go. As you pass her chest you kiss the side of her DD-cup boobs before moving up to her ears.");
	
	output("\n\n<i>“Huh? It’s not over? I don’t know how active I’ll be-eeee”</i> Penny says weakly before you assault her ears with kisses. Starting at the base you kiss all the way up the large lobes. Her ears try to duck away as your hot breath assails them, but you use your lips to mock bite them. The second ear twitches with anticipation as you finish with the first, and you have no plans to leave it wanting. This time you start with a false bite to the tip, then brush your lips softly against the back until you kiss the base. As you work on her ears, you ");
	if(!pc.isNude()) output("remove your [pc.gear] and ");
	if(pc.hasCock() && pc.hasVagina()) output("slip your fingers around your [pc.cocks] to play with your [pc.vaginas].");
	else if(pc.hasCock()) output("rub your stiff [pc.cocks].");
	else if(pc.hasVagina()) output("rub your fingers into your soaked [pc.vaginas].");
	else output("prepare your fingers to penetrate her.");
	var x:int = -1;

	output("\n\nPenny moans weakly, her eyes rolling back in her head as she’s overwhelmed by pleasure. ");
	if(pc.hasCock() && pc.cockThatFits(penny.vaginalCapacity(0)) >= 0) {
		x = pc.cockThatFits(penny.vaginalCapacity(0));
		output(" You line up your [pc.cock " + x + "] and slide it between the fox-girl’s thighs. The top of your throbbing member parts the lips of her pussy and rubs against her vulva and clit as you slowly rock your hips back and forth. The busty fennec’s thighs tighten and form a ring of pleasure around your [pc.cock " + x + "]. With every repetition of your thrusting it becomes easier to increase the pace.");
		pc.cockChange();
	}
	//female:
	else if(pc.hasVagina()) output(" You slide a leg between the fox-girl’s own and begin grinding [pc.oneVagina] against her upper thigh. Your own leg grinds against her smooth cleft as you thrust against it. The busty fennec’s thighs tighten around your [pc.leg], but it does little to slow your femcum-slicked efforts.");
	else output(" You plunge your fingers into the fox-girl’s waiting cunt, using two for easier penetration. Penny’s tail begins wagging faster at this, but hits your arm at the halfway point and stops for a moment before repeating the process. You slip your other hand under her body and play with her clit, starting her moans anew.");
	output(" Penny’s moans catch in her throat as she cums again.");
	if(penny.hasCock()) output(" You hear a thud as her [penny.cock] rises to full hardness and knocks the underside of the desk, splattering the floor with pearly jizz.");
	
	//male:
	if (pc.hasCock()) 
	{
		if(x >= 0)
		{
			output("\n\nPenny moans numbly as you thrust faster and faster between her legs. You grit your teeth as you cum, adding your fluids to the veritable pool of sexual liquid.");
			if(pc.hasVagina()) 
			{
				output(" Your unused [pc.vaginas] explode");
				if(pc.vaginaTotal() == 1) output("s");
				output(" in orgasm, soaking your [pc.legOrLegs] in femcum.");
			}
			output(" As your torrent slows, you pull out of her thighs and reposition your cock closer to her head. Penny’s furry ears twitch as you empty ");
			if(pc.balls > 0) output("your [pc.balls]");
			else output("the last of your reserves");
			output(" onto them. The steamy cum nearly paints the fox-girl’s sonar dishes [pc.cumColor].");
		}
	}
	//female:
	else if(pc.hasVagina()) 
	{
		output("\n\nYou pick up the grind against Penny’s leg until you feel yourself on the edge of exploding. Suddenly you can’t hold on any longer, and your mind goes white momentarily as you explode in orgasm. As you regain your senses you " + ((!inPennyQuest() && !pennyIsCrew()) ? "put one leg onto the desk and ":"") + "move your pelvis next to her head. You rub your juices onto the fox-girl’s large ears to mark your territory. The softness feels wonderful and the fuzzy fur tickles a bit.");
	}
	//genderless:
	else 
	{
		output("\n\nAs the helpless police-woman cums you move your fingers faster, trying to push her even deeper into the sea of pleasure. “N-nooo, I d-don... want moooorrrreee” Penny moans in futile resistance as she cums for a second time in rapid succession. ");
		if(penny.hasCock()) 
		{
			output("The busty fox’s [penny.cock] spurts " + (penny.cocks[0].cLength() < 7 ? "weakly":"powerfully") + " into the puddle of fluids, ");
			if(penny.balls == 0) output("her prostate ");
			output("thoroughly drained of its reserves. ");
		}
		output("You pull your hand from her soaked box and rub her fluids into her ears, brushing her fuzzy mohawk as you do so.");
	}
	
	output("\n\nYou lean down and kiss Penny’s upside down mouth before retrieving your equipment.");
	if(!inPennyQuest())
	{
		output(" The exhausted fox-girl returns your kiss weakly before falling asleep atop her " + (pennyIsCrew() ? "bed":"desk") + ".");
		if(pc.isNice()) output(" You find a mop and clean up some of the mess before you leave, moving Penny’s body to a more comfortable sleeping position on her " + (pennyIsCrew() ? "bed":"chair") + ".");
		else if(pc.isMischievous()) output(" You find a mop and clean up some of the mess before leaving Penny to sleep.");
		else output(" You grin as you leave Penny asleep atop her " + (pennyIsCrew() ? "bed":"desk") + ". She can clean up the mess when she awakens.");
		processTime(44+rand(6));
		if(pc.hasCock() || pc.hasVagina()) pc.orgasm();
		penny.orgasm();
		this.clearMenu();
		this.addButton(0,"Next",mainGameMenu);
	}
	else
	{
		output(" <i>“Come on girl. We’ve got a mission to do.”</i>");
		output("\n\nPenny wearily gathers her things. <i>“R-right. I’m coming.”</i>\n\n");
		processTime(44+rand(6));
		if(pc.hasCock() || pc.hasVagina()) pc.orgasm();
		penny.orgasm();
		CombatManager.genericVictory();
	}
}

//TELL HER TO CALM DOWN:
public function calmDownYouPennySlut():void {
	clearOutput();
	author("Abe E. Seedy");
	showPenny();
	output("You figure you probably shouldn’t mess with her any more than you already have, and you tell her up front she can’t have any more of the drug.");
	output("\n\nAmazingly, she actually wilts a little at that. Her masturbation stops as the fennec dreamily says, <i>“Okay, okay, I guess. I’m getting a little out of hand, aren’t I?”</i> You nod. <i>“Good, ‘cause it seems to be keeping you around. I’m going to fuck you so hard as soon as I get caught up on work!”</i> She turns back towards what she was doing while trying to pack her monster dick into her pants. It doesn’t work all that well.");
	processTime(1);
	clearMenu();
	if(pennyIsCrew()) addButton(0,"Next",approachCrewPenny,true);
	else addButton(0,"Next",approachGirlfriendPenny);
}

//HAVE FUN WITH HER:
public function teasePenny():void 
{
	clearOutput();
	author("Abe E. Seedy");
	showPenny(true);
	output("<i>“No, you can’t have any more,”</i> you tell her. <i>“But you don’t </i>need<i> any more, do you?”</i>");
	output("\n\nPenny looks at you, confused. <i>“I... I don’t?”</i>");
	output("\n\nWalking behind her, you lean in close, whispering in her ear, <i>“You haven’t earned a bigger dick yet, seeing as you’re not even properly using the one you have now.”</i>");
	output("\n\nShe reddens, her eyes flicking away from you and onto her [penny.cock], still straining upwards and pressing between her breasts. <i>“I’m... I’m not? But...”</i>");
	output("\n\nBefore she can finish her sentence, you casually place one hand on the back of her head and push her forwards. She doesn’t resist, and before long her furred muzzle is pointed downwards, resting directly against her moist [penny.cockHead]. <i>“There,”</i> you say, <i>“doesn’t that feel better?”</i>");
	output("\n\nUnable to move away, Penny shudders slightly at the heat and urgency of her slick tool resting against her face. <i>“Mm-mhmmm...”</i> is all she can manage to say.");
	output("\n\nLeaning down further, you bring your face level with hers. <i>“Goodness, you’re drooling, aren’t you?”</i>");
	output("\n\nShe is, her tongue darting involuntarily from her mouth to briefly taste herself, almost intoxicated by the scent of pre-cum dripping from her cock. She can’t manage to form a proper response, only a wordless whimper making it past her lips.");

	output("\n\n<i>“It’s okay,”</i> you coo encouragingly. <i>“Don’t hold back”</i>");
	output("\n\nSlowly, inevitably, Penny’s tongue slips out of her mouth and begins sweeping around the tip of her impressive shaft. She moans in pleasure, her lips sliding upwards into a blissful smile.");
	output("\n\n<i>“Good girl...”</i> you whisper. <i>“There’s a good girl. Doesn’t it feel good, having your own cock in your mouth like this?”</i>");
	output("\n\n");
	if(penny.hasCock(GLOBAL.TYPE_EQUINE)) showImage("PennyEquineAutofellate");
	output("She nods, the motion soon turning into her head bobbing down over her shaft. It’s a struggle, but with effort - and your hand helpfully pushing behind her - she manages to get her mouth over at least the tip.");
	output("\n\nYou spin her around, pointing her away from her desk to give yourself space. She flinches slightly at the sudden movement, but doesn’t for a second pause in her oral ministrations. Smiling in approval, you ");
	if(pc.legCount == 2) output("kneel");
	else output("lower yourself");
	output(" down in front of her, taking each of her hands in yours and moving them gently onto her [penny.cock]. <i>“It’s time you earned these extra modifications,”</i> you say as you start rubbing her hands against her straining shaft, smiling further as she picks up the motion herself almost instantly. With that you’re free to return to her sensitive ears, making her shudder as you whisper directly into them. <i>“Doesn’t that feel right? Having a cock in your mouth, letting you lick up all the delicious cum? More than that, having your </i>own<i> cock in your mouth, showing how utterly addicted you are to pleasuring yourself?”</i>");
	output("\n\nPenny’s only response is to increase the speed of her hands against herself, too overwhelmed to even attempt to speak.");
	output("\n\n<i>“You’re a lovely little cumslut, aren’t you? You’re hooked on it so badly that you can’t help yourself; you can’t keep your cock out of your mouth, you need the taste of cum so desperately.”</i>");
	output("\n\nPenny whimpers, her movements becoming faster, her body starting to tense before the inevitable climax. Before it comes, however, you shift your position to grab her fiercely, pulling her head up and away from her cock before she can react.");
	output("\n\n<i>“Not yet,”</i> you say, as Penny splutters helplessly. <i>“First, you have to tell me how much you want it. You have to </i>admit<i> that you’re addicted to your own cum, and that you’re going to make sure that you stuff your mouth with your own cock as much as possible from now on.”</i>");
	output("\n\nAfter several moments of breathless gasping, Penny manages to corral her tongue enough to attempt speech, although her hands not letting up their movements for a moment doesn’t make that easy. <i>“I... mmmrrowwmm... I... oh fuck, [pc.name] I need it soOOohhhwmmm bad! Ple-ah! Please! Please let me suu-uhk! Suck my dick!”</i>");
	output("\n\nYou grin at her, but refuse to let her head sink back down as she so urgently needs. <i>“You have to </i>admit<i> it,”</i> you hiss fiercely.");
	output("\n\nPenny’s tongue is stretching down to reach the tip of [penny.cockHead], desperately straining to coat itself in the thick moistness dripping from her. <i>“Pl-please!”</i> she manages eventually. <i>“Please let me swallow my cum!”</i>");
	output("\n\nPlayfully, you look down at her, still holding her back, and ask, <i>“And why should I do that, exactly?”</i>");

	output("\n\n<i>“Because I need it!”</i> she all but howls in response. She makes eye contact with you directly for a moment, treating you to a wide-eyed, pleading expression as the words tumble out of her uncontrollably. <i>“I’ve been an absolute slut for my cum ever since you first gave me a cock! I’ve been licking it off my fur, off my " + (pennyIsCrew() ? "sheets":"desk") + " - I’ve been spending half of my time filling my mouth with that wonderful taste!”</i>");
	output("\n\nYou take her chin in your hand, forcing her to look back at you before she can break away to turn back to her throbbing cock. <i>“Well, that’s not right, is it?”</i>");
	output("\n\nLocked submissively into your eyes, she can barely respond. <i>“Muh-uhh?”</i>");
	output("\n\n<i>“No,”</i> you continue, <i>“that should take up </i>all<i> of your time.”</i>");

	output("\n\nPenny shudders dramatically, her body tensing up as she clearly comes close to orgasm just at the thought of that. <i>“Ah-ahh!”</i> she gasps. Her eyes threaten to roll back in her head, but your firm hand makes sure she stays looking at you instead.");
	output("\n\n<i>“That’s what you want, isn’t it? To spend all your time filling yourself with your own cum, like the cum-addicted fox-slut you are?”</i>");
	output("\n\nPenny thrusts her hips without thinking as her monster shaft orgasms weakly. Still only a prelude to the main event, it’s enough that the underside of her chin gets painted white as her body involuntarily betrays her approval. She looks at you with a pleading expression as she spurts repeatedly against her fur, but aside from shifting your grip forwards to avoid getting hit yourself you keep her held firmly in the same position.");
	output("\n\n<i>“Tell me you’re my little cumslut pet. Promise you’ll keep yourself slick and full even when I’m not around...”</i> you tighten your grip, and Penny shudders with a more powerful orgasm in response, <i>“and I’ll let you </i>act<i> like one.”</i>");

	output("\n\nShe struggles to speak against the constant waves of quivering pleasure running through her, and only eventually manages to through sheer force of will. <i>“Buh-buh! But what about- uhhh! What about other people see-uh! Seeing me?”</i>");

	if(!pennyIsCrew()) output("\n\nShe raises a good point. She works in a public position after all - if she spends almost all of her time with her cock in her mouth people are going to notice. What do you tell her to do when someone walks in on her?");
	else output("\n\nPenny raises a good point. She lives on your ship after all - if she spends all her time with her cock in her mouth, nobody will get see how badly hooked she is - just how addicted to sucking down her endless, Throbb-augmented loads. The confused prickvixen needs direction. Perhaps camwhoring. If she’s going to be jacking off all day, she might as well work on paying off her debts while she does it.");

	pc.changeLust(20+rand(10));
	
	//[Add some a-hole points]
	if(flags["PENNY_FUTA_TEASE"] == undefined) pc.addHard(20);
	IncrementFlag("PENNY_FUTA_TEASE");
	
	if(!pennyIsCrew())
	{
		//[Let them join in] [Let them watch] [Hide her actions]
		clearMenu();
		addButton(0,"Join In",letThemJoinInPennyYouSlut,undefined,"Join In","Instruct Penny to fuck and suck just about everyone she meets. She’d probably enjoy it, the slut.");
		addButton(1,"Let Watch",pennyLetThemWatchYouCumSlut,undefined,"Let Watch","Instruct Penny to be something of an exhibitionism slut. She seems like the type to get off on it.");
		addButton(2,"Hide It",hideYourCumslutteryPennyYouSlut,undefined,"Hide It","Instruct Penny to keep her rampant cum-sluttery a secret if possible.");
	}
	else
	{
		clearMenu();
		addButton(0,"Camwhore",turnPennyIntoACamwhore,undefined,"Camwhore","Instruct Penny to set up a camera so that everyone on the entire extranet can see how depraved she is. She’d enjoy it, the slut.");
		addButton(1,"Discrete",turnPennyIntoACamwhore,true,"Discrete Camwhore","Instruct Penny to set up a camera with her face out of frame so that everyone can see what a perverted little cum-sucking slut she’s becoming, even if they never get to watch her eyes roll back while she swallows a load.");
	}
}

//HIDE HER ACTIONS
public function hideYourCumslutteryPennyYouSlut():void {
	clearOutput();
	author("Abe E. Seedy");
	showPenny(true);
	output("<i>“Hide it,”</i> you say simply. <i>“Even if you’ve just given yourself a mouthful of cum - even if you’re orgasming right at the moment someone knocks at the door - you have to make yourself look respectable.”</i>");
	output("\n\nPenny moans, clearly turned on by the thought of trying to be a secret slut. The threat of getting caught would be intense, given that there’s no way she could easily hide everything in time, but by her reaction that seems like it only makes things hotter for her. You picture her trying to resolve a dispute in her office, quivering as her monster cock unloads again and again onto the underside of her desk, trying to keep herself together enough to continue a conversation. It’d be a good look for her, and a natural evolution - going from being so shy about wanting a cock in the first place to being so addicted to it she can’t stop playing with it even when she has to hide it from other people in the room.");
	output("\n\nStill making sure you have a strong enough of a grip to keep her away from her cock, you shift one of your hands to scratch lightly against the base of her ears. <i>“You’re </i>mine<i>, aren’t you pet?”</i> you whisper to her. <i>“Mine, not for anybody else.”</i>");
	output("\n\nPenny looks up at you, absolute blissful submission in her eyes. <i>“Yes, [pc.name],”</i> she answers dreamily. <i>“I’m your pet.”</i> Her muzzle screws up briefly into a grimace as her hands quicken their pace against her straining shaft. She panted deliriously. <i>“Please master! Please let me suck my cock! It’s been so long since I tasted my cum, I -mmhhuhh! I can’t stand it!”</i>");
	output("\n\nWith a smile you lower her head back down, and when her mouth finally makes contact again with her dripping wet [penny.cockHead] a shudder of pleasure runs through her entire body, quickly turning into a series of frantic twitches as she begins to finally climax. You can see her shaft pulse as she pumps load after load into herself, her mouth fighting to keep a tight seal while she frantically tries to swallow as much as possible. It’s a hopeless struggle however, and within moments thick strands of cum leak out from between her lips. If Penny notices she makes no sign; her eyes rolling back as she finally feeds her addiction, the only thought in her head seemingly that each thrust of her hips means another blast of the cum she so craves and any other consideration is utterly secondary. When her flow begins to slacken she plunges one hand into her neglected slit without hesitation, and the other fondles her churning balls, desperate to wring as many orgasms out of herself as her drug-enhanced constitution allows.");
	output("\n\nFinally, after one last emphatic shudder, Penny’s body goes blissfully limp, lying back in the hazy afterglow. Her [penny.cock] slips from her mouth as it begins to soften, thick strands of cum connecting it to her lips as it slides down to rest against her breasts. She licks her lips dreamily, then starts slowly dragging her hands up her slick shaft, scooping up what she’d missed to slurp it contentedly from her fingers. <i>“Mhmmm,”</i> she says between mouthfuls, <i>“I guess I’m going to have to start drinking a lot of protein shakes if I’m going to keep this up.”</i>");

	output("\n\n\She looks up at you with a grin, but that playfulness freezes on her face as you move in close to her again. Reaching out with one finger you draw it slowly across the underside of her chin, gathering up a morsel of the cum she’d sprayed herself with earlier. Bringing it up level with her face you say simply, <i>“Yes. You will.”</i>");
	output("\n\nPenny fights it for just a moment, her eyes flicking between yours and her cum in front of herself, unsure about still being so submissive now that the heat of the moment is passed. In seconds though her resolve melts, and she leans forward to clean her cum off you eagerly with her tongue.");
	output("\n\n<i>“Mine,”</i> you say firmly, and Penny nods in response, happily accepting her role as your cumslut pet. She whimpers softly as you turn and leave, but soon loses focus as her attention shifts to her rapidly re-hardening cock. Just as you disappear around the corner you knock sharply on her door, smirking at the sudden gasp from Penny as she jumps to hide her urgent erection.");
	
	flags["PENNY_HIDING_CUMSLUTTERY"] = 1;
	flags["PENNY_LETTING_OTHERS_WATCH_CUMSLUTTERY"] = undefined;
	flags["PENNY_BEING_A_PUBLIC_CUMSLUT"] = undefined;
	flags["PENNY_IS_A_CUMSLUT"] = 1;
	pc.changeLust(10);
	processTime(10);
	clearMenu();
	addButton(0,"Next",approachGirlfriendPenny);
}

//LET THEM WATCH
public function pennyLetThemWatchYouCumSlut():void {
	clearOutput();
	author("Abe E. Seedy");
	showPenny(true);
	output("<i>“Let them watch,”</i> you say simply.");
	output("\n\nPenny squirms in response, blushing even more than before at the instruction.");
	output("\n\n<i>“What?”</i> you tease her. <i>“Are you too shy for that? Doesn’t the thought of everyone seeing you desperately sucking your own dick turn you on?”</i>");
	output("\n\n<i>“Muhhmmmm!”</i> she answers, leaving you unsure as to whether she’s struggling to speak further or break free from your grip and resume servicing herself. Finally she manages to make a more coherent response, whimpering, <i>“But... how will they respect m-”</i>");
	output("\n\nYou cut her off by forcing her face suddenly down against her cock, her speech soon stopping as her lips switch effortlessly to sweeping over her slick [penny.cockHead]. <i>“Now now,”</i> you answer. <i>“What’s more important? Respect? Or being able to lick your dick clean at any moment?”</i>");
	output("\n\nPenny moans wordlessly, unable to stop herself from doing exactly that.");
	output("\n\n<i>“Theeere you go,”</i> you say approvingly, forcing her head slowly downwards until she’s taken as much of her cock inside her mouth as possible and is limited to blissfully fucking her own face. <i>“Doesn’t that feel better? Isn’t it just so much nicer not to worry about what anyone can see, or what anyone thinks; and instead just focus on feeding your wonderful addiction?”</i>");
	output("\n\nHer eyes roll slowly back in her head as she starts to inexorably lose herself in the sensation of swallowing her [penny.cock].");
	output("\n\n<i>“In fact,”</i> you continue, moving around to stand beside her and whispering directly into her ear, <i>“you </i>want<i> people to see this, don’t you? You want people to see how you’re hooked on drinking your own cum, how you can’t stop putting your dick in your mouth and working it over again, and again, and again.”</i>");
	output("\n\nPenny’s movements are becoming jerky and erratic, her whole body shuddering as she approaches what is clearly an unstoppable orgasm. Seizing the moment, you grab her fiercely and hiss, <i>“You’re a cumslut, aren’t you? You’re addicted to the taste of your own cum, and don’t care if the whole town watches you milk yourself.”</i>");
	output("\n\nShe manages to look up at you, her blushing face and the look of pleading desperation in her eyes conveying her hesitance, but even as she does her dick starts surging involuntarily, and soon burst after burst is splashing against the back of her throat, and all she can do is slurp it down greedily. Her resistance melts as she sinks into it, her eyes sliding closed and her blush fading as all her reservations are overcome by just how <i>good</i> this feels.");
	output("\n\nSeeing her adjusting, you shift to crouch directly in front of her, watching approvingly as she gulps down her seemingly never-ending load. <i>“Good girl,”</i> you say encouragingly. <i>“Don’t you enjoy putting on a good show like this?”</i>");
	output("\n\nEven muffled as she is, Penny manages to give out a slightly more concerted moan to attempt to express her approval.");
	output("\n\nYou grin in response. <i>“Of course you do. So much better than letting your silly little shyness get in the way of enjoying your wonderful cock you went </i>so<i> out of your way to get. But remember...”</i> Without warning you slide three fingers inside her dripping slit, the sudden shock of which causes her cock to bulge with a startlingly intense orgasm, almost forcing it out of her mouth with the sheer volume of cum she produces in that one instant. <i>“Everyone can watch, but only </i>I<i> get to enjoy you.”</i>");
	output("\n\nThat last emphatic orgasm seems to have wrung most of it out of her, and within moments Penny is left leaning exhausted back in her chair, while her [penny.cock] slides slowly out of her mouth to rest between her breasts. After spending a moment appraising the impressive amount of mess she left on your fingers you casually place them next to her mouth, and reflexively she leans forward and begins to eagerly lick them clean.");
	output("\n\n<i>“What a good girl,”</i> you coo, before turning and walking out of the room, leaving the near-incoherent Penny to recover behind you. As you step outside you see a citizen of the town wandering by, and with a smirk you tell them that Penny has something to show them in her office, and they should let the rest of the town know. After all, it wouldn’t do to let her talents go to waste by letting her shows go unseen.");
	
	flags["PENNY_LETTING_OTHERS_WATCH_CUMSLUTTERY"] = 1;
	flags["PENNY_HIDING_CUMSLUTTERY"] = undefined;
	flags["PENNY_BEING_A_PUBLIC_CUMSLUT"] = undefined;
	flags["PENNY_IS_A_CUMSLUT"] = 1;
	pc.changeLust(10);
	processTime(10);
	clearMenu();
	addButton(0,"Next",approachGirlfriendPenny);
}

//LET THEM JOIN IN
public function letThemJoinInPennyYouSlut():void {
	clearOutput();
	author("Abe E. Seedy");
	showPenny(true);
	output("<i>“What should you do if other people come in?”</i> you repeat. <i>“I don’t think that’s up to you, is it?”</i>");
	output("\n\nPenny’s brow furrows, confusion showing on her features even despite her distraction. Before she can speak, however, you continue.");
	output("\n\n<i>“No, I don’t think it’s up to you what people choose to do with you. After all, you’ll be too busy sucking on your own cock to bother with thinking about what they do.”</i>");
	output("\n\nShe blushes deeply, and seeing this you lower yourself down in front of her, staring at her directly while still keeping one arm on her chin to keep her from servicing herself.");
	output("\n\n<i>“Actually, I think it’s more than that. I think you </i>want<i> to be as much of a slut as possible. Don’t you?”</i>");
	output("\n\n<i>“Muh-muuhhhh,”</i> Penny mumbles incoherently, unable to form actual words in response. You can see from her labored breaths and straining erection though that you seem to have hit the mark.");
	output("\n\n<i>“That’s it, isn’t it? All this shyness about your cock - secretly, don’t you think it would be </i>thrilling<i> to be completely open with it? And not just that, but to let yourself sink into the role of the town cumdump?”</i>");
	output("\n\nShe shudders, breaking eye contact with you and looking away as much as possible. <i>“N-no,”</i> she manages to say. <i>“I have to... to keep it together. Be r... responsible. I can’t,”</i> she pants, <i>“I can’t, I can’t. Have to... pay my debts....”</i>");
	output("\n\n<i>“But you </i>want to<i>, don’t you?”</i> You lean in closer, enjoying the shiver that runs through her as you whisper directly into her sensitive ears. <i>“You want to let go and feel what it would be like to have the cum of six different people sticking to your fur, while you happily lick your own jizz off your shaft in front of a seventh. Doesn’t that sound good?”</i>");
	output("\n\nPenny’s response is barely audible, coming as it does between frantic pants. <i>“Yes...”</i> she whispers.");
	output("\n\n<i>“Embrace it,”</i> you answer softly. <i>“You’re addicted to cum now, aren’t you? You don’t feel right without the sensation of it sticking to you, the thickness of it sliding down your throat, the smell of it filling up your nose.”</i>");
	output("\n\n<i>“Mmmuhhhhh....”</i> Penny can’t bring herself to speak; only capable of wordlessly moaning as her eyes drift backwards in bliss. Even without being allowed to stimulate herself she looks like she’s only moments away from orgasm.");
	output("\n\nMoving back in front of her, you grip her head in both hands. <i>“That’s what you want, isn’t it? Just admit it, and embrace it, and then you can be the happy little cumslut you deserve to be.”</i>");
	output("\n\nIt’s as though something inside her breaks. She looks up at you suddenly; her eyes snapping open wide and locking with yours. <i>“Please!”</i> she gasps. <i>“Please, I need cum on me! Please, I have to be marked as a cumslut! I need to be coated so people can see and know and coat me more and I can have enough to cover myself with and lick off and be dripping and please please please uhUHHhhhhh I need cum on me, [pc.name]!”</i>");
	output("\n\nWell, you can hardly turn down an invitation like that. How do you respond?");
	
	flags["PENNY_BEING_A_PUBLIC_CUMSLUT"] = 1;
	flags["PENNY_HIDING_CUMSLUTTERY"] = undefined;
	flags["PENNY_LETTING_OTHERS_WATCH_CUMSLUTTERY"] = undefined;
	flags["PENNY_IS_A_CUMSLUT"] = 1;
	pc.changeLust(10);
	processTime(10);
	clearMenu();
	//[Use your cock] [Use her cock] [Find someone in public]
	if(pc.hasCock()) addButton(0,"Your Cock",useYourCocksOnCumSluttyPenny,undefined,"Your Cock","Cum all over Penny with your cock.");
	else addDisabledButton(0,"Your Cock","Your Cock","You need a dick in order to use it on Penny.");
	addButton(1,"Penny’s Cock",makeUseOfPennysCumSlutCock,undefined,"Penny’s Cock","Penny can make a mess of herself with her own cock.");
	addButton(2,"Find Someone",findSomeonePublicToHelpPennyCumslut,undefined,"Find Someone","Find someone to give Penny the cum she needs.");
}

//USE YOUR COCKS (characters with penis and ability to produce non-zero amounts of cum only)
public function useYourCocksOnCumSluttyPenny():void {
	clearOutput();
	author("Abe E. Seedy");
	showPenny(true);
	var x:int = pc.biggestCockIndex();
	output("Grinning, you hurriedly get your equipment out of the way, leaving the both of you completely naked. Penny by now is simply drooling; her mind so addled by lust she doesn’t even think to suck her own cock - she’s merely waiting passively to be used. You have every intention of obliging her; ");
	if(pc.isTaur()) output("positioning yourself carefully, then ");
	output("working your [pc.cock " + x + "] over eagerly. It’s not long before you feel your body begin to respond - her performance so far has done more than enough to put you in the mood, and her absolute lust for this serves to spur you on even further. Within moments you feel your body tensing, your hips thrusting reflexively as your [pc.cock " + x + "] spasms, ");
	
	if(pc.cockTotal() > 1) 
	{
		output("your ");
		if(pc.cockTotal() == 2) output("other cock");
		else output("other cocks");
	}
	else if(pc.hasVagina()) output("your [pc.vaginas]");
	if(pc.cockTotal() > 1 || pc.hasVagina()) output(" soon joining in sympathetically, and ");
	output("your [pc.cumColor] cum spurting out to land on her face.");
	var cumQ:Number = pc.cumQ();
	//MODERATE LEVEL OF CUM PRODUCTION
	if(cumQ >= 500 && cumQ < 2000) output(" You cum again and again, producing enough to cover her entire head, which she reacts to with cooing pleasure, turning herself from side to side slowly to ensure an even coating of your [pc.cumColor] fluid.");
	else if(cumQ >= 2000) output(" You cum over and over, a seemingly endless wave of fluid pouring out of you. Penny wriggles beneath it in delight, turning from side to side to ensure it covers as much of herself as possible. Between your convulsive aim and her work to spread it further you manage to coat her entire body, leaving her happily dripping with [pc.cumColor] fluid.");
	output("\n\nWhen you finally finish, Penny spends several long moments simply breathing deeply, blissfully taking in the scent of sex filling her nostrils. She licks her lips once, then opens her eyes slowly. <i>“Fuck, [pc.name], you’re right. I’m going to have to do that a </i>lot<i> more often.”</i> She wipes one finger along the worst of it, gathering up the [pc.cumColor] strands and slipping them happily inside her mouth, but makes no effort to clean herself up further. It looks like she really has taken your lesson to heart - she’d rather leave herself visibly marked as a cumslut than enjoy the pleasure of cleaning herself off. That said, she’s hardly forced to go without the taste of cum for long - with a satisfied moan her head moves forward, filling her muzzle with her own massive cock and thrusting dreamily into herself. This time you decide to let her keep going, figuring that she’s earned the release.");
	output("\n\nYou turn to leave while she’s still pleasantly self-absorbed, her eager slurping noises following you as you step out of her office. You imagine that her new predilections will make doing her job considerably harder, but, you add to yourself with a grin, considerably more enjoyable for all involved.");
	processTime(5+rand(10));
	pc.orgasm();
	if(flags["PENNY_CUMSLUT_JOIN_IN"] == undefined) pc.addHard(5);
	IncrementFlag("PENNY_CUMSLUT_JOIN_IN");
	clearMenu();
	//move to the room outside of Penny’s
	addButton(0,"Next",moveOutsidePennysOffice);
	//[Add a considerable amount of a-hole points] [reduce lust to zero]
}

//USE HER COCK
public function makeUseOfPennysCumSlutCock():void {
	clearOutput();
	author("Abe E. Seedy");
	showPenny(true);
	output("Wordlessly, you move your hands to her trembling shaft, settling into a rhythm without any further foreplay. Penny moans in response, her head lolling forwards now that you finally let her indulge, lapping eagerly at the tip of her cock. With how much you’ve worked her up already it doesn’t take long until she trembles and stiffens, her cock surging as wave after wave of cum spurts out. Casually you move her shaft out of her mouth - Penny herself is too overcome with pleasure to resist - aiming her cock as best you can so that her stream of cum coats her face. Fortunately your task is made easier by the sheer volume that Penny produces; even with it going everywhere there is still more than enough to paint her face white. On top of that, Penny seemingly instinctively joins in - rolling her head around happily to ensure that every part of it is coated with her own cum.");
	output("\n\nWhen she finally finishes, Penny spends several long moments simply breathing deeply, blissfully taking in the scent of sex filling her nostrils. She licks her lips once, then opens her eyes slowly. <i>“Fuck, [pc.name], you’re right. I’m going to have to do that a </i>lot<i> more often.”</i> She wipes one finger along the worst of it, gathering up the sticky whiteness and slipping them happily inside her mouth. She keeps on like that - leisurely licking at loose strands rather than making an effort to clean herself up properly. It looks like she really has taken your lesson to heart, preferring to leave herself visibly marked as a cumslut than enjoy the pleasure of cleaning herself off.");
	output("\n\nYou turn to leave while she’s still pleasantly self-absorbed, her eager slurping noises following you as you step out of her office. You imagine that her new predilections will make doing her job considerably harder, but, you add to yourself with a grin, considerably more enjoyable for all involved.");
	//[Add a considerable amount of a-hole points]
	processTime(5+rand(10));
	pc.changeLust(20+rand(10));
	if(flags["PENNY_CUMSLUT_JOIN_IN"] == undefined) pc.addHard(5);
	IncrementFlag("PENNY_CUMSLUT_JOIN_IN");
	clearMenu();
	//move to the room outside of Penny’s
	addButton(0,"Next",moveOutsidePennysOffice);
	//[Add a considerable amount of a-hole points] [reduce lust to zero]
}

//FIND SOMEONE IN PUBLIC
public function findSomeonePublicToHelpPennyCumslut():void {
	clearOutput();
	author("Abe E. Seedy");
	showPenny(true);
	output("<i>“Well,”</i> you say softly to her, <i>“what are you waiting for? Your fur isn’t going to coat itself in cum.”</i>");
	output("\n\nPenny looks up at you blankly. <i>“Mm-uhh?”</i> she moans in confusion.");
	output("\n\nMoving behind her, you give her a firm push on the back, eventually coaxing her to stand. <i>“It’s time to go out and serve the public, don’t you think?”</i> you add. <i>“Let them all see the new you, and get used to your new... requirements.”</i>");
	output("\n\nFor the briefest of moments she resists, clearly having a flash of her previous shyness about being seen with her new ‘equipment’. But then she shudders, the scent of her own dripping cock filling her nose, and one hand drops down to brush against her achingly wet slit. Without any further hesitation she launches herself forward, her breasts and cock still completely exposed as she darts outside. You grin as you hear shocked gasps outside melt into pleasured moans, then collect yourself and walk nonchalantly out the door. As you leave you catch sight of a tangled knot of people in an alley out of the corner of your eye, and while you smirk to yourself you refrain from heading over. You’re sure Penny will be nice and ready for you once the others have broken her in, and it looks like she’s got enough playmates to keep herself sated for the moment.");
	//[Add a considerable amount of a-hole points]
	processTime(5+rand(10));
	pc.changeLust(20+rand(10));
	if(flags["PENNY_CUMSLUT_JOIN_IN"] == undefined) pc.addHard(5);
	IncrementFlag("PENNY_CUMSLUT_JOIN_IN");
	clearMenu();
	//move to the room outside of Penny’s
	addButton(0,"Next",moveOutsidePennysOffice);
	//[Add a considerable amount of a-hole points] [reduce lust to zero]
}


//--TO ADD TO TALK MENU FOR CUMSLUT PENNY--
public function pennyCumslutterMenuTalk():void {
	clearOutput();
	author("Abe E. Seedy");
	showPenny(true);
	//CHANGE CUMSLUT ACTIONS
	output("Noticing that Penny is barely able to refrain from touching herself even while having a normal conversation with you, you mention to her that perhaps she should indulge herself a little differently" + (pennyIsCrew() ? "":"when other people are around") + ".");
	output("\n\n<i>“Mhmmmmmm?”</i> she responds, even the mere suggestion enough to cause her to drag one hand slowly along her stiffening shaft. <i>“How would you prefer I act" + (pennyIsCrew() ? "":" if other people see me doing this") + "?”</i>");
	output("\n\nWalking around the desk to stand next to her, you hold her chin up to point her face at yours, and not incidentally keep her mouth away from her moistening [penny.cockHead] before you respond.");
	output("\n\nWhat do you tell her she should do?");
	if(flags["PENNY_CUMSLUT_RECRUITED"] != undefined) output(" <b>Actually, since she gave up everything to be a camwhore, it might be best to leave her as-is.</b>");
	//[Let them join in] [Let them watch] [Hide her actions] --(all of these previous as before)-- [Calm down]
	clearMenu();
	if(pennyIsCrew())
	{
		addButton(0,"Never Mind",nevermindCumslutPenny,undefined,"Never Mind","Just kidding!");
		if(flags["PENNY_CUMSLUT_RECRUITED"] == undefined) addButton(4,"Calm Down",calmDownPennyBitch4Repeats,undefined,"Calm Down","Talk Penny into not being such a brazen, cum-drinking slut.");
		else addDisabledButton(4,"Calm Down","Calm Down","Penny <b>needs</b> to make money as a camwhore to keep up on her debt payments. Now that she’s given up her old job to live with you, camwhoring is her only option.");
	}
	else
	{
		if(flags["PENNY_BEING_A_PUBLIC_CUMSLUT"] == undefined) addButton(0,"Join In",letThemJoinInPennyYouSlut);
		else addDisabledButton(0,"Join In","Join In","Penny is already doing this.");
		if(flags["PENNY_LETTING_OTHERS_WATCH_CUMSLUTTERY"] == undefined) addButton(1,"Let Watch",pennyLetThemWatchYouCumSlut);
		else addDisabledButton(1,"Let Watch","Let Watch","Penny is already doing this.");
		if(flags["PENNY_HIDING_CUMSLUTTERY"] == undefined) addButton(2,"Hide It",hideYourCumslutteryPennyYouSlut);
		else addDisabledButton(2,"Hide It","Hide It","Penny is already doing this.");
		addButton(4,"Calm Down",calmDownPennyBitch4Repeats,undefined,"Calm Down","Talk Penny into not being such a brazen, cum-drinking slut.");
	}
}

public function nevermindCumslutPenny():void
{
	clearOutput();
	author("Fenoxo");
	showPenny(true);
	output("<i>“Never mind!”</i> you jovially say, pushing Penny halfway down her dick before tugging the gasping, giggling prick-vixen back up. <i>“You keep camwhoring your heart out. It’s fun, isn’t it?”</i>");
	output("\n\nPenny nods as much as your grip allows. <i>“Y-yeah. They love it when I suck myself deep. I even got a camera script that zooms in when I climax, right on my dick so they can see it pulsate with each load.”</i> Her [penny.cock] swells, forming an enormous droplet of pre at its apex, nestled snugly between " + (rand(2) == 0 ? "Penny" : "the fox") + "’s fuzzy tits. <i>“And I cum so hard knowing they’re all jacking off, mate. I cum so hard.”</i> She whimpers. <i>“Please... can I suck now? Can I milk out a load for you? Please?”</i>");
	output("\n\n");
	if(penny.hasCock(GLOBAL.TYPE_EQUINE)) showImage("PennyEquineAutofellate");
	output("You push her back onto her cock, watching her cheeks hollow and her tongue flick out, spreading the syrupy pre across glistening veins and heavy, turgid flesh. The whorish vixen’s eyes flutter closed as she slurps and sucks. <i>“Of course you can suck, and you should. There’s still so much cum in those balls of yours, isn’t there? So much cum for you to suck and drink, and if you’re going to be the very sluttiest, cum-thirstiest girl on the extranet, you’re going to need to swallow it down until your breath smells as cummy as all your viewer’s dicks added together.”</i>");

	output("\n\nWave after wave of cum spurts into Penny’s mouth in response, bulging her cheeks. She gurgles in ecstatic bliss and gulps as fast as she can, but there’s too much cum. Rivers of it stream from the corners of her mouth to slide down onto her tits. You pull her back before she chokes herself, watching thick sprays burst upon her pleasure-drunk face and tongue. Gooey ropes cling to her mohawk and weigh it down until it sticks to one of her colossal fennec-morphed ears. The fox revels in it. She rolls out her tongue just to taste the splashes of excess. One handed, she futilely shovels palmfuls of spunk into her mouth, uncaring that her dick’s deluge re-drenches the spot in a single spurt.");
	output("\n\nWhen she finally finishes, Penny spends several long moments simply breathing deeply, blissfully taking in the scent of sex filling her nostrils. She licks her lips once, then opens her eyes slowly. <i>“Fuck, [pc.name], that gets better every time. I’ve been doing that a </i>lot<i>, but it’s always better when you’re here to really get things going.”</i> She wipes one finger along the worst of it, gathering up the sticky whiteness and slipping it happily inside her mouth. She keeps on like that - leisurely licking at loose strands rather than making an effort to clean herself up properly. It looks like she’s quite happy to leave herself dripping wet, so that she’s visibly marked as a cumslut rather than enjoying the pleasure of cleaning herself off.");
	processTime(5);
	pc.changeLust(10);
	clearMenu();
	addButton(0,"Next",approachCrewPenny,true);
}

//CALM DOWN
public function calmDownPennyBitch4Repeats():void {
	clearOutput();
	author("Abe E. Seedy");
	showPenny(true);
	output("You figure that she probably needs to calm things down a notch, and that she should probably focus less on self-pleasure and more on, well, pretty much everything else she should be doing. You tell her as much, and amazingly she manages to control herself after one long focused outward breath.");
	output("\n\nHer masturbation stops as the fennec dreamily says, <i>“Okay, okay, I guess. I’m getting a little out of hand, aren’t I?”</i> You nod. <i>“Well, you’re right. Fun’s fun, but there’s work to be done. Still,”</i> she adds with a grin, <i>“don’t think I’m not going to fuck you wildly as soon as I get caught up on work!”</i> She turns back towards what she was doing while trying to pack her monster dick into her pants. It doesn’t work all that well.");
	//[Reset Penny to non-cumslut hyper-futa]
	flags["PENNY_IS_A_CUMSLUT"] = undefined;
	flags["PENNY_HIDING_CUMSLUTTERY"] = undefined;
	flags["PENNY_LETTING_OTHERS_WATCH_CUMSLUTTERY"] = undefined;
	flags["PENNY_BEING_A_PUBLIC_CUMSLUT"] = undefined;
	clearMenu();
	if(pennyIsCrew()) addButton(0,"Next",approachCrewPenny,true);
	else addButton(0,"Next",talkToGirfriendPenny);
}

//--TO ADD TO SEX MENU FOR CUMSLUT PENNY--
//SELF SUCK
public function pennySelfSuckCumsluttery():void {
	clearOutput();
	author("Abe E. Seedy");
	showPenny(true);
	output("Looking over at the lust-enthralled fox, you say casually that you’re surprised not to see her with her own cock in her mouth, considering how much she loves the taste of her own cum. Before you’ve even finished speaking Penny has already fallen forwards against it, her mouth forming as much of a seal as she can manage around her [penny.cockHead]. Wordlessly, you move your hands to her trembling shaft, settling into a rhythm without any further foreplay. Penny moans in response, her head lolling forwards involuntarily, breaking her seal as she shifts to lapping happily at the tip of her cock. With admirable swiftness she trembles and stiffens, her cock surging as wave after wave of cum spurts out. Casually you move her shaft out of her mouth - Penny herself is too overcome with pleasure to resist - aiming her cock as best you can so that her stream of cum coats her face. Fortunately your task is made easier by the sheer volume that Penny produces; even with it going everywhere there is still more than enough to paint her face white. On top of that, Penny seemingly instinctively joins in - rolling her head around happily to ensure that every part of it is coated with her own cum.");
	output("\n\nWhen she finally finishes, Penny spends several long moments simply breathing deeply, blissfully taking in the scent of sex filling her nostrils. She licks her lips once, then opens her eyes slowly. <i>“Fuck, [pc.name], that gets better every time. I’ve been doing that a </i>lot<i>, but it’s always better when you’re here to really get things going.”</i> She wipes one finger along the worst of it, gathering up the sticky whiteness and slipping it happily inside her mouth. She keeps on like that - leisurely licking at loose strands rather than making an effort to clean herself up properly. It looks like she’s quite happy to leave herself dripping wet, so that she’s visibly marked as a cumslut rather than enjoying the pleasure of cleaning herself off.");
	output("\n\nYou turn to leave while she’s still pleasantly self-absorbed, her eager slurping noises following you as you step out of her office. You grin as you step outside, happy to see her so eagerly embracing her new endowment and urges, and already looking forward to her next session.");
	pc.changeLust(20);
	processTime(10+rand(10));
	clearMenu();
	if(pennyIsCrew()) addButton(0,"Next",mainGameMenu);
	else addButton(0,"Next",moveOutsidePennysOffice);
}

//BUKKAKE (characters with penis and ability to produce non-zero amounts of cum only)
public function bukkakePenny():void {
	clearOutput();
	author("Abe E. Seedy");
	showPenny(true);
	var x:int = pc.biggestCockIndex();
	output("You tell Penny that you think it’s time for her to be feeding, and her mouth hangs open eagerly in response.");
	output("\n\n<i>“Oh fuck yes, [pc.name], you have no idea how much I’ve been needing this. Please, please...”</i> She’s all but babbling incoherently, the thought of receiving a fresh coating of your cum instantly flipping her into an all but mindless desire. <i>“Please shower me with your delicious cum!”</i>");
	output("\n\nGrinning, you hurriedly get your equipment out of the way, leaving the both of you completely naked. Penny by now is simply drooling, her mind so addled by lust she doesn’t even think to suck her own cock. Instead she’s merely waiting passively to be used, and you have every intention of obliging her. You ");
	//NON-STANDARD GENITAL CONFIGURATION (taur, tail/nipple cock only) =
	output("position yourself carefully, then work your [pc.cock " + x + "] over eagerly. It’s not long before you feel your body begin to respond - you came in intending to give her a fresh coat of paint, and her performance so far has done more than enough to put you in the mood, while her absolute lust for this easily served to spur you on even further. Within moments you feel your body tensing, your hips thrusting reflexively as your [pc.cock " + x + "] spasms, ");
	//multi-cocks/herm
	if(pc.cockTotal() > 1 || pc.hasVagina())
	{
		output("your ");
		if(pc.cockTotal() == 2) output("other cock");
		else if(pc.cockTotal() > 2) output("other cocks");
		if(pc.cockTotal() > 1 && pc.hasVagina()) output(" and ");
		if(pc.hasVagina()) output("[pc.vaginas]");
		output(" soon joining in sympathetically, and ");
	}
	output("your [pc.cumColor] cum spurting out to land on her face.");
	var cumQ:Number = pc.cumQ();
	if(cumQ >= 500 && cumQ < 2000) output(" You cum again and again, producing enough to cover her entire head, which she reacts to with cooing pleasure, turning herself from side to side slowly to ensure an even coating of your [pc.cumColor] fluid.");
	//LARGE LEVEL OF CUM PRODUCTION
	else if(cumQ >= 2000) output(" You cum over and over; a seemingly endless wave of fluid pouring out of you. Penny wriggles beneath it in delight, turning herself from side to side to ensure it covers as much of herself as possible. Between your convulsive aim and her work to spread it around upon herself you manage to coat her entire body, leaving her happily dripping with [pc.cumColor] fluid.");
	output("\n\nWhen you finally finish, Penny spends several long moments simply breathing deeply, blissfully taking in the scent of sex filling her nostrils. She licks her lips once, then opens her eyes slowly. <i>“Fuck, [pc.name], I have to thank you again for this. I don’t think I ever feel so good as when I’m coated with cum. Especially yours, of course.”</i> She wipes one finger along the worst of it, gathering up the [pc.cumColor] strands and slipping them happily inside her mouth, but makes no effort to clean herself up further. It looks like she’s intending to leave herself visibly marked as a cumslut rather than enjoying the pleasure of cleaning herself off. That said, she’s hardly helpless to enjoy the taste of more cum - with a satisfied moan her head moves forward, filling her muzzle with her own massive cock and thrusting dreamily into herself. You graciously decide to let her keep going, figuring that she’s earned the release.");
	output("\n\nYou turn to leave while she’s still pleasantly self-absorbed, her eager slurping noises following you as you step out of her " + (pennyIsCrew() ? "quarters":"office") + ".");
	//[reduce lust to zero]
	processTime(10+rand(10));
	pc.orgasm();
	clearMenu();
	if(pennyIsCrew()) addButton(0,"Next",mainGameMenu);
	else addButton(0,"Next",moveOutsidePennysOffice);
}

public function pennyVsFlahneWhoWillOutslutWho():void
{
	clearOutput();
	author("Abe E. Seedy");
	showBust(pennyBustDisplay(true), flahneBustDisplay(true));
	var x:int = pc.biggestCockIndex(); // Fenstyle yo

	output("You mention to Penny that you had a very interesting talk about her with Flahne recently. At the mention of Flahne’s name Penny’s ears prick up with almost comical enthusiasm, betraying her interest as they literally swivel slightly towards you.");
	output("\n\n<i>“Oh?”</i> she responds with forced innocence. <i>“What did she have to say?”</i>");
	output("\n\n<i>“She told me that she’s been trying to get you a nice cock to play with forever, and yet you’d always said no in the past.”</i> You lean in over Penny’s desk, forcing her eyes to lock with yours. <i>“I guess it just took me to push you over the edge, didn’t it?”</i>");
	output("\n\n<i>“Muh-uhmm!”</i> is all Penny can say, her ability to make words rapidly being pushed out of her head by your closeness.");
	if (flags["PENNY_HIDING_CUMSLUTTERY"] != undefined || flags["PENNY_LETTING_OTHERS_WATCH_CUMSLUTTERY"] != undefined)
	{
		output("<i>“I haven’t let... I haven’t let her help!”</i> she managed. <i>“I’ve wanted to; oh, [pc.name] how I’ve wanted to! But I haven’t! It’s not... it’s not for her....”</i>");
	}
	
	output("\n\nYou interrupt her floundering by pressing softly on her lips, letting her know delicately but undeniably that now is not the time for her to be talking. <i>“She asked me to put in a word for her with you, did you know that? Can you guess what she wants from you?”</i>");
	output("\n\nUnbidden and untouched, Penny’s thick shaft has already risen above " + (pennyIsCrew() ? "fluffy middle":"her desk") + ", reaching up to stand trembling just beneath her chin. Penny’s eyes flick downwards for a moment, going from her cock and back to you questioningly, while you respond with an encouraging nod.");
	output("\n\n<i>“Who are we to deny her access to it, hmm?”</i> you ask teasingly. <i>“Someone wants to suck your cock, and give you a nice thick cock of her own to suck in turn. How could you possibly deny her that?”</i>");
	output("\n\nAgain, Penny is left whimpering incoherently, unable to tear her eyes away from you, but even so still breathing heavily and filling her nostrils with the scent of her own sex. Rather than waiting for her to control herself, you simply hand her her communicator, pressing it into her palm until she finally understands what’s required.");
	output("\n\nHurriedly pressing the buttons, Penny only just manages to get herself under control before Flahne responds. You can only barely make out Flahne’s chirpy greeting, and for her part Penny can only just stick to the bare necessities of the conversation.");
	output("\n\n<i>“I need you!”</i> she all but barks. <i>“You nnneed to come over here right now! No questions asked!");
	if (flags["PENNY_BEING_A_PUBLIC_CUMSLUT"] != undefined && !pennyIsCrew()) output("And just go right past the line outside. This is important!")
	output("”</i>");

	output("\n\nIt sounds like Flahne starts to ask a question in response, but Penny cuts her off quickly. <i>“No questions!”</i> she repeats urgently. <i>“Come!”</i>");
	output("\n\nShe hangs up emphatically, fighting back a whole-body tremor as she instinctively reacts to her own accidental command. Even just at that a brief spurt of pre-cum wells up on the tip of her cock, and fixes you with a pleading expression after she looks down at it.");
	output("\n\nYou respond with a magnanimous nod, and instantly she tilts her head down and starts sweeping her tongue slowly and blissfully against her trembling flesh, lapping eagerly at her initial burst of thick fluid. You stop her after just a few moments, lightly but emphatically pushing her head back to force her to release herself from her ministrations.");
	output("\n\n<i>“There, there,”</i> you coo, <i>“that’s enough for now. You were a good girl inviting your friend over, but you have to make sure there’s enough left to share, don’t you?”</i>");
	output("\n\nPenny nods weakly in response, her head hanging limply against your touch. You pass the few moments before Flahne arrives in that position – holding Penny at just the angle where the scent of herself can fill her nostrils to the exclusion of everything else, but still without letting her fall forwards and take herself as she so desperately wants.");
	output("\n\nEventually, Flahne arrives, all but bursting through the door with her trademark enthusiasm. <i>“You rang?”</i> she calls out happily. Before she can say anything further she’s stopped in her tracks at the unexpected scene in front of her, especially as Penny turns towards her and treats her to a look of such absolute and uncontrolled need.");
	output("\n\n<i>“I... need!”</i> Penny says simply. <i>“I need... I need cum! Please Flahne, I’m so thirsty and horny and I’m just a poor desperate cumslut and I need your help! I need you to coat me with your wonderful sweet cum!”</i>");
	output("\n\nFlahne pauses for just a moment more, looking on with confusion. Slowly a sly grin slides across her face, and she turns towards you. <i>“You put that word in for me, did you?”</i> Turning back to Penny, she adds, <i>“Only if you promise to do the same for me");
	if (flags["PENNY_BEING_A_PUBLIC_CUMSLUT"] != undefined) output(" this time");
	output(", okay?”</i>");

	output("\n\nPenny, her tongue lolling from her mouth, can only nod energetically. Flahne accepts the response, and launches herself eagerly at the fennec girl, knocking her from her chair to the ground. The two of them lock lips passionately, their collective pent-up lust finally finding expression as they make out enthusiastically on the floor. Still, that is only a momentary distraction for the both of them, as within moments Flahne’s ovipositor is exposed and ready, slipping free in mere seconds as Flahne shudders blissfully on top of Penny. Pulling herself back for a moment, Flahne gives Penny a sultry look and says simply, <i>“Shall we?”</i>");
	output("\n\nPenny doesn’t need any further encouragement, and in one swift movement she hauls the gooey girl around, spinning her about the center to give herself access to her already-dripping cock, while Flahne finds herself confronted by Penny’s own eager tool. Pausing only to briefly lick her lips, Penny lunges forward to engulf Flahne’s ovipositor, her eyes rolling back in her head as she finally fills her face with cock. Flahne gives out a cute <i>“ah-ahhh!”</i> in response, her hips pushing forwards absently to press herself further inside Penny, and it’s only once Penny has taken several long inches that Flahne opens her eyes again and remembers the cock in front of her own face. In contrast to Penny, Flahne slides forward slowly; enveloping her straining shaft by degrees, like a connoisseur savoring a fine wine.");
	output("\n\nThe two girls lie locked happily together, content to just thrust slowly and suck needfully on the cock they’re presented with. As fun as that is, after a minute or so you start to get a little bored, deciding that you could really do with a bit more of a show. Accordingly you lean down, positioning yourself right next to Penny’s ear. <i>“Good girl,”</i> you start encouragingly, enjoying the little quiver of pleasure she makes even before you scratch softly at the base of her pointed ears. <i>“But I think it’s time you moved on to the main event, don’t you?”</i>");
	output("\n\nEven through her well-occupied mouth, Penny manages to moan in response. Her whole body shudders, and you can see her eyes rolling back in her head. Seeing how worked up she’s getting, you nod in approval, then lower your voice to a fierce whisper and continue. <i>“You </i>need<i> cum, don’t you? You need to milk her for all that she’s worth, feel her thick cum sliding down your throat and filling you up...”</i>");
	output("\n\nParts of Penny are quietly spasming uncontrollably now, various limbs locking up and releasing as her body becomes overwhelmed by her insensate lust. Her mouth is filled with Flahne’s thick cock, but now even that isn’t enough. You press lightly against the back of her head with one hand");
	// {hand/tentacle} Don’t currently have a way to really indicate of the player has goohands/tentacools, so...
	output(" and whisper one last thing to push her over the edge. <i>“Show Flahne just how much of an eager cum-addicted slut you really are.”</i>");
	output("\n\nPenny’s eyes go wide, snapping open with manic, lust-fuelled intensity. With one great surge she pushes Flahne over, rolling the two of them so that Flahne is left on the bottom while Penny pins her to the floor by her wrists. Her hands are only occupied with that for a moment, however; as soon as the new position is established Penny moves them to begin frantically working over Flahne’s ovipositor, massaging it frenziedly with both hands. She even pulls her head out entirely to enable herself to get a better grip on Flahne’s trembling tool, thick strands of drool and gooey pre-cum keeping the two connected as her lips momentarily break free.");
	output("\n\n<i>“I need your cum!”</i> Penny cries, only managing to work her tongue enough to speak due to the urgency of the message. <i>“Flahne, please, please I- uhhh! I can’t help it, I need, I need, I need your cum so badly, please, I just- I need you to cum in me, on me, over me, ffFUUCK I need it!”</i>");
	output("\n\nFor her part, Flahne is still eagerly sucking on Penny’s own cock, although interrupted momentarily by her abrupt repositioning. Now in response to Penny’s delirious assault she barely manages to do much more than give out a stunned squeak, her whole body seeming to momentarily stiffen in response. Within moments she starts to quiver, her hips thrusting dreamily, and then an urgent moan emerges from her lips, and her amber cock begins spraying wildly, spurting thick doses of her sugary cum.");
	output("\n\nPenny is caught off-guard by the sudden eruption, having still been jerking Flahne off with her hands rather than reapplying her mouth to the task. At the sight of Flahne’s unexpected orgasm Penny gives out an involuntary wail, visibly distressed at the cum going to waste. Immediately the fennec girl throws herself forward, struggling to contain Flahne’s spasming cock in her mouth and milking it for all it is worth. She manages to wrap her lips around it and form a tight enough seal, a look of absolute bliss spreading over her muzzle as she feels the flood of sweet cum flowing through her. At that Penny begins orgasming in turn, but unlike the urgent, shaking orgasm she’s pulling from Flahne, hers is a much more sedate affair. The feeling of being filled with cum is stimulus enough for her to shudder with quiet release, her own mighty shaft opening up with a stready stream of cum into the waiting mouth of her slick partner.");
	output("\n\nYou admire the sight of Penny’s slow surge of white coloring spreading out from Flahne’s face, streaming down her neck to steadily stain her entire body. Flahne is thrashing uncontrollably, still being milked frenziedly by Penny’s eager hands, while the policewoman herself is almost still aside from her frantic hands – almost blissed-out on the sensation of being fed and allowed to indulge her new cumslut nature.");

	if (pc.hasCock())
	{
		output("\n\nYou’re enjoying the performance yourself so much, in fact, that your [pc.cock " + x + "] soon makes its approval known, growing erect even without being touched. With a grunt you free yourself from your clothes, making sure to catch Penny’s eye");
		if (!pc.isTaur())
		{
			output(" as you reach for your cock");
			if (pc.cockTotal() > 1) output("s");
			output(" and start masturbating");
		}
		output(". She releases Flahne from her grip in order to reach out towards you with one hand, although still keeping her mouth firmly locked over the other girl’s still-spasming cock. It takes little more than the touch of her clawed fingers to set you off given the scene before you, and soon");
		if (!pc.isTaur()) output(" your own hands clench against your flesh and");
		output(" you orgasm yourself, spraying the two girls with ropes of [pc.cum]. Penny happily moves her head from side to side to ensure a better coating against her fur, while the amount that reaches Flahne is eagerly absorbed by her hungry body, leaving [pc.cumColor] dapples against her increasingly multi-colored skin.");
		if (!pc.isTaur() && pc.hasVagina()) output(" As one final touch, you reach down towards your thus-far neglected slit, quivering as you provoke one last shudder of orgasm, cupping your hand to trap the resulting slickness. Reaching down you paint a wet line all the way along Penny’s muzzle, forcing her to break contact with Flahne for just a moment in order to lick you, demonstrating her subservience to you above all others.");
	}
	else if (!pc.isTaur() && pc.hasVagina()) // I GUESS Type could be used to differentiate between a front-vag on a taur, and a hind-vag or something? I dunno, seems weird as fuck.
	{
		output("\n\nYou’re enjoying the performance yourself so much, in fact, that you can’t help but adding to the fun yourself, your hand sliding within your");
		if (pc.vaginaTotal() > 1) output(" nearest");
		output(" slit and beginning to work yourself over. You move yourself to straddle the two girls as much as possible, enjoying the sight of them beneath you as first one then the other catches your eye, looking up to see you staring down imperiously at them while you enthusiastically masturbate. With all that lead up it’s not long before you start to orgasm, your whole body shuddering as your slick wetness begins to rain freely down on top of them while they writhe blissfully beneath your attentions. As one final touch, you cup your hand for a moment to trap the last of your femcum, enjoying the feeling of it in the palm of your hand. Reaching down you paint a wet line all the way along Penny’s muzzle, forcing her to break contact with Flahne for just a moment in order to lick your hand clean, demonstrating her subservience to you above all others.");
	}

	output("\n\nFinally the performance seems to be finishing, with");
	if (pc.hasCock() || (!pc.isTaur() && pc.hasVagina())) output(" both the girls and yourself");
	else output(" both of the girls starting to wind down");
	output(". Penny’s movements begin to slacken, her hands now just giving long firm pulls along Flahne’s abused ovipositor in order to wring out the very last of her sweet cum. When even that well runs dry Penny languorously switches position again, bringing her face to Flahne’s and finally stopping the other girl from sucking weakly on her cock. Wrapping Flahne’s now completely white head in her hands, Penny launches into a fierce kiss, eagerly probing the near-delirious girl with her tongue in an attempt to locate and lick clean as much of her own cum from her mouth as possible. Given Flahne’s alien biology there’s hardly any to find, the vast majority having already been completely absorbed, but mere facts like that don’t prevent Penny from trying.");
	output("\n\nWhen Penny is finally satisfied she’s gotten as much of her spunk from Flahne she’s going to be able to get she pulls herself away and returns to her chair, leaving the still-dazed Loo’Rahn to gurgle quietly on the floor. Her old dominant nature resurfaces slightly as she looks down at the completely spent girl with pride, even going so far as to rest her feet against Flahne’s now even-larger breasts. <i>“Wow, girl,”</i> she says with audible satisfaction, <i>“we are going to have to do that more often.”</i>");
	output("\n\nShe laughs and blows you a kiss, while beneath her Flahne struggles to collect herself. They’re both completely spent, and as fun as the process was you don’t especially fancy hanging around while they recover and clean up, so you make your excuses and head outside. Penny’s right though, you’ll have to make sure you do that again some time. Perhaps you can even get Flahne to convincingly act surprised when Penny calls her up again...");

	//[IF PLAYER HAD PENIS OR NON-TAUR VAGINA OR BOTH, REDUCE LUST TO 0]
	processTime(10+rand(10));
	if (pc.hasCock()) pc.orgasm();
	if (pc.hasVagina() && !pc.isTaur()) pc.orgasm();
	clearMenu();
	if(pennyIsCrew()) addButton(0,"Next",mainGameMenu);
	else addButton(0,"Next",moveOutsidePennysOffice);
}

//Penny’s Little Pony
//<PennyNoCock>
public function givePennyAHossCawk():void
{
	clearOutput();
	showPenny(true);
	author("Alkahest");
	if(!penny.hasCock())
	{
		output("Penny giggles as she waggles the toy in her hand, the huge balls attached to it swinging back and forth heavily. <i>“What is this even? You know I don’t have a cock, right, [pc.name]?”</i> she chuckles before stripping before you, her big breasts swaying enticingly before you. <i>“That’s okay though! We can still have some fun, regardless,”</i> she says seductively, her eyes half-lidded and focused on you. She looks down at the toy in her hand and absently presses it to her crotch. Giggling, Penny wiggles her ample hips back and forth, the sheath smushed into her groin. Penny laughs as the toy’s huge balls slap into her thighs.");
		output("\n\n<i>“Well, [pc.name]? What do you think? I think I’d look amazing with an enormous horse-cock, don’t you?”</i> She moans as she thrusts her chest out and briefly takes her hands off the sheath to rub her fat tits. Looking down in mild surprise, Penny smirks at the sight of the toy connected to her crotch. <i>“Ohh, that’s neat; it’s like got some sort of suction thing on it!”</i> Penny waggles her butt harder, swinging the sheath and nuts around. <i>“Look, [pc.name], look at this lewd creature I’m turning into! I’ve transformed into this horse-cocked, busty prick-vixen just for you! Won’t you come over here and suck on my big, fat cock?”</i> she giggles before stepping towards you, her heaving tits swaying in time with the big fat nuts dangling from her crotch.");
		output("\n\nBefore she reaches you, however, a confused look passes across your lover’s face. She looks down at the sheath attached to her crotch before tentatively reaching a hand down and gently tugging on it. Confusion is quickly replaced by concern as she tugs a little harder, wincing in pain. She turns to you a worried expression on her face. <i>“[pc.name], I can’t get it off, and... and... ”</i> she hesitates. <i>“I think I can feel it!”</i> she tells you, her eyes wide as she gropes the pliant flesh.");
		output("\n\nPenny reaches down and hefts the balls dangling from the sheath and gives them a sharp squeeze, it’s apparent from the grimace on her face that she can obviously feel them. You see her breath start to quicken and her nipples begin to puff up as Penny’s arousal mounts. <i>“Oh god, [pc.name], this is so hot! I really am turning into a big-titted, horse-cocked fox-girl! I can’t even...”</i> she trails off as her lust takes over her mind. She sinks to the floor onto her ample rear, her hands dancing over the fat sheath in her hands. You and Penny both stare in awe as you see massive veins raise up on the outside of Penny’s new endowment, her blood pumping into her new equipment and the thick, dripping, flared head of Penny’s enormous horse-dong snaking from the end of her sheath. Her breath catches as she stares enraptured as inch after inch of mottled flesh rises from her crotch.");
		output("\n\nAfter a minute, the growth ends and the huge throbbing horse-cock jutting from Penny’s groin lifts and points accusingly at you. You and Penny stare in amazement; it is absolutely enormous, 16 inches long at least, and Penny can barely fit both of her hands around the fat shaft. Her nuts twitch and pulse as they fill with her seed. She looks up at you before thrusting her new cock towards you.");
	}
	//<PennyRegularCock>
	else if(penny.cocks[0].cLengthRaw <= 6)
	{
		output("Penny looks quizzically at you as she hefts the rubbery tube in her hands, the false balls swaying heavily in their leathery sack. You see a small bulge forming in her sheath as the pink pointed tip of her six-inch fox-cock peeks its way into view. A wry grin passes across her face as she gives the sheath a squeeze. <i>“Ohh, that’s kind of kinky. I didn’t think you were into horses, [pc.name], but I can’t really say anything, you know?”</i> Penny says as she gestures at her big fluffy ears, wobbling fur-covered breasts, and pulsing canine cock. <i>“B-before I got this dick, I sort of always secretly wanted to have a giant horse-cock, you know? Something that powerful rising majestically from my groin as my big fat balls swing beneath it. Ohh, but this is nice too!”</i> Penny says with a blush and a lascivious smile as she languidly strokes her cock.");
		output("\n\nYou grin as you sidle up next to your busty foxy lover, giving one of her inverted nipples a gentle suck as the fleshy nub of her nipple peeks out of its hidey-hole to say hello. You smile amusedly to yourself before you gently lower the business end of the sheath onto Penny’s waiting cock. Her eyes roll back as the rough ring of the toy’s opening catches the sensitive tip of her cock. You see one of her hands reach up to grasp one of her wobbling breasts, squeezing and kneading the pliant flesh. Her other hand reaches down to tease her sensitive folds, a veritable flood of sweet girlcum dripping from her nethers. You begin to pick up your pace with the toy, sliding it slickly up and down up and down.");
		output("\n\nPenny releases the grip on her boob, the weighty flesh bouncing and wobbling as Penny begins to laugh. Her other hand abandons her sopping cunt to rub her belly, aching from her laughter.");
		output("\n\n<i>“Heehee! Oh that tickles, [pc.name]!”</i> Penny giggles mirthfully as you pump the sheath up and down her average length, the weighty balls slapping into her sopping cunt with every thrust, eliciting a moan and a giggle each time. <i>“W-whatever, ohhhh, whatever this thing is, it does, ooooh, oh it’s job well, [pc.name]!”</i>");
		output("\n\nYou grin wryly as you continue your ministrations. You think bemusedly that your fennec lover must really be getting off on this as the sheath starts to stick more and more to her shaft as she gets wetter and wetter.");
		output("\n\n<i>“O-Ohh, I think I’m coming, my mate! Ohhhh gooooddd!”</i> Penny’s hips buck as she sinks her entire length into the rubbery tube, the fleshy material laying flush with the busty fox’s groin. A jet of sticky cum rockets out the end of the sheath and hits you in the forehead. You blink in surprise, wiping the goo out of your face before looking at the panting fennec foxgirl laying in front of you, her huge breasts heaving with each tired breath she takes.");
	}
	//<PennyMiddleBigCock>
	else if(penny.cocks[0].cLengthRaw <= 12)
	{
		output("Penny coos as she surveys the fleshy sheath held in her hands. She grins at you wryly before waggling the fleshy tube in your face. <i>“So you’re into this sort of thing huh, [pc.name]?”</i> Penny chuckles as she gives the swaying balls of the toy a gentle lick. <i>“It’s not enough for you that I’m hung like a horse, you want me to be hung like a horse!”</i> Penny giggles mirthfully at her joke before turning a lascivious grin towards you. <i>“Well, I’ll play along. I’m pretty horny right now, and my dick is aching for some attention, [pc.name]!”</i> You gulp as you see Penny’s foot-long, canine cock slip from her sheath to point accusingly at your face.");
		output("\n\nYou chuckle while kneeling down to take the sheath into your hands, placing the tip of Penny’s dripping cock into the opening of the toy and gently pulling down. Penny moans at the gentle pressure of the rubbery tube as it slides down her cock nearly effortlessly; it’s as though this toy was made specifically for Penny’s penis. Penny runs a hand");
		if (pc.hairLength > 0) output(" through your hair");
		else output(" along your head");
		output(" as you begin pumping the toy up and down her length. Licking her lips and hefting one of her wobbling boobs, she squeezes and pinches one of her puffy, inverted nipples.");
		output("\n\n<i>“Oh, mate, that feels really good”</i> Penny whines as the slick sex-toy marches its way down her length, edging closer to her crotch, her body writhing under your ministrations.");
		//<PennyNoBawls>
		if(penny.balls == 0)
		{
			output("\n\nPenny groans as the toy’s heavy balls smack against her dripping snatch, a wet slapping noise echoing through the room. She reaches down to heft the weighty orbs, rolling them around in her palms and squeezing them together, letting them drop and slap into her sopping cunt.");
		}
		//<PennyNormalBawls>
		else output("\n\nYou spy an opening in the back of the ball sack of the toy you’re sliding up and down Penny’s pole, then take each of Penny’s testicles and squeeze them into the small opening. She moans as her balls drop into the pendulous sac. Reaching down and hefting her encased nuts, she rolls them around in her palm, bouncing them up and down as you continue pulling the sheath back and forth across the length of her cock.");
		output("\n\nPenny hefts one of her big breasts, her inverted nipples poking out from their puffy prison. She moans dreamily as her lips latch onto one of her thick nubs and suckles the supple flesh while you continue stroking Penny’s huge cock with the rubbery sex-toy. Penny groans when the sex toy reaches her groin, the fleshy balls slapping heavily into her soaking cunt. Her eyes roll back in her head, and her tongue lolls out of her mouth as cum rockets out the end of the sheath, painting you liberally with her seed. You chuckle and wipe the pearlescent goo from your face. Penny lays back in her chair, her big breasts heaving from her lusty panting.");
		output("\n\n<i>“Oh, mate, that was awesome.... We should go again...”</i> Penny says with a contented smile on her face. You nod emphatically and attempt to pull the toy off of Penny’s cock only to hear a loud yelp and have your hand roughly slapped away. She looks at you with mild alarm before one of her hands snakes down to grope at her crotch.");
	}
	//<PennyGigantoDong™>
	else
	{
		output("Penny growls huskily as she squeezes the rubbery tube you place in her hands. You see her sheath massively distend as her red canine cock oozes out and begins its inexorable march upwards to her heaving breasts. <i>“Ooooh, what’s this, [pc.name]? A new toy for little ole’ me?”</i> Penny titters bemusedly. <i>“But I think it’s a little small for me; don’t you think, my mate?”</i> she says with a grin as she grips her turgid shaft and wobbles it in front of your face. The 18 inches of her throbbing pole waft her enticing scent to your nostrils.");
		output("\n\n<i>“Oh don’t worry about that; it stretches,”</i> you assure the panting fennec in front of you as you guide the end of the fleshy tube down Penny’s massive length. Penny starts thrashing as her crown is engulfed by the dusky sextoy. <i>“Ohhhhh god, [pc.name], it’s too tight! My big, fat, cock is sooooo big. It’s never going to fit in this little thing!”</i> she coos seductively as you play with her towering meat.");
		output("\n\nYou look on in amazement as the diminutive toy consumes inch after inch of pulsing meat, the pressure of the rubbery sheath compresses her cock far more than you thought it would. Her erection must be subsiding as you pull the toy down further, a thought you find inherently strange given how hard the rest of her cock is throbbing under your hands.");
		if(penny.balls == 0)
		{
			output("\n\nPenny groans as the toy’s heavy balls smack against her dripping snatch, a wet slapping noise echoing through the room. She reaches down to heft the weighty orbs, rolling them around in her palms and squeezing them together, letting them drop and slap into her sopping cunt.");
		}
		//<PennyNormalBawls>
		else if(penny.ballDiameter() < 3) output("\n\nYou spy an opening in the back of the ball sack of the toy you’re sliding up and down Penny’s pole, then take each of Penny’s testicles and squeeze them into the small opening. She moans as her balls drop into the pendulous sac. Reaching down and hefting her encased nuts, she rolls them around in her palm, bouncing them up and down as you continue pulling the sheath back and forth across the length of her cock.");
		//<PennyGoddamnDemBawls>
		else output("\n\nYou look at Penny’s big heavy balls dangling underneath her shaft and at the rubbery sack dangling from the sheath over top of them. Licking your lips, you reach down and heft Penny’s pendulous orbs, gently massaging and rolling the supple flesh in your hand. Reaching for the opening of the sex-toy’s fake ballsack, you tug at the rubbery skin and are surprised to find it far more elastic than you would have guessed. You tug and pull, then tug some more, and finally, Penny’s nuts plop into the rubbery skin of the sheath to hang heavily from her groin.");
		output("\n\nAs you reach the bottom, Penny shudders in orgasm; a gout of cum blasts out of the seam around her crotch, painting her amber fur a shimmering glistering white. Penny slumps over in her chair the rubbery sheath lays flush with her groin; the huge, heavy balls sway back and forth with every slight shift she makes. <i>“Oh what was that, mate? I feel so weird down there, you know?”</i>");
	}
	
	processTime(5);
	pc.changeLust(7);
	penny.orgasm();
	clearMenu();
	
	addButton(0,"Next",pennyGrowsAHorseCockPart2);
}

public function pennyGrowsAHorseCockPart2():void
{
	clearOutput();
	showPenny(true);
	author("Alkahest");
	if(!penny.hasCock())
	{
		output("<i>“Well? You did this to me; you need to take responsibility!”</i> Penny says with a lusty grin on her face. You gulp before reaching down and grasping the enormous cock towering from your previously female lover. Her eyes roll back in her head as the alien sensation of having her cock stroked for the first time washes over her. Her hands reach up to squeeze and knead her huge tits as you stroke your hand up and down her length. Her oozing cunt drools her nectar into an ever-growing puddle under her fat balls.");
		output("\n\nThe musky scent emanating from Penny’s horse-cock makes your head feel dizzy as heat suffuses your body; before you realize what you’re doing your lips are opening wide, and you’re leaning in to take the flared tip of her cock into your mouth. The salty flavor of fresh horse-cock nearly makes you cum yourself as you look up past Penny’s huge tits into her lust-addled eyes.");
		output("\n\n<i>“Ohhh god... I didn’t... know it... Unghhh! It would feel soooo goooooood!”</i> She drools as you feel her balls tense up, and Penny fires the first of many loads to come from her virgin cock. Load after load of her creamy seed washes into your mouth. You gulp it down with abandon; the flavor is salty and sweet and uniquely Penny. She coos as she runs a hand ");
		if(pc.hasHair()) output("lovingly through your hair");
		else output("lovingly atop your head");
		output(" as you minister to her throbbing cock. You finally pull away as her orgasm abates, and her cock softens and slithers back into her sheath to hang innocuously from her crotch.");
		output("\n\nPenny groans and stands back up, the feeling of her new equipment slapping wetly into her thighs causing her to moan in pleasure. She pulls you up and into her arms, hugging you tightly into her breasts.");
		output("\n\n<i>“Thank you soooo much, [pc.name] this was the most amazing thing ever!”</i> she exclaims as she grinds her genitals into your thigh. <i>“We’ll have to take this thing for a real test drive next time!”</i> she tells you, her face full of genuine enthusiasm as she eyes your butt. Penny sighs as she pulls her pants back on, the crotch bulging obscenely around her new equipment. <i>“This’ll take some getting used to though,”</i> she says with a wry smile before finishing dressing and getting back to work. You’re definitely looking forward to next time.");
		penny.createCock();
		penny.shiftCock(0,GLOBAL.TYPE_EQUINE);
		penny.cocks[0].cLengthRaw = 16;
		penny.balls = 2;
		if(penny.ballSizeRaw < 11) penny.ballSizeRaw = 11;
		pc.loadInMouth(penny);
		pc.loadInMouth(penny);
	}
	//Six inch penny
	else if(penny.cocks[0].cLengthRaw <= 6)
	{
		output("<i>“Oh, [pc.name], that was awesome!”</i> Penny giggles before reaching down and tugging on the sheath to remove it from her cock. A bemused expression flits across her face as she tugs again, a bit more sharply, and hisses in pain. Penny shifts in her seat so as to get a better look at her groin and as she moves her legs, the big heavy balls attached to the sheath become squished roughly between her thighs. A howl of pain escapes her throat as she reaches down and grasps them. <i>“I... I can feel them, [pc.name]! W-what’s happening to me!?”</i>");
		output("\n\nYou bend down and take a look at the toy attached to Penny’s genitals. Penny hisses a painful breath as you give her nuts a light slap, setting them to swaying back and forth. She looks at you angrily as you smile awkwardly back at her. You lean in to look at the seam around the base of the sheath. Rather, you would if you could find it; the rubbery material seems to have fused with Penny’s groin. You can see veins running from her furry flesh into the dark dusky skin of her new equine sheath and balls. You look into the murky darkness at the opening of her tube, a sweet musky scent wafts from deep within. You unconsciously lick your lips before pulling away and telling Penny the bad news.");
		output("\n\n<i>“Attached to me?! Oh gods, what is it going to do to me!? I can’t even...”</i> The breath catches in her chest as Penny looks strangely down at the sheath attached to her crotch. Her huge nuts pulse and throb, and you see big thick veins rising on the outside of her fleshy tube. Penny gasps while you watch the blood rushing into her groin. Gasping in awe, you both stare at the flared tip of a fat horse-cock when it snakes its way out of the end of her sheath. It dribbles thick drops of glittering pre-cum which drip down into a small puddle on the floor. With each pulse of her racing heart, more and more mottled flesh slides from the dusky sheath. Finally the growth subsides as the towering horse-cock reaches a massive 12 inches from Penny’s crotch.");
		output("\n\nPenny’s eyes betray her utter shock as you both stare at the enormous pole reaching from her groin. It gently pulses with her heartbeat and the flat head lies neatly inside her wobbling tits. <i>“W-well, I did say I always wanted one of these...”</i> Penny supplies in her stupor. <i>“I... I think I need to go think about this, in the bathroom, alone, for a few hours. You can see yourself out, right my mate?”</i> She says as she looks at you like a deer caught in headlights. Penny stumbles a bit as her massive balls alter the way she has to walk so as to not injure herself. Her gigantic horse dong wobbles in front of her, her hands incredulously running up and down its length. You see her pause before getting to the door; a shudder runs through her body as her voice catches in her throat. Penny’s weighty nuts tense up as she fires a huge load of creamy equine cum onto the floor in front of her. Her knees give out and she plops to the floor, her huge balls slapping heavily into the puddle of cum eliciting a pained moan from the busty fox.");
		output("\n\n<i>“I..I think I’ll have to get used to this, [pc.name].”</i> she says with a smile before picking herself up and walking into the bathroom. You decide to leave her be for now; you can always come back and play with your new toy whenever you want.");
		penny.shiftCock(0,GLOBAL.TYPE_EQUINE);
		penny.cocks[0].cLengthRaw = 12;
		penny.balls = 2;
		if(penny.ballSizeRaw < 11) penny.ballSizeRaw = 11;
		penny.orgasm();
		penny.orgasm();
	}
	//12 inch pennmy
	else if(penny.cocks[0].cLengthRaw <= 12)
	{
		output("<i>“I... I can feel that. It’s... it’s mine,”</i> she says incredulously. Penny begins to pant again as her hands dance over her transformed genitals.");
		output("\n\n<i>“I want... I want to see it...”</i> Penny gasps, her hand flying up and down her sheath. Her eyes roll back in her head as powerful veins throb along her tube, pumping blood into her engorging genitals. Her tongue lolls out of her mouth as the thick, flared head of Penny’s new horse-cock snakes from the end of her sheath. Inch after inch of mottled flesh pours from the end of Penny’s tube until finally Penny’s foot-long, throbbing horse-cock wobbles in front of your face, her huge balls swinging heavily underneath.");
		output("\n\nPenny looks in awe at the impressive pulsating organ throbbing gently in the open air. She licks her lips several times before abandoning all pretenses and stroking her new cock with abandon, dipping down to lap at her thick crown and its bubbling font of sweet pre-cum. Penny hefts and mauls one of her wobbling breasts, roughly squeezing the soft flesh. Pinching down on her nipple with her thumb and forefinger, the prickvixen rolls the stiff nub back and forth, eagerly slurping at the shaft with her hungry tongue-strokes.");
		output("\n\nYou watch as Penny attacks her huge cock with abandon until you see her heavy balls tense up and fire rope after rope of thick, hot, sticky cum into her waiting mouth, which greedily slurps down her salty treat. Penny howls out in her release, her lewd form writhing before you. Her big breasts heave and jiggle with her moaning. The enormous horsecock jutting from Penny’s crotch pulses and fires a thick river of cum, her fat, cum-filled balls swaying heavily with each shot. Her thick, jiggly ass wobbles as she twitches in the throes of her passion.");
		output("\n\nShe finally slumps into her chair, her body a sticky cummy mess. Her breasts sway and wobble around her shaft which lies spent between them, oozing the last of her cum into the valley of her cleavage. Slowly you watch the mottled flesh of her cock snake down into her sheath to lay innocuously against her thigh.");
		output("\n\nPenny looks at you through a spent, cum-covered haze, a contented smile crosses her face.");
		output("\n\n<i>“Oh, my mate.... This is incredible. I’m going to have so much fun with my new and improved toy,”</i> she says dreamily. Penny then stands up and stretches, thrusting her heaving chest and enhanced genitals forward. Swishing her fluffy tail back and forth, she makes her way to the bathroom before turning and winking lasciviously at you.");
		output("\n\n<i>“Next time you can have a taste, my mate!”</i> she exclaims wryly. You lick your lips at the thought before shaking your head and leaving Penny to tend to her body.");
		penny.shiftCock(0,GLOBAL.TYPE_EQUINE);
		penny.cocks[0].cLengthRaw = 16;
		penny.balls = 2;
		if(penny.ballSizeRaw < 11) penny.ballSizeRaw = 11;
		penny.loadInMouth(penny);
		penny.loadInMouth(penny);
	}
	else
	{
		output("You look at the sex toy tacked to Penny’s crotch. The sheer length of the sheath amazes you. It’s about eight to ten inches long laying atop her massive balls. Thick veins gently pulse with Penny’s heartbeat. It’s amazing craftsmanship you tell yourself; if you didn’t know any better you would say it was real. You catch yourself wishing it -was- real. The thought of a massive horse cock sliding out of the end of the dark fleshy tube arouses you more than you thought it would.\n\nLicking your lips, you turn your thoughts towards your fulsome hermaphroditic lover panting in front of you and the huge sheath on her groin. The more you look at it, however, the more real it looks. The sheath and sack are becoming slick and shiny as Penny’s excretions ooze out of the gaping opening and down onto the balls. The veins on her equipment become more and more pronounced as they throb more strongly with Penny’s blood.");
		output("\n\n<i>“T-that was different, but it felt amazing, [pc.name]. Let’s go again...”</i> she murmurs dreamily. You nod in agreement and reach down to pull up on the sex toy, only to garner a loud yelp and a slap from the busty prick-vixen as a look of mute horror passes across her face. <i>“T... that hurt,”</i> she supplies tentatively. You lean in and inspect her crotch. Upon closer scrutiny, you see the seam has vanished! The toy has now somehow grafted itself onto Penny’s crotch.\n\nYou look up past Penny’s quaking tits into her confused eyes. You’re not sure how to say it, but you break the news that Penny is now part pony. She looks at you quizzically, still flushed from her previous orgasm. <i>“R-really, [pc.name]? W-well, I always... did love horsies,”</i> Penny mutters as she idly toys with the dripping opening of her sheath until a look crosses her face that isn’t unlike confusion. You wonder what it is until you see her new endowment jump in her hand, massive veins pumping blood into Penny’s newly enhanced endowment.");
		output("\n\nPenny grits her teeth and looks down with you in amazement as a massive, flared head slides out of the sheath, its pink mottled flesh dripping precum as inch after inch of throbbing horsecock oozes out of the sheath. Penny’s heavy, swollen balls visibly churn, pulsing with each ball-swelling beat of her heart as her equine dong reaches its full, magnificent 20-inch length. The breath catches in her throat as Penny gazes at her powerful cock, its length gently throbbing and pulsing in front of her face. She looks nervously back and forth before abandoning all pretense to the contrary and shoving as much of her horsecock as she can down her throat, her hands reaching down and roughly squeezing her balls. <i>“Dssh essh arshom m’ mat!!”</i> she gargles over a throat full of dong. You watch in amazement as she bobs up and down her length, nearly reaching her medial ring in the throes of her lust induced fervor.");
		output("\n\nFinally, you see her balls seize up and her cock distend as a massive gout of cum rockets its way up her length and into her mouth. Penny gulps down load after load of salty horse-spunk, small streams escaping the side of her mouth from the sheer force of her ejaculation. It becomes too much for her to keep down, and she releases her cock from her gullet, still firing creamy seed for several more shots, painting her golden fur a silky white. Spent, Penny’s impressive organ softens to lay against her leg before retreating into her sheath. Penny pats her crotch before looking into your eyes with a lascivious grin. <i>“Next time, you can take her for a ride, [pc.name]!”</i>");
		penny.shiftCock(0,GLOBAL.TYPE_EQUINE);
		penny.cocks[0].cLengthRaw = 20;
		penny.balls = 2;
		if(penny.ballSizeRaw < 11) penny.ballSizeRaw = 11;
		penny.loadInMouth(penny);
		penny.loadInMouth(penny);
	}
	if(!CodexManager.entryUnlocked("SynthSheath"))
	{
		output("\n\nYour Codex beeps with a warning about how this device may irreversibly alter one’s biology. You grimace ruefully at the device before regarding Penny’s enhanced genitalia.");
		//unlock codex!
		CodexManager.unlockEntry("SynthSheath");
	}
	pc.destroyItemByClass(HorseCock);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function whineToPennyCauseYerABitch():void
{
	clearOutput();
	author("Savin");
	showPenny();
	if(!pennyRecruited())
	{
		output("Rather than talking about you and Penny, as you’re accustomed to, you tell the vulpine Peacekeeper that you’ve got a crime to report - something you weren’t able to deal with on your own. Penny perks up at that, her playful demeanour giving way to seriousness. She taps something on her desk’s computer, bringing up some kind of form.");
		output("\n\n<i>“Okay, ");
		if(flags["SEXED_PENNY"] != undefined) output("my mate");
		else output("[pc.name]");
		output(", tell me what happened.”</i>");

		output("\n\nYou sit down across from Penny and start to tell her what happened on that shop on Tarkus: you wandered in, and had a weapon pointed right at you. ");
		if(flags["DR_BADGER_BIMBOED_PC"] == undefined) output("You had no choice but to beg for your life");
		else 
		{
			output("You ended up getting hit by some kind of ray that transformed you into a hermaphroditic badger");
			if(pc.raceShort() == "badger") output(", as Penny can see now");
		}
		output(". The way the doctor talked, you doubt you were her first victim... and you won’t be her last. She’s a threat to everyone around her, especially hapless spacers like you.");

		//BadgerTFed:
		if(flags["DR_BADGER_BIMBOED_PC"] != undefined && penny.hasCock())
		{
			author("Savin & Fenoxo");
			//Throbb penny (non cumslut)
			if(!pennyIsCumSlut())
			{
				//Big penny
				if(penny.longestCockLength() >= 10)
				{
					output("\n\nPenny’s endlessly libidinous shaft squelches noisily against the underside of the table. She blushes so crimson that her tawny fur looks practically orange against it and reaches down, ostensibly to adjust herself. Instead, her arm pumps up and down a few times, and her tongue lolls from her mouth. She pants, <i>“Ah-ah... ah... ermm... uh-huh.”</i> Her arm is still moving. <i>“Damn, that’s hot.”</i>");
				}
				//Smaller Penny
				else
				{
					output("\n\nThe more you talk, the more excited Penny looks. Her eyes are wide and almost fully dilated. Her tongue keeps slipping out of her mouth, and most telling of all, one of her hands has disappeared underneath her desk. She groans openly at a particularly sordid detail of your transformation, failing to hide the sound of her fist pumping up and down along her squelching length.");
				}
				//Big/small merge:
				output("\n\n<i>“Come on, Penny! This is serious!”</i> you chide through your embiggened lips. Maybe you can help her take care of that after the report.");
				output("\n\n<i>“Fine,”</i> the shameless prick-vixen says with a sigh, pulling her hand out from under her desk to lick clean. Her entire palm is glistening with pre-cum, you note. The flavor appears quite enjoyable.");
			}
			//Throbb Penny (Cumslut)
			else
			{
				output("\n\nThe more you talk, the harder Penny’s cock becomes, rising in fits and starts, eventually lurching so powerfully that it slaps in between the cop-herm’s mammaries hard enough to make them bounce. The over-sexed cumslut has no hope of resisting such a delicious-looking spunk-spout and leans down to lick mid story, shamelessly tonguing dollops of pre from her distended slit to every sordid detail.");
				output("\n\n<i>“Come on, Penny! This is serious!”</i> you chide through your embiggened lips. Maybe you can help her take care of that after the report.");
				output("\n\nPenny retorts from around a mouthful of cock. <i>“No, I got thismph!”</i> One hand wraps around the shaft to steady it while she rams it further down her throat, the other haphazardly trying to type at a keyboard, attempting to enter every lurid detail simultaneously. It doesn’t go very well for her, but you’re forced to put up with it.");
				output("\n\nAfter all, you helped turn her into this oversexed parody of a police officer. Smiling to yourself, you can’t help but imagine how good it must taste for her, how savory the bullet-sized dollops of pre-cum she’s pouring into her mouth must taste. When did you start sucking on your finger? Shrugging, you leave it there; it ought to keep you from drooling while you watch the dick-addicted sperm-drinker cave in to her addictions. She looks so hard... maybe...");
				output("\n\nYou barely register crawling over the desk and nuzzling into her balls, but what else can you do? They looked so lonely and so... full. Your finger just can’t compare to the taste of those virile orbs, to feeling them pulse and quiver against your cheek, to the way it feels to let your bimbofied body just do what it wants.");
				output("\n\nPenny’s sweat is heaven on your tongue, her fuzzy nuts almost ambrosial in flavor. It’s a shame when they start to lurch and spasm, pumping their all-too-virile payload through Penny’s overblown shaft and straight into her greedy, sucking maw. She gulps so noisily, but spatters of the creamy white goo trickle from the corners of her mouth. You lick your way up the quivering rod to the dribbles of salty treat, licking every single drop you can get it.");
				output("\n\nPenny eventually pops off, though not until she’s cum her last drop. Still, there’s a milky-white sheen on her still-rigid length, and you want more. Thinking nothing of it, you pour yourself over it, your [pc.tongue] doing its damnedest to gather every delectable drop. Penny moans and shudders, dredging up a weak spurt of white stuff to reward you. It lands on the back of your tongue, hot and delicious. You swallow it without thinking twice, leaning back and primly dabbing at your lips.");
				output("\n\n<i>“Do you think you can like, focus now?”</i>");
				output("\n\nPenny kisses her dick, literally frenching her still-distended cum-slit, then favors you with a wink. <i>“You betcha! Thanks for the help, by the way. It’s tough to keep a good cock down. Now tell me again while I’ve got enough cum in my belly to let me think straight.”</i>");
				pc.changeLust(25);
				processTime(10);
			}
		}
		//Merge
		output("\n\nAs you recount your misadventure, Penny’s ");
		if(penny.hasCock() && !pennyIsCumSlut()) output("still-moist ");
		output("fingers fly across her keyboard, filling out the police report for you. She grunts and shakes her head from time to time, especially when you mention the badgerfication ray, and she asks you a few questions about the doctor’s weapons and the way she grabbed you. When you’ve answered her questions to her satisfaction, Penny hits a submit button on her screen and puts a reassuring hand on yours.");
		output("\n\n<i>“Alright, I’ve forwarded your report to the Tarkus Peacekeeper. They’ll make sure this ‘doctor’ is taken care of,”</i> ");
		if(flags["SEXED_PENNY"] != undefined) output("your lover growls. If you didn’t know better, you’d say it might have been protectively");
		else output("Penny says with surety");
		output(". You nod appreciatively, and tell her you’ll feel a lot better about Tarkus with her gone.");

		output("\n\n<i>“No problem, ");
		if(flags["SEXED_PENNY"] == undefined) output("[pc.name]");
		else output("my mate");
		output(", though I gotta admit, I would’ve killed for one of those rays a few years ago.”</i> Penny muses. <i>“Is there anything else you’d like to take care of while you’re here?");
		if(flags["SEXED_PENNY"] != undefined)
		{
			if(pennyIsCumSlut()) output(" Maybe help a horny vixen blow off some steam?");
			else output(" Maybe I can make you feel safer in my arms...");
		}
		output("”</i>");
		flags["DR_BADGER_TURNED_IN"] = 1;
		processTime(15);
		this.clearMenu();
		if(flags["SEXED_PENNY"] == undefined) 
		{
			this.addButton(0,"Next",approachFriendPenny, false);
		}
		else
		{
			this.addButton(0,"Talk",talkToGirfriendPenny);
			if(pc.lust() >= 33) this.addButton(1,"Sex",pennySexMenu);
			else this.addDisabledButton(1,"Sex","Sex","This choice requires lust at or above 33.");
		}
		this.addButton(14,"Back",mainGameMenu);
	}
	else
	{
		output("You tell the new Peacekeeper that you’ve got a crime to report - something you weren’t able to deal with on your own. She perks up at that, truly paying attention to you for the first time. She taps something on her desk’s computer, bringing up some kind of form.");
		output("\n\n<i>“Okay, tell me what happened.”</i>");
		output("\n\nYou sit down across from the peacekeeper and start to tell her what happened on that shop on Tarkus: you wandered in, and had a weapon pointed right at you. ");
		if(flags["DR_BADGER_BIMBOED_PC"] == undefined) output("You had no choice but to beg for your life");
		else 
		{
			output("You ended up getting hit by some kind of ray that transformed you into a hermaphroditic badger");
			if(pc.raceShort() == "badger") output(", as she can see now");
		}
		output(". The way the doctor talked, you doubt you were her first victim... and you won’t be her last. She’s a threat to everyone around her, especially hapless spacers like you.");
		output("\n\nAs you recount your misadventure, the officer’s fingers fly across her keyboard, filling out the police report for you. She grunts and shakes her head from time to time, especially when you mention the badgerfication ray, and she asks you a few questions about the doctor’s weapons and the way she grabbed you. When you’ve answered her questions to her satisfaction, she hits a submit button on her screen and puts a reassuring hand on yours.");
		output("\n\n<i>“Alright, I’ve forwarded your report to the Tarkus Peacekeeper. They’ll make sure this ‘doctor’ is taken care of,”</i> the new peacekeeper says with surety");
		output(". You nod appreciatively, and tell her you’ll feel a lot better about Tarkus with her gone.");

		output("\n\n<i>“No problem, ");
		output("[pc.name]");
		output(". Is there anything else you’d like to take care of while you’re here?");
		output("”</i>");
		//1 = turned into Penny. 2 = turned in to her replacement.
		flags["DR_BADGER_TURNED_IN"] = 2;
		processTime(15);
		this.clearMenu();
		this.addButton(0,"No",mainGameMenu);
	}
}

public function needPennyPanties():Boolean
{
	if(pc.hasKeyItem("Panties - Penny's - Plain, blue, and crotchless.")) return false;
	if(pennyIsCumSlut()) return true;
	return false;
}

//Acquire Cumslut Penny Panties - 1000 wrds
public function acquireCumslootPennyPanties(fromCrew:Boolean = false):void
{
	clearOutput();
	showPenny(true);
	output("<b><u>Something unusual happens...</u></b>\n\n");
	//PUBLIC USE PENNY
	if(flags["PENNY_BEING_A_PUBLIC_CUMSLUT"] != undefined)
	{
		if(!fromCrew) output("You walk past the people waiting for Penny, getting yourself more than a few envious looks in the process. Inside Penny is again");
		else output("When you enter her chambers, Penny is");
		output(" relaxing happily naked on her chair, a new and interesting kaleidoscope of cum coating her bare fur.");
		output("\n\n<i>“[pc.name]!”</i> she calls out happily when she sees you, idly stroking her shaft along the " + (!fromCrew ? "top of her desk" : "side of her workstation") + ".");
		//No new PG, merge in with dialogue.
		output(" <i>“Just the sexy mate I was hoping to see.”</i> Her [penny.cock] stiffens tremendously as you approach, almost in greeting. You note that it’s coated in a few " + (!fromCrew ? "strangely-colored blobs of cum that definitely didn’t originate from inside of her" : "blobs of her fennec spunk") + ". She uses them as lube, stroking herself off while reaching for " + (!fromCrew ? "a desk drawer" : "her personal shelf") + ". <i>“I’ve got a present for you.”</i> She licks her own [penny.cockHead], momentarily distracted by the pulsing hardness so close at hand.");
	}
	//Autofellatio Penny
	else if(fromCrew || flags["PENNY_LETTING_OTHERS_WATCH_CUMSLUTTERY"] != undefined)
	{
		output("Penny looks up at you as you come close, the edges of her lips curling upwards in a smile before she breaks contact with her cock, jizz and spit snapping as pulls back. <i>“[pc.name],”</i> calls after swallowing what must be a cocktail of saliva and dickjuice. <i>“Just the sexy " + pc.mf("guy","girl") + " I was hoping to see!”</i>");
		output("\n\nSomehow, her [penny.cock] seems to get ever stiffer at the sight of you. You note that it’s covered with so much fennec spunk that it practically gleams white. Penny uses it as lube, stroking herself off while reaching for " + (!fromCrew ? "a desk drawer" : "her personal shelf") + ". <i>“I’ve got a present for you.”</i> She licks her own [penny.cockHead], momentarily distracted by the pulsing hardness so close at hand.");
	}
	//SECRET CUMSLUT PENNY
	else
	{
		output("You approach the desk Penny normally works at, but she herself is nowhere to be seen. Before you have a chance to look around, you hear her voice call from underneath, <i>“Just a minute!”</i>");
		output("\n\nLooking down, you catch sight of her snout peeking out from under the desk to sneak a look at you. You wave jokingly, and she responds with a sigh of relief.");
		output("\n\n<i>“Thank god it’s you, [pc.name]. Do you have any idea how hard it is to find time to jerk this monster off under the desk all the time?”</i> She climbs up into her chair and pivots, unashamedly slapping her stiff cock down on the hard surface. If you had to guess, you’d wager that her rigid tool is the firmer of the two right now. You could swear it actually gets bigger at the sight of you.");
		output("\n\n<i>“Uh... no?”</i>");
		output("\n\nPenny nods, and begins to stroke herself off one-handed. <i>“It’s tough, particularly if you’re trying to uh... ah... talk to someone at the same time.”</i> She sighs and fumbles at a nearby drawer. <i>“Anyway, I’ve got a present for you.”</i>");
		output("\n\nYou look at her dick as it rises up to jut angrily toward you. <i>“It had better not be your dick.”</i>");
		output("\n\nPenny giggles almost drunkenly. <i>“No, no, of course not.”</i>\n\n");
	}
	//MERGE: No new PG
	output("\n\nYou " + (!fromCrew ? "hear a latch open and the gravelly sound of poorly lubricated rollers giving way" : "see her hand carefully grab a case and pop it open with her cum-coverd digits") + ".");
	output("\n\nTriumphantly, Penny pulls a pair of functional blue panties - or what were functional blue panties once, long ago. A thick hole was clearly cut in the center of the gusset, then reinforced by an amateur seamstress’ hand. She lays them out across the tip of her pre-oozing cock and sighs. <i>“They didn’t fit right after all the Throbb, and after a while, I couldn’t get them to stop smelling like cum. I even tried soaking them in my");
	if(penny.isSquirter()) output(" gushing");
	output(" pussy while I jerked off, and it didn’t help.”</i>");
	output("\n\nYou arch an eyebrow, <i>“Did you try washing them?”</i>");
	output("\n\nPenny points her cock your way, allowing you to see the center of the fabric beginning to darken with her pre-cum. <i>“Of course! What kind of cum-addled sexpot do you think I am?”</i> She giggles inanely and ");
	if(flags["PENNY_BEING_A_PUBLIC_CUMSLUT"] != undefined) output("scoops a stray strand of spunk into her mouth");
	else output("bends down to suck some of her pre-cum out of the moistening panties");
	output(". <i>“Mmmm... once they get all spunky, I usually just throw them out so I can break in a new pair, but these ones are special.”</i>");
	output("\n\nThis close, you’ve got to admit, they smell a lot like the dick they’re mounted on... and a little like very wet pussy. <i>“How’s that?”</i> you barely remember to ask.");
	output("\n\n<i>“They’re the ones I was wearing when you talked me into growing that dick. The first ones that ever got soaked in pre-cum from how horny I got or were used to wipe up all the gooey spunk I shot.”</i> Penny moans, and more of the fabric darkens, wicking the lusty prick-vixen’s pre-cum up.");
	output("\n\nYou snatch them off her pole before she soaks them, having no desire to carry around a pair of cum-soaked panties.");
	output("\n\nPenny’s dick snaps back up to full attention, and the spermy fox-girl grabs it in both hands, feverishly pumping it, jerking her hips upward with each thrust.");
	if(flags["PENNY_BEING_A_PUBLIC_CUMSLUT"] != undefined) output(" She starts shooting cum all over herself before you can say another word. There’s no denying the eroticism of the situation, or the way it’s making your pulse race.");
	else output(" Her mouth manages to seal around the head just before it begins to unload, stretching obscenely to allow such a large object to push into her throat. You can actually hear her belly gurgling as those urethra-distending bulges fire off into her stomach, one after another.");
	output("\n\nYou look down at the dampened panties in your hand, your trophy for helping unleash the fennec-girl’s inner jizz-queen.");
	output("\n\n<b>You’ve acquired Penny’s panties!</b>");
	output("\n\nPenny pants, ");
	if(flags["PENNY_BEING_A_PUBLIC_CUMSLUT"] != undefined) output("spattering herself with a few weak squirts");
	else output("licking a few stray droplets");
	output(" from her seemingly always erect dick. <i>“I know you can’t always come here to use me, but maybe when you’re out there a planet away, you can");
	if(pc.hasCock()) output(" jerk off with them, and you’ll think of me, moaning and cumming for you.");
	else output(" rub your pussy off with them and think of me, moaning and cumming for you whenever you want.");
	output("”</i>");
	processTime(8);
	pc.changeLust(13);
	pc.createKeyItem("Panties - Penny's - Plain, blue, and crotchless.");
	clearMenu();
	addButton(0,"Next",(fromCrew ? pennyCrewMenu : pennyGirlfriendMenu));
}

//Requires penny to have a dick
//Taurs and nagas not welcome
public function suckPennyUnderDesk():void
{
	clearOutput();
	showPenny(true);
	author("Doots");
	if(pc.isBimbo()) output("<i>“I could like kneel " + (pennyIsCrew() ? "down and like, suck":"under your desk while sucking") + " on your totally yummy cock.”</i>");
	else output("<i>“How about I suck you off" + (pennyIsCrew() ? " while you work":"") + "?”</i>");
	output(" You lick your [pc.lips], thinking of that delicious cock throbbing in her pants, eager to sink itself into a warm, wet hole.");

	output("\n\n<i>“I don’t think I’ll be able to " + (!pennyIsCrew() ? "help with security":"work") + " with a pair of lips wrapped around my cock, but I’d love to try,”</i> Penny murrs seductively before standing up, her zipper down and her dick raring to go. She rounds the desk stopping in front of you, poking you with her erection. <i>“But we’re doing this my way.”</i>");
	output("\n\nBefore you can react Penny pulls your arms behind your back and with a telltale click, she cuffs you. <i>“");
	if(penny.cocks[0].cLength() >= 13) 
	{
		output("I need you to drink all of my ");
		if(!silly) output("yummy spunk");
		else output("cummies");
		output(",”</i> she whimpers in a lustful tone.");
	}
	else output("We wouldn’t want our sexy cum-guzzler getting away before I bust a nut into [pc.hisHer] mouth.”</i>");
	output(" Not giving you time to protest, Penny manhandles you " + (pennyIsCrew() ? "to the ground":"under her desk") + " before sitting down, her [penny.cock] poking at your [pc.lipsChaste]. With your hands cuffed behind your back and a cock in your face, you don’t have much of a choice, not that you would have it any other way.");
	output("\n\nBefore Penny has a chance to get impatient you take the tip of her member into your mouth, earning an eager moan from Penny. You hear the tapping of her " + (!pennyIsCrew() ? "codex above you as she watches the security feeds in an effort to endure your fervent sucking":"keyboard from above you; somehow she managed to start working") + ". You breathe deep before plunging deeper on her cock, not stopping before you’ve reached her ");
	if(penny.hasCock(GLOBAL.TYPE_EQUINE)) output("medial ring");
	else if(penny.hasAKnot()) output("knot");
	else output("half-way point");
	output(". If you had access to your arms, you would stroke the rest of her dick and ");
	if(penny.balls > 0) output("fondle her balls");
	else output("finger her pussy");
	output(", but as is you can’t do anything but bob along her length, which you do with gusto.");

	output("\n\nDespite your sucking of her [penny.cock] she’s still diligently working.");
	if(pc.isBimbo()) output(" This is like, an outrage! She’s totally insulting your awesome dick sucking skills.");
	else output(" How the lusty fox girl can still work is beyond you, but you’re going to change that.");

	output("\n\nEven more determined than before you start sucking even harder, hollowing your cheeks and descending on her cock again, before drawing back. The fennec girl can’t take this any longer, moaning and flexing her thighs on either side of your head. You push further, taking her shaft all the way into your throat.");
	if(pc.canDeepthroat()) output(" Deepthroating might be a challenge to some, but to you, it comes as naturally as breathing.");
	else output(" You splutter, gag, and struggle to fit all of her dick into your throat. But in the end, your gag reflex can’t stand against your will and the amount of dick trying to make its way into the tight confines of your throat.");

	output("\n\nWhen your [pc.lips] touch Penny’s sheath, she can’t take it anymore. Her hands fly down to grab hold of your head. She pulls out of your throat before sinking back in. Quickly, she starts fucking your throat like her personal sex toy. Thankfully, she doesn’t last long; it takes only a few minutes of her sheath beating against your lips before she moans out loud, and her seed starts spilling down your throat and into your stomach.");
	output("\n\nEventually, Penny’s output dies down, and she pulls her [penny.cock] out of your throat. You stare at the cum-covered girl-cock that just recently was plunging in and out of your throat. You’re about to start licking the spunk covering her member, but you hear an order from above you. ");
	if(penny.cocks[0].cLength() >= 13)
	{
		output("<i>“Lick up my delicious jizz, but don’t swallow.”</i>\n\nYou think know what Penny has in mind and you like it.");
	}
	else output("<i>“Clean it up, cock-slut-mate.”</i> You roll your eyes at the pointless command and get back to what you were planning to do.");
	output(" Giving Penny’s member long drags with your tongue, you gather up all of the salty Penny-cum that is covering her cock");
	if(penny.cocks[0].cLength() >= 13) output(",making sure not to swallow.")
	else output(" before swallowing it down. By the time you’re finished, her dick is shining with your saliva.");

	output("\n\nPenny pulls you up from under the table straight into her lap. ");
	if(penny.cocks[0].cLength() >= 13) output("She grabs a hold of your neck, kissing you straight on your [pc.lipsChaste]. Forcing your mouth open with her tongue, she savors the taste of her own jizz inside your mouth before scooping it into her own mouth and swallowing. ");
	output("<i>“You’re too good at that, mate. I almost " + (pennyIsCrew() ? "threw my codex":"misfiled a police report") + ",”</i> she laughingly whispers into your ear. She lets you get back onto your own two feet, before sending you away with a soft slap on your [pc.ass]. <i>“If you ever want me to return the favor, just let me know.”</i> She winks at you before turning her attention back to her work.");
	processTime(20);
	pc.loadInMouth(penny);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Roleplay] (requires genitalia. Taurs and nagas not welcome)
public function pennyRPScene():void
{
	clearOutput();
	showPenny();
	author("Doots");
	if(pc.isBimbo()) output("<i>“I was thinking that we could do like roleplay. I’ll be a really nasty criminal who tried to like seduce you and stuff and now you’re all pent up and super horny.”</i>");
	else output("<i>“How about some roleplay? I’ll play a dirty crook who tried to seduce you but got arrested nonetheless and now you’re all pent up and lusty.”</i> you whisper in a low tone while drawing small circles on the desk.");
	output("\n\n<i>“That sounds fun, my mate. But are you sure? I might get a bit lost in the role.”</i> Penny’s voice is a mixture of lust and worry.");
	output("\n\n<i>There is a predatory glint in her eyes, she’ll probably be a touch rougher than usual.</i>");
	processTime(2);
	clearMenu();
	addButton(0,"Yes",yesPennyLetsRP);
	addButton(1,"No",noPennyNoRP);
}

//[No] (not for bimbos)
//Bimbo greyed out tooltip: you’re totally not going to say no to a good dicking
public function noPennyNoRP():void
{
	clearOutput();
	showPenny();
	author("Doots");
	output("After giving it some thought you change your mind, and let Penny know that after some thought you’re not up to it, at least not at the moment.");
	output("\n\n<i>“That’s alright, no harm no foul. Do you want to do something else then?”</i> she seems to be a bit disappointed by your change of mind. But she perks up quickly, thinking of other things you could do.");
	processTime(2);
	//penny sex menu 4 real.
	pennySexMenu(false);
}

//[Yes]
public function yesPennyLetsRP():void
{
	clearOutput();
	showPenny(true);
	author("Doots");
	if(pc.isBimbo()) output("<i>If I didn’t want it I wouldn’t, like, ask for it.”</i>");
	else output("<i>“I’m sure that I can handle it.”</i>");
	output(" You wave her concerns aside. When Penny hears your words her expression turns to much sterner, she stuffs her cock into her pants and stands up. Without a word, she walks behind you and grabs your wrists and pulls them behind your back and with a click, she cuffs your arms behind your back.");
	output("\n\n<i>“You thought you could trick the long arm of the law huh? Well, you were wrong,”</i> she growls into your ear before pushing you to" + (pennyIsCrew() ? " the brig, groping and squeezing you the entire way. The push inside is tempered by a forceful kiss. ":" the back room. When you’re in the holding area, ") + "Penny closes the door before starting to strip, sensually revealing parts of her body one by one.");
	output("\n\nOnce she’s naked, she uncuffs you before stepping back to ogle at your body. ");
	if(!pc.isExposed()) output("You reach down to get your own clothes off, but before you can even touch your own clothes Penny jabs you in the stomach with her nightstick, not so hard it would hurt but strong enough to get your attention. <i>“Did I tell you that you can take off your clothes? You’re not doing anything if I don’t give you permission.”</i> she waves her nightstick menacingly, <i>“turn around, hands against the wall.”</i> after you press your hands against the walls she kicks your legs apart before starting to pull off your clothing. Once you’re naked she pays special attention to your [pc.ass], roughly groping it before giving it a harsh slap.");
	else output("Penny looks at your naked form with a grin on her muzzle. <i>“A criminal and a pervert to boot, you’re lucky that nudity isn’t illegal here. I’d love to give you a harsher punishment on top of the punishment I’ll be personally dealing.”</i> The way she grins as she speaks sends a shiver down to your [pc.vagOrAss].");
	output("\n\nClearly hungering for more Penny pushes you into " + (!pennyIsCrew() ? "the" : "a") + " cell, ordering you to lift your arms as high as you can against the bars. You do as she commands, not wanting her to threaten you with her nightstick again. With your arms up, she cuffs them to the bars, forcing you to keep your arms up.");
	output("\n\nPenny grabs " + (pc.legCount > 1 ? "one of your [pc.legs], and lifting it up, makes you struggle to balance":"your wrist and yanks it up, making it difficult to balance") + ". You feel a hard, throbbing length grinding against your [pc.ass]. <i>“I’m going to wreck this so hard,”</i> Penny whispers into your ear while nipping your neck. Before you get to worry about her going in dry, you hear Penny spit and stroke something wet. You’re pretty sure that you know what she’s stroking.");
	output("\n\nWith all of the preparations, she’s going to do out of the way she presses the tip of her cock against your [pc.asshole]. ");
	if(pc.analCapacity() < penny.cockVolume(0)) output("You dread for your comparatively small asshole as she’s inches away from invading your back passage. ");
	output("She doesn’t wait, eager to be inside you. With a single solid thrust, she steadily sinks herself into your [pc.asshole]. ");
	if(pc.analCapacity() < penny.cockVolume(0)) output("Your eyes cross in painful pleasure as she stretches your asshole to degrees your rim is not prepared for. <i>“Oh, you’re a tight little bitch. I bet you’re a virgin too, yeah, you don’t seem the type to give your ass to anyone.”</i> she punctuates her words with another slap on your butt before continuing to speak, <i>“I bet it stings to get fucked by a cop.”</i> She continues to hammer your behind with her cock while repeatedly spanking your ass.");
	else output("<i>“What a nice fit, you must take it from behind all the time.”</i>");
	pc.buttChange(penny.cockVolume(0));
	penny.cockChange();

	if(pc.hasGenitals()) 
	{
		output("\n\n");
		if(pc.isHerm())
		{
			output("Your [pc.vaginas] dribble");
			if(pc.totalVaginas() == 1) output("s");
			output(" [pc.girlCum] and your [pc.cocks] leak");
			if(pc.cockTotal() == 1) output("s");
			output(" pre. your entire body yearns for more than just a cock up your ass. ");
		}
		else if(pc.hasVagina()) 
		{
			output("Your [pc.vaginas] clench");
			if(pc.totalVaginas() == 1) output("es");
			output(" around nothing, wishing that the cock filling your back passage was filling ");
			if(pc.totalVaginas() == 1) output("it instead, but all it");
			else output("them instead, but all they");
			output(" can do is dribble around nothing. ");
		}
		else if(pc.hasCock())
		{
			output("Your [pc.cocks] ");
			if(pc.cockTotal() == 1) output("is");
			else output("are");
			output(" rock hard and leaking pre despite no stimulation. The pressure on your prostate is all it takes to get you hard. ");
		}
	}
	output("<i>“Enjoying this are you? You do realize that this isn’t supposed to be a reward?”</i>\n\nYou’re going to cum. It’s inevitable but from the way Penny’s [penny.cock] throbs and spits pre inside you, she’s not far behind either.");
	output("\n\nPenny lets go of your " + (pc.legCount > 1 ? "[pc.leg]":"arm") + ", instead grabbing your [pc.hips] with both hands. There’s a pause as Penny shifts her stance to be wider. You know what’s coming, so you brace for impact as best as you can. A second later it comes, Penny’s hips crash against your ass with a force that almost slams you against the bars. She thrusts as deep as she can and then few inches more as her sheath bunches up against your [pc.asshole], eliciting a groan from your [pc.lips] as she spears your colon on her [penny.cock].");
	output("\n\n<i>“Hang in there, I’m about to make you into a police cum-dump,”</i> Penny pants loudly into your ear. After a handful of thrusts, Penny groans out loud before clamping her jaw around your neck. She bites down hard as her jizz starts to flood your ass, filling nooks and crannies with her sticky baby-batter. Penny’s hand flies down to ");
	if(pc.hasVagina() && !pc.hasCock()) 
	{
		output("finger ");
		if(pc.totalVaginas() > 1) output("one");
		else output("your");
		output(" slit furiously, jilling [pc.oneClit] with lightning speed while pistoning her fingers in and out.");
	}
	else if(pc.hasCock())
	{
		output("grab [pc.oneCock]. Stroking your length furiously, she milks pre from your [pc.cockHead], allowing her hand to glide across it with smooth, flawless strokes.");
	}	
	output("\n\nYou moan breathlessly as she pleasures you with her hand; all the while her cock is squirting more seed into you.");
	var cumQ:Number = pc.cumQ();
	if(pc.isHerm())
	{
		output(" [pc.Girlcum] floods down your thighs while [pc.oneCock] jerks in Penny’s hand, sending your [pc.cumNoun] over the floor.");
		if(cumQ >= 1000) output(" Your groin might as well be a cornucopia of lust, pumping more and more [pc.cumVisc] relief onto the floor until the room looks like post-shoot porno set.");
		if(pc.isSquirter() || pc.girlCumQ() >= 1500) 
		{
			output(" Your [pc.vaginas] ");
			if(pc.totalVaginas() == 1) output("doesn’t");
			else output("don’t");
			output(" disappoint either, ");
			if(pc.isSquirter()) output("squirting");
			else output("leaking");
			output(" enough [pc.girlcum] down your legs to extinguish a campfire.");
		}
		output(" Soon, the cell smells sex. There isn’t a spot on the floor that isn’t covered in some kind of sexual fluid, and you take a perverse sort of pride in that.");
	}
	else if(pc.hasVagina()) 
	{
		output(" You moan to the skies as [pc.girlCum] flows down your [pc.thighs] and coats Penny’s fingers.");
		if(pc.isSquirter()) output(" [pc.EachVagina] leaks like a waterfall, utterly soaking your legs and creating an impressive puddle of your lewd juices beneath your legs.");
	}
	else if(pc.hasCock())
	{
		output(" Your [pc.cocks] squirt");
		if(pc.cockTotal() == 1) output("s");
		output(" [pc.cumNoun] all over the floor, creating [pc.cumVisc] ropes of wasted seed on the floor.");
		if(cumQ >= 1000) output(" You keep cumming, turning the few ropes off [pc.cumNoun] into an ever-growing lake.");
		if(cumQ >= 5000) output(" By the time you stop hosing down the room, you’re both standing in a lake of your [pc.cum] and the bars of the cell are soaked in your baby batter.");
	}
	output("\n\nBoth of you having achieved your orgasm, you just stand there for a minute, catching your breath. Eventually, Penny lets go of your neck and pulls her [penny.cock] out of your asshole. Pausing to unlock your cuffs, Penny walks out of the cell.\n\nOnce your hands are free, you massage your slightly sore wrists while Penny puts her clothes back on. <i>“Don’t worry, I’ll come back to pump another load into you when I get my next break. I’ll be using you as the police-issue cum-dump on every break until transfer is arranged. Could be a couple of weeks if you’re unlucky.”</i>\n\nShe leaves you there, naked with cum leaking out of your ");
	if(pc.analCapacity() < penny.cockVolume(0)) output("sore ");
	output("ass.");

	output("\n\nNot a minute passes before Penny is back; this time her expression is gentle and loving instead of stern and domineering. She " + (!pennyIsCrew() ? "unlocks" : "enters") + " the cell and pulls you into her arms. <i>“I hope I wasn’t too rough with you, my mate.”</i> Her fingers gently trace the bite mark. <i>“Sorry... come on, let’s get a shower.”</i>");
	processTime(30);
	pc.orgasm();
	pc.loadInAss(penny);
	clearMenu();
	addButton(0,"Next",pennyJailRPEpilogue);
}

public function pennyJailRPEpilogue():void
{
	clearOutput();
	showPenny();
	pc.shower();
	author("Doots");
	output("You spend the next half an hour in the shower in the gentle care of Penny. She thoroughly cleans you up while paying gentle attention to your thoroughly abused ass and the bite mark she left on your neck.");
	output("\n\nAfter the shower, you get back to " + (pennyIsCrew() ? "the fox’s quarters":"the front room with Penny") + ". She sits down on the edge of her " + (pennyIsCrew() ? "bed":"desk") + " before pulling you into her lap. Her erection palpably throbs against your ass as you settle into position. <i>“I had so much fun, my mate. I really hope you’re up for this again sometime, but if not I understand.”</i> She’s still apologetic about biting your neck!\n\nYou assure her that your neck is fine before taking your leave. As you step outside, the bite mark on your neck tingles, you touch it instinctively, feeling a wave of lust shudder down your spine down to your [pc.asshole] at the memory.");
	processTime(4);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

/*==========================================
		Penny Crew Recruitment Stuff
==========================================*/
//With lots of help from TheLetterB
//Overview:
//We’re making Penny into a crewmate/waifu! !!!!!

/* NOTES FROM B:
Fenoxo asked me on Discord to handle pure Penny’s recruitment because I’m pretty good at handling waifus (Paige, Nenne, Frosty) – pure, in this case, referring to Penny that is not a bimbo or a cumslut. So, she can have a dick, as long as it’s not as long as she is tall.

The initial idea was that you could just buy out Penny’s contract and convince her to leave Mhen’ga and join you based on you throwing money at her, but Fen opted against that because Shekka and Paige had beaten Penny to that. So, there’s going to be a small sidequest with her (assuming she’s pure. Corrupted Penny will join you because you’re such a stud/slut). I won’t be involved with that; I’m just writing the beginning and the end.

My current agenda is to write the PC approaching Penny about buying out her contract; the lead-up to the quest; and everything upon completing the quest, where she accepts your offer and joins you on her ship. Fen’s wordcount includes some crew interactions, but I’ll probably be pretty light on those, with the exception of Paige. Whether she gets any additional scenes is still in the air as of this writing.*/


//[=Offer=]
// Include this new button on Penny’s Talk menu, after having dealt with the Zil but before having sex with her.
// Tooltip: Penny looks like a stern, capable, reliable type. You could probably find a place for her as a security officer on your ship, easy.
// Tooltip (greyed out): You, um, might want to wait until you and Penny are a little more than just friends before asking her this again.
// I made this scene kind of absurd since Penny’s pre-sex talking topics are rather on the bare side, so you barely know her, but Fen wanted a scene where you offer to take her onboard before having sexed her up.
// (scene: Premature Offer)

public function offerPennyAJob():void
{
	clearOutput();
	showPenny();

	output("You lean onto Penny’s office desk. " + (!penny.hasCock() ? "She has a casual, relaxed look about her, and you can see her tail swish gently behind her chair as you approach her":"She’s trying to act casual, but you can see her hand idly waxing a throbbing bulge between her legs at the sight of you") + ". You study her form – she really commands a sense of authority, from her toned body and the sturdiness and totality of her outfit - exactly what you’re looking for in a security officer.");
	output("\n\nEvidently, the intensity of your expression proves unnerving; as you lean in closer to her, her tail stops swishing and her smile slowly drains from her face. <i>“Uh,”</i> she says as your noses come dangerously close to " + (silly ? "booping":"touching") + ". <i>“Earth to crazy...?”</i>");

	if(pc.isAss()) 
	{
		output("\n\nYour mind made up, you place both your palms on the top of her desk, and you tell her that you’ll hire her onto your crew as your security officer. She’s perfect for the job, and you won’t take a no for an answer.");
	}
	else output("\n\nTrying to be as nonchalant as you can, you tell her that it just so happens that your ship has a vacancy for a security officer. If she’s in the market for a new position, you two could work something out.");
	output("\n\n<i>“Whoaaa,”</i> Penny says, bringing both her hands up and patting her vulpine-padded palms toward you, <i>“You’re coming at me pretty fast there, crazy. Join you on your ship? What the fuck?! I’m literally the only thing keeping this little hamlet from getting overrun by a swarm of pervert wasp-people. You know that! I can’t just pack up and leave. Besides, I barely known you!”</i>");
	output("\n\nShe said it herself, she owes you for helping her with that Zil problem. You " + (pc.isAss() ? "tell":"beg") + " her to reconsider.");
	output("\n\n<i>“Okay, fuck off with that right now,”</i> she warns, pointing a stern finger in your direction. <i>“Helping me deal with a pair of horny bugs doesn’t mean I’m going to just up and change my whole life because you think an inch is the same as a mile. I owe you, like, a beer or or something - nothing more than that.”</i>");
	output("\n\n" + (pc.isAss() ? "You straighten your back, frustrated":"You slump backwards, dejected") + " at Penny rejecting your offer.");
	output("\n\n<i>“Where did all this come from, anyway?”</i> she asks. <i>“You hardly know the first thing about me, and here you are, telling me to quit my job and come work for you – you’re a rusher, right? I can’t risk everything I’ve worked for on something as inconsistent as rushing, no matter how big the payoff might be or how cute the rusher.”</i> The fox-girl’s ears fold back a bit at her slip-up, but the cat’s out of the bag: she thinks you’re cute!");
	output("\n\nYou step back, giving Penny a bit of space.\n\nShe sighs heavily, her wide, inhuman eyes flicking back up to you. <i>“Don’t take it the wrong way. I’m thrilled to have someone as " + (flags["ZIL_PROBLEM_DEALT_WITH"] == 2 ? "slutty":"capable") + " as you helping out around here, but I can’t throw this town away to hunt space-gold with a [pc.guyGirl] I barely know.”</i> She smirks, fingers tapping at some digitized paperwork. <i>“So how about this: we both forget about this for right now, and if anything changes to make more amenable to being abducted by your spaceship, you can ask me again. Deal?”</i>");
	output("\n\nYou suppose it’ll have to be, at least until you know Officer Penny a bit better.");
	processTime(20);
	flags["PENNY_CREW_ASKED"] = -1;
	friendPennyTalkMenu();
}

//[=Offer=]
// Include this new button on Penny’s Talk menu, after having dealt with the two Zil and after having asked her about her [=Goals=]; grey it out until they spoken about her goals.
// Tooltip: Penny said something <i>very</i> interesting to you when you asked her what her plans for the future are. If you’re going to ask her more about it, now would be the time....
// Tooltip (greyed out): You’ve been playing with a thought ever since you first had sex with Penny and she called you her mate, but you think it’d be safer if you could lead into it through conversation....
// (scene: Offer)
public function fuckedPennyRecruitmentInvite():void
{
	clearOutput();
	showPenny();
	author("B");
	if(flags["PENNY_CREW_ASKED"] == -1) output("You’re somewhat hesitant to even think of making this offer, but, well....\n\n");
	output((pc.isTaur() ? "You fold your [pc.legs] under your lower half and seat yourself":"You take a seat") + " across from Penny" + (!pc.isTaur() ? ", in one of her office chairs":"") + ". You tell her that you have a very serious question you want to ask her.");

	output("\n\n" + (flags["PENNY_CREW_ASKED"] == 1 ? "<i>“This sounds awfully familiar,”</i> she snarks. <i>“Good to see you’re pumping the breaks a bit this time, at least.”</i>":"Sensing your sincerity, Penny puts down her paperwork and turns her chair to face you, sitting upright. Her large ears are perked and are facing towards you. <i>“You have my undivided attention, [pc.name],”</i> she says, and you can tell, she means it."));
	output("\n\nWhen you asked her about her goals in life, she mentioned towards the end that she might consider retiring and traveling the stars with you as an adventurer. You know that she has a lot on her plate right now, but... you ask her what it would take to get her to seriously consider it. You’d love to have her with you on your ship.");
	output("\n\nAt the question, Penny takes a long, deep sigh. Her gaze falters and focuses elsewhere in the room as she considers the question. <i>“There’s a lot to keep in mind with a question like that, [pc.name],”</i> she says. <i>“It’s more than just picking up and leaving. Esbeth may only have a handful people in it to call it a community, but, fuck, I can’t just leave them. I’m the only law enforcement here.”</i>");
	output("\n\nSo, the challenge is to find a replacement for her? <i>“It would be a good start, for sure,”</i> she says, her fingers twiddling senseless patterns on her desk. <i>“But I still have payments and debts of my own to worry about. I won’t doubt that being a rusher can be lucrative, but I need something more stable than the occasional lucky gold dig or whatever.”</i>");

	output("\n\n" + (pc.credits >= 50000 ? "You’re pretty loaded. You could offer to help her out.":"You could offer to help her out with that, even if you’re not exactly [pc.misterMiss] moneybags at the moment."));
	processTime(3);
	clearMenu();
	addButton(0,"Offer Creds",offerCreds,undefined,"Offer Creds","Help a girl out.");
	addButton(1,"Don’t Offer",dontOfferPenPenCreds,undefined,"Don’t Offer","Penny’s a strong, independent furry who don’t need no creds.");
}

public function offerCreds():void
{
	clearOutput();
	showPenny();
	author("B");
	output((pc.credits >= 50000 ? "In that case, you offer to pay off whatever outstanding debts Penny has on the spot. You’ve got some pretty hefty pockets, and if it means giving Penny a more exhilarating future than just sitting at a desk and waiting for danger to come to her, you’d gladly pay it.":"You ask her if she isn’t averse to getting a donation or two to help dig her out of whatever hole she’s in. If it means getting Penny out of this cramped office and out from behind that desk so she can live a more exciting life, you wouldn’t mind putting in a few extra hours to raise the funds and help her out."));
	output("\n\n<i>“Hey!”</i> Penny barks, extending an authoritative finger towards you – but, as soon as the command rises in her throat, it dissipates, and her expression softens. <i>“I’m sorry. You’re just trying to be a good mate to me, and I shouldn’t have snapped at you like that.”</i>");
	output("\n\nYou ask her why she did. <i>“Because I don’t like the idea of being dependent. It’s a generous offer, [pc.name], but, mate or not, I’d just be going from one debt to another. I can’t rely on handouts all my life. I dug this hole, and I’m going to climb out with my own two hands.”</i>");
	pennyHelpNoHelpScene1Outro();
}
public function dontOfferPenPenCreds():void
{
	clearOutput();
	showPenny();
	author("B & Fenoxo");
	output("You offer a sober nod. <i>“I understand. You wanna ");
	if(pc.isBimbo()) output("like, make your own money and stuff, even if it’s totally hard.”</i> You stifle a giggle.");
	else output("lift yourself up on your own two feet - er, paws.”</i>");
	output("\n\n<i>“Exactly!”</i> Penny barks, extending an authoritative finger. <i>“That’s why you’re my fucking mate, right there. I don’t like the idea of being dependent. Taking a loan to look like this damn near killed me inside, but I don’t need handouts any more. I’m going to climb out of this hole with my own two hands.”</i>");
	pennyHelpNoHelpScene1Outro();
}

public function pennyHelpNoHelpScene1Outro():void
{
	output("\n\nYou ask, in that case, if... there’s any other way you can help her. If you can’t just give her money, can you at least help her <i>earn</i> her way out of her debt?");
	output("\n\n<i>“You’re serious about this, aren’t you?”</i> Penny asks, her face lowered but her eyes raised, on yours. You respond that you are. <i>“Well...”</i>");
	processTime(6);
	clearMenu();
	addButton(0,"Next",fuckedPennyRecruitmentInvite2);
	if(flags["PENNY_CREW_ASKED"] == undefined || flags["PENNY_CREW_ASKED"] == -1) flags["PENNY_CREW_ASKED"] = 1;
}

//[=Next=]
// end scene (scene: Offer); go to (scene: Offer 2)

// (scene: Offer 2)
public function fuckedPennyRecruitmentInvite2():void
{
	clearOutput();
	showPenny();
	author("B & Fenoxo");
	output("Penny faces her monitor and taps on her keyboard for a moment. Windows open up and sift through files and folders, until she comes to an image file that, with the press of a button, takes up the whole screen, turning it black and green: it appears to be a screenshot of some kind of radar, with a number of white dots appearing in various spots all over the screen – including a massive cluster of them in the corner.");
	output("\n\n<i>“This is a screenshot of an Oxonium scanner, [pc.name],”</i> she says, leaning back to give you a better view of the monitor. <i>“The station has a dish on the top that is primarily used for interplanetary communications, so I can report into the U.G.C. every now and then, but one night I caught some shithead rusher trying to rig it to scan for Oxonium deposits while I was off-duty. I uninstalled the software and gave him the boot – but not before taking a screenshot of the results. Every white dot that you see is a positive reading.”</i>");

	if(flags["TAGGED_MHENGA_OXONIUM_DEPOSIT"] == undefined) output("\n\nYou ask her what the significance is. <i>“Oxonium is a mineral used in holographic displays, like the one in your Codex. It’s not that easy mineral to come by, which is why holographic projectors don’t come cheap. And... that means Oxonium is worth a pretty penny on its own.”</i>");
	output("\n\nThe news takes you by surprise – " + (flags["TAGGED_MHENGA_OXONIUM_DEPOSIT"] != undefined ? "you’re aware of just how valuable a single deposit of Oxonium is, and ":"") + "she has a screenshot that just <i>tells</i> her of all the Oxonium within twenty miles? <i>“Don’t go spreading the word; this wasn’t the most legal use of U.G.C. tech in the handbook, and if word gets back to base, the photo will be confiscated. Worse, I’ll be reprimanded for taking advantage of a sour situation.”</i>");
	output("\n\nYou stare at all the white dots on the screen. You avoid the obvious question first, and ask instead why she hasn’t tried to track down all the stray little dots littered across the screen. <i>“A lot of them are false positives,”</i> she answers. <i>“I tried. The ones that</i> do <i>pay off only get me about three grand in credits or so, which I don’t think is worth the risk.”</i>");
	output("\n\nSo, then, you broach the obvious question – what about the massive cluster in the corner?");

	output("\n\n<i>“<b>That,</b>”</i> she says, adjusting herself in her seat, <i>“is from a cave located a couple miles deep into the bush. A cave with that much Oxonium in it would <i>easily</i> give me enough leeway to consider joining you as a rusher. But I haven’t gone for it because the partners of that one shithead that jacked my dish went after the cave, and they never came back. So I had the place cordoned off.”</i> She plants both her elbows on the table and strains her fingers, angrily snarling at the monitor. <i>“Argh, it’s been</i> torture <i>knowing that so much money is sitting</i> right there, <i>but I haven’t been able to do a damn thing about it!”</i>");

	if(pc.isNice()) output("\n\nYou can probably guess what the next words out of Penny’s mouth are going to be, but you let her go ahead.\n\n<i>“That’s where you come in,”</i> she says, her hand clasping securely onto your shoulder. <i>“It would be crazy for me to go there alone... but if I had my mate at my side, we could make it work. After I saw you handle those two Zil, I knew that, if anyone would be willing to risk going after it, it’d be you. You and me, [pc.name], we could make that jungle our bitch. Our prey!”</i>");
	else if(pc.isMischievous()) output("\n\n<i>“Let’s go get it, then,”</i> you offer. <i>“You and me.”</i>");
	else output("\n\n<i>“Well, there’s no sense in standing around, is there? That Oxonium isn’t going to go claim itself.”</i>");

	if(!pc.isNice()) output("\n\n<i>“I was hoping you’d say that, my mate,”</i> she replies with a smug, self-satisfied grin. <i>“As soon as you handled those Zil, I knew you were crazy enough to go and tackle that deposit with me.”</i>");
	output(" She leans into you and nuzzles her cheek against yours affectionately. <i>“Making you into my mate just happened to be a bonus.”</i>");
	output("\n\nPenny closes the image, returning her monitor to its previous state. <i>“I’ve had the coordinates for the cave mapped out for some time, now. We don’t have to go to it right now; I’ll give you some time to get ready. You know where I am when you are.”</i>");
	output("\n\nYou stand and make for the door – but, as soon as you do, you feel a hard, hearty slap against your [pc.ass], making you jump in surprise, followed by a five-fingered grope.");
	output("\n\nYou turn back to Penny, and to her narrow-eyed, devious, predatory expression, her tongue coyly licking at one corner of her mouth. <i>“There’ll be more in it for you than just a take if it all works out, my mate,”</i> she promises.");
	output("\n\nWith that in mind, you leave her station – for now.");

	processTime(10);
	pc.changeLust(5);
	clearMenu();
	addButton(0,"Next",moveSouth);
}

//[=Cave=]
// Add this button after having spoken to Penny about getting the Oxonium.
// Tooltip: Set off for the cave full of Oxonium that Penny had told you about.
// (scene: Sidequest Start)
public function startPenpenQuest():void
{
	clearOutput();
	showPenny();
	author("B & Fen");
	output("You approach Penny’s desk");
	if(pc.isBimbo()) output(" with a happy giggle and the friendliest smile in all the galaxy.");
	else if(pc.isMischievous()) output(" with a confident, surly stride.");
	else if(pc.isNice()) output(" with a friendly smile and a wave.");
	else if(pc.isAss()) output(" with a firmly set jaw and a determined glare.");
	output("\n\n<i>“By the look on your face, my mate,”</i> Penny begins – a sly, confident smirk spreading on her lips as she stands. <i>“You’re ready to go bag us some Oxonium, am I right?”</i>");
	output("\n\nAs a matter of fact–");
	processTime(1);
	clearMenu();
	addButton(0,"Ready",readyToGoOnAnAdventure,undefined,"Ready","Get this party started.\n\n<b>Warning:</b> this is a dangerous adventure that may result in sudden game overs.");
	addButton(1,"No",noPennyLetsNotStart,undefined,"No","Uh, maybe if you just had a few more hours.");
}

//[=...No!=]
// Tooltip: Uh, maybe if you just had a few more hours....
public function noPennyLetsNotStart():void
{
	clearOutput();
	showPenny();
	author("B");
	output("You hesitate, and tell Penny that you’re just reminding her that you haven’t forgotten; you just need a few more hours of prep time.");
	output("\n\nPenny’s expression sours into a frown, and she plops herself back onto her chair, returning to her professional demeanor and busying herself with her paperwork. <i>“Well, I won’t ever be going anywhere until you are,”</i> she says. And that’s the end of the conversation.");
	//Normal Menu
	clearMenu();
	addButton(0,"Next",approachGirlfriendPenny);
}


//[=Ready!=]
// Tooltip: Set out for that cave of Oxonium and change the course of Penny’s future! <b>Make sure you’re ready before choosing this option!</b>
// This would be the start of the sidequest, which is no longer my area, so I’m leaving this content blank.
public function readyToGoOnAnAdventure():void
{
	clearOutput();
	showPenny();
	author("Fenoxo");
	flags["PENNY_CREW_ASKED"] = 2;
	output("<i>“Yep.”</i>");
	output("\n\nPenny slaps the ‘standby’ key on her workstation with visceral glee. <i>“Then what are we standing around for?”</i> She bounces to a corner of the room and, swiftly keying in a passcode, reveals the chromed metal of a U.G.C.-issue room-sweeper. The fox-woman grabs an accompanying greatcoat and shovels a dizzying amount of blue-patterned shells into the bulging pockets before finally hefting the comparatively huge powder-banger. <i>“Just in case we run into any male zil.”</i> She racks the action. <i>“Can’t exactly smack them around with a Tonfa when they’re flying in the air, and don’t worry - these are less-than-lethal rounds. I’m not killing anybody unless I have to.”</i>");
	//Bimbo
	if(pc.isBimbo()) output("\n\nYou boisterously applaud, thrilled to see her all gussied up in combat gear. She’s super hot with a shotgun!");
	//Bro
	else if(pc.isBro()) output("\n\nYou nod approvingly. <i>“Good.”</i>");
	//nice
	else if(pc.isNice()) output("\n\nYou weren’t sure what to expect, but it’s good to see that Penny is taking this so seriously. <i>“Badass, Penny.”</i>");
	//Mischievous
	else if(pc.isMischievous()) output("\n\nYou clap her on the back approvingly. <i>“Lookin’ good there, Penny! You ought to bring the coat to our next bedroom adventure. Just in case.”</i>");
	//Hard
	else output("\n\nYou eyeball the shells warily. <i>“Your call. The lethal kind would put ‘em down faster. Besides, I’m pretty sure it takes more than buckshot to keep the bastards down.”</i> You look over Penny’s coat next, taking note of where the sewn-in armor hangs heavily on the cloth. <i>“Good choice of coat though. Who knows what’s out there.”</i>");
	output("\n\nThe fox-woman fidgets briefly, undoubtedly flushing beneath her sleek, tawny fur. <i>“Thanks, [pc.name]. I’ve had a lot of time to think about how I’d approach a mission like this - what gear I’d take, the path through the jungle... all I was missing was a capable mate to watch my back.”</i> She tosses the shotgun over her shoulder and leans into you, pulling you dangerously close. <i>“I was missing you.”</i> Lips parting, she leans ");
	if(pc.tallness - 10 > penny.tallness) output("up ");
	else if(pc.tallness + 10 > penny.tallness) output("in ");
	else output("down ");
	output("for a long, slow kiss, one of her hands possessively squeezing your [pc.butt]" + (pc.buttRating() >= 12 && pc.tone < 66 ? ", the fingers all but vanishing into one of your oh-so expansive cheeks":"") + ".");
	output("\n\n<i>“Let’s go,”</i> Penny declares, breathing a bit heavily.");
	processTime(5);
	pc.changeLust(3);
	clearMenu();
	addButton(0,"Next",pennyMissionStart);
}

public function pennyMissionStart():void
{
	clearOutput();
	showPenny();
	author("Fenoxo");
	showName("HIKING\nWEST");
	moveTo("WEST ESBETH 2");
	output("The walk to the west side of town draws more than a few concerned stares at Penny’s appearance. It’s not every day the local peacekeeper marches down the street kitted out to take down a riot single-handedly. Citizens and Rushers alike give you a wide berth. Less reputable members of Esbeth’s public keep their eyes down and slink into shadowy alcoves.");
	output("\n\nPenny is smiling like a maniac by the time you clear the west edge of town and march toward the jungle. <i>“Did you see the looks on their faces, [pc.name]?”</i> She cackles. <i>“I don’t even get respect like that from Burt when I’m dragging a half-dozen drunks out of his bar.”</i> Popping the shotgun off its holster, she thumbs off the safety and coolly regards the edge of the jungle. <i>“Assuming we don’t end up captured by man-eating plants or zil slavers, I am going to give them such a hard time about it when I get back.”</i> Her head pivots as she scans the jungle for something. <i>“Gun or not, I’m still the same old Penny.”</i>");
	output("\n\nShe glances between her thighs, then sheepishly up at you. <i>“Mostly the same old Penny. Just a little sluttier for her " + pc.mf("handsome","sexy") + " mate.”</i>");
	output("\n\nYou point out that they’ve never had a chance to see her when she’s wholly focused on a goal.");
	output("\n\n<i>“I suppose so.”</i> The fox-girl’s enormous ears perk up. <i>“There!”</i> She points to a natural break in the foliage. <i>“That’s a natural path that’ll take us almost directly to the Oxonium deposit, assuming the jungle hasn’t shifted too much since the last orbital scan.”</i> She steps up to it and breaths deeply, gathering up the courage to face the unknown without the coverage of turret emplacements. <i>“Let’s do this.”</i>");
	output("\n\nTogether, you walk into the untamed wilderness of Mhen’ga’s western jungle.");
	processTime(15);
	pc.changeLust(-50);
	clearMenu();
	addButton(0,"Next",pennyMissionWalk);
}

public function pennyMissionWalk():void
{
	clearOutput();
	showPenny();
	showName("DEEP\nFOREST");
	showBust(pennyBustDisplay(true),"ZIL_RED","ZIL_RED");
	moveTo("PENNYQUESTSTANDIN");
	output("Travel is slow going. Between the foreign environment, unstable footing, and the hazards inherent to an alien jungle, neither you nor Penny is in a hurry to take any unnecessary risks. You make steady progress through razor-sharp ferns, hop over fallen tree trunks so infested with fungus that they squish like mud, and even manage to catch Penny when her coat catches on the edge of a broken branch.");
	output("\n\nNo venture into these dangerous woods would be complete without an encounter with the wasp-like zil, and this particular journey is no different. The telltale buzzing wing-beats alert you to the presence of wasp-men moments before three of them flutter down from the canopy. Unlike others you have encountered, these ones are red and black, the chitinous armor of their chests and loins fully retracted to expose oily nipples and phalli thickened by rapacious lust.");
	output("\n\nTo her credit, Penny has her gun aimed up in the air almost before you free your own [pc.weapon]. She takes aim... and the smell hits you: sweet and cloying. It’s like sex set to marinate in honey for days. " + (!pc.hasAirtightSuit() ? "While you certainly feel a bit warmer from your first breath":"While you’re silently thankful for your airtight equipment") + ", the gun-toting vixen suffers far worse. Eyes wide, she whines, high-pitched and desperate. Her hands shake as her shoulders slowly slump.");
	if(penny.hasCock()) output(" A growing distention appears at her crotch until she can bear it no longer. Penny drops her weapon to get her hands on another, whimpering, <i>“S-s-sorry, mate! They smell so goooood!”</i> Pre bubbles between her fingers instantly as her body responds to a pheromonal trigger her mind has made synonymous with masturbation." + (penny.cocks[0].cLength() >= 13 ? "<i>“And I’m just a horny, big-dicked fuck-toy of a fox!”</i> Her spilling excitement thickens, a little opaque at that admission. <i>“F-fuck those zil, and then fuck me!”</i>":""));
	else output("\n\nA growing damp patch appears at her crotch until she can bear it no longer. Penny drops her weapons to deal with the more serious threat of her waistband and panties, nearly ripping them in her hurry to plunge her fingers deep into her own sodden honeypot. <i>“S-s-sorry, mate! They smell so goooood!”</i> she whimpers while rubbing her palm against her flushed and swollen mound, completely soaked the second she got a whiff of the oh-so-familiar pheromonal trigger.");
	output("\n\nJust how much time did she spend huffing zilmusk and masturbating before you helped her out? <b>You’ll have to deal with them yourself!</b>");
	processTime(20);
	pc.changeLust(4);
	clearMenu();
	//start combat
	CodexManager.unlockEntry("Zil");
	CombatManager.newGroundCombat();

	//Setup Penny with all the combat stats she needs.
	penny.pennyQuestSetup();

	CombatManager.setFriendlyActors(pc, penny);
	penny.lust(1000);
	var enemies:Array = [new ZilMale(),new ZilMale(),new ZilMale()];
	enemies[0].pennyQuestIt();
	enemies[0].long = "Floating the highest, this red and black zil is notable for the size of his erection and the intensity of the gaze he fixes upon you. His thin black lips curl with the hint of a smile, undoubtedly anticipating all the sordid things he intends to make you and Penny do.";
	enemies[1].pennyQuestIt();
	enemies[1].long = "The second zil your gaze sweeps across is colored much the same as the first, though his reddish hues are more muted and his dick merely porn-star grade. He looks stronger too and carries himself with the bearing of a leader - albeit one determined to shove his dick into a Rusher at the first opportunity.";
	enemies[2].pennyQuestIt();
	enemies[2].long = "Your final alien foe hangs lower in the air than his compatriots but appears no less libidinous or dangerous. His wings flutter steadily, his dick almost casually leaking strings of sweet pre-cum. He keeps looking at Penny with a wide, excited smile.";
	CombatManager.setHostileActors(enemies[0],enemies[1],enemies[2]);
	CombatManager.victoryCondition(CombatManager.ENTIRE_PARTY_DEFEATED);
	CombatManager.victoryScene(defeatThatZilgang);
	CombatManager.lossScene(loseToZilGangWithPenpen);
	CombatManager.displayLocation("ZIL HUNTERS");
	
	clearMenu();
	addButton(0,"Next",CombatManager.beginCombat);
}

//Penny & You Zil Ambush Bad-End
public function loseToZilGangWithPenpen():void
{
	pc.lust(300);
	var enemies:Array = CombatManager.getHostileActors();
	while(enemies.length > 1)
	{
		CombatManager.removeHostileActor(enemies[0]);
	}
	author("Fenoxo");
	showBust("ZIL_RED",pennyBustDisplay(true),"ZIL_RED");
	showName("\nDEFEATED");
	output("You should’ve known this little quest would result in you and Penny on " + (pc.hasKnees() ? "on your knees":"on the ground") + " with your mouths open and your nostrils wide-open, drinking in as much of the wasp-men’s intoxicating musk as possible." + (pc.hasAirtightSuit() ? " And all they had to do was pry off your equipment and spend a little time fluttering in front of your face.":"") + " Penny’s nose is simply too sensitive and, frankly, too-well trained to adore the sensuous fragrance. She was doomed to " + (penny.hasCock() ? "milk her [penny.cock] into orgasm after orgasm":"do her thinking with the steaming slit between her legs") + " the moment she stepped into the jungle. Tears of shame well at the corners of her eyes as she utterly submits to the fluttering, insectile incubi, rolling out her tongue invitingly.");
	output("\n\nPlans forgotten, the vixen just wants to get fucked.");
	output("\n\nYou know exactly how she feels. You might have been a little bit more resistant, but there were so many of them, infusing the air with their potent alien scents. Now you’re just like her - equally aroused and equally pliant to their whims. You lean toward the closest one and give him an audible sniff, stroking your body as his mere aroma arouses you to entirely new heights. You can’t entirely describe how you perceive their blissfully pleasant odor, only understand that it makes you feel so deliciously depraved and ready to be fucked. You whimper and wobble, leaning up against Penny for support.");
	output("\n\nYour tongue slides out alongside hers" + (pc.hasTongueFlag(GLOBAL.FLAG_LONG) ? ", so much longer and more inviting but no less eagerly provided":"") + ". You hope they fuck your mouth first. " + (pc.hasVagina() ? "Or [pc.oneVagina]. ":"") + (pc.totalVaginas() > 1 ? "Or all of them. ":"") + "Or your ass. Whatever.");
	output("\n\n<i>“How lucky we caught this pair of sky-sluts,”</i> one of the handsome, gloriously erect wasp-men buzzes. <i>“And this one is so pretty, with fur like naleen but on legs instead of those wretched snake tails. They will fetch quite a bounty from the sky traders when they arrive.”</i> He chuckles, easing himself into Penny’s unresisting maw. She gurgles messily at first, but her lips soon seal into a tight, slurping ring. <i>“Maybe I will keep this one though. She pleases me.”</i>");
	output("\n\nAnother strides forward, hip-to-hip with his spit-shined compatriot. <i>“Truly? Then my brother and I may lay claim to this one.”</i> He sets his cock upon your tongue, filling you with the raw taste of ambrosial honey. His smell is so much more potent this close. Your breaths are tinted with potent wafts of his arousing loins. You don’t wait for him to push his way inside. You slide forward, thanking him for wanting to keep you by sucking him " + (!pc.canDeepthroat() ? "as deeply as you dare. You struggle to go deeper, wanting his balls to rest on his chin, but he’s simply bigger than most other zil, and your poor throat isn’t well-trained enough.":"deep. When his balls rest against your chin and the smooth skin of his abdominals is flattening your nose, you shudder with oral ecstasy."));
	output("\n\nA wet slap pulls your eyes from this chitinous god’s loins and over to Penny. She’s taken her zil all the way to the hilt. Her eyes water with the effort of it, but her lips curl with a hint of smile, even as they struggle to maintain a tight seal for the candied cock. She glances your way when she slides back, somehow pleased to share this moment with you, delighted to know that if she’s going to become a zil’s cock-polisher, that you’ll get to be right there beside her, sliding your tongue into the syrupy spot between glans and foreskin. The fox bobs back and forth, sucking to the rhythm of the fingers she has " + (penny.hasCock() ? "jerking her [penny.cockNoun] off":"plunged squishing between her thighs") + ", staring lovingly at you until the moment her eyes roll back and close.");
	output("\n\n<i>“Just like that,”</i> the zil moans, grabbing Penny by the ears and pulling back down to the root of his member. <i>“Work the tongue, sky slut.”</i>");
	output("\n\nNot to be outdone, your own zil counters by pushing you back and forth, using your mouth like a pussy. You make up for your helplessness by working your [pc.tongue] even harder, exploring every nook and cranny of the bug-boy’s pulsating phallus, coaxing him to leak droplets of sugary anticipation onto your tongue" + (pc.canDeepthroat() ? " and deep into your throat":"") + ". He grunts in approval, a noise that brings its own sort of pleasure. You let your eyes drift closed and allow the flavor and scent to become your world. The hot pulse of cock in your mouth may as well be your own heartbeat for how it drives you.");
	output("\n\nYou suck alongside Penny until time seems to lose all meaning. There is only the taste of zil on your tongue, the scent in your nose, and the wet sounds of your [pc.lips] gliding back and forth. You suck cock like you were born to, and ");
	if(!pc.canDeepthroat())
	{
		output("increasingly, you come to realize how much you love doing it, especially when <i>his</i> moans drive you to climax" + (pc.hasCock() ? " all over the forest floor":"") + ".");
	}
	else output("you suppose that’s no big surprise, given the transformations you’ve undergone. You <i>love</i> to suck cock, and when you can make <i>him</i> moan, it’s enough to make you cum" + (pc.hasCock() ? " all over the forest floor":"") + ".");
	processTime(20);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",loseToZilBoisWithPenpen);
}

public function loseToZilBoisWithPenpen():void
{
	clearOutput();
	showName("ZIL\nSWARM");
	showBust("ZIL_RED",pennyBustDisplay(true),"ZIL_RED");
	author("Fenoxo");
	output("How lucky that you get <i>two whole</i> zil boys all to yourself! Penny’s owner went dry long before your two males finished throatfucking you into subservience, leaving her with nothing to do but lamely lap at his balls and smear his scent into her fur. She’s a hyperventilating wreck now, masturbating even now on the way into the village proper. The pink collar her owner fitted her with illuminates the surrounding jungle as well as the curves of her bared bosom in licentious light. It looks so pretty that you almost wish you had one of your own until one of the hands on your ass gives a possessive squeeze and reminds you that you have twice as many owners.");
	output("\n\nThe village, to your surprise, isn’t a gigantic cloud of brain-frying pheromones. Your owners keep their crotches firmly closed, even if the chitin creaks worryingly with every step, not built to contain porn-star pythons. The other zil are much the same, aside from a dozen warriors standing around a cage, gently fanning their wings to blow their scent into the orgy of off-worlders inside - future slaves.");
	output("\n\n<i>“These belong to us,”</i> your owners boldly proclaim to a female who tries to lead you away. <i>“We have provided more than a bounty to the village. We claim these by right of hunt.”</i>");
	output("\n\nYou giggle when she spins away in a huff, allowing yourself to be lead into a squat structure of sweet-smelling mud and amber-fortified thatch. You lick the residual sugar-cum from your lips as you’re pushed inside. Penny vanishes into a darkened doorway a few huts over, unresisting. You suppose maybe you should’ve struggled or made a run for it, but your face still smells faintly of zil-cock. Every breath reminds you of how <i>nice</i> they smell, and how hot you are for another chance to slobber on those big, meaty cocks. You’re still thinking about those same cocks when two of them swim back into view, ready for round two.");
	output("\n\nPenny’s muffled moans reach your ears at the exact moment that two swollen pricks push into you, claiming you from each end.");
	pc.changeLust(100);
	clearMenu();
	addButton(0,"Next",loseToZilBoisWithPenpen2);
}
public function loseToZilBoisWithPenpen2():void
{
	clearOutput();
	showName("GAME\nOVER");
	showBust("ZIL_RED",pennyBustDisplay(true),"ZIL_RED");
	author("Fenoxo");
	output("Life is simpler as property. You don’t have to worry about money or probes or inheritances or anything like that. The only thing you have to worry about is being as sexy as possible as much as possible, and fucking your owners at the drop of a hat, of course.");
	output("\n\nBy your second day in the village, the female zil present you with a tube of lipstick, presumably distilled from the ejaculate of their males, judging by its glossy amber sheen and overwhelmingly arousing fragrance. Your owners give you slinky bits of latex that reveal almost as much as they cover, paid for in the flesh of innumerable other slaves. Your [pc.belly] and [pc.butt] are tattooed with intricate designs that you don’t entirely understand, but the look in your owners’ eyes when they see your new look makes it all worthwhile.");
	output("\n\nPenny winds up coming out even sluttier than you. Maybe it’s something about her collar, but she throws herself at every zil she sees. The moment a chitinous crotch opens up, she’s pressing her face into the opening and sucking the lucky wasp-boy to a full erection in seconds. Her ears seem permanently pressed back in pure submission and her fur matted with honey-seed. In the rare moment you have alone with her, she jumps directly to kissing and humping, and with all the sexifying lipstick on your mouth, you’re in no position to protest the tarted-up vixen’s attentions.");
	output("\n\nThe first couple times that you fuck her, you try to talk her with her inbetween orgasms, but she seems more interested in tonguing your [pc.nipples] or grinding against your thigh with a faraway look in her eyes. It’s easier not to bother - better to rub and grind and take what pleasure you can from her company. Neither of your owner’s seems to mind you fucking each other so long as your mouth falls open the moment a zil-dick enters the room.");
	output("\n\nAs the days go on, you lose more and more time with Penny. Hours go by between her thighs. She’s almost always as sweet as they are between the legs, and her fur acts like a sponge for her owner’s pheromones, ensuring that the fat-tittied fox-slut puts you into heat the moment you get a whiff of her presence. You know she’s a bad influence on you, but you’re helpless to resist diving into her pussy" + (penny.hasCock() ? " or slobbering on her continuously erect pillar of fox-cock":"") + ". You love fucking Penny almost as much as you love servicing your twin masters. It’s not like you have anything better to do. Why not pay her back with pleasure for taking her on this fool’s errand?");
	output("\n\nPenny’s once athletic figure softens from all the calories she’s swallowing and how much time she spends on her back, but it’s more than that. She’s getting bigger all over, especially her tits. When your masters mention what a lovely broodmare she’s become, the pieces finally come together for your increasingly addled mind: Penny is pregnant! She’s going to give birth to a zil baby, the first of many. That’s why her belly is pudging out so much, and why her nipples seem extra thick and suckable.");
	//No vag
	if(!pc.hasVagina()) output("\n\nYour owners make sure to procure a mod to grow you one too, and while your pregnancy is longer in coming, it’s every bit as wonderful to fill with new life as it is to spend an entire day sucking zil-cock after zil-cock...");
	//Vag
	else output("\n\nYou turn out to be pregnant not long after, and it’s every bit as wonderful as Penny makes it seem - almost as good as spending an entire day sucking zil-cock after zil-cock....");
	//Merge
	output("\n\n<b>Together, you and Penny endear yourselves to the entire village both for your fertility and your unceasing amory to all the beautiful, chitinous creatures.</b>");
	badEnd();
}

//Zil Victory: Use A Normal Zil Victory Scene With Penny Stuff Appended:
public function defeatThatZilgang():void
{
	var enemies:Array = CombatManager.getHostileActors();
	while(enemies.length > 1)
	{
		CombatManager.removeHostileActor(enemies[0]);
	}
	author("Fenoxo");
	showBust("ZIL_RED",pennyBustDisplay(true),"ZIL_RED");
	showName("\nVICTORY");
	eventQueue.push(pennyGetsHerselfOffOnAZil);
	eventQueue.push(setupPennyQuestDungeon);

	output("With the zil defeated, you’re left to choose - do you tend to your fallen comrade or avail yourself of one of the bug-boys for personal satisfaction?");

	clearMenu();
	if(pc.hasCock())
	{
		if(pc.cockThatFits(enemy.analCapacity()) >= 0 || pc.shortestCockLength() < 20) addButton(0,"Buttfuck",buttfuckDefeatedZil,undefined,"Buttfuck","Buttfuck a defeated Zil male.");
		else addDisabledButton(0,"Buttfuck","Buttfuck","You’ll need a smaller sized cock in order to plug this wasp.");
	}
	else addDisabledButton(0,"Buttfuck","Buttfuck","You’ll need a cock for this!");
	//*Ride His Cock
	//To cumfinity, and beyond! REQS CUNT
	if(pc.hasVagina()) addButton(1,"Ride Him",rideDatZilCawk,undefined,"Ride Him","Take wasp-boy’s lovely cock for a ride.");
	else addDisabledButton(1,"Ride Him","Ride Him","You must have a vagina to ride this ride.");
	//*Footjob scene - Req's humanlike feetsies
	//(By Miesha)
	if(pc.hasFeet() && !pc.isTaur()) addButton(2,"GiveFootjob",giveTheZilAFootjob,undefined,"Give Footjob","Give a male zil a footjob... for fun.");
	else addDisabledButton(2,"GiveFootjob","GiveFootjob","Giving a zil a footjob requires human-like feet.");
	//*Foreskin Oral Play
	//(By Alkahest) (If this needs to be edited, I will do so. Lemme know your opinion plz)
	//Requires a decent amount of zil sex, a dick, a pussy, or nippledicks!
	//Reqs loss suck some.
	if((pc.hasCock() || pc.hasVagina() || pc.hasNippleCocks()) && flags["TIMES_LOSS_SUCKED_ZIL_MALE"] >= 2) addButton(3,"Oral Play",alkahestsForeskinOralPlay,undefined,"Oral Play","Really get in there and play with a male zil’s foreskin-clad cock.");
	else if(pc.hasCock() || pc.hasVagina() || pc.hasNippleCocks()) addDisabledButton(3,"Oral Play","Oral Play","This scene would only make sense if you’ve had to suck a zil off twice already after losing in combat....");
	else if(flags["TIMES_LOSS_SUCKED_ZIL_MALE"] >= 2) addDisabledButton(3,"Oral Play","Oral Play","You need genitals for this!");
	else addDisabledButton(3,"Oral Play","Oral Play","This scene would only make sense if you’ve had to suck a zil off twice already.... Oh, and you’ll need to have genitals too.");
	if(pc.hasCuntTail()) addButton(4,"Tail Milk",useTailOnZilWhenUWin,undefined,"Tail Milk","Milk his sugary dick with your parasitic tail.");
	else addDisabledButton(4,"Tail Milk","Tail Milk","You need a tail-mounted vagina to do this.");

	addButton(5,"Check Penny",checkOnPenny,undefined,"Check Penny","Check on Penny and make sure she gets the satisfaction she needs.");
}

public function checkOnPenny():void
{
	clearOutput();
	showPenny(true);
	flags["PENNY_CHECKED_ON_POST_ZIL"] = 1;
	//Remove queued up penny using zil.
	for(var x:int = 0; x < eventQueue.length; x++)
	{
		if(eventQueue[x] == pennyGetsHerselfOffOnAZil) eventQueue.splice(x,1);
	}
	if(pc.lust() >= 50) output("You ignore the stirrings in your loins in favor of checking on your fallen comrade.");
	else output("You turn to your fallen comrade out of concern.");
	output(" Penny doesn’t notice you approach at first. She’s too enraptured by the " + (penny.hasCock() ? "leaky pillar of girl-cock she’s presently worshiping":"sensations pouring out of her straining box, augmented by the plunging strokes of three fingers") + ". When you clear your throat and kneel next to her, the poor girl sheepishly moans, <i>“Please... h-help.”</i> Her eyes are wide and searching, but her legs fall even further open at the sight of you.");
	output("\n\nRather than adding another set of hands to the already crowded space around the vixen’s sloppy, leaking genitals, you take her by the back of the head and lean over to give her a kiss. The moment your [pc.lipsChaste] contact hers, Penny’s frame seizes. Her back arches, and she grabs your [pc.thigh] in one fluffy paw, squeezing dangerously hard. " + (penny.hasCock() ? "Hot ropes of fox-cum spill onto the forest floor":"A torrid flow of pussy-juice spools out onto the forest floor") + " as she finally achieves the climax she so desperately needs. Her tongue spears deep into your maw in that long moment, wrestling with your own, before she sags back bonelessly, panting for breath.");
	output("\n\n<i>“Th-thanks,”</i> Penny groans, unthinkingly licking her sex-juices from her sodden fingertips. <i>“I’ll be more help next time.”</i> She fumbles around for her shotgun. <i>“Promise.”</i>\n\n");
	CombatManager.genericVictory();
}

//Use a victory
public function pennyGetsHerselfOffOnAZil():void
{
	clearOutput();
	showBust(pennyBustDisplay(),"ZIL_RED");
	showName("PENNY’S\nSATISFACTION");
	output("Penny separates herself from a fallen zil around the same time as you, standing up from the face of a gasping bug-man with a sheepish look on her face. <i>“Sorry I wasn’t much help in the fight. I guess all that time jilling off in my office to that smell... made me easy prey for them.”</i> She pulls up her pants and grabs her shotgun off the ground. <i>“Hopefully that’s the last we’ll see of them, huh?”</i>");
	output("\n\nYou don’t mention that her nipples are hard enough to be seen through her coat" + (penny.hasCock() ? " or that her [penny.cock] makes a lovely bulge in her pants":"") + ".\n\n");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function setupPennyQuestDungeon():void
{
	currentLocation = "PQUEST_U8";
	generateMap();
	mainGameMenu();
}

//Pod Discovery:
public function podDiscoveryBonus():Boolean
{
	if(!CodexManager.entryUnlocked("Venus Ziltraps"))
	{
		clearOutput();
		showBust("VENUS_ZILTRAP",pennyBustDisplay(),"VENUS_ZILTRAP");
		showName("VENUS\nZILTRAPS");
		author("Fenoxo");
		output("A pair of green-tinted pods hang suspended between the ceiling and floor on stalks thicker around than Penny’s leg. Pretty flower petals sit at their top, but less appealing is their bulbous surfaces, oddly lumpy and distended. As you watch, one begins to shift and writhe. Something inside that verdant membrane is contorting about wildly, gyrating such that you can see straining elbows and the outline of a one hand, then another. They vanish, replaced by a foot with curling toes, then cease all movement as the person inside goes limp.");
		output("\n\nWhile you grapple with what you just saw, Penny points out the pile of discarded possessions below: laser pistols, a shield belt, and the sort of casually worn clothing you’d expect to find on a down-his-luck smuggler. <i>“I think we found out what happened to our criminal’s buddies.”</i> She paces in a slow circle around the pods, thinking.");
		output("\n\nYour Codex chooses that moment to chime, <i>“Warning, new species detected. Not present in galactic records. Initial scans indicate beings capable of extreme sexual predation. Avoid if possible. Heuristic naming conventions suggest the title Venus Ziltrap.”</i>");
		CodexManager.unlockEntry("Venus Ziltraps");
		output("\n\nThe fox-girl shakes her head. <i>“They might be scum, but we can’t just leave them like this...”</i> She gestures pointedly as both pods stir to life once more. Now that you know what you’re looking at, you can quite identify the frenzied back-and-forth thrusting of hips moving in the throes of orgasm. Penny circles back around, eyes blazing fiercely. <i>“Besides, we’ll need all the help we can get down here.”</i>");
		output("\n\nAware of your expertise in matters Rush-related, Penny waits for you to respond before doing anything rash.");
		processTime(2);
		clearMenu();
		//Choice doesn't matter but give it anyway :3
		addButton(0,"Free Them",freeThoseCapturedSmuggleBros);
		addButton(1,"Don’t",dontFreeThoseCapturedSmuggleBro);
		return true;
	}
	return false;
}

//Free Them
public function freeThoseCapturedSmuggleBros():void
{
	clearOutput();
	showBust(pennyBustDisplay(),"VENUS_ZILTRAP","VENUS_ZILTRAP");
	showName("VENUS\nZILTRAPS");
	author("Fenoxo");
	output("<i>“Go ahead,”</i> you instruct. <i>“I’ll cover you.”</i>");
	output("\n\nPenny yanks a belt knife from its sheath and cautiously advances, free paw extended forward. She gently touches the pod, and when it doesn’t react, she inches the knife forward, bringing the point to bear against a spot near the top, hopefully far enough away from the captive to avoid stabbing into them with the initial cut. She gingerly presses forward, breathing deeply, and when the blade digs into the tough membrane, everything goes sideways.");
	output("\n\nThe pod’s surface explodes almost too fast to follow. First, a crease at the top unfolds into two contorted arms with membranous sheets hanging below. One backhands Penny into the wall. Her knife cartwheels through the air to embed itself in the opposite wall. A seam down the middle reveals itself, then gapes open, dumping a wave of fragrant, sex-and-flower-scented juice across the cave floor - and the captive smuggler: an ausar.");
	output("\n\nWith him out of the way, you can finally see what you’re dealing with - a red-eyed plant-woman of startling beauty, humanoid from the genitals to the top of her head. The supporting stalks grow from the nape of her neck and just beneath her curvaceous buttocks. A dangling, tubular organ connects her loins to the ausar’s crotch all the way away on the ground. The tentacle squelches around his girth while ripples flow upward in esophageal contractions, but she continues to glare at you, hands balled into fists.");
	output("\n\nYou make ready to fight, but the cock-bound ausar is the first to act. He leaps up onto his feet, and with a look of surprising rage, screams, <i>“Leave me alone! I need... need to fuck!”</i> He climbs upward, feet landing in supporting dimples in the membrane, then wraps himself around her waist.");
	output("\n\nThe ziltrap, somewhat placated by this, slowly enfolds him in her arms once more, but when she shapes this pod, she forms it into more compact dimensions in order for her to peak out over the top. Those red orbs follow you warily.");
	output("\n\nPenny stumbles back with a thunderous glower and a bit of blood at the corner of her mouth. <i>“She’s stronger than she looks... but,”</i> she wipes her face against her coat’s collar, <i>“there’s no point in fighting her just to knock him out, much as it pains me to say it. Fuck him and fuck her.”</i> She pauses thoughtfully. <i>“Actually, don’t fuck her. And don’t fuck any of the rest of them. Just fuck them up.”</i> Penny barks out a manic laugh. <i>“Fuck, I’m almost getting as crazy as you, crazy. Let’s just get this done.”</i>");
	output("\n\nYou suppose you can’t save those who don’t want to be saved.");
	processTime(5);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Don’t Free Them
public function dontFreeThoseCapturedSmuggleBro():void
{
	clearOutput();
	showBust(pennyBustDisplay(),"VENUS_ZILTRAP","VENUS_ZILTRAP");
	showName("VENUS\nZILTRAPS");
	author("Fenoxo");
	output("<i>“Wait,”</i> you instruct. <i>“");
	//Bimbo
	if(pc.isBimbo()) output("We might just like, get sucked into those pods and then fucked really, really, really hard ourselves. And while that would be awesome, it would kind of not be awesome because then we couldn’t get to fuck anybody else, ya know?");
	//Bro
	else if(pc.isBro()) output("You poke something with a knife, it’ll poke back. It’s too risky.");
	//Else
	else output("We don’t know anything about these things or what they’re capable of. You cut into one, and you might just piss it off. These things might be capable of spraying out airborne toxins, or stuffing two people at once into those pods of theirs.");
	output("”</i>");
	output("\n\nPenny frowns, on the verge of arguing, then shakes her head. <i>“You’re right, I guess. I just... I guess I just wanted to help, but I wouldn’t even be here if you hadn’t taken down those zil for me.”</i> She takes her hand away from her belt knife and settles her palms back on her tonfas. <i>“And if what that Codex says is correct, it’s probably best we don’t have to tangle with these ziltraps.”</i> She stretches out a paw. <i>“Mind if I skim the data real quick?”</i>");
	output("\n\nYou hand the big-eared vixen your Codex without a second thought. She skims the readout with increasingly wide eyes. By the time she finishes, she’s chewing her bottom lip, and her tail has gone limp. <i>“If what this says is correct, those two are already checked out mentally... and there’s going to be more of these pods ahead - not occupied.”</i> She noisily gulps. <i>“They’ll look like pretty girls with winged arms. Just don’t go hugging any of them or you’re going to fuck yourself over and piss off your mate... a fate I wouldn’t wish on anyone.”</i> A bit of her old bravado returns with a flash of sharp teeth. <i>“Word is she can be a real bitch.”</i>");
	processTime(5);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function pQuestPodCornerFightBonus():Boolean
{
	if(flags["PQUEST_ZILTRAP_RESULTS"] == undefined)
	{
		showBust("VENUS_ZILTRAP",pennyBustDisplay(),"VENUS_ZILTRAP");
		showName("VENUS\nZILTRAPS");
		author("Fenoxo");
		output(", doing their best to look attractive and welcoming. One blows you a kiss, the gossamer-soft inside of her hanging ‘wing’ beckoning you to snuggle into her embrace. The other winks at Penny.");
		output("\n\n<i>“Hey,”</i> the plant-woman’s voice is strangely tonal yet oh-so-welcoming. <i>“Let’s play.”</i> With their arms stretched wide, you don’t think you can slip past them.");
		output("\n\nPenny hazards, <i>“Do you mind letting us by? We’re kind of in a hurry.”</i>");
		output("\n\n<i>“Why hurry when you can play with us?”</i> The suspended plant-girl giggles. <i>“We’ll make you feel soooo good.”</i>");
		output("\n\nSharing a side-long look with the fox, you come to the same conclusion: you’ll have to disable them one way or another. <b>It’s a fight!</b>");
		//start fite
		//Start combat
		CombatManager.newGroundCombat();
		CombatManager.setFriendlyActors(pc,penny);
		var enemies:Array = [new VenusZiltrap(),new VenusZiltrap()];
		enemies[0].assignZiltrapSet(false);
		enemies[1].assignZiltrapSet(true);
		CombatManager.setHostileActors(enemies[0],enemies[1]);
		CombatManager.victoryCondition(CombatManager.ENTIRE_PARTY_DEFEATED);
		CombatManager.victoryScene(winVsZiltraps);
		CombatManager.lossScene(Lose2Ziltraps);
		CombatManager.displayLocation("ZILTRAPS");
		
		this.addButton(0, "Next", CombatManager.beginCombat);
		return true;
	}
	else
	{
		showBust("VENUS_ZILTRAP","VENUS_ZILTRAP");
		if(flags["PQUEST_ZILTRAP_RESULTS"] == 1 && flags["PQUEST_PENNY_PODDED"] == undefined) output(", drooping and half-conscious. When you move, they shy away in fear. You doubt they’ll give you any more trouble.");
		else output(", too busy groping themselves to try to stop you from walking past. When they see you looking their way, one of them moans and thrusts her chest forward desperately. The other’s hand disappears between her legs up to her wrist.");
	}
	return false;
}

//Lose2Ziltraps
public function Lose2Ziltraps():void
{
	var enemies:Array = CombatManager.getHostileActors();
	while(enemies.length > 1)
	{
		CombatManager.removeHostileActor(enemies[1]);
	}
	author("Fenoxo");
	showName("\nDEFEAT");
	showBust("VENUS_ZILTRAP","VENUS_ZILTRAP");
	//Lust
	if(pc.lust() >= pc.lustMax())
	{
		output("The human body can only tolerate so much sexual arousal before the mind collapses under the weight of it. You are well past that point. One moment, you’re watching the verdant temptress tickle your eyeballs with sensuous dancing, and the next you’re stumbling into her very welcoming arms to kiss and snuggle. The ground floats away beneath your [pc.feetOrFoot] as you’re lifted and surrounded. What little light you had is muted in the face of the venus ziltrap’s slickened embrace.");
		output("\n\nShe’s the most gorgeous thing in the world, and judging by the muffled moans to your right, Penny agrees. These confident nymphs are the best. Even something as small as a kiss an erotic treat for your senses. Your [pc.lipsChaste] buzz with sensuous pulses on contact. Your [pc.tongue] is an organ of pure, lurid pleasure, meant to thrust into her soft-toothed maw in search of ever greater excitement.");
		output("\n\nWhen you’re guided lower, to the jutting tip atop a beautifully swollen nipple, your verdant mistress doesn’t have to ask you to suck. You do it on your own. You clamp down to greedily harvest her ambrosial nectar. The flavor is unlike anything you’ve ever tasted. Her lips made your mouth buzz, but her milk breaks down every conception you had about the universe and your body. It breaks your [pc.lipsChaste] and [pc.tongue] into glossy liquid pleasure and writhing, incoherent pleasure.");
		output("\n\nYou can’t resist it’s erotic temptation any more than you could stop yourself from breathing. You suck like your life depends on it. It would take an army assembled from the best soldiers the UGC has to offer just to separate you from this incredible, life-changing nipple, and you’d still fight you way back to it. You’d keep sucking and sucking, just like you are now");
		if(pc.hasCock()) output(", getting so wonderfully hard, your [pc.cocks] rubbing on this cutie’s belly");
		else if(pc.hasVagina()) output(", getting so wonderfully damp, your [pc.vaginas] creating trails of slick dew on this cutie’s thighs");
		else output(", getting so wonderfully sensitive that you could cum just from touching your hungry little pucker.");
	}
	//HP
	else
	{
		output("The moment you collapse is the moment everything goes sideways - literally. The limber seductress you’ve faced grins at you, and with a sweep of her hand, lassos you with a dozen ropy tendrils. She drags you bodily towards her, uncaring that you’re slipping across rocks and mud, but why would she? Once you’re in her clutches, a little dirt won’t stop you from having your orgasms reluctantly milked from your body until you can’t imagine living outside of near-constant climax.");
		output("\n\nSo is it really any surprise that you’re literally roped into her arms, your [pc.chest] pressed against her delicate mounds, your [pc.footOrFeep] lifted on the spongy surface of her hanging ‘wings’? Not really. Nor are you surprised when she presses your dazed head against one of her nipples, rubbing your cheek in small circles with a fingertip to stimulate your rooting surface.");
		output("\n\nTo your credit, you don’t latch on and start suckling yourself into subterranean servitude immediately. You resist the urge quite well, in fact... until a trickle of fluid splatters against your lower lip. You’re licking it clean before you realize what you’re doing, but the damage is already done. Your mouth lights up with delight. Your heartbeat doubles, the stressed muscle feeling like it’s going to burst out of your chest. Its dazzling flavor leaves you seeing stars, and feeling like one too. You’re suddenly full of vitality... and suckling for more.");
		output("\n\nYou can’t be blamed for it. Anyone who tasted this ambrosial treat would come racing back for more, fighting and killing to have the first taste of it, but you don’t have to. <b>It’s in your mouth right now.</b> You can suck, and suck, ");
		if(pc.hasCock()) output("and get so wonderfully hard, your [pc.cocks] rubbing on this cutie’s belly");
		else if(pc.hasVagina()) output("and get so wonderfully damp, your [pc.vaginas] creating trails of slick dew on this cutie’s thighs");
		else output("and go so wonderfully sensitive that you’d cum just from tucking your hungry little pucker");
		output(".");
	}//Merge
	output("\n\nIt’s dark inside the ziltrap’s embrace, yet it’s hard to mind when you’re snuggled this tightly to someone so pretty. She’s all around you, her body designed to cradle you from every angle. She’s equal parts beautiful bed-warmer and blanket, and the more you drink, the more you want to spend eternity as her personal cuddleslut. You" + (pc.hasGenitals() ? "r genitals":"") + " throb with worrying levels of erotic anticipation in the background of your mind, but who cares? You want to hold her, and you want to <b>suck</b>.");
	output("\n\n<i>“I knew you’d like it. My sisters told me you would... that one little suck and you’d be happy to stay with me forever!”</i> The plant-woman kisses your forehead. <i>“You’re just so yummy! I never thought I’d get so lucky with my first pet, but well... you’re so young. I’ll get to play with you for <b>decades</b>! Stars, even your sweat is good!”</i> The pod ripples slightly, rubbing up and down your back affectionately, sopping up your secretions. <i>“You’re like, the piece of me that’s been missing all this time, and I’m going to make you so <b>happy</b>!”</i>");
	output("\n\nYou murmur... something into her leaky nipple, but no matter how perfect a being your new lactic mistress is, you can’t bear to pull yourself away long enough for something as mundane as talking, not when more of her sinfully sweet syrup is oozing over your tongue, bathing you in a euphoric high of raw affection and desire. Still, you hope she understands how excited you are to spend the rest of your life here with her, held tight in her heavenly embrace. If only you could pay her back for making you feel so good.");
	//Cock drool
	if(pc.hasCock()) output("\n\nThe venus ziltrap must know, however. Your [pc.cocks] " + (pc.cockTotal() == 1 ? "is":"are") + " broadcasting your feelings on the matter quite clearly. Thick streams of pre issue forth entirely without the need for further stimulation. You’re just that excited. All the touches and kisses and most of all the taste of that confusingly erotic milk makes you a very leaky [pc.boyGirl] indeed." + (pc.cumQ() >= 1000 ? " As a matter of fact, you’re not sure your pre-cum has ever come out this thick before. It runs down your legs in lurid streams, puddling around your [pc.footOrFeet] in admission of just how hot for this cute plant-gal you are.":" Indeed, in the brief moments in between explosions of euphoric love, you have a split-second to notice just how much pre-cum is pouring out. You’ve never been quite this productive before.") + " Something in her milk must be doing it, making you a fountain of drippy cock-nectar.");
	//vagina drool
	if(pc.hasVagina()) 
	{
		output("\n\nMaybe she will appreciate the copious flow between your " + (pc.legCount <= 1 ? "[pc.thighs]":"[pc.legs]") + ". ");
		if(pc.isSquirter()) output("You’re a squirting, gushing mess of a [pc.boyGirl] in the best of times, but you feel like a flood down there, like a lusty tide is cresting inside you and splashing down to " + (pc.hasCock() ? "the puddle of mixed sexjuice around":"create a slippery puddle around") + " your [pc.footOrFeet].");
		else output("You’re not usually so productive, but if you came right now, you’d squirt. You’re sure of it. Rivers of [pc.girlCum] stream down the insides of your [pc.thighs] " + (pc.hasCock() ? "to mix with pre-cum below":"to create a deepening puddle of liquid anticipation") + ".");
		output(" Idly brushing " + (pc.totalVaginas() > 1 ? "a pair of":"your") + " netherlips, you recoil at how plush and swollen they feel. Your cunt" + (pc.totalVaginas() > 1 ? "s are":" is") + " swollen almost double with desire. The milk is definitely doing this: making you horny and wet. You gulp down more almost mindlessly. You’ll gladly consign yourself to life as a sloppy-cunted nymphomaniac in exchange for another slurp.");
	}
	var milking:Boolean = false;
	//Dicknipples
	if(pc.hasDickNipples())
	{
		output("\n\nLike " + (pc.totalNipples() == 2 ? "twin":"a swarm of") + " vipers, your [pc.dickNipples] burst forth from their concealing sheath to jut uselessly in the air");
		if(pc.hasCock()) output(", already drooling as lavishly as the prick" + (pc.totalCocks() > 1 ? "s":"") + " below");
		else output(", fiendishly hard and dripping with streams of torrid, anxious pre");
		output(". They want to cum. They ache to cum. Maybe you will soon. Maybe if you swallow enough of this intoxicating nectar, you’ll squirt even fatter, thicker ropes for this plant-woman to feast upon. Somehow, you think you’d like that, but you’re too focused on drinking and dribbling to summon more than a flicker of arousal-addled cognition.");
	}
	//Have milk milkdrool
	else if(!pc.hasCock() && pc.canLactate())
	{
		milking = true;
		if(!pc.isTreated()) output("\n\nIs it any surprise that your [pc.milk] starts to spray out entirely of its own volition? Of course it should. That’s how these creatures work! You milk them, and they milk you... of every sensual secretion your body can produce.");
		else output("\n\nThe sudden pressure of erupting [pc.milk] bursting from your [pc.nipples] actually startles you enough to slow your sucking, but only for that second. You’re a dedicated nipple-slut now. So what if something in this nectar is making you dribble like a pent-up dairy cow? It’s only fair that you give back. You drink from her, and she’ll drink from you.");
		output(" Your [pc.nipples] swell fatter and heavier, sagging beneath their lurid inner weight, and the streams thicken further. It’s relaxing in its own way. Pressure surges and ebbs. The repeated cycles of tension and exquisite relief only grow more pleasurable as the flow increases. A tear of sublime joy slides down your cheek when you realize that it’s never going to stop, not as long as you suckle.");
	}
	//No dick no milk
	else if(!pc.hasCock())
	{
		output("\n\nThe warmth in your heart fans out until it’s in your chest" + (pc.biggestTitSize() >= 1 ? "... and your [pc.fullChest]":" and your [pc.nipples]") + ". Not just warmth either but heat, a torrid burning sense of fullness and engorgement that has you breathing hard and wincing as this... something builds to a torturous head. You whimper. An bloom of ruinously pleasurable relief bursts on your left side, then the right a split-second later, coursing in pleasant rivers down your [pc.belly]. You’re lactating! And it feels <i>good</i>. Now that you’ve let down for the first time, the [pc.milkNoun] can rush out in ever-thickening flows. You can enjoy the feel of your [pc.nipples] fattening and your [pc.chest] swelling. You can revel in the knowledge that every sip of nectar you take from this sweet little nymph is paid back in rivers of your own fresh-milked cream.");
	}
	processTime(30);
	pc.changeLust(500);
	clearMenu();
	addButton(0,"Next",badEndToZiltrap2);
}

public function badEndToZiltrap2():void
{
	clearOutput();
	author("Fenoxo");
	showName("\nDEFEAT");
	showBust("VENUS_ZILTRAP","VENUS_ZILTRAP");
	output("The venus ziltrap shifts you to her other nipple before your constant nursing grows painful, and you let her. Placidly, you look up at her with dull eyes while she guides you into place. She smiles down at you, patting your head when your eyes drift closed and your mouth fills with her sublimely satisfying nectar. <i>“There you go! Wow, you’re getting so leaky, and it tastes sooo good!”</i> The pleasure in her voice is radiant. <i>“You’re going to love being my loving, cummy little foodslut! I’ll feed you everything you need to stay healthy and drippy, and you’re going to make it all into the yummiest, titty-swellingest treats a girl like me could want!”</i> She sighs deliriously. <i>“F-f-fuck you haven’t even cum yet, and I can already feel my tits plumping up.”</i> She pulls your head into a burgeoning green breast, and it wobbles against your cheek. <i>“I’m going to have so much of my happy juice for you to drink... and I haven’t even <b>fucked</b> you yet.”</i>");
	output("\n\nYou moan in approval, sloppily leaking nectar down your chin.");
	output("\n\n<i>“You’re going to love this so much you’ll forget how to think!”</i> Soft fingers stroke your head. <i>“But that’s okay, because I’ll take care of you. You just focus on feeling really good. That’s all I want you to do. Feel as good as you can, okay?”</i>");
	output("\n\nA single, solitary pulse of worry is all the protest you manage before the next gluttonous gulp smooths it under another surge of mind-blanking complacency. You drink deep and squirm around while the ziltrap manhandles you this way and that to line you what for whatever she has planned. One handed, she squeezes your hip, and in that brief moment of contact, you sense nothing but endlessly deep and infinitely abiding love. You swoon and shiver, intoxicated on raw affection... and a little milk.");
	var x:int = 0;
	if(pc.hasCock() && pc.cockThatFits(enemy.vaginalCapacity(0)) < 0) x = pc.biggestCockIndex();
	//No dick fits but has bigdick
	if(pc.hasCock() && pc.cockThatFits(enemy.vaginalCapacity(0)) < 0) output("\n\nRather than guiding your [pc.cockBiggest] into her receptive twat, the plant-woman grinds herself along the enormous bulk all the way to the [pc.cockHeadBiggest]. There, she pauses, and with a bemused titter, stuffs her fingers into her cunt. <i>“You’d break me in half if I... mmph... didn’t have something to stretch out and hold you, you beast!”</i> Sure enough, you feel her hands stretching <i>something</i> across your colossal column of cock, something as wet and tight as her cunt should be. You blink your eyes open. It takes an enormous amount of effort to do. Looking down, you see what she’s done: produced a connective tube from her pussy and stretched it over your [pc.cockBiggest].");
	//Regular dick
	else output("\n\nThe sensuous slickness of an alien vagina kisses your [pc.cock] for all of one whole second before thrusting itself over you with inhuman greed. The ziltrap swallows you to the root instantly, lips smushed flat against your [pc.sheath]. Then she pulls her hips back, but... you’re still inside her cunt. She’s still tight and wet, and your shaft is blessed with the near frictionless embrace of a taut, hungry cunt. You blink your eyes open. It takes an enormous amount of effort to do. Looking down, you see a green tube protruding out from her crotch, secured tightly to your own.");
	//Merge
	output("\n\n<i>“There we go. Snug as bug in a plant-girl’s rug!”</i>");
	//Big dick only:
	if(pc.hasCock() && pc.cockThatFits(enemy.vaginalCapacity(0)) < 0) output("\n\nThe tube <i>ripples</i> in a toe-curling pleasant way, drawing itself an inch further down your length. Before you’ve even recovered, it does it again. More and more of your [pc.cockBiggest] vanishes into the tight, suckling confines of her vaginal tube, tight and wet. It embraces you with the near frictionless embrace of a hungry cunt, forcing you to twitch, your bound breeding tool spasming with violent eruptions of pre.");
	//Merge
	//If nodick & haspussy:
	if(!pc.hasCock() && pc.hasVagina()) 
	{
		output("\n\nThe heated touch of two pussies kissing drowns in you sublime, sapphic pleasure, but it’s what follows that " + (pc.hasToes() ? "curls your toes":"sends your [pc.thighs] into spasming convulsions") + ". Something burrows out of her into you: a long tubular organ with a rounded head that’s already soaked in the plant-girl’s secretion. Even if you weren’t more sopping-wet than a dish sponge, she’d be able to take you easily. She splits you in half. That long, inconceivable cunt-shaft spears into what feels like the very core of your being, suffusing you with pleasure beyond measure and a vague sense that you never want it to leave.");
		output("\n\n<i>“There we go. It’s might seem like a snug fit now, but the more of your </i>yummy<i> juices it soaks up, the bigger it’ll get, so you’ll always feel this full, no matter how I stretch you out! Isn’t that great!”</i>");
	}
	//If neither genitals
	if(!pc.hasGenitals())
	{
		output("\n\nThe fingertips that once sprouted vines to draw you closer once more unfurl again. This time, the tendrils that emerge are hollow and tipped with wide, suction cup-like tips. They pile onto your swollen, spraying chest in a pile, slipping and sliding across [pc.milkNoun]-moistened [pc.skinFurScales]. Their fervent wriggles feel divine. The coiling, twisting vines writhe with endless hunger. One a time, they find your " + (pc.hasDickNipples() ? "[pc.dickNipples]":"[pc.nipples]") + ", and with authoritative wiggles, mount themselves upon your ripe, spurting tits. They begin to suck almost immediately.");
		output("\n\n<i>“Annnd it wouldn’t be a <b>fucking</b> if somebody didn’t get stuffed...”</i>");
		output("\n\nA fatter tentacle sliders across your taint and up to the crack of your [pc.butt], jutting assertively against your [pc.asshole]. You whimper, but it’s oily and slick. Looking down, you notice its source: her pussy. She’s about to fuck your ass with a tentacle from her pussy! Groaning herself, the plant-girl pushes it up onto your rosebud and wiggles it back and forth, smiling knowingly when your flesh can’t help but cave in and accede to her amorous demands, the milk making you soft and accepting, relaxed to better take her thrust deep into your rectal.");
		pc.buttChange(enemy.cockVolume(0));
		output("\n\nIt shouldn’t feel this good to be buttfucked - shouldn’t be this mind-shatteringly pleasurable, but it is. Your stuffed sphincter parts wider and wider, slick with her juices and tingling just so, and in the space of a few seconds, you begin to urge her onward, wanting her to take you deeper, to pound your ass until it’s a tingling circle of confused, rectal pleasure.");
	}
	//[Next]
	processTime(15);
	pc.changeLust(100);
	clearMenu();
	addButton(0,"Next",stillLosingToZiltraps,x);
}
public function stillLosingToZiltraps(x:int):void
{
	clearOutput();
	author("Fenoxo");
	showName("\nDEFEAT");
	showBust("VENUS_ZILTRAP","VENUS_ZILTRAP");
	output("The first orgasm of your new existence sneaks up on you, not because of some sudden action by the venus ziltrap but because you’ve felt so good for so long that the cusp of climax was starting to seem like any other moment in this cornucopia of exquisite bliss. Yet when it hits, it hits with authority. Your eyes roll back.");
	if(pc.hasCock()) 
	{
		output(" Your [pc.cock " + x + "] floods its encapsulating tendril");
		if(pc.cockTotal() > 1) output(", and the extra" + (pc.cockTotal() > 2 ? "s":"") + " go off alongside it, dumping out flows sperm-rich enough that they might as well be yogurt");
		output(".");
	}
	else if(pc.hasVagina()) 
	{
		output(" Your [pc.vaginas] squirt like " + (pc.totalVaginas() == 1 ? "a faucet with the tap":"faucets with the taps") + " smashed off.");
	}
	if(!pc.hasCock()) output(" Even more [pc.milk] issues forth, straining the finger-thin tubes with golf ball-sized distentions as they wick into her body.");
	output("\n\n<i>“Yessss...”</i> the ziltrap coos, relishing your climactic offerings like the finest dessert. <i>“You taste so good. Different than the dregs I get through the root network. You’re unique.”</i> She pets your head as you spasm, your [pc.hips] pistoning lamely, eyes rolled back. It’s fortunate she’s there to hold you against her nipple so that you can drink, even if the tit it’s attached to is expanding steadily, pushing you back as it floods with sweeter, creamier, <b>stronger</b> nectar.");
	output("\n\nYou whimper in insensate delight. Her words, kind as they are, impact the surface of your mind without entirely registering. Complex thoughts like verbs and nouns are impossible to process when you’re cumming this hard. Your psyche vibrates like a plucked guitar string as every ounce of your mental prowess struggles to cope with the artificially enhanced orgasm, each blast of bliss so potent that it carves tingling pleasure-paths through the parts of you that would worry about things like probes, or bills, or leaving.");
	output("\n\n<b>This feels so good.</b>");
	output("\n\nOf course the orgasm ends, eventually, but it does not satisfy. It was too good, and too strong. The swallows of happy, tingling milk keep your body ready and raring to go" + (pc.hasCock() ? ", your [pc.cocks] so intensely hard that you can discern every slick fold inside your imprisoning sheath":", your [pc.vagOrAss] so engorged with lust that you can discern every ridge and nodule along that intruding shaft") + ". You squeeze your lovely green mistress and nuzzle her big fat tits, rocking your hips against her with powerful pumps. You don’t need to think to hump, and swallowing is even more automatic.");
	output("\n\nYou float in a ever intensifying fog of lust so strong it feels like love, and when you climax for the second time, you sort of forget how you got here.");
	output("\n\nBut you want to do it again. You want to cum so hard you forget your name.");
	output("\n\n<i>“I know,”</i> the ziltrap coos, kissing you on your forehead again. <i>“You can cum as much as you want. As often as you can. My sisters and I are so thirsty, and you are so, so sweet.”</i> ");
	if(pc.hasCock()) output("The tube squeezing your dick milks a fat wad of pre-cum, half-white with the glut of excess sperm your body produces.");
	else if(pc.hasVagina()) output("The tube in your cunt strains your lips as it pops out a big swell of excess [pc.girlCum].");
	else output("The tubes on your " + (pc.hasDickNipples() ? "[pc.dickNipples]":"[pc.nipples]") + " suck harder, which only makes your tits feel fatter and heavier and even milkier than before.");
	output(" <i>“You don’t have to worry about your friend. She’s cumming too. Almost as much as you, and she tastes almost as nice! I’m getting hints of it through the roots, and I’m glad I’m the one that got you. Now just relax and enjoy yourself. We’ll all cum together.”</i>");
	output("\n\nYou cum.");
	output("\n\nIt doesn’t stop.");
	pc.orgasm();
	pc.changeLust(200);
	badEnd();
}

//Win Vs Ziltraps
public function winVsZiltraps():void
{
	var enemies:Array = CombatManager.getHostileActors();
	while(enemies.length > 1)
	{
		CombatManager.removeHostileActor(enemies[1]);
	}
	showBust(pennyBustDisplay(),"VENUS_ZILTRAP","VENUS_ZILTRAP");
	showName("\nVICTORY");
	author("Fenoxo");
	var newScenes:Boolean = false;
	if(enemy.HP() <= 0) flags["PQUEST_ZILTRAP_RESULTS"] = 1;
	else flags["PQUEST_ZILTRAP_RESULTS"] = 2;
	//Penny not captive
	if(flags["PQUEST_PENNY_PODDED"] != 1)
	{
		//HP win
		if(enemy.HP() <= 0) output("Slumping into near unconsciousness, the venus ziltraps cease their whorish teasing and resort to depressive pouts. <i>“Fine. Just leave. You don’t deserve to feel what we can do for you.”</i>");
		//Lust win
		else output("The venus ziltraps abandon their carefully worded teases for a simpler, raw tact: stuffing both hands into their cunts and vigorously masturbating. With their eyes rolled back and their words melted down into mewling moans, they’re in no position to threaten you, let alone grab you. You can go on in peace.");
		//Neither is horny.
		if(pc.lust() < 33 && penny.lust() < 33)
		{
			output("\n\nSomehow you and Penny prevailed without being afflicted by any significant amount of lust, and after sharing a nod, prepare to move on. Those smugglers may not have stood a chance, but you’re confident you can breeze through the rest of this cave unscathed.\n\n");
			CombatManager.genericVictory();
			return;
		}
		//Penny is horny: new PG
		else if(penny.lust() >= 33)
		{
			output("\n\n<i>“Mate...”</i> Penny drawls, turning to you. <i>“Ohfuck I’m so horny.”</i> She drops to her knees, waddling closer" + (!penny.hasCock() ? " with her pussy just hanging out":" with her [penny.cock] just hanging out, leaking everywhere") + ". <i>“I <b>need</b> to cum.”</i> She whimpers and touches herself, looking from the pitchers to you. <i>“And th-they’re too dangerous. Take me. Take me, mate. It has to be you. Fuck your bitch vixen!”</i>");
			output("\n\nSince she asked nicely...");
			newScenes = true;
		}
		//Penny not horny but you are
		else
		{
			output("\n\n<i>“Mate...”</i> Penny murmurs, noticing your state, <i>“let’s take care of you before we go any farther. The way you’re looking, you’d be easy prey for the next set of these we stumble into, and I know you’re crazy, but not even you are <b>that</b> crazy.”</i> She stalks closer. <i>“What kind of mate would I be if I didn’t satisfy whenever you got like this? I can smell how badly you need it. Come on. I’ll have you calmed down in a moment. Any suggestions, or should this big bad fox just gobble you up?”</i>");
			//Modified normal scenes.
		}
	}
	//Penny captive
	else
	{
		output("The moment the lithe plant-woman " + (enemy.HP() <= 0 ? "sags in defeat":"gives up on teasing and resorts to frenzied masturbation") + ", you rush into action to save Penny. Her pod is sealed tight and squirming, but if you reach up near the top, you can hook your fingers into the crease of the pod’s elbow and pull. It resists for a moment, but you’re determined to save your friend. You heave until at last, the curvaceous temptress yields, spilling Penny to the floor with a faraway look in her eyes, a long tube still greedily " + (!penny.hasCock() ? "pumping in her cunt":"coaxing her [penny.cock] to pulse out thick flows of pre") + ".");
		output("\n\nYou yank the slimy tentacle away ");
		if(pc.libido() < 33) output("with a look of disgust");
		else if(pc.libido() < 66) output("while trying not to think about how good it must feel");
		else output("with a pang of wanton jealousy");
		output(", then drag the giggling, horny vixen a safe distance away.");
		output("\n\n<i>“Oh fine! Keep her then. She didn’t taste very good anyway.”</i> The motherly-looking woman scowls, folding her arms around herself protectively. <i>“Sky-sluts like you are more trouble than you’re worth.”</i>");
		output("\n\n<i>“Mate,”</i> Penny purrs with near feline satisfaction, <i>“you saved me. You saved me from the pod.”</i> She leans into you, lovingly, smelling faintly of flowers and nectar, her lips glossy with something she must have drank while inside. <i>“I love you.”</i> She humps and grinds against your [pc.thigh]. <i>“I love you so much, and I need you. The pretty plant-girl made me so horny and so " + (penny.hasCock() ? "hard":"wet") + ", but I want <b>you</b> to use me. I want you to " + (pc.hasCock() ? "breed me":"claim me") + " as often as you want. I don’t care what it does to me, but I need to cum for you.”</i> She licks you from your chin all the way up to your [pc.ear], drooling sloppily onto your collar. <i>“Take me, [pc.name]. Fuck your bitch vixen before those sexy green cunts ruin her.”</i>");
		output("\n\nPenny’s not giving you much of a choice. If you don’t satisfy her now, her overstimulated passions might drive her back into the arms of that creature...");
		pc.lust(10);
		newScenes = true;
	}
	if(newScenes)
	{
		if(pc.hasCock())
		{
			if(pc.cockThatFits(penny.vaginalCapacity(0)) >= 0) addButton(0,"Fuck Penny",cockSelect, [fuckPlantHornedPennyWithDick, penny.vaginalCapacity(0), false,0],"Fuck Penny","Stuff your dick into her greedy pussy and give her the relief she so desperately craves.");
			else addDisabledButton(0,"Fuck Penny","Fuck Penny","Your dick doesn’t fit.");
			if(pc.biggestCockVolume() > penny.vaginalCapacity(0)) addButton(3,"Huge Dick",druggedPennyLovesThatHypercock,undefined,"Huge Dick","Since you’re packing a behemoth wayyyy too big for Penny to take, simply present her with it and let her focus her enthusiasm on your more-than-blessed flesh.");
			else addDisabledButton(3,"Huge Dick","Huge Dick","Your [pc.cocks] " + (pc.cockTotal() == 1 ? "isn’t":"aren’t") + " huge enough for this.");
		}
		else 
		{
			addDisabledButton(0,"Fuck Penny","Fuck Penny","You need a penis to fuck her with.");
			addDisabledButton(3,"Huge Dick","Huge Dick","You need a huge dick for this.");
		}
		if(pc.hasVagina())
		{
			if(penny.hasCock()) addButton(1,"RideHerCock",vaginaRouter,[fuckPlantHornedPennyDickRide,penny.cockVolume(0),0,0]);
			else addDisabledButton(1,"RideHerCock","Ride Her Cock","Penny doesn’t have a dick to fuck your pussy with.");
			addButton(2,"Tribbing",fuckPlantHornedPenny,[3,0],"Tribbing","Rub out your frustrations, pussy-to-pussy.");
		}
		else 
		{
			addDisabledButton(1,"RideHerCock","Ride Her Cock","You don’t have a vagina for her to fuck.");
			addDisabledButton(2,"Tribbing","Tribbing","You don’t have a vagina to trib with.");
		}
		addButton(4,"Give Oral",oralDatPenpenMcPennyPostZiltrapFight,undefined,"Give Oral","Ignore your own body to focus on satisfying hers.");
	}
	//PC is the only horny boy
	else
	{
		clearMenu();
		if(pc.hasCock()) 
		{
			if(penny.hasCock()) this.addButton(0,"Frottage",pennyFrottage,undefined,"Frottage","Grind dicks with Penny.");
			else this.addDisabledButton(0,"Frottage","Frottage","This scene requires Penny to have a dick.");
			this.addButton(1,"Pawjob",penniliciousPawjob,undefined,"Pawjob","Get a fluffy footjob from Penny.");
		}
		else
		{
			addDisabledButton(0,"Frottage","Frottage","You don’t have a penis.");
			addDisabledButton(1,"Pawjob","Pawjob","You don’t have a penis.");
		}
		this.addButton(2,"EatHerOut",gardeFordWritesPennySmex,undefined,"EatHerOut","Eat out Penny.");
		addButton(14,"Leave",CombatManager.genericVictory);
		output("\n\n");
		
	}
}
public function inPennyQuest():Boolean
{
	return (currentLocation == "PQUEST_M4");
}

//Do a function wrapper since cockSelect can only pass X:
public function fuckPlantHornedPennyWithDick(x:int):void
{
	fuckPlantHornedPenny([1,x]);
}
//Do a function wrapper since vaginaRouter can only pass X:
public function fuckPlantHornedPennyDickRide(x:int):void
{
	fuckPlantHornedPenny([2,x]);
}

//Horned Up Penny pushed down and {dicked/tribbed}. Confesses lots of love. If plant drugged, cums an extra time and squirts copiously, drenching you.
public function fuckPlantHornedPenny(args:Array):void
{
	var sceneRoute:Number = 3;
	if(args.length > 0) sceneRoute = args[0];
	var x:int = 0;
	if(args.length > 1) x = args[1];
	clearOutput();
	showPenny(true);
	author("Fenoxo");
	IncrementFlag("SEXED_PENNY");
	//Not nudiepants
	if(!pc.isCrotchExposed())
	{
		output("You strip briskly");
		if(pc.hasCock()) output((pc.isErect() ? ", baring your hard [pc.cocksNounSimple] to the passion-addled vixen":", your [pc.cocksNoun] rising to full mast for the passion-addled vixen"));
		else if(pc.hasVagina()) 
		{
			output(", exposing the cleft of [pc.oneVagina]");
			if(pc.totalVaginas() > 1) output(", then the " + (pc.totalVaginas() == 2 ? "next":"rest"));
		}
		output(".");
		if(pc.hasVagina()) output((pc.lust() >= 50 ? " You’re already nice and slick with feminine dew from the fight.":" A warm wet feeling sloshes around inside from the way the fox stares at you."));
	}
	//Nudiepants
	else
	{
		output("You smile down at Penny, whose eyes stare longingly at the ");
		if(pc.hasCock()) output((!pc.isErect() ? "rapidly firming":"fully erect") + " bulge" + (pc.cockTotal() > 1 ? "s":"") + " sprouting from your loins.");
		else if(pc.hasVagina()) output((pc.wettestVaginalWetness() >= 3 ? "sopping":"increasingly moist") + " slit" + (pc.totalVaginas() > 1 ? "s":"") + " nestled as deeply in your loins as buried treasure.");
	}
	//Merge
	output("\n\n<i>“You’re gonna do it? Right here?”</i> Penny lurches forward, crawling closer until her nose all but bumps into " + (pc.hasCock() ? "[pc.oneCock]":"[pc.oneVagina]") + ". She takes a long, hungry sniff. Her ears sag down like deflating balloons, folding flat against the back of her head as her eyes dilate with unnatural excitement. <i>“Fuck yes.”</i>");
	output("\n\nYou push the " + (flags["PQUEST_PENNY_PODDED"] == undefined ? "pheromone-dosed":"heavily drugged") + " fox down, and she tumbles flat onto her back with her legs wide open in passive, eager acceptance.");
	if(penny.hasCock()) output(" Her [penny.cock] juts high, leaking excitedly" + (penny.balls > 0 ? ", her balls quivering and wet with leaking vaginal juices behind":"") + ".");
	else output(" Her soaking wet cunt hangs out in the open, lips pulled ever so slightly apart to display the glossy tunnel behind.");
	output(" Penny wiggles her crotch back around in quick little figure eights to tempt you closer, not that she need do any such thing. The moment she started begging for it, you know you wouldn’t be able to resist satisfying your favorite law-woman’s needs.");
	output("\n\nYou’ll both get to enjoy this.");

	//Cock in cunt
	if(sceneRoute == 1) 
	{
		output("\n\n" + (penny.balls > 0 ? "Lifting up her wobbling balls and l":"L") + "ining your [pc.cockNoun " + x + "] up with " + (penny.balls == 0 ? "her cunt":"the half-smothered cunt behind") + ", you settle your passionate partner down with a firm press of one palm a few inches above her mound. She mewls but lifts her legs to rest them on your shoulders, knees kept wide to give you as big a target as possible. When you thrust in, claiming that velvet vice for your own, you can feel the firm distention moving up her midsection, stretching the fox’s channel to match your rigid, bulging shape.");
		pc.cockChange();
	}
	//Ride Her Cock
	else if(sceneRoute == 2) 
	{
		output("\n\nClimbing over her belly, you agonizingly try to line your [pc.vagina " + x + "] up with the fox’s too-swollen member, but her restless motions make it more than a little challenging. She grins stupidly up at you, dick bouncing and grinding against your [pc.clit] until you give up and stop moving. That’s all the cue Penny needs. Grabbing you by the hips, she plows her [penny.cockNoun] straight into your cunt, spreading you wide. It’s so wet with pre-cum that it slides in as easily as a dildo left to marinate in lubricant overnight, only this vulpine toy can pulse with effervescent warmth against your most sensitive nerves and douse them with rhythmic jets of pre.");
		pc.cuntChange(x,penny.cockVolume(0));
	}
	//Trib
	else
	{
		output("\n\n" + (penny.balls > 0 ? "Lifting up her wobbling balls and l":"L") + "ining your [pc.vaginas] up with Penny’s, you settle your passionate partner down with a firm press against her sternum. She mewls in disappointment that you are grabbing one of her big fat tits to grope and squeeze, but when you slide forward, clapping your cunt" + (pc.totalVaginas() > 1 ? "s":"") + " to hers, that mewl transforms into a whimpering, ecstatic sigh. She meekly rocks back against you. Her fragrant cunt is slicker than a galotian in a lube bath and more pleasant to drag your [pc.clits] through than vibrating gel beads.");
	}
	//Merge
	output("\n\n<i>“Ohhhh, mate!”</i> Penny’s tongue flops out of her wide-open maw as she stares disbelievingly up at the cave ceiling. <i>“I’m so fucking " + (penny.hasCock() ? "hard":"wet") + ", and you feel so cunt-destroyingly good!”</i> She shivers from head to toe. One of her hands reaches for her own chest, intent on squeezing a nipple, but falls flat halfway, scrabbling nervelessly in the dirt. ");
	if(sceneRoute == 1) 
	{
		if(!penny.isSquirter()) output("A dribble of girlcum trickles down " + (pc.balls == 0 ? "your [pc.knot " + x + "]":"your [pc.balls]") + ".");
		else output("A spray of girlcum bathes your " + (pc.balls == 0 ? "your [pc.knot " + x + "]":"your [pc.balls]") + " in torrid bliss, pudding under your [pc.butts].");
	}
	else if(sceneRoute == 2) output("A womb-pleasing burst of warmth explodes against your cervix, thumping into you with virile authority.");
	else output((!penny.isSquirter() ? "A drizzle of girlcum heats your [pc.clits] with evidence of the fox’s passionate state.":"An explosion of torrid heat washes over your [pc.clits] as the fox’s supercharged libido causes her to squirt not just once but thrice. She power washes your crotch with steaming, feminine honey, leaving it to puddle beneath your [pc.butts]."));
	output("\n\nGood as it feels, you haven’t quite cum yet, so you continue to ");
	if(sceneRoute == 1) output("thrust");
	else if(sceneRoute == 2) output("bounce");
	else output("rub");
	output(", watching your climaxing companion’s face become ever more obscene. Drool puddles in the nape of her neck, and her eyes briefly cross before rolling back. Her once carefully groomed mohawk has fallen into disarray with most of it matting down under a coat of soggy sweat. The black nostrils at the tip of her muzzle flare powerfully with each ");
	if(sceneRoute == 1) output("pussy-pounding, titty-jiggling hump.");
	else if(sceneRoute == 2) output("titty-jiggling, pussy-pleasing bounce.");
	else output("slicky-sweet sapphic shift of your hips.");
	//Dick only
	if(sceneRoute == 2) output("\n\nPenny’s [penny.cockNounSimple] refuses to go soft inside you. The overstimulation keeps it nice and rigid, pulsating with wonderful aftershocks.");
	//Merge
	output("\n\n<i>“Ah! Ah! Ahhh!”</i> the vixen screams, voice echoing down the tunnel, <i>“I love you [pc.name]! Mmmmph! I love you so much!”</i> Bucking wildly, she blinks once, blearily focusing up at you. She lunges up, arms around your neck, and plants a hungry, heavy kiss on your [pc.lipsChaste]. Her tongue spears inside, and the fox-girl whimpers madly as ");
	if(sceneRoute == 1) output("her clutching, internal caresses reach a whole new high.");
	else if(sceneRoute == 2) output("her cock bounces and pulsates, shooting out fresh ropes.");
	else output("her cunt flutters absurdly, " + (!penny.isSquirter() ? "drizzling":"spraying") + " you with more liquid adulation.");
	output(" She’s literally cumming to her own admission of love.");
	output("\n\nYou can’t hold back in the face of such frenzied affection. Maybe it’s the kiss. Maybe it’s the sizzling genital to genital contact. Maybe it’s the memories of all the other times you’ve fucked, the times you’ve driven Penny to squealing heights of pleasure and gleefully climaxed alongside her, but you cum too. You cum ");
	if(sceneRoute == 1) output("a bubbling, frothy load directly into her flexing quim.");
	else if(sceneRoute == 2) output("with cock-draining force, rippling and squeezing the leftovers of her last load so very deep inside yourself.");
	else 
	{
		output("with heedless passion, ");
		if(pc.isSquirter() && penny.isSquirter()) output("squirting right back at her.");
		else if(pc.isSquirter()) output("squirting violently enough to make her dribbles look positively pathetic in comparison.");
		else output("mixing [pc.girlCum] with fox-girl lady-spunk until your thighs and asses are equally slick.");
	}
	output("\n\nYou mouth, <i>“I love you too,”</i> back in the wake of that ");
	if((sceneRoute == 1 && pc.balls > 0) || (sceneRoute == 2 && penny.balls > 0)) output("ball-draining");
	else output("soul-searing");
	output(" kiss, only to be buried once more in your mate’s hungry muzzle.");
	if(flags["PQUEST_PENNY_PODDED"] == undefined)
	{
		output(" When she pulls away, you both pant breathlessly, but neither one of you is anything less than completely satisfied. It’s time to re-dress and move on.");
		processTime(25);
		if(sceneRoute == 1) penny.loadInCunt(pc,0);
		else if(sceneRoute == 2) 
		{
			pc.loadInCunt(penny,x);
			pc.loadInCunt(penny,x);
		}
		pc.orgasm();
		penny.orgasm();
		penny.orgasm();
		if(sceneRoute == 3 && penny.isSquirter()) pc.applyPussyDrenched();
		output("\n\n");
		//SEXED_PENNY incremented at top.
		CombatManager.genericVictory();
	}
	else
	{
		output(" When she pulls away, she doesn’t look satisfied. She somehow looks even more ravenous. The vixen’s titters thoughtlessly");
		if(sceneRoute == 1) output(", squeezing your [pc.cock " + x + "]");
		else if(sceneRoute == 2) output(", rocking around to shift your dick through her heavenly folds");
		else output(", shifting to grind and press her puffy cunt back into you with authority");
		output(". <i>“Mmm, I love you soooo much more than you can know.”</i> She grabs your hands and forces them onto her breasts, compelling you to squeeze the warm mounds. <i>“Silly Penny, all cooped up in her dumb little office until you came in and made her smile. Made her cunt and brain and heart sooo happy she could barely think about work anymore!”</i>");
		output("\n\nThe fox-girl rolls you over onto your back in a moment of weakness. Her eyes are wide and empathetic. She peppers your forehead and nose with kisses, then lightly licks your lips, all while slapping her hips against your own. You’re both soaked enough that the squelches send lurid echoes rebounding through the tunnels, chased by Penny’s airy giggles and breathy moans. Her swampy cunt is so soaked that it drizzles your [pc.thighs] with every insane slap. Droplets of milk bead at her nipples as you squeeze her chest (perhaps a result of the pitcher’s drugs), but she doesn’t let you stop groping them. She guides your fingers directly to the nipples and demands, <i>“Milk me! I’m just a big slutty fox that wants to have all of your kits. Mmm-yesh!”</i>");
		output("\n\nEyes wide, you hold on for dear life. Some of the milk sprays your [pc.face], but most splashes across your chest. Penny doesn’t care. She’s simply thrilled to be tangled up with you. Whatever the pod did to her has unleashed her to gush and fantasize with almost uninterrupted enthusiasm.");
		output("\n\n<i>Squish.</i> Juices splatter, and Penny gathers a pawful up to swallow with a expression of sordid ecstasy writ across her vulpine features. <i>“After the rush, when we’re rich, we can settle down together, and I’ll be so fucking sexy for you. Of course, I’m a horny mess, so you’ll be fucking me every couple hours.”</i> She whimpers, and a splatter of cunt-juice drenches you [pc.belly]. <i>“You won’t be able to help but knock me up, and I’ll promise myself I’ll be smart and take some sterilex, but...”</i> She leans close, nipping affectionately at your neck. <i>“I won’t. Because I want to settle down with you. My mate. I want your love and your babies and I fuck I’m so horny for your heart!”</i>");
		output("\n\nThe near-insensate vixen humps away with her arms around her neck, too out of energy to hold herself up any longer. Her words spill out as drained mumbles in your ear while her body rushes toward <i>another</i> messy climax. <i>“You’re so good for being there for me, even though you’re so busy with all that company stuff, and even now, you’re rescuing me from monsters and <b>still</b> treating me to orgasms so good I’m not even sure what’s happening anymore!”</i> Girlcum splatters against the wall." + (sceneRoute == 2 ? " Your [pc.vagina " + x + "] feels stuffed to overflowing.":"") + " <i>“Let’s just fuck some more.”</i>");
		output("\n\nYou could fight her off, but something about her pheromones, or maybe her juices, has you ready to go a little longer. You let Penny keep going, holding on for dear life.");
		processTime(35);
		if(sceneRoute == 1) penny.loadInCunt(pc,0);
		else if(sceneRoute == 2) 
		{
			pc.loadInCunt(penny,x);
			pc.loadInCunt(penny,x);
			pc.loadInCunt(penny,x);
			pc.loadInCunt(penny,x);
		}
		pc.orgasm();
		penny.orgasm();
		penny.orgasm();
		penny.orgasm();
		penny.orgasm();
		if(sceneRoute == 3 && penny.isSquirter()) pc.applyPussyDrenched();
		//SEXED_PENNY incremented at top.
		clearMenu();
		addButton(0,"Next",druggedPennyVictoryFuckEnding);
	}
}

public function druggedPennyVictoryFuckEnding():void
{
	clearOutput();
	showPenny(true);
	showBust(pennyBustDisplay(true),"VENUS_ZILTRAP");
	author("Fenoxo");
	showName("\nVICTORY");
	output("<i>“" + (silly ? "NTR much?":"Are you sluts done yet?") + "”</i> the plant-woman gripes, rousing you from a drowsy stupor.");
	output("\n\nPenny pulls away guiltily, no longer dripping milk but still very soaked with her libertine secretions. <i>“Sorry, [pc.name]. Whatever that bitch dosed me with really did a number on me.”</i> She" + (penny.hasCock() ? " tucks away a dick that’s still unbelievably half-hard and":"") + " regretfully fumbles with a pussy-slick zipper, gathering her shed possessions with a happy wag of her tail. <i>“All that stuff I said... aside from the love, it was just the drugs talking.”</i> She hefts her shotgun, nodding to herself. <i>“Just the drugs.”</i>");
	output("\n\nThe venus ziltrap snickers. <i>“Sure, sure. Now get out here so I can find someone a little more grateful to be shown a good time, okay?”</i>");
	output("\n\nYou gather your own things, smiling when you see hints of Penny’s blush through her fur. A victory indeed.");
	output("\n\n");
	processTime(55);
	restHeal();
	pc.orgasm();
	penny.orgasm();
	CombatManager.genericVictory();
}

//Drugged Penny Bathes Your Hypercock in Pussyjuice and Milk, then squirts when you cum.
public function druggedPennyLovesThatHypercock():void
{
	clearOutput();
	showPenny(true);
	author("Fenoxo");
	var x:int = pc.biggestCockIndex();
	output("<i>“But Penny,”</i> you explain" + (!pc.isCrotchExposed() ? ", shedding your clothing to bare your [pc.cock]":", gesturing at your [pc.cock]") + ", <i>“you’d split in half. My cock is too large for your pussy, no matter how badly you want to feel it inside.”</i>");
	output("\n\nThe fox-girl licks her lips and stares greedily at the pillar of pulsing vixen-bait. Crawling forward, her tail wags as merrily as the happiest as ausars. <i>“That’s okay.”</i> She edges closer. <i>“I don’t mind.”</i> Her head cranes up and down from your [pc.cockHead] to your " + (pc.balls > 0 ? "[pc.balls]":"[pc.knotOrSheath]") + " and back again. <i>“I still love it - love you. I meant love you. And your cock.”</i> She’s so close that you can feel her words babbling out as puffs of breathy adulation. <i>“Stars, this fucking cock! I see it in my dreams.”</i> Her tongue slips out taste a particularly bulgy vein, earning her an approving throb from your pillar-like shaft. <i>“Mmmm...”</i>");
	output("\n\n<i>“Do you?”</i> you gasp in pleasure.");
	output("\n\n<i>“Yes,”</i> the cock-licking peacekeeper slut purrs. <i>“When I close my eyes and " + (penny.hasCock() ? "especially when I stroke the one you gave me, mate.":"especially when I play with my pussy, mate.") + " I get so hot thinking about rubbing my " + (penny.hasCock() ? "dick against yours":"slutty fox-tits all over your magnificent cock") + ", whimpering as a single whiff of you puts me into heat, puddling pussy-juice in my chair... mmmrm!”</i> She closes her eyes and grabs you with a two-handed grip, a necessity given just how little of your [pc.cock] her tiny paws can handle. <i>“Let me make you cum. Please?”</i> Not waiting for an answer, she plies you with long, worshipful strokes. <i>“I wanna make you cum. Want to bathe in the scent of it. Soak it into my fur so the whole town knows I’m yours when we get back.”</i> She gasps and pumps faster, lost in fantasy. <i>“So everyone can see how hard I make you cum, how worthy I am to be <b>yours.</b>”</i>");
	output("\n\nYou nod your assent, but she doesn’t notice it." + (pc.isBimbo() ? " So you giggle out, <i>“Only if I can like, make you cum just as hard!”</i>":" Instead, you run your fingers through her mohawk-trimmed mane, pulling her a little closer."));
	output("\n\n<i>“Yesh,”</i> Penny mouths, planting a warm, wet kiss just beneath the [pc.cockHead]. <i>“You don’t have to do anything. Just let me...”</i> Warm, vulpine slobber races down the bulging cumvein. <i>“Let me do this for you.”</i> Her tongue smears bubbling globules around as she revels in the salty taste of your god-sized breeding tool. <i>“You saved me... and got so hard for me.”</i> She blinks a few times and looks up at you in pure adulation. <i>“I love you, [pc.name].”</i> She whimpers at the admission" + (penny.hasCock() ? ", her cock rubbing past your [pc.knot], slippery with a curtain of musky pre":", her cunt leaking excitement all over your [pc.thigh]") + ". <i>“And I’m such a worthless little cum-dump of a mate that all I can think about is making this beautiful dick spurt.”</i> Groaning whorishly, she rubs her thumbs in little circles against the sides of your full urethra, coaxing you to twitch" + (pc.cocks[x].hasFlag(GLOBAL.FLAG_FLARED) ? " and flare":"") + ".");
	output("\n\nA bubble of pre-cum races out of your [pc.cockHead] to dribble in Penny’s hair.");
	output("\n\nGasping ecstatically, the vixen says, <i>“");
	if(flags["PQUEST_PENNY_PODDED"] != undefined) output("I’m all cock-brained. I sucked her titties in that pod, [pc.name]. I couldn’t help it. Now I’m all wobbly, and this... this fat fucking dick is all I can think about, and I love it, and I love you. And I’m going to make you so horny and feel so stupid good that you won’t be able to do anything but love me back and fuck me to pieces.”</i> She growls possessively. <i>“I’m going to worship your dick until you pop a boner when you see my face.”</i> She strokes faster. <i>“I’m going to make you cum so hard that you’ll split open your pants the moment you hear my voice.”</i> Penny moans low in the back of her throat" + (penny.hasCock() ? ", and spurts salty cum against your [pc.belly]":"") + ". Torrid squelches of gushing pussy-juice splatter the cave floor as she cums hands-free. <i>“I’m so fucked up for you.”</i>");
	//Alt non drugged
	else output("\n\nI don’t know how you do it, [pc.name] - how you can walk around with <b>all this dick</b> and not spend all your time playing with it." + (penny.hasCock() ? " I spend almost every spare moment playing with mine. If I was as big as you... I’d never stop sucking myself.":" I’d be sucking it every minute of every day.") + " I’d be a wasteful self-suck slut with cum on her breath, and whenever you showed up at my office, I’d just let you throw me on my back and take me however you wanted.”</i> More slobber slicks your tool. <i>“But you manage it. Even though I tease and I squeeze. Somehow your pants don’t bust open the moment you see your cock-craving mate. You don’t get all woozy from all the blood rushing into this... this... perfect dick the moment my voice slips into a flirty whisper.”</i> Penny moans low in the back of her throat, shuddering slightly as she nearly reaches a climax of her own. <i>“It’s one of the reasons why I love you. You can keep it together until just the right moment, then make me cum so hard I see stars.”</i>");
	//Merge
	output("\n\nUnable to control yourself, you let your hips jerk forwards - just once. You catch yourself after, but the damage is done. Your shaft plows right between Penny’s " + (flags["PQUEST_PENNY_PODDED"] == undefined ? "sweat":"ziltrap") + "-drenched tits, sending shockwaves through the fox’s pillowy melons and absolutely shaming them for size. She could never properly tit-fuck you, not without a crash course in breast-enlarging drugs, but her sweet little sweater-kits can still feel wonderful as they slide through the fox-girl’s slobber. The tips of her oh-so-rigid nipples are two points blissful contact in the middle of a sea of slick-furred delight.");
	output("\n\nPenny meets your thrust by leaning into it. She moves her hands to the top half of your mast and pulls it harder against her chest. You can feel her heartbeat thumping into your [pc.cock], fluttering in the throes of passion. She’s so slick that when she wraps her arms tight, you can glide through the middle, using her hug as a silk-furred vice. Her clenched biceps are like the muscles in the sides of a virginal pussy, begging you to dump the thickest, most virile cum-shot possible into its womb, and Penny’s dopey, wide-open maw is that womb.");
	output("\n\nYou drool an appetizer of potent pre onto her waiting tongue, and the fox nearly cums on the spot. Her eyes cross to watch it roll out, and her pulse quickens. She slurps it down with a merry hum of enjoyment, then rolls her feisty oral organ back against your [pc.cockHead] to beg for more. <i>“Please,”</i> she slurs, barely able to speak with the central groove of her tongue welded to your bulging, leaking urethra. <i>“Please. Cum.”</i> She writhes her belly against you. Her arms pump up and down, dragging her tits with them." + (flags["PQUEST_PENNY_PODDED"] != undefined ? " Milk dribbles freely out of her nipples, probably another effect of the ziltrap’s drugs.":"") + " <i>“I’m so fucking close! I just need... I just need to make you cum.”</i> She whines in delirious arousal. <i>“<b>Please!</b> Don’t worry about where it hits me. Just do it. Put it in my mouth or on my face or in my hair or my sl-sl-slutty little cum-dump pussy! [pc.name], cum! Cum!”</i>");
	output("\n\nYou boil over with pleasure - not just from your writhing, ecstatic lover but from the raw lusty depravity of her words. Penny’s voice feels like it’s " + (pc.balls > 1 ? "in your [pc.balls], stirring the bubbling cum-factories to brew more jism than they could ever hold":"in your body, coaxing you to produce more jism that you could ever hold") + ". " + StringUtil.capitalize(indefiniteArticle(pc.cumGem())) + " droplet appears at your apex as you");
	if(pc.cocks[x].hasFlag(GLOBAL.FLAG_FLARED)) output("r flare doubles in size, soaked in sweat and so plump with blood and pheromones that you get a whiff of your own bestial scent.");
	else if(pc.hasKnot(x)) output("r [pc.knot] inflates obscenely. Penny’s legs automatically scissor around it in a tight squeeze, giving the bestial endowment exactly what it needs to spew its entire bitch-impregnating load.");
	else output(" swell to absolute biggest and hardest, your mammoth organ doing its best to keep any seed from escaping a phantom lover’s oh-so-impregnable pussy.");
	output(" The first spurt flies out, and Penny is there to catch");
	var cumQ:Number = pc.cumQ();
	if(cumQ < 40) output(" and swallow it");
	else if(cumQ < 1000) output(" it in her waiting mouth, uncaring that it bulges her cheeks or dribbles out the sides");
	else output(" it in her waiting mouth, and across her face, and in her hair, and even on top of her submissively folded ears");
	output(". She revels in your [pc.cumNoun].");
	output("\n\nThe fox-woman pulls you tight a sympathetic climax rips through her. She wriggles and squirms, tits jiggling from how the bulges racing up your urethra slap past them. Each ejaculation is married to a muffled moan of delight and hurried attempts to drink down as much of the fragrant seed as possible." + (penny.hasCock() ? " Her cum splashes along your [pc.belly] and [pc.chest] as she wantonly frots the side of your bigger tool.":""));
	if(!penny.hasCock()) output((!penny.isSquirter() ? " The vixen’s cunt dribbles, its convulsions making it feel like her cunt is stroking your [pc.thigh] with raw eagerness to be filled.":" The vixen’s cunt drenches your [pc.thigh] in a torrent of pussy-juice so thick and so forceful that for a moment you wonder how such a thing is even possible. Then she cums again, squirting just as hard. With each fresh pulse of cum, the fox-girl achieves a new climax of her own. Her body is a clutching, spunk-drenched rag-doll that just can’t seem to stop cumming no matter how far back her eyes roll or thoughtless her gurgles."));
	output("\n\nYour " + (pc.balls > 1 ? "[pc.balls] empty":"[pc.cock] empties") + " everything you have " + (cumQ < 1000 ? "into":"onto") + " the fox. She’s squeezing you too tightly for anything else. Even when your orgasm winds down, " + (flags["PQUEST_PENNY_PODDED"] == undefined ? "she continues to work you for more, wringing out the last drop of sperm-infused fluid in your body":"she continues to vibrate in so much feverish ecstasy that you can’t help but squeeze out the last drop of sperm-infused fluid directly onto her nose, which immediately flares to drink in the brazenly sexual odor of it all") + ". <i>“Cummy,”</i> " + (flags["PQUEST_PENNY_PODDED"] == undefined ? "Penny babbles, sloughing off of you.":"Penny moans, losing what’s left of her motor control and flopping onto her back to ride out the end of her squirting drug-trip. Her nipples fountain milk once more, but in thinner flows this time. With the chemical’s influence fading, the surprise lactation she experienced seems to be fading... though this pussy-wringing squirt appears even wetter than the last."));
	output("\n\nYou stumble back onto your [pc.butt]. Your [pc.cock] pulsates in powerful approval, refusing to soft quite yet, perhaps approving of what you’ve done to your mate.");
	output("\n\n<i>“[pc.name],”</i> Penny whimpers, <i>“you " + pc.mf("stud","goddess") + "... you fucking...”</i> She rolls over, slowly crawling into your lap to snuggle a cum-stained cheek against your [pc.cockNoun]. <i>“Love you.”</i> She pats your thigh and smiles, tongue lapping a bit of juice from her nose. <i>“Want you to knock me up sometime... after the rush.”</i> Her eyes drift closed. <i>“Make me have lots of kits sometime, okay?”</i>");
	output("\n\nYou’re both snoring soon after.");
	processTime(35);
	pc.orgasm();
	for(x = 0; x < 10; x++) { penny.orgasm(); }
	clearMenu();
	addButton(0,"Next",bigDickFunAfterPitchersWithPenpen);
}

public function bigDickFunAfterPitchersWithPenpen():void
{
	clearOutput();
	showPenny(true);
	author("Fenoxo");
	output("<i>“Hey!”</i>");
	output("\n\nYou blink awake to the feeling of something sticky pulling away from your [pc.belly].");
	output("\n\n<i>“Yeah, wake up, sluts.”</i> The venus ziltrap snaps her fingers in irritation. <i>“Some of us would like an opportunity to share our affections with people who might actually appreciate them, so why don’t you get the hell out of here. I’m sick of looking at you. I don’t care how much fuck-juice my roots absorbed from your little tryst. I’d rather have a snuggle-buddy of my own.”</i> She pouts.");
	output("\n\n<i>“Yeah!”</i> the smaller ziltrap agrees.");
	output("\n\nPenny looks rather guilty as she straightens. One cheek is crazily matted from how she was sleeping, glued into an absurd shape with dried cum. <i>“Sure... but uh, [pc.name]. That stuff about having kits...”</i> She bites her lips. <i>“I think that was " + (flags["PQUEST_PENNY_PODDED"] != undefined ? "just the drugs talking":"a little bit of heat talking") + ". Forget about it, okay? I wasn’t thinking straight.”</i>");
	output("\n\nThe pitchers snicker.");
	output("\n\nYou don’t push the point for right now, content to gather your belongings and finish this quest. Penny smiles approvingly, then racks the slide of her shotgun with an enthusiastic look on her face. <i>“Come on mate. We’re almost there, and... I do love you. That was all true.”</i> Her tail swishes happily.");
	output("\n\n");
	processTime(30);
	if(penny.isSquirter()) pc.applyPussyDrenched();
	restHeal();
	IncrementFlag("SEXED_PENNY");
	CombatManager.genericVictory();
}

public function oralDatPenpenMcPennyPostZiltrapFight():void
{
	clearOutput();
	showPenny(true);
	author("Fenoxo");
	output("You don’t waste a second. Plunking yourself down between the fox-girl’s thighs, you inhale the " + (penny.isHerm() ? "musky, entwined flavors of her mixed genders":"her cunt’s lusty scent") + " with relish. It’s a thicker, more potent aroma than you’re used to picking up from the fox");
	if(flags["PQUEST_PENNY_PODDED"] != undefined) output(", doubtless the result of whatever happened to her in the pod. Her cunt is swollen to an absurd degree" + (penny.hasCock() ? ", and her cock streaming pre-cum in a near continual flow":" and glossy with a coat of its own secretions") + ".");
	else output(", doubtless a result of the vixen’s sensitive libido struggling to deal with zil and venus pheromones back to back.");
	output("\n\n<i>“Please, mate.”</i> Penny pants like a dog in heat.");
	if(flags["PQUEST_PENNY_PODDED"] == undefined) output(" Bits of drool collect on her collarbone, but the fox is too busy watching you to care.");
	else output(" Streams of drool pour into a puddle on her collarbone, but the drug-fucked fox doesn’t seem to notice. She’s too busy groping her tits and staring down at you, every breath holding a half-whimpered moan.");
	//Cock
	if(penny.hasCock())
	{
		output("\n\nYou grab her shaft and dive right in, capturing the " + (flags["PQUEST_PENNY_PODDED"] != undefined ? "leaky":"throbbing") + " member in time to collect a nice big wad of her anticipatory fluids on the back of your [pc.tongue]. " + (flags["PQUEST_PENNY_PODDED"] == undefined ? "You gather a bit of her feminine honey from below, then wrap your hand tightly around her [penny.cock]":"Using the excessive [penny.cockNounSimple]-juice for lube, you grab it firmly") + ", pumping it with ");
		if(penny.cocks[0].cLength() < 7) output("short, fast");
		else if(penny.cocks[0].cLength() < 14) output("steady, rhythmic");
		else output("long, worshipful");
		output(" strokes. It jerks willfully in your grip. Penny’s hips shiver, barely restrained from stuffing the entirety of her length down your throat." + (penny.balls > 0 ? " You can feel the heat from her overworked balls wafting up to your chin along with a cloud of needy, hermaphroditic pheromones.":""));
	}
	//Vagina
	else
	{
		output("\n\nYou dive right in, plunging your [pc.tongue] directly into the fox’s sudden box. She’s thoroughly juicy" + (flags["PQUEST_PENNY_PODDED"] != undefined ? ", with a hint of foreign flavor from the pod":"") + ", so wet that you’re left with a mouthful of vixen-jism to swallow on the outstroke. Gulping it down, you spread her legs. That very appetizing cunt yawns open. You take to kissing all around the outer lips, pausing only once to slide your [pc.tongue] in slow circles around the clitoral hood to build her up all the higher.");
	}
	//Penny drugged
	if(flags["PQUEST_PENNY_PODDED"] != undefined) output("\n\n<i>“Ohhh f-f-fuuuck,”</i> Penny moans. <i>“Fuck yessss. You’re so fucking good to me, [pc.name]. Oh sooo good. I’m just a dumb, horny fox, and you’re " + (penny.hasCock() ? "sucking me off":"eating me out") + " anyway.”</i> Tears well up at the corners of her eyes. <i>“I don’t deserve y-”</i>");
	//Not drugged
	else output("\n\n<i>“Ohhh damn,”</i> Penny moans. <i>“You’re good at this, [pc.name]. So fucking good! I can’t believe you’re " + (penny.hasCock() ? "sucking me off":"eating me out") + " right now! I’m the one that can’t keep her legs closed around nice-smelling aliens, the one who’s been a liability to you this entire trip.”</i> Tears well up at the corners of her eyes. <i>“I don’t deserve y-”</i>");
	//Merge
	output("\n\nA flick of your tongue turns the vixen’s rambling into whimpers. Her hands fall on your head, pulling you deeper, fingertips scrabbling " + (!pc.hasHair() ? "against your head":"through your [pc.hair]") + ".");
	//Drugged
	if(flags["PQUEST_PENNY_PODDED"] != undefined) output("\n\n<i>“Oh yes! I love you, [pc.name]!”</i> Penny’s " + (penny.hasCock() ? "dick gushes cheek-bulging loads of pre into your mouth, salty with the tang of a surprising amount of sperm":"cunt glazes your cheeks with an enthusiastic micro-squirt") + ". <i>“I love you so much!”</i> Her hips grind hard against you, begging your tongue to do more. <i>“You’re the best fucking mate a girl could ask for. So strong and so talented, and you make me cum so hard that I can’t help but dream about banging you when you’re gone...”</i>");
	//Not drugged
	else output("\n\n<i>“Ohhh, I love you [pc.name]!”</i> Penny’s " + (penny.hasCock() ? "dick throbs approvingly in your mouth, dribbling plenty of pre for your efforts":"squeezes down on your tongue like it’s the universe’s most amazing dildo") + ". <i>“I love you so much!”</i> Her hips grind hard against you, begging your tongue to do more. <i>“You’re there when I need you. You were there for me, even though I know you’re so busy. And now you’re guarding me, pleasing me when I need it, and making this dangerous adventure feel like a fun honeymoon. You’re the [pc.manWoman] of my dreams, [pc.name].”</i>");
	//Merge
	output("\n\nMaking Penny cum is as easy" + (penny.hasCock() ? " as wiggling your tongue against her [penny.cockHead]":" thrusting your [pc.tongue] nice and deep while your [pc.lipsChaste] grip her clit in a half-suckle") + ". As lusty a woman as she is, you’re able to coax her into squirting ");
	if(penny.hasCock())
	{
		if(penny.cocks[0].cLength() < 7) output("a nice thick load into your belly");
		else if(penny.cocks[0].cLength() < 14) output("a cheek-bulging load into your belly");
		else output("an overwhelmingly potent load into your belly");
	}
	else if(flags["PQUEST_PENNY_PODDED"] != undefined) output("feverishly hot jets of girlcum across your face and neck");
	else output("a thin dribble of girlcum on command");
	output(". Enduring her orgasm is another thing. Her thighs swing closed around your neck while her arms tug you downward, smashing your " + (penny.hasCock() ? "[pc.lips]":"[pc.lipsChaste]") + " into her " + (penny.hasCock() ? "sheath":"fuzzy, soaking-wet loins") + ".");
	if(penny.hasCock())
	{
		if(!pc.canDeepthroat()) output(" You struggle not to gag from the throat-filling insertion. All the cum it’s spraying straight into your gut isn’t helping.");
		else output(" You struggle not to cum from getting so wholly throat-fucked. All the cum spraying straight into your gut isn’t helping. Your eyes roll back, and you reach down to squeeze her thighs harder, wanting to be Penny’s permanent cock-holster.");
	}
	//Not drugged
	if(flags["PQUEST_PENNY_PODDED"] == undefined)
	{
		output("\n\nAfter what feels like an eternity without oxygen, you’re pushed away." + (penny.hasCock() ? " Inch after inch of half-turgid [penny.cockNoun] slides out of your strained maw with a lewd ‘pop’ and a trickle of chin-clinging spooge.":" Strings of clear juices connect you to the bared pussy for a few seconds before snapping at the midpoint and slapping home onto your chin. You feel like you’re wearing a mask of cunt-juice."));
		output("\n\n<i>“Wow.”</i> Penny wobbles unsteadily, then flops flat on her back. <i>“Wow. Even in a cave, you’re a champion " + (penny.hasCock() ? "cock-sucker":"rug-muncher") + ".”</i>");
		output("\n\nYou stifle a burp.");
		output("\n\nPenny laughs and stretches. <i>“I’ll have to pay you back for that sometime.”</i> With a wiggle of her toes, she stretches for her shotgun. <i>“But I suppose we should get moving before those plant-sluts recover.”</i>");
		output("\n\nYou lick the residue of her unique flavor from your chin and make ready to move on.\n\n");
		processTime(25);
		if(penny.hasCock()) pc.loadInMouth(penny);
		else pc.girlCumInMouth(penny);
		penny.orgasm();
		CombatManager.genericVictory();
	}
	//Drugged
	else
	{
		output("\n\nAfter what feels like an eternity without oxygen, you’re pushed away" + (penny.hasCock() ? ", endless inches of Penny’s [penny.cock] spilling from your [pc.lips] with a lewd ‘pop.’":".") + " You gasp blearily, every breath tinted with the ambrosial scent of Penny’s genitalia.");
		output("\n\n<i>“Fuuuuck, I’m so sorry, mate!”</i> Penny crawls on top of you");
		if(pc.hasCock()) output(", dribbling seed as she goes");
		else output(", painting a trail of sopping-wet cunt across your middle");
		output(". <i>“You made me feel so good that I couldn’t help myself!”</i> She reaches down, rubbing her crotch unthinkingly, coaxing more from her sweaty sex" + (penny.hasCock() ? "es":"") + ". <i>“It doesn’t make any sense. I’m still so horny, and you’re so sexy. Just looking at you makes my " + (penny.hasCock() ? "dick":"pussy") + " drool. Seeing you like this, drenched so that I can’t even smell you under my own sex stink?”</i> She cums noisily, eyes rolling wildly while " + (penny.hasCock() ? "huge blasts of seed paint their way across your [pc.face].":"torrid squelches burst across your [pc.chest], puddling in the center") + ". <i>“F-f-fuuuuck! I’m such a cummy bitch!”</i>");
		output("\n\nYou, pinned as you are under her weight, are still a bit dizzy from lack of oxygen, " + (penny.balls > 0 ? "but her heavy, wobbling balls look too appetizing not to lick. You grab the prick-toting vixen by the ass and tug yourself up, pressing your face into her silky sack to lick. The cum raining over your [pc.hair] is just frosting on top of an already delicious cake.":""));
		if(penny.hasCock() && penny.balls == 0) output("but her throbbing, pulsating shaft looks too appetizing not to lick. You grab the prick-toting vixen by the ass and tug yourself up, pressing your face into that glorious, animalistic dong to take a taste. The cum raining over your [pc.hair] is just frosting on top of an already delicious cake.");
		else if(penny.balls == 0) output("but her pretty, puffy clitty is simple too tempting not to lick. You grab the slippery vixen by the ass and pull yourself back into place, smashing yourself into place to savage the hood with your tongue.”</i>");
		output("\n\n<i>“[pc.name]!”</i> Penny screeches, starting a whole new orgasm before the last even ended. <i>“Ho-oh-uh... mmmm...”</i> The fox-girl’s eyes close while her hands drift to her nipples, teasing out long sprays of milk from a pair of nipples so engorged that they look like teats. <i>“Hmm? Mi-milk?”</i> She doesn’t stop tugging on them or even bother to open her eyes. <i>“Yeah... milk. [pc.name]. Cumming.”</i> She giggles lustily. <i>“My favorite things!”</i>");
		output("\n\nSteaming-hot splashes of sex-juice alert you to her next climax.");
		output("\n\n<i>“Ah! Love you, mate! Love you so much! You make me cum so good. Like...”</i> Penny blinks a few times and looks down at you, bleary-eyed. <i>“Dunno why we’re fucking anymore.”</i> Her pussy drools. <i>“But I don’t wanna stop.”</i> Her ears fold back almost completely flat as yet another orgasm wracks her body. <i>“Guess I’m just a uh... uhmmm... a slut.”</i>");
		output("\n\nThere’s so much of Penny’s passionate fluids draped across your body that you feel head-to-toe soggy.");
		output("\n\n<i>“After the rush, we should move in together. I’ll fuck you in the morning.”</i> The fox-cop’s cunt dumps a coffee cup’s worth of girlcum onto you. <i>“You can fuck me when I’m naked in an apron in the kitchen.”</i> She licks her lips. <i>“And we can have like, a dozen little kits running around from how much we fuck. Cause I’m gonna fuck you so much.”</i>");
		output("\n\nIt’s hard to keep track of what she’s saying with how good she tastes, how much you enjoy the sight of her genitalia shivering in absolute bliss. What’s important is that Penny loves you. She loves you and she bathes you in affectionate, sex-infused words just as you bathe her crotch in saliva.");
		if(penny.hasCock()) 
		{
			pc.loadInMouth(penny);
			pc.loadInMouth(penny);
			pc.loadInMouth(penny);
			pc.loadInMouth(penny);
		}
		else 
		{
			pc.girlCumInMouth(penny);
			pc.girlCumInMouth(penny);
			pc.girlCumInMouth(penny);
			pc.girlCumInMouth(penny);
		}
		penny.orgasm();
		penny.orgasm();
		penny.orgasm();
		penny.orgasm();
		pc.lust(10);
		clearMenu();
		addButton(0,"Next",eatOutPodPennyEnding);
	}
}

public function eatOutPodPennyEnding():void
{
	clearOutput();
	showPenny(true);
	author("Fenoxo");
	output("When you come to, Penny’s snuggled up next to you and staring deeply into your eyes. <i>“Hey there, [pc.name].”</i> She kisses your nose. <i>“Thanks for that. You rest up as much as you need. I’ll keep watch till you’re ready to go on, okay?”</i>");
	output("\n\nYou nod.");
	output("\n\n<i>“Oh, and ignore all that stuff I said about settling down and having kids. I think that was just whatever the venus-woman dosed me with.”</i>");
	output("\n\nSure.");
	processTime(50);
	restHeal();
	if(penny.hasCock()) 
	{
		pc.loadInMouth(penny);
		pc.loadInMouth(penny);
		pc.loadInMouth(penny);
		pc.loadInMouth(penny);
	}
	else 
	{
		pc.girlCumInMouth(penny);
		pc.girlCumInMouth(penny);
		pc.girlCumInMouth(penny);
		pc.girlCumInMouth(penny);
	}
	IncrementFlag("SEXED_PENNY");
	output("\n\n");
	CombatManager.genericVictory();
}

public function finalPennyQuestRoomproc():Boolean
{
	/* CUT STUFF FOR QUEST RESET:
	output("\n\n<b>This is all the content in Penny's quest for now. Check back in a day (or few) to deal with the mining robots...</b>");
	//Reset stuff:
	flags["PQUEST_PENNY_PODDED"] = undefined;
	flags["PQUEST_ZILTRAP_RESULTS"] = undefined;
	flags["PENNY_CREW_ASKED"] = 1;
	currentLocation = "PENNY'S OFFICE";
	clearMenu();
	addButton(0,"Next",mainGameMenu);
	return true;
	*/
	flags["NAV_DISABLED"] = NAV_WEST_DISABLE;

	showBust("MINING_ROBOT",pennyBustDisplay());
	author("Fenoxo");

	output("\n\nPenny grabs you by elbow and forcibly yanks back. <i>“Careful, mate. This mining operation isn’t on the books, and I’d bet credits to cumshots these lawbreaking drillboys are programmed to put an end to nosy explorers.”</i> She scowls.");
	output("\n\nYou carefully - very carefully - lift up your Codex and edge the corner with the hololens past the crag of rock you and Penny are sheltered behind. A few taps later and you’re treated to an up-close view of the busy machinery.");
	output("\n\n<i>“Spot any logos?”</i> Penny growls low in the back of her throat. <i>“I’d love to know which low-life scumcorp thought it would be a good idea to skip out on <b>my</b> planet’s taxes. Last I checked we barely had any. Just enough to keep the town running - mostly off mineral claims like this one.”</i>");
	output("\n\nOne robot turns away, hauling a small fortune in Oxonium ore to the lander. On its back are streaks of faded enamel where somebody went at it with a power sander, not enough to prove anything in court, but enough for you to recognize edges of a design you’ve seen your father scowl at many times: the enormous bolded ‘X’ of the MaxCorp logo. <i>“These are MaxCorp mining robots. Dad always said they’d do anything for a credit, but I didn’t expect them to stoop quite this low." + (pc.isBimbo() ? " Lawbreaking is so silly!":"") + "”</i> You duck into hiding before they can spot you. <i>“Older ones though. " + (!pc.isBimbo() ? "Plenty strong but not exactly fast or smart. Probably hauled out of storage for plausible deniability. Blame smugglers with surplus ‘bots if they get caught.":"Not even good looking ones! They probably used them so they could blame some pirates that bought last season’s model. I mean... who wants old robots?") + "”</i>");
	output("\n\nPenny scowls. <i>“I could call in peacekeeper reinforcements... but this would become a crime scene. The right to the Oxonium claim would go up for government auction, and a small fry like me would never stand a chance.”</i> Her ears lift upright, and her lip curls in a fearsome smile. <i>“Or we could dish out a little frontier justice. These robots are technically trespassing in a sovereign planet. We scrap ‘em, and there’s nothing MaxCorp can do except write them off as a tax deduction. Then we file a claim ourselves, bring in a legal crew - maybe one through your father’s company - and reap a sizable reward.”</i>");
	
	//if gold myr rebels relocated
	if(myrOnMhenga())
	{
		output("\n\nIt’s at that exact moment a wailing klaxon sounds. You risk a look back into the crater in time to see a gold myr scout emerging from a tunnel on the other side. She’s got all four of her arms up in the air, but the mechanical rock-maulers advance all the same.");
		output("\n\n<i>“Whoah! Hey... no need to be hostile. I’m just surveying the area for my queen. Let’s just... ah fuck it.”</i> The golden girl yanks a heavy-caliber burst rifle off her back at levels it at the metal menaces. <i>“Come at me, fuck-faces!”</i>");
		output("\n\nIf this soldier-myr clears off the robots before you, she could claim the resources for her queen! You suppose you’ll have assist her, if only to prove to Penny that you’re a reliable sort of Rusher.");
		clearMenu();
		addButton(0, "Attack", startPennyMiningBotFightStuff);
		return true;
	}
	//else
	else
	{
		output("\n\nThat makes sense. Since you haven’t been spotted, you have plenty of time to prepare for the confrontation.");
		clearMenu();
		addButton(0, "Attack", startPennyMiningBotFightStuff);
		return false;
	}
}

public function startPennyMiningBotFightStuff():void
{
	penny.HP(penny.HPMax());
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc, penny);
	if(myrOnMhenga()) CombatManager.setFriendlyActors(pc, penny, new Onzia());
	var enemies:Array = [new MiningRobot(),new MiningRobot(),new MiningRobot()];
	enemies[0].pennyQuestPrep();
	enemies[0].long = "This dinged-up mining robot has seen better days, but its drills are still sharp and its servos strong.";
	enemies[1].pennyQuestPrep();
	enemies[1].long = "Rumbling and clattering with every step it takes, this piece of bipedal industry trails a shower of sparks.";
	enemies[2].pennyQuestPrep();
	enemies[2].long = "The final ‘bot is perhaps the nicest looking of the three. No wonder it’s the one bearing the remnants of a MaxCorp logo. Despite their differences, they move at the same languid speed with the same implacable force.";
	CombatManager.setHostileActors(enemies[0],enemies[1],enemies[2]);
	CombatManager.victoryCondition(CombatManager.ENTIRE_PARTY_DEFEATED);
	CombatManager.victoryScene(defeatMiningBotsWithPenpen);
	CombatManager.lossScene(loseToMiningBotsWithPen);
	CombatManager.displayLocation("MINING BOTS");
	CombatManager.beginCombat();
}

//Defeat
public function loseToMiningBotsWithPen():void
{
	output("You " + (!myrOnMhenga() ? "and Penny":"and your inhuman compatriots") + " never stood a chance. You go down under the spinning drills and stomping feet of the illicit mining robots. Your bodies are never found.");
	badEnd();
}

//Victory
public function defeatMiningBotsWithPenpen():void
{
	var pennyDown:Boolean = (penny.HP() <= 1 || penny.lust() >= penny.lustMax());
	var antDown:Boolean = false;
	var allies:Array = CombatManager.getFriendlyActors();
	if(myrOnMhenga()) 
	{
		for(var x:int = 0; x < allies.length; x++)
		{
			if(allies[x].originalRace == "gold myr")
			{
				if(allies[x].HP() <= 1 || allies[x].lust() >= allies[x].lustMax()) antDown = true;
			}
		}
	}
	//Strip out excess enemies to clean up sidebar for bigger bust views :3
	var enemies:Array = CombatManager.getHostileActors();
	while(enemies.length > 1) CombatManager.removeHostileActor(enemies[1]);
	while(allies.length > 1) CombatManager.removeFriendlyActor(allies[1]);
	output("As the last of the illicit mining robots collapses into a heap");
	//No Myr
	if(!myrOnMhenga())
	{
		output(", " + (pennyDown ? "you turn to help Penny up onto her feet":"you check on Penny") + ". <i>“You okay, Penny?”</i>");
		output("\n\nShe flashes a euphoric thumb’s up and gestures to the smoking metal behind you. <i>“Hell yeah. Doing better than they are. What about you?”</i>");
		output("\n\nYou return her thumb’s up with a ");
		if(pc.isNice()) output("toothy");
		else if(pc.isMischievous()) output("flashy");
		else output("hard");
		output(" smile. <i>“All good.”</i>");
		output("\n\n<i>“Great.”</i> Penny pants, trying to catch her breath. <i>“Then let’s file this claim before some other monster reveals itself. You’ve got an inside line with Steele Tech to get a good rate on it, right?”</i>");
		output("\n\nYou nod.");
		output("\n\n<i>“Then let’s get the paperwork rolling. A 50/50 split on all this Oxonium is going to take a pretty solid chunk out of my debt.”</i>");
		output("\n\nYou pull out your Codex and go to work. Not long after, you and Penny are the proud recipients of <b>30,000 credits</b> - each.");
		output("\n\n<i>“Wow.”</i> Penny shakes her head, ears flopping. <i>“I still can’t believe we pulled this off.”</i> A toothy, feral grin splits her maw. <i>“Know what else I can’t believe?”</i>");
		output("\n\nYou shrug.");
		output("\n\n<i>“That we don’t have to slog through that awful cave to go home.”</i> She rushes into a squeezing hug, completing it with a kiss on your nose" + (pc.tallness > penny.tallness+10 ? ", even if she has to jump to do it":"") + ". <i>“I’ve got peacekeeper override codes that’ll turn that little droneship into our own little shuttle-bus back to Esbeth.”</i>");
		output("\n\nYou kiss her back.");
		output("\n\nMission accomplished.\n\n");
		processTime(30);
		pc.credits += 30000;
		CombatManager.genericVictory();
		eventQueue.push(rideHomeWithPen);
	}
	//Myr
	else
	{
		output(", ");
		if(antDown || pennyDown)
		{
			output("you turn to help up ");
			if(pennyDown && antDown) output("your fallen comrades");
			else if(antDown) output("the fallen myr only to find Penny already tugging her up onto her chitin-plated feet");
			else output("Penny only to find the ant-girl giving the fox a two-handed assist");
			output(". You ask, <i>“Are you okay?”</i>");
		}
		else output("you turn to check on your comrades. <i>“Are you guys okay?”</i>");
		output("\n\nThe insectile alien gives her weapon a look-over, working the action and knocking a bit of dirt off the magazine before replying. <i>“Everything checks out. It’s a good thing I bumped into you, or I’d have been more fragged than a red on a landmine.”</i> She shoulders the weapon and offers her lower arms to you and Penny in dual handshakes. <i>“My name’s Onzia, and I’m guessing you’re here about this mineral load?”</i>");
		output("\n\nIntroducing yourselves, you and your foxy lover admit that she’s got the right of it.");
		output("\n\n<i>“Right, well then the way I see it, we all contributed to that bit of ass-kicking, and we all got here around the same time, so a three-way split between my people and you two sounds more than fair.”</i> She smiles happily. <i>“A find like this, even a third of it, is going to do our little settlement a lot of good.”</i>");
		output("\n\nWhile it might be possible to wiggle out of such a deal and claim it all for yourselves, Penny is already nodding her agreement. <i>“Of course! Your people have been a real boon to Esbeth. The town’s really livened up since you arrived, and I know Burt in particular is pleased as a peach to have you around.”</i> She gestures at the smoking heaps behind you. <i>“I’d recommend avoiding off-spec digs like this in the future, though. Your friendly neighborhood peacekeeper isn’t always just around the corner in full riot gear, waiting to help. Sometimes you have to call us first.”</i>");
		output("\n\nOnzia laughs. <i>“Yeah. I got lucky today. Thanks, Penny - and thanks, [pc.name] too.”</i>");
		output("\n\nYou’ll just have to make do with a third of the score this time. Ah well. You smile back.");
		output("\n\nPenny produces a codex. <i>“Now to stake the claim, we’ve got to do a little bit of paperwork...”</i>");
		processTime(40);
		clearMenu();
		addButton(0,"Next",OnziaWrapUp);
	}
}

public function OnziaWrapUp():void
{
	clearOutput();
	showPenny();
	showName("MISSION\nCOMPLETE");
	author("Fenoxo");
	output("After completing the paperwork, Onzia says her goodbyes and departs back the way she came. Her antennae ride a bit higher than you remember them being, and the amber soldier’s heavy abdomen seems to bob about with real joy as she vanishes into the dark.");
	output("\n\nPenny turns back to you. <i>“We did it. We really did!”</i> She throws her arms around you in a fuzzy hug. You’re both dirty and sweaty, but neither of you care. You claimed all that Oxonium, just like you said you would. <i>“And it looks like we’re gonna get a <b>20,000 credit payout</b> - each!”</i> She laughs uproariously. <i>“For something we did </i>in a day<i>. Insane.”</i>");
	output("\n\n20,000 credits goes a long way.");
	output("\n\n<i>“And the best part?”</i> Penny leans close to whisper in your ear, voice low and husky. <i>“We don’t have to walk back through the cave. I can use my peacekeeper overrides to turn that little droneship into our own little shuttle-bus back to Esbeth.”</i>");
	output("\n\nThe grinning vixen has never been sexier.\n\n");
	flags["ONZIA_GOT_PQUEST_LOOT"] = 1;
	processTime(25);
	pc.credits += 20000;
	CombatManager.genericVictory();
	eventQueue.push(rideHomeWithPen);
}

//The ride home
public function rideHomeWithPen():void
{
	clearOutput();
	showPenny();
	showName("THE\nRIDE HOME");
	author("Fenoxo");
	output("The drone’s cargohold isn’t spacious or comfortable, but it is air conditioned and stable. Penny leans against you while the engines drone on. She’s soft and warm. You’re both worn out. Sleep takes you.");
	processTime(10);
	currentLocation = "PENNYQUESTSTANDIN";
	generateMap();
	clearMenu();
	addButton(0,"Next",pennyQuestOutro);
}

//Next
public function pennyQuestOutro():void
{
	clearOutput();
	showPenny();
	author("Fenoxo");
	currentLocation = shipLocation;
	generateMap();
	output("The heavy ‘ka-chunk’ of the cargodrone’s door releasing jolts you both awake. Penny rubs her eyes and moans in displeasure. <i>“The one time I’d appreciate a shipping delay, and we arrive on time. Great”</i>");
	output("\n\nYou laugh and help her out onto Esbeth’s landing pad.");
	output("\n\n<i>“I suppose I’d better get started on the <b>other</b> paperwork.”</i> Penny sighs heavily, tawny ears drooping.");
	output("\n\n<i>“What other paperwork?”</i>");
	output("\n\nThe fox-girl spreads her hands helplessly. <i>“Well you see, the kind of carnage we just created incurs a significant amount of paperwork. There are forms to file for every spent shell, combat reports to detail, and information on a new species to log.”</i> She pouts. <i>“Then I have to compile information on that mining operation, request a robotics forensics team to examine the fallen robot’s memory banks, and maybe... just maybe, we’ll be able to lodge a decent fine against MaxCorp.”</i>");
	output("\n\nYou wince.");
	output("\n\n<i>“Yeah. I’ll be at my office. Come by if you’re ready to make me more offers I can’t refuse.”</i> Penny winks. Despite her exhaustion, she looks radiant.\n\n");
	processTime(3);
	flags["PENNY_CREW_ASKED"] = 3;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[=Offer...?=]
// Add this button to Penny’s talk menu after having completed the sidequest successfully
// Tooltip: Now that you’ve excavated the cave full of Oxonium, maybe Penny will be more receptive to the possibility of joining your crew?
// (scene: Offer Accepted)
public function recruitPennyOfferFinal():void
{
	clearOutput();
	showPenny();
	author("B");
	flags["PENNY_CREW_ASKED"] = 3.5;
	output("You take a seat next to Penny and lean forward, putting your elbows on your knees and clasping your hands together. You tell Penny that you’d like to talk about bringing onboard.");
	//output("\n\nNow that you two have excavated that deposit of Oxonium and you both have taken your share of the haul, Penny, if she was true to her word, must be damn close to debt free, if she isn’t there already. You were hoping that she’d jump at the opportunity to join you, or at least to negotiate a bit, but....");
	output("\n\nContrary to what you were expecting, Penny’s body language is difficult to read. You were fantasizing that she’d be energetic and giddy as all get out; you were expecting that she’d be relaxed and receptive to some discussion; but what you’re getting is something forlorn and listless. She can’t keep her eyes on yours, and her breathing is sharp and irregular. Her hands also constantly fidget and can’t decide whether they want to fold on her lap or to grip onto her armrests.");
	output("\n\n<i>“I’ve, uh,”</i> she stutters. Her face turns in your direction, but it takes a moment longer for her eyes to have the bravery to look into yours. <i>“I’ve... been trying to put... sentences, you know, together, ever since I, we, got out. Of the cave. I... uh, I still haven’t q-quite... done it, yet.”</i>");
	output("\n\nYou stand, only slightly, and pull your chair closer to hers, until you’re sitting side-by-side. You put your hand in hers, giving it something to do, and you squeeze affectionately. She squeezes back, rather roughly, like your hand was a stress ball, before she relaxes and tries again, gentler.");
	output("\n\nYou tell her to take a deep breath. She does – stuttering on the way in, and stuttering on the way out. Her lips curl into a soft, nervous smile, and she laughs as she exhales.");
	output("\n\n<i>“Fuck me,”</i> she laughs to herself, <i>“we just came from stopping an illegal mining operation, and</i> this <i>is the hardest thing I’ll be doing today.”</i>");
	output("\n\nYou do the best thing a good mate would do for their better half, and that’s sit and be patient. You can feel Penny’s heart race through her fingers as she clutches your hands.");
	output("\n\n<i>“I’m sorry,”</i> she laughs again, her other hand swiping languidly through her mohawk hair and scratching at the back of her right ear. <i>“I just – everything that happened, happened so quickly. And now, I... for the first time in my life, I... I have the means to make my own life. I can choose what I want to do.”</i>");
	output("\n\nNow that the words are starting to form, she has the wit to maintain eye contact for longer than a second. She knows that if she stops talking, she’ll lose her bravery.");
	processTime(6);
	clearMenu();
	addButton(0,"Next",recruitPennyOfferFinal2);
}
public function recruitPennyOfferFinal2():void
{
	clearOutput();
	showPenny();
	author("B");
	output("<i>“Look, I love myself.”</i>");
	output("\n\nYou tell her that that’s a very positive thing to say.");
	output("\n\n<i>“I... Yeah, it is, but, I mean, physically. Because of the mods, I mean. I love</i> what <i>I am. But it cost me a shitload of money. Those mods, and my tuition at the U.G.C. academy – I wasn’t sure if I was ever going to get myself out of the hole. And me being the stubborn asshole I am, I couldn’t just accept a handout.”</i>");
	output("\n\nShe squeezes your hand affectionately, referring to the time you offered to help chip in.");
	output("\n\n<i>“And I love Esbeth. Sure, it doesn’t have a lot. We have a landing pad; a bar; a shop; and a drive-through hospital. Our population is less than most research stations. And it’s right next to a jungle that’s full of things that would want nothing more than to get a piece of us. But it’s</i> my <i>jurisdiction. Those are</i> my <i>people. Esbeth is my... my home.”</i>");
	output("\n\n<i>“And I love my job! I’ve wanted to be an officer since I was a little girl. When that one cop took down that mugger with just a move or two? Gods, [pc.name], it was love at first sight. I knew on the spot what I wanted to be, and now,”</i> she says, motioning to the station around you, <i>“I have my own</i> station. <i>Forget just having an office. I have my own station, in my own jurisdiction, serving my own people. I thought I had everything!”</i>");
	output("\n\nFinishing her train of thought, she places her other hand atop yours, and she leans into you, her voice dropping to a whisper. <i>“I... I</i> thought <i>I had everything.”</i> Once more, she breaks into a giddy smile, and she chokes on her own laughter, trying to suppress it. <i>“And then you had to go and change that, you asshole.”</i>");
	output("\n\nYou smile well-meaningly and let her continue. <i>“It was one thing after another with you, [pc.name]. First, you come in and help me with those zil freaks when I couldn’t stay in the same room as them for more than five minutes. Then, you – you and I, we b-became mates. Then, we, we fucking,”</i> she says, getting louder and excited and animated and active as she recalls the scene, <i>“we fucking shut down that illegal mining business! Those beta bitches thought they could stand on</i> my <i>jurisdiction and undermine</i> me <i>and</i> my mate!<i>”</i>");
	output("\n\nShe settles down and recollects herself, but only just. Her hands haven’t left yours the whole time. <i>“[pc.name], I’m not going to lie to you. When I saw you going after those Venus Ziltraps, and when we dismantled that mining crew – I got to thinking about you, and you going through so much effort for me. The way you fought for me, and for our stake in that Oxonium. How you didn’t even hesitate to show your strength, your guile, your</i> dominance <i>over them. It fucking turned me on. I’ll say it.”</i>");
	output("\n\n");
	if(pc.isNice()) output("You blush a bit and try to wave it off as in-the-moment praise. You’re not <i>always</i> like that. <i>“I know you’re not,”</i> Penny says, then leans into you and brings her mouth against your ear. <i>“But don’t be afraid to show</i> me <i>some of that aggression sometime....”</i>");
	else output("You grin and bask in Penny’s praise. You remember the time and the emotions and energies you were feeling, clear as day, back then. <i>“That’s right, my mate, it was your</i> moment. <i>Go ahead and feel like a</i> champion.<i>”</i> She leans into you, bringing her mouth against your ear. <i>“And no champion would be complete without their grand prize....”</i>");
	output("\n\nSuddenly, she pulls away and sits herself straight, her hands still in yours. <i>“No. No, I need to focus. This is important. I can’t start fantasizing now.”</i> " + (pc.isNice() ? "You, as always, sit and stay patient for her.":"You muse to yourself that you wouldn’t mind a <i>little</i> more fantasizing, but, like she said, this isn’t the time."));
	output("\n\n<i>“The whole event really got me thinking. About your offer, but, more importantly, about... us. I started to ask myself, ‘if I let that walk away from me, will I regret it forever?’ Could I live a life without you, and your... your...</i> youness<i>?”</i>");
	output("\n\nHer earlier energy dissolves quickly, though her determination remains as steadfast as ever. <i>“I love Mhen’ga. I love Esbeth, and I love everyone on it. I love my job and I love how far I’ve come. I love my jurisdiction and I love the feeling I get whenever I help someone, whether it’s solving a dispute or it’s fending off some horny local.”</i>");
	output("\n\n<i>“But then, I thought–”</i>");
	output("\n\nImmediately, her breath catches once again, and her words begin to stutter, forming in her mouth as solid blocks and then spilling from her lips like crumbs. Her lips quiver as she struggles her way through the next few words. <i>“I s-started to think...,”</i> she says, then sighs another quivering sigh. <i>“That maybe I... I started to love something... more than all of that. I started to think that, i-if I loved anything more than all of that, i-it would be....”</i>");
	output("\n\n<i>“You.”</i>");
	processTime(20);
	clearMenu();
	addButton(0,"Respond",respondToPennyLovemission,undefined,"Respond","It took a lot of courage for her to say that to you. The least you could do is show her the same courage in kind.");
	addButton(1,"Hug",hugDatPennyBitchLove,undefined,"Hug","Actions speak louder than words.");
}

public function respondToPennyLovemission():void
{
	clearOutput();
	showPenny();
	author("B");
	output("You tell her that, more than because you wanted her on your ship, you helped her with that Oxonium deposit because you were smitten with her, and you thought that it would be the best way to get closer to her. And, towards the end of the adventure, you slowly grew to realize how you felt. <i>“Penny,”</i> you say, <i>“I love you, too.”</i>");
	hugOrRespondToPennyEpi();
}

public function hugDatPennyBitchLove():void
{
	clearOutput();
	showPenny();
	author("B");
	output("You understand that it took a lot of courage for her to say that. You’re momentarily struck with indecision on how to reply; with your heart hammering into your throat as it is, you might struggle to say anything at all, much less something profound or as emotional as what she just said. Deciding that less is more, and that actions are louder, you opt to say nothing.");
	hugOrRespondToPennyEpi();
}

public function hugOrRespondToPennyEpi():void
{
	output("\n\nYou stand; gently, you pull on Penny’s hands, which are both still wrapped around yours, getting her to her feet, and you pull her into an embrace.");
	output("\n\nNeither of you say anything, but you can feel the passion pouring from Penny: her arms hook underneath yours and wrap around your back, holding you to her tightly. <i>Very</i> tightly, like you’d float away and leave her forever if she didn’t squeeze you so adamantly to her. She’s hugging you like she’s only just discovered what a hug feels like, and she isn’t sure when she’ll be ready for it to end.");
	output("\n\nMinutes pass in the quiet office. The only sound you hear, apart from your breathing, is hers; you keep her against you, letting her adrenaline wear through her arms and through her ragged breathing. Even when her breath begins to even out and the strength in her arms begins to wane, neither of you release just yet – you will when you’re good and ready.");
	output("\n\nAfter what must have been a quarter-hour, Penny takes a long, deep breath through her nose to calm herself down – and to take in your scent. <i>“Give me one day, [pc.name],”</i> she says, her voice muffled through her face being buried into you. <i>“If I could trust anyone in this universe with Esbeth, it would be Flahne. That’ll give me time to teach her how to work the sentries. And the U.G.C. will be sending down a new peacekeeper within the week; I can give Flahne the key to my locker, and she can give it to them.”</i>");
	output("\n\nYou think to ask her if she’s sure – it’s her home, and her job, and her weapons she’s giving up, and all – but you think better of it. She wouldn’t have asked you to wait a day if she wasn’t already as sure as she could be. Instead, you promise her that you’ll wait. It’s only a day, after all.");
	output("\n\nPenny laughs once, somewhat derisively, to herself. <i>“Okay,”</i> she says, <i>“the hardest thing I’ve done lately is make you wait this long, [pc.name]. My mate.”</i> Her grip on you is still tight in her embrace, but her hands rub soothingly at your [pc.skinFurScales]. <i>“The third-hardest thing was taking down that mining operation. And the second–”</i>");
	output("\n\nFinally, she pulls away from you, and she looks around her office. To its walls; to her desk; to her computer; and to the window overlooking Esbeth. <i>“Is... letting all this go. I love it all. I love my job.”</i> She doesn’t pull you back into a fifteen-minute, ironclad hug, but she does rest her head against your shoulder. <i>“But I’ve made my choice.”</i>");
	output("\n\nReluctantly, she lets you go, pulling away from you and heading towards the door. Her hands trail down your arms and hold you by the fingers until distance pulls them apart, too. <i>“Come find me this time tomorrow. I’ll be ready by then.”</i> She opens the door and steps outside, but not before giving you one last look and one earnest smile. <i>“I have to go make my rounds.”</i>");
	output("\n\nAnd, just like that, you’re left alone in her office.");
	output("\n\nYou decide to head back to your ship. Twenty-four hours isn’t enough time to go traipsing through the stars, and you wouldn’t want to risk venturing into the jungle when you and Penny made a promise to each other.");
	output("\n\nYou doubt you’ll be getting much sleep in the next twenty-four hours, though....");
	processTime(24);
	clearMenu();
	eventQueue.push(pickUpPenny);
	addButton(0,"Next",mainGameMenu);
}

public function pickUpPenny():void
{
	clearOutput();
	showBust(pennyBustDisplay(),flahneBustDisplay());
	showName("PENNY\n& FLAHNE");
	author("B");
	output("You follow Penny’s instruction to the word: exactly twenty-four hours later, you show yourself back into her station.");
	output("\n\n<i>“...and I think that about covers it,”</i> you hear Penny say as you show yourself into, what is officially, formerly her office. Standing behind her desk in the distance is the woman of the hour herself, and Flahne, the customs secretary for Esbeth; on top of the desk is a single travel suitcase, bloated with belongings.");
	output("\n\nPenny, for the first time since you’ve met her, is wearing what appears to be her civilian clothing: her top is a too-small T-shirt with sleeves that go halfway to her elbows and leaves her midriff bare. It’s white, but there’s a cutesy cartoon character pasted onto the front, with a phrase underneath it written in a language you don’t immediately understand. And, for her legs, she has a pair of cut-off jeans that end above her knees.");
	output("\n\nThey’re both busy looking at Penny’s monitor, but from your angle, you can’t see what’s on it. Both of the ladies look in your direction as you enter unannounced. <i>“Ah, speak of the devil and [pc.heShe] will appear,”</i> Flahne says, a comforting smile on her lips. ");
	if(flags["FLAHNE_SEXED"] == undefined) output("<i>“So,</i> this <i>is the scoundrel that’s taking you away from me, Penny?”</i>");
	else output("<i>“I can see how [pc.heShe]’s done such a wonderful job of charming you.”</i> Flahne winks.");
	output("\n\nPenny’s cheeks are lifted, and her lips are rosy red – even from where you’re standing, you can tell she isn’t wearing lipstick. She must have spent the last twenty-four hours smiling nonstop.");
	output("\n\n<i>“Yeah,”</i> Penny answers dreamily, her eyes positively sparkling when she sees you. With one hand on her keyboard, she beckons you forward with her other. <i>“Although, [pc.name] came here in a spaceship. Don’t devils come from underground? I thought it was angels that descended from the sky.”</i>");
	output("\n\n" + (pc.isNice() ? "You blush at such a corny, but no-less wonderful, compliment, and":"You smirk at the corny compliment, but, all the same,") + " you slip your left arm around the small of Penny’s back, hugging her to you with your hand on her hip. Unprompted, she turns to you and kisses your cheek – nothing more than a loving, cheery peck, but you can feel just how giddy she is with you at her side. You return the gesture.");
	output("\n\n<i>“Wow,”</i> Flahne says, leaning back and putting her gelatinous hand against her chin, <i>“all joking aside, it’s like you’re a completely different person, Penny. One day, you’re a professional officer looking after a little hamlet in the jungle, and the next, you’re acting like a lovestruck schoolgirl that doesn’t know left from right.”</i>");
	output("\n\nPenny laughs, but doesn’t deny a word; in fact, you feel her long, fluffy tail wrap gracefully around your own [pc.legOrLegs], snuggling her closer to you.");
	output("\n\n<i>“Flahne and I were just going over the last lessons of her looking after the sentries,”</i> Penny says to you, leaning her head against your shoulder. <i>“You got it all, right Flahne? It’s pretty simple, right?”</i>");
	output("\n\n<i>“Goodness gracious, Penny,</i> relax, <i>would you?”</i> she replies good-naturedly. <i>“For the past few hours, it’s been this-and-that about protocol, and routines, and sentries, and passwords – there are so few people in Esbeth and there’s so little crime that I promise you, my job handling customs is harder than yours.</i> Yes, <i>girl, I have it under control!”</i>");
	output("\n\nPenny giggles a surprisingly girlish laugh, for her. She really <i>is</i> acting like a different person today. <i>“Just in case–”</i>");
	output("\n\n<i>“</i>Yes, <i>I know your extranet address,”</i> Flahne interrupts, tapping her lips with a finger. <i>“Honestly, Penny. Go and explore the stars already!”</i>");
	output("\n\nAt that, Penny visibly hesitates. It takes her time and effort to reach her hand into her pocket, and you can hear the jingling of keys between her fingers as she pulls them out. Her smile hasn’t left, but her actions are slower and labored.");
	output("\n\n<i>“I, uh,”</i> she stutters. She brings her closed fist to her face, and she looks at her clenched fingers like she was delicately holding a child rather than some keys. <i>“I guess this is it, Flahne.”</i>");
	output("\n\n<i>“Penny,”</i> Flahne starts, taking a softer tone. She steps forward and places a delicate, understanding hand against Penny’s unoccupied bicep. <i>“If you think for one second that I’m</i> not <i>going to message you every day, asking you how your new adventure with your mate is going, well....”</i> She stops herself, a few words playing soundlessly on her lips. <i>“I was going to say something playfully demeaning, but, just, you’d be wrong. I am</i> absolutely <i>going to be living vicariously through you every day I get.”</i>");
	output("\n\nPenny chuckles, then wipes at her eye with her knuckle.");
	output("\n\n<i>“This is not ‘it,’ Penny,”</i> she continues. <i>“Even if we never see each other in person again, and even if we didn’t have the extranet, you’ll never leave my thoughts. This isn’t ‘goodbye;’ this is ‘farewell’ and ‘good luck.’”</i>");
	output("\n\nWith that said, Flahne extends her outstretched hand. Once more, Penny hesitates, but, with a sniffle, she puts her hand in Flahne’s and opens her fingers – the keys to the station, the last things keeping her tethered to Esbeth, jingle from her hand and into the Rahn’s.");
	output("\n\nFlahne pulls Penny in for a quick hug and a similar, but different, kiss on the cheek. <i>“Have fun, you two,”</i> Flahne says when she pulls away, her eyes flitting between yours and Penny’s. <i>“Don’t do anything or anyone I wouldn’t.”</i>");
	output("\n\n<i>“Hah,”</i> Penny laughs, reaching for the handle for her travel case, <i>“that doesn’t narrow it down very far, does it?”</i>");
	output("\n\nFlahne’s gooey hand slaps Penny on the butt as you both turn to leave the station. When the door clicks behind you, the lock sounds heavier than you remember.");
	processTime(60*24);
	clearMenu();
	addButton(0,"Next",theWalkBackToTheShip);
}

public function theWalkBackToTheShip():void
{
	clearOutput();
	showPenny();
	author("B");
	output("Penny hasn’t left your side the whole walk through Esbeth, or through Flahne’s checkpoint, or up into your ship; you walk side-by-side, your hand on her hip and her cheek against your shoulder, the entire time. Nor does she disengage when you take her through a tour of your ship.");
	output("\n\n");
	//Any crew (besides Celise, ideally):
	if((crew(true) > 0 && !celiseIsCrew()) || crew(true) > 1) output("Having gotten used to the motions, it’s a routine tour through the ship:");
	else output("Penny has the honor of being your inaugural crewmate, and with that, your tour is a little on the slow side, with you accidentally doubling-back at least once to cover something else. All the same, you hit all the important parts:");
	output(" you show her to the mess; to the cargo hold; to the fitness center; to the ship’s armory and battle stations; to the crew quarters and captain’s quarters; and to the bridge. It’s not a terribly long tour.");
	output("\n\nPenny doesn’t say much throughout. She has the occasional question, and she sometimes mutters to herself about certain units (specifically, the armory and the fitness center), but, taking after her training as an officer, she respectfully keeps her comments until the end.");
	output("\n\n<i>“So,”</i> she begins, once the tour has concluded with the crew quarters, <i>“I won’t be needing to sleep in the crew quarters, right?”</i> Her hand finds yours, still against her hip, and she grasps it gently and pushes herself into your body, nuzzling herself up against you.");
	output("\n\n");
	//Unupgraded ship:
	if(9999 == 0) output("Unfortunately, your ship isn’t exactly a cruise liner, and even if you two were to sleep together, your personal quarters are still a large enough living space for only one person. You’re dreadfully restricted in terms of storage space, and you’re always on the lookout for more.");
	else output("Unfortunately, while your more-modern ship can afford you some amenities, there’s still a such thing as ‘protocol’ and ‘decorum;’ if it got out that you fraternized and preferred one crewmate over the others, it would spread dissention. It’d be best to stay in separate quarters; and even still, while your personal quarters might be large enough to hold two people, it’ll still get cramped when you factor in personal effects as well.");
	output("\n\n<i>“Really?”</i> Penny asks, and hefts her singular travel case to emphasis her next point. <i>“Everything I own fits into a few bags. Are you really saying I can’t just bunk with you?”</i>");
	output("\n\nYou ask her how she could manage to fit her entire life into a handful of suitcases. What’s even in there?");
	output("\n\n<i>“Some more civvy clothes; my uniform, which I bought, so I didn’t have to hand it in; clothes, my tonfas, hygiene stuff, an old codex, a tamball, my anime, and a couple other odds and ends.”</i> She shrugs at that last part. <i>“You know me.”</i>");
	output("\n\nGetting back on topic, you tell her that she can’t set up in your quarters, unfortunately; even if she were to live out of her suitcase, it would just be too cramped for you both.");
	output("\n\nBut it’s not so bad: you tell her that she can set up in her own room, and, although only one person can live in your quarters, your bed can comfortably fit two, for all those times you’ll be ordering a ship-wide hot-bunk for the journey. And, how often will you two be looking for some time together during the work hours? You two are professionals, after all.");
	output("\n\n<i>“I suppose that makes sense,”</i> she says with a frown. She looks into the nearest door’s viewport. <i>“This one is empty. Do I call dibs, or...?”</i>");
	output("\n\nYou tell her that it’s all hers.");
	output("\n\n<i>“Great,”</i> she says, opening the door to her brand new quarters. <i>“Give me a few minutes to settle in, captain, and I’ll report for duty in a moment.”</i>");
	output("\n\nBefore she does, though, she, with a hefty swing, tosses her suitcase onto the open bed. With both her hands free, she steps toward you and wraps them around you, embracing you nearly as tightly as she did the day before.");
	output("\n\n<i>“I’m looking forward to seeing what trouble you and I can get into, my mate,”</i> she whispers, and closes her statement with a soft kiss against your [pc.lipsChaste]. <i>“The universe isn’t ready for us.”</i>");
	output("\n\nWith that, she disappears into her quarters, to settle herself in.");
	
	output("\n\n(<b>Penny Inoue has joined your crew!</b>)");
	penny.armor = new UGCCasualOutfit();
	flags["PENNY_CREW_ASKED"] = 4;
	flags["PENNY_ONBOARD"] = 1;
	clearMenu();
	moveTo("SHIP INTERIOR");
	generateMap();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//+15 hard
public function recruitCumslutPenny():void
{
	clearOutput();
	showPenny(true);
	author("Fenoxo");
	output("Smiling down at the dick-drunk, vulpine cumslut, you posit a question to her: Why jerk off in the junkheap when she could be relaxing on your ship, bathing in jism 100% of the time?");
	output("\n\nWrinkling her brow, Penny manages to pull away from the magnetic tug of her [penny.cockHead], but only for a moment. Like magic, her fingers are drawn back to perform a slow orbit about the heady, over-indulged organ. <i>“But... my debts and job and...”</i> She gulps, tongue flickering out to harvest a residual fleck of salty flavor from one inky lip. <i>“Uh friends. Flahne and everyone here count on me.”</i>");
	output("\n\nYou stroke one of your fox-slut’s enormous ears fondly. She whimpers needily, forming a big fat droplet at her apex. It wobbles, glinting in the light. Penny can’t seem to look away. You gently push her into her preferred position and explain, <i>“I could get you another job, Penny. There’s good credits to be made by being a slutty cumdump. Especially good credits when you’re so helplessly prickthirsty that you can’t keep your big, dumb dick out of your mouth.”</i> There’s no need to push any longer, not when she’s pounding her cock into her throat eight inches at a time. <i>“All you have to do is let everyone on the extranet watch.”</i>");
	output("\n\nHer eyes roll slowly back in her head as she starts to inexorably lose herself in the sensation of swallowing her [penny.cock].");
	output("\n\n<i>“In fact,”</i> you continue, moving around to stand beside her and whispering directly into her ear, <i>“you </i>want<i> people to see this, don’t you? You want people to see how you’re hooked on drinking your own cum, how you can’t stop putting your dick in your mouth and working it over again, and again, and again.”</i>");
	output("\n\nPenny’s movements are becoming jerky and erratic, her whole body shuddering as she approaches what is clearly an unstoppable orgasm. Seizing the moment, you grab her fiercely and hiss, <i>“You’re a cumslut, aren’t you? You’re addicted to the taste of your own cum, and don’t care if the whole universe watches you milk yourself.”</i>");
	output("\n\nShe manages to look up at you, her blushing face and the look of pleading desperation in her eyes conveying her hesitance, but even as she does her dick starts surging involuntarily, and soon burst after burst is splashing against the back of her throat, and all she can do is slurp it down greedily. Her resistance melts as she sinks into it, her eyes sliding closed and her blush fading as all her reservations are overcome by just how <i>good</i> this feels.");
	output("\n\nSeeing her adjusting, you shift to crouch directly in front of her, watching approvingly as she gulps down her seemingly never-ending load. <i>“Good girl,”</i> you say encouragingly. <i>“Don’t you enjoy putting on a good show like this?”</i>");
	output("\n\nEven muffled as she is, Penny manages to give out a slightly more concerted moan to attempt to express her approval.");
	output("\n\nYou grin in response. <i>“Of course you do. So much better than letting your silly little shyness get in the way of enjoying your wonderful cock you went </i>so<i> out of your way to get. But remember...”</i> Without warning you slide three fingers inside her dripping slit, the sudden shock of which causes her cock to bulge with a startlingly intense orgasm, almost forcing it out of her mouth with the sheer volume of cum she produces in that one instant. <i>“Everyone can watch, but only </i>I<i> get to enjoy you.”</i>");
	output("\n\nThat last emphatic orgasm seems to have wrung most of it out of her, and within moments Penny is left leaning exhausted back in her chair, while her [penny.cock] slides slowly out of her mouth to rest between her breasts. After spending a moment appraising the impressive amount of mess she left on your fingers you casually place them next to her mouth, and reflexively she leans forward and begins to eagerly lick them clean.");
	output("\n\n<i>“What a good girl,”</i> you coo. <i>“You know what you have to do. Turn in your resignation.”</i>");
	output("\n\nPenny looks up at you a daze, nodding slowly.");
	output("\n\n<i>“The U.G.C. will have a new peacekeeper out here in no time.”</i> You smile sadly. <i>“To them, you’re a replaceable cog in their machine.”</i> Grabbing her still-turgid dick, you stroke it slowly. <i>“To me, you’re special. Your my cumslut mate. My dick-drunk fox-toy, and I wouldn’t replace you for all the creds in the world.”</i> You lovingly milk leftover cum-drop into Penny’s fur, giving her exactly the kind of treatment she adores. <i>“Make sure to say goodbye to Flahne too. Wouldn’t want her to worry about you while you’re having the time of your life, would we?”</i>");
	output("\n\n<i>“Ooh yes, [pc.name]!”</i> Penny cries, pumping her hips, spurting out fresh jism so thick that it wobbles when it impacts her tits. <i>“As soon as you’re done using me, I’ll go buy a camera! I’ll get my things, and I’ll be waiting on your ship.”</i> Gasping with pleasure, she moans, <i>“I’m going to be your big-dicked, live-in camwhore! I’ll fuck you whenever you want and suck on command and make so many creds for us!”</i> The cum thins out the longer she shoots, so much so that the final strands upon her muzzle are near-transparent. <i>“Oh my god, I’m such a <b>whore</b> for you, mate!”</i>");
	output("\n\n<i>“You are,”</i> you agree, stepping away. <i>“But you’re my whore. You’re going to love this, Penny.”</i>");
	output("\n\nRubbing excess spunk across her lips, Penny moans, <i>“I already am.”</i>");
	output("\n\nPenny leaves her office not long after you.");
	
	output("\n\n(<b>Penny has joined your crew!</b>)");
	pc.addHard(15);
	flags["PENNY_ONBOARD"] = 1;
	flags["PENNY_CUMSLUT_RECRUITED"] = 1;
	flags["PENNY_LETTING_OTHERS_WATCH_CUMSLUTTERY"] = 3;
	flags["PENNY_HIDING_CUMSLUTTERY"] = undefined;
	flags["PENNY_BEING_A_PUBLIC_CUMSLUT"] = undefined;
	flags["PENNY_IS_A_CUMSLUT"] = 1;
	pc.lust(10);
	processTime(10);
	clearMenu();
	addButton(0,"Next",moveSouth);
}

//Cumslut Penny hello
public function cumslutPennyGreeting():void
{
	clearOutput();
	showPenny();
	author("Fenoxo");
	//Back on ship
	if(penny.isBimbo())
	{
		output("Penny is waiting for you the moment you step onto your ship. For once she isn’t defiled by a single droplet of cum - that’s been contained by orange-sized condom full of pre that dangles from her bell-end as she squirms in place. Her hips bear bigger, tied-off ‘snacks’ for later no doubt. Her fluffy tail waves happily at the sight of you. <i>“[pc.name]! It’s a good thing you told me to talk to Flahnie! I had no idea which ship was yours!”</i> She pouts and folds her arms across her expanded chest, causing dangerous levels of jiggle. <i>“They should really like, just have [pc.name] in big letters on the side. Naming them other stuff is like, wayyy dumb.”</i>");
		output("\n\nSmiling at the silly herm, you walk her up the boarding ramp, delighting in the way she squirms against you with every step. When your hand falls on her ass, her tail wraps around it. When the door closes behind her, she pushes you against the wall with the force of her kiss. The wobbling weight of her slowly-filling condom bounces against your [pc.leg].");
		output("\n\n<i>“[pc.name],”</i> Penny pants, <i>“I am so ready for this... but I really, really, really... really need to cum.”</i> She whines, brazenly grinding into you while she talks. <i>“I can’t stop thinking about having people watching me jerk off. Boys and girls and herms and weird aliens I can’t even imagine making their toes curl because of how <b>hot</b> I am now.”</i> Her tongue dives into your mouth for a moment, leaving you breathless when it finally retracts. <i>“And it’s all thanks to you.”</i>");
		output("\n\nYou escort the wobbling bimbo-fox the rest of the way to her quarters, casually groping her ass as you go. When the door to her bedroom opens, you spin her around and push her back onto her bed. Penny’s enhanced member rebounds off her tits, the condom slipping off from the impact to discharge onto her face. Her cock springs up, rock-hard and ready to go. Grabbing onto it with both hands, Penny sets right into stroking, sucking the condom’s end into her plump lips to harvest the creamy leftovers.");
		output("\n\nShe barely notices you setting up the cam software or tuning the wall display to show an image preview of her stream and the chatlog alongside it. Viewers find their way in almost immediately.");
		output("\n\n\t<i>“OMG lookat the tits on dis fox-bitch!”</i>");
		output("\n\t<i>“Balls like a kui-tan!”</i>");
		output("\n\t<i>“OwO *notices her bulge*”</i>");
		output("\n\n...You’ll leave her to settle in for now.");
		flags["PENNY_BIMBO_RECRUITED"] = 2;
	}
	else
	{
		output("Penny is waiting for you the moment you step onto your ship. For once, she isn’t defiled by a single droplet of cum. Her [penny.cockNounSimple], enormous as it is, only distends her clothing as much as its flaccid size requires. <i>“Mate! Sorry it took me so long. I had to cum </i>really<i> hard before I could think straight enough to get a camera and say all my goodbyes. Would you believe Flahne said she was </i>jealous<i>?”</i> The fennec flashes a giddy smile. <i>“I found an empty room to stash my stuff in, but I wanted to check with you before I got everything all, you know... cummy.”</i>");
		output("\n\nThe crotch of her shorts strains forward, then down. It very much looks like Penny has smuggled an anaconda into her trousers.");
		output("\n\nSmiling at your rampantly oversexual herm, you let her know that she can spend as much time ‘working’ in her room as she wants. Any time, any planet, day or night - she can be masturbating. She could be masturbating right now. You step closer, cupping at a pair of nuts so warm with the effort of brewing more cum that they’re hot to the touch. <i>“It feels like you’re ready to start your new life.”</i>");
		output("\n\nPenny nods vigorously. Her hips gently rock and grind against your cupped palm, seemingly of their own accord. <i>“Yes. I just wanted to... needed to talk to you like a normal girl for a minute.”</i> She grabs your shoulders for support and moans. <i>“Needed to tell you that I love you, mate.”</i> A slowly spreading damp patch appears at the tip of her oh-so-leaky dick. <i>“And that I’ll never be too busy sucking myself off to make time for you.”</i>");
		output("\n\nYou pull away and send her on her way with a smack of her ass. <i>“Better get going then. I’ll check up on you later.”</i>");
		output("\n\nPenny yips, <i>“Yes!”</i>");
		output("\n\n<b>Penny Inoue is now your camwhore crewmate!</b>");
		flags["PENNY_CUMSLUT_RECRUITED"] = 2;
	}
	processTime(5);
	pc.lust(10);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Recruit Bimbo Penny
//If Flahne is there: Penny seems a bit busy with Flahne. It would be better to discuss this between you and Penny.
public function recruitBimboPenpen():void
{
	clearOutput();
	showPenny(true);
	author("Fenoxo Fenfennec");
	output("You ask Penny what she thinks about ditching this lame desk job to fuck her way across the stars. She wouldn’t have to wait around here for your next visit, struggling to work a lame, dead-end job. You and her could fuck at any time, on any day, no matter what part of the galaxy you’re in.");
	output("\n\nAt first, the avalanche of words appears to bore Penny. She slumps further into her chair, idly tugging at one of her nipples until the sensuous import of what you’re saying finally manages to lodge itself into the fuck-saturated sludge Penny calls a brain. <i>“Hu-wha?”</i> She sits bolt upright in her chair, tail wagging excitedly. <i>“Sorry! You started talking about space and stuff, and I just like, couldn’t stop thinking about how <b>fuckable</b> the space between my tits is, and... well, you know?”</i> Penny arches her back to better present the pillowy, often cum-slick mounds she calls her breasts. Grabbing them in hand, she pulls them open to reveal the silk-furred inner expanse of her heaving bosom, offering a prime opportunity for motorboating.");
	output("\n\nYou’re too taken off guard to " + (!pc.isBimbo() ? "respond":"do anything but giggle approvingly") + ".");
	output("\n\n<i>“Yeah,”</i> the vixen slyly drawls, <i>“you know.”</i> She licks her lips, <i>“But you were saying something more compli... c-comp... uh... cum-placiated than " + (!pc.hasCock() ? "just fucking":"than a nice, long tit-fuck") + ". You were talking about taking me with you! And fucking!”</i> Her eyelids drift halfway down until the fox wears the sort of half-asleep bedroom gaze you’d expect to see after a long bedroom romp or intense sexual fantasy, <i>“And making it so I never have to go to bed without smelling your ");
	if(pc.hasCock()) output("cum");
	else if(pc.hasVagina()) output("pussy");
	else output("scent");
	output(" in the sheets. You’d always have the wettest, hottest fox-slut at your beck and call. I’d never say no. Never stop being horny. Never do anything but make you ");
	if(pc.hasCock()) output("hard and ");
	else if(pc.hasVagina()) output("wet and ");
	output("happy.”</i> Penny muffles herself by stuffing her dick deep into her maw, sucking hard enough to make her eyes roll back with the raw eroticism of it all.");
	output("\n\n" + (pc.libido() >= 80 ? "You run a hand through her mohawk comfortingly, enjoying every word of Penny’s obscene predictions.":"You gently stroke your fingers through Penny’s mohawk, ruffling the soft red hair between your fingertips.") + " <i>“So you’ll come with me?”</i> You pull the bimbo’s head back, slowly dragging her pulsating length out of her plump maw to give the hypersexual hermaphrodite an opportunity to answer. <i>“You’ll be my shipboard slut?”</i>");
	output("\n\nPenny gasps for breath, blinking dazedly. <i>“I uh... yeah. But... but... Flahne says I still have tons of debts to pay off! I wanna so bad, [pc.name]! I want you to use me on every square inch of your ship. I want you to slap me and spank me and use me till you can make me squirt just by giving my tail a yank.”</i> Thick bubbles of cum roll out of her dick - not quite an orgasm but a potent sign of her overclocked libido’s complete agreement. <i>“What do I do, [pc.name]? If I don’t pay it off, somebody’ll take me away from you, and I’ll have to be somebody else’s dick-addicted cum-slut! I don’t wanna! I wanna be your dumb, happy little spunk-slave!”</i> Her pout is heartbreaking, but not enough to stop Penny from cupping her heaving balls and groaning with pleasure.");
	output("\n\nMaybe there’s another way a girl like Penny could pay off her debts - camming on the internet isn’t usually the most lucrative career, but most cam-girls don’t have an inexhaustible libido and perpetually ready-to-blow balls. They don’t have out-of-this-world proportions and a mind almost completely filled with thoughts of raw, bareback fucking. You have no doubt that your bimbolicious little prick-vixen could easily match her old salary, maybe even surpass it if she caught the right exposure.");
	output("\n\nDo you suggest cam-whoring as an alternative or back off for now?");
	processTime(10);
	pc.lust(4);
	clearMenu();
	addButton(0,"Cam",camwhoreItUpBimboPenny,undefined,"Cam","Convince Penny to become a camwhore to pay for her debts.");
	addButton(1,"Never Mind",nevermindBimboCumPennyNoCamwhore,undefined,"Never Mind","Drop the topic for now. No need to push it.");
}

//[Nevermind]
public function nevermindBimboCumPennyNoCamwhore():void
{
	clearOutput();
	showPenny(true);
	author("Fenoxo OwO");
	output("<i>“You’re right. We’ll find another way, Penny. I promise.”</i>");
	output("\n\nPenny bobs her head agreeably, a euphoric smile returning her to face as a bright, brand-new idea occurs to her: <i>“You know, if we’re not doing anything else right now, there’s nothing stopping us from like, fucking!”</i>");
	output("\n\nThe girl has a point.");
	processTime(1);
	bimboPennySexMenu();
}

//[Cam]
public function camwhoreItUpBimboPenny():void
{
	clearOutput();
	showPenny(true);
	author("Fenoxo McFurTrash");
	output("<i>“You could be a camwhore,”</i> you explain.");
	output("\n\nPenny blinks, chewing on an obscenely inflated lip as she tries to think. <i>“Ummm, what?”</i>");
	output("\n\n<i>“A camwhore,”</i> you repeat. <i>“You know, a girl that masturbates for a camera, and horny guys and girls give her money to watch.”</i>");
	output("\n\nComprehension spreads across Penny’s furry face like the morning sun’s light. <i>“I can make money for masturbating?”</i> She grabs her cock in both hands, pumping happily. <i>“It’s the perfect job, [pc.misterMiss] big brain smarty-mate! All I have to do is be a dumb, giggly fuck-toy - your giggly fuck-toy - and do it on camera, and it’ll pay off my debt-stuff?”</i>");
	output("\n\nThere’s no need to go into the specifics with her. She wouldn’t care. For now, she has the gist of it. You nod.");
	output("\n\n<i>“That’s sooooo cool!”</i> Penny enthusiastically wrings a syrupy blob of pre out of her "+ (penny.hasCock(GLOBAL.TYPE_EQUINE) ? "blunt":"beastly") + " bimbo-dick. Lifting one hand up, she gently presses her palm against it, allowing the juicy cock-lube to wick into her fur, sponge-like, before putting her sopping mit to work. The fox-girl greases the whole of her shaft in one ecstatic stroke. When she hits her " + (penny.hasKnot(0) ? "knot":"sheath") + ", she lets her tongue fall out, drooling spittle, and leans back to look you in the eyes. <i>“And so fucking hot! All those eyes on me, watching me... Oh, mate! It’s so fucking hot!”</i>");
	output("\n\n<i>“So you’ll do it? You’ll join my crew and jerk off on camera?”</i> You caress the outer rim of one of Penny’s enormous ears, knowing just how wild it’ll drive her. <i>“You’ll be an eager, flirty vixen for your audience?”</i>");
	output("\n\nPenny nods so vigorously that her puffed-up lips bump against her " + (penny.hasCock(GLOBAL.TYPE_EQUINE) ? "trembling flare":"lust-fattened tip") + ", slobbering spit and pre everywhere. She mouths a hasty, <i>“Yes!”</i> before plunging herself down to plug the leak with her pink, sloppily licking tongue. Her muzzle slides opened to swallow, then closes. Ink-black lips vacuum-seal around the turgid, drooling rod in a display of succubus-like thirst. Her palm, still slicker than ausar-cunt in heat, pumps up and down along the her prized, meaty length, squeezing bulb-shaped distinctions of fluid up her urethra to burst in mouth like ambrosial bombs.");
	output("\n\n<i>“You’ll be my onboard cum-slut? My own personal jizz-fountain?”</i> You tweak the tip of her ear, prompting Penny’s eyes to roll back. Both her aural appendages twitch before going limp. The one in your hand curls over your fingers. The other flops back flat against the fox-woman’s skull in pure, sensuous submission. <i>“You’ll be my fuzzy little spunk-mop?”</i>" + (pc.hasCock() ? " You can’t help but unsheath [pc.oneCock] and flop it onto Penny’s forehead. <i>“I have so much cum, and so few tongues to lick me clean after I climax...”</i> She shivers when she feels you stroke and moans into her own insatiable rod the moment your first droplet of pre baptizes her crown.":""));
	output("\n\nYou watch Penny cum. The signs are subtle: thicker bulges racing through her flexing, straining beast-dick, audible gurgles in the back of her throat, and sudden reappearance of her pupils, crossed brainlessly" + (pc.hasCock() ? " for a glimpse of your [pc.cock]":"") + ". Twin jets of excess seed rocket from the creased corners of the cop-turned-cumslut’s vulpine muzzle, lancing out in straight lines that wane into drooping, splattering arcs only to rhythmically surge back to full intensity a heartbeat later.");
	//Cock
	if(pc.hasCock()) 
	{
		output("\n\nIt’s fucking hot watching Penny’s mind shut down from raw pleasure, the last few lights of her consciousness washed out by sunbursts of obscene animal need. You grab her slippery palm and reposition it to hold your [pc.cock], and she strokes it automatically and unthinkingly. Jerking and sucking come as easily to her as eating or breathing. Her slick-furred paw caresses you all through her seemingly endless orgasm, hitting all your most sensitive spots in sequence until you can’t help but join her in erupting, in shooting sticky webs of [pc.cumNoun] over her hair");
		var cumQ:Number = pc.cumQ();
		if(cumQ >= 50) output(", face");
		if(cumQ >= 250) output(", shoulders");
		if(cumQ >= 2000) output(", tits");
		output(" and ears. Your [pc.cock] claims Penny in that moment by right of the mask of [pc.cumColor] she now wears.");
	}
	//Merge
	output("\n\nLetting go of her own still-jizzing prick, Penny audibly gurgles as the " + (penny.hasCock(GLOBAL.TYPE_EQUINE) ? "absurdly flared, equine tip strains her bimbo lips into a blow-up doll ‘O’ on its way out.":"narrow tip slips out of her cock-sucking lips and graces them with a layer of animalistic jism for their trouble.") + " She gulps heavily, absently wiping a trickle of pearlescent goo from one nostril. She’s not even looking at you" + (pc.hasCock() ? ", not even when you dribble the last of your own contribution onto the center of her muzzle":"") + ". The slut-fox’s eyes are far away, mostly vacant as returns to idly stroking herself, squeegeeing off waves of gooey excess.");
	output("\n\nHead to toe, Penny is an absolute mess of spit and cum.");
	output("\n\nYou " + (pc.hasCock() ? "wipe your [pc.cockNoun] off on the underside of the vixen’s chin and ":"") + "stroke " + (!pc.hasCock() ? "the vixen’s":"her") + " ear one last time. <i>“Let Flahne know where you’re going... after you clean up, okay, pet?”</i>");
	output("\n\nThat, at last, rouses the fennec from her spooge-drunk stupor. <i>“Uhh... like yeah!”</i> She licks her chops and giggles in delight. <i>“I’m gonna get to be your cummy whore! Or uh, camwhore! Yay! Soooo, uh... what do I do again?”</i> She leans down to ease the tip of her dick into her mouth once more, lazily tonguing in wide circles around the [penny.cockHead]. She can barely talk around it. <i>“After this load.”</i>");
	output("\n\nYou gently explain to her that she should say goodbye to Flahne, and let her know she’s leaving to be your personal camwhore. The town will get a new cop, and Penny will get to make the entire universe orgasm along with her.");
	output("\n\nThat does the trick. The fox’s eyes light up as she sinks a few more inches down, slurping ecstatically.");
	output("\n\n<b>Penny’s going to be your personal cum-dump crew-mate (and camwhore)!</b>");
	
	output("\n\n(<b>Penny has joined your crew!</b>)");
	//move PC south. Orgasm if has dick. +15 lust if not.
	pc.addHard(5);
	flags["PENNY_ONBOARD"] = 1;
	flags["PENNY_BIMBO_RECRUITED"] = 1;
	pc.lust(10);
	processTime(10);
	clearMenu();
	addButton(0,"Next",moveSouth);
}
